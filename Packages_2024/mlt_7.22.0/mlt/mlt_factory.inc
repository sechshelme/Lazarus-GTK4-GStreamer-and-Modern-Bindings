{$IFDEF read_interface}


function mlt_factory_init(directory: pchar): Tmlt_repository; cdecl; external libmlt;
function mlt_factory_repository: Tmlt_repository; cdecl; external libmlt;
function mlt_factory_directory: pchar; cdecl; external libmlt;
function mlt_environment(name: pchar): pchar; cdecl; external libmlt;
function mlt_environment_set(name: pchar; value: pchar): longint; cdecl; external libmlt;
function mlt_factory_event_object: Tmlt_properties; cdecl; external libmlt;
function mlt_factory_producer(profile: Tmlt_profile; service: pchar; resource: pointer): Tmlt_producer; cdecl; external libmlt;
function mlt_factory_filter(profile: Tmlt_profile; service: pchar; input: pointer): Tmlt_filter; cdecl; external libmlt;
function mlt_factory_link(service: pchar; input: pointer): Tmlt_link; cdecl; external libmlt;
function mlt_factory_transition(profile: Tmlt_profile; service: pchar; input: pointer): Tmlt_transition; cdecl; external libmlt;
function mlt_factory_consumer(profile: Tmlt_profile; service: pchar; input: pointer): Tmlt_consumer; cdecl; external libmlt;
procedure mlt_factory_register_for_clean_up(ptr: pointer; destruc: Tmlt_destructor); cdecl; external libmlt;
procedure mlt_factory_close; cdecl; external libmlt;
function mlt_global_properties: Tmlt_properties; cdecl; external libmlt;

  // === Konventiert am: 30-9-26 19:27:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
