{$IFDEF read_interface}


procedure __hwasan_init_static; cdecl; external libasan;
function __hwasan_default_options: pchar; cdecl; external libasan;
procedure __hwasan_enable_allocator_tagging; cdecl; external libasan;
procedure __hwasan_disable_allocator_tagging; cdecl; external libasan;
procedure __hwasan_tag_memory(p: pointer; tag: byte; size: Tsize_t); cdecl; external libasan;
function __hwasan_tag_pointer(p: pointer; tag: byte): pointer; cdecl; external libasan;
procedure __hwasan_handle_longjmp(sp_dst: pointer); cdecl; external libasan;
procedure __hwasan_handle_vfork(sp_dst: pointer); cdecl; external libasan;
procedure __hwasan_thread_enter; cdecl; external libasan;
procedure __hwasan_thread_exit; cdecl; external libasan;
procedure __hwasan_print_shadow(x: pointer; size: Tsize_t); cdecl; external libasan;
procedure __hwasan_print_memory_usage; cdecl; external libasan;
function __hwasan_test_shadow(x: pointer; size: Tsize_t): Tintptr_t; cdecl; external libasan;
procedure __hwasan_set_error_report_callback(callback: T1PChar_func); cdecl; external libasan;
function __sanitizer_posix_memalign(memptr: Ppointer; alignment: Tsize_t; size: Tsize_t): longint; cdecl; external libasan;
function __sanitizer_memalign(alignment: Tsize_t; size: Tsize_t): pointer; cdecl; external libasan;
function __sanitizer_aligned_alloc(alignment: Tsize_t; size: Tsize_t): pointer; cdecl; external libasan;
function __sanitizer___libc_memalign(alignment: Tsize_t; size: Tsize_t): pointer; cdecl; external libasan;
function __sanitizer_valloc(size: Tsize_t): pointer; cdecl; external libasan;
function __sanitizer_pvalloc(size: Tsize_t): pointer; cdecl; external libasan;
procedure __sanitizer_free(ptr: pointer); cdecl; external libasan;
procedure __sanitizer_cfree(ptr: pointer); cdecl; external libasan;
function __sanitizer_malloc_usable_size(ptr: pointer): Tsize_t; cdecl; external libasan;
function __sanitizer_mallinfo: Tmallinfo; cdecl; external libasan;
function __sanitizer_mallopt(cmd: longint; value: longint): longint; cdecl; external libasan;
procedure __sanitizer_malloc_stats; cdecl; external libasan;
function __sanitizer_calloc(nmemb: Tsize_t; size: Tsize_t): pointer; cdecl; external libasan;
function __sanitizer_realloc(ptr: pointer; size: Tsize_t): pointer; cdecl; external libasan;
function __sanitizer_reallocarray(ptr: pointer; nmemb: Tsize_t; size: Tsize_t): pointer; cdecl; external libasan;
function __sanitizer_malloc(size: Tsize_t): pointer; cdecl; external libasan;

// === Konventiert am: 10-10-26 14:05:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
