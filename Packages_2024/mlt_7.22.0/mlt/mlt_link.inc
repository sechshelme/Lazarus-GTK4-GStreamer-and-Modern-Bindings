{$IFDEF read_interface}


function mlt_link_init: Tmlt_link; cdecl; external libmlt;
function mlt_link_connect_next(self: Tmlt_link; next: Tmlt_producer; chain_profile: Tmlt_profile): longint; cdecl; external libmlt;
procedure mlt_link_close(self: Tmlt_link); cdecl; external libmlt;
function mlt_link_filter_init(profile: Tmlt_profile; _type: Tmlt_service_type; id: pchar; arg: pchar): Tmlt_link; cdecl; external libmlt;
function mlt_link_filter_metadata(_type: Tmlt_service_type; id: pchar; data: pointer): Tmlt_properties; cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:36:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}




{$ENDIF read_implementation}
