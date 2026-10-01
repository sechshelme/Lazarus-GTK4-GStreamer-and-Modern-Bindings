{$IFDEF read_interface}


function mlt_parser_new: Tmlt_parser; cdecl; external libmlt;
function mlt_parser_properties(self: Tmlt_parser): Tmlt_properties; cdecl; external libmlt;
function mlt_parser_start(self: Tmlt_parser; obj: Tmlt_service): longint; cdecl; external libmlt;
procedure mlt_parser_close(self: Tmlt_parser); cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:36:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
