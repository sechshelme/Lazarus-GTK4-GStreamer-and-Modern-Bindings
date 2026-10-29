program project1;

uses
  fp_glib2;

  procedure on_loop_finished(source_object: PGObject; res: PGAsyncResult; Data: Tgpointer); cdecl;
  var
    loop: PGMainLoop absolute Data;
    final_result: Tgpointer;
  begin
    final_result := g_task_propagate_pointer(G_TASK(res), nil);
    g_print('[Haupt-Thread] Fertig! Ergebnis der Schleife: %ld'#10, final_result);
    g_main_loop_quit(loop);
  end;

  procedure my_background_loop_worker(task: PGTask; source_object: Tgpointer; task_data: Tgpointer; cancellable: PGCancellable); cdecl;
  var
    res: PtrUInt = 0;
    i: integer;
  begin
    g_print('[Thread] Hintergrund-Schleife gestartet...'#10);
    for  i := 0 to 500 do begin
      g_usleep(100);
      inc(res);
      g_print('[Thread] Arbeite... Schritt %d'#10, i);
    end;
    g_task_return_pointer(task, Pointer(res), nil);
  end;

  function idel_func(user_data: Tgpointer): Tgboolean; cdecl;
  begin
    g_printerr('.');
    Result:=True;
  end;

  procedure main;
  var
    loop: PGMainLoop;
    task: PGTask;
  begin
    loop := g_main_loop_new(nil, False);

    g_print('[Haupt-Thread] Starte asynchrone interne Schleife...'#10);

    task := g_task_new(nil, nil, @on_loop_finished, loop);
    g_task_run_in_thread(task, @my_background_loop_worker);
    g_object_unref(task);

    g_idle_add(@idel_func, nil);

    g_print('[Haupt-Thread] Mainloop läuft und ist absolut reaktionsfähig!'#10);
    g_main_loop_run(loop);

    g_main_loop_unref(loop);
  end;


begin
  main;
end.
