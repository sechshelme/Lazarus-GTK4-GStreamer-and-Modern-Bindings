unit mlt_repository;

interface

uses
  fp_mlt, mlt_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tmlt_repository_callback = procedure(para1: Tmlt_repository); cdecl;
  Tmlt_register_callback = function(para1: Tmlt_profile; para2: Tmlt_service_type; para3: pchar; para4: pointer): pointer; cdecl;
  Tmlt_metadata_callback = function(para1: Tmlt_service_type; para2: pchar; para3: pointer): Tmlt_properties; cdecl;

function mlt_repository_init(directory: pchar): Tmlt_repository; cdecl; external libmlt;
procedure mlt_repository_register(self: Tmlt_repository; service_type: Tmlt_service_type; service: pchar; para4: Tmlt_register_callback); cdecl; external libmlt;
function mlt_repository_create(self: Tmlt_repository; profile: Tmlt_profile; _type: Tmlt_service_type; service: pchar; arg: pointer): pointer; cdecl; external libmlt;
procedure mlt_repository_close(self: Tmlt_repository); cdecl; external libmlt;
function mlt_repository_consumers(self: Tmlt_repository): Tmlt_properties; cdecl; external libmlt;
function mlt_repository_filters(self: Tmlt_repository): Tmlt_properties; cdecl; external libmlt;
function mlt_repository_links(self: Tmlt_repository): Tmlt_properties; cdecl; external libmlt;
function mlt_repository_producers(self: Tmlt_repository): Tmlt_properties; cdecl; external libmlt;
function mlt_repository_transitions(self: Tmlt_repository): Tmlt_properties; cdecl; external libmlt;
procedure mlt_repository_register_metadata(self: Tmlt_repository; _type: Tmlt_service_type; service: pchar; para4: Tmlt_metadata_callback; callback_data: pointer); cdecl; external libmlt;
function mlt_repository_metadata(self: Tmlt_repository; _type: Tmlt_service_type; service: pchar): Tmlt_properties; cdecl; external libmlt;
function mlt_repository_languages(self: Tmlt_repository): Tmlt_properties; cdecl; external libmlt;
function mlt_repository_presets: Tmlt_properties; cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:44:54 ===


implementation

end.
