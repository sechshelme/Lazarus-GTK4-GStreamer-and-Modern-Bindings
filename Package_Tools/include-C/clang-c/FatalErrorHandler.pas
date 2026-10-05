unit FatalErrorHandler;

interface

uses
  fp_clang;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure clang_install_aborting_llvm_fatal_error_handler; cdecl; external libclang;
procedure clang_uninstall_llvm_fatal_error_handler; cdecl; external libclang;

// === Konventiert am: 4-10-26 17:29:45 ===


implementation



end.
