{$IFDEF read_interface}


type
  PLLVMTargetMachineOptionsRef = ^TLLVMTargetMachineOptionsRef;
  TLLVMTargetMachineOptionsRef = type Pointer;

  PLLVMTargetMachineRef = ^TLLVMTargetMachineRef;
  TLLVMTargetMachineRef = type Pointer;

  PLLVMTargetRef = ^TLLVMTargetRef;
  TLLVMTargetRef = type Pointer;

type
  PLLVMCodeGenOptLevel = ^TLLVMCodeGenOptLevel;
  TLLVMCodeGenOptLevel = longint;
const
  LLVMCodeGenLevelNone = 0;
  LLVMCodeGenLevelLess = 1;
  LLVMCodeGenLevelDefault = 2;
  LLVMCodeGenLevelAggressive = 3;

type
  PLLVMRelocMode = ^TLLVMRelocMode;
  TLLVMRelocMode = longint;
const
  LLVMRelocDefault = 0;
  LLVMRelocStatic = 1;
  LLVMRelocPIC = 2;
  LLVMRelocDynamicNoPic = 3;
  LLVMRelocROPI = 4;
  LLVMRelocRWPI = 5;
  LLVMRelocROPI_RWPI = 6;

type
  PLLVMCodeModel = ^TLLVMCodeModel;
  TLLVMCodeModel = longint;
const
  LLVMCodeModelDefault = 0;
  LLVMCodeModelJITDefault = 1;
  LLVMCodeModelTiny = 2;
  LLVMCodeModelSmall = 3;
  LLVMCodeModelKernel = 4;
  LLVMCodeModelMedium = 5;
  LLVMCodeModelLarge = 6;

type
  PLLVMCodeGenFileType = ^TLLVMCodeGenFileType;
  TLLVMCodeGenFileType = longint;
const
  LLVMAssemblyFile = 0;
  LLVMObjectFile = 1;

type
  PLLVMGlobalISelAbortMode = ^TLLVMGlobalISelAbortMode;
  TLLVMGlobalISelAbortMode = longint;
const
  LLVMGlobalISelAbortEnable = 0;
  LLVMGlobalISelAbortDisable = 1;
  LLVMGlobalISelAbortDisableWithDiag = 2;

function LLVMGetFirstTarget: TLLVMTargetRef; cdecl; external libllvm;
function LLVMGetNextTarget(T: TLLVMTargetRef): TLLVMTargetRef; cdecl; external libllvm;
function LLVMGetTargetFromName(Name: pchar): TLLVMTargetRef; cdecl; external libllvm;
function LLVMGetTargetFromTriple(Triple: pchar; T: PLLVMTargetRef; ErrorMessage: PPchar): TLLVMBool; cdecl; external libllvm;
function LLVMGetTargetName(T: TLLVMTargetRef): pchar; cdecl; external libllvm;
function LLVMGetTargetDescription(T: TLLVMTargetRef): pchar; cdecl; external libllvm;
function LLVMTargetHasJIT(T: TLLVMTargetRef): TLLVMBool; cdecl; external libllvm;
function LLVMTargetHasTargetMachine(T: TLLVMTargetRef): TLLVMBool; cdecl; external libllvm;
function LLVMTargetHasAsmBackend(T: TLLVMTargetRef): TLLVMBool; cdecl; external libllvm;

function LLVMCreateTargetMachineOptions: TLLVMTargetMachineOptionsRef; cdecl; external libllvm;
procedure LLVMDisposeTargetMachineOptions(Options: TLLVMTargetMachineOptionsRef); cdecl; external libllvm;
procedure LLVMTargetMachineOptionsSetCPU(Options: TLLVMTargetMachineOptionsRef; CPU: pchar); cdecl; external libllvm;

procedure LLVMTargetMachineOptionsSetFeatures(Options: TLLVMTargetMachineOptionsRef; Features: pchar); cdecl; external libllvm;
procedure LLVMTargetMachineOptionsSetABI(Options: TLLVMTargetMachineOptionsRef; ABI: pchar); cdecl; external libllvm;
procedure LLVMTargetMachineOptionsSetCodeGenOptLevel(Options: TLLVMTargetMachineOptionsRef; Level: TLLVMCodeGenOptLevel); cdecl; external libllvm;
procedure LLVMTargetMachineOptionsSetRelocMode(Options: TLLVMTargetMachineOptionsRef; Reloc: TLLVMRelocMode); cdecl; external libllvm;
procedure LLVMTargetMachineOptionsSetCodeModel(Options: TLLVMTargetMachineOptionsRef; CodeModel: TLLVMCodeModel); cdecl; external libllvm;

function LLVMCreateTargetMachineWithOptions(T: TLLVMTargetRef; Triple: pchar; Options: TLLVMTargetMachineOptionsRef): TLLVMTargetMachineRef; cdecl; external libllvm;
function LLVMCreateTargetMachine(T: TLLVMTargetRef; Triple: pchar; CPU: pchar; Features: pchar; Level: TLLVMCodeGenOptLevel;
  Reloc: TLLVMRelocMode; CodeModel: TLLVMCodeModel): TLLVMTargetMachineRef; cdecl; external libllvm;
procedure LLVMDisposeTargetMachine(T: TLLVMTargetMachineRef); cdecl; external libllvm;
function LLVMGetTargetMachineTarget(T: TLLVMTargetMachineRef): TLLVMTargetRef; cdecl; external libllvm;
function LLVMGetTargetMachineTriple(T: TLLVMTargetMachineRef): pchar; cdecl; external libllvm;
function LLVMGetTargetMachineCPU(T: TLLVMTargetMachineRef): pchar; cdecl; external libllvm;
function LLVMGetTargetMachineFeatureString(T: TLLVMTargetMachineRef): pchar; cdecl; external libllvm;
function LLVMCreateTargetDataLayout(T: TLLVMTargetMachineRef): TLLVMTargetDataRef; cdecl; external libllvm;
procedure LLVMSetTargetMachineAsmVerbosity(T: TLLVMTargetMachineRef; VerboseAsm: TLLVMBool); cdecl; external libllvm;
procedure LLVMSetTargetMachineFastISel(T: TLLVMTargetMachineRef; Enable: TLLVMBool); cdecl; external libllvm;
procedure LLVMSetTargetMachineGlobalISel(T: TLLVMTargetMachineRef; Enable: TLLVMBool); cdecl; external libllvm;
procedure LLVMSetTargetMachineGlobalISelAbort(T: TLLVMTargetMachineRef; Mode: TLLVMGlobalISelAbortMode); cdecl; external libllvm;
procedure LLVMSetTargetMachineMachineOutliner(T: TLLVMTargetMachineRef; Enable: TLLVMBool); cdecl; external libllvm;
function LLVMTargetMachineEmitToFile(T: TLLVMTargetMachineRef; M: TLLVMModuleRef; Filename: pchar; codegen: TLLVMCodeGenFileType; ErrorMessage: PPchar): TLLVMBool; cdecl; external libllvm;
function LLVMTargetMachineEmitToMemoryBuffer(T: TLLVMTargetMachineRef; M: TLLVMModuleRef; codegen: TLLVMCodeGenFileType; ErrorMessage: PPchar; OutMemBuf: PLLVMMemoryBufferRef): TLLVMBool; cdecl; external libllvm;

function LLVMGetDefaultTargetTriple: pchar; cdecl; external libllvm;
function LLVMNormalizeTargetTriple(triple: pchar): pchar; cdecl; external libllvm;
function LLVMGetHostCPUName: pchar; cdecl; external libllvm;
function LLVMGetHostCPUFeatures: pchar; cdecl; external libllvm;
procedure LLVMAddAnalysisPasses(T: TLLVMTargetMachineRef; PM: TLLVMPassManagerRef); cdecl; external libllvm;

// === Konventiert am: 20-9-26 17:11:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
