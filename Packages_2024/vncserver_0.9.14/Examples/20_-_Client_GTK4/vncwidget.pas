unit VNCWidget;

interface

uses
  fp_vnc,
  fp_graphene,
  fp_glib2,
  fp_GTK4;

type
  TVNCWidget = record
    parent_instance: TGtkWidget;
    vnc_client: PrfbClient;
    connect_io: boolean;
    tick_id: Tguint;
    mouse_mask: integer;
  end;
  PVNCWidget = ^TVNCWidget;

  TVNCWidgetClass = record
    parent_class: TGtkWidgetClass;
  end;
  PVNCWidgetClass = ^TVNCWidgetClass;

function vnc_widget_get_type: TGType;
function vnc_widget_new(ip: Pgchar; port: Tguint16): PGTKWidget;

implementation

// ==== private

var
  parentclass: PVNCWidgetClass = nil;


  // --- VNC

function update_screen_size_cp(client: PrfbClient): TrfbBool; cdecl;
var
  self: PVNCWidget;
  width, height: longint;
begin
  self := rfbClientGetClientData(client, pchar('user_data'));
  with self^ do begin

    width := client^.width;
    height := client^.height;

    g_printf('[VNC] Bildschirmauflösung geändert: %dx%d'#10, width, height);

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

    SendFramebufferUpdateRequest(client, 0, 0, width, height, False);

    gtk_widget_set_size_request(GTK_WIDGET(self), width, height);
    gtk_widget_queue_draw(GTK_WIDGET(self));

    Result := True;
  end;
end;

procedure handle_update_cp(client: PrfbClient; x: longint; y: longint; w: longint; h: longint); cdecl;
var
  self: PVNCWidget;
begin
  self := rfbClientGetClientData(client, pchar('user_data'));
  gtk_widget_queue_draw(GTK_WIDGET(self));
end;


// === GTK

function vnc_loop_step(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
var
  self: PVNCWidget absolute user_data;
  fd: TrfbSocket;
  pfd: TGPollFD;
begin
  with self^ do begin
    if (vnc_client = nil) or not connect_io then begin
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
          Exit(G_SOURCE_REMOVE_);
        end;
      end;
    end;
    Result := G_SOURCE_CONTINUE;
  end;
end;

procedure on_motion(controller: PGtkEventControllerMotion; x: Tgdouble; y: Tgdouble; user_data: Tgpointer); cdecl;
var
  self: PVNCWidget absolute user_data;
begin
  with self^ do begin
    if vnc_client <> nil then begin
      SendPointerEvent(vnc_client, Trunc(x), Trunc(y), mouse_mask);
    end;
  end;
end;

procedure mouse_action_cp(gesture: PGtkGestureClick; n_press: tgint; x: Tgdouble; y: Tgdouble; user_data: Tgpointer); cdecl;
var
  self: PVNCWidget;
  button: Tguint;
  button_bit: integer;
  is_pressed: boolean;
begin
  self := PVNCWidget(gtk_widget_get_ancestor(gtk_event_controller_get_widget(GTK_EVENT_CONTROLLER(gesture)), vnc_widget_get_type));

  is_pressed := (PtrUInt(user_data) = 1);

  with self^ do begin
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

    if is_pressed then begin
      mouse_mask := mouse_mask or button_bit;
    end else begin
      mouse_mask := mouse_mask and (not button_bit);
    end;

    if vnc_client <> nil then begin
      SendPointerEvent(vnc_client, Trunc(x), Trunc(y), mouse_mask);
    end;
  end;
end;

function key_pressed_cp(controller: PGtkEventControllerKey; keyval: Tguint; keycode: Tguint; state: TGdkModifierType; user_data: Tgpointer): Tgboolean; cdecl;
var
  self: PVNCWidget absolute user_data;
begin
  with self^ do begin
    if vnc_client <> nil then begin
      SendKeyEvent(vnc_client, keyval, True);
    end;
    Result := True;
  end;
end;

procedure key_released_cp(controller: PGtkEventControllerKey; keyval: Tguint; keycode: Tguint; state: TGdkModifierType; user_data: Tgpointer); cdecl;
var
  self: PVNCWidget absolute user_data;
begin
  with self^ do begin
    if vnc_client <> nil then begin
      SendKeyEvent(vnc_client, keyval, False);
    end;
  end;
end;

procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  self: PVNCWidget;
  r: Tgraphene_rect_t;
  vnc_w, vnc_h: integer;
  stride: integer;
  texture: PGdkTexture;
  bytes: PGBytes;
begin
  self := PVNCWidget(widget);

  if (self^.vnc_client <> nil) and (self^.vnc_client^.frameBuffer <> nil) then begin
    vnc_w := self^.vnc_client^.width;
    vnc_h := self^.vnc_client^.height;
    if (vnc_w > 0) and (vnc_h > 0) then begin
      stride := vnc_w * 4;
      bytes := g_bytes_new_static(self^.vnc_client^.frameBuffer, vnc_h * stride);
      texture := gdk_memory_texture_new(vnc_w, vnc_h, GDK_MEMORY_B8G8R8X8, bytes, stride);
      graphene_rect_init(@r, 0, 0, vnc_w, vnc_h);
      gtk_snapshot_append_texture(snapshot, texture, @r);
      g_object_unref(texture);
      g_bytes_unref(bytes);
    end;
  end;
end;

procedure finalize_cp(obj: PGObject); cdecl;
var
  self: PVNCWidget absolute obj;
begin
  with self^ do begin
    connect_io := False;

    if tick_id <> 0 then begin
      gtk_widget_remove_tick_callback(GTK_WIDGET(self), tick_id);
      tick_id := 0;
    end;

    if vnc_client <> nil then begin
      g_free(vnc_client^.frameBuffer);
//           rfbClientCleanup(vnc_client);
      vnc_client := nil;
    end;
  end;
  G_OBJECT_CLASS(parentclass)^.finalize(obj);
end;

procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  GTK_WIDGET_CLASS(g_class)^.snapshot := @snapshoot_cp;
  parentclass := g_type_class_peek_parent(g_class);
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
begin
end;

function check_ip_and_port(ip: Pgchar; port: Tguint16): boolean;
var
  client: PGSocketClient;
  connection: PGSocketConnection;
  err: PGError = nil;
begin
  client := g_socket_client_new;
  connection := g_socket_client_connect_to_host(client, ip, port, nil, @err);
  if err <> nil then begin
    g_printerr('Verbindungsfehler: '#10, err^.message);
    g_clear_error(@err);
    Result := False;
  end else begin
    g_object_unref(connection);
    Result := True;
  end;
  g_object_unref(client);
end;

// ==== public

function vnc_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_WIDGET, 'VNCWidget', SizeOf(TVNCWidgetClass), @class_init_cp, SizeOf(TVNCWidget), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function vnc_widget_new(ip: Pgchar; port: Tguint16): PGTKWidget;
var
  self: PVNCWidget absolute Result;
  motion_ctrl, key_ctrl: PGtkEventController;
  click_gesture: PGtkGesture;
begin
  Result := g_object_new(vnc_widget_get_type, nil);
  with self^ do begin
    connect_io := check_ip_and_port(ip, port);
    if connect_io then begin
      vnc_client := rfbGetClient(8, 3, 4);
      rfbClientSetClientData(vnc_client, pchar('user_data'), self);
      vnc_client^.serverHost := ip;
      vnc_client^.serverPort := port;
      vnc_client^.MallocFrameBuffer := @update_screen_size_cp;
      vnc_client^.GotFrameBufferUpdate := @handle_update_cp;
      g_printf('Verbinde zu VNC auf %s:%d...'#10, vnc_client^.serverHost, vnc_client^.serverPort);
      if not rfbInitClient(vnc_client, nil, nil) then begin
        g_printerr('VNC: Verbindung fehlgeschlagen!'#10);
        Exit;
      end;
      SendFramebufferUpdateRequest(vnc_client, 0, 0, vnc_client^.width, vnc_client^.height, False);

      mouse_mask := 0;

      gtk_widget_set_hexpand(GTK_WIDGET(self), gTrue);
      gtk_widget_set_vexpand(GTK_WIDGET(self), gTrue);

      gtk_widget_set_focusable(GTK_WIDGET(self), gTrue);
      gtk_widget_set_focus_on_click(GTK_WIDGET(self), gTrue);

      gtk_widget_set_size_request(GTK_WIDGET(self), vnc_client^.width, vnc_client^.height);

      motion_ctrl := gtk_event_controller_motion_new;
      g_signal_connect(motion_ctrl, 'motion', G_CALLBACK(@on_motion), self);
      gtk_widget_add_controller(GTK_WIDGET(self), motion_ctrl);

      click_gesture := gtk_gesture_click_new;
      gtk_gesture_single_set_button(GTK_GESTURE_SINGLE(click_gesture), 0);
      g_signal_connect(click_gesture, 'pressed', G_CALLBACK(@mouse_action_cp), Pointer(1));
      g_signal_connect(click_gesture, 'released', G_CALLBACK(@mouse_action_cp), Pointer(0));
      gtk_widget_add_controller(GTK_WIDGET(self), GTK_EVENT_CONTROLLER(click_gesture));

      key_ctrl := gtk_event_controller_key_new;
      g_signal_connect(key_ctrl, 'key-pressed', G_CALLBACK(@key_pressed_cp), self);
      g_signal_connect(key_ctrl, 'key-released', G_CALLBACK(@key_released_cp), self);
      gtk_widget_add_controller(GTK_WIDGET(self), key_ctrl);

      tick_id := gtk_widget_add_tick_callback(GTK_WIDGET(self), @vnc_loop_step, self, nil);
    end else begin
      g_printerr('connection failure!'#10);
    end;
  end;
end;

end.
