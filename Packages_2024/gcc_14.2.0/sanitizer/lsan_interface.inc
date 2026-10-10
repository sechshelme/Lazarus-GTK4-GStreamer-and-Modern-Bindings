{$IFDEF read_interface}


procedure __lsan_disable; cdecl; external libasan;
procedure __lsan_enable; cdecl; external libasan;
procedure __lsan_ignore_object(p: pointer); cdecl; external libasan;
procedure __lsan_register_root_region(p: pointer; size: Tsize_t); cdecl; external libasan;
procedure __lsan_unregister_root_region(p: pointer; size: Tsize_t); cdecl; external libasan;
procedure __lsan_do_leak_check; cdecl; external libasan;
function __lsan_do_recoverable_leak_check: longint; cdecl; external libasan;
function __lsan_is_turned_off: longint; cdecl; external libasan;
function __lsan_default_options: pchar; cdecl; external libasan;
function __lsan_default_suppressions: pchar; cdecl; external libasan;

// === Konventiert am: 10-10-26 14:05:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
