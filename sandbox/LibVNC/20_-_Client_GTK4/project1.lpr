program project1;

uses
  fp_glib2,
  fp_GTK4,
  VNCWidget;


  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, main_box, widget: PGtkWidget;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'VNC Client (GTK4)');

    main_box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 6);
    gtk_window_set_child(GTK_WINDOW(window), main_box);

    widget := my_widget_new('127.0.0.1', 5901);
    gtk_box_append(GTK_BOX(main_box), widget);

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
