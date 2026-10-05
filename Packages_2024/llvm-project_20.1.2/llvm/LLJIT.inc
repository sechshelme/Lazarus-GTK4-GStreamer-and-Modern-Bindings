{$IFDEF read_interface}


type
  TLLVMOrcLLJITBuilderObjectLinkingLayerCreatorFunction = function(Ctx: pointer; ES: TLLVMOrcExecutionSessionRef; Triple: pchar): TLLVMOrcObjectLayerRef; cdecl;

  PLLVMOrcLLJITBuilderRef = ^TLLVMOrcLLJITBuilderRef;
  TLLVMOrcLLJITBuilderRef = type Pointer;

  PLLVMOrcLLJITRef = ^TLLVMOrcLLJITRef;
  TLLVMOrcLLJITRef = type Pointer;

function LLVMOrcCreateLLJITBuilder: TLLVMOrcLLJITBuilderRef; cdecl; external libllvm;
procedure LLVMOrcDisposeLLJITBuilder(Builder: TLLVMOrcLLJITBuilderRef); cdecl; external libllvm;
procedure LLVMOrcLLJITBuilderSetJITTargetMachineBuilder(Builder: TLLVMOrcLLJITBuilderRef; JTMB: TLLVMOrcJITTargetMachineBuilderRef); cdecl; external libllvm;
procedure LLVMOrcLLJITBuilderSetObjectLinkingLayerCreator(Builder: TLLVMOrcLLJITBuilderRef; F: TLLVMOrcLLJITBuilderObjectLinkingLayerCreatorFunction; Ctx: pointer); cdecl; external libllvm;
function LLVMOrcCreateLLJIT(Result: PLLVMOrcLLJITRef; Builder: TLLVMOrcLLJITBuilderRef): TLLVMErrorRef; cdecl; external libllvm;
function LLVMOrcDisposeLLJIT(J: TLLVMOrcLLJITRef): TLLVMErrorRef; cdecl; external libllvm;
function LLVMOrcLLJITGetExecutionSession(J: TLLVMOrcLLJITRef): TLLVMOrcExecutionSessionRef; cdecl; external libllvm;
function LLVMOrcLLJITGetMainJITDylib(J: TLLVMOrcLLJITRef): TLLVMOrcJITDylibRef; cdecl; external libllvm;
function LLVMOrcLLJITGetTripleString(J: TLLVMOrcLLJITRef): pchar; cdecl; external libllvm;
function LLVMOrcLLJITGetGlobalPrefix(J: TLLVMOrcLLJITRef): char; cdecl; external libllvm;
function LLVMOrcLLJITMangleAndIntern(J: TLLVMOrcLLJITRef; UnmangledName: pchar): TLLVMOrcSymbolStringPoolEntryRef; cdecl; external libllvm;
function LLVMOrcLLJITAddObjectFile(J: TLLVMOrcLLJITRef; JD: TLLVMOrcJITDylibRef; ObjBuffer: TLLVMMemoryBufferRef): TLLVMErrorRef; cdecl; external libllvm;
function LLVMOrcLLJITAddObjectFileWithRT(J: TLLVMOrcLLJITRef; RT: TLLVMOrcResourceTrackerRef; ObjBuffer: TLLVMMemoryBufferRef): TLLVMErrorRef; cdecl; external libllvm;
function LLVMOrcLLJITAddLLVMIRModule(J: TLLVMOrcLLJITRef; JD: TLLVMOrcJITDylibRef; TSM: TLLVMOrcThreadSafeModuleRef): TLLVMErrorRef; cdecl; external libllvm;
function LLVMOrcLLJITAddLLVMIRModuleWithRT(J: TLLVMOrcLLJITRef; JD: TLLVMOrcResourceTrackerRef; TSM: TLLVMOrcThreadSafeModuleRef): TLLVMErrorRef; cdecl; external libllvm;
function LLVMOrcLLJITLookup(J: TLLVMOrcLLJITRef; Result: PLLVMOrcExecutorAddress; Name: pchar): TLLVMErrorRef; cdecl; external libllvm;
function LLVMOrcLLJITGetObjLinkingLayer(J: TLLVMOrcLLJITRef): TLLVMOrcObjectLayerRef; cdecl; external libllvm;
function LLVMOrcLLJITGetObjTransformLayer(J: TLLVMOrcLLJITRef): TLLVMOrcObjectTransformLayerRef; cdecl; external libllvm;
function LLVMOrcLLJITGetIRTransformLayer(J: TLLVMOrcLLJITRef): TLLVMOrcIRTransformLayerRef; cdecl; external libllvm;
function LLVMOrcLLJITGetDataLayoutStr(J: TLLVMOrcLLJITRef): pchar; cdecl; external libllvm;

// === Konventiert am: 20-9-26 17:06:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
