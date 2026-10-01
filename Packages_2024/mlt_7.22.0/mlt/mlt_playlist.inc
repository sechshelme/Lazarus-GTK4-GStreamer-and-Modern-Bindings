{$IFDEF read_interface}


type
  Pmlt_playlist_clip_info = ^Tmlt_playlist_clip_info;
  Tmlt_playlist_clip_info = record
    clip: longint;
    producer: Tmlt_producer;
    cut: Tmlt_producer;
    start: Tmlt_position;
    resource: pchar;
    frame_in: Tmlt_position;
    frame_out: Tmlt_position;
    frame_count: Tmlt_position;
    length: Tmlt_position;
    fps: single;
    _repeat: longint;
  end;

  Pplaylist_entry = type Pointer;

function mlt_playlist_init: Tmlt_playlist; cdecl; external libmlt;
function mlt_playlist_new(profile: Tmlt_profile): Tmlt_playlist; cdecl; external libmlt;
function mlt_playlist_producer(self: Tmlt_playlist): Tmlt_producer; cdecl; external libmlt;
function mlt_playlist_service(self: Tmlt_playlist): Tmlt_service; cdecl; external libmlt;
function mlt_playlist_properties(self: Tmlt_playlist): Tmlt_properties; cdecl; external libmlt;
function mlt_playlist_count(self: Tmlt_playlist): longint; cdecl; external libmlt;
function mlt_playlist_clear(self: Tmlt_playlist): longint; cdecl; external libmlt;
function mlt_playlist_append(self: Tmlt_playlist; producer: Tmlt_producer): longint; cdecl; external libmlt;
function mlt_playlist_append_io(self: Tmlt_playlist; producer: Tmlt_producer; in_: Tmlt_position; out_: Tmlt_position): longint; cdecl; external libmlt;
function mlt_playlist_blank(self: Tmlt_playlist; out_: Tmlt_position): longint; cdecl; external libmlt;
function mlt_playlist_blank_time(self: Tmlt_playlist; length: pchar): longint; cdecl; external libmlt;
function mlt_playlist_clip(self: Tmlt_playlist; whence: Tmlt_whence; index: longint): Tmlt_position; cdecl; external libmlt;
function mlt_playlist_current_clip(self: Tmlt_playlist): longint; cdecl; external libmlt;
function mlt_playlist_current(self: Tmlt_playlist): Tmlt_producer; cdecl; external libmlt;
function mlt_playlist_get_clip_info(self: Tmlt_playlist; info: Pmlt_playlist_clip_info; index: longint): longint; cdecl; external libmlt;
function mlt_playlist_insert(self: Tmlt_playlist; producer: Tmlt_producer; where: longint; in_: Tmlt_position; out_: Tmlt_position): longint; cdecl; external libmlt;
function mlt_playlist_remove(self: Tmlt_playlist; where: longint): longint; cdecl; external libmlt;
function mlt_playlist_move(self: Tmlt_playlist; from: longint; to_: longint): longint; cdecl; external libmlt;
function mlt_playlist_reorder(self: Tmlt_playlist; indices: Plongint): longint; cdecl; external libmlt;
function mlt_playlist_resize_clip(self: Tmlt_playlist; clip: longint; in_: Tmlt_position; out_: Tmlt_position): longint; cdecl; external libmlt;
function mlt_playlist_repeat_clip(self: Tmlt_playlist; clip: longint; _repeat: longint): longint; cdecl; external libmlt;
function mlt_playlist_split(self: Tmlt_playlist; clip: longint; position: Tmlt_position): longint; cdecl; external libmlt;
function mlt_playlist_split_at(self: Tmlt_playlist; position: Tmlt_position; left: longint): longint; cdecl; external libmlt;
function mlt_playlist_join(self: Tmlt_playlist; clip: longint; count: longint; merge: longint): longint; cdecl; external libmlt;
function mlt_playlist_mix(self: Tmlt_playlist; clip: longint; length: longint; transition: Tmlt_transition): longint; cdecl; external libmlt;
function mlt_playlist_mix_in(self: Tmlt_playlist; clip: longint; length: longint): longint; cdecl; external libmlt;
function mlt_playlist_mix_out(self: Tmlt_playlist; clip: longint; length: longint): longint; cdecl; external libmlt;
function mlt_playlist_mix_add(self: Tmlt_playlist; clip: longint; transition: Tmlt_transition): longint; cdecl; external libmlt;
function mlt_playlist_get_clip(self: Tmlt_playlist; clip: longint): Tmlt_producer; cdecl; external libmlt;
function mlt_playlist_get_clip_at(self: Tmlt_playlist; position: Tmlt_position): Tmlt_producer; cdecl; external libmlt;
function mlt_playlist_get_clip_index_at(self: Tmlt_playlist; position: Tmlt_position): longint; cdecl; external libmlt;
function mlt_playlist_clip_is_mix(self: Tmlt_playlist; clip: longint): longint; cdecl; external libmlt;
procedure mlt_playlist_consolidate_blanks(self: Tmlt_playlist; keep_length: longint); cdecl; external libmlt;
function mlt_playlist_is_blank(self: Tmlt_playlist; clip: longint): longint; cdecl; external libmlt;
function mlt_playlist_is_blank_at(self: Tmlt_playlist; position: Tmlt_position): longint; cdecl; external libmlt;
procedure mlt_playlist_insert_blank(self: Tmlt_playlist; clip: longint; out_: longint); cdecl; external libmlt;
procedure mlt_playlist_pad_blanks(self: Tmlt_playlist; position: Tmlt_position; length: longint; find: longint); cdecl; external libmlt;
function mlt_playlist_replace_with_blank(self: Tmlt_playlist; clip: longint): Tmlt_producer; cdecl; external libmlt;
function mlt_playlist_insert_at(self: Tmlt_playlist; position: Tmlt_position; producer: Tmlt_producer; mode: longint): longint; cdecl; external libmlt;
function mlt_playlist_clip_start(self: Tmlt_playlist; clip: longint): longint; cdecl; external libmlt;
function mlt_playlist_clip_length(self: Tmlt_playlist; clip: longint): longint; cdecl; external libmlt;
function mlt_playlist_blanks_from(self: Tmlt_playlist; clip: longint; bounded: longint): longint; cdecl; external libmlt;
function mlt_playlist_remove_region(self: Tmlt_playlist; position: Tmlt_position; length: longint): longint; cdecl; external libmlt;
procedure mlt_playlist_close(self: Tmlt_playlist); cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:36:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
