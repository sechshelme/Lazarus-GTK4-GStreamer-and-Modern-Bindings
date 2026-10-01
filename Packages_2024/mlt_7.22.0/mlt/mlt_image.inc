{$IFDEF read_interface}


const
  MLT_IMAGE_MAX_PLANES = 4;

function mlt_image_new: Tmlt_image; cdecl; external libmlt;
procedure mlt_image_close(self: Tmlt_image); cdecl; external libmlt;
procedure mlt_image_set_values(self: Tmlt_image; data: pointer; format: Tmlt_image_format; width: longint; height: longint); cdecl; external libmlt;
procedure mlt_image_get_values(self: Tmlt_image; data: Ppointer; format: Pmlt_image_format; width: Plongint; height: Plongint); cdecl; external libmlt;
procedure mlt_image_alloc_data(self: Tmlt_image); cdecl; external libmlt;
procedure mlt_image_alloc_alpha(self: Tmlt_image); cdecl; external libmlt;
function mlt_image_calculate_size(self: Tmlt_image): longint; cdecl; external libmlt;
procedure mlt_image_fill_black(self: Tmlt_image); cdecl; external libmlt;
procedure mlt_image_fill_checkerboard(self: Tmlt_image; sample_aspect_ratio: double); cdecl; external libmlt;
procedure mlt_image_fill_white(self: Tmlt_image; full_range: longint); cdecl; external libmlt;
procedure mlt_image_fill_opaque(self: Tmlt_image); cdecl; external libmlt;
function mlt_image_format_name(format: Tmlt_image_format): pchar; cdecl; external libmlt;
function mlt_image_format_id(name: pchar): Tmlt_image_format; cdecl; external libmlt;
function mlt_image_rgba_opaque(image: Puint8_t; width: longint; height: longint): longint; cdecl; external libmlt;
function mlt_image_format_size(format: Tmlt_image_format; width: longint; height: longint; bpp: Plongint): longint; cdecl; external libmlt;
procedure mlt_image_format_planes(format: Tmlt_image_format; width: longint; height: longint; data: pointer; planes: PPuint8_t; strides: PLongint); cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:36:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
