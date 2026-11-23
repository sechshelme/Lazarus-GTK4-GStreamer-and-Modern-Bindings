{$IFDEF read_interface}

procedure __asan_poison_memory_region(addr: pointer; size: Tsize_t); cdecl; external libasan;
procedure __asan_unpoison_memory_region(addr: pointer; size: Tsize_t); cdecl; external libasan;
function __asan_address_is_poisoned(addr: pointer): longint; cdecl; external libasan;
function __asan_region_is_poisoned(beg: pointer; size: Tsize_t): pointer; cdecl; external libasan;
procedure __asan_describe_address(addr: pointer); cdecl; external libasan;
function __asan_report_present: longint; cdecl; external libasan;
function __asan_get_report_pc: pointer; cdecl; external libasan;
function __asan_get_report_bp: pointer; cdecl; external libasan;
function __asan_get_report_sp: pointer; cdecl; external libasan;
function __asan_get_report_address: pointer; cdecl; external libasan;
function __asan_get_report_access_type: longint; cdecl; external libasan;
function __asan_get_report_access_size: Tsize_t; cdecl; external libasan;
function __asan_get_report_description: pchar; cdecl; external libasan;
function __asan_locate_address(addr: pointer; name: pchar; name_size: Tsize_t; region_address: Ppointer; region_size: Psize_t): pchar; cdecl; external libasan;
function __asan_get_alloc_stack(addr: pointer; trace: Ppointer; size: Tsize_t; thread_id: Plongint): Tsize_t; cdecl; external libasan;
function __asan_get_free_stack(addr: pointer; trace: Ppointer; size: Tsize_t; thread_id: Plongint): Tsize_t; cdecl; external libasan;
procedure __asan_get_shadow_mapping(shadow_scale: Psize_t; shadow_offset: Psize_t); cdecl; external libasan;
procedure __asan_report_error(pc: pointer; bp: pointer; sp: pointer; addr: pointer; is_write: longint; access_size: Tsize_t); cdecl; external libasan;
procedure __asan_set_death_callback(callback: T0Pointer_func); cdecl; external libasan;
procedure __asan_set_error_report_callback(callback: T1Pointer_func); cdecl; external libasan;
procedure __asan_on_error; cdecl; external libasan;
procedure __asan_print_accumulated_stats; cdecl; external libasan;
function __asan_default_options: pchar; cdecl; external libasan;
function __asan_get_current_fake_stack: pointer; cdecl; external libasan;
function __asan_addr_is_in_fake_stack(fake_stack: pointer; addr: pointer; beg: Ppointer; end_: Ppointer): pointer; cdecl; external libasan;
procedure __asan_handle_no_return; cdecl; external libasan;
function __asan_update_allocation_context(addr: pointer): longint; cdecl; external libasan;

// === Konventiert am: 10-10-26 14:05:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
