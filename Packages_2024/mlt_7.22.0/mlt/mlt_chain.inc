{$IFDEF read_interface}


function mlt_chain_init(para1: Tmlt_profile): Tmlt_chain; cdecl; external libmlt;
procedure mlt_chain_set_source(self: Tmlt_chain; source: Tmlt_producer); cdecl; external libmlt;
function mlt_chain_get_source(self: Tmlt_chain): Tmlt_producer; cdecl; external libmlt;
function mlt_chain_attach(self: Tmlt_chain; link: Tmlt_link): longint; cdecl; external libmlt;
function mlt_chain_detach(self: Tmlt_chain; link: Tmlt_link): longint; cdecl; external libmlt;
function mlt_chain_link_count(self: Tmlt_chain): longint; cdecl; external libmlt;
function mlt_chain_move_link(self: Tmlt_chain; from: longint; to_: longint): longint; cdecl; external libmlt;
function mlt_chain_link(self: Tmlt_chain; index: longint): Tmlt_link; cdecl; external libmlt;
procedure mlt_chain_close(self: Tmlt_chain); cdecl; external libmlt;
procedure mlt_chain_attach_normalizers(self: Tmlt_chain); cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:27:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
