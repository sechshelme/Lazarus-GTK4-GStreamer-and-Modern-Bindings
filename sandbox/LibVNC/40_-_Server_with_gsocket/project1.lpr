program project1;

uses
  fp_glib2, sysutils;

const
  WIDTH = 640;
  HEIGHT = 480;
  BPP = 4;

type
  TClientState = record
    connection: PGSocketConnection;
    g_out: PGOutputStream;
    g_in: PGInputStream;
    framebuffer: PUInt32;
    box_x: Tgint;
    box_y: Tgint;
    speed_x: Tgint;
    speed_y: Tgint;
  end;
  PClientState = ^TClientState;

  function send_all(stream: PGOutputStream; buffer: Pointer; count: Tgsize): Boolean;
  var
    err: PGError = nil;
  begin
    g_output_stream_write_all(stream, buffer, count, nil, nil, @err);
    if err <> nil then begin
      g_printerr('Fehler beim Senden: %s'#10, err^.message);
      g_clear_error(@err);
      Result := False;
    end else begin
      Result := True;
    end;
  end;

  procedure render_frame(cs: PClientState);
  var
    box_size: Tgint;
    x, y: Tgint;
  begin
    box_size := 100;

    FillChar(cs^.framebuffer^, WIDTH * HEIGHT * BPP, $00);

    cs^.box_x := cs^.box_x + cs^.speed_x;
    cs^.box_y := cs^.box_y + cs^.speed_y;

    if cs^.box_x < 0 then begin
      cs^.box_x := 0;
      cs^.speed_x := -cs^.speed_x;
    end;
    if cs^.box_x + box_size > WIDTH then begin
      cs^.box_x := WIDTH - box_size;
      cs^.speed_x := -cs^.speed_x;
    end;
    if cs^.box_y < 0 then begin
      cs^.box_y := 0;
      cs^.speed_y := -cs^.speed_y;
    end;
    if cs^.box_y + box_size > HEIGHT then begin
      cs^.box_y := HEIGHT - box_size;
      cs^.speed_y := -cs^.speed_y;
    end;

    for y := cs^.box_y to (cs^.box_y + box_size - 1) do begin
      for x := cs^.box_x to (cs^.box_x + box_size - 1) do begin
        cs^.framebuffer[y * WIDTH + x] := $FF000000 or (y) or (x shl 8);
      end;
    end;
  end;

  // Freigabe-Prozedur, um Memory Leaks zu verhindern
  procedure free_client_state(cs: PClientState);
  begin
    if cs = nil then Exit;
    g_print('Verbindung geschlossen. Räume Speicher auf...'#10);
    if cs^.framebuffer <> nil then g_free(cs^.framebuffer);
    if cs^.connection <> nil then begin
      g_io_stream_close(G_IO_STREAM(cs^.connection), nil, nil);
      g_object_unref(cs^.connection);
    end;
    g_free(cs);
  end;

  function update_network_and_render(user_data: Tgpointer): Tgboolean; cdecl;
  var
    cs: PClientState;
    update_header: array[0..3] of Tguint8;
    x_pos, y_pos, w_val, h_val: Tguint16;
    enc_val: Tgint32;
    success: Boolean;
  begin
    cs := PClientState(user_data);
    render_frame(cs);

    update_header[0] := 0; // RFB Msg Type: FramebufferUpdate
    update_header[1] := 0; // Padding
    update_header[2] := 0;
    update_header[3] := 1; // Number of rectangles

    success := send_all(cs^.g_out, @update_header, SizeOf(update_header));

    if success then begin
      x_pos := guint16_to_be(0);
      y_pos := guint16_to_be(0);
      w_val := guint16_to_be(WIDTH);
      h_val := guint16_to_be(HEIGHT);
      enc_val := gint32_to_be(0); // Raw Encoding

      success := send_all(cs^.g_out, @x_pos, 2) and
                 send_all(cs^.g_out, @y_pos, 2) and
                 send_all(cs^.g_out, @w_val, 2) and
                 send_all(cs^.g_out, @h_val, 2) and
                 send_all(cs^.g_out, @enc_val, 4) and
                 send_all(cs^.g_out, cs^.framebuffer, WIDTH * HEIGHT * BPP);
    end;

    if not success then begin
      free_client_state(cs);
      Result := False;
    end else begin
      Result := True;
    end;
  end;

  function on_new_connection(service: PGSocketService; connection: PGSocketConnection; source_object: PGObject; user_data: Tgpointer): Tgboolean; cdecl;
  var
    g_in: PGInputStream;
    g_out: PGOutputStream;
    err: PGError;
    buffer: array[0..11] of Tgchar;
    bytes_read: Tgsize;
    sec_types: array[0..1] of Tguint8;
    chosen_sec: Tguint8;
    sec_result: Tguint32;
    shared_flag: Tguint8;
    s_width, s_height: Tguint16;
    pix_fmt: array[0..15] of Tguint8;
    name_len: Tguint32;
    cs: PClientState;
  begin
    g_print('Client hat sich verbunden. Starte VNC-Handshake...'#10);
    err := nil;
    bytes_read := 0;

    g_in := g_io_stream_get_input_stream(G_IO_STREAM(connection));
    g_out := g_io_stream_get_output_stream(G_IO_STREAM(connection));

    if not send_all(g_out, PChar('RFB 003.008'#10), 12) then Exit(True);
    g_input_stream_read_all(g_in, @buffer, 12, @bytes_read, nil, @err);

    sec_types[0] := 1;
    sec_types[1] := 1;
    if not send_all(g_out, @sec_types, 2) then Exit(True);

    chosen_sec := 0;
    g_input_stream_read_all(g_in, @chosen_sec, 1, @bytes_read, nil, @err);

    sec_result := 0;
    if not send_all(g_out, @sec_result, 4) then Exit(True);

    shared_flag := 0;
    g_input_stream_read_all(g_in, @shared_flag, 1, @bytes_read, nil, @err);

    s_width := guint16_to_be(WIDTH);
    s_height := guint16_to_be(HEIGHT);

    FillChar(pix_fmt, SizeOf(pix_fmt), 0);
    pix_fmt[0] := 32;
    pix_fmt[1] := 24;
    pix_fmt[3] := 1;
    pix_fmt[5] := 255;
    pix_fmt[7] := 255;
    pix_fmt[9] := 255;
    pix_fmt[10] := 16;
    pix_fmt[11] := 8;
    pix_fmt[12] := 0;

    if not send_all(g_out, @s_width, 2) then Exit(True);
    if not send_all(g_out, @s_height, 2) then Exit(True);
    if not send_all(g_out, @pix_fmt, 16) then Exit(True);

    name_len := guint32_to_be(14);
    if not send_all(g_out, @name_len, 4) then Exit(True);
    if not send_all(g_out, PChar('GIO VNC Server'), 14) then Exit(True);

    g_print('Handshake erfolgreich. Starte Render-Loop...'#10);

    cs := g_malloc(SizeOf( TClientState));
    cs^.connection := PGSocketConnection(g_object_ref(connection));
    cs^.g_in := g_in;
    cs^.g_out := g_out;
    cs^.framebuffer := g_malloc(WIDTH * HEIGHT * BPP);
    cs^.box_x := 50;
    cs^.box_y := 50;
    cs^.speed_x := 4;
    cs^.speed_y := 3;

    g_timeout_add(33, @update_network_and_render, cs);
    Result := True;
  end;

  procedure main;
  var
    loop: PGMainLoop;
    service: PGSocketService;
    err: PGError;
  begin
    err := nil;
    loop := g_main_loop_new(nil, False);
    service := g_socket_service_new();

    if not g_socket_listener_add_inet_port(G_SOCKET_LISTENER(service), 5901, nil, @err) then begin
      g_printerr('Konnte Port 5901 nicht öffnen: %s'#10, err^.message);
      g_clear_error(@err);
      g_object_unref(service);
      g_main_loop_unref(loop);
      Exit;
    end;

    g_signal_connect(service, 'incoming', G_CALLBACK(@on_new_connection), nil);

    g_print('VNC-Server läuft stabil auf vnc://127.0.0.1:5901 ...'#10);
    g_main_loop_run(loop);

    g_object_unref(service);
    g_main_loop_unref(loop);
  end;

begin
  main;
end.

