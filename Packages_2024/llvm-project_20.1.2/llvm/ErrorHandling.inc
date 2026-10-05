{$IFDEF read_interface}


type
  TLLVMFatalErrorHandler = procedure(Reason: pchar); cdecl;

procedure LLVMInstallFatalErrorHandler(Handler: TLLVMFatalErrorHandler); cdecl; external libllvm;
procedure LLVMResetFatalErrorHandler; cdecl; external libllvm;
procedure LLVMEnablePrettyStackTrace; cdecl; external libllvm;

// === Konventiert am: 20-9-26 17:06:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
