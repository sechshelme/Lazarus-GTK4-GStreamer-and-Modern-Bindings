program project1;

uses
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
virterror, fp_virt;

// qemu-system-x86_64 -enable-kvm -m 2G -smp 2 -cpu host -cdrom noble-mini-iso-amd64.iso



void list(virConnectPtr conn) {
virDomainPtr *running_domains = NULL;
// Filter greift nur auf aktive ("online") Domains zu
int num_running = virConnectListAllDomains(conn, &running_domains, VIR_CONNECT_LIST_DOMAINS_ACTIVE);

if (num_running >= 0) {
    printf("Es laufen aktuell %d virtuelle Maschine(n):\n", num_running);
    for (int i = 0; i < num_running; i++) {
        printf(" -> [LÄUFT] Name: %s\n", virDomainGetName(running_domains[i]));
        virDomainFree(running_domains[i]); // Speicher für jede VM freigeben
    }
    free(running_domains); // Puffer-Array freigeben
} else {
    fprintf(stderr, "Fehler beim Abfragen der laufenden VMs.\n");
}
    printf("=============================================\n\n");
}


procedure main;
begin
  virConnectPtr conn;
  virDomainPtr *domains = NULL;
  int num_domains = 0;
  unsigned int flags = VIR_CONNECT_LIST_DOMAINS_ACTIVE | VIR_CONNECT_LIST_DOMAINS_INACTIVE;

  // 1. Verbindung zur User-Session herstellen
  conn = virConnectOpen("qemu:///session");
  if (conn == NULL) {
      fprintf(stderr, "Fehler beim Verbinden mit qemu:///session\n");
      return 1;
  }
  printf("Erfolgreich mit QEMU (Session) verbunden!\n\n");


list(conn);

  // ==========================================
  // ERZWUNGENE BEREINIGUNG BEI JEDEM START
  // ==========================================
  virDomainPtr alte_vm = virDomainLookupByName(conn, "RetroPC");
  if (alte_vm != NULL) {
      printf("Alte Instanz von 'RetroPC' gefunden. Bereinige...\n");

      // Falls sie läuft: Stoppen
      if (virDomainIsActive(alte_vm) == 1) {
          printf(" -> Stoppe laufende VM (destroy)...\n");
          virDomainDestroy(alte_vm);
      }

      // Aus libvirt austragen / löschen
      printf(" -> Lösche VM-Registrierung (undefine)...\n");
      virDomainUndefine(alte_vm);

      virDomainFree(alte_vm);
      printf("Bereinigung abgeschlossen.\n\n");
  } else {
      printf("Keine alte Instanz von 'RetroPC' vorhanden. Erstelle komplett neu...\n");
  }
  // ==========================================

  // 2. Speicherpool "default" prüfen/erstellen
  virStoragePoolPtr pool = virStoragePoolLookupByName(conn, "default");
  if (pool == NULL) {
      printf("Pool 'default' nicht gefunden. Erstelle User-Pool...\n");
      const char *pool_xml =
          "<pool type='dir'>"
          "  <name>default</name>"
          "  <target>"
          "    <path>/home/tux/.local/share/libvirt/images</path>"
          "  </target>"
          "</pool>";

      pool = virStoragePoolDefineXML(conn, pool_xml, 0);
      if (pool) {
          virStoragePoolBuild(pool, VIR_STORAGE_POOL_BUILD_NEW);
          virStoragePoolSetAutostart(pool, 1);
          virStoragePoolCreate(pool, 0);
      } else {
          fprintf(stderr, "Fehler beim Erstellen des User-Speicherpools.\n");
          virConnectClose(conn);
          return 1;
      }
  }

  // 3. Virtuelle Festplatte prüfen/erstellen
  virStorageVolPtr vol = virStorageVolLookupByName(pool, "RetroPC.qcow2");
  if (vol == NULL) {
      printf("Festplatten-Image 'RetroPC.qcow2' nicht gefunden. Erstelle 10GB HDD...\n");
      const char *vol_xml =
          "<volume>"
          "  <name>RetroPC.qcow2</name>"
          "  <capacity unit='G'>10</capacity>"
          "  <target>"
          "    <format type='qcow2'/>"
          "  </target>"
          "</volume>";

      vol = virStorageVolCreateXML(pool, vol_xml, 0);
      if (vol == NULL) {
          fprintf(stderr, "Fehler beim Erstellen der virtuellen Festplatte.\n");
          virStoragePoolFree(pool);
          virConnectClose(conn);
          return 1;
      }
      printf("Erfolg: Virtuelle Festplatte wurde erstellt!\n\n");
  } else {
      printf("Virtuelle Festplatte 'RetroPC.qcow2' existiert bereits.\n\n");
  }

  char *vol_path = virStorageVolGetPath(vol);
  virStoragePoolFree(pool);

  // 4. XML-Definition für die VM (Hier war der Fehler: Jetzt ein grosses Array!)
  char vm_xml[2048];
  snprintf(vm_xml, sizeof(vm_xml),
      "<domain type='qemu'>"
      "  <name>RetroPC</name>"
      "  <memory unit='KiB'>8388608</memory>"
      "  <vcpu placement='static'>8</vcpu>"
      "  <os>"
      "    <type arch='x86_64' machine='q35'>hvm</type>"
      "    <boot dev='hd'/>"
      "    <boot dev='cdrom'/>"
      "  </os>"
      "  <devices>"
      "    <input type='tablet' bus='usb'/>"
      "    <emulator>/usr/bin/qemu-system-x86_64</emulator>"
      "    <disk type='file' device='disk'>"
      "      <driver name='qemu' type='qcow2'/>"
      "      <source file='%s'/>"
      "      <target dev='sda' bus='sata'/>"
      "    </disk>"
      "    <disk type='file' device='cdrom'>"
      "      <driver name='qemu' type='raw'/>"
      "      <source file='/home/tux/Schreibtisch/libvirt/noble-mini-iso-amd64.iso'/>"
      "      <target dev='sdb' bus='sata'/>"
      "      <readonly/>"
      "    </disk>"
      "    <interface type='user'>"
      "      <model type='virtio'/>"
      "    </interface>"
      "    <graphics type='vnc' port='-1' autoport='yes' listen='127.0.0.1'/>"
      "  </devices>"
      "</domain>", vol_path);

  free(vol_path);

  // 5. VM frisch registrieren
  printf("Registriere VM 'RetroPC' neu...\n");
  virDomainPtr mein_retro_pc = virDomainDefineXML(conn, vm_xml);
  if (mein_retro_pc == NULL) {
      fprintf(stderr, "Fehler: VM konnte nicht definiert werden.\n");
      virStorageVolFree(vol);
      virConnectClose(conn);
      return 1;
  }
  virStorageVolFree(vol);

  // 6. Die VM frisch starten
  printf("Starte 'RetroPC'...\n");
  if (virDomainCreate(mein_retro_pc) == 0) {
      printf("Erfolg: 'RetroPC' läuft frisch im Hintergrund!\n\n");

      // 7. Sauberes Öffnen des Viewers ohne "system()"
      printf("Öffne virt-viewer...\n");
      pid_t pid = fork();
      if (pid == 0) {
          char *args[] = {"virt-viewer", "-c", "qemu:///session", "RetroPC", NULL};
          execvp(args[0], args);
          exit(1); // Falls execvp fehlschlägt
      }
  } else {
      fprintf(stderr, "Fehler beim Starten der VM.\n");
  }

  // Aufräumen
  virDomainFree(mein_retro_pc);
  virConnectClose(conn);

end;

begin
    main;
end.

