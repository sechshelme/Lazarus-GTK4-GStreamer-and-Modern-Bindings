program project1;

uses
  SysUtils, BaseUnix,

  libvirt_common,
  libvirt_admin,
  libvirt_host,
  libvirt_domain,
  libvirt_domain_checkpoint,
  libvirt_domain_snapshot,
  libvirt_event,
  libvirt_interface,
  libvirt_lxc,
  libvirt_network,
  libvirt_nodedev,
  libvirt_nwfilter,
  libvirt_qemu,
  libvirt_secret,

  libvirt_storage,
  libvirt_stream,

  virterror,

  fp_virt;

(*
virt-viewer -c qemu:///session RetroPC
*)

  // qemu-system-x86_64 -enable-kvm -m 2G -smp 2 -cpu host -cdrom noble-mini-iso-amd64.iso


  //
  //void list(virConnectPtr conn) {
  //virDomainPtr *running_domains = NULL;
  //// Filter greift nur auf aktive ("online") Domains zu
  //int num_running = virConnectListAllDomains(conn, &running_domains, VIR_CONNECT_LIST_DOMAINS_ACTIVE);
  //
  //if (num_running >= 0) {
  //    printf("Es laufen aktuell %d virtuelle Maschine(n):\n", num_running);
  //    for (int i = 0; i < num_running; i++) {
  //        printf(" -> [LÄUFT] Name: %s\n", virDomainGetName(running_domains[i]));
  //        virDomainFree(running_domains[i]); // Speicher für jede VM freigeben
  //    }
  //    free(running_domains); // Puffer-Array freigeben
  //} else {
  //    fprintf(stderr, "Fehler beim Abfragen der laufenden VMs.\n");
  //}
  //    printf("=============================================\n\n");
  //}


  procedure main;
  var
    conn: TvirConnectPtr;
    alte_vm, mein_retro_pc: TvirDomainPtr;
    pool: TvirStoragePoolPtr;
    vol: TvirStorageVolPtr;
    vol_path: pchar;
    pid: TPid;

    args:array[0..4]of PChar;
  const
    pool_xml =
      '<pool type=''dir''>'#10 +
      '  <name>default</name>'#10 +
      '  <target>'#10 +
      '    <path>/home/tux/.local/share/libvirt/images</path>'#10 +
      '  </target>'#10 +
      '</pool>';

    vol_xml =
      '<volume>'#10 +
      '  <name>RetroPC.qcow2</name>'#10 +
      '  <capacity unit=''G''>10</capacity>'#10 +
      '  <target>'#10 +
      '    <format type=''qcow2''/>'#10 +
      '  </target>'#10 +
      '</volume>';

    vm_xml =
      '<domain type=''qemu''>'#10 +
      '  <name>RetroPC</name>'#10 +
      '  <memory unit=''KiB''>8388608</memory>'#10 +
      '  <vcpu placement=''static''>8</vcpu>'#10 +
      '  <os>'#10 +
      '    <type arch=''x86_64'' machine=''q35''>hvm</type>'#10 +
      '    <boot dev=''hd''/>'#10 +
      '    <boot dev=''cdrom''/>'#10 +
      '  </os>'#10 +
      '  <devices>'#10 +
      '    <input type=''tablet'' bus=''usb''/>'#10 +
      '    <emulator>/usr/bin/qemu-system-x86_64</emulator>'#10 +
      '    <disk type=''file'' device=''disk''>'#10 +
      '      <driver name=''qemu'' type=''qcow2''/>'#10 +
      '      <source file=''%s''/>'#10 +
      '      <target dev=''sda'' bus=''sata''/>'#10 +
      '    </disk>'#10 +
      '    <disk type=''file'' device=''cdrom''>'#10 +
      '      <driver name=''qemu'' type=''raw''/>'#10 +
      '      <source file=''/home/tux/Schreibtisch/libvirt/noble-mini-iso-amd64.iso''/>'#10 +
      '      <target dev=''sdb'' bus=''sata''/>'#10 +
      '      <readonly/>'#10 +
      '    </disk>'#10 +
      '    <interface type=''user''>'#10 +
      '      <model type=''virtio''/>'#10 +
      '    </interface>'#10 +
      '    <graphics type=''vnc'' port=''-1'' autoport=''yes'' listen=''127.0.0.1''/>'#10 +
      '  </devices>'#10 +
      '</domain>';



  begin

    // 1. Verbindung zur User-Session herstellen
    conn := virConnectOpen('qemu:///session');
    if conn = nil then begin
      WriteLn('Fehler beim Verbinden mit qemu:///session\n');
      Exit;
    end;
    WriteLn('Erfolgreich mit QEMU (Session) verbunden!'#10);


    //list(conn);

    // ==========================================
    // ERZWUNGENE BEREINIGUNG BEI JEDEM START
    // ==========================================
    alte_vm := virDomainLookupByName(conn, 'RetroPC');
    if alte_vm <> nil then begin
      WriteLn('Alte Instanz von ''RetroPC'' gefunden. Bereinige...');

      // Falls sie läuft: Stoppen
      if virDomainIsActive(alte_vm) = 1 then begin
        WriteLn(' -> Stoppe laufende VM (destroy)...');
        virDomainDestroy(alte_vm);
      end;

      // Aus libvirt austragen / löschen
      WriteLn(' -> Lösche VM-Registrierung (undefine)...');

            if virDomainUndefineFlags(alte_vm, VIR_DOMAIN_UNDEFINE_MANAGED_SAVE or VIR_DOMAIN_UNDEFINE_NVRAM) <> 0 then begin
                WriteLn(' -> Warnung/Fehler beim Löschen der VM-Registrierung.');
            end else
                WriteLn(' -> VM erfolgreich ausgetragen.');

      virDomainFree(alte_vm);
      WriteLn('Bereinigung abgeschlossen.'#10);
    end else begin
      WriteLn('Keine alte Instanz von ''RetroPC'' vorhanden. Erstelle komplett neu...');
    end;
    // ==========================================

    // 2. Speicherpool "default" prüfen/erstellen
    pool := virStoragePoolLookupByName(conn, 'default');
    if pool = nil then begin
      WriteLn('Pool ''default'' nicht gefunden. Erstelle User-Pool...');

      pool := virStoragePoolDefineXML(conn, pool_xml, 0);
      if pool <> nil then begin
        virStoragePoolBuild(pool, VIR_STORAGE_POOL_BUILD_NEW);
        virStoragePoolSetAutostart(pool, 1);
        virStoragePoolCreate(pool, 0);
      end else begin
        WriteLn('Fehler beim Erstellen des User-Speicherpools.');
        virConnectClose(conn);
        Exit;;
      end;
    end;

    vol := virStorageVolLookupByName(pool, 'RetroPC.qcow2');
    if vol = nil then begin
      WriteLn('Festplatten-Image ''RetroPC.qcow2'' nicht gefunden. Erstelle 10GB HDD...');

      vol := virStorageVolCreateXML(pool, vol_xml, 0);
      if vol = nil then begin
        WriteLn('Fehler beim Erstellen der virtuellen Festplatte.');
        virStoragePoolFree(pool);
        virConnectClose(conn);
        Exit;
      end;
      WriteLn('Erfolg: Virtuelle Festplatte wurde erstellt!'#10);
    end else begin
      WriteLn('Virtuelle Festplatte ''RetroPC.qcow2'' existiert bereits.'#10);
    end;

    vol_path := virStorageVolGetPath(vol);
    virStoragePoolFree(pool);

    // 4. XML-Definition für die VM (Hier war der Fehler: Jetzt ein grosses Array!)


    // 5. VM frisch registrieren
    WriteLn('Registriere VM ''RetroPC'' neu...');
  //    mein_retro_pc := virDomainDefineXML(conn, vm_xml);
    mein_retro_pc := virDomainDefineXML(conn, pchar(Format(vm_xml, [vol_path])));
    //  free(vol_path);

    if mein_retro_pc = nil then begin
      WriteLn('Fehler: VM konnte nicht definiert werden.');
      virStorageVolFree(vol);
      virConnectClose(conn);
      Exit;
    end;
    virStorageVolFree(vol);

    // 6. Die VM frisch starten
    WriteLn('Starte ''RetroPC''...');
    if virDomainCreate(mein_retro_pc) = 0 then begin
        WriteLn('Erfolg: ''RetroPC'' läuft frisch im Hintergrund!'#10);

        // 7. Sauberes Öffnen des Viewers ohne "system()"
        WriteLn('Öffne virt-viewer...');

        pid := FpFork();
        if pid = 0 then begin
            // Argumente-Array für den C-Aufruf vorbereiten
            args[0] := 'virt-viewer';
            args[1] := '-c';
            args[2] := 'qemu:///session';
            args[3] := 'RetroPC';
            args[4] := nil; // Das Array MUSS mit nil enden!

            FpExecv('/usr/bin/virt-viewer', args);
            FpExit(1);
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
