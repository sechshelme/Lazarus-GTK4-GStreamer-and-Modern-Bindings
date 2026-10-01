{$IFDEF read_interface}


function mlt_properties_init(para1: Tmlt_properties; child: pointer): longint; cdecl; external libmlt;
function mlt_properties_new: Tmlt_properties; cdecl; external libmlt;
function mlt_properties_set_lcnumeric(para1: Tmlt_properties; locale: pchar): longint; cdecl; external libmlt;
function mlt_properties_get_lcnumeric(self: Tmlt_properties): pchar; cdecl; external libmlt;
function mlt_properties_load(file_: pchar): Tmlt_properties; cdecl; external libmlt;
function mlt_properties_preset(self: Tmlt_properties; name: pchar): longint; cdecl; external libmlt;
function mlt_properties_inc_ref(self: Tmlt_properties): longint; cdecl; external libmlt;
function mlt_properties_dec_ref(self: Tmlt_properties): longint; cdecl; external libmlt;
function mlt_properties_ref_count(self: Tmlt_properties): longint; cdecl; external libmlt;
procedure mlt_properties_mirror(self: Tmlt_properties; that: Tmlt_properties); cdecl; external libmlt;
function mlt_properties_inherit(self: Tmlt_properties; that: Tmlt_properties): longint; cdecl; external libmlt;
function mlt_properties_copy(self: Tmlt_properties; that: Tmlt_properties; prefix: pchar): longint; cdecl; external libmlt;
function mlt_properties_pass(self: Tmlt_properties; that: Tmlt_properties; prefix: pchar): longint; cdecl; external libmlt;
procedure mlt_properties_pass_property(self: Tmlt_properties; that: Tmlt_properties; name: pchar); cdecl; external libmlt;
function mlt_properties_pass_list(self: Tmlt_properties; that: Tmlt_properties; list: pchar): longint; cdecl; external libmlt;
function mlt_properties_set(self: Tmlt_properties; name: pchar; value: pchar): longint; cdecl; external libmlt;
function mlt_properties_set_or_default(self: Tmlt_properties; name: pchar; value: pchar; def: pchar): longint; cdecl; external libmlt;
function mlt_properties_set_string(self: Tmlt_properties; name: pchar; value: pchar): longint; cdecl; external libmlt;
function mlt_properties_parse(self: Tmlt_properties; namevalue: pchar): longint; cdecl; external libmlt;
function mlt_properties_get(self: Tmlt_properties; name: pchar): pchar; cdecl; external libmlt;
function mlt_properties_get_name(self: Tmlt_properties; index: longint): pchar; cdecl; external libmlt;
function mlt_properties_get_value_tf(self: Tmlt_properties; index: longint; para3: Tmlt_time_format): pchar; cdecl; external libmlt;
function mlt_properties_get_value(self: Tmlt_properties; index: longint): pchar; cdecl; external libmlt;
function mlt_properties_get_data_at(self: Tmlt_properties; index: longint; size: Plongint): pointer; cdecl; external libmlt;
function mlt_properties_get_int(self: Tmlt_properties; name: pchar): longint; cdecl; external libmlt;
function mlt_properties_set_int(self: Tmlt_properties; name: pchar; value: longint): longint; cdecl; external libmlt;
function mlt_properties_get_int64(self: Tmlt_properties; name: pchar): Tint64_t; cdecl; external libmlt;
function mlt_properties_set_int64(self: Tmlt_properties; name: pchar; value: Tint64_t): longint; cdecl; external libmlt;
function mlt_properties_get_double(self: Tmlt_properties; name: pchar): double; cdecl; external libmlt;
function mlt_properties_set_double(self: Tmlt_properties; name: pchar; value: double): longint; cdecl; external libmlt;
function mlt_properties_get_position(self: Tmlt_properties; name: pchar): Tmlt_position; cdecl; external libmlt;
function mlt_properties_set_position(self: Tmlt_properties; name: pchar; value: Tmlt_position): longint; cdecl; external libmlt;
function mlt_properties_set_data(self: Tmlt_properties; name: pchar; value: pointer; length: longint; para5: Tmlt_destructor;
  para6: Tmlt_serialiser): longint; cdecl; external libmlt;
function mlt_properties_get_data(self: Tmlt_properties; name: pchar; length: Plongint): pointer; cdecl; external libmlt;
function mlt_properties_rename(self: Tmlt_properties; source: pchar; dest: pchar): longint; cdecl; external libmlt;
function mlt_properties_count(self: Tmlt_properties): longint; cdecl; external libmlt;
procedure mlt_properties_dump(self: Tmlt_properties; output: PFILE); cdecl; external libmlt;
procedure mlt_properties_debug(self: Tmlt_properties; title: pchar; output: PFILE); cdecl; external libmlt;
function mlt_properties_save(para1: Tmlt_properties; para2: pchar): longint; cdecl; external libmlt;
function mlt_properties_dir_list(para1: Tmlt_properties; para2: pchar; para3: pchar; para4: longint): longint; cdecl; external libmlt;
procedure mlt_properties_close(self: Tmlt_properties); cdecl; external libmlt;
function mlt_properties_is_sequence(self: Tmlt_properties): longint; cdecl; external libmlt;
function mlt_properties_parse_yaml(file_: pchar): Tmlt_properties; cdecl; external libmlt;
function mlt_properties_serialise_yaml(self: Tmlt_properties): pchar; cdecl; external libmlt;
procedure mlt_properties_lock(self: Tmlt_properties); cdecl; external libmlt;
procedure mlt_properties_unlock(self: Tmlt_properties); cdecl; external libmlt;
procedure mlt_properties_clear(self: Tmlt_properties; name: pchar); cdecl; external libmlt;
function mlt_properties_exists(self: Tmlt_properties; name: pchar): longint; cdecl; external libmlt;
function mlt_properties_get_time(para1: Tmlt_properties; name: pchar; para3: Tmlt_time_format): pchar; cdecl; external libmlt;
function mlt_properties_frames_to_time(para1: Tmlt_properties; para2: Tmlt_position; para3: Tmlt_time_format): pchar; cdecl; external libmlt;
function mlt_properties_time_to_frames(para1: Tmlt_properties; time: pchar): Tmlt_position; cdecl; external libmlt;
function mlt_properties_set_color(para1: Tmlt_properties; name: pchar; value: Tmlt_color): longint; cdecl; external libmlt;
function mlt_properties_get_color(para1: Tmlt_properties; name: pchar): Tmlt_color; cdecl; external libmlt;
function mlt_properties_anim_set_color(self: Tmlt_properties; name: pchar; value: Tmlt_color; position: longint; length: longint;
  keyframe_type: Tmlt_keyframe_type): longint; cdecl; external libmlt;
function mlt_properties_anim_get_color(self: Tmlt_properties; name: pchar; position: longint; length: longint): Tmlt_color; cdecl; external libmlt;
function mlt_properties_anim_get(self: Tmlt_properties; name: pchar; position: longint; length: longint): pchar; cdecl; external libmlt;
function mlt_properties_anim_set(self: Tmlt_properties; name: pchar; value: pchar; position: longint; length: longint): longint; cdecl; external libmlt;
function mlt_properties_anim_get_int(self: Tmlt_properties; name: pchar; position: longint; length: longint): longint; cdecl; external libmlt;
function mlt_properties_anim_set_int(self: Tmlt_properties; name: pchar; value: longint; position: longint; length: longint;
  keyframe_type: Tmlt_keyframe_type): longint; cdecl; external libmlt;
function mlt_properties_anim_get_double(self: Tmlt_properties; name: pchar; position: longint; length: longint): double; cdecl; external libmlt;
function mlt_properties_anim_set_double(self: Tmlt_properties; name: pchar; value: double; position: longint; length: longint;
  keyframe_type: Tmlt_keyframe_type): longint; cdecl; external libmlt;
function mlt_properties_get_animation(self: Tmlt_properties; name: pchar): Tmlt_animation; cdecl; external libmlt;
function mlt_properties_is_anim(self: Tmlt_properties; name: pchar): longint; cdecl; external libmlt;
function mlt_properties_set_rect(self: Tmlt_properties; name: pchar; value: Tmlt_rect): longint; cdecl; external libmlt;
function mlt_properties_get_rect(self: Tmlt_properties; name: pchar): Tmlt_rect; cdecl; external libmlt;
function mlt_properties_anim_set_rect(self: Tmlt_properties; name: pchar; value: Tmlt_rect; position: longint; length: longint;
  keyframe_type: Tmlt_keyframe_type): longint; cdecl; external libmlt;
function mlt_properties_anim_get_rect(self: Tmlt_properties; name: pchar; position: longint; length: longint): Tmlt_rect; cdecl; external libmlt;
function mlt_properties_from_utf8(properties: Tmlt_properties; name_from: pchar; name_to: pchar): longint; cdecl; external libmlt;
function mlt_properties_to_utf8(properties: Tmlt_properties; name_from: pchar; name_to: pchar): longint; cdecl; external libmlt;
function mlt_properties_set_properties(self: Tmlt_properties; name: pchar; properties: Tmlt_properties): longint; cdecl; external libmlt;
function mlt_properties_get_properties(self: Tmlt_properties; name: pchar): Tmlt_properties; cdecl; external libmlt;
function mlt_properties_get_properties_at(self: Tmlt_properties; index: longint): Tmlt_properties; cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:44:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
