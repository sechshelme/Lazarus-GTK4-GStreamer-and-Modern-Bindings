unit Linker;

interface

uses
  fp_llvm, Types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PLLVMLinkerMode = ^TLLVMLinkerMode;
  TLLVMLinkerMode = longint;
const
  LLVMLinkerDestroySource = 0;
  LLVMLinkerPreserveSource_Removed = 1;

function LLVMLinkModules2(Dest: TLLVMModuleRef; Src: TLLVMModuleRef): TLLVMBool; cdecl; external libllvm;

// === Konventiert am: 20-9-26 17:06:39 ===


implementation



end.
