{$IFDEF read_interface}


type
  PLLVMOrcJITTargetAddress = ^TLLVMOrcJITTargetAddress;
  TLLVMOrcJITTargetAddress = Tuint64_t;

  PLLVMOrcExecutorAddress = ^TLLVMOrcExecutorAddress;
  TLLVMOrcExecutorAddress = Tuint64_t;

type
  PLLVMJITSymbolGenericFlags = ^TLLVMJITSymbolGenericFlags;
  TLLVMJITSymbolGenericFlags = longint;
const
  LLVMJITSymbolGenericFlagsNone = 0;
  LLVMJITSymbolGenericFlagsExported = 1 shl 0;
  LLVMJITSymbolGenericFlagsWeak = 1 shl 1;
  LLVMJITSymbolGenericFlagsCallable = 1 shl 2;
  LLVMJITSymbolGenericFlagsMaterializationSideEffectsOnly = 1 shl 3;

type
  PLLVMJITSymbolTargetFlags = ^TLLVMJITSymbolTargetFlags;
  TLLVMJITSymbolTargetFlags = Tuint8_t;

  PLLVMJITSymbolFlags = ^TLLVMJITSymbolFlags;
  TLLVMJITSymbolFlags = record
    GenericFlags: Tuint8_t;
    TargetFlags: Tuint8_t;
  end;

  PLLVMJITEvaluatedSymbol = ^TLLVMJITEvaluatedSymbol;
  TLLVMJITEvaluatedSymbol = record
    Address: TLLVMOrcExecutorAddress;
    Flags: TLLVMJITSymbolFlags;
  end;

  PLLVMOrcExecutionSessionRef = ^TLLVMOrcExecutionSessionRef;
  TLLVMOrcExecutionSessionRef = type Pointer;

  TLLVMOrcErrorReporterFunction = procedure(Ctx: pointer; Err: TLLVMErrorRef); cdecl;

  PLLVMOrcSymbolStringPoolRef = ^TLLVMOrcSymbolStringPoolRef;
  TLLVMOrcSymbolStringPoolRef = type Pointer;

  PLLVMOrcSymbolStringPoolEntryRef = ^TLLVMOrcSymbolStringPoolEntryRef;
  TLLVMOrcSymbolStringPoolEntryRef = type Pointer;

  PLLVMOrcCSymbolFlagsMapPair = ^TLLVMOrcCSymbolFlagsMapPair;
  TLLVMOrcCSymbolFlagsMapPair = record
    Name: TLLVMOrcSymbolStringPoolEntryRef;
    Flags: TLLVMJITSymbolFlags;
  end;

  PLLVMOrcCSymbolFlagsMapPairs = ^TLLVMOrcCSymbolFlagsMapPairs;
  TLLVMOrcCSymbolFlagsMapPairs = PLLVMOrcCSymbolFlagsMapPair;

  PLLVMOrcCSymbolMapPair = ^TLLVMOrcCSymbolMapPair;
  TLLVMOrcCSymbolMapPair = record
    Name: TLLVMOrcSymbolStringPoolEntryRef;
    Sym: TLLVMJITEvaluatedSymbol;
  end;

  PLLVMOrcCSymbolMapPairs = ^TLLVMOrcCSymbolMapPairs;
  TLLVMOrcCSymbolMapPairs = PLLVMOrcCSymbolMapPair;

  PLLVMOrcCSymbolAliasMapEntry = ^TLLVMOrcCSymbolAliasMapEntry;
  TLLVMOrcCSymbolAliasMapEntry = record
    Name: TLLVMOrcSymbolStringPoolEntryRef;
    Flags: TLLVMJITSymbolFlags;
  end;

  PLLVMOrcCSymbolAliasMapPair = ^TLLVMOrcCSymbolAliasMapPair;
  TLLVMOrcCSymbolAliasMapPair = record
    Name: TLLVMOrcSymbolStringPoolEntryRef;
    Entry: TLLVMOrcCSymbolAliasMapEntry;
  end;

  PLLVMOrcCSymbolAliasMapPairs = ^TLLVMOrcCSymbolAliasMapPairs;
  TLLVMOrcCSymbolAliasMapPairs = PLLVMOrcCSymbolAliasMapPair;

  PLLVMOrcJITDylibRef = ^TLLVMOrcJITDylibRef;
  TLLVMOrcJITDylibRef = type Pointer;

  PLLVMOrcCSymbolsList = ^TLLVMOrcCSymbolsList;
  TLLVMOrcCSymbolsList = record
    Symbols: PLLVMOrcSymbolStringPoolEntryRef;
    Length: Tsize_t;
  end;

  PLLVMOrcCDependenceMapPair = ^TLLVMOrcCDependenceMapPair;
  TLLVMOrcCDependenceMapPair = record
    JD: TLLVMOrcJITDylibRef;
    Names: TLLVMOrcCSymbolsList;
  end;

  PLLVMOrcCDependenceMapPairs = ^TLLVMOrcCDependenceMapPairs;
  TLLVMOrcCDependenceMapPairs = PLLVMOrcCDependenceMapPair;

  PLLVMOrcCSymbolDependenceGroup = ^TLLVMOrcCSymbolDependenceGroup;
  TLLVMOrcCSymbolDependenceGroup = record
    Symbols: TLLVMOrcCSymbolsList;
    Dependencies: TLLVMOrcCDependenceMapPairs;
    NumDependencies: Tsize_t;
  end;

type
  PLLVMOrcLookupKind = ^TLLVMOrcLookupKind;
  TLLVMOrcLookupKind = longint;
const
  LLVMOrcLookupKindStatic = 0;
  LLVMOrcLookupKindDLSym = 1;

type
  PLLVMOrcJITDylibLookupFlags = ^TLLVMOrcJITDylibLookupFlags;
  TLLVMOrcJITDylibLookupFlags = longint;
const
  LLVMOrcJITDylibLookupFlagsMatchExportedSymbolsOnly = 0;
  LLVMOrcJITDylibLookupFlagsMatchAllSymbols = 1;

type
  PLLVMOrcCJITDylibSearchOrderElement = ^TLLVMOrcCJITDylibSearchOrderElement;
  TLLVMOrcCJITDylibSearchOrderElement = record
    JD: TLLVMOrcJITDylibRef;
    JDLookupFlags: TLLVMOrcJITDylibLookupFlags;
  end;

  PLLVMOrcCJITDylibSearchOrder = ^TLLVMOrcCJITDylibSearchOrder;
  TLLVMOrcCJITDylibSearchOrder = PLLVMOrcCJITDylibSearchOrderElement;

  PLLVMOrcSymbolLookupFlags = ^TLLVMOrcSymbolLookupFlags;
  TLLVMOrcSymbolLookupFlags = longint;
const
  LLVMOrcSymbolLookupFlagsRequiredSymbol = 0;
  LLVMOrcSymbolLookupFlagsWeaklyReferencedSymbol = 1;

type
  PLLVMOrcCLookupSetElement = ^TLLVMOrcCLookupSetElement;
  TLLVMOrcCLookupSetElement = record
    Name: TLLVMOrcSymbolStringPoolEntryRef;
    LookupFlags: TLLVMOrcSymbolLookupFlags;
  end;

  PLLVMOrcCLookupSet = ^TLLVMOrcCLookupSet;
  TLLVMOrcCLookupSet = PLLVMOrcCLookupSetElement;

  PLLVMOrcMaterializationUnitRef = ^TLLVMOrcMaterializationUnitRef;
  TLLVMOrcMaterializationUnitRef = type Pointer;

  PLLVMOrcMaterializationResponsibilityRef = ^TLLVMOrcMaterializationResponsibilityRef;
  TLLVMOrcMaterializationResponsibilityRef = type Pointer;

  TLLVMOrcMaterializationUnitMaterializeFunction = procedure(Ctx: pointer; MR: TLLVMOrcMaterializationResponsibilityRef); cdecl;
  TLLVMOrcMaterializationUnitDiscardFunction = procedure(Ctx: pointer; JD: TLLVMOrcJITDylibRef; Symbol: TLLVMOrcSymbolStringPoolEntryRef); cdecl;
  TLLVMOrcMaterializationUnitDestroyFunction = procedure(Ctx: pointer); cdecl;

  PLLVMOrcResourceTrackerRef = ^TLLVMOrcResourceTrackerRef;
  TLLVMOrcResourceTrackerRef = type Pointer;

  PLLVMOrcDefinitionGeneratorRef = ^TLLVMOrcDefinitionGeneratorRef;
  TLLVMOrcDefinitionGeneratorRef = type Pointer;

  PLLVMOrcLookupStateRef = ^TLLVMOrcLookupStateRef;
  TLLVMOrcLookupStateRef = type Pointer;

  TLLVMOrcCAPIDefinitionGeneratorTryToGenerateFunction = function(GeneratorObj: TLLVMOrcDefinitionGeneratorRef; Ctx: pointer; LookupState: PLLVMOrcLookupStateRef; Kind: TLLVMOrcLookupKind; JD: TLLVMOrcJITDylibRef; JDLookupFlags: TLLVMOrcJITDylibLookupFlags;
    LookupSet: TLLVMOrcCLookupSet; LookupSetSize: Tsize_t): TLLVMErrorRef; cdecl;
  TLLVMOrcDisposeCAPIDefinitionGeneratorFunction = procedure(Ctx: pointer); cdecl;
  TLLVMOrcSymbolPredicate = function(Ctx: pointer; Sym: TLLVMOrcSymbolStringPoolEntryRef): longint; cdecl;

  PLLVMOrcThreadSafeContextRef = ^TLLVMOrcThreadSafeContextRef;
  TLLVMOrcThreadSafeContextRef = type Pointer;

  PLLVMOrcThreadSafeModuleRef = ^TLLVMOrcThreadSafeModuleRef;
  TLLVMOrcThreadSafeModuleRef = type Pointer;

  TLLVMOrcGenericIRModuleOperationFunction = function(Ctx: pointer; M: TLLVMModuleRef): TLLVMErrorRef; cdecl;

  PLLVMOrcJITTargetMachineBuilderRef = ^TLLVMOrcJITTargetMachineBuilderRef;
  TLLVMOrcJITTargetMachineBuilderRef = type Pointer;

  PLLVMOrcObjectLayerRef = ^TLLVMOrcObjectLayerRef;
  TLLVMOrcObjectLayerRef = type Pointer;

  PLLVMOrcObjectLinkingLayerRef = ^TLLVMOrcObjectLinkingLayerRef;
  TLLVMOrcObjectLinkingLayerRef = type Pointer;

  PLLVMOrcIRTransformLayerRef = ^TLLVMOrcIRTransformLayerRef;
  TLLVMOrcIRTransformLayerRef = type Pointer;

  TLLVMOrcIRTransformLayerTransformFunction = function(Ctx: pointer; ModInOut: PLLVMOrcThreadSafeModuleRef; MR: TLLVMOrcMaterializationResponsibilityRef): TLLVMErrorRef; cdecl;

  PLLVMOrcObjectTransformLayerRef = ^TLLVMOrcObjectTransformLayerRef;
  TLLVMOrcObjectTransformLayerRef = type Pointer;

  TLLVMOrcObjectTransformLayerTransformFunction = function(Ctx: pointer; ObjInOut: PLLVMMemoryBufferRef): TLLVMErrorRef; cdecl;

  PLLVMOrcIndirectStubsManagerRef = ^TLLVMOrcIndirectStubsManagerRef;
  TLLVMOrcIndirectStubsManagerRef = type Pointer;

  PLLVMOrcLazyCallThroughManagerRef = ^TLLVMOrcLazyCallThroughManagerRef;
  TLLVMOrcLazyCallThroughManagerRef = type Pointer;

  PLLVMOrcDumpObjectsRef = ^TLLVMOrcDumpObjectsRef;
  TLLVMOrcDumpObjectsRef = type Pointer;

procedure LLVMOrcExecutionSessionSetErrorReporter(ES: TLLVMOrcExecutionSessionRef; ReportError: TLLVMOrcErrorReporterFunction; Ctx: pointer); cdecl; external libllvm;
function LLVMOrcExecutionSessionGetSymbolStringPool(ES: TLLVMOrcExecutionSessionRef): TLLVMOrcSymbolStringPoolRef; cdecl; external libllvm;
procedure LLVMOrcSymbolStringPoolClearDeadEntries(SSP: TLLVMOrcSymbolStringPoolRef); cdecl; external libllvm;
function LLVMOrcExecutionSessionIntern(ES: TLLVMOrcExecutionSessionRef; Name: pchar): TLLVMOrcSymbolStringPoolEntryRef; cdecl; external libllvm;

type
  TLLVMOrcExecutionSessionLookupHandleResultFunction = procedure(Err: TLLVMErrorRef; Result: TLLVMOrcCSymbolMapPairs; NumPairs: Tsize_t; Ctx: pointer); cdecl;

procedure LLVMOrcExecutionSessionLookup(ES: TLLVMOrcExecutionSessionRef; K: TLLVMOrcLookupKind; SearchOrder: TLLVMOrcCJITDylibSearchOrder; SearchOrderSize: Tsize_t; Symbols: TLLVMOrcCLookupSet;
  SymbolsSize: Tsize_t; HandleResult: TLLVMOrcExecutionSessionLookupHandleResultFunction; Ctx: pointer); cdecl; external libllvm;
procedure LLVMOrcRetainSymbolStringPoolEntry(S: TLLVMOrcSymbolStringPoolEntryRef); cdecl; external libllvm;
procedure LLVMOrcReleaseSymbolStringPoolEntry(S: TLLVMOrcSymbolStringPoolEntryRef); cdecl; external libllvm;
function LLVMOrcSymbolStringPoolEntryStr(S: TLLVMOrcSymbolStringPoolEntryRef): pchar; cdecl; external libllvm;
procedure LLVMOrcReleaseResourceTracker(RT: TLLVMOrcResourceTrackerRef); cdecl; external libllvm;
procedure LLVMOrcResourceTrackerTransferTo(SrcRT: TLLVMOrcResourceTrackerRef; DstRT: TLLVMOrcResourceTrackerRef); cdecl; external libllvm;
function LLVMOrcResourceTrackerRemove(RT: TLLVMOrcResourceTrackerRef): TLLVMErrorRef; cdecl; external libllvm;
procedure LLVMOrcDisposeDefinitionGenerator(DG: TLLVMOrcDefinitionGeneratorRef); cdecl; external libllvm;
procedure LLVMOrcDisposeMaterializationUnit(MU: TLLVMOrcMaterializationUnitRef); cdecl; external libllvm;
function LLVMOrcCreateCustomMaterializationUnit(Name: pchar; Ctx: pointer; Syms: TLLVMOrcCSymbolFlagsMapPairs; NumSyms: Tsize_t; InitSym: TLLVMOrcSymbolStringPoolEntryRef;
  Materialize: TLLVMOrcMaterializationUnitMaterializeFunction; Discard: TLLVMOrcMaterializationUnitDiscardFunction; Destroy: TLLVMOrcMaterializationUnitDestroyFunction): TLLVMOrcMaterializationUnitRef; cdecl; external libllvm;
function LLVMOrcAbsoluteSymbols(Syms: TLLVMOrcCSymbolMapPairs; NumPairs: Tsize_t): TLLVMOrcMaterializationUnitRef; cdecl; external libllvm;
function LLVMOrcLazyReexports(LCTM: TLLVMOrcLazyCallThroughManagerRef; ISM: TLLVMOrcIndirectStubsManagerRef; SourceRef: TLLVMOrcJITDylibRef; CallableAliases: TLLVMOrcCSymbolAliasMapPairs; NumPairs: Tsize_t): TLLVMOrcMaterializationUnitRef; cdecl; external libllvm;
procedure LLVMOrcDisposeMaterializationResponsibility(MR: TLLVMOrcMaterializationResponsibilityRef); cdecl; external libllvm;
function LLVMOrcMaterializationResponsibilityGetTargetDylib(MR: TLLVMOrcMaterializationResponsibilityRef): TLLVMOrcJITDylibRef; cdecl; external libllvm;
function LLVMOrcMaterializationResponsibilityGetExecutionSession(MR: TLLVMOrcMaterializationResponsibilityRef): TLLVMOrcExecutionSessionRef; cdecl; external libllvm;
function LLVMOrcMaterializationResponsibilityGetSymbols(MR: TLLVMOrcMaterializationResponsibilityRef; NumPairs: Psize_t): TLLVMOrcCSymbolFlagsMapPairs; cdecl; external libllvm;
procedure LLVMOrcDisposeCSymbolFlagsMap(Pairs: TLLVMOrcCSymbolFlagsMapPairs); cdecl; external libllvm;
function LLVMOrcMaterializationResponsibilityGetInitializerSymbol(MR: TLLVMOrcMaterializationResponsibilityRef): TLLVMOrcSymbolStringPoolEntryRef; cdecl; external libllvm;
function LLVMOrcMaterializationResponsibilityGetRequestedSymbols(MR: TLLVMOrcMaterializationResponsibilityRef; NumSymbols: Psize_t): PLLVMOrcSymbolStringPoolEntryRef; cdecl; external libllvm;
procedure LLVMOrcDisposeSymbols(Symbols: PLLVMOrcSymbolStringPoolEntryRef); cdecl; external libllvm;
function LLVMOrcMaterializationResponsibilityNotifyResolved(MR: TLLVMOrcMaterializationResponsibilityRef; Symbols: TLLVMOrcCSymbolMapPairs; NumPairs: Tsize_t): TLLVMErrorRef; cdecl; external libllvm;
function LLVMOrcMaterializationResponsibilityNotifyEmitted(MR: TLLVMOrcMaterializationResponsibilityRef; SymbolDepGroups: PLLVMOrcCSymbolDependenceGroup; NumSymbolDepGroups: Tsize_t): TLLVMErrorRef; cdecl; external libllvm;
function LLVMOrcMaterializationResponsibilityDefineMaterializing(MR: TLLVMOrcMaterializationResponsibilityRef; Pairs: TLLVMOrcCSymbolFlagsMapPairs; NumPairs: Tsize_t): TLLVMErrorRef; cdecl; external libllvm;
procedure LLVMOrcMaterializationResponsibilityFailMaterialization(MR: TLLVMOrcMaterializationResponsibilityRef); cdecl; external libllvm;
function LLVMOrcMaterializationResponsibilityReplace(MR: TLLVMOrcMaterializationResponsibilityRef; MU: TLLVMOrcMaterializationUnitRef): TLLVMErrorRef; cdecl; external libllvm;
function LLVMOrcMaterializationResponsibilityDelegate(MR: TLLVMOrcMaterializationResponsibilityRef; Symbols: PLLVMOrcSymbolStringPoolEntryRef; NumSymbols: Tsize_t; Result: PLLVMOrcMaterializationResponsibilityRef): TLLVMErrorRef; cdecl; external libllvm;
function LLVMOrcExecutionSessionCreateBareJITDylib(ES: TLLVMOrcExecutionSessionRef; Name: pchar): TLLVMOrcJITDylibRef; cdecl; external libllvm;
function LLVMOrcExecutionSessionCreateJITDylib(ES: TLLVMOrcExecutionSessionRef; Result: PLLVMOrcJITDylibRef; Name: pchar): TLLVMErrorRef; cdecl; external libllvm;
function LLVMOrcExecutionSessionGetJITDylibByName(ES: TLLVMOrcExecutionSessionRef; Name: pchar): TLLVMOrcJITDylibRef; cdecl; external libllvm;
function LLVMOrcJITDylibCreateResourceTracker(JD: TLLVMOrcJITDylibRef): TLLVMOrcResourceTrackerRef; cdecl; external libllvm;
function LLVMOrcJITDylibGetDefaultResourceTracker(JD: TLLVMOrcJITDylibRef): TLLVMOrcResourceTrackerRef; cdecl; external libllvm;
function LLVMOrcJITDylibDefine(JD: TLLVMOrcJITDylibRef; MU: TLLVMOrcMaterializationUnitRef): TLLVMErrorRef; cdecl; external libllvm;
function LLVMOrcJITDylibClear(JD: TLLVMOrcJITDylibRef): TLLVMErrorRef; cdecl; external libllvm;
procedure LLVMOrcJITDylibAddGenerator(JD: TLLVMOrcJITDylibRef; DG: TLLVMOrcDefinitionGeneratorRef); cdecl; external libllvm;
function LLVMOrcCreateCustomCAPIDefinitionGenerator(F: TLLVMOrcCAPIDefinitionGeneratorTryToGenerateFunction; Ctx: pointer; _Dispose: TLLVMOrcDisposeCAPIDefinitionGeneratorFunction): TLLVMOrcDefinitionGeneratorRef; cdecl; external libllvm;
procedure LLVMOrcLookupStateContinueLookup(S: TLLVMOrcLookupStateRef; Err: TLLVMErrorRef); cdecl; external libllvm;
function LLVMOrcCreateDynamicLibrarySearchGeneratorForProcess(Result: PLLVMOrcDefinitionGeneratorRef; GlobalPrefx: char; Filter: TLLVMOrcSymbolPredicate; FilterCtx: pointer): TLLVMErrorRef; cdecl; external libllvm;
function LLVMOrcCreateDynamicLibrarySearchGeneratorForPath(Result: PLLVMOrcDefinitionGeneratorRef; FileName: pchar; GlobalPrefix: char; Filter: TLLVMOrcSymbolPredicate; FilterCtx: pointer): TLLVMErrorRef; cdecl; external libllvm;
function LLVMOrcCreateStaticLibrarySearchGeneratorForPath(Result: PLLVMOrcDefinitionGeneratorRef; ObjLayer: TLLVMOrcObjectLayerRef; FileName: pchar; TargetTriple: pchar): TLLVMErrorRef; cdecl; external libllvm;
function LLVMOrcCreateNewThreadSafeContext: TLLVMOrcThreadSafeContextRef; cdecl; external libllvm;
function LLVMOrcThreadSafeContextGetContext(TSCtx: TLLVMOrcThreadSafeContextRef): TLLVMContextRef; cdecl; external libllvm;
procedure LLVMOrcDisposeThreadSafeContext(TSCtx: TLLVMOrcThreadSafeContextRef); cdecl; external libllvm;
function LLVMOrcCreateNewThreadSafeModule(M: TLLVMModuleRef; TSCtx: TLLVMOrcThreadSafeContextRef): TLLVMOrcThreadSafeModuleRef; cdecl; external libllvm;
procedure LLVMOrcDisposeThreadSafeModule(TSM: TLLVMOrcThreadSafeModuleRef); cdecl; external libllvm;
function LLVMOrcThreadSafeModuleWithModuleDo(TSM: TLLVMOrcThreadSafeModuleRef; F: TLLVMOrcGenericIRModuleOperationFunction; Ctx: pointer): TLLVMErrorRef; cdecl; external libllvm;
function LLVMOrcJITTargetMachineBuilderDetectHost(Result: PLLVMOrcJITTargetMachineBuilderRef): TLLVMErrorRef; cdecl; external libllvm;
function LLVMOrcJITTargetMachineBuilderCreateFromTargetMachine(TM: TLLVMTargetMachineRef): TLLVMOrcJITTargetMachineBuilderRef; cdecl; external libllvm;
procedure LLVMOrcDisposeJITTargetMachineBuilder(JTMB: TLLVMOrcJITTargetMachineBuilderRef); cdecl; external libllvm;
function LLVMOrcJITTargetMachineBuilderGetTargetTriple(JTMB: TLLVMOrcJITTargetMachineBuilderRef): pchar; cdecl; external libllvm;
procedure LLVMOrcJITTargetMachineBuilderSetTargetTriple(JTMB: TLLVMOrcJITTargetMachineBuilderRef; TargetTriple: pchar); cdecl; external libllvm;
function LLVMOrcObjectLayerAddObjectFile(ObjLayer: TLLVMOrcObjectLayerRef; JD: TLLVMOrcJITDylibRef; ObjBuffer: TLLVMMemoryBufferRef): TLLVMErrorRef; cdecl; external libllvm;
function LLVMOrcObjectLayerAddObjectFileWithRT(ObjLayer: TLLVMOrcObjectLayerRef; RT: TLLVMOrcResourceTrackerRef; ObjBuffer: TLLVMMemoryBufferRef): TLLVMErrorRef; cdecl; external libllvm;
procedure LLVMOrcObjectLayerEmit(ObjLayer: TLLVMOrcObjectLayerRef; R: TLLVMOrcMaterializationResponsibilityRef; ObjBuffer: TLLVMMemoryBufferRef); cdecl; external libllvm;
procedure LLVMOrcDisposeObjectLayer(ObjLayer: TLLVMOrcObjectLayerRef); cdecl; external libllvm;
procedure LLVMOrcIRTransformLayerEmit(IRTransformLayer: TLLVMOrcIRTransformLayerRef; MR: TLLVMOrcMaterializationResponsibilityRef; TSM: TLLVMOrcThreadSafeModuleRef); cdecl; external libllvm;
procedure LLVMOrcIRTransformLayerSetTransform(IRTransformLayer: TLLVMOrcIRTransformLayerRef; TransformFunction: TLLVMOrcIRTransformLayerTransformFunction; Ctx: pointer); cdecl; external libllvm;
procedure LLVMOrcObjectTransformLayerSetTransform(ObjTransformLayer: TLLVMOrcObjectTransformLayerRef; TransformFunction: TLLVMOrcObjectTransformLayerTransformFunction; Ctx: pointer); cdecl; external libllvm;
function LLVMOrcCreateLocalIndirectStubsManager(TargetTriple: pchar): TLLVMOrcIndirectStubsManagerRef; cdecl; external libllvm;
procedure LLVMOrcDisposeIndirectStubsManager(ISM: TLLVMOrcIndirectStubsManagerRef); cdecl; external libllvm;
function LLVMOrcCreateLocalLazyCallThroughManager(TargetTriple: pchar; ES: TLLVMOrcExecutionSessionRef; ErrorHandlerAddr: TLLVMOrcJITTargetAddress; LCTM: PLLVMOrcLazyCallThroughManagerRef): TLLVMErrorRef; cdecl; external libllvm;
procedure LLVMOrcDisposeLazyCallThroughManager(LCTM: TLLVMOrcLazyCallThroughManagerRef); cdecl; external libllvm;
function LLVMOrcCreateDumpObjects(DumpDir: pchar; IdentifierOverride: pchar): TLLVMOrcDumpObjectsRef; cdecl; external libllvm;
procedure LLVMOrcDisposeDumpObjects(DumpObjects: TLLVMOrcDumpObjectsRef); cdecl; external libllvm;
function LLVMOrcDumpObjects_CallOperator(DumpObjects: TLLVMOrcDumpObjectsRef; ObjBuffer: PLLVMMemoryBufferRef): TLLVMErrorRef; cdecl; external libllvm;

// === Konventiert am: 20-9-26 17:11:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
