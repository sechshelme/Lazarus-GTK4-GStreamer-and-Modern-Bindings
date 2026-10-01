{$IFDEF read_interface}


type
  Pmlt_event_data = ^Tmlt_event_data;
  Tmlt_event_data = record
    u: record
      case longint of
        0: (i: longint);
        1: (p: pointer);
      end;
  end;

  Pmlt_event_data_thread = ^Tmlt_event_data_thread;
  Tmlt_event_data_thread = record
    thread: ^pointer;
    priority: Plongint;
    _function: Tmlt_thread_function_t;
    data: pointer;
  end;

  Tmlt_listener = procedure(para1: Tmlt_properties; para2: pointer; para3: Tmlt_event_data); cdecl;

procedure mlt_events_init(self: Tmlt_properties); cdecl; external libmlt;
function mlt_events_register(self: Tmlt_properties; id: pchar): longint; cdecl; external libmlt;
function mlt_events_fire(self: Tmlt_properties; id: pchar; para3: Tmlt_event_data): longint; cdecl; external libmlt;
function mlt_events_listen(self: Tmlt_properties; listener_data: pointer; id: pchar; listener: Tmlt_listener): Tmlt_event; cdecl; external libmlt;
procedure mlt_events_block(self: Tmlt_properties; listener_data: pointer); cdecl; external libmlt;
procedure mlt_events_unblock(self: Tmlt_properties; listener_data: pointer); cdecl; external libmlt;
procedure mlt_events_disconnect(self: Tmlt_properties; listener_data: pointer); cdecl; external libmlt;
function mlt_events_setup_wait_for(self: Tmlt_properties; id: pchar): Tmlt_event; cdecl; external libmlt;
procedure mlt_events_wait_for(self: Tmlt_properties; event: Tmlt_event); cdecl; external libmlt;
procedure mlt_events_close_wait_for(self: Tmlt_properties; event: Tmlt_event); cdecl; external libmlt;
procedure mlt_event_inc_ref(self: Tmlt_event); cdecl; external libmlt;
procedure mlt_event_block(self: Tmlt_event); cdecl; external libmlt;
procedure mlt_event_unblock(self: Tmlt_event); cdecl; external libmlt;
procedure mlt_event_close(self: Tmlt_event); cdecl; external libmlt;
function mlt_event_data_none: Tmlt_event_data; cdecl; external libmlt;
function mlt_event_data_from_int(value: longint): Tmlt_event_data; cdecl; external libmlt;
function mlt_event_data_to_int(para1: Tmlt_event_data): longint; cdecl; external libmlt;
function mlt_event_data_from_string(value: pchar): Tmlt_event_data; cdecl; external libmlt;
function mlt_event_data_to_string(para1: Tmlt_event_data): pchar; cdecl; external libmlt;
function mlt_event_data_from_frame(para1: Tmlt_frame): Tmlt_event_data; cdecl; external libmlt;
function mlt_event_data_to_frame(para1: Tmlt_event_data): Tmlt_frame; cdecl; external libmlt;
function mlt_event_data_from_object(para1: pointer): Tmlt_event_data; cdecl; external libmlt;
function mlt_event_data_to_object(para1: Tmlt_event_data): pointer; cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:27:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
