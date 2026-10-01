unit mlt_consumer;

interface

uses
  fp_mlt, mlt_types, mlt_service, mlt_properties;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pmlt_consumer_s = ^Tmlt_consumer_s;
  Tmlt_consumer_s = record
    parent: Tmlt_service_s;
    start: function(para1: Tmlt_consumer): longint; cdecl;
    stop: function(para1: Tmlt_consumer): longint; cdecl;
    is_stopped: function(para1: Tmlt_consumer): longint; cdecl;
    purge: procedure(para1: Tmlt_consumer); cdecl;
    close: procedure(para1: Tmlt_consumer); cdecl;
    local_: pointer;
    child: pointer;
  end;

function mlt_consumer_init(self: Tmlt_consumer; child: pointer; profile: Tmlt_profile): longint; cdecl; external libmlt;
function mlt_consumer_new(profile: Tmlt_profile): Tmlt_consumer; cdecl; external libmlt;
function mlt_consumer_service(self: Tmlt_consumer): Tmlt_service; cdecl; external libmlt;
function mlt_consumer_properties(self: Tmlt_consumer): Tmlt_properties; cdecl; external libmlt;
function mlt_consumer_connect(self: Tmlt_consumer; producer: Tmlt_service): longint; cdecl; external libmlt;
function mlt_consumer_start(self: Tmlt_consumer): longint; cdecl; external libmlt;
procedure mlt_consumer_purge(self: Tmlt_consumer); cdecl; external libmlt;
function mlt_consumer_put_frame(self: Tmlt_consumer; frame: Tmlt_frame): longint; cdecl; external libmlt;
function mlt_consumer_get_frame(self: Tmlt_consumer): Tmlt_frame; cdecl; external libmlt;
function mlt_consumer_rt_frame(self: Tmlt_consumer): Tmlt_frame; cdecl; external libmlt;
function mlt_consumer_stop(self: Tmlt_consumer): longint; cdecl; external libmlt;
function mlt_consumer_is_stopped(self: Tmlt_consumer): longint; cdecl; external libmlt;
procedure mlt_consumer_stopped(self: Tmlt_consumer); cdecl; external libmlt;
procedure mlt_consumer_close(para1: Tmlt_consumer); cdecl; external libmlt;
function mlt_consumer_position(para1: Tmlt_consumer): Tmlt_position; cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:27:17 ===


implementation

end.
