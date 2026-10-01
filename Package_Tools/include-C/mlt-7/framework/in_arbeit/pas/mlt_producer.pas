unit mlt_producer;

interface

uses
  fp_mlt, mlt_types, mlt_service, mlt_properties;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pmlt_producer_s = ^Tmlt_producer_s;
  Tmlt_producer_s = record
    parent: Tmlt_service_s;
    get_frame: function(para1: Tmlt_producer; para2: Tmlt_frame_ptr; para3: longint): longint; cdecl;
    seek: function(para1: Tmlt_producer; para2: Tmlt_position): longint; cdecl;
    set_in_and_out: function(para1: Tmlt_producer; para2: Tmlt_position; para3: Tmlt_position): longint; cdecl;
    close: Tmlt_destructor;
    close_object: pointer;
    local: pointer;
    child: pointer;
  end;

function mlt_producer_init(self: Tmlt_producer; child: pointer): longint; cdecl; external libmlt;
function mlt_producer_new(para1: Tmlt_profile): Tmlt_producer; cdecl; external libmlt;
function mlt_producer_service(self: Tmlt_producer): Tmlt_service; cdecl; external libmlt;
function mlt_producer_properties(self: Tmlt_producer): Tmlt_properties; cdecl; external libmlt;
function mlt_producer_seek(self: Tmlt_producer; position: Tmlt_position): longint; cdecl; external libmlt;
function mlt_producer_seek_time(self: Tmlt_producer; time: pchar): longint; cdecl; external libmlt;
function mlt_producer_position(self: Tmlt_producer): Tmlt_position; cdecl; external libmlt;
function mlt_producer_frame(self: Tmlt_producer): Tmlt_position; cdecl; external libmlt;
function mlt_producer_frame_time(self: Tmlt_producer; para2: Tmlt_time_format): pchar; cdecl; external libmlt;
function mlt_producer_set_speed(self: Tmlt_producer; speed: double): longint; cdecl; external libmlt;
function mlt_producer_get_speed(self: Tmlt_producer): double; cdecl; external libmlt;
function mlt_producer_get_fps(self: Tmlt_producer): double; cdecl; external libmlt;
function mlt_producer_set_in_and_out(self: Tmlt_producer; in_: Tmlt_position; out_: Tmlt_position): longint; cdecl; external libmlt;
function mlt_producer_clear(self: Tmlt_producer): longint; cdecl; external libmlt;
function mlt_producer_get_in(self: Tmlt_producer): Tmlt_position; cdecl; external libmlt;
function mlt_producer_get_out(self: Tmlt_producer): Tmlt_position; cdecl; external libmlt;
function mlt_producer_get_playtime(self: Tmlt_producer): Tmlt_position; cdecl; external libmlt;
function mlt_producer_get_length(self: Tmlt_producer): Tmlt_position; cdecl; external libmlt;
function mlt_producer_get_length_time(self: Tmlt_producer; para2: Tmlt_time_format): pchar; cdecl; external libmlt;
procedure mlt_producer_prepare_next(self: Tmlt_producer); cdecl; external libmlt;
function mlt_producer_attach(self: Tmlt_producer; filter: Tmlt_filter): longint; cdecl; external libmlt;
function mlt_producer_detach(self: Tmlt_producer; filter: Tmlt_filter): longint; cdecl; external libmlt;
function mlt_producer_filter(self: Tmlt_producer; index: longint): Tmlt_filter; cdecl; external libmlt;
function mlt_producer_cut(self: Tmlt_producer; in_: longint; out_: longint): Tmlt_producer; cdecl; external libmlt;
function mlt_producer_is_cut(self: Tmlt_producer): longint; cdecl; external libmlt;
function mlt_producer_is_mix(self: Tmlt_producer): longint; cdecl; external libmlt;
function mlt_producer_is_blank(self: Tmlt_producer): longint; cdecl; external libmlt;
function mlt_producer_cut_parent(self: Tmlt_producer): Tmlt_producer; cdecl; external libmlt;
function mlt_producer_optimise(self: Tmlt_producer): longint; cdecl; external libmlt;
procedure mlt_producer_close(self: Tmlt_producer); cdecl; external libmlt;
function mlt_producer_get_creation_time(self: Tmlt_producer): Tint64_t; cdecl; external libmlt;
procedure mlt_producer_set_creation_time(self: Tmlt_producer; creation_time: Tint64_t); cdecl; external libmlt;
function mlt_producer_probe(self: Tmlt_producer): longint; cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:35:58 ===


implementation

end.
