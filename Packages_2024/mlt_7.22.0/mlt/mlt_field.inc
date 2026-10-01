{$IFDEF read_interface}


function mlt_field_init: Tmlt_field; cdecl; external libmlt;
function mlt_field_new(multitrack: Tmlt_multitrack; tractor: Tmlt_tractor): Tmlt_field; cdecl; external libmlt;
function mlt_field_service(self: Tmlt_field): Tmlt_service; cdecl; external libmlt;
function mlt_field_tractor(self: Tmlt_field): Tmlt_tractor; cdecl; external libmlt;
function mlt_field_multitrack(self: Tmlt_field): Tmlt_multitrack; cdecl; external libmlt;
function mlt_field_properties(self: Tmlt_field): Tmlt_properties; cdecl; external libmlt;
function mlt_field_plant_filter(self: Tmlt_field; that: Tmlt_filter; track: longint): longint; cdecl; external libmlt;
function mlt_field_plant_transition(self: Tmlt_field; that: Tmlt_transition; a_track: longint; b_track: longint): longint; cdecl; external libmlt;
procedure mlt_field_close(self: Tmlt_field); cdecl; external libmlt;
procedure mlt_field_disconnect_service(self: Tmlt_field; service: Tmlt_service); cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:27:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
