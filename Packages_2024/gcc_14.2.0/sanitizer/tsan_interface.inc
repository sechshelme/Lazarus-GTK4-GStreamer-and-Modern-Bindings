{$IFDEF read_interface}



procedure __tsan_acquire(addr: pointer); cdecl; external libasan;
procedure __tsan_release(addr: pointer); cdecl; external libasan;

const
  __tsan_mutex_linker_init = 1 shl 0;
  __tsan_mutex_write_reentrant = 1 shl 1;
  __tsan_mutex_read_reentrant = 1 shl 2;
  __tsan_mutex_read_lock = 1 shl 3;
  __tsan_mutex_try_lock = 1 shl 4;
  __tsan_mutex_try_lock_failed = 1 shl 5;
  __tsan_mutex_recursive_lock = 1 shl 6;
  __tsan_mutex_recursive_unlock = 1 shl 7;
  __tsan_mutex_not_static = 1 shl 8;
  __tsan_mutex_try_read_lock = __tsan_mutex_read_lock or __tsan_mutex_try_lock;
  __tsan_mutex_try_read_lock_failed = __tsan_mutex_try_read_lock or __tsan_mutex_try_lock_failed;

procedure __tsan_mutex_create(addr: pointer; flags: dword); cdecl; external libasan;
procedure __tsan_mutex_destroy(addr: pointer; flags: dword); cdecl; external libasan;
procedure __tsan_mutex_pre_lock(addr: pointer; flags: dword); cdecl; external libasan;
procedure __tsan_mutex_post_lock(addr: pointer; flags: dword; recursion: longint); cdecl; external libasan;
function __tsan_mutex_pre_unlock(addr: pointer; flags: dword): longint; cdecl; external libasan;
procedure __tsan_mutex_post_unlock(addr: pointer; flags: dword); cdecl; external libasan;
procedure __tsan_mutex_pre_signal(addr: pointer; flags: dword); cdecl; external libasan;
procedure __tsan_mutex_post_signal(addr: pointer; flags: dword); cdecl; external libasan;
procedure __tsan_mutex_pre_divert(addr: pointer; flags: dword); cdecl; external libasan;
procedure __tsan_mutex_post_divert(addr: pointer; flags: dword); cdecl; external libasan;
procedure __tsan_check_no_mutexes_held; cdecl; external libasan;
function __tsan_external_register_tag(object_type: pchar): pointer; cdecl; external libasan;
procedure __tsan_external_register_header(tag: pointer; header: pchar); cdecl; external libasan;
procedure __tsan_external_assign_tag(addr: pointer; tag: pointer); cdecl; external libasan;
procedure __tsan_external_read(addr: pointer; caller_pc: pointer; tag: pointer); cdecl; external libasan;
procedure __tsan_external_write(addr: pointer; caller_pc: pointer; tag: pointer); cdecl; external libasan;
function __tsan_get_current_fiber: pointer; cdecl; external libasan;
function __tsan_create_fiber(flags: dword): pointer; cdecl; external libasan;
procedure __tsan_destroy_fiber(fiber: pointer); cdecl; external libasan;
procedure __tsan_switch_to_fiber(fiber: pointer; flags: dword); cdecl; external libasan;
procedure __tsan_set_fiber_name(fiber: pointer; name: pchar); cdecl; external libasan;

const
  __tsan_switch_to_fiber_no_sync = 1 shl 0;

procedure __tsan_on_initialize; cdecl; external libasan;
function __tsan_on_finalize(failed: longint): longint; cdecl; external libasan;
procedure __tsan_flush_memory; cdecl; external libasan;
function __tsan_default_options: pchar; cdecl; external libasan;
function __tsan_default_suppressions: pchar; cdecl; external libasan;
function __tsan_get_report_data(report: pointer; description: PPchar; count: Plongint; stack_count: Plongint; mop_count: Plongint;
  loc_count: Plongint; mutex_count: Plongint; thread_count: Plongint; unique_tid_count: Plongint; sleep_trace: Ppointer;
  trace_size: dword): longint; cdecl; external libasan;
function __tsan_get_report_stack(report: pointer; idx: dword; trace: Ppointer; trace_size: dword): longint; cdecl; external libasan;
function __tsan_get_report_mop(report: pointer; idx: dword; tid: Plongint; addr: Ppointer; size: Plongint;
  write: Plongint; atomic: Plongint; trace: Ppointer; trace_size: dword): longint; cdecl; external libasan;
function __tsan_get_report_loc(report: pointer; idx: dword; _type: PPchar; addr: Ppointer; start: Ppointer;
  size: Pdword; tid: Plongint; fd: Plongint; suppressable: Plongint; trace: Ppointer;
  trace_size: dword): longint; cdecl; external libasan;
function __tsan_get_report_mutex(report: pointer; idx: dword; mutex_id: Puint64_t; addr: Ppointer; destroyed: Plongint;
  trace: Ppointer; trace_size: dword): longint; cdecl; external libasan;
function __tsan_get_report_thread(report: pointer; idx: dword; tid: Plongint; os_id: Puint64_t; running: Plongint;
  name: PPchar; parent_tid: Plongint; trace: Ppointer; trace_size: dword): longint; cdecl; external libasan;
function __tsan_get_report_unique_tid(report: pointer; idx: dword; tid: Plongint): longint; cdecl; external libasan;
function __tsan_get_current_report: pointer; cdecl; external libasan;

// === Konventiert am: 10-10-26 14:05:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
