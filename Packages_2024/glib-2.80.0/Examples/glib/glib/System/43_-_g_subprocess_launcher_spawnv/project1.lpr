program project1;

uses
  fp_glib2;

  function timer_cp(user_data: Tgpointer): Tgboolean; cdecl;
  var
    loop: PGMainLoop absolute user_data;
  begin
    g_main_loop_quit(loop);
    Result := G_SOURCE_CONTINUE;
  end;

  procedure on_line_read(source_object: PGObject; res: PGAsyncResult; Data: Tgpointer); cdecl;
  var
    stream: PGDataInputStream;
    loop: PGMainLoop absolute Data;
    line: PChar;
    len: Tgsize;
    err: PGError = nil;
  begin
    stream := G_DATA_INPUT_STREAM(source_object);
    line := g_data_input_stream_read_line_finish(stream, res, @len, @err);

    if err <> nil then begin
      g_printerr('Fehler beim Lesen der Ausgabe: %s', err^.message);
      g_clear_error(@err);
      g_main_loop_quit(loop);
      Exit;;
    end;

    if line <> nil then begin
      g_print('[ls-Ausgabe]: %s'#10, line);
      g_free(line);
      g_data_input_stream_read_line_async(stream, G_PRIORITY_DEFAULT, nil, @on_line_read, loop);
    end else begin
      g_print('--- Ende der Befehlsausgabe ---'#10);
      g_main_loop_quit(loop);
    end;
  end;

  procedure main;
  var
    loop: PGMainLoop;
    err: PGError = nil;
    launcher: PGSubprocessLauncher;
    subprocess: PGSubprocess;
    stdout_stream: PGInputStream;
    data_stream: PGDataInputStream;
  const
    arg: array of Pgchar = ('ls', '/', '-R', '-l', nil);

  begin
    loop := g_main_loop_new(nil, False);

    launcher := g_subprocess_launcher_new(G_SUBPROCESS_FLAGS_STDOUT_PIPE);
    subprocess := g_subprocess_launcher_spawnv(launcher, PPgchar(arg), @err);

    if err <> nil then begin
      g_printerr('Fehler beim Starten: %s', err^.message);
      g_clear_error(@err);
      g_object_unref(launcher);
      g_main_loop_unref(loop);
      Exit;;
    end;

    stdout_stream := g_subprocess_get_stdout_pipe(subprocess);
    data_stream := g_data_input_stream_new(stdout_stream);

    g_data_input_stream_read_line_async(data_stream, G_PRIORITY_DEFAULT, nil, @on_line_read, loop);

    g_timeout_add(2000, @timer_cp, loop);
    g_main_loop_run(loop);

    g_object_unref(subprocess);
    g_object_unref(launcher);
    g_main_loop_unref(loop);
  end;

begin
  main;
end.
