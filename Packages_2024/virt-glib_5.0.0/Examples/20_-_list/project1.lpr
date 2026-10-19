program project1;

uses
  fp_glib2,
  fp_virt_glib;

  procedure main;
  var
    conn: PGVirConnection;
    err: PGError = nil;
    caps: PGVirConfigCapabilities;
    xml_str: Pgchar;
  begin
    conn := gvir_connection_new('qemu:///session');

    if not gvir_connection_open(conn, nil, @err) then begin
      g_printerr('Konnte keine Verbindung zu Libvirt herstellen: %s'#10, err^.message);
      g_clear_error(@err);
      g_object_unref(conn);
      Exit;;
    end;

    caps := gvir_connection_get_capabilities(conn, @err);
    if caps <> nil then begin
      xml_str := gvir_config_object_to_xml(GVIR_CONFIG_OBJECT(caps));
      g_printf('%s'#10, xml_str);

      g_free(xml_str);
      g_object_unref(caps);
    end else begin
      g_printerr('Fehler beim Abrufen der Capabilities: %s'#10, err^.message);
      g_clear_error(@err);
    end;

    gvir_connection_close(conn);
    g_object_unref(conn);
  end;

begin
  main;
end.
