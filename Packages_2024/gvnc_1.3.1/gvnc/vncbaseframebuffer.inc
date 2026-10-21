{$IFDEF read_interface}


type
  PVncBaseFramebufferPrivate = type Pointer;

  PVncBaseFramebuffer = ^TVncBaseFramebuffer;
  TVncBaseFramebuffer = record
    parent: TGObject;
    priv: PVncBaseFramebufferPrivate;
  end;

  PVncBaseFramebufferClass = ^TVncBaseFramebufferClass;
  TVncBaseFramebufferClass = record
    parent_class: TGObjectClass;
    _vnc_reserved: array[0..(VNC_PADDING) - 1] of Tgpointer;
  end;

function vnc_base_framebuffer_get_type: TGType; cdecl; external libgvnc;
function vnc_base_framebuffer_new(buffer: Pguint8; width: Tguint16; height: Tguint16; rowstride: longint; localFormat: PVncPixelFormat;
  remoteFormat: PVncPixelFormat): PVncBaseFramebuffer; cdecl; external libgvnc;

// === Konventiert am: 20-10-26 19:51:08 ===

function VNC_TYPE_BASE_FRAMEBUFFER: TGType;
function VNC_BASE_FRAMEBUFFER(obj: Pointer): PVncBaseFramebuffer;
function VNC_BASE_FRAMEBUFFER_CLASS(klass: Pointer): PVncBaseFramebufferClass;
function VNC_IS_BASE_FRAMEBUFFER(obj: Pointer): Tgboolean;
function VNC_IS_BASE_FRAMEBUFFER_CLASS(klass: Pointer): Tgboolean;
function VNC_BASE_FRAMEBUFFER_GET_CLASS(obj: Pointer): PVncBaseFramebufferClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function VNC_TYPE_BASE_FRAMEBUFFER: TGType;
begin
  VNC_TYPE_BASE_FRAMEBUFFER := vnc_base_framebuffer_get_type;
end;

function VNC_BASE_FRAMEBUFFER(obj: Pointer): PVncBaseFramebuffer;
begin
  Result := PVncBaseFramebuffer(g_type_check_instance_cast(obj, VNC_TYPE_BASE_FRAMEBUFFER));
end;

function VNC_BASE_FRAMEBUFFER_CLASS(klass: Pointer): PVncBaseFramebufferClass;
begin
  Result := PVncBaseFramebufferClass(g_type_check_class_cast(klass, VNC_TYPE_BASE_FRAMEBUFFER));
end;

function VNC_IS_BASE_FRAMEBUFFER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VNC_TYPE_BASE_FRAMEBUFFER);
end;

function VNC_IS_BASE_FRAMEBUFFER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VNC_TYPE_BASE_FRAMEBUFFER);
end;

function VNC_BASE_FRAMEBUFFER_GET_CLASS(obj: Pointer): PVncBaseFramebufferClass;
begin
  Result := PVncBaseFramebufferClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
