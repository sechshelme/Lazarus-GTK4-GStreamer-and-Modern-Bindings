unit omp;

interface

uses
  libgomp_g;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tomp_lock_t = record
    _x: array[0..3] of byte;
  end;
  Pomp_lock_t = ^Tomp_lock_t;

  Tomp_nest_lock_t = record
    _x: array[0..(7 + SizeOf(Pointer))] of byte;
  end;
  Pomp_nest_lock_t = ^Tomp_nest_lock_t;

type
  Pomp_sched_t = ^Tomp_sched_t;
  Tomp_sched_t = longint;

const
  omp_sched_static = 1;
  omp_sched_dynamic = 2;
  omp_sched_guided = 3;
  omp_sched_auto = 4;
  omp_sched_monotonic = $80000000;

type
  Pomp_proc_bind_t = ^Tomp_proc_bind_t;
  Tomp_proc_bind_t = longint;

const
  omp_proc_bind_false = 0;
  omp_proc_bind_true = 1;
  omp_proc_bind_primary = 2;
  omp_proc_bind_close = 3;
  omp_proc_bind_spread = 4;

type
  Pomp_sync_hint_t = ^Tomp_sync_hint_t;
  Tomp_sync_hint_t = longint;

const
  omp_sync_hint_none = 0;
  omp_sync_hint_uncontended = 1;
  omp_sync_hint_contended = 2;
  omp_sync_hint_nonspeculative = 4;
  omp_sync_hint_speculative = 8;

type
  Pomp_lock_hint_t = ^Tomp_lock_hint_t;
  Tomp_lock_hint_t = Tomp_sync_hint_t;

type
  Tomp_depend_t = packed record
    __omp_depend_t__: array[0..(2 * SizeOf(Pointer)) - 1] of ansichar;
  end;
  Pomp_depend_t = ^Tomp_depend_t;

type
  Pomp_pause_resource_t = ^Tomp_pause_resource_t;
  Tomp_pause_resource_t = longint;

const
  omp_pause_soft = 1;
  omp_pause_hard = 2;

type
  Pomp_uintptr_t = ^Tomp_uintptr_t;
  Tomp_uintptr_t = PPtrUInt;

  Pomp_memspace_handle_t = ^Tomp_memspace_handle_t;
  Tomp_memspace_handle_t = longint;

const
  omp_default_mem_space = 0;
  omp_large_cap_mem_space = 1;
  omp_const_mem_space = 2;
  omp_high_bw_mem_space = 3;
  omp_low_lat_mem_space = 4;

type
  Pomp_allocator_handle_t = ^Tomp_allocator_handle_t;
  Tomp_allocator_handle_t = longint;

const
  omp_null_allocator = 0;
  omp_default_mem_alloc = 1;
  omp_large_cap_mem_alloc = 2;
  omp_const_mem_alloc = 3;
  omp_high_bw_mem_alloc = 4;
  omp_low_lat_mem_alloc = 5;
  omp_cgroup_mem_alloc = 6;
  omp_pteam_mem_alloc = 7;
  omp_thread_mem_alloc = 8;

type
  Pomp_alloctrait_key_t = ^Tomp_alloctrait_key_t;
  Tomp_alloctrait_key_t = longint;

const
  omp_atk_sync_hint = 1;
  omp_atk_alignment = 2;
  omp_atk_access = 3;
  omp_atk_pool_size = 4;
  omp_atk_fallback = 5;
  omp_atk_fb_data = 6;
  omp_atk_pinned = 7;
  omp_atk_partition = 8;

type
  Pomp_alloctrait_value_t = ^Tomp_alloctrait_value_t;
  Tomp_alloctrait_value_t = longint;

const
  omp_atv_default = -(1);
  omp_atv_false = 0;
  omp_atv_true = 1;
  omp_atv_contended = 3;
  omp_atv_uncontended = 4;
  omp_atv_serialized = 5;
  omp_atv_private = 6;
  omp_atv_all = 7;
  omp_atv_thread = 8;
  omp_atv_pteam = 9;
  omp_atv_cgroup = 10;
  omp_atv_default_mem_fb = 11;
  omp_atv_null_fb = 12;
  omp_atv_abort_fb = 13;
  omp_atv_allocator_fb = 14;
  omp_atv_environment = 15;
  omp_atv_nearest = 16;
  omp_atv_blocked = 17;
  omp_atv_interleaved = 18;

type
  Pomp_alloctrait_t = ^Tomp_alloctrait_t;

  Tomp_alloctrait_t = record
    key: Tomp_alloctrait_key_t;
    value: Tomp_uintptr_t;
  end;

  Pomp_event_handle_t = ^Tomp_event_handle_t;
  Tomp_event_handle_t = longint;

const
  omp_initial_device = -(1);
  omp_invalid_device = -(4);

procedure omp_set_num_threads(para1: longint); cdecl; external libgomp;
function omp_get_num_threads: longint; cdecl; external libgomp;
function omp_get_max_threads: longint; cdecl; external libgomp;
function omp_get_thread_num: longint; cdecl; external libgomp;
function omp_get_num_procs: longint; cdecl; external libgomp;
function omp_in_parallel: longint; cdecl; external libgomp;
procedure omp_set_dynamic(para1: longint); cdecl; external libgomp;
function omp_get_dynamic: longint; cdecl; external libgomp;
procedure omp_set_nested(para1: longint); cdecl; external libgomp;
function omp_get_nested: longint; cdecl; external libgomp;
procedure omp_init_lock(para1: Pomp_lock_t); cdecl; external libgomp;
procedure omp_init_lock_with_hint(para1: Pomp_lock_t; para2: Tomp_sync_hint_t); cdecl; external libgomp;
procedure omp_destroy_lock(para1: Pomp_lock_t); cdecl; external libgomp;
procedure omp_set_lock(para1: Pomp_lock_t); cdecl; external libgomp;
procedure omp_unset_lock(para1: Pomp_lock_t); cdecl; external libgomp;
function omp_test_lock(para1: Pomp_lock_t): longint; cdecl; external libgomp;
procedure omp_init_nest_lock(para1: Pomp_nest_lock_t); cdecl; external libgomp;
procedure omp_init_nest_lock_with_hint(para1: Pomp_nest_lock_t; para2: Tomp_sync_hint_t); cdecl; external libgomp;
procedure omp_destroy_nest_lock(para1: Pomp_nest_lock_t); cdecl; external libgomp;
procedure omp_set_nest_lock(para1: Pomp_nest_lock_t); cdecl; external libgomp;
procedure omp_unset_nest_lock(para1: Pomp_nest_lock_t); cdecl; external libgomp;
function omp_test_nest_lock(para1: Pomp_nest_lock_t): longint; cdecl; external libgomp;
function omp_get_wtime: double; cdecl; external libgomp;
function omp_get_wtick: double; cdecl; external libgomp;
procedure omp_set_schedule(para1: Tomp_sched_t; para2: longint); cdecl; external libgomp;
procedure omp_get_schedule(para1: Pomp_sched_t; para2: Plongint); cdecl; external libgomp;
function omp_get_thread_limit: longint; cdecl; external libgomp;
procedure omp_set_max_active_levels(para1: longint); cdecl; external libgomp;
function omp_get_max_active_levels: longint; cdecl; external libgomp;
function omp_get_supported_active_levels: longint; cdecl; external libgomp;
function omp_get_level: longint; cdecl; external libgomp;
function omp_get_ancestor_thread_num(para1: longint): longint; cdecl; external libgomp;
function omp_get_team_size(para1: longint): longint; cdecl; external libgomp;
function omp_get_active_level: longint; cdecl; external libgomp;
function omp_in_final: longint; cdecl; external libgomp;
function omp_in_explicit_task: longint; cdecl; external libgomp;
function omp_get_cancellation: longint; cdecl; external libgomp;
function omp_get_proc_bind: Tomp_proc_bind_t; cdecl; external libgomp;
function omp_get_num_places: longint; cdecl; external libgomp;
function omp_get_place_num_procs(para1: longint): longint; cdecl; external libgomp;
procedure omp_get_place_proc_ids(para1: longint; para2: Plongint); cdecl; external libgomp;
function omp_get_place_num: longint; cdecl; external libgomp;
function omp_get_partition_num_places: longint; cdecl; external libgomp;
procedure omp_get_partition_place_nums(para1: Plongint); cdecl; external libgomp;
procedure omp_set_default_device(para1: longint); cdecl; external libgomp;
function omp_get_default_device: longint; cdecl; external libgomp;
function omp_get_num_devices: longint; cdecl; external libgomp;
function omp_get_device_num: longint; cdecl; external libgomp;
function omp_get_num_teams: longint; cdecl; external libgomp;
function omp_get_team_num: longint; cdecl; external libgomp;
function omp_is_initial_device: longint; cdecl; external libgomp;
function omp_get_initial_device: longint; cdecl; external libgomp;
function omp_get_max_task_priority: longint; cdecl; external libgomp;
procedure omp_fulfill_event(para1: Tomp_event_handle_t); cdecl; external libgomp;
procedure omp_set_num_teams(para1: longint); cdecl; external libgomp;
function omp_get_max_teams: longint; cdecl; external libgomp;
procedure omp_set_teams_thread_limit(para1: longint); cdecl; external libgomp;
function omp_get_teams_thread_limit: longint; cdecl; external libgomp;
function omp_target_alloc(para1: Tsize_t; para2: longint): pointer; cdecl; external libgomp;
procedure omp_target_free(para1: pointer; para2: longint); cdecl; external libgomp;
function omp_target_is_present(para1: pointer; para2: longint): longint; cdecl; external libgomp;
function omp_target_memcpy(para1: pointer; para2: pointer; para3: Tsize_t; para4: Tsize_t; para5: Tsize_t;
  para6: longint; para7: longint): longint; cdecl; external libgomp;
function omp_target_memcpy_async(para1: pointer; para2: pointer; para3: Tsize_t; para4: Tsize_t; para5: Tsize_t;
  para6: longint; para7: longint; para8: longint; para9: Pomp_depend_t): longint; cdecl; external libgomp;
function omp_target_memcpy_rect(para1: pointer; para2: pointer; para3: Tsize_t; para4: longint; para5: Psize_t;
  para6: Psize_t; para7: Psize_t; para8: Psize_t; para9: Psize_t; para10: longint;
  para11: longint): longint; cdecl; external libgomp;
function omp_target_memcpy_rect_async(para1: pointer; para2: pointer; para3: Tsize_t; para4: longint; para5: Psize_t;
  para6: Psize_t; para7: Psize_t; para8: Psize_t; para9: Psize_t; para10: longint;
  para11: longint; para12: longint; para13: Pomp_depend_t): longint; cdecl; external libgomp;
function omp_target_associate_ptr(para1: pointer; para2: pointer; para3: Tsize_t; para4: Tsize_t; para5: longint): longint; cdecl; external libgomp;
function omp_target_disassociate_ptr(para1: pointer; para2: longint): longint; cdecl; external libgomp;
function omp_get_mapped_ptr(para1: pointer; para2: longint): pointer; cdecl; external libgomp;
function omp_target_is_accessible(para1: pointer; para2: Tsize_t; para3: longint): longint; cdecl; external libgomp;
procedure omp_set_affinity_format(para1: pchar); cdecl; external libgomp;
function omp_get_affinity_format(para1: pchar; para2: Tsize_t): Tsize_t; cdecl; external libgomp;
procedure omp_display_affinity(para1: pchar); cdecl; external libgomp;
function omp_capture_affinity(para1: pchar; para2: Tsize_t; para3: pchar): Tsize_t; cdecl; external libgomp;
function omp_pause_resource(para1: Tomp_pause_resource_t; para2: longint): longint; cdecl; external libgomp;
function omp_pause_resource_all(para1: Tomp_pause_resource_t): longint; cdecl; external libgomp;
function omp_init_allocator(para1: Tomp_memspace_handle_t; para2: longint; para3: Pomp_alloctrait_t): Tomp_allocator_handle_t; cdecl; external libgomp;
procedure omp_destroy_allocator(para1: Tomp_allocator_handle_t); cdecl; external libgomp;
procedure omp_set_default_allocator(para1: Tomp_allocator_handle_t); cdecl; external libgomp;
function omp_get_default_allocator: Tomp_allocator_handle_t; cdecl; external libgomp;
procedure omp_free(para1: pointer; para2: Tomp_allocator_handle_t); cdecl; external libgomp;
function omp_alloc(para1: Tsize_t; para2: Tomp_allocator_handle_t): pointer; cdecl; external libgomp;
function omp_aligned_alloc(para1: Tsize_t; para2: Tsize_t; para3: Tomp_allocator_handle_t): pointer; cdecl; external libgomp;
function omp_calloc(para1: Tsize_t; para2: Tsize_t; para3: Tomp_allocator_handle_t): pointer; cdecl; external libgomp;
function omp_aligned_calloc(para1: Tsize_t; para2: Tsize_t; para3: Tsize_t; para4: Tomp_allocator_handle_t): pointer; cdecl; external libgomp;
function omp_realloc(para1: pointer; para2: Tsize_t; para3: Tomp_allocator_handle_t; para4: Tomp_allocator_handle_t): pointer; cdecl; external libgomp;
procedure omp_display_env(para1: longint); cdecl; external libgomp;

// === Konventiert am: 26-12-25 14:19:46 ===


implementation



end.
