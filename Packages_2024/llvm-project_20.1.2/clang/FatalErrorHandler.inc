{$IFDEF read_interface}


procedure clang_install_aborting_llvm_fatal_error_handler; cdecl; external libclang;
procedure clang_uninstall_llvm_fatal_error_handler; cdecl; external libclang;

// === Konventiert am: 4-10-26 17:29:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
