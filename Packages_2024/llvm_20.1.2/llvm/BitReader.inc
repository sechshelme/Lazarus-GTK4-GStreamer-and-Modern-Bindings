{$IFDEF read_interface}


function LLVMParseBitcode(MemBuf: TLLVMMemoryBufferRef; OutModule: PLLVMModuleRef; OutMessage: PPchar): TLLVMBool; cdecl; external libllvm;
function LLVMParseBitcode2(MemBuf: TLLVMMemoryBufferRef; OutModule: PLLVMModuleRef): TLLVMBool; cdecl; external libllvm;
function LLVMParseBitcodeInContext(ContextRef: TLLVMContextRef; MemBuf: TLLVMMemoryBufferRef; OutModule: PLLVMModuleRef; OutMessage: PPchar): TLLVMBool; cdecl; external libllvm;
function LLVMParseBitcodeInContext2(ContextRef: TLLVMContextRef; MemBuf: TLLVMMemoryBufferRef; OutModule: PLLVMModuleRef): TLLVMBool; cdecl; external libllvm;
function LLVMGetBitcodeModuleInContext(ContextRef: TLLVMContextRef; MemBuf: TLLVMMemoryBufferRef; OutM: PLLVMModuleRef; OutMessage: PPchar): TLLVMBool; cdecl; external libllvm;
function LLVMGetBitcodeModuleInContext2(ContextRef: TLLVMContextRef; MemBuf: TLLVMMemoryBufferRef; OutM: PLLVMModuleRef): TLLVMBool; cdecl; external libllvm;
function LLVMGetBitcodeModule(MemBuf: TLLVMMemoryBufferRef; OutM: PLLVMModuleRef; OutMessage: PPchar): TLLVMBool; cdecl; external libllvm;
function LLVMGetBitcodeModule2(MemBuf: TLLVMMemoryBufferRef; OutM: PLLVMModuleRef): TLLVMBool; cdecl; external libllvm;

// === Konventiert am: 20-9-26 16:00:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
