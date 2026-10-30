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

  procedure reset_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    mybox: PMyWidget absolute user_data;
  begin
    my_widget_set_coords(mybox, Random(7) + 1, Random(7) + 1);
  end;


  procedure mybox_click_cp(widget: PGtkWidget; nr: Tgint; user_data: Tgpointer); cdecl;
  begin
    WriteLn('mybox_click_cp()   ', nr);
  end;

  procedure mybox_click_cp2(widget: PGtkWidget; nr: Tgint; user_data: Tgpointer); cdecl;
  begin
    WriteLn('Es wurde ::2 gedrückt');
  end;

  procedure on_columns_changed(obj: PGObject; pspec: PGParamSpec; user_data: Tgpointer); cdecl;
  var
    col, row: Tguint;
  begin
    g_object_get(obj, 'columns', @col, 'rows', @row, nil);
    g_printf('New Coord: %d x %d'#10, col, row);
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, mybox, header_bar, new_button: PGtkWidget;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Grid Demo');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 400);

    header_bar := gtk_header_bar_new;
    gtk_window_set_titlebar(GTK_WINDOW(window), header_bar);
    new_button := gtk_button_new_with_label('new');
    gtk_header_bar_pack_end(GTK_HEADER_BAR(header_bar), new_button);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    mybox := my_widget_new(4, 7);
    g_signal_connect(mybox, 'clicked::2', G_CALLBACK(@mybox_click_cp2), nil);
    g_signal_connect(mybox, 'clicked', G_CALLBACK(@mybox_click_cp), nil);
    g_signal_connect(mybox, 'notify::columns', G_CALLBACK(@on_columns_changed), nil);

    gtk_box_append(GTK_BOX(box), mybox);

    g_signal_connect(new_button, 'clicked', G_CALLBACK(@reset_cp), mybox);

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
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
