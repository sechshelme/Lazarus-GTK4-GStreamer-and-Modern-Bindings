unit mlt_tractor;

interface

uses
  fp_mlt, mlt_types, mlt_producer, mlt_service, mlt_properties;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pmlt_tractor_s = ^Tmlt_tractor_s;
  Tmlt_tractor_s = record
    parent: Tmlt_producer_s;
    producer: Tmlt_service;
  end;

function mlt_tractor_init: Tmlt_tractor; cdecl; external libmlt;
function mlt_tractor_new: Tmlt_tractor; cdecl; external libmlt;
function mlt_tractor_service(self: Tmlt_tractor): Tmlt_service; cdecl; external libmlt;
function mlt_tractor_producer(self: Tmlt_tractor): Tmlt_producer; cdecl; external libmlt;
function mlt_tractor_properties(self: Tmlt_tractor): Tmlt_properties; cdecl; external libmlt;
function mlt_tractor_field(self: Tmlt_tractor): Tmlt_field; cdecl; external libmlt;
function mlt_tractor_multitrack(self: Tmlt_tractor): Tmlt_multitrack; cdecl; external libmlt;
function mlt_tractor_connect(self: Tmlt_tractor; service: Tmlt_service): longint; cdecl; external libmlt;
procedure mlt_tractor_refresh(self: Tmlt_tractor); cdecl; external libmlt;
function mlt_tractor_set_track(self: Tmlt_tractor; producer: Tmlt_producer; index: longint): longint; cdecl; external libmlt;
function mlt_tractor_insert_track(self: Tmlt_tractor; producer: Tmlt_producer; index: longint): longint; cdecl; external libmlt;
function mlt_tractor_remove_track(self: Tmlt_tractor; index: longint): longint; cdecl; external libmlt;
function mlt_tractor_get_track(self: Tmlt_tractor; index: longint): Tmlt_producer; cdecl; external libmlt;
procedure mlt_tractor_close(self: Tmlt_tractor); cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:44:43 ===


implementation


end.
