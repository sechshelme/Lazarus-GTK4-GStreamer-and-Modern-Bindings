{$IFDEF read_interface}


type
  Tmlt_get_image = function(self: Tmlt_frame; buffer: PPuint8_t; format: Pmlt_image_format; width: Plongint; height: Plongint; writable: longint): longint; cdecl;
  Tmlt_get_audio = function(self: Tmlt_frame; buffer: Ppointer; format: Pmlt_audio_format; frequency: Plongint; channels: Plongint; samples: Plongint): longint; cdecl;

function mlt_frame_init(service: Tmlt_service): Tmlt_frame; cdecl; external libmlt;
function mlt_frame_properties(self: Tmlt_frame): Tmlt_properties; cdecl; external libmlt;
function mlt_frame_is_test_card(self: Tmlt_frame): longint; cdecl; external libmlt;
function mlt_frame_is_test_audio(self: Tmlt_frame): longint; cdecl; external libmlt;
function mlt_frame_get_aspect_ratio(self: Tmlt_frame): double; cdecl; external libmlt;
function mlt_frame_set_aspect_ratio(self: Tmlt_frame; value: double): longint; cdecl; external libmlt;
function mlt_frame_get_position(self: Tmlt_frame): Tmlt_position; cdecl; external libmlt;
function mlt_frame_original_position(self: Tmlt_frame): Tmlt_position; cdecl; external libmlt;
function mlt_frame_set_position(self: Tmlt_frame; value: Tmlt_position): longint; cdecl; external libmlt;
function mlt_frame_set_image(self: Tmlt_frame; image: Puint8_t; size: longint; destroy: Tmlt_destructor): longint; cdecl; external libmlt;
function mlt_frame_set_alpha(self: Tmlt_frame; alpha: Puint8_t; size: longint; destroy: Tmlt_destructor): longint; cdecl; external libmlt;
procedure mlt_frame_replace_image(self: Tmlt_frame; image: Puint8_t; format: Tmlt_image_format; width: longint; height: longint); cdecl; external libmlt;
function mlt_frame_get_image(self: Tmlt_frame; buffer: PPuint8_t; format: Pmlt_image_format; width: Plongint; height: Plongint;
  writable: longint): longint; cdecl; external libmlt;
function mlt_frame_get_alpha(self: Tmlt_frame): Puint8_t; cdecl; external libmlt;
function mlt_frame_get_alpha_size(self: Tmlt_frame; size: Plongint): Puint8_t; cdecl; external libmlt;
function mlt_frame_get_audio(self: Tmlt_frame; buffer: Ppointer; format: Pmlt_audio_format; frequency: Plongint; channels: Plongint;
  samples: Plongint): longint; cdecl; external libmlt;
function mlt_frame_set_audio(self: Tmlt_frame; buffer: pointer; para3: Tmlt_audio_format; size: longint; para5: Tmlt_destructor): longint; cdecl; external libmlt;
function mlt_frame_get_waveform(self: Tmlt_frame; w: longint; h: longint): pbyte; cdecl; external libmlt;
function mlt_frame_push_get_image(self: Tmlt_frame; get_image: Tmlt_get_image): longint; cdecl; external libmlt;
function mlt_frame_pop_get_image(self: Tmlt_frame): Tmlt_get_image; cdecl; external libmlt;
function mlt_frame_push_frame(self: Tmlt_frame; that: Tmlt_frame): longint; cdecl; external libmlt;
function mlt_frame_pop_frame(self: Tmlt_frame): Tmlt_frame; cdecl; external libmlt;
function mlt_frame_push_service(self: Tmlt_frame; that: pointer): longint; cdecl; external libmlt;
function mlt_frame_pop_service(self: Tmlt_frame): pointer; cdecl; external libmlt;
function mlt_frame_push_service_int(self: Tmlt_frame; that: longint): longint; cdecl; external libmlt;
function mlt_frame_pop_service_int(self: Tmlt_frame): longint; cdecl; external libmlt;
function mlt_frame_push_audio(self: Tmlt_frame; that: pointer): longint; cdecl; external libmlt;
function mlt_frame_pop_audio(self: Tmlt_frame): pointer; cdecl; external libmlt;
function mlt_frame_service_stack(self: Tmlt_frame): Tmlt_deque; cdecl; external libmlt;
function mlt_frame_get_original_producer(self: Tmlt_frame): Tmlt_producer; cdecl; external libmlt;
procedure mlt_frame_close(self: Tmlt_frame); cdecl; external libmlt;
function mlt_frame_unique_properties(self: Tmlt_frame; service: Tmlt_service): Tmlt_properties; cdecl; external libmlt;
function mlt_frame_get_unique_properties(self: Tmlt_frame; service: Tmlt_service): Tmlt_properties; cdecl; external libmlt;
function mlt_frame_clone(self: Tmlt_frame; is_deep: longint): Tmlt_frame; cdecl; external libmlt;
function mlt_frame_clone_audio(self: Tmlt_frame; is_deep: longint): Tmlt_frame; cdecl; external libmlt;
function mlt_frame_clone_image(self: Tmlt_frame; is_deep: longint): Tmlt_frame; cdecl; external libmlt;
procedure mlt_frame_write_ppm(frame: Tmlt_frame); cdecl; external libmlt;

procedure RGB2YUV_601_SCALED(r, g, b: longint; out y, u, v: longint); inline;
procedure RGB2UV_601_SCALED(r, g, b: longint; out u, v: longint); inline;
procedure YUV2RGB_601_SCALED(y, u, v: longint; out r, g, b: longint); inline;

// === Konventiert am: 30-9-26 19:36:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


procedure RGB2YUV_601_SCALED(r, g, b: longint; out y, u, v: longint); inline;
begin
  y := ((263 * r + 516 * g + 100 * b) shr 10) + 16;
  u := ((-152 * r - 300 * g + 450 * b) shr 10) + 128;
  v := ((450 * r - 377 * g - 73 * b) shr 10) + 128;
end;

procedure RGB2UV_601_SCALED(r, g, b: longint; out u, v: longint); inline;
begin
  u := ((-152 * r - 300 * g + 450 * b) shr 10) + 128;
  v := ((450 * r - 377 * g - 73 * b) shr 10) + 128;
end;

procedure YUV2RGB_601_SCALED(y, u, v: longint; out r, g, b: longint); inline;
begin
  r := ((1192 * (y - 16) + 1634 * (v - 128)) shr 10);
  g := ((1192 * (y - 16) - 832 * (v - 128) - 401 * (u - 128)) shr 10);
  b := ((1192 * (y - 16) + 2066 * (u - 128)) shr 10);

  if r < 0 then begin
    r := 0;
  end else if r > 255 then begin
    r := 255;
  end;
  if g < 0 then begin
    g := 0;
  end else if g > 255 then begin
    g := 255;
  end;
  if b < 0 then begin
    b := 0;
  end else if b > 255 then begin
    b := 255;
  end;
end;


{$ENDIF read_implementation}
