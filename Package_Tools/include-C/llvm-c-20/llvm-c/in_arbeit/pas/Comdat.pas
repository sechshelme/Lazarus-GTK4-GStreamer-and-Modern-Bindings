unit Comdat;

interface

uses
  fp_llvm, Types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PLLVMComdatSelectionKind = ^TLLVMComdatSelectionKind;
  TLLVMComdatSelectionKind = longint;
const
  LLVMAnyComdatSelectionKind = 0;
  LLVMExactMatchComdatSelectionKind = 1;
  LLVMLargestComdatSelectionKind = 2;
  LLVMNoDeduplicateComdatSelectionKind = 3;
  LLVMSameSizeComdatSelectionKind = 4;

function LLVMGetOrInsertComdat(M: TLLVMModuleRef; Name: pchar): TLLVMComdatRef; cdecl; external libllvm;
function LLVMGetComdat(V: TLLVMValueRef): TLLVMComdatRef; cdecl; external libllvm;
procedure LLVMSetComdat(V: TLLVMValueRef; C: TLLVMComdatRef); cdecl; external libllvm;
function LLVMGetComdatSelectionKind(C: TLLVMComdatRef): TLLVMComdatSelectionKind; cdecl; external libllvm;
procedure LLVMSetComdatSelectionKind(C: TLLVMComdatRef; Kind: TLLVMComdatSelectionKind); cdecl; external libllvm;

// === Konventiert am: 20-9-26 16:00:02 ===


implementation



end.
