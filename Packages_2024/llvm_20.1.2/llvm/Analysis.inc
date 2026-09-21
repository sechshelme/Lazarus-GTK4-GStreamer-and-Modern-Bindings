{$IFDEF read_interface}


type
  PLLVMVerifierFailureAction = ^TLLVMVerifierFailureAction;
  TLLVMVerifierFailureAction = longint;
const
  LLVMAbortProcessAction = 0;
  LLVMPrintMessageAction = 1;
  LLVMReturnStatusAction = 2;

function LLVMVerifyModule(M: TLLVMModuleRef; Action: TLLVMVerifierFailureAction; OutMessage: PPchar): TLLVMBool; cdecl; external libllvm;
function LLVMVerifyFunction(Fn: TLLVMValueRef; Action: TLLVMVerifierFailureAction): TLLVMBool; cdecl; external libllvm;
procedure LLVMViewFunctionCFG(Fn: TLLVMValueRef); cdecl; external libllvm;
procedure LLVMViewFunctionCFGOnly(Fn: TLLVMValueRef); cdecl; external libllvm;

// === Konventiert am: 20-9-26 16:00:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
