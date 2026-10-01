{$IFDEF read_interface}


type
  Pmlt_locale_t = ^Tmlt_locale_t;
  Tmlt_locale_t = pointer;

function mlt_property_init: Tmlt_property; cdecl; external libmlt;
procedure mlt_property_clear(self: Tmlt_property); cdecl; external libmlt;
function mlt_property_is_clear(self: Tmlt_property): longint; cdecl; external libmlt;
function mlt_property_set_int(self: Tmlt_property; value: longint): longint; cdecl; external libmlt;
function mlt_property_set_double(self: Tmlt_property; value: double): longint; cdecl; external libmlt;
function mlt_property_set_position(self: Tmlt_property; value: Tmlt_position): longint; cdecl; external libmlt;
function mlt_property_set_int64(self: Tmlt_property; value: Tint64_t): longint; cdecl; external libmlt;
function mlt_property_set_string(self: Tmlt_property; value: pchar): longint; cdecl; external libmlt;
function mlt_property_set_data(self: Tmlt_property; value: pointer; length: longint; destruc: Tmlt_destructor; serialiser: Tmlt_serialiser): longint; cdecl; external libmlt;
function mlt_property_get_int(self: Tmlt_property; fps: double; para3: Tmlt_locale_t): longint; cdecl; external libmlt;
function mlt_property_get_double(self: Tmlt_property; fps: double; para3: Tmlt_locale_t): double; cdecl; external libmlt;
function mlt_property_get_position(self: Tmlt_property; fps: double; para3: Tmlt_locale_t): Tmlt_position; cdecl; external libmlt;
function mlt_property_get_int64(self: Tmlt_property): Tint64_t; cdecl; external libmlt;
function mlt_property_get_string_tf(self: Tmlt_property; para2: Tmlt_time_format): pchar; cdecl; external libmlt;
function mlt_property_get_string(self: Tmlt_property): pchar; cdecl; external libmlt;
function mlt_property_get_string_l_tf(self: Tmlt_property; para2: Tmlt_locale_t; para3: Tmlt_time_format): pchar; cdecl; external libmlt;
function mlt_property_get_string_l(self: Tmlt_property; para2: Tmlt_locale_t): pchar; cdecl; external libmlt;
function mlt_property_get_data(self: Tmlt_property; length: Plongint): pointer; cdecl; external libmlt;
procedure mlt_property_close(self: Tmlt_property); cdecl; external libmlt;
procedure mlt_property_pass(self: Tmlt_property; that: Tmlt_property); cdecl; external libmlt;
function mlt_property_get_time(self: Tmlt_property; para2: Tmlt_time_format; fps: double; para4: Tmlt_locale_t): pchar; cdecl; external libmlt;
function mlt_property_interpolate(self: Tmlt_property; points: Pmlt_property; progress: double; fps: double; locale: Tmlt_locale_t;
  interp: Tmlt_keyframe_type): longint; cdecl; external libmlt;
function mlt_property_anim_get_double(self: Tmlt_property; fps: double; locale: Tmlt_locale_t; position: longint; length: longint): double; cdecl; external libmlt;
function mlt_property_anim_get_int(self: Tmlt_property; fps: double; locale: Tmlt_locale_t; position: longint; length: longint): longint; cdecl; external libmlt;
function mlt_property_anim_get_string(self: Tmlt_property; fps: double; locale: Tmlt_locale_t; position: longint; length: longint): pchar; cdecl; external libmlt;
function mlt_property_anim_set_double(self: Tmlt_property; value: double; fps: double; locale: Tmlt_locale_t; position: longint;
  length: longint; keyframe_type: Tmlt_keyframe_type): longint; cdecl; external libmlt;
function mlt_property_anim_set_int(self: Tmlt_property; value: longint; fps: double; locale: Tmlt_locale_t; position: longint;
  length: longint; keyframe_type: Tmlt_keyframe_type): longint; cdecl; external libmlt;
function mlt_property_anim_set_string(self: Tmlt_property; value: pchar; fps: double; locale: Tmlt_locale_t; position: longint;
  length: longint): longint; cdecl; external libmlt;
function mlt_property_get_animation(self: Tmlt_property): Tmlt_animation; cdecl; external libmlt;
function mlt_property_is_anim(self: Tmlt_property): longint; cdecl; external libmlt;
function mlt_property_set_color(self: Tmlt_property; value: Tmlt_color): longint; cdecl; external libmlt;
function mlt_property_get_color(self: Tmlt_property; fps: double; locale: Tmlt_locale_t): Tmlt_color; cdecl; external libmlt;
function mlt_property_anim_set_color(self: Tmlt_property; value: Tmlt_color; fps: double; locale: Tmlt_locale_t; position: longint;
  length: longint; keyframe_type: Tmlt_keyframe_type): longint; cdecl; external libmlt;
function mlt_property_anim_get_color(self: Tmlt_property; fps: double; locale: Tmlt_locale_t; position: longint; length: longint): Tmlt_color; cdecl; external libmlt;
function mlt_property_set_rect(self: Tmlt_property; value: Tmlt_rect): longint; cdecl; external libmlt;
function mlt_property_get_rect(self: Tmlt_property; locale: Tmlt_locale_t): Tmlt_rect; cdecl; external libmlt;
function mlt_property_anim_set_rect(self: Tmlt_property; value: Tmlt_rect; fps: double; locale: Tmlt_locale_t; position: longint;
  length: longint; keyframe_type: Tmlt_keyframe_type): longint; cdecl; external libmlt;
function mlt_property_anim_get_rect(self: Tmlt_property; fps: double; locale: Tmlt_locale_t; position: longint; length: longint): Tmlt_rect; cdecl; external libmlt;
function mlt_property_set_properties(self: Tmlt_property; properties: Tmlt_properties): longint; cdecl; external libmlt;
function mlt_property_get_properties(self: Tmlt_property): Tmlt_properties; cdecl; external libmlt;
function mlt_property_is_color(self: Tmlt_property): longint; cdecl; external libmlt;
function mlt_property_is_numeric(self: Tmlt_property; locale: Tmlt_locale_t): longint; cdecl; external libmlt;
function mlt_property_is_rect(self: Tmlt_property): longint; cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:44:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
