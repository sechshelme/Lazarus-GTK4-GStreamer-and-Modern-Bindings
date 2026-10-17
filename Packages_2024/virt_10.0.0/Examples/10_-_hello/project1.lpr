program project1;

uses
  fp_virt;

(*
virt-viewer -c qemu:///session RetroPC

qemu-system-x86_64 -enable-kvm -m 2G -smp 2 -cpu host -cdrom noble-mini-iso-amd64.iso
*)


type
  Tpid_t = uint32;

  function c_fork: Tpid_t; cdecl; external libc name 'fork';
  function c_execvp(f: pchar; argv: PPchar): longint; cdecl; external libc name 'execvp';
  procedure c_exit(__status: longint); cdecl; external libc name 'exit';

const
  RetroPC = 'RetroPC';

  procedure list(conn: TvirConnectPtr);
  var
    num_running: longint;
    running_domains: PvirDomainPtr = nil;
    i: integer;
  begin
    num_running := virConnectListAllDomains(conn, @running_domains, VIR_CONNECT_LIST_DOMAINS_ACTIVE);
    WriteLn('Laufende Maschinen', num_running);
    for i := 0 to num_running - 1 do begin
      WriteLn(' -> [LÄUFT] Name: ', virDomainGetName(running_domains[i]));
      virDomainFree(running_domains[i]);
    end;
    c_free(running_domains);
  end;

  procedure main;
  var
    conn: TvirConnectPtr;
    alte_vm, mein_retro_pc: TvirDomainPtr;
    pid: Tpid_t;
  const
    vm_xml =
      '<domain type=''qemu''>'#10 +
      '  <name>' + RetroPC + '</name>'#10 +
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
      '    <disk type=''file'' device=''cdrom''>'#10 +
      '      <driver name=''qemu'' type=''raw''/>'#10 +
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

    v_args: array of pchar = ('virt-viewer', '-c', 'qemu:///session', 'RetroPC', nil);

  begin
    conn := virConnectOpen('qemu:///session');
    if conn = nil then begin
      WriteLn('Fehler beim Verbinden');
      Exit;
    end;
    list(conn);

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

    WriteLn('Registriere VM neu...');
    mein_retro_pc := virDomainDefineXML(conn, pchar(vm_xml));
    if mein_retro_pc = nil then begin
      WriteLn('Fehler: VM konnte nicht definiert werden.');
      virConnectClose(conn);
      Exit;
    end;

    WriteLn('Starte VM...');
    if virDomainCreate(mein_retro_pc) = 0 then begin
      WriteLn('Erfolg: ''' + RetroPC + ''' läuft frisch im Hintergrund!'#10);
      WriteLn('Öffne virt-viewer...');
      pid := c_fork;
      if pid = 0 then begin
        c_execvp('virt-viewer', PPChar(v_args));
        c_exit(1);
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
