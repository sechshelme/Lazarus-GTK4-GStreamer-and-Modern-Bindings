{$IFDEF read_interface}


procedure LLVMLinkInMCJIT; cdecl; external libllvm;
procedure LLVMLinkInInterpreter; cdecl; external libllvm;

type
  PLLVMGenericValueRef = ^TLLVMGenericValueRef;
  TLLVMGenericValueRef = type Pointer;

  PLLVMExecutionEngineRef = ^TLLVMExecutionEngineRef;
  TLLVMExecutionEngineRef = type Pointer;

  PLLVMMCJITMemoryManagerRef = ^TLLVMMCJITMemoryManagerRef;
  TLLVMMCJITMemoryManagerRef = type Pointer;

  PLLVMMCJITCompilerOptions = ^TLLVMMCJITCompilerOptions;
  TLLVMMCJITCompilerOptions = record
    OptLevel: dword;
    CodeModel: TLLVMCodeModel;
    NoFramePointerElim: TLLVMBool;
    EnableFastISel: TLLVMBool;
    MCJMM: TLLVMMCJITMemoryManagerRef;
  end;

function LLVMCreateGenericValueOfInt(Ty: TLLVMTypeRef; N: qword; IsSigned: TLLVMBool): TLLVMGenericValueRef; cdecl; external libllvm;
function LLVMCreateGenericValueOfPointer(P: pointer): TLLVMGenericValueRef; cdecl; external libllvm;
function LLVMCreateGenericValueOfFloat(Ty: TLLVMTypeRef; N: double): TLLVMGenericValueRef; cdecl; external libllvm;
function LLVMGenericValueIntWidth(GenValRef: TLLVMGenericValueRef): dword; cdecl; external libllvm;
function LLVMGenericValueToInt(GenVal: TLLVMGenericValueRef; IsSigned: TLLVMBool): qword; cdecl; external libllvm;
function LLVMGenericValueToPointer(GenVal: TLLVMGenericValueRef): pointer; cdecl; external libllvm;
function LLVMGenericValueToFloat(TyRef: TLLVMTypeRef; GenVal: TLLVMGenericValueRef): double; cdecl; external libllvm;
procedure LLVMDisposeGenericValue(GenVal: TLLVMGenericValueRef); cdecl; external libllvm;

function LLVMCreateExecutionEngineForModule(OutEE: PLLVMExecutionEngineRef; M: TLLVMModuleRef; OutError: PPchar): TLLVMBool; cdecl; external libllvm;
function LLVMCreateInterpreterForModule(OutInterp: PLLVMExecutionEngineRef; M: TLLVMModuleRef; OutError: PPchar): TLLVMBool; cdecl; external libllvm;
function LLVMCreateJITCompilerForModule(OutJIT: PLLVMExecutionEngineRef; M: TLLVMModuleRef; OptLevel: dword; OutError: PPchar): TLLVMBool; cdecl; external libllvm;
procedure LLVMInitializeMCJITCompilerOptions(Options: PLLVMMCJITCompilerOptions; SizeOfOptions: Tsize_t); cdecl; external libllvm;

function LLVMCreateMCJITCompilerForModule(OutJIT: PLLVMExecutionEngineRef; M: TLLVMModuleRef; Options: PLLVMMCJITCompilerOptions; SizeOfOptions: Tsize_t; OutError: PPchar): TLLVMBool; cdecl; external libllvm;
procedure LLVMDisposeExecutionEngine(EE: TLLVMExecutionEngineRef); cdecl; external libllvm;
procedure LLVMRunStaticConstructors(EE: TLLVMExecutionEngineRef); cdecl; external libllvm;
procedure LLVMRunStaticDestructors(EE: TLLVMExecutionEngineRef); cdecl; external libllvm;
function LLVMRunFunctionAsMain(EE: TLLVMExecutionEngineRef; F: TLLVMValueRef; ArgC: dword; ArgV: PPchar; EnvP: PPchar): longint; cdecl; external libllvm;
function LLVMRunFunction(EE: TLLVMExecutionEngineRef; F: TLLVMValueRef; NumArgs: dword; Args: PLLVMGenericValueRef): TLLVMGenericValueRef; cdecl; external libllvm;
procedure LLVMFreeMachineCodeForFunction(EE: TLLVMExecutionEngineRef; F: TLLVMValueRef); cdecl; external libllvm;
procedure LLVMAddModule(EE: TLLVMExecutionEngineRef; M: TLLVMModuleRef); cdecl; external libllvm;
function LLVMRemoveModule(EE: TLLVMExecutionEngineRef; M: TLLVMModuleRef; OutMod: PLLVMModuleRef; OutError: PPchar): TLLVMBool; cdecl; external libllvm;
function LLVMFindFunction(EE: TLLVMExecutionEngineRef; Name: pchar; OutFn: PLLVMValueRef): TLLVMBool; cdecl; external libllvm;
function LLVMRecompileAndRelinkFunction(EE: TLLVMExecutionEngineRef; Fn: TLLVMValueRef): pointer; cdecl; external libllvm;
function LLVMGetExecutionEngineTargetData(EE: TLLVMExecutionEngineRef): TLLVMTargetDataRef; cdecl; external libllvm;
function LLVMGetExecutionEngineTargetMachine(EE: TLLVMExecutionEngineRef): TLLVMTargetMachineRef; cdecl; external libllvm;
procedure LLVMAddGlobalMapping(EE: TLLVMExecutionEngineRef; Global: TLLVMValueRef; Addr: pointer); cdecl; external libllvm;
function LLVMGetPointerToGlobal(EE: TLLVMExecutionEngineRef; Global: TLLVMValueRef): pointer; cdecl; external libllvm;
function LLVMGetGlobalValueAddress(EE: TLLVMExecutionEngineRef; Name: pchar): Tuint64_t; cdecl; external libllvm;
function LLVMGetFunctionAddress(EE: TLLVMExecutionEngineRef; Name: pchar): Tuint64_t; cdecl; external libllvm;
function LLVMExecutionEngineGetErrMsg(EE: TLLVMExecutionEngineRef; OutError: PPchar): TLLVMBool; cdecl; external libllvm;

type
  TLLVMMemoryManagerAllocateCodeSectionCallback = function(Opaque: pointer; Size: Tuintptr_t; Alignment: dword; SectionID: dword; SectionName: pchar): Puint8_t; cdecl;
  TLLVMMemoryManagerAllocateDataSectionCallback = function(Opaque: pointer; Size: Tuintptr_t; Alignment: dword; SectionID: dword; SectionName: pchar; IsReadOnly: TLLVMBool): Puint8_t; cdecl;
  TLLVMMemoryManagerFinalizeMemoryCallback = function(Opaque: pointer; ErrMsg: PPchar): TLLVMBool; cdecl;
  TLLVMMemoryManagerDestroyCallback = procedure(Opaque: pointer); cdecl;

function LLVMCreateSimpleMCJITMemoryManager(Opaque: pointer; AllocateCodeSection: TLLVMMemoryManagerAllocateCodeSectionCallback; AllocateDataSection: TLLVMMemoryManagerAllocateDataSectionCallback; FinalizeMemory: TLLVMMemoryManagerFinalizeMemoryCallback;
  Destroy: TLLVMMemoryManagerDestroyCallback): TLLVMMCJITMemoryManagerRef; cdecl; external libllvm;
procedure LLVMDisposeMCJITMemoryManager(MM: TLLVMMCJITMemoryManagerRef); cdecl; external libllvm;

function LLVMCreateGDBRegistrationListener: TLLVMJITEventListenerRef; cdecl; external libllvm;
function LLVMCreateIntelJITEventListener: TLLVMJITEventListenerRef; cdecl; external libllvm;
function LLVMCreateOProfileJITEventListener: TLLVMJITEventListenerRef; cdecl; external libllvm;
function LLVMCreatePerfJITEventListener: TLLVMJITEventListenerRef; cdecl; external libllvm;

// === Konventiert am: 20-9-26 17:06:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
