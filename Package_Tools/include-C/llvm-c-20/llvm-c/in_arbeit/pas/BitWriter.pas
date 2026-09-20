unit BitWriter;

interface

uses
  fp_llvm, Types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function LLVMWriteBitcodeToFile(M: TLLVMModuleRef; Path: pchar): longint; cdecl; external libllvm;
function LLVMWriteBitcodeToFD(M: TLLVMModuleRef; FD: longint; ShouldClose: longint; Unbuffered: longint): longint; cdecl; external libllvm;
function LLVMWriteBitcodeToFileHandle(M: TLLVMModuleRef; Handle: longint): longint; cdecl; external libllvm;
function LLVMWriteBitcodeToMemoryBuffer(M: TLLVMModuleRef): TLLVMMemoryBufferRef; cdecl; external libllvm;

// === Konventiert am: 20-9-26 16:00:07 ===


implementation



end.
