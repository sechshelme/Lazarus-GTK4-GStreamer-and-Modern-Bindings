program project1;

uses
  fp_glib2,
  fp_virt_glib;

(*

sudo ss -tulpn | grep :5

*)

const
  RetroPC = 'RetroPC';
    iso = '/n4800/ISO/linuxmint-22.3-cinnamon-64bit.iso';
  //  iso=     '/n4800/ISO/ubuntu-26.04.1-desktop-amd64.iso';
  //iso = '/n4800/ISO/ubuntu-26.04.1-live-server-amd64.iso';


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
    gvir_config_domain_disk_set_source(disk_cfg, iso);
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
    conn: PGVirConnection;
    old_vm, mein_retro_pc: PGVirDomain;
    dom_cfg: PGVirConfigDomain;
    err: PGError = nil;
    info: PGVirDomainInfo;
    eingabe: string = '';
  begin
    conn := gvir_connection_new('qemu:///session');
    if not gvir_connection_open(conn, nil, @err) then begin
      if err <> nil then begin
        g_print('Fehler beim Verbinden: %s'#10, err^.message);
      end else begin
        g_print('Fehler beim Verbinden.'#10);
      end;
      g_clear_error(@err);
      g_object_unref(conn);
      Exit;
    end;

    g_print('Synchronisiere VM-Cache...'#10);
    if not gvir_connection_fetch_domains(conn, nil, @err) then begin
      if err <> nil then begin
        g_print('Warnung beim Cache-Laden: %s'#10, err^.message);
        g_clear_error(@err);
      end;
    end;

    old_vm := gvir_connection_find_domain_by_name(conn, RetroPC);
    if old_vm <> nil then begin
      info := gvir_domain_get_info(old_vm, @err);

      if (info <> nil) and (info^.state = GVIR_DOMAIN_STATE_RUNNING) then begin
        repeat
          Write('Die VM läuft bereits. Abwürgen und neu starten? (j/n): ');
          ReadLn(eingabe);
          eingabe := LowerCase(eingabe);
        until (eingabe = 'j') or (eingabe = 'n');

        if (eingabe = 'n') or (eingabe = 'nein') then begin
          g_print('Bestehende VM wird beibehalten. Öffne virt-viewer...'#10);
          if not g_spawn_command_line_async('virt-viewer -c qemu:///session RetroPC', nil) then begin
            g_print('Fehler: virt-viewer konnte nicht gestartet werden.'#10);
          end;

          g_free(info);
          g_object_unref(old_vm);
          g_object_unref(conn);
          Exit;
        end;

        g_print('Stoppe laufende VM (stop)...'#10);
        gvir_domain_stop(old_vm, 0, nil);
      end;

      if info <> nil then begin g_free(info); end;
      if err <> nil then begin g_clear_error(@err); end;

      // Löscht die alte VM nur, wenn "ja" gewählt wurde ODER wenn sie eh aus war
      g_print('Lösche alte VM-Registrierung inklusive Speicherständen...'#10);
      if not gvir_domain_delete(old_vm, GVIR_DOMAIN_DELETE_SAVED_STATE, @err) then begin
        if err <> nil then begin
          g_print('Löschfehler: %s'#10, err^.message);
          g_clear_error(@err);
        end;
      end;

      g_object_unref(old_vm);
      g_print('Bereinigung abgeschlossen.'#10#10);
    end;

    // =================

    g_print('Erstelle VM-Konfiguration programmatisch...'#10);
    dom_cfg := create_vm_config;

    g_print('Registriere VM neu...'#10);
    mein_retro_pc := gvir_connection_create_domain(conn, dom_cfg, @err);
    g_object_unref(dom_cfg);

    if mein_retro_pc = nil then begin
      if err <> nil then begin
        g_print('Fehler: VM konnte nicht definiert werden. Grund: %s'#10, err^.message);
      end else begin
        g_print('Fehler: VM konnte nicht definiert werden.'#10);
      end;
      g_clear_error(@err);
      g_object_unref(conn);
      Exit;
    end;

    g_print('Starte VM...'#10);
    if gvir_domain_start(mein_retro_pc, 0, @err) then begin
      g_print('Erfolg: ''%s'' läuft frisch im Hintergrund!'#10#10, RetroPC);
      g_print('Öffne virt-viewer...'#10);

//      if not g_spawn_command_line_async('virt-viewer -c qemu:///session RetroPC', nil) then begin
//        g_print('Fehler: virt-viewer konnte nicht gestartet werden.'#10);
//      end;
      if not g_spawn_command_line_async('remote-viewer vnc://127.0.0.1:5900', nil) then begin
        g_print('Fehler: remote-viewer konnte nicht gestartet werden.'#10);
      end;


    end else begin
      if err <> nil then begin
        g_print('Fehler beim Starten der VM: %s'#10, err^.message);
      end else begin
        g_print('Fehler beim Starten der VM.'#10);
      end;
      g_clear_error(@err);
    end;

    g_object_unref(mein_retro_pc);
    g_object_unref(conn);
  end;

begin
  main;
end.
