program project1;

uses
  fp_virt,

  fp_glib2,
  fp_gvnc,
  fp_vncaudiopulse,
  fp_virt_glib;


 procedure on_vnc_connected(conn:PVncConnection ; user_data: Tgpointer);cdecl;
 begin
 g_printf('Erfolgreich mit dem VNC-Server der VM verbunden!'#10);
      end;

procedure on_vnc_disconnected(conn:PVncConnection ; user_data: Tgpointer);cdecl;
begin
      g_printf('VNC-Verbindung getrennt.'#10);
      end;

  procedure main;
  var
    vir_conn: TvirConnectPtr;
    dom: TvirDomainPtr;
  begin
//    virConnectPtr vir_conn;
//    virDomainPtr dom;
//    char *vnc_port = NULL;
//    char *xml_desc = NULL;

    vir_conn := virConnectOpen('qemu:///session');
    if vir_conn = nil then begin
        g_printerr('Fehler beim Verbinden mit qemu:///session'#10);
        Exit;
    end;

    // 2. Die Domain (VM) "RetroPC" finden
    dom := virDomainLookupByName(vir_conn, 'RetroPC');
    if (dom == NULL) {
        fprintf(stderr, "VM 'RetroPC' wurde nicht gefunden oder läuft nicht.\n");
        virConnectClose(vir_conn);
        return 1;
    }

    // 3. XML-Beschreibung der VM auslesen, um den VNC-Port zu finden
    xml_desc = virDomainGetXMLDesc(dom, 0);
    if (xml_desc != NULL) {
        char *p = strstr(xml_desc, "graphics type='vnc' port='");
        if (p) {
            p += 26; // Länge des Suchstrings
            vnc_port = strndup(p, 4); // Extrahiert den Port
        }
        free(xml_desc);
    }

    virDomainFree(dom);
    virConnectClose(vir_conn);

    if (!vnc_port || strcmp(vnc_port, "-1") == 0) {
        fprintf(stderr, "Fehler: Die VM läuft nicht oder hat kein VNC-Display.\n");
        if (vnc_port) free(vnc_port);
        return 1;
    }

    printf("Verbinde mit RetroPC auf VNC-Port: %s...\n", vnc_port);

    // 4. GLib / GObject Typ-System initialisieren
    #if !GLIB_CHECK_VERSION(2, 36, 0)
    g_type_init();
    #endif

    // 5. VncConnection (ohne G!) erstellen
    VncConnection *vnc = vnc_connection_new();

    // Signale verknüpfen
    g_signal_connect(vnc, "vnc-connected", G_CALLBACK(on_vnc_connected), NULL);
    g_signal_connect(vnc, "vnc-disconnected", G_CALLBACK(on_vnc_disconnected), NULL);

    // 6. Verbindung aufbauen
    if (!vnc_connection_open_host(vnc, "127.0.0.1", vnc_port)) {
        fprintf(stderr, "Fehler beim Öffnen der Vnc-Verbindung.\n");
        g_object_unref(vnc);
        free(vnc_port);
        return 1;
    }

    free(vnc_port);

    // Event-Loop starten
    GMainLoop *loop = g_main_loop_new(NULL, FALSE);
    g_main_loop_run(loop);

    g_object_unref(vnc);
  end;

begin
  main;
end.
