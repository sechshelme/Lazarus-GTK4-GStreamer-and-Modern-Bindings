program project1;

uses
  BaseUnix,
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
  pid: TPid;
  args: array[0..4] of PChar;
const
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

    //'    <disk type=''file'' device=''disk''>'#10 +
    //'      <driver name=''qemu'' type=''qcow2''/>'#10 +
    //'      <source file=''/n4800/ISO/RetroPC.qcow2''/>'#10 +
    //'      <target dev=''sda'' bus=''sata''/>'#10 +
    //'    </disk>'#10 +

    '    <disk type=''file'' device=''cdrom''>'#10 +
    '      <driver name=''qemu'' type=''raw''/>'#10 +
//    '      <source file=''/n4800/ISO/noble-mini-iso-amd64.iso''/>'#10 +
    '      <source file=''/n4800/ISO/linuxmint-22-cinnamon-64bit.iso''/>'#10 +
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
    WriteLn('Fehler beim Verbinden mit qemu:///session');
    Exit;
  end;
  WriteLn('Erfolgreich mit QEMU (Session) verbunden!'#10);

  // ==========================================
  // ERZWUNGENE BEREINIGUNG BEI JEDEM START
  // ==========================================
  alte_vm := virDomainLookupByName(conn, 'RetroPC');
  if alte_vm <> nil then begin
    WriteLn('Alte Instanz von ''RetroPC'' gefunden. Bereinige...');
    if virDomainIsActive(alte_vm) = 1 then begin
      WriteLn(' -> Stoppe laufende VM (destroy)...');
      virDomainDestroy(alte_vm);
    end;
    WriteLn(' -> Lösche VM-Registrierung (undefine)...');
    virDomainUndefineFlags(alte_vm, VIR_DOMAIN_UNDEFINE_MANAGED_SAVE or VIR_DOMAIN_UNDEFINE_NVRAM);
    virDomainFree(alte_vm);
    WriteLn('Bereinigung abgeschlossen.'#10);
  end;

  // ==========================================
  // HIER FIEL DER GESAMTE POOL-CODE WEG!
  // ==========================================

  // 2. VM direkt registrieren
  WriteLn('Registriere VM ''RetroPC'' neu...');
  mein_retro_pc := virDomainDefineXML(conn, PChar(vm_xml));

  if mein_retro_pc = nil then begin
    WriteLn('Fehler: VM konnte nicht definiert werden.');
    virConnectClose(conn);
    Exit;
  end;

  // 3. Die VM starten
  WriteLn('Starte ''RetroPC''...');
  if virDomainCreate(mein_retro_pc) = 0 then begin
      WriteLn('Erfolg: ''RetroPC'' läuft frisch im Hintergrund!'#10);

      // 4. Sauberes Öffnen des Viewers
      WriteLn('Öffne virt-viewer...');
      pid := FpFork();
      if pid = 0 then begin
          args[0] := 'virt-viewer';
          args[1] := '-c';
          args[2] := 'qemu:///session';
          args[3] := 'RetroPC';
          args[4] := nil;
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
