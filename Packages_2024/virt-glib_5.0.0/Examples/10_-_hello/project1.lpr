program project1;

uses
  fp_glib2,
  fp_virt,
  fp_virt_glib;

const
  RetroPC = 'RetroPC';

  function create_vm_config: PGVirConfigDomain;
  var
    dom_cfg: PGVirConfigDomain;
    os_cfg: PGVirConfigDomainOs;
    disk_cfg: PGVirConfigDomainDisk;
    iface_cfg: PGVirConfigDomainInterfaceUser;
    graphics_cfg: PGVirConfigDomainGraphicsVnc;
    input_cfg: PGVirConfigDomainInput;
    boot_devices: PGList = nil;
  begin
    dom_cfg := gvir_config_domain_new;
    gvir_config_domain_set_name(dom_cfg, RetroPC);
    gvir_config_domain_set_virt_type(dom_cfg, GVIR_CONFIG_DOMAIN_VIRT_QEMU);
    gvir_config_domain_set_memory(dom_cfg, 8388608);
    gvir_config_domain_set_vcpus(dom_cfg, 8);

    os_cfg := gvir_config_domain_os_new;
    gvir_config_domain_os_set_os_type(os_cfg, GVIR_CONFIG_DOMAIN_OS_TYPE_HVM);
    gvir_config_domain_os_set_arch(os_cfg, 'x86_64');
    gvir_config_domain_os_set_machine(os_cfg, 'q35');

    boot_devices := g_list_append(boot_devices, Tgpointer(GVIR_CONFIG_DOMAIN_OS_BOOT_DEVICE_HD));
    boot_devices := g_list_append(boot_devices, Tgpointer(GVIR_CONFIG_DOMAIN_OS_BOOT_DEVICE_CDROM));
    gvir_config_domain_os_set_boot_devices(os_cfg, boot_devices);
    g_list_free(boot_devices);

    gvir_config_domain_set_os(dom_cfg, os_cfg);
    g_object_unref(os_cfg);

    input_cfg := gvir_config_domain_input_new;
    gvir_config_domain_input_set_device_type(input_cfg, GVIR_CONFIG_DOMAIN_INPUT_DEVICE_TABLET);
    gvir_config_domain_input_set_bus(input_cfg, GVIR_CONFIG_DOMAIN_INPUT_BUS_USB);
    gvir_config_domain_add_device(dom_cfg, GVIR_CONFIG_DOMAIN_DEVICE(input_cfg));
    g_object_unref(input_cfg);

    disk_cfg := gvir_config_domain_disk_new;
    gvir_config_domain_disk_set_source(disk_cfg, '/n4800/ISO/linuxmint-22-cinnamon-64bit.iso');
    gvir_config_domain_disk_set_target_dev(disk_cfg, 'sdb');
    gvir_config_domain_add_device(dom_cfg, GVIR_CONFIG_DOMAIN_DEVICE(disk_cfg));
    g_object_unref(disk_cfg);


    iface_cfg := gvir_config_domain_interface_user_new;
    gvir_config_domain_interface_set_model(GVIR_CONFIG_DOMAIN_INTERFACE(iface_cfg), 'virtio');
    gvir_config_domain_add_device(dom_cfg, GVIR_CONFIG_DOMAIN_DEVICE(iface_cfg));
    g_object_unref(iface_cfg);

    graphics_cfg := gvir_config_domain_graphics_vnc_new;
    gvir_config_domain_add_device(dom_cfg, GVIR_CONFIG_DOMAIN_DEVICE(graphics_cfg));
    g_object_unref(graphics_cfg);

    Result := dom_cfg;
  end;

  procedure main;
  var
    conn: TvirConnectPtr;
    alte_vm, mein_retro_pc: TvirDomainPtr;
    dom_cfg: PGVirConfigDomain;
    generated_xml: Pgchar;
  begin
    conn := virConnectOpen('qemu:///session');
    if conn = nil then begin
      WriteLn('Fehler beim Verbinden');
      Exit;
    end;

    alte_vm := virDomainLookupByName(conn, RetroPC);
    if alte_vm <> nil then begin
      WriteLn('Alte Instanz gefunden. Bereinige...');
      if virDomainIsActive(alte_vm) = 1 then begin
        WriteLn('Stoppe laufende VM (destroy)...');
        virDomainDestroy(alte_vm);
      end;
      WriteLn('Lösche VM-Registrierung (undefine)...');
      virDomainUndefineFlags(alte_vm, VIR_DOMAIN_UNDEFINE_MANAGED_SAVE or VIR_DOMAIN_UNDEFINE_NVRAM);
      virDomainFree(alte_vm);
      WriteLn('Bereinigung abgeschlossen.'#10);
    end;

    WriteLn('Erstelle VM-Konfiguration programmatisch...');
    dom_cfg := create_vm_config;

    generated_xml := gvir_config_object_to_xml(GVIR_CONFIG_OBJECT(dom_cfg));
    g_object_unref(dom_cfg);

    WriteLn('Registriere VM neu...');
    mein_retro_pc := virDomainDefineXML(conn, generated_xml);
    g_free(generated_xml);

    if mein_retro_pc = nil then begin
      WriteLn('Fehler: VM konnte nicht definiert werden.');
      virConnectClose(conn);
      Exit;
    end;

    WriteLn('Starte VM...');
    if virDomainCreate(mein_retro_pc) = 0 then begin
      WriteLn('Erfolg: ''' + RetroPC + ''' läuft frisch im Hintergrund!'#10);
      WriteLn('Öffne virt-viewer...');

      if not g_spawn_command_line_async('virt-viewer -c qemu:///session RetroPC', nil) then begin
        WriteLn('Fehler: virt-viewer konnte nicht gestartet werden.');
      end;

    end else begin
      WriteLn('Fehler beim Starten der VM.');
    end;

    virDomainFree(mein_retro_pc);
    virConnectClose(conn);
  end;

begin
  main;
end.

