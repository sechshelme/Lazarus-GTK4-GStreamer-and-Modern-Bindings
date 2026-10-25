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
  mouse_mask: integer = 0;

  // === VNC

  function update_screen_size(client: PrfbClient): TrfbBool; cdecl;
  var
    width, height: longint;
  begin
    width := client^.width;
    height := client^.height;

    g_printf('[VNC] Bildschirmauflösung geändert: %dx%d'#10, width, height);

    if cairo_surface <> nil then begin
      cairo_surface_destroy(cairo_surface);
    end;

    client^.frameBuffer := g_try_realloc(client^.frameBuffer, width * height * 4);
    client^.format.bitsPerPixel := 32;
    client^.format.depth := 24;
    client^.format.bigEndian := 0;
    client^.format.trueColour := 1;
    client^.format.redMax := 255;
    client^.format.greenMax := 255;
    client^.format.blueMax := 255;
    client^.format.redShift := 16;
    client^.format.greenShift := 8;
    client^.format.blueShift := 0;

    cairo_surface := cairo_image_surface_create_for_data(client^.frameBuffer, CAIRO_FORMAT_RGB24, width, height, width * 4);

    if drawing_area <> nil then begin
      gtk_drawing_area_set_content_width(GTK_DRAWING_AREA(drawing_area), width);
      gtk_drawing_area_set_content_height(GTK_DRAWING_AREA(drawing_area), height);
      gtk_widget_queue_draw(drawing_area);
    end;

    Result := True;
  end;

  procedure handle_update(client: PrfbClient; x: longint; y: longint; w: longint; h: longint); cdecl;
  begin
    WriteLn('handle_update()');
    if drawing_area <> nil then begin
      gtk_widget_queue_draw(drawing_area);
    end;
  end;



  // === GTK

  function gtk_key_to_vnc(keyval: Tguint): Tguint32;
  begin
    Result := keyval;
  end;

  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  begin
    if cairo_surface <> nil then begin
      cairo_set_source_surface(cr, cairo_surface, 0, 0);
      cairo_paint(cr);
    end;
  end;

  function vnc_loop_step(user_data: Tgpointer): Tgboolean; cdecl;
  var
    fd: TrfbSocket;
    pfd: TGPollFD;
    app: PGtkApplication;
  begin
    if (drawing_area = nil) or (not GTK_IS_WIDGET(drawing_area)) or (vnc_client = nil) then begin
      Exit(G_SOURCE_REMOVE_);
    end;

    fd := vnc_client^.sock;

    if fd < 0 then begin
      Exit(G_SOURCE_REMOVE_);
    end;

    pfd.fd := fd;
    pfd.events := G_IO_IN or G_IO_HUP or G_IO_ERR;
    pfd.revents := 0;

    if g_poll(@pfd, 1, 0) > 0 then begin
      if (pfd.revents and (G_IO_IN or G_IO_HUP or G_IO_ERR)) <> 0 then begin
        if not HandleRFBServerMessage(vnc_client) then begin
          g_printf('VNC: Verbindung vom Server getrennt.'#10);
          vnc_client := nil;
          app := GTK_APPLICATION(user_data);
          g_application_quit(G_APPLICATION(app));
          Exit(G_SOURCE_REMOVE_);
        end;
      end;
    end;
    Result := G_SOURCE_CONTINUE;
  end;

  procedure on_motion(controller: PGtkEventControllerMotion; x: Tgdouble; y: Tgdouble; data: Tgpointer); cdecl;
  begin
    if vnc_client <> nil then begin
      SendPointerEvent(vnc_client, Trunc(x), Trunc(y), mouse_mask);
    end;
  end;

  procedure on_pressed(gesture: PGtkGestureClick; n_press: tgint; x: Tgdouble; y: Tgdouble; data: Tgpointer); cdecl;
  var
    button: Tguint;
    button_bit: integer;
  begin
    button := gtk_gesture_single_get_current_button(GTK_GESTURE_SINGLE(gesture));
    button_bit := 0;

    case button of
      GDK_BUTTON_PRIMARY: begin
        button_bit := rfbButton1Mask;
      end;
      GDK_BUTTON_MIDDLE: begin
        button_bit := rfbButton2Mask;
      end;
      GDK_BUTTON_SECONDARY: begin
        button_bit := rfbButton3Mask;
      end;
    end;

    mouse_mask := mouse_mask or button_bit;

    if vnc_client <> nil then begin
      SendPointerEvent(vnc_client, Trunc(x), Trunc(y), mouse_mask);
    end;
  end;

  procedure on_released(gesture: PGtkGestureClick; n_press: tgint; x: Tgdouble; y: Tgdouble; data: Tgpointer); cdecl;
  var
    button: Tguint;
    button_bit: integer;
  begin
    button := gtk_gesture_single_get_current_button(GTK_GESTURE_SINGLE(gesture));
    button_bit := 0;

    case button of
      GDK_BUTTON_PRIMARY: begin
        button_bit := rfbButton1Mask;
      end;
      GDK_BUTTON_MIDDLE: begin
        button_bit := rfbButton2Mask;
      end;
      GDK_BUTTON_SECONDARY: begin
        button_bit := rfbButton3Mask;
      end;
    end;

    mouse_mask := mouse_mask and (not button_bit);

    if vnc_client <> nil then begin
      SendPointerEvent(vnc_client, Trunc(x), Trunc(y), mouse_mask);
    end;
  end;

  function on_key_pressed(controller: PGtkEventControllerKey; keyval: Tguint; keycode: Tguint; state: TGdkModifierType; data: Tgpointer): Tgboolean; cdecl;
  var
    vnc_key: Tguint32;
  begin
    if vnc_client <> nil then begin
      vnc_key := gtk_key_to_vnc(keyval);
      SendKeyEvent(vnc_client, vnc_key, True);
    end;
    Result := True;
  end;

  procedure on_key_released(controller: PGtkEventControllerKey; keyval: Tguint; keycode: Tguint; state: TGdkModifierType; data: Tgpointer); cdecl;
  var
    vnc_key: Tuint32_t;
  begin
    if vnc_client <> nil then begin
      vnc_key := gtk_key_to_vnc(keyval);
      SendKeyEvent(vnc_client, vnc_key, False);
    end;
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window: PGtkWidget;
    motion_ctrl, key_ctrl: PGtkEventController;
    click_gesture: PGtkGesture;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'VNC Client (GTK4)');

    drawing_area := gtk_drawing_area_new;
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, nil, nil);
    gtk_window_set_child(GTK_WINDOW(window), drawing_area);

    vnc_client := rfbGetClient(8, 3, 4);
    vnc_client^.serverHost := '127.0.0.1';
    vnc_client^.serverPort := 5900;
    vnc_client^.MallocFrameBuffer := @update_screen_size;
    vnc_client^.GotFrameBufferUpdate := @handle_update;

    g_printf('Verbinde zu VNC auf %s:%d...'#10, vnc_client^.serverHost, vnc_client^.serverPort);
    if not rfbInitClient(vnc_client, nil, nil) then begin
      g_printerr('VNC: Verbindung fehlgeschlagen!'#10);
      Exit;
    end;

    gtk_drawing_area_set_content_width(GTK_DRAWING_AREA(drawing_area), vnc_client^.width);
    gtk_drawing_area_set_content_height(GTK_DRAWING_AREA(drawing_area), vnc_client^.height);
    SendFramebufferUpdateRequest(vnc_client, 0, 0, vnc_client^.width, vnc_client^.height, False);

    motion_ctrl := gtk_event_controller_motion_new;
    g_signal_connect(motion_ctrl, 'motion', G_CALLBACK(@on_motion), nil);
    gtk_widget_add_controller(drawing_area, motion_ctrl);

    click_gesture := gtk_gesture_click_new;
    gtk_gesture_single_set_button(GTK_GESTURE_SINGLE(click_gesture), 0);
    g_signal_connect(click_gesture, 'pressed', G_CALLBACK(@on_pressed), nil);
    g_signal_connect(click_gesture, 'released', G_CALLBACK(@on_released), nil);
    gtk_widget_add_controller(drawing_area, GTK_EVENT_CONTROLLER(click_gesture));

    key_ctrl := gtk_event_controller_key_new;
    g_signal_connect(key_ctrl, 'key-pressed', G_CALLBACK(@on_key_pressed), nil);
    g_signal_connect(key_ctrl, 'key-released', G_CALLBACK(@on_key_released), nil);
    gtk_widget_add_controller(window, key_ctrl);

    g_idle_add(@vnc_loop_step, app);

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
