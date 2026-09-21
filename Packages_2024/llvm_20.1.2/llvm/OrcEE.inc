{$IFDEF read_interface}


type
  TLLVMMemoryManagerCreateContextCallback = function(CtxCtx: pointer): pointer; cdecl;
  TLLVMMemoryManagerNotifyTerminatingCallback = procedure(CtxCtx: pointer); cdecl;

function LLVMOrcCreateRTDyldObjectLinkingLayerWithSectionMemoryManager(ES: TLLVMOrcExecutionSessionRef): TLLVMOrcObjectLayerRef; cdecl; external libllvm;
function LLVMOrcCreateRTDyldObjectLinkingLayerWithMCJITMemoryManagerLikeCallbacks(ES: TLLVMOrcExecutionSessionRef; CreateContextCtx: pointer; CreateContext: TLLVMMemoryManagerCreateContextCallback; NotifyTerminating: TLLVMMemoryManagerNotifyTerminatingCallback;
  AllocateCodeSection: TLLVMMemoryManagerAllocateCodeSectionCallback;
  AllocateDataSection: TLLVMMemoryManagerAllocateDataSectionCallback; FinalizeMemory: TLLVMMemoryManagerFinalizeMemoryCallback; Destroy: TLLVMMemoryManagerDestroyCallback): TLLVMOrcObjectLayerRef; cdecl; external libllvm;
procedure LLVMOrcRTDyldObjectLinkingLayerRegisterJITEventListener(RTDyldObjLinkingLayer: TLLVMOrcObjectLayerRef; Listener: TLLVMJITEventListenerRef); cdecl; external libllvm;

// === Konventiert am: 20-9-26 17:11:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
