unit IRReader;

interface

uses
  fp_llvm, Types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function LLVMParseIRInContext(ContextRef: TLLVMContextRef; MemBuf: TLLVMMemoryBufferRef; OutM: PLLVMModuleRef; OutMessage: PPchar): TLLVMBool; cdecl; external libllvm;

// === Konventiert am: 20-9-26 17:06:37 ===


implementation



end.
