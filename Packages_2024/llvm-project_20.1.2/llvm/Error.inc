{$IFDEF read_interface}


const
  LLVMErrorSuccess = 0;

type
  PLLVMErrorRef = ^TLLVMErrorRef;
  TLLVMErrorRef = type Pointer;

  PLLVMErrorTypeId = ^TLLVMErrorTypeId;
  TLLVMErrorTypeId = pointer;

function LLVMGetErrorTypeId(Err: TLLVMErrorRef): TLLVMErrorTypeId; cdecl; external libllvm;
procedure LLVMConsumeError(Err: TLLVMErrorRef); cdecl; external libllvm;
procedure LLVMCantFail(Err: TLLVMErrorRef); cdecl; external libllvm;
function LLVMGetErrorMessage(Err: TLLVMErrorRef): pchar; cdecl; external libllvm;
procedure LLVMDisposeErrorMessage(ErrMsg: pchar); cdecl; external libllvm;
function LLVMGetStringErrorTypeId: TLLVMErrorTypeId; cdecl; external libllvm;
function LLVMCreateStringError(ErrMsg: pchar): TLLVMErrorRef; cdecl; external libllvm;

// === Konventiert am: 20-9-26 17:06:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
