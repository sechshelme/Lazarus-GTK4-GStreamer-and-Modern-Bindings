{$IFDEF read_interface}


type
  PVncCursorPrivate = type Pointer;

  PVncCursor = ^TVncCursor;
  TVncCursor = record
    parent: TGObject;
    priv: PVncCursorPrivate;
  end;

  PVncCursorClass = ^TVncCursorClass;
  TVncCursorClass = record
    parent_class: TGObjectClass;
    _vnc_reserved: array[0..(VNC_PADDING) - 1] of Tgpointer;
  end;

function vnc_cursor_get_type: TGType; cdecl; external libgvnc;
function vnc_cursor_new(data: Pguint8; hotx: Tguint16; hoty: Tguint16; width: Tguint16; height: Tguint16): PVncCursor; cdecl; external libgvnc;
function vnc_cursor_get_data(cursor: PVncCursor): Pguint8; cdecl; external libgvnc;
function vnc_cursor_get_hotx(cursor: PVncCursor): Tguint16; cdecl; external libgvnc;
function vnc_cursor_get_hoty(cursor: PVncCursor): Tguint16; cdecl; external libgvnc;
function vnc_cursor_get_width(cursor: PVncCursor): Tguint16; cdecl; external libgvnc;
function vnc_cursor_get_height(cursor: PVncCursor): Tguint16; cdecl; external libgvnc;

// === Konventiert am: 20-10-26 19:50:31 ===

function VNC_TYPE_CURSOR: TGType;
function VNC_CURSOR(obj: Pointer): PVncCursor;
function VNC_CURSOR_CLASS(klass: Pointer): PVncCursorClass;
function VNC_IS_CURSOR(obj: Pointer): Tgboolean;
function VNC_IS_CURSOR_CLASS(klass: Pointer): Tgboolean;
function VNC_CURSOR_GET_CLASS(obj: Pointer): PVncCursorClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function VNC_TYPE_CURSOR: TGType;
begin
  VNC_TYPE_CURSOR := vnc_cursor_get_type;
end;

function VNC_CURSOR(obj: Pointer): PVncCursor;
begin
  Result := PVncCursor(g_type_check_instance_cast(obj, VNC_TYPE_CURSOR));
end;

function VNC_CURSOR_CLASS(klass: Pointer): PVncCursorClass;
begin
  Result := PVncCursorClass(g_type_check_class_cast(klass, VNC_TYPE_CURSOR));
end;

function VNC_IS_CURSOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VNC_TYPE_CURSOR);
end;

function VNC_IS_CURSOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VNC_TYPE_CURSOR);
end;

function VNC_CURSOR_GET_CLASS(obj: Pointer): PVncCursorClass;
begin
  Result := PVncCursorClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
