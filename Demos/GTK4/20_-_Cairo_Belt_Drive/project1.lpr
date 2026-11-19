program project1;

uses
  fp_glib2,
  fp_cairo,
  fp_GTK4,
  MyWidget;

  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  var
    self: PMyWidget absolute widget;
    r1, r2, y1, y2, current_time: double;
    width, height: longint;

    ofs_x1: single;
    ofs_y1: single;
    ofs_x2: single;
    ofs_y2: single;

  begin
    width := gtk_widget_get_width(widget);
    height := gtk_widget_get_height(widget);

    ofs_x1 := 150;
    ofs_y1 := 180;
    ofs_x2 := width - 100;
    ofs_y2 := height - 150;

    current_time := gdk_frame_clock_get_frame_time(frame_clock) / 500000.0;
    y1 := sin(current_time) * 50.0;
    y2 := sin(current_time * 1.13) * 80.0;
    r1 := 80.0 + sin(current_time) * 20.0;
    r2 := 20.0 + sin(current_time) * 5.0;
    my_widget_set_coords(self,current_time, r1, ofs_x1, ofs_y1 + y1, r2, ofs_x2, ofs_y2 + y2);

    Result := G_SOURCE_CONTINUE;
  end;

  procedure activate_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, drawing_area: PGtkWidget;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);
    g_object_set(gtk_settings_get_default, 'gtk-theme-name', 'Adwaita-dark', nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Belt Drive');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    drawing_area := my_widget_new;
    gtk_widget_set_vexpand(drawing_area, True);
    gtk_widget_set_hexpand(drawing_area, True);
    gtk_widget_add_tick_callback(drawing_area, @on_tick, nil, nil);
    gtk_box_append(GTK_BOX(box), drawing_area);

    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_set_child(GTK_WINDOW(window), box);
    gtk_window_present(GTK_WINDOW(window));
  end;

  procedure main;
  var
    app: PGtkApplication;
  begin
    app := gtk_application_new('org.gtk.beltdrive.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate_cp), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
