program project1;

uses
  fp_glib2,
  fp_GTK4,
  fp_box2d,
  MyWidget,
  EngineCalc;

type
  TAniData = record
    box2dData: TBox2dData;
  end;
  PAniData = ^TAniData;

  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  var
    anyData: PAniData absolute user_data;
  begin
    with anyData^.box2dData do begin
      engine.NextScene;
      BodyIds := engine.SceneBodyIds;
    end;
    gtk_widget_queue_draw(widget);
    Result := G_SOURCE_CONTINUE;
  end;

  procedure startup_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    anyData: PAniData absolute user_data;
  begin
    with anyData^.box2dData do begin
      engine := TEngine.Create;
    end;
  end;

  procedure shutdown_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    anyData: PAniData absolute user_data;
  begin
    with anyData^.box2dData do begin
      engine.Free;
    end;
  end;

  procedure activate_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    anyData: PAniData absolute user_data;
    window, box, button, mySnapShot: PGtkWidget;
    version: Tb2Version;
    vs: pchar = nil;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    version := b2GetVersion;
    vs := g_strdup_printf('Box2d demo   (%d.%d.%d)', version.major, version.minor, version.revision);
    gtk_window_set_title(GTK_WINDOW(window), vs);
    g_free(vs);
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    mySnapShot := GTK_WIDGET(my_widget_new(@anyData^.box2dData));
    gtk_widget_set_vexpand(mySnapShot, True);
    gtk_widget_set_hexpand(mySnapShot, True);
    gtk_widget_add_tick_callback(mySnapShot, @on_tick, anyData, nil);
    gtk_box_append(GTK_BOX(box), mySnapShot);

    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_set_child(GTK_WINDOW(window), box);
    gtk_window_present(GTK_WINDOW(window));
  end;

  procedure main;
  var
    app: PGtkApplication;
    anyData: TAniData;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'startup', G_CALLBACK(@startup_cp), @anyData);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate_cp), @anyData);
    g_signal_connect(app, 'shutdown', G_CALLBACK(@shutdown_cp), @anyData);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
