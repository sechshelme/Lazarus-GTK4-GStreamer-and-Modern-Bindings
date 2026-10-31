unit VNCWidget;

interface

uses
  fp_glib2,
  fp_graphene,
  fp_GTK4;

const
  BUF_SIZE = 1600 * 1200 * 4;

type
  TVNCState = (
    vncStateProtocolExchange,
    vncStateSecurityExchange,
    vncStateClientInit,
    vncStateServerInit,
    vncStateNormal
    );

  TVNCWidget = record
    parent_instance: TGtkWidget;

    socket_client: PGSocketClient;
    connection: PGSocketConnection;
    input_stream: PGInputStream;
    output_stream: PGOutputStream;
    cancellable: PGCancellable;

    protocol_state: TVNCState;
    read_buffer_dyn: Pguint8;
    buf_total_bytes: integer;


    width: integer;
    height: integer;
    framebuffer: Pointer;
    mouse_mask: integer;
  end;
  PVNCWidget = ^TVNCWidget;

  TVNCWidgetClass = record
    parent_class: TGtkWidgetClass;
  end;
  PVNCWidgetClass = ^TVNCWidgetClass;

function vnc_widget_get_type: TGType;
function vnc_widget_new(ip: Pgchar; port: Tguint16): PGTKWidget;

procedure start_async_read(self: PVNCWidget); // ??????


implementation

var
  parentclass: PVNCWidgetClass = nil;

  ///    g_printf('num_rects: %d  x: %d  y: %d  w: %d  h: %d'#10, num_rects, rect_x, rect_y, rect_w, rect_h);


procedure process_rfb_data(self: PVNCWidget; bytes_read: Tgssize);
var
  version_str: string;
  num_security_types: tguint8;
  i: integer;
  chosen_type: tguint8;
  security_result: tguint32;
  err: PGError = nil;

  msg_type: tguint8;
  num_rects: tguint16;
  rect_x, rect_y, rect_w, rect_h, needed_pixel_bytes: tguint16;
  encoding_type: tgint32;
  pixel_idx, fb_idx: integer;
  px_y, px_x, current_offset, rect_idx: integer;

begin
  case self^.protocol_state of

    vncStateProtocolExchange: begin
      if bytes_read >= 12 then begin
        SetLength(version_str, 11);
        Move(self^.read_buffer_dyn[0], version_str[1], 11);
        g_printf('[VNC] Server Version: %s'#10, PChar(version_str));

        g_output_stream_write(self^.output_stream, @self^.read_buffer_dyn[0], 12, nil, @err);
        if err <> nil then begin
          g_printerr('[VNC] Fehler beim Antworten auf Version: %s'#10, err^.message);
          g_clear_error(@err);
          Exit;
        end;

        self^.protocol_state := vncStateSecurityExchange;
      end;
    end;

    vncStateSecurityExchange: begin
      if bytes_read >= 1 then begin
        num_security_types := self^.read_buffer_dyn[0];
        g_printf('[VNC] Server bietet %d Sicherheitsmethode(n) an.'#10, num_security_types);

        chosen_type := 0;
        for i := 1 to num_security_types do begin
          if self^.read_buffer_dyn[i] = 1 then begin
            chosen_type := 1;
            Break;
          end;
        end;

        if chosen_type = 1 then begin
          g_printf('[VNC] Wähle Sicherheitsmethode: None (1)'#10);
          g_output_stream_write(self^.output_stream, @chosen_type, 1, nil, nil);
          self^.protocol_state := vncStateClientInit;
        end else begin
          g_printerr('[VNC] Fehler: Server verlangt Passwörter/Verschlüsselung, die wir noch nicht unterstützen!'#10);
        end;
      end;
    end;

    vncStateClientInit: begin
      if bytes_read >= 4 then begin
        security_result := (self^.read_buffer_dyn[0] shl 24) or
          (self^.read_buffer_dyn[1] shl 16) or
          (self^.read_buffer_dyn[2] shr 8) or
          self^.read_buffer_dyn[3];

        if security_result = 0 then begin
          g_printf('[VNC] Authentifizierung erfolgreich (None).'#10);

          chosen_type := 1;
          g_output_stream_write(self^.output_stream, @chosen_type, 1, nil, nil);

          self^.protocol_state := vncStateServerInit;
        end else begin
          g_printerr('[VNC] Sicherheits-Aushandlung vom Server abgelehnt!'#10);
        end;
      end;
    end;

    vncStateServerInit: begin
      if bytes_read >= 24 then begin
        self^.width := (self^.read_buffer_dyn[0] shl 8) or self^.read_buffer_dyn[1];
        self^.height := (self^.read_buffer_dyn[2] shl 8) or self^.read_buffer_dyn[3];
        g_printf('[VNC] Auflösung erfolgreich ermittelt: %dx%d'#10, self^.width, self^.height);

        self^.framebuffer := g_try_realloc(self^.framebuffer, self^.width * self^.height * 4);
        FillChar(self^.framebuffer^, self^.width * self^.height * 4, 0);

        gtk_widget_set_size_request(GTK_WIDGET(self), self^.width, self^.height);
        gtk_widget_queue_draw(GTK_WIDGET(self));

        self^.protocol_state := vncStateNormal;

        FillChar(self^.read_buffer_dyn[0], 10, 0);
        self^.read_buffer_dyn[0] := 3;
        self^.read_buffer_dyn[1] := 0;
        self^.read_buffer_dyn[4] := (self^.width shr 8) and $FF;
        self^.read_buffer_dyn[5] := self^.width and $FF;
        self^.read_buffer_dyn[6] := (self^.height shr 8) and $FF;
        self^.read_buffer_dyn[7] := self^.height and $FF;
        g_output_stream_write(self^.output_stream, @self^.read_buffer_dyn[0], 10, nil, nil);
      end;
    end;

    vncStateNormal: begin
      if bytes_read >= 4 then begin
        msg_type := self^.read_buffer_dyn[0];

        if msg_type = 0 then begin
          num_rects := (self^.read_buffer_dyn[2] shl 8) or self^.read_buffer_dyn[3];
          current_offset := 4;

          for rect_idx := 1 to num_rects do begin

            if bytes_read >= (current_offset + 12) then begin
              rect_x := (self^.read_buffer_dyn[current_offset + 0] shl 8) or self^.read_buffer_dyn[current_offset + 1];
              rect_y := (self^.read_buffer_dyn[current_offset + 2] shl 8) or self^.read_buffer_dyn[current_offset + 3];
              rect_w := (self^.read_buffer_dyn[current_offset + 4] shl 8) or self^.read_buffer_dyn[current_offset + 5];
              rect_h := (self^.read_buffer_dyn[current_offset + 6] shl 8) or self^.read_buffer_dyn[current_offset + 7];

              encoding_type := (self^.read_buffer_dyn[current_offset + 8] shl 24) or
                (self^.read_buffer_dyn[current_offset + 9] shl 16) or
                (self^.read_buffer_dyn[current_offset + 10] shl 8) or
                self^.read_buffer_dyn[current_offset + 11];

              pixel_idx := current_offset + 12;

              if encoding_type = 0 then begin
                needed_pixel_bytes := rect_w * rect_h * 4;

                if bytes_read >= (pixel_idx + needed_pixel_bytes) then begin

                  for px_y := rect_y to (rect_y + rect_h - 1) do begin
                    for px_x := rect_x to (rect_x + rect_w - 1) do begin
                      fb_idx := (px_y * self^.width + px_x) * 4;

                      pbyte(self^.framebuffer)[fb_idx + 0] := self^.read_buffer_dyn[pixel_idx + 2]; // B
                      pbyte(self^.framebuffer)[fb_idx + 1] := self^.read_buffer_dyn[pixel_idx + 1]; // G
                      pbyte(self^.framebuffer)[fb_idx + 2] := self^.read_buffer_dyn[pixel_idx + 0]; // R
                      pbyte(self^.framebuffer)[fb_idx + 3] := $FF;                                 // A

                      inc(pixel_idx, 4);
                    end;
                  end;

                  current_offset := pixel_idx;
                end else begin
                  break;
                end;
              end;
            end else begin
              break;
            end;
          end;

          gtk_widget_queue_draw(GTK_WIDGET(self));

          FillChar(self^.read_buffer_dyn[0], 10, 0);
          self^.read_buffer_dyn[0] := 3;
          self^.read_buffer_dyn[1] := 1;
          self^.read_buffer_dyn[4] := (self^.width shr 8) and $FF;
          self^.read_buffer_dyn[5] := self^.width and $FF;
          self^.read_buffer_dyn[6] := (self^.height shr 8) and $FF;
          self^.read_buffer_dyn[7] := self^.height and $FF;
          g_output_stream_write(self^.output_stream, @self^.read_buffer_dyn[0], 10, nil, nil);
        end;
      end;
    end;

  end;
end;


// ==== ASYNCHRONER NETZWERK-LOOP ====

procedure on_vnc_data_read(source_object: PGObject; res: PGAsyncResult; user_data: Tgpointer); cdecl;
var
  self: PVNCWidget absolute user_data;
  bytes_read: Tgssize;
  err: PGError = nil;
begin
  bytes_read := g_input_stream_read_finish(G_INPUT_STREAM(source_object), res, @err);
  if (bytes_read <= 0) or (err <> nil) then begin
    g_printf('[VNC] Verbindung geschlossen oder Fehler aufgetreten.'#10);
    if err <> nil then begin
      g_clear_error(@err);
    end;
    Exit;
  end;

  process_rfb_data(self, bytes_read);
  start_async_read(self);
end;

procedure start_async_read(self: PVNCWidget);
begin
  if (self^.input_stream <> nil) and not (g_cancellable_is_cancelled(self^.cancellable)) then begin
    g_input_stream_read_async(self^.input_stream, @self^.read_buffer_dyn[0], BUF_SIZE, G_PRIORITY_DEFAULT, self^.cancellable, @on_vnc_data_read, self);
  end;
end;

procedure on_connected_cp(source_object: PGObject; res: PGAsyncResult; user_data: Tgpointer); cdecl;
var
  self: PVNCWidget absolute user_data;
  err: PGError = nil;
begin
  self^.connection := g_socket_client_connect_to_host_finish(G_SOCKET_CLIENT(source_object), res, @err);

  if err <> nil then begin
    g_printerr('[VNC] Verbindung fehlgeschlagen: %s'#10, err^.message);
    g_clear_error(@err);
    Exit;
  end;

  g_printf('[VNC] Verbunden! Starte Protokollaustausch...'#10);

  self^.input_stream := g_io_stream_get_input_stream(G_IO_STREAM(self^.connection));
  self^.output_stream := g_io_stream_get_output_stream(G_IO_STREAM(self^.connection));
  self^.protocol_state := vncStateProtocolExchange;
  start_async_read(self);
end;

// ==== GTK EVENT CONTROLLER ====

procedure on_motion(controller: PGtkEventControllerMotion; x: Tgdouble; y: Tgdouble; user_data: Tgpointer); cdecl;
var
  self: PVNCWidget absolute user_data;
  buf: array[0..5] of Tguint8;
begin
  if (self^.output_stream <> nil) and (self^.protocol_state = vncStateNormal) then begin
    buf[0] := 5;
    buf[1] := self^.mouse_mask;
    buf[2] := (Trunc(x) shr 8) and $FF;
    buf[3] := Trunc(x) and $FF;
    buf[4] := (Trunc(y) shr 8) and $FF;
    buf[5] := Trunc(y) and $FF;
    g_output_stream_write(self^.output_stream, @buf[0], 6, nil, nil);
  end;
end;

procedure mouse_action_cp(gesture: PGtkGestureClick; n_press: tgint; x: Tgdouble; y: Tgdouble; user_data: Tgpointer); cdecl;
var
  self: PVNCWidget;
  button: Tguint;
  button_bit: integer;
  is_pressed: boolean;
  buf: array[0..5] of Tguint8;
begin
  self := PVNCWidget(gtk_widget_get_ancestor(gtk_event_controller_get_widget(GTK_EVENT_CONTROLLER(gesture)), vnc_widget_get_type));
  if self = nil then begin
    Exit;
  end;

  is_pressed := (PtrUInt(user_data) = 1);
  button := gtk_gesture_single_get_current_button(GTK_GESTURE_SINGLE(gesture));
  button_bit := 0;

  case button of
    1: begin
      button_bit := 1;
    end;
    2: begin
      button_bit := 2;
    end;
    3: begin
      button_bit := 4;
    end;
  end;

  if is_pressed then begin
    self^.mouse_mask := self^.mouse_mask or button_bit;
  end else begin
    self^.mouse_mask := self^.mouse_mask and (not button_bit);
  end;

  if (self^.output_stream <> nil) and (self^.protocol_state = vncStateNormal) then begin
    buf[0] := 5;
    buf[1] := self^.mouse_mask;
    buf[2] := (Trunc(x) shr 8) and $FF;
    buf[3] := Trunc(x) and $FF;
    buf[4] := (Trunc(y) shr 8) and $FF;
    buf[5] := Trunc(y) and $FF;
    g_output_stream_write(self^.output_stream, @buf[0], 6, nil, nil);
  end;
end;

function key_pressed_cp(controller: PGtkEventControllerKey; keyval: Tguint; keycode: Tguint; state: TGdkModifierType; user_data: Tgpointer): Tgboolean; cdecl;
var
  self: PVNCWidget absolute user_data;
  buf: array[0..7] of Tguint8;
begin
  if (self^.output_stream <> nil) and (self^.protocol_state = vncStateNormal) then begin
    buf[0] := 4;
    buf[1] := 1;
    buf[2] := 0;
    buf[3] := 0;
    buf[4] := (keyval shr 24) and $FF;
    buf[5] := (keyval shr 16) and $FF;
    buf[6] := (keyval shr 8) and $FF;
    buf[7] := keyval and $FF;
    g_output_stream_write(self^.output_stream, @buf[0], 8, nil, nil);
  end;
  Result := True;
end;

procedure key_released_cp(controller: PGtkEventControllerKey; keyval: Tguint; keycode: Tguint; state: TGdkModifierType; user_data: Tgpointer); cdecl;
var
  self: PVNCWidget absolute user_data;
  buf: array[0..7] of Tguint8;
begin
  if (self^.output_stream <> nil) and (self^.protocol_state = vncStateNormal) then begin
    buf[0] := 4;
    buf[1] := 0;
    buf[2] := 0;
    buf[3] := 0;
    buf[4] := (keyval shr 24) and $FF;
    buf[5] := (keyval shr 16) and $FF;
    buf[6] := (keyval shr 8) and $FF;
    buf[7] := keyval and $FF;
    g_output_stream_write(self^.output_stream, @buf[0], 8, nil, nil);
  end;
end;

// ==== GTK DRAWING / SNAPSHOT ====
procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  self: PVNCWidget;
  r: Tgraphene_rect_t;
  stride: integer;
  texture: PGdkTexture;
  bytes: PGBytes;
begin
  self := PVNCWidget(widget);
  if (self^.framebuffer <> nil) and (self^.width > 0) and (self^.height > 0) then begin
    stride := self^.width * 4;
    bytes := g_bytes_new_static(self^.framebuffer, self^.height * stride);
    texture := gdk_memory_texture_new(self^.width, self^.height, GDK_MEMORY_B8G8R8X8, bytes, stride);
    graphene_rect_init(@r, 0, 0, self^.width, self^.height);
    gtk_snapshot_append_texture(snapshot, texture, @r);
    g_object_unref(texture);
    g_bytes_unref(bytes);
  end;
end;
// ==== LIFECYCLE MANAGEMENT ====
procedure finalize_cp(obj: PGObject); cdecl;
var
  self: PVNCWidget absolute obj;
begin
  with self^ do begin
    if cancellable <> nil then begin
      g_cancellable_cancel(cancellable);
      g_object_unref(cancellable);
    end;
    if input_stream <> nil then begin
      g_object_unref(input_stream);
    end;
    if output_stream <> nil then begin
      g_object_unref(output_stream);
    end;
    if connection <> nil then begin
      g_object_unref(connection);
    end;
    if socket_client <> nil then begin
      g_object_unref(socket_client);
    end;
    if framebuffer <> nil then begin
      g_free(framebuffer);
      framebuffer := nil;
    end;
    if read_buffer_dyn <> nil then begin
      g_free(read_buffer_dyn);
      read_buffer_dyn := nil;
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
var
  self: PVNCWidget absolute instance;
begin
  with self^ do begin
    width := 0;
    height := 0;
    framebuffer := nil;
    connection := nil;
    protocol_state := vncStateProtocolExchange;
    read_buffer_dyn := g_malloc(BUF_SIZE);
  end;
end;
// ==== PUBLIC INTERFACE ====
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
  self^.cancellable := g_cancellable_new();
  self^.socket_client := g_socket_client_new();
  self^.mouse_mask := 0;

  gtk_widget_set_hexpand(GTK_WIDGET(self), gTrue);
  gtk_widget_set_vexpand(GTK_WIDGET(self), gTrue);
  gtk_widget_set_focusable(GTK_WIDGET(self), gTrue);
  gtk_widget_set_focus_on_click(GTK_WIDGET(self), gTrue);

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
  g_printf('[VNC] Starte asynchronen Verbindungsaufbau zu %s:%d...'#10, ip, port);

  g_socket_client_connect_to_host_async(self^.socket_client, ip, port, self^.cancellable, @on_connected_cp, self);
end;

end.
