{$IFDEF read_interface}


type
  PVncFramebuffer = type Pointer;

  PVncFramebufferInterface = ^TVncFramebufferInterface;
  TVncFramebufferInterface = record
    parent: TGTypeInterface;
    get_width: function(fb: PVncFramebuffer): Tguint16; cdecl;
    get_height: function(fb: PVncFramebuffer): Tguint16; cdecl;
    get_rowstride: function(fb: PVncFramebuffer): longint; cdecl;
    get_buffer: function(fb: PVncFramebuffer): Pguint8; cdecl;
    get_local_format: function(fb: PVncFramebuffer): PVncPixelFormat; cdecl;
    get_remote_format: function(fb: PVncFramebuffer): PVncPixelFormat; cdecl;
    perfect_format_match: function(fb: PVncFramebuffer): Tgboolean; cdecl;
    set_pixel_at: procedure(fb: PVncFramebuffer; src: Pguint8; x: Tguint16; y: Tguint16); cdecl;
    fill: procedure(fb: PVncFramebuffer; src: Pguint8; x: Tguint16; y: Tguint16; width: Tguint16; height: Tguint16); cdecl;
    copyrect: procedure(fb: PVncFramebuffer; srcx: Tguint16; srcy: Tguint16; dstx: Tguint16; dsty: Tguint16; width: Tguint16; height: Tguint16); cdecl;
    blt: procedure(fb: PVncFramebuffer; src: Pguint8; rowstride: longint; x: Tguint16; y: Tguint16; width: Tguint16; height: Tguint16); cdecl;
    rgb24_blt: procedure(fb: PVncFramebuffer; src: Pguint8; rowstride: longint; x: Tguint16; y: Tguint16; width: Tguint16; height: Tguint16); cdecl;
    set_color_map: procedure(fb: PVncFramebuffer; map: PVncColorMap); cdecl;
  end;

function vnc_framebuffer_get_type: TGType; cdecl; external libgvnc;
function vnc_framebuffer_get_width(fb: PVncFramebuffer): Tguint16; cdecl; external libgvnc;
function vnc_framebuffer_get_height(fb: PVncFramebuffer): Tguint16; cdecl; external libgvnc;
function vnc_framebuffer_get_rowstride(fb: PVncFramebuffer): longint; cdecl; external libgvnc;
function vnc_framebuffer_get_buffer(fb: PVncFramebuffer): Pguint8; cdecl; external libgvnc;
function vnc_framebuffer_get_local_format(fb: PVncFramebuffer): PVncPixelFormat; cdecl; external libgvnc;
function vnc_framebuffer_get_remote_format(fb: PVncFramebuffer): PVncPixelFormat; cdecl; external libgvnc;
function vnc_framebuffer_perfect_format_match(fb: PVncFramebuffer): Tgboolean; cdecl; external libgvnc;
procedure vnc_framebuffer_set_pixel_at(fb: PVncFramebuffer; src: Pguint8; x: Tguint16; y: Tguint16); cdecl; external libgvnc;
procedure vnc_framebuffer_fill(fb: PVncFramebuffer; src: Pguint8; x: Tguint16; y: Tguint16; width: Tguint16;
  height: Tguint16); cdecl; external libgvnc;
procedure vnc_framebuffer_copyrect(fb: PVncFramebuffer; srcx: Tguint16; srcy: Tguint16; dstx: Tguint16; dsty: Tguint16;
  width: Tguint16; height: Tguint16); cdecl; external libgvnc;
procedure vnc_framebuffer_blt(fb: PVncFramebuffer; src: Pguint8; rowstride: longint; x: Tguint16; y: Tguint16;
  width: Tguint16; height: Tguint16); cdecl; external libgvnc;
procedure vnc_framebuffer_rgb24_blt(fb: PVncFramebuffer; src: Pguint8; rowstride: longint; x: Tguint16; y: Tguint16;
  width: Tguint16; height: Tguint16); cdecl; external libgvnc;
procedure vnc_framebuffer_set_color_map(fb: PVncFramebuffer; map: PVncColorMap); cdecl; external libgvnc;

// === Konventiert am: 20-10-26 19:50:19 ===

function VNC_TYPE_FRAMEBUFFER: TGType;
function VNC_FRAMEBUFFER(obj: Pointer): PVncFramebuffer;
function VNC_IS_FRAMEBUFFER(obj: Pointer): Tgboolean;
function VNC_FRAMEBUFFER_GET_INTERFACE(obj: Pointer): PVncFramebufferInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function VNC_TYPE_FRAMEBUFFER: TGType;
begin
  VNC_TYPE_FRAMEBUFFER := vnc_framebuffer_get_type;
end;

function VNC_FRAMEBUFFER(obj: Pointer): PVncFramebuffer;
begin
  Result := PVncFramebuffer(g_type_check_instance_cast(obj, VNC_TYPE_FRAMEBUFFER));
end;

function VNC_IS_FRAMEBUFFER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VNC_TYPE_FRAMEBUFFER);
end;

function VNC_FRAMEBUFFER_GET_INTERFACE(obj: Pointer): PVncFramebufferInterface;
begin
  Result := g_type_interface_peek(obj, VNC_TYPE_FRAMEBUFFER);
end;



{$ENDIF read_implementation}
