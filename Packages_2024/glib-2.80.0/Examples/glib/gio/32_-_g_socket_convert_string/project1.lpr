program project1;

uses
  fp_glib2;

(*
nc localhost 8080
*)

  procedure main;
  var
    err: PGError = nil;
    server_socket, client_socket: PGSocket;
    inet_address: PGInetAddress;
    socket_address: PGSocketAddress;
    buffer: array[0..1023] of char;
    bytes_received: Tgssize;
    response: Pgchar;
    response_len: SizeInt;

  begin
    server_socket := g_socket_new(G_SOCKET_FAMILY_IPV4, G_SOCKET_TYPE_STREAM, G_SOCKET_PROTOCOL_TCP, @err);
    if server_socket = nil then begin
      g_printerr('Fehler beim Erstellen des Sockets: %s'#10, err^.message);
      g_clear_error(@err);
      Exit;
    end;

    inet_address := g_inet_address_new_any(G_SOCKET_FAMILY_IPV4);
    socket_address := g_inet_socket_address_new(inet_address, 8080);
    g_object_unref(inet_address);

    if (not g_socket_bind(server_socket, socket_address, True, @err)) or (not g_socket_listen(server_socket, @err)) then begin
      g_printerr('Fehler beim Binden/Listen: %s'#10, err^.message);
      g_clear_error(@err);
      Exit;
    end;
    g_object_unref(socket_address);

    g_print('Server läuft auf Port 8080 und wartet auf Verbindungen...'#10);

    while True do begin
      client_socket := g_socket_accept(server_socket, nil, @err);
      if client_socket = nil then begin
        g_printerr('Fehler beim Akzeptieren der Verbindung: %s'#10, err^.message);
        g_clear_error(@err);
        continue;
      end;

      g_print('Client verbunden!'#10);

      while True do begin
        bytes_received := g_socket_receive(client_socket, buffer, SizeOf(buffer) - 1, nil, @err);

        if bytes_received < 0 then begin
          g_printerr('Fehler beim Empfangen: %s'#10, err^.message);
          g_clear_error(@err);
          break;
        end else if bytes_received = 0 then begin
          g_print('Client hat die Verbindung getrennt.'#10);
          break;
        end;

        buffer[bytes_received] := #0;

        if string(buffer) = 'quit' then begin
          g_print('Beende Verbindung zu diesem Client...'#10);
          g_socket_send(client_socket, 'Verbindung getrennt', 19, nil, nil);
          break;
        end;

        response := g_utf8_strup(buffer, -1);
        response_len := Length(response);

        g_socket_send(client_socket, response, response_len, nil, @err);
        g_free(response);
      end;

      g_socket_close(client_socket, nil);
      g_object_unref(client_socket);
    end;
    g_object_unref(server_socket);
  end;


begin
  main;
end.
