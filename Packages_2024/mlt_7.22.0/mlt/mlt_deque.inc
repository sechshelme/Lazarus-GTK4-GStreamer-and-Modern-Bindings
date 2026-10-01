{$IFDEF read_interface}


type
  Tmlt_deque_compare = function(a: pointer; b: pointer): longint; cdecl;

function mlt_deque_init: Tmlt_deque; cdecl; external libmlt;
function mlt_deque_count(self: Tmlt_deque): longint; cdecl; external libmlt;
function mlt_deque_push_back(self: Tmlt_deque; item: pointer): longint; cdecl; external libmlt;
function mlt_deque_pop_back(self: Tmlt_deque): pointer; cdecl; external libmlt;
function mlt_deque_push_front(self: Tmlt_deque; item: pointer): longint; cdecl; external libmlt;
function mlt_deque_pop_front(self: Tmlt_deque): pointer; cdecl; external libmlt;
function mlt_deque_peek_back(self: Tmlt_deque): pointer; cdecl; external libmlt;
function mlt_deque_peek_front(self: Tmlt_deque): pointer; cdecl; external libmlt;
function mlt_deque_peek(self: Tmlt_deque; index: longint): pointer; cdecl; external libmlt;
function mlt_deque_insert(self: Tmlt_deque; item: pointer; para3: Tmlt_deque_compare): longint; cdecl; external libmlt;
function mlt_deque_push_back_int(self: Tmlt_deque; item: longint): longint; cdecl; external libmlt;
function mlt_deque_pop_back_int(self: Tmlt_deque): longint; cdecl; external libmlt;
function mlt_deque_push_front_int(self: Tmlt_deque; item: longint): longint; cdecl; external libmlt;
function mlt_deque_pop_front_int(self: Tmlt_deque): longint; cdecl; external libmlt;
function mlt_deque_peek_back_int(self: Tmlt_deque): longint; cdecl; external libmlt;
function mlt_deque_peek_front_int(self: Tmlt_deque): longint; cdecl; external libmlt;
function mlt_deque_push_back_double(self: Tmlt_deque; item: double): longint; cdecl; external libmlt;
function mlt_deque_pop_back_double(self: Tmlt_deque): double; cdecl; external libmlt;
function mlt_deque_push_front_double(self: Tmlt_deque; item: double): longint; cdecl; external libmlt;
function mlt_deque_pop_front_double(self: Tmlt_deque): double; cdecl; external libmlt;
function mlt_deque_peek_back_double(self: Tmlt_deque): double; cdecl; external libmlt;
function mlt_deque_peek_front_double(self: Tmlt_deque): double; cdecl; external libmlt;
procedure mlt_deque_close(self: Tmlt_deque); cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:27:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
