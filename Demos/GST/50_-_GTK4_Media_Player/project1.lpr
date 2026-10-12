program project1;

uses
  fp_glib2,
  fp_GTK4,
  fp_gst,
  MPMainWindow,
  MPIdleSongLoader;

  procedure app_activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    window: PGtkWidget;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);
    window := mp_main_window_new;
    gtk_window_set_application(GTK_WINDOW(window), app);
  end;

  procedure main;
  var
    app: PGtkApplication;
  begin
    gst_init(@argc, @argv);
    app := gtk_application_new('org.gtk.gst.mediaplayer', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@app_activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  gst_buffer_ref(nil);
  gst_buffer_unref(nil);
  main;
end.
