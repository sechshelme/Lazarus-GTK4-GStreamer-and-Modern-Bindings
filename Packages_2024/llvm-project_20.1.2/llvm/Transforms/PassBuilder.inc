{$IFDEF read_interface}


type
  PLLVMPassBuilderOptionsRef = ^TLLVMPassBuilderOptionsRef;
  TLLVMPassBuilderOptionsRef = type Pointer;

function LLVMRunPasses(M: TLLVMModuleRef; Passes: pchar; TM: TLLVMTargetMachineRef; Options: TLLVMPassBuilderOptionsRef): TLLVMErrorRef; cdecl; external libllvm;
function LLVMRunPassesOnFunction(F: TLLVMValueRef; Passes: pchar; TM: TLLVMTargetMachineRef; Options: TLLVMPassBuilderOptionsRef): TLLVMErrorRef; cdecl; external libllvm;
function LLVMCreatePassBuilderOptions: TLLVMPassBuilderOptionsRef; cdecl; external libllvm;
procedure LLVMPassBuilderOptionsSetVerifyEach(Options: TLLVMPassBuilderOptionsRef; VerifyEach: TLLVMBool); cdecl; external libllvm;
procedure LLVMPassBuilderOptionsSetDebugLogging(Options: TLLVMPassBuilderOptionsRef; DebugLogging: TLLVMBool); cdecl; external libllvm;
procedure LLVMPassBuilderOptionsSetAAPipeline(Options: TLLVMPassBuilderOptionsRef; AAPipeline: pchar); cdecl; external libllvm;
procedure LLVMPassBuilderOptionsSetLoopInterleaving(Options: TLLVMPassBuilderOptionsRef; LoopInterleaving: TLLVMBool); cdecl; external libllvm;
procedure LLVMPassBuilderOptionsSetLoopVectorization(Options: TLLVMPassBuilderOptionsRef; LoopVectorization: TLLVMBool); cdecl; external libllvm;
procedure LLVMPassBuilderOptionsSetSLPVectorization(Options: TLLVMPassBuilderOptionsRef; SLPVectorization: TLLVMBool); cdecl; external libllvm;
procedure LLVMPassBuilderOptionsSetLoopUnrolling(Options: TLLVMPassBuilderOptionsRef; LoopUnrolling: TLLVMBool); cdecl; external libllvm;
procedure LLVMPassBuilderOptionsSetForgetAllSCEVInLoopUnroll(Options: TLLVMPassBuilderOptionsRef; ForgetAllSCEVInLoopUnroll: TLLVMBool); cdecl; external libllvm;
procedure LLVMPassBuilderOptionsSetLicmMssaOptCap(Options: TLLVMPassBuilderOptionsRef; LicmMssaOptCap: dword); cdecl; external libllvm;
procedure LLVMPassBuilderOptionsSetLicmMssaNoAccForPromotionCap(Options: TLLVMPassBuilderOptionsRef; LicmMssaNoAccForPromotionCap: dword); cdecl; external libllvm;
procedure LLVMPassBuilderOptionsSetCallGraphProfile(Options: TLLVMPassBuilderOptionsRef; CallGraphProfile: TLLVMBool); cdecl; external libllvm;
procedure LLVMPassBuilderOptionsSetMergeFunctions(Options: TLLVMPassBuilderOptionsRef; MergeFunctions: TLLVMBool); cdecl; external libllvm;
procedure LLVMPassBuilderOptionsSetInlinerThreshold(Options: TLLVMPassBuilderOptionsRef; Threshold: longint); cdecl; external libllvm;
procedure LLVMDisposePassBuilderOptions(Options: TLLVMPassBuilderOptionsRef); cdecl; external libllvm;

// === Konventiert am: 20-9-26 17:15:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
