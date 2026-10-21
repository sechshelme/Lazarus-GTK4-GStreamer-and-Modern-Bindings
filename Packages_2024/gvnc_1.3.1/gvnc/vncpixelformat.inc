{$IFDEF read_interface}


type
  PVncPixelFormat = ^TVncPixelFormat;
  TVncPixelFormat = record
    bits_per_pixel: Tguint8;
    depth: Tguint8;
    byte_order: Tguint16;
    true_color_flag: Tguint8;
    red_max: Tguint16;
    green_max: Tguint16;
    blue_max: Tguint16;
    red_shift: Tguint8;
    green_shift: Tguint8;
    blue_shift: Tguint8;
  end;

function vnc_pixel_format_get_type: TGType; cdecl; external libgvnc;
function vnc_pixel_format_new: PVncPixelFormat; cdecl; external libgvnc;
function vnc_pixel_format_copy(format: PVncPixelFormat): PVncPixelFormat; cdecl; external libgvnc;
procedure vnc_pixel_format_free(format: PVncPixelFormat); cdecl; external libgvnc;
function vnc_pixel_format_match(format: PVncPixelFormat; other: PVncPixelFormat): Tgboolean; cdecl; external libgvnc;

// === Konventiert am: 20-10-26 19:50:04 ===

function VNC_TYPE_PIXEL_FORMAT: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function VNC_TYPE_PIXEL_FORMAT: TGType;
begin
  VNC_TYPE_PIXEL_FORMAT := vnc_pixel_format_get_type;
end;



{$ENDIF read_implementation}
