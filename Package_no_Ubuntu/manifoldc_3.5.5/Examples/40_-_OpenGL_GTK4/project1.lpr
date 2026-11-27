program project1;

uses
  fp_GL_Tools,
  fp_epoxy,
  fp_glib2,
  fp_GTK4,
  GLAreaWidget;

  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, gl_area, grid: PGtkWidget;
    i: integer;
  const
    c = 2;
    r = 2;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);
    g_object_set(gtk_settings_get_default, 'gtk-theme-name', 'Adwaita-dark', nil);

    window := gtk_application_window_new(app);
    gtk_window_set_decorated(GTK_WINDOW(window), True);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 and Manifold Demo');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_window_set_child(GTK_WINDOW(window), box);

    grid := gtk_grid_new;
    gtk_grid_set_column_spacing(GTK_GRID(grid), 5);
    gtk_grid_set_row_spacing(GTK_GRID(grid), 5);
    gtk_box_append(GTK_BOX(box), grid);

    for i := 0 to c * r - 1 do begin
      gl_area := gl_area_widget_new;
      gtk_widget_set_hexpand(gl_area, True);
      gtk_widget_set_vexpand(gl_area, True);

      gtk_grid_attach(GTK_GRID(grid), gl_area, i mod c, i div c, 1, 1);
    end;

    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_present(GTK_WINDOW(window));
  end;


  procedure main;
  var
    app: PGtkApplication;
  begin
    app := gtk_application_new('org.gtk.manifold.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
