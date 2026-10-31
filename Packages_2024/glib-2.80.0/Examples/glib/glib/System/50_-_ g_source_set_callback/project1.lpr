program project1;

uses
  fp_glib2;

type
  TAppDate = record
    counter: nativeint;
    loop: PGMainLoop;
  end;
  PAppDate = ^TAppDate;

  function mein_timer_callback(data: Tgpointer): Tgboolean; cdecl;
  var
    appData: PAppDate absolute data;
  begin
    Inc(appData^.counter);
    g_printf('Timer gefeuert! Durchlauf: %d'#10, appData^.counter);
    if appData^.counter >= 7 then begin
      g_printf('Limit erreicht. Beende die Main Loop...'#10);
      g_main_loop_quit(appData^.Loop);
      Result := G_SOURCE_REMOVE_;
    end else begin
      Result := G_SOURCE_CONTINUE;
    end;
  end;

  procedure main;
  var
    source: PGSource;
    appData: TAppDate;
  begin
    appData.counter := 0;
    appData.loop := g_main_loop_new(nil, False);

    source := g_timeout_source_new(1000);
    g_source_set_callback(source, TGSourceFunc(@mein_timer_callback), @appData, nil);
    g_source_attach(source, g_main_loop_get_context(appData.loop));
    g_source_unref(source);

    g_printf('Starte Main Loop. Der Timer läuft jede Sekunde...'#10);
    g_main_loop_run(appData.loop);

    g_main_loop_unref(appData.loop);
    g_printf('Programm erfolgreich beendet.'#10);
  end;


begin
  main;
end.
