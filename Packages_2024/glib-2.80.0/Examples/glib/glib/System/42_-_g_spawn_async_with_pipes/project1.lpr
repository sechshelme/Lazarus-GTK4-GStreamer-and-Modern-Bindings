program project1;

uses
  fp_glib2;

  function on_stdout_ready(Source: PGIOChannel; condition: TGIOCondition; Data: Tgpointer): Tgboolean; cdecl;
  var
    status: TGIOStatus;
    line: Pgchar;
    length: Tgsize;
    err: PGError = nil;
  begin
    status := g_io_channel_read_line(source, @line, @length, nil, @err);

    if status = G_IO_STATUS_NORMAL then begin
      g_printf('[output]: %s', line);
      g_free(line);
      Result := True;
    end else begin
      if err <> nil then begin
        g_printerr('Fehler beim Lesen: %s'#10, err^.message);
        g_error_free(err);
      end;
      g_io_channel_unref(source);
      Result := False;
    end;
  end;

  function timer_cp(user_data: Tgpointer): Tgboolean; cdecl;
  var
    loop: PGMainLoop absolute user_data;
  begin
    g_main_loop_quit(loop);
    Result := G_SOURCE_CONTINUE;
  end;

  procedure main;
  var
    loop: PGMainLoop;
    stdout_fd: Tgint;
    success: Tgboolean;
    err: PGError = nil;
    stdout_channel: PGIOChannel;
  const
    argv: array of Pgchar = ('ls', '/', '-R', '-l', nil);

  begin
    loop := g_main_loop_new(nil, False);

    success := g_spawn_async_with_pipes(nil, PPgchar(argv), nil, G_SPAWN_SEARCH_PATH, nil, nil, nil, nil, @stdout_fd, nil, @err);
    if not success then begin
      g_printerr('Fehler beim Starten: %s'#10, err^.message);
      g_error_free(err);
      g_main_loop_unref(loop);
      Exit;
    end;

    stdout_channel := g_io_channel_unix_new(stdout_fd);
    g_io_add_watch(stdout_channel, G_IO_IN or G_IO_HUP, @on_stdout_ready, nil);

    g_printf('Der Befehl läuft im Hintergrund. Starte Main Loop...');

    g_timeout_add(2000, @timer_cp, loop);
    g_main_loop_run(loop);
    g_main_loop_unref(loop);
  end;

begin
  main;
end.
