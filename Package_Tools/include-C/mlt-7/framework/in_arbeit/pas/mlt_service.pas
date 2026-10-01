unit mlt_service;

interface

uses
  fp_mlt, mlt_types, mlt_properties;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pmlt_service_s = ^Tmlt_service_s;
  Tmlt_service_s = record
    parent: Tmlt_properties_s;
    get_frame: function(self: Tmlt_service; frame: Tmlt_frame_ptr; index: longint): longint; cdecl;
    close: Tmlt_destructor;
    close_object: pointer;
    local: pointer;
    child: pointer;
  end;

function mlt_service_init(self: Tmlt_service; child: pointer): longint; cdecl; external libmlt;
procedure mlt_service_lock(self: Tmlt_service); cdecl; external libmlt;
procedure mlt_service_unlock(self: Tmlt_service); cdecl; external libmlt;
function mlt_service_identify(self: Tmlt_service): Tmlt_service_type; cdecl; external libmlt;
function mlt_service_connect_producer(self: Tmlt_service; producer: Tmlt_service; index: longint): longint; cdecl; external libmlt;
function mlt_service_insert_producer(self: Tmlt_service; producer: Tmlt_service; index: longint): longint; cdecl; external libmlt;
function mlt_service_disconnect_producer(self: Tmlt_service; index: longint): longint; cdecl; external libmlt;
function mlt_service_disconnect_all_producers(self: Tmlt_service): longint; cdecl; external libmlt;
function mlt_service_get_producer(self: Tmlt_service): Tmlt_service; cdecl; external libmlt;
function mlt_service_get_frame(self: Tmlt_service; frame: Tmlt_frame_ptr; index: longint): longint; cdecl; external libmlt;
function mlt_service_properties(self: Tmlt_service): Tmlt_properties; cdecl; external libmlt;
function mlt_service_consumer(self: Tmlt_service): Tmlt_service; cdecl; external libmlt;
function mlt_service_producer(self: Tmlt_service): Tmlt_service; cdecl; external libmlt;
function mlt_service_attach(self: Tmlt_service; filter: Tmlt_filter): longint; cdecl; external libmlt;
function mlt_service_detach(self: Tmlt_service; filter: Tmlt_filter): longint; cdecl; external libmlt;
procedure mlt_service_apply_filters(self: Tmlt_service; frame: Tmlt_frame; index: longint); cdecl; external libmlt;
function mlt_service_filter_count(self: Tmlt_service): longint; cdecl; external libmlt;
function mlt_service_move_filter(self: Tmlt_service; from: longint; to_: longint): longint; cdecl; external libmlt;
function mlt_service_filter(self: Tmlt_service; index: longint): Tmlt_filter; cdecl; external libmlt;
function mlt_service_profile(self: Tmlt_service): Tmlt_profile; cdecl; external libmlt;
procedure mlt_service_set_profile(self: Tmlt_service; profile: Tmlt_profile); cdecl; external libmlt;
procedure mlt_service_close(self: Tmlt_service); cdecl; external libmlt;
procedure mlt_service_cache_put(self: Tmlt_service; name: pchar; data: pointer; size: longint; destruc: Tmlt_destructor); cdecl; external libmlt;
function mlt_service_cache_get(self: Tmlt_service; name: pchar): Tmlt_cache_item; cdecl; external libmlt;
procedure mlt_service_cache_set_size(self: Tmlt_service; name: pchar; size: longint); cdecl; external libmlt;
function mlt_service_cache_get_size(self: Tmlt_service; name: pchar): longint; cdecl; external libmlt;
procedure mlt_service_cache_purge(self: Tmlt_service); cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:44:51 ===


implementation

end.
