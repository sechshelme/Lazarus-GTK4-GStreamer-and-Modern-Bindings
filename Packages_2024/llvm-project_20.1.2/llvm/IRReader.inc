{$IFDEF read_interface}


function LLVMParseIRInContext(ContextRef: TLLVMContextRef; MemBuf: TLLVMMemoryBufferRef; OutM: PLLVMModuleRef; OutMessage: PPchar): TLLVMBool; cdecl; external libllvm;

// === Konventiert am: 20-9-26 17:06:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
