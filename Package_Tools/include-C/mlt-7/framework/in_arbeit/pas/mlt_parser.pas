unit mlt_parser;

interface

uses
  fp_mlt, mlt_types, mlt_properties;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pmlt_parser_s = ^Tmlt_parser_s;
  Tmlt_parser_s = record
    parent: Tmlt_properties_s;
    on_invalid: function(self: Tmlt_parser; obj: Tmlt_service): longint; cdecl;
    on_unknown: function(self: Tmlt_parser; obj: Tmlt_service): longint; cdecl;
    on_start_producer: function(self: Tmlt_parser; obj: Tmlt_producer): longint; cdecl;
    on_end_producer: function(self: Tmlt_parser; obj: Tmlt_producer): longint; cdecl;
    on_start_playlist: function(self: Tmlt_parser; obj: Tmlt_playlist): longint; cdecl;
    on_end_playlist: function(self: Tmlt_parser; obj: Tmlt_playlist): longint; cdecl;
    on_start_tractor: function(self: Tmlt_parser; obj: Tmlt_tractor): longint; cdecl;
    on_end_tractor: function(self: Tmlt_parser; obj: Tmlt_tractor): longint; cdecl;
    on_start_multitrack: function(self: Tmlt_parser; obj: Tmlt_multitrack): longint; cdecl;
    on_end_multitrack: function(self: Tmlt_parser; obj: Tmlt_multitrack): longint; cdecl;
    on_start_track: function(self: Tmlt_parser): longint; cdecl;
    on_end_track: function(self: Tmlt_parser): longint; cdecl;
    on_start_filter: function(self: Tmlt_parser; obj: Tmlt_filter): longint; cdecl;
    on_end_filter: function(self: Tmlt_parser; obj: Tmlt_filter): longint; cdecl;
    on_start_transition: function(self: Tmlt_parser; obj: Tmlt_transition): longint; cdecl;
    on_end_transition: function(self: Tmlt_parser; obj: Tmlt_transition): longint; cdecl;
    on_start_chain: function(self: Tmlt_parser; obj: Tmlt_chain): longint; cdecl;
    on_end_chain: function(self: Tmlt_parser; obj: Tmlt_chain): longint; cdecl;
    on_start_link: function(self: Tmlt_parser; obj: Tmlt_link): longint; cdecl;
    on_end_link: function(self: Tmlt_parser; obj: Tmlt_link): longint; cdecl;
  end;

function mlt_parser_new: Tmlt_parser; cdecl; external libmlt;
function mlt_parser_properties(self: Tmlt_parser): Tmlt_properties; cdecl; external libmlt;
function mlt_parser_start(self: Tmlt_parser; obj: Tmlt_service): longint; cdecl; external libmlt;
procedure mlt_parser_close(self: Tmlt_parser); cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:36:07 ===


implementation



end.
