program project1;

uses
  fp_glib2,
  fp_virt,
  fp_gvnc,
  fp_virt_glib;

  procedure on_vnc_connected(conn: PVncConnection; user_data: Tgpointer); cdecl;
  begin
    g_printf('Erfolgreich mit dem VNC-Server der VM verbunden!'#10);
  end;

  procedure on_vnc_disconnected(conn: PVncConnection; user_data: Tgpointer); cdecl;
  begin
    g_printf('VNC-Verbindung getrennt.'#10);
  end;

  function quit_loop_callback(user_data: Tgpointer): Tgboolean; cdecl;
  begin
    g_main_loop_quit(PGMainLoop(user_data));
    Result := G_SOURCE_REMOVE_;
  end;

  procedure main;
  var
    vir_conn: TvirConnectPtr;
    dom: TvirDomainPtr;
    vnc: PVncConnection;
    loop: PGMainLoop;
  begin
    vir_conn := virConnectOpen('qemu:///session');
    if vir_conn = nil then begin
      g_printerr('Fehler beim Verbinden mit qemu:///session'#10);
      Exit;
    end;

    dom := virDomainLookupByName(vir_conn, 'RetroPC');
    if dom = nil then begin
      g_printerr('VM ''RetroPC'' wurde nicht gefunden oder läuft nicht.'#10);
      virConnectClose(vir_conn);
      Exit;
    end;

    virDomainFree(dom);
    virConnectClose(vir_conn);

    g_printf('Verbinde mit RetroPC auf VNC-Port: 5900...'#10);

    vnc := vnc_connection_new;

    g_signal_connect(vnc, 'vnc-connected', G_CALLBACK(@on_vnc_connected), nil);
    g_signal_connect(vnc, 'vnc-disconnected', G_CALLBACK(@on_vnc_disconnected), nil);

    if not vnc_connection_open_host(vnc, '127.0.0.1', '5900') then begin
      g_printerr('Fehler beim Öffnen der Vnc-Verbindung.'#10);
      g_object_unref(vnc);
      Exit;
    end;

    loop := g_main_loop_new(nil, False);
    g_timeout_add(1000, @quit_loop_callback, loop);
    g_main_loop_run(loop);

    g_object_unref(vnc);
  end;

begin
  main;
end.
