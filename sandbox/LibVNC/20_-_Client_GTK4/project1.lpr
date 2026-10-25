program project1;

uses
fp_cairo,
fp_glib2,
fp_GTK4,
fp_vnc;

var
  vnc_client: PrfbClient = nil;
  drawing_area: PGtkWidget = nil;
  cairo_surface: Pcairo_surface_t = nil;
  mouse_mask: Integer = 0;




procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t;  Width: longint; Height: longint; user_data: Tgpointer); cdecl;
begin
   if cairo_surface <> nil then begin
       cairo_set_source_surface(cr, cairo_surface, 0, 0);
       cairo_paint(cr);
   end;
end;

procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
var
  window: PGtkWidget;
begin
  g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

  gtk_window_set_title(GTK_WINDOW(window), 'VNC Client (GTK4)');

   drawing_area := gtk_drawing_area_new;
   gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, nil, nil);
   gtk_window_set_child(GTK_WINDOW(window), drawing_area);

   // VNC-Initialisierung
   vnc_client := rfbGetClient(8, 3, 4);
   vnc_client^.serverHost := '127.0.0.1';
   vnc_client^.serverPort := 5902;
   vnc_client^.MallocFrameBuffer := @update_screen_size;
   vnc_client^.GotFrameBufferUpdate := @handle_update;

   printf("Verbinde zu VNC auf %s:%d...\n", vnc_client^.serverHost, vnc_client^.serverPort);
   if (!rfbInitClient(vnc_client, nil, nil)) {
       fprintf(stderr, "VNC: Verbindung fehlgeschlagen!\n");
       exit(1);
   }

   // Setze initiale Canvas-Größe basierend auf dem Server-Handshake
   gtk_drawing_area_set_content_width(GTK_DRAWING_AREA(drawing_area), vnc_client^.width);
   gtk_drawing_area_set_content_height(GTK_DRAWING_AREA(drawing_area), vnc_client^.height);
   SendFramebufferUpdateRequest(vnc_client, 0, 0, vnc_client^.width, vnc_client^.height, FALSE);

   // --- Event Controller in GTK4 registrieren ---

   // Mausbewegung
   GtkEventController* motion_ctrl = gtk_event_controller_motion_new();
   g_signal_connect(motion_ctrl, "motion", G_CALLBACK(on_motion), nil);
   gtk_widget_add_controller(drawing_area, motion_ctrl);

   // Mausklicks (Pressed / Released)
   GtkGesture* click_gesture = gtk_gesture_click_new();
   gtk_gesture_single_set_button(GTK_GESTURE_SINGLE(click_gesture), 0); // Reagiert auf alle Maustasten
   g_signal_connect(click_gesture, "pressed", G_CALLBACK(on_pressed), nil);
   g_signal_connect(click_gesture, "released", G_CALLBACK(on_released), nil);
   gtk_widget_add_controller(drawing_area, GTK_EVENT_CONTROLLER(click_gesture));

   // Tastatur (Muss auf das Fenster angewendet werden)
   GtkEventController* key_ctrl = gtk_event_controller_key_new();
   g_signal_connect(key_ctrl, "key-pressed", G_CALLBACK(on_key_pressed), nil);
   g_signal_connect(key_ctrl, "key-released", G_CALLBACK(on_key_released), nil);
   gtk_widget_add_controller(window, key_ctrl);

   // VNC-Netzwerk-Schleife an den GTK Main-Loop hängen
   g_idle_add(vnc_loop_step, app);

   gtk_window_present(GTK_WINDOW(window));end;


procedure main;
var
  app: PGtkApplication;
begin
  app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
  g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
  g_application_run(G_APPLICATION(app), argc, argv);
  g_object_unref(app);
end;begin
  main;
end.

