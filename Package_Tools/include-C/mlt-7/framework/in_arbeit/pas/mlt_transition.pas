unit mlt_transition;

interface

uses
  fp_mlt, mlt_types, mlt_service, mlt_properties;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pmlt_transition_s = ^Tmlt_transition_s;
  Tmlt_transition_s = record
    parent: Tmlt_service_s;
    close: procedure(para1: Tmlt_transition); cdecl;
    process: function(para1: Tmlt_transition; para2: Tmlt_frame; para3: Tmlt_frame): Tmlt_frame; cdecl;
    child: pointer;
    producer: Tmlt_service;
    frames: Pmlt_frame;
    held: longint;
    mutex: Tpthread_mutex_t;
  end;

function mlt_transition_init(self: Tmlt_transition; child: pointer): longint; cdecl; external libmlt;
function mlt_transition_new: Tmlt_transition; cdecl; external libmlt;
function mlt_transition_service(self: Tmlt_transition): Tmlt_service; cdecl; external libmlt;
function mlt_transition_properties(self: Tmlt_transition): Tmlt_properties; cdecl; external libmlt;
function mlt_transition_connect(self: Tmlt_transition; producer: Tmlt_service; a_track: longint; b_track: longint): longint; cdecl; external libmlt;
procedure mlt_transition_set_in_and_out(self: Tmlt_transition; in_: Tmlt_position; out_: Tmlt_position); cdecl; external libmlt;
procedure mlt_transition_set_tracks(self: Tmlt_transition; a_track: longint; b_track: longint); cdecl; external libmlt;
function mlt_transition_get_a_track(self: Tmlt_transition): longint; cdecl; external libmlt;
function mlt_transition_get_b_track(self: Tmlt_transition): longint; cdecl; external libmlt;
function mlt_transition_get_in(self: Tmlt_transition): Tmlt_position; cdecl; external libmlt;
function mlt_transition_get_out(self: Tmlt_transition): Tmlt_position; cdecl; external libmlt;
function mlt_transition_get_length(self: Tmlt_transition): Tmlt_position; cdecl; external libmlt;
function mlt_transition_get_position(self: Tmlt_transition; frame: Tmlt_frame): Tmlt_position; cdecl; external libmlt;
function mlt_transition_get_progress(self: Tmlt_transition; frame: Tmlt_frame): double; cdecl; external libmlt;
function mlt_transition_get_progress_delta(self: Tmlt_transition; frame: Tmlt_frame): double; cdecl; external libmlt;
function mlt_transition_process(self: Tmlt_transition; a_frame: Tmlt_frame; b_frame: Tmlt_frame): Tmlt_frame; cdecl; external libmlt;
procedure mlt_transition_close(self: Tmlt_transition); cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:44:40 ===


implementation


end.
