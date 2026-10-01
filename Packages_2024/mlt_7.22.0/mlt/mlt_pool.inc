{$IFDEF read_interface}

procedure mlt_pool_init; cdecl; external libmlt;
function mlt_pool_alloc(size: longint): pointer; cdecl; external libmlt;
function mlt_pool_realloc(ptr: pointer; size: longint): pointer; cdecl; external libmlt;
procedure mlt_pool_release(release: pointer); cdecl; external libmlt;
procedure mlt_pool_purge; cdecl; external libmlt;
procedure mlt_pool_close; cdecl; external libmlt;
procedure mlt_pool_stat; cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:36:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
