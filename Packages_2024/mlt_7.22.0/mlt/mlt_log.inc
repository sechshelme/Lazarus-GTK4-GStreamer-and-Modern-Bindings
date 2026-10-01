{$IFDEF read_interface}


const
  MLT_LOG_QUIET = -(8);
  MLT_LOG_PANIC = 0;
  MLT_LOG_FATAL = 8;
  MLT_LOG_ERROR = 16;
  MLT_LOG_WARNING = 24;
  MLT_LOG_INFO = 32;
  MLT_LOG_VERBOSE = 40;
  MLT_LOG_TIMINGS = 44;
  MLT_LOG_DEBUG = 48;

procedure mlt_log(service: pointer; level: longint; fmt: pchar); cdecl; varargs; external libmlt;
procedure mlt_vlog(service: pointer; level: longint; fmt: pchar; para4: Tva_list); cdecl; external libmlt;
function mlt_log_get_level: longint; cdecl; external libmlt;

type
  Tmlt_log_callback = procedure(user_data: Pointer; level: longint; const fmt: pansichar; args: Pointer); cdecl;

procedure mlt_log_set_level(level: longint); cdecl; external libmlt;
procedure mlt_log_set_callback(callback: Tmlt_log_callback); cdecl; external libmlt;
function mlt_log_timings_now: int64; cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:36:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
