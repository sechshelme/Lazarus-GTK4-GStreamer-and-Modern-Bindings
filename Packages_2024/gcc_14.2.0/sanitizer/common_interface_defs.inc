{$IFDEF read_interface}

type
  Psanitizer_sandbox_arguments = ^Tsanitizer_sandbox_arguments;
  Tsanitizer_sandbox_arguments = record
    coverage_sandboxed: longint;
    coverage_fd: Tintptr_t;
    coverage_max_block_size: dword;
  end;

procedure __sanitizer_set_report_path(path: pchar); cdecl; external libasan;
procedure __sanitizer_set_report_fd(fd: pointer); cdecl; external libasan;
function __sanitizer_get_report_path: pchar; cdecl; external libasan;
procedure __sanitizer_sandbox_on_notify(args: Psanitizer_sandbox_arguments); cdecl; external libasan;
procedure __sanitizer_report_error_summary(error_summary: pchar); cdecl; external libasan;
function __sanitizer_unaligned_load16(p: pointer): Tuint16_t; cdecl; external libasan;
function __sanitizer_unaligned_load32(p: pointer): Tuint32_t; cdecl; external libasan;
function __sanitizer_unaligned_load64(p: pointer): Tuint64_t; cdecl; external libasan;
procedure __sanitizer_unaligned_store16(p: pointer; x: Tuint16_t); cdecl; external libasan;
procedure __sanitizer_unaligned_store32(p: pointer; x: Tuint32_t); cdecl; external libasan;
procedure __sanitizer_unaligned_store64(p: pointer; x: Tuint64_t); cdecl; external libasan;
function __sanitizer_acquire_crash_state: longint; cdecl; external libasan;
procedure __sanitizer_annotate_contiguous_container(beg: pointer; end_: pointer; old_mid: pointer; new_mid: pointer); cdecl; external libasan;
procedure __sanitizer_annotate_double_ended_contiguous_container(storage_beg: pointer; storage_end: pointer; old_container_beg: pointer; old_container_end: pointer; new_container_beg: pointer; new_container_end: pointer); cdecl; external libasan;
function __sanitizer_verify_contiguous_container(beg: pointer; mid: pointer; end_: pointer): longint; cdecl; external libasan;
function __sanitizer_verify_double_ended_contiguous_container(storage_beg: pointer; container_beg: pointer; container_end: pointer; storage_end: pointer): longint; cdecl; external libasan;
function __sanitizer_contiguous_container_find_bad_address(beg: pointer; mid: pointer; end_: pointer): pointer; cdecl; external libasan;
function __sanitizer_double_ended_contiguous_container_find_bad_address(storage_beg: pointer; container_beg: pointer; container_end: pointer; storage_end: pointer): pointer; cdecl; external libasan;
procedure __sanitizer_print_stack_trace; cdecl; external libasan;
procedure __sanitizer_symbolize_pc(pc: pointer; fmt: pchar; out_buf: pchar; out_buf_size: Tsize_t); cdecl; external libasan;
procedure __sanitizer_symbolize_global(data_ptr: pointer; fmt: pchar; out_buf: pchar; out_buf_size: Tsize_t); cdecl; external libasan;

procedure __sanitizer_set_death_callback(callback: T1Pointer_func); cdecl; external libasan;
procedure __sanitizer_weak_hook_memcmp(called_pc: pointer; s1: pointer; s2: pointer; n: Tsize_t; result: longint); cdecl; external libasan;
procedure __sanitizer_weak_hook_strncmp(called_pc: pointer; s1: pchar; s2: pchar; n: Tsize_t; result: longint); cdecl; external libasan;
procedure __sanitizer_weak_hook_strncasecmp(called_pc: pointer; s1: pchar; s2: pchar; n: Tsize_t; result: longint); cdecl; external libasan;
procedure __sanitizer_weak_hook_strcmp(called_pc: pointer; s1: pchar; s2: pchar; result: longint); cdecl; external libasan;
procedure __sanitizer_weak_hook_strcasecmp(called_pc: pointer; s1: pchar; s2: pchar; result: longint); cdecl; external libasan;
procedure __sanitizer_weak_hook_strstr(called_pc: pointer; s1: pchar; s2: pchar; result: pchar); cdecl; external libasan;
procedure __sanitizer_weak_hook_strcasestr(called_pc: pointer; s1: pchar; s2: pchar; result: pchar); cdecl; external libasan;
procedure __sanitizer_weak_hook_memmem(called_pc: pointer; s1: pointer; len1: Tsize_t; s2: pointer; len2: Tsize_t; result: pointer); cdecl; external libasan;
procedure __sanitizer_print_memory_profile(top_percent: Tsize_t; max_number_of_contexts: Tsize_t); cdecl; external libasan;
procedure __sanitizer_start_switch_fiber(fake_stack_save: Ppointer; bottom: pointer; size: Tsize_t); cdecl; external libasan;
procedure __sanitizer_finish_switch_fiber(fake_stack_save: pointer; bottom_old: Ppointer; size_old: Psize_t); cdecl; external libasan;
function __sanitizer_get_module_and_offset_for_pc(pc: pointer; module_path: pchar; module_path_len: Tsize_t; pc_offset: Ppointer): longint; cdecl; external libasan;

// === Konventiert am: 10-10-26 14:05:32 ===


function __sanitizer_return_address: Pointer;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function __sanitizer_return_address: Pointer; inline;
begin
  Result := get_caller_addr(get_frame);
end;

{$ENDIF read_implementation}
