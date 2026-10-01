unit mlt_filter;

interface

uses
  fp_mlt, mlt_types, mlt_service, mlt_properties;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pmlt_filter_s = ^Tmlt_filter_s;
  Tmlt_filter_s = record
    parent: Tmlt_service_s;
    close: procedure(para1: Tmlt_filter); cdecl;
    process: function(para1: Tmlt_filter; para2: Tmlt_frame): Tmlt_frame; cdecl;
    child: pointer;
  end;

function mlt_filter_init(self: Tmlt_filter; child: pointer): longint; cdecl; external libmlt;
function mlt_filter_new: Tmlt_filter; cdecl; external libmlt;
function mlt_filter_service(self: Tmlt_filter): Tmlt_service; cdecl; external libmlt;
function mlt_filter_properties(self: Tmlt_filter): Tmlt_properties; cdecl; external libmlt;
function mlt_filter_process(self: Tmlt_filter; that: Tmlt_frame): Tmlt_frame; cdecl; external libmlt;
function mlt_filter_connect(self: Tmlt_filter; producer: Tmlt_service; index: longint): longint; cdecl; external libmlt;
procedure mlt_filter_set_in_and_out(self: Tmlt_filter; in_: Tmlt_position; out_: Tmlt_position); cdecl; external libmlt;
function mlt_filter_get_track(self: Tmlt_filter): longint; cdecl; external libmlt;
function mlt_filter_get_in(self: Tmlt_filter): Tmlt_position; cdecl; external libmlt;
function mlt_filter_get_out(self: Tmlt_filter): Tmlt_position; cdecl; external libmlt;
function mlt_filter_get_length(self: Tmlt_filter): Tmlt_position; cdecl; external libmlt;
function mlt_filter_get_length2(self: Tmlt_filter; frame: Tmlt_frame): Tmlt_position; cdecl; external libmlt;
function mlt_filter_get_position(self: Tmlt_filter; frame: Tmlt_frame): Tmlt_position; cdecl; external libmlt;
function mlt_filter_get_progress(self: Tmlt_filter; frame: Tmlt_frame): double; cdecl; external libmlt;
procedure mlt_filter_close(para1: Tmlt_filter); cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:26:58 ===


implementation


end.
