unit mlt_link;

interface

uses
  fp_mlt, mlt_types, mlt_producer, mlt_service, mlt_properties;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pmlt_link_s = ^Tmlt_link_s;
  Tmlt_link_s = record
    parent: Tmlt_producer_s;
    get_frame: function(para1: Tmlt_link; para2: Tmlt_frame_ptr; para3: longint): longint; cdecl;
    configure: procedure(para1: Tmlt_link; para2: Tmlt_profile); cdecl;
    close: procedure(para1: Tmlt_link); cdecl;
    next: Tmlt_producer;
    child: pointer;
  end;

function mlt_link_init: Tmlt_link; cdecl; external libmlt;
function mlt_link_connect_next(self: Tmlt_link; next: Tmlt_producer; chain_profile: Tmlt_profile): longint; cdecl; external libmlt;
procedure mlt_link_close(self: Tmlt_link); cdecl; external libmlt;
function mlt_link_filter_init(profile: Tmlt_profile; _type: Tmlt_service_type; id: pchar; arg: pchar): Tmlt_link; cdecl; external libmlt;
function mlt_link_filter_metadata(_type: Tmlt_service_type; id: pchar; data: pointer): Tmlt_properties; cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:36:21 ===


implementation




end.
