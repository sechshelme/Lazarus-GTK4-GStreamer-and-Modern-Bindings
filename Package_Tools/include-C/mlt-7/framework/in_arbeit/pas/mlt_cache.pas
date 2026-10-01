unit mlt_cache;

interface

uses
  fp_mlt, mlt_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function mlt_cache_item_data(item: Tmlt_cache_item; size: Plongint): pointer; cdecl; external libmlt;
procedure mlt_cache_item_close(item: Tmlt_cache_item); cdecl; external libmlt;
function mlt_cache_init: Tmlt_cache; cdecl; external libmlt;
procedure mlt_cache_set_size(cache: Tmlt_cache; size: longint); cdecl; external libmlt;
function mlt_cache_get_size(cache: Tmlt_cache): longint; cdecl; external libmlt;
procedure mlt_cache_close(cache: Tmlt_cache); cdecl; external libmlt;
procedure mlt_cache_purge(cache: Tmlt_cache; obj: pointer); cdecl; external libmlt;
procedure mlt_cache_put(cache: Tmlt_cache; obj: pointer; data: pointer; size: longint; destruc: Tmlt_destructor); cdecl; external libmlt;
function mlt_cache_get(cache: Tmlt_cache; obj: pointer): Tmlt_cache_item; cdecl; external libmlt;
procedure mlt_cache_put_frame(cache: Tmlt_cache; frame: Tmlt_frame); cdecl; external libmlt;
procedure mlt_cache_put_frame_audio(cache: Tmlt_cache; frame: Tmlt_frame); cdecl; external libmlt;
procedure mlt_cache_put_frame_image(cache: Tmlt_cache; frame: Tmlt_frame); cdecl; external libmlt;
function mlt_cache_get_frame(cache: Tmlt_cache; position: Tmlt_position): Tmlt_frame; cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:27:29 ===


implementation



end.
