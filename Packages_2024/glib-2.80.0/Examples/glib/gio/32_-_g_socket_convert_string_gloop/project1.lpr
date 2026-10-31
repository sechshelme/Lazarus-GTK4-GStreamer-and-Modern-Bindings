program project1;

uses
  fp_glib2;

(*
nc localhost 8080
*)

  function socket_readable_cp(socket: PGSocket; condition: TGIOCondition; user_data: Tgpointer): Tgboolean; cdecl;
  var
    err: PGError = nil;
    buffer: array[0..1023] of char;
    bytes_received: Tgssize;
    response: Pgchar;
    response_len: SizeInt;
  begin
    WriteLn(PtrUInt(user_data));
    bytes_received := g_socket_receive(socket, buffer, SizeOf(buffer) - 1, nil, @err);

    if bytes_received <= 0 then begin
      if bytes_received = 0 then begin
        g_print('Client hat die Verbindung getrennt.'#10);
      end else begin
        g_printerr('Fehler beim Empfangen: %s'#10, err^.message);
        g_clear_error(@err);
      end;
      g_socket_close(socket, nil);
      g_object_unref(socket);
      Exit(False);
    end;

    buffer[bytes_received] := #0;
    g_strchomp(buffer);
    if g_strcmp0(buffer, 'quit') = 0 then begin
      g_print('Beende Verbindung...'#10);
      g_socket_send(socket, 'Verbindung getrennt'#10, 20, nil, nil);
      g_socket_close(socket, nil);
      g_object_unref(socket);
      Exit(False);
    end;

    response := g_utf8_strup(buffer, -1);
    response_len := Length(response);
    g_socket_send(socket, response, response_len, nil, nil);
    g_free(response);

    Result := True;
  end;

  function incoming_connection_cp(service: PGSocketService; connection: PGSocketConnection; source_object: PGObject; user_data: Tgpointer): Tgboolean; cdecl;
  var
    client_socket: PGSocket;
    source: PGSource;
  begin
    g_print('Client verbunden!'#10);

    client_socket := g_socket_connection_get_socket(connection);
    g_object_ref(client_socket);

    source := g_socket_create_source(client_socket, G_IO_IN, nil);

    g_source_set_callback(source, TGSourceFunc(@socket_readable_cp), Pointer(1234), nil);

    g_source_attach(source, nil);
    g_source_unref(source);

    Result := True;
  end;

  procedure main;
  var
    err: PGError = nil;
    service: PGSocketService;
    loop: PGMainLoop;
  begin
    service := g_socket_service_new();

    if not g_socket_listener_add_inet_port(G_SOCKET_LISTENER(service), 8080, nil, @err) then begin
      g_printerr('Fehler beim Binden an Port 8080: %s'#10, err^.message);
      g_clear_error(@err);
      g_object_unref(service);
      Exit;
    end;

    g_signal_connect(service, 'incoming', G_CALLBACK(@incoming_connection_cp), nil);

    g_socket_service_start(service);
    g_printf('Server läuft sauber auf Port 8080 via GMainLoop...'#10);

    loop := g_main_loop_new(nil, False);
    g_main_loop_run(loop);

    g_main_loop_unref(loop);
    g_object_unref(service);
  end;

begin
  main;
end.
