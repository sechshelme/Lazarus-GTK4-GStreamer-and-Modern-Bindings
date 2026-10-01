unit mlt_multitrack;

interface

uses
  fp_mlt, mlt_types, mlt_service, mlt_properties, mlt_producer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pmlt_track_s = ^Tmlt_track_s;
  Tmlt_track_s = record
    producer: Tmlt_producer;
    event: Tmlt_event;
  end;

  Pmlt_track = ^Tmlt_track;
  Tmlt_track = Pmlt_track_s;

  Pmlt_multitrack_s = ^Tmlt_multitrack_s;
  Tmlt_multitrack_s = record
    parent: Tmlt_producer_s;
    list: Pmlt_track;
    size: longint;
    count: longint;
  end;

function mlt_multitrack_init: Tmlt_multitrack; cdecl; external libmlt;
function mlt_multitrack_producer(self: Tmlt_multitrack): Tmlt_producer; cdecl; external libmlt;
function mlt_multitrack_service(self: Tmlt_multitrack): Tmlt_service; cdecl; external libmlt;
function mlt_multitrack_properties(self: Tmlt_multitrack): Tmlt_properties; cdecl; external libmlt;
function mlt_multitrack_connect(self: Tmlt_multitrack; producer: Tmlt_producer; track: longint): longint; cdecl; external libmlt;
function mlt_multitrack_insert(self: Tmlt_multitrack; producer: Tmlt_producer; track: longint): longint; cdecl; external libmlt;
function mlt_multitrack_disconnect(self: Tmlt_multitrack; track: longint): longint; cdecl; external libmlt;
function mlt_multitrack_clip(self: Tmlt_multitrack; whence: Tmlt_whence; index: longint): Tmlt_position; cdecl; external libmlt;
procedure mlt_multitrack_close(self: Tmlt_multitrack); cdecl; external libmlt;
function mlt_multitrack_count(self: Tmlt_multitrack): longint; cdecl; external libmlt;
procedure mlt_multitrack_refresh(self: Tmlt_multitrack); cdecl; external libmlt;
function mlt_multitrack_track(self: Tmlt_multitrack; track: longint): Tmlt_producer; cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:36:11 ===


implementation


end.
