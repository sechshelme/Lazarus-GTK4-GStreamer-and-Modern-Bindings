unit libgomp_g;

interface

const
  {$IFDEF Linux}
  libgomp = 'gomp';
  {$ENDIF}

  {$IFDEF Windows}
  libgomp = 'libgomp-1.dll';
  {$ENDIF}

type
  Tbool = boolean;

  Tuintptr_t = PtrUInt;
  Puintptr_t = ^Tuintptr_t;

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

type
  {$IFDEF Linux}
  Tculong = uint64;
  Tclong = int64;
  {$ENDIF}
  {$IFDEF windows}
  Tculong = uint32;
  Tclong = int32;
  {$ENDIF}
  Pculong = ^Tculong;
  Pclong = ^Tclong;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  T1Pointer_func = procedure(para1: pointer); cdecl;
  T2Pointer_func = procedure(para1: pointer; para2: pointer); cdecl;

procedure GOMP_barrier; cdecl; external libgomp;
function GOMP_barrier_cancel: Tbool; cdecl; external libgomp;
{ critical.c  }
procedure GOMP_critical_start; cdecl; external libgomp;
procedure GOMP_critical_end; cdecl; external libgomp;
procedure GOMP_critical_name_start(para1: Ppointer); cdecl; external libgomp;
procedure GOMP_critical_name_end(para1: Ppointer); cdecl; external libgomp;
procedure GOMP_atomic_start; cdecl; external libgomp;
procedure GOMP_atomic_end; cdecl; external libgomp;
{ loop.c  }
function GOMP_loop_static_start(para1: Tclong; para2: Tclong; para3: Tclong; para4: Tclong; para5: pclong;
  para6: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_dynamic_start(para1: Tclong; para2: Tclong; para3: Tclong; para4: Tclong; para5: pclong;
  para6: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_guided_start(para1: Tclong; para2: Tclong; para3: Tclong; para4: Tclong; para5: pclong;
  para6: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_runtime_start(para1: Tclong; para2: Tclong; para3: Tclong; para4: pclong; para5: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_nonmonotonic_dynamic_start(para1: Tclong; para2: Tclong; para3: Tclong; para4: Tclong; para5: pclong;
  para6: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_nonmonotonic_guided_start(para1: Tclong; para2: Tclong; para3: Tclong; para4: Tclong; para5: pclong;
  para6: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_nonmonotonic_runtime_start(para1: Tclong; para2: Tclong; para3: Tclong; para4: pclong; para5: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_maybe_nonmonotonic_runtime_start(para1: Tclong; para2: Tclong; para3: Tclong; para4: pclong; para5: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_start(para1: Tclong; para2: Tclong; para3: Tclong; para4: Tclong; para5: Tclong;
  para6: pclong; para7: pclong; para8: Puintptr_t; para9: Ppointer): Tbool; cdecl; external libgomp;
function GOMP_loop_ordered_static_start(para1: Tclong; para2: Tclong; para3: Tclong; para4: Tclong; para5: pclong;
  para6: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_ordered_dynamic_start(para1: Tclong; para2: Tclong; para3: Tclong; para4: Tclong; para5: pclong;
  para6: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_ordered_guided_start(para1: Tclong; para2: Tclong; para3: Tclong; para4: Tclong; para5: pclong;
  para6: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_ordered_runtime_start(para1: Tclong; para2: Tclong; para3: Tclong; para4: pclong; para5: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_ordered_start(para1: Tclong; para2: Tclong; para3: Tclong; para4: Tclong; para5: Tclong;
  para6: pclong; para7: pclong; para8: Puintptr_t; para9: Ppointer): Tbool; cdecl; external libgomp;
function GOMP_loop_static_next(para1: pclong; para2: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_dynamic_next(para1: pclong; para2: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_guided_next(para1: pclong; para2: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_runtime_next(para1: pclong; para2: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_nonmonotonic_dynamic_next(para1: pclong; para2: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_nonmonotonic_guided_next(para1: pclong; para2: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_nonmonotonic_runtime_next(para1: pclong; para2: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_maybe_nonmonotonic_runtime_next(para1: pclong; para2: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_ordered_static_next(para1: pclong; para2: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_ordered_dynamic_next(para1: pclong; para2: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_ordered_guided_next(para1: pclong; para2: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_ordered_runtime_next(para1: pclong; para2: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_doacross_static_start(para1: uint32; para2: pclong; para3: Tclong; para4: pclong; para5: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_doacross_dynamic_start(para1: uint32; para2: pclong; para3: Tclong; para4: pclong; para5: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_doacross_guided_start(para1: uint32; para2: pclong; para3: Tclong; para4: pclong; para5: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_doacross_runtime_start(para1: uint32; para2: pclong; para3: pclong; para4: pclong): Tbool; cdecl; external libgomp;
function GOMP_loop_doacross_start(para1: uint32; para2: pclong; para3: Tclong; para4: Tclong; para5: pclong;
  para6: pclong; para7: Puintptr_t; para8: Ppointer): Tbool; cdecl; external libgomp;
procedure GOMP_parallel_loop_static_start(para1: T1Pointer_func; para2: pointer; para3: uint32; para4: Tclong; para5: Tclong;
  para6: Tclong; para7: Tclong); cdecl; external libgomp;
procedure GOMP_parallel_loop_dynamic_start(para1: T1Pointer_func; para2: pointer; para3: uint32; para4: Tclong; para5: Tclong;
  para6: Tclong; para7: Tclong); cdecl; external libgomp;
procedure GOMP_parallel_loop_guided_start(para1: T1Pointer_func; para2: pointer; para3: uint32; para4: Tclong; para5: Tclong;
  para6: Tclong; para7: Tclong); cdecl; external libgomp;
procedure GOMP_parallel_loop_runtime_start(para1: T1Pointer_func; para2: pointer; para3: uint32; para4: Tclong; para5: Tclong;
  para6: Tclong); cdecl; external libgomp;
procedure GOMP_parallel_loop_static(para1: T1Pointer_func; para2: pointer; para3: uint32; para4: Tclong; para5: Tclong;
  para6: Tclong; para7: Tclong; para8: uint32); cdecl; external libgomp;
procedure GOMP_parallel_loop_dynamic(para1: T1Pointer_func; para2: pointer; para3: uint32; para4: Tclong; para5: Tclong;
  para6: Tclong; para7: Tclong; para8: uint32); cdecl; external libgomp;
procedure GOMP_parallel_loop_guided(para1: T1Pointer_func; para2: pointer; para3: uint32; para4: Tclong; para5: Tclong;
  para6: Tclong; para7: Tclong; para8: uint32); cdecl; external libgomp;
procedure GOMP_parallel_loop_runtime(para1: T1Pointer_func; para2: pointer; para3: uint32; para4: Tclong; para5: Tclong;
  para6: Tclong; para7: uint32); cdecl; external libgomp;
procedure GOMP_parallel_loop_nonmonotonic_dynamic(para1: T1Pointer_func; para2: pointer; para3: uint32; para4: Tclong; para5: Tclong;
  para6: Tclong; para7: Tclong; para8: uint32); cdecl; external libgomp;
procedure GOMP_parallel_loop_nonmonotonic_guided(para1: T1Pointer_func; para2: pointer; para3: uint32; para4: Tclong; para5: Tclong;
  para6: Tclong; para7: Tclong; para8: uint32); cdecl; external libgomp;
procedure GOMP_parallel_loop_nonmonotonic_runtime(para1: T1Pointer_func; para2: pointer; para3: uint32; para4: Tclong; para5: Tclong;
  para6: Tclong; para7: uint32); cdecl; external libgomp;
procedure GOMP_parallel_loop_maybe_nonmonotonic_runtime(para1: T1Pointer_func; para2: pointer; para3: uint32; para4: Tclong; para5: Tclong;
  para6: Tclong; para7: uint32); cdecl; external libgomp;
procedure GOMP_loop_end; cdecl; external libgomp;
procedure GOMP_loop_end_nowait; cdecl; external libgomp;
function GOMP_loop_end_cancel: Tbool; cdecl; external libgomp;
{ loop_ull.c  }
function GOMP_loop_ull_static_start(para1: Tbool; para2: uint64; para3: uint64; para4: uint64; para5: uint64;
  para6: puint64; para7: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_dynamic_start(para1: Tbool; para2: uint64; para3: uint64; para4: uint64; para5: uint64;
  para6: puint64; para7: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_guided_start(para1: Tbool; para2: uint64; para3: uint64; para4: uint64; para5: uint64;
  para6: puint64; para7: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_runtime_start(para1: Tbool; para2: uint64; para3: uint64; para4: uint64; para5: puint64;
  para6: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_nonmonotonic_dynamic_start(para1: Tbool; para2: uint64; para3: uint64; para4: uint64; para5: uint64;
  para6: puint64; para7: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_nonmonotonic_guided_start(para1: Tbool; para2: uint64; para3: uint64; para4: uint64; para5: uint64;
  para6: puint64; para7: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_nonmonotonic_runtime_start(para1: Tbool; para2: uint64; para3: uint64; para4: uint64; para5: puint64;
  para6: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_maybe_nonmonotonic_runtime_start(para1: Tbool; para2: uint64; para3: uint64; para4: uint64; para5: puint64;
  para6: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_start(para1: Tbool; para2: uint64; para3: uint64; para4: uint64; para5: Tclong;
  para6: uint64; para7: puint64; para8: puint64; para9: Puintptr_t; para10: Ppointer): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_ordered_static_start(para1: Tbool; para2: uint64; para3: uint64; para4: uint64; para5: uint64;
  para6: puint64; para7: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_ordered_dynamic_start(para1: Tbool; para2: uint64; para3: uint64; para4: uint64; para5: uint64;
  para6: puint64; para7: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_ordered_guided_start(para1: Tbool; para2: uint64; para3: uint64; para4: uint64; para5: uint64;
  para6: puint64; para7: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_ordered_runtime_start(para1: Tbool; para2: uint64; para3: uint64; para4: uint64; para5: puint64;
  para6: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_ordered_start(para1: Tbool; para2: uint64; para3: uint64; para4: uint64; para5: Tclong;
  para6: uint64; para7: puint64; para8: puint64; para9: Puintptr_t; para10: Ppointer): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_static_next(para1: puint64; para2: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_dynamic_next(para1: puint64; para2: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_guided_next(para1: puint64; para2: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_runtime_next(para1: puint64; para2: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_nonmonotonic_dynamic_next(para1: puint64; para2: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_nonmonotonic_guided_next(para1: puint64; para2: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_nonmonotonic_runtime_next(para1: puint64; para2: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_maybe_nonmonotonic_runtime_next(para1: puint64; para2: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_ordered_static_next(para1: puint64; para2: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_ordered_dynamic_next(para1: puint64; para2: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_ordered_guided_next(para1: puint64; para2: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_ordered_runtime_next(para1: puint64; para2: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_doacross_static_start(para1: uint32; para2: puint64; para3: uint64; para4: puint64; para5: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_doacross_dynamic_start(para1: uint32; para2: puint64; para3: uint64; para4: puint64; para5: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_doacross_guided_start(para1: uint32; para2: puint64; para3: uint64; para4: puint64; para5: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_doacross_runtime_start(para1: uint32; para2: puint64; para3: puint64; para4: puint64): Tbool; cdecl; external libgomp;
function GOMP_loop_ull_doacross_start(para1: uint32; para2: puint64; para3: Tclong; para4: uint64; para5: puint64;
  para6: puint64; para7: Puintptr_t; para8: Ppointer): Tbool; cdecl; external libgomp;
{ ordered.c  }
procedure GOMP_ordered_start; cdecl; external libgomp;
procedure GOMP_ordered_end; cdecl; external libgomp;
procedure GOMP_doacross_post(para1: pclong); cdecl; external libgomp;
procedure GOMP_doacross_wait(para1: Tclong); cdecl; varargs; external libgomp;
procedure GOMP_doacross_ull_post(para1: puint64); cdecl; external libgomp;
procedure GOMP_doacross_ull_wait(para1: uint64); cdecl; varargs; external libgomp;
{ parallel.c  }
procedure GOMP_parallel_start(para1: T1Pointer_func; para2: pointer; para3: uint32); cdecl; external libgomp;
procedure GOMP_parallel_end; cdecl; external libgomp;
procedure GOMP_parallel(para1: T1Pointer_func; para2: pointer; para3: uint32; para4: uint32); cdecl; external libgomp;
function GOMP_parallel_reductions(para1: T1Pointer_func; para2: pointer; para3: uint32; para4: uint32): uint32; cdecl; external libgomp;
function GOMP_cancel(para1: integer; para2: Tbool): Tbool; cdecl; external libgomp;
function GOMP_cancellation_point(para1: integer): Tbool; cdecl; external libgomp;
{ task.c  }
procedure GOMP_task(para1: T1Pointer_func; para2: pointer; para3: T2Pointer_func; para4: Tclong; para5: Tclong;
  para6: Tbool; para7: uint32; para8: Ppointer; para9: integer; para10: pointer); cdecl; external libgomp;
procedure GOMP_taskloop(para1: T1Pointer_func; para2: pointer; para3: T2Pointer_func; para4: Tclong; para5: Tclong;
  para6: uint32; para7: Tculong; para8: integer; para9: Tclong; para10: Tclong;
  para11: Tclong); cdecl; external libgomp;
procedure GOMP_taskloop_ull(para1: T1Pointer_func; para2: pointer; para3: T2Pointer_func; para4: Tclong; para5: Tclong;
  para6: uint32; para7: Tculong; para8: integer; para9: uint64; para10: uint64;
  para11: uint64); cdecl; external libgomp;
procedure GOMP_taskwait; cdecl; external libgomp;
procedure GOMP_taskwait_depend(para1: Ppointer); cdecl; external libgomp;
procedure GOMP_taskwait_depend_nowait(para1: Ppointer); cdecl; external libgomp;
procedure GOMP_taskyield; cdecl; external libgomp;
procedure GOMP_taskgroup_start; cdecl; external libgomp;
procedure GOMP_taskgroup_end; cdecl; external libgomp;
procedure GOMP_taskgroup_reduction_register(para1: Puintptr_t); cdecl; external libgomp;
procedure GOMP_taskgroup_reduction_unregister(para1: Puintptr_t); cdecl; external libgomp;
procedure GOMP_task_reduction_remap(para1: Tsize_t; para2: Tsize_t; para3: Ppointer); cdecl; external libgomp;
procedure GOMP_workshare_task_reduction_unregister(para1: Tbool); cdecl; external libgomp;
{ sections.c  }
function GOMP_sections_start(para1: uint32): uint32; cdecl; external libgomp;
function GOMP_sections2_start(para1: uint32; para2: Puintptr_t; para3: Ppointer): uint32; cdecl; external libgomp;
function GOMP_sections_next: uint32; cdecl; external libgomp;
procedure GOMP_parallel_sections_start(para1: T1Pointer_func; para2: pointer; para3: uint32; para4: uint32); cdecl; external libgomp;
procedure GOMP_parallel_sections(para1: T1Pointer_func; para2: pointer; para3: uint32; para4: uint32; para5: uint32); cdecl; external libgomp;
procedure GOMP_sections_end; cdecl; external libgomp;
procedure GOMP_sections_end_nowait; cdecl; external libgomp;
function GOMP_sections_end_cancel: Tbool; cdecl; external libgomp;
{ single.c  }
function GOMP_single_start: Tbool; cdecl; external libgomp;
function GOMP_single_copy_start: pointer; cdecl; external libgomp;
procedure GOMP_single_copy_end(para1: pointer); cdecl; external libgomp;
{ scope.c  }
procedure GOMP_scope_start(para1: Puintptr_t); cdecl; external libgomp;
{ target.c  }
procedure GOMP_target(para1: integer; para2: T1Pointer_func; para3: pointer; para4: Tsize_t; para5: Ppointer;
  para6: Psize_t; para7: pchar); cdecl; external libgomp;
procedure GOMP_target_ext(para1: integer; para2: T1Pointer_func; para3: Tsize_t; para4: Ppointer; para5: Psize_t;
  para6: puint16; para7: uint32; para8: Ppointer; para9: Ppointer); cdecl; external libgomp;
procedure GOMP_target_data(para1: integer; para2: pointer; para3: Tsize_t; para4: Ppointer; para5: Psize_t;
  para6: pchar); cdecl; external libgomp;
procedure GOMP_target_data_ext(para1: integer; para2: Tsize_t; para3: Ppointer; para4: Psize_t; para5: puint16); cdecl; external libgomp;
procedure GOMP_target_end_data; cdecl; external libgomp;
procedure GOMP_target_update(para1: integer; para2: pointer; para3: Tsize_t; para4: Ppointer; para5: Psize_t;
  para6: pchar); cdecl; external libgomp;
procedure GOMP_target_update_ext(para1: integer; para2: Tsize_t; para3: Ppointer; para4: Psize_t; para5: puint16;
  para6: uint32; para7: Ppointer); cdecl; external libgomp;
procedure GOMP_target_enter_exit_data(para1: integer; para2: Tsize_t; para3: Ppointer; para4: Psize_t; para5: puint16;
  para6: uint32; para7: Ppointer); cdecl; external libgomp;
procedure GOMP_teams(para1: uint32; para2: uint32); cdecl; external libgomp;
function GOMP_teams4(para1: uint32; para2: uint32; para3: uint32; para4: Tbool): Tbool; cdecl; external libgomp;
{ teams.c  }
procedure GOMP_teams_reg(para1: T1Pointer_func; para2: pointer; para3: uint32; para4: uint32; para5: uint32); cdecl; external libgomp;
{ allocator.c  }
function GOMP_alloc(para1: Tsize_t; para2: Tsize_t; para3: Tuintptr_t): pointer; cdecl; external libgomp;
procedure GOMP_free(para1: pointer; para2: Tuintptr_t); cdecl; external libgomp;
{ error.c  }
procedure GOMP_warning(para1: pchar; para2: Tsize_t); cdecl; external libgomp;
procedure GOMP_error(para1: pchar; para2: Tsize_t); cdecl; external libgomp;
{ oacc-async.c  }
procedure GOACC_wait(para1: integer; para2: integer); cdecl; varargs; external libgomp;
{ oacc-mem.c  }
procedure GOACC_enter_exit_data(para1: integer; para2: Tsize_t; para3: Ppointer; para4: Psize_t; para5: puint16;
  para6: integer; para7: integer); cdecl; varargs; external libgomp;
procedure GOACC_enter_data(para1: integer; para2: Tsize_t; para3: Ppointer; para4: Psize_t; para5: puint16;
  para6: integer; para7: integer); cdecl; varargs; external libgomp;
procedure GOACC_exit_data(para1: integer; para2: Tsize_t; para3: Ppointer; para4: Psize_t; para5: puint16;
  para6: integer; para7: integer); cdecl; varargs; external libgomp;
procedure GOACC_declare(para1: integer; para2: Tsize_t; para3: Ppointer; para4: Psize_t; para5: puint16); cdecl; external libgomp;
{ oacc-parallel.c  }
procedure GOACC_parallel_keyed(para1: integer; para2: T1Pointer_func; para3: Tsize_t; para4: Ppointer; para5: Psize_t;
  para6: puint16); cdecl; varargs; external libgomp;
procedure GOACC_parallel(para1: integer; para2: T1Pointer_func; para3: Tsize_t; para4: Ppointer; para5: Psize_t;
  para6: puint16; para7: integer; para8: integer; para9: integer; para10: integer;
  para11: integer); cdecl; varargs; external libgomp;
procedure GOACC_data_start(para1: integer; para2: Tsize_t; para3: Ppointer; para4: Psize_t; para5: puint16); cdecl; external libgomp;
procedure GOACC_data_end; cdecl; external libgomp;
procedure GOACC_update(para1: integer; para2: Tsize_t; para3: Ppointer; para4: Psize_t; para5: puint16;
  para6: integer; para7: integer); cdecl; varargs; external libgomp;
function GOACC_get_num_threads: integer; cdecl; external libgomp;
function GOACC_get_thread_num: integer; cdecl; external libgomp;

// === Konventiert am: 26-12-25 19:10:18 ===


implementation



end.
