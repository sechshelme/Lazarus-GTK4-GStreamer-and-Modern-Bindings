unit Index;

interface

uses
  fp_clang, CXFile, CXSourceLocation, CXDiagnostic, CXString, CXErrorCode;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  CINDEX_VERSION_MAJOR = 0;  
  CINDEX_VERSION_MINOR = 64;  

function CINDEX_VERSION_ENCODE(major,minor : longint) : longint;

type
  PCXIndex = ^TCXIndex;
  TCXIndex = pointer;

  PCXTargetInfo = ^TCXTargetInfo;
  TCXTargetInfo = type Pointer;

  PCXTranslationUnit = ^TCXTranslationUnit;
  TCXTranslationUnit = type Pointer;

  PCXClientData = ^TCXClientData;
  TCXClientData = pointer;

  PCXUnsavedFile = ^TCXUnsavedFile;
  TCXUnsavedFile = record
      Filename : Pchar;
      Contents : Pchar;
      Length : dword;
    end;

  type
  TCXAvailabilityKind =  Longint;
  Const
    CXAvailability_Available = 0;
    CXAvailability_Deprecated = 1;
    CXAvailability_NotAvailable = 2;
    CXAvailability_NotAccessible = 3;

type
  PCXVersion = ^TCXVersion;
  TCXVersion = record
      Major : longint;
      Minor : longint;
      Subminor : longint;
    end;

  type
  TCXCursor_ExceptionSpecificationKind =  Longint;
  Const
    CXCursor_ExceptionSpecificationKind_None = 0;
    CXCursor_ExceptionSpecificationKind_DynamicNone = 1;
    CXCursor_ExceptionSpecificationKind_Dynamic = 2;
    CXCursor_ExceptionSpecificationKind_MSAny = 3;
    CXCursor_ExceptionSpecificationKind_BasicNoexcept = 4;
    CXCursor_ExceptionSpecificationKind_ComputedNoexcept = 5;
    CXCursor_ExceptionSpecificationKind_Unevaluated = 6;
    CXCursor_ExceptionSpecificationKind_Uninstantiated = 7;
    CXCursor_ExceptionSpecificationKind_Unparsed = 8;
    CXCursor_ExceptionSpecificationKind_NoThrow = 9;

function clang_createIndex(excludeDeclarationsFromPCH:longint; displayDiagnostics:longint):TCXIndex;cdecl;external libgclang;
procedure clang_disposeIndex(index:TCXIndex);cdecl;external libgclang;

type
  PCXChoice = ^TCXChoice;
  TCXChoice =  Longint;
  Const
    CXChoice_Default = 0;
    CXChoice_Enabled = 1;
    CXChoice_Disabled = 2;

  type
  PCXGlobalOptFlags = ^TCXGlobalOptFlags;
  TCXGlobalOptFlags =  Longint;
  Const
    CXGlobalOpt_None = $0;
    CXGlobalOpt_ThreadBackgroundPriorityForIndexing = $1;
    CXGlobalOpt_ThreadBackgroundPriorityForEditing = $2;
    CXGlobalOpt_ThreadBackgroundPriorityForAll = CXGlobalOpt_ThreadBackgroundPriorityForIndexing or CXGlobalOpt_ThreadBackgroundPriorityForEditing;

type
  PCXIndexOptions = ^TCXIndexOptions;
  TCXIndexOptions =bitpacked record
      Size : dword;
      ThreadBackgroundPriorityForIndexing : byte;
      ThreadBackgroundPriorityForEditing : byte;
      ExcludeDeclarationsFromPCH : 0..1;
      DisplayDiagnostics : 0..1;
      StorePreamblesInMemory : 0..1;
      Reserved : 0..$1FFFFFFF;
      PreambleStoragePath : Pchar;
      InvocationEmissionPath : Pchar;
    end;

function clang_createIndexWithOptions(options:PCXIndexOptions):TCXIndex;cdecl;external libgclang;
procedure clang_CXIndex_setGlobalOptions(para1:TCXIndex; options:dword);cdecl;external libgclang;
function clang_CXIndex_getGlobalOptions(para1:TCXIndex):dword;cdecl;external libgclang;
procedure clang_CXIndex_setInvocationEmissionPathOption(para1:TCXIndex; Path:Pchar);cdecl;external libgclang;
function clang_isFileMultipleIncludeGuarded(tu:TCXTranslationUnit; file_:TCXFile):dword;cdecl;external libgclang;
function clang_getFile(tu:TCXTranslationUnit; file_name:Pchar):TCXFile;cdecl;external libgclang;
function clang_getFileContents(tu:TCXTranslationUnit; file_:TCXFile; size:Psize_t):Pchar;cdecl;external libgclang;
function clang_getLocation(tu:TCXTranslationUnit; file_:TCXFile; line:dword; column:dword):TCXSourceLocation;cdecl;external libgclang;
function clang_getLocationForOffset(tu:TCXTranslationUnit; file_:TCXFile; offset:dword):TCXSourceLocation;cdecl;external libgclang;
function clang_getSkippedRanges(tu:TCXTranslationUnit; file_:TCXFile):PCXSourceRangeList;cdecl;external libgclang;
function clang_getAllSkippedRanges(tu:TCXTranslationUnit):PCXSourceRangeList;cdecl;external libgclang;
function clang_getNumDiagnostics(Unit_:TCXTranslationUnit):dword;cdecl;external libgclang;
function clang_getDiagnostic(Unit_:TCXTranslationUnit; Index:dword):TCXDiagnostic;cdecl;external libgclang;
function clang_getDiagnosticSetFromTU(Unit_:TCXTranslationUnit):TCXDiagnosticSet;cdecl;external libgclang;
function clang_getTranslationUnitSpelling(CTUnit:TCXTranslationUnit):TCXString;cdecl;external libgclang;
function clang_createTranslationUnitFromSourceFile(CIdx:TCXIndex; source_filename:Pchar; num_clang_command_line_args:longint; clang_command_line_args:PPchar; num_unsaved_files:dword;
           unsaved_files:PCXUnsavedFile):TCXTranslationUnit;cdecl;external libgclang;
function clang_createTranslationUnit(CIdx:TCXIndex; ast_filename:Pchar):TCXTranslationUnit;cdecl;external libgclang;
function clang_createTranslationUnit2(CIdx:TCXIndex; ast_filename:Pchar; out_TU:PCXTranslationUnit):TCXErrorCode;cdecl;external libgclang;

type
  TCXTranslationUnit_Flags =  Longint;
  Const
    CXTranslationUnit_None = $0;
    CXTranslationUnit_DetailedPreprocessingRecord = $01;
    CXTranslationUnit_Incomplete = $02;
    CXTranslationUnit_PrecompiledPreamble = $04;
    CXTranslationUnit_CacheCompletionResults = $08;
    CXTranslationUnit_ForSerialization = $10;
    CXTranslationUnit_CXXChainedPCH = $20;
    CXTranslationUnit_SkipFunctionBodies = $40;
    CXTranslationUnit_IncludeBriefCommentsInCodeCompletion = $80;
    CXTranslationUnit_CreatePreambleOnFirstParse = $100;
    CXTranslationUnit_KeepGoing = $200;
    CXTranslationUnit_SingleFileParse = $400;
    CXTranslationUnit_LimitSkipFunctionBodiesToPreamble = $800;
    CXTranslationUnit_IncludeAttributedTypes = $1000;
    CXTranslationUnit_VisitImplicitAttributes = $2000;
    CXTranslationUnit_IgnoreNonErrorsFromIncludedFiles = $4000;
    CXTranslationUnit_RetainExcludedConditionalBlocks = $8000;

function clang_defaultEditingTranslationUnitOptions:dword;cdecl;external libgclang;
function clang_parseTranslationUnit(CIdx:TCXIndex; source_filename:Pchar; command_line_args:PPchar; num_command_line_args:longint; unsaved_files:PCXUnsavedFile;
           num_unsaved_files:dword; options:dword):TCXTranslationUnit;cdecl;external libgclang;
function clang_parseTranslationUnit2(CIdx:TCXIndex; source_filename:Pchar; command_line_args:PPchar; num_command_line_args:longint; unsaved_files:PCXUnsavedFile;
           num_unsaved_files:dword; options:dword; out_TU:PCXTranslationUnit):TCXErrorCode;cdecl;external libgclang;
function clang_parseTranslationUnit2FullArgv(CIdx:TCXIndex; source_filename:Pchar; command_line_args:PPchar; num_command_line_args:longint; unsaved_files:PCXUnsavedFile;
           num_unsaved_files:dword; options:dword; out_TU:PCXTranslationUnit):TCXErrorCode;cdecl;external libgclang;

type
  TCXSaveTranslationUnit_Flags =  Longint;
  Const
    CXSaveTranslationUnit_None = $0;

function clang_defaultSaveOptions(TU:TCXTranslationUnit):dword;cdecl;external libgclang;

type
  TCXSaveError =  Longint;
  Const
    CXSaveError_None = 0;
    CXSaveError_Unknown = 1;
    CXSaveError_TranslationErrors = 2;
    CXSaveError_InvalidTU = 3;

function clang_saveTranslationUnit(TU:TCXTranslationUnit; FileName:Pchar; options:dword):longint;cdecl;external libgclang;
function clang_suspendTranslationUnit(para1:TCXTranslationUnit):dword;cdecl;external libgclang;
procedure clang_disposeTranslationUnit(para1:TCXTranslationUnit);cdecl;external libgclang;

type
  TCXReparse_Flags =  Longint;
  Const
    CXReparse_None = $0;

function clang_defaultReparseOptions(TU:TCXTranslationUnit):dword;cdecl;external libgclang;
function clang_reparseTranslationUnit(TU:TCXTranslationUnit; num_unsaved_files:dword; unsaved_files:PCXUnsavedFile; options:dword):longint;cdecl;external libgclang;

type
  TCXTUResourceUsageKind =  Longint;
  Const
    CXTUResourceUsage_AST = 1;
    CXTUResourceUsage_Identifiers = 2;
    CXTUResourceUsage_Selectors = 3;
    CXTUResourceUsage_GlobalCompletionResults = 4;
    CXTUResourceUsage_SourceManagerContentCache = 5;
    CXTUResourceUsage_AST_SideTables = 6;
    CXTUResourceUsage_SourceManager_Membuffer_Malloc = 7;
    CXTUResourceUsage_SourceManager_Membuffer_MMap = 8;
    CXTUResourceUsage_ExternalASTSource_Membuffer_Malloc = 9;
    CXTUResourceUsage_ExternalASTSource_Membuffer_MMap = 10;
    CXTUResourceUsage_Preprocessor = 11;
    CXTUResourceUsage_PreprocessingRecord = 12;
    CXTUResourceUsage_SourceManager_DataStructures = 13;
    CXTUResourceUsage_Preprocessor_HeaderSearch = 14;
    CXTUResourceUsage_MEMORY_IN_BYTES_BEGIN = CXTUResourceUsage_AST;
    CXTUResourceUsage_MEMORY_IN_BYTES_END = CXTUResourceUsage_Preprocessor_HeaderSearch;
    CXTUResourceUsage_First = CXTUResourceUsage_AST;
    CXTUResourceUsage_Last = CXTUResourceUsage_Preprocessor_HeaderSearch;

function clang_getTUResourceUsageName(kind:TCXTUResourceUsageKind):Pchar;cdecl;external libgclang;

type
  PCXTUResourceUsageEntry = ^TCXTUResourceUsageEntry;
  TCXTUResourceUsageEntry = record
      kind : TCXTUResourceUsageKind;
      amount : dword;
    end;

  PCXTUResourceUsage = ^TCXTUResourceUsage;
  TCXTUResourceUsage = record
      data : pointer;
      numEntries : dword;
      entries : PCXTUResourceUsageEntry;
    end;

function clang_getCXTUResourceUsage(TU:TCXTranslationUnit):TCXTUResourceUsage;cdecl;external libgclang;
procedure clang_disposeCXTUResourceUsage(usage:TCXTUResourceUsage);cdecl;external libgclang;
function clang_getTranslationUnitTargetInfo(CTUnit:TCXTranslationUnit):TCXTargetInfo;cdecl;external libgclang;
procedure clang_TargetInfo_dispose(Info:TCXTargetInfo);cdecl;external libgclang;
function clang_TargetInfo_getTriple(Info:TCXTargetInfo):TCXString;cdecl;external libgclang;
function clang_TargetInfo_getPointerWidth(Info:TCXTargetInfo):longint;cdecl;external libgclang;

type
  TCXCursorKind =  Longint;
  Const
    CXCursor_UnexposedDecl = 1;
    CXCursor_StructDecl = 2;
    CXCursor_UnionDecl = 3;
    CXCursor_ClassDecl = 4;
    CXCursor_EnumDecl = 5;
    CXCursor_FieldDecl = 6;
    CXCursor_EnumConstantDecl = 7;
    CXCursor_FunctionDecl = 8;
    CXCursor_VarDecl = 9;
    CXCursor_ParmDecl = 10;
    CXCursor_ObjCInterfaceDecl = 11;
    CXCursor_ObjCCategoryDecl = 12;
    CXCursor_ObjCProtocolDecl = 13;
    CXCursor_ObjCPropertyDecl = 14;
    CXCursor_ObjCIvarDecl = 15;
    CXCursor_ObjCInstanceMethodDecl = 16;
    CXCursor_ObjCClassMethodDecl = 17;
    CXCursor_ObjCImplementationDecl = 18;
    CXCursor_ObjCCategoryImplDecl = 19;
    CXCursor_TypedefDecl = 20;
    CXCursor_CXXMethod = 21;
    CXCursor_Namespace = 22;
    CXCursor_LinkageSpec = 23;
    CXCursor_Constructor = 24;
    CXCursor_Destructor = 25;
    CXCursor_ConversionFunction = 26;
    CXCursor_TemplateTypeParameter = 27;
    CXCursor_NonTypeTemplateParameter = 28;
    CXCursor_TemplateTemplateParameter = 29;
    CXCursor_FunctionTemplate = 30;
    CXCursor_ClassTemplate = 31;
    CXCursor_ClassTemplatePartialSpecialization = 32;
    CXCursor_NamespaceAlias = 33;
    CXCursor_UsingDirective = 34;
    CXCursor_UsingDeclaration = 35;
    CXCursor_TypeAliasDecl = 36;
    CXCursor_ObjCSynthesizeDecl = 37;
    CXCursor_ObjCDynamicDecl = 38;
    CXCursor_CXXAccessSpecifier = 39;
    CXCursor_FirstDecl = CXCursor_UnexposedDecl;
    CXCursor_LastDecl = CXCursor_CXXAccessSpecifier;
    CXCursor_FirstRef = 40;
    CXCursor_ObjCSuperClassRef = 40;
    CXCursor_ObjCProtocolRef = 41;
    CXCursor_ObjCClassRef = 42;
    CXCursor_TypeRef = 43;
    CXCursor_CXXBaseSpecifier = 44;
    CXCursor_TemplateRef = 45;
    CXCursor_NamespaceRef = 46;
    CXCursor_MemberRef = 47;
    CXCursor_LabelRef = 48;
    CXCursor_OverloadedDeclRef = 49;
    CXCursor_VariableRef = 50;
    CXCursor_LastRef = CXCursor_VariableRef;
    CXCursor_FirstInvalid = 70;
    CXCursor_InvalidFile = 70;
    CXCursor_NoDeclFound = 71;
    CXCursor_NotImplemented = 72;
    CXCursor_InvalidCode = 73;
    CXCursor_LastInvalid = CXCursor_InvalidCode;
    CXCursor_FirstExpr = 100;
    CXCursor_UnexposedExpr = 100;
    CXCursor_DeclRefExpr = 101;
    CXCursor_MemberRefExpr = 102;
    CXCursor_CallExpr = 103;
    CXCursor_ObjCMessageExpr = 104;
    CXCursor_BlockExpr = 105;
    CXCursor_IntegerLiteral = 106;
    CXCursor_FloatingLiteral = 107;
    CXCursor_ImaginaryLiteral = 108;
    CXCursor_StringLiteral = 109;
    CXCursor_CharacterLiteral = 110;
    CXCursor_ParenExpr = 111;
    CXCursor_UnaryOperator = 112;
    CXCursor_ArraySubscriptExpr = 113;
    CXCursor_BinaryOperator = 114;
    CXCursor_CompoundAssignOperator = 115;
    CXCursor_ConditionalOperator = 116;
    CXCursor_CStyleCastExpr = 117;
    CXCursor_CompoundLiteralExpr = 118;
    CXCursor_InitListExpr = 119;
    CXCursor_AddrLabelExpr = 120;
    CXCursor_StmtExpr = 121;
    CXCursor_GenericSelectionExpr = 122;
    CXCursor_GNUNullExpr = 123;
    CXCursor_CXXStaticCastExpr = 124;
    CXCursor_CXXDynamicCastExpr = 125;
    CXCursor_CXXReinterpretCastExpr = 126;
    CXCursor_CXXConstCastExpr = 127;
    CXCursor_CXXFunctionalCastExpr = 128;
    CXCursor_CXXTypeidExpr = 129;
    CXCursor_CXXBoolLiteralExpr = 130;
    CXCursor_CXXNullPtrLiteralExpr = 131;
    CXCursor_CXXThisExpr = 132;
    CXCursor_CXXThrowExpr = 133;
    CXCursor_CXXNewExpr = 134;
    CXCursor_CXXDeleteExpr = 135;
    CXCursor_UnaryExpr = 136;
    CXCursor_ObjCStringLiteral = 137;
    CXCursor_ObjCEncodeExpr = 138;
    CXCursor_ObjCSelectorExpr = 139;
    CXCursor_ObjCProtocolExpr = 140;
    CXCursor_ObjCBridgedCastExpr = 141;
    CXCursor_PackExpansionExpr = 142;
    CXCursor_SizeOfPackExpr = 143;
    CXCursor_LambdaExpr = 144;
    CXCursor_ObjCBoolLiteralExpr = 145;
    CXCursor_ObjCSelfExpr = 146;
    CXCursor_ArraySectionExpr = 147;
    CXCursor_ObjCAvailabilityCheckExpr = 148;
    CXCursor_FixedPointLiteral = 149;
    CXCursor_OMPArrayShapingExpr = 150;
    CXCursor_OMPIteratorExpr = 151;
    CXCursor_CXXAddrspaceCastExpr = 152;
    CXCursor_ConceptSpecializationExpr = 153;
    CXCursor_RequiresExpr = 154;
    CXCursor_CXXParenListInitExpr = 155;
    CXCursor_PackIndexingExpr = 156;
    CXCursor_LastExpr = CXCursor_PackIndexingExpr;
    CXCursor_FirstStmt = 200;
    CXCursor_UnexposedStmt = 200;
    CXCursor_LabelStmt = 201;
    CXCursor_CompoundStmt = 202;
    CXCursor_CaseStmt = 203;
    CXCursor_DefaultStmt = 204;
    CXCursor_IfStmt = 205;
    CXCursor_SwitchStmt = 206;
    CXCursor_WhileStmt = 207;
    CXCursor_DoStmt = 208;
    CXCursor_ForStmt = 209;
    CXCursor_GotoStmt = 210;
    CXCursor_IndirectGotoStmt = 211;
    CXCursor_ContinueStmt = 212;
    CXCursor_BreakStmt = 213;
    CXCursor_ReturnStmt = 214;
    CXCursor_GCCAsmStmt = 215;
    CXCursor_AsmStmt = CXCursor_GCCAsmStmt;
    CXCursor_ObjCAtTryStmt = 216;
    CXCursor_ObjCAtCatchStmt = 217;
    CXCursor_ObjCAtFinallyStmt = 218;
    CXCursor_ObjCAtThrowStmt = 219;
    CXCursor_ObjCAtSynchronizedStmt = 220;
    CXCursor_ObjCAutoreleasePoolStmt = 221;
    CXCursor_ObjCForCollectionStmt = 222;
    CXCursor_CXXCatchStmt = 223;
    CXCursor_CXXTryStmt = 224;
    CXCursor_CXXForRangeStmt = 225;
    CXCursor_SEHTryStmt = 226;
    CXCursor_SEHExceptStmt = 227;
    CXCursor_SEHFinallyStmt = 228;
    CXCursor_MSAsmStmt = 229;
    CXCursor_NullStmt = 230;
    CXCursor_DeclStmt = 231;
    CXCursor_OMPParallelDirective = 232;
    CXCursor_OMPSimdDirective = 233;
    CXCursor_OMPForDirective = 234;
    CXCursor_OMPSectionsDirective = 235;
    CXCursor_OMPSectionDirective = 236;
    CXCursor_OMPSingleDirective = 237;
    CXCursor_OMPParallelForDirective = 238;
    CXCursor_OMPParallelSectionsDirective = 239;
    CXCursor_OMPTaskDirective = 240;
    CXCursor_OMPMasterDirective = 241;
    CXCursor_OMPCriticalDirective = 242;
    CXCursor_OMPTaskyieldDirective = 243;
    CXCursor_OMPBarrierDirective = 244;
    CXCursor_OMPTaskwaitDirective = 245;
    CXCursor_OMPFlushDirective = 246;
    CXCursor_SEHLeaveStmt = 247;
    CXCursor_OMPOrderedDirective = 248;
    CXCursor_OMPAtomicDirective = 249;
    CXCursor_OMPForSimdDirective = 250;
    CXCursor_OMPParallelForSimdDirective = 251;
    CXCursor_OMPTargetDirective = 252;
    CXCursor_OMPTeamsDirective = 253;
    CXCursor_OMPTaskgroupDirective = 254;
    CXCursor_OMPCancellationPointDirective = 255;
    CXCursor_OMPCancelDirective = 256;
    CXCursor_OMPTargetDataDirective = 257;
    CXCursor_OMPTaskLoopDirective = 258;
    CXCursor_OMPTaskLoopSimdDirective = 259;
    CXCursor_OMPDistributeDirective = 260;
    CXCursor_OMPTargetEnterDataDirective = 261;
    CXCursor_OMPTargetExitDataDirective = 262;
    CXCursor_OMPTargetParallelDirective = 263;
    CXCursor_OMPTargetParallelForDirective = 264;
    CXCursor_OMPTargetUpdateDirective = 265;
    CXCursor_OMPDistributeParallelForDirective = 266;
    CXCursor_OMPDistributeParallelForSimdDirective = 267;
    CXCursor_OMPDistributeSimdDirective = 268;
    CXCursor_OMPTargetParallelForSimdDirective = 269;
    CXCursor_OMPTargetSimdDirective = 270;
    CXCursor_OMPTeamsDistributeDirective = 271;
    CXCursor_OMPTeamsDistributeSimdDirective = 272;
    CXCursor_OMPTeamsDistributeParallelForSimdDirective = 273;
    CXCursor_OMPTeamsDistributeParallelForDirective = 274;
    CXCursor_OMPTargetTeamsDirective = 275;
    CXCursor_OMPTargetTeamsDistributeDirective = 276;
    CXCursor_OMPTargetTeamsDistributeParallelForDirective = 277;
    CXCursor_OMPTargetTeamsDistributeParallelForSimdDirective = 278;
    CXCursor_OMPTargetTeamsDistributeSimdDirective = 279;
    CXCursor_BuiltinBitCastExpr = 280;
    CXCursor_OMPMasterTaskLoopDirective = 281;
    CXCursor_OMPParallelMasterTaskLoopDirective = 282;
    CXCursor_OMPMasterTaskLoopSimdDirective = 283;
    CXCursor_OMPParallelMasterTaskLoopSimdDirective = 284;
    CXCursor_OMPParallelMasterDirective = 285;
    CXCursor_OMPDepobjDirective = 286;
    CXCursor_OMPScanDirective = 287;
    CXCursor_OMPTileDirective = 288;
    CXCursor_OMPCanonicalLoop = 289;
    CXCursor_OMPInteropDirective = 290;
    CXCursor_OMPDispatchDirective = 291;
    CXCursor_OMPMaskedDirective = 292;
    CXCursor_OMPUnrollDirective = 293;
    CXCursor_OMPMetaDirective = 294;
    CXCursor_OMPGenericLoopDirective = 295;
    CXCursor_OMPTeamsGenericLoopDirective = 296;
    CXCursor_OMPTargetTeamsGenericLoopDirective = 297;
    CXCursor_OMPParallelGenericLoopDirective = 298;
    CXCursor_OMPTargetParallelGenericLoopDirective = 299;
    CXCursor_OMPParallelMaskedDirective = 300;
    CXCursor_OMPMaskedTaskLoopDirective = 301;
    CXCursor_OMPMaskedTaskLoopSimdDirective = 302;
    CXCursor_OMPParallelMaskedTaskLoopDirective = 303;
    CXCursor_OMPParallelMaskedTaskLoopSimdDirective = 304;
    CXCursor_OMPErrorDirective = 305;
    CXCursor_OMPScopeDirective = 306;
    CXCursor_OMPReverseDirective = 307;
    CXCursor_OMPInterchangeDirective = 308;
    CXCursor_OMPAssumeDirective = 309;
    CXCursor_OpenACCComputeConstruct = 320;
    CXCursor_OpenACCLoopConstruct = 321;
    CXCursor_OpenACCCombinedConstruct = 322;
    CXCursor_OpenACCDataConstruct = 323;
    CXCursor_OpenACCEnterDataConstruct = 324;
    CXCursor_OpenACCExitDataConstruct = 325;
    CXCursor_OpenACCHostDataConstruct = 326;
    CXCursor_OpenACCWaitConstruct = 327;
    CXCursor_OpenACCInitConstruct = 328;
    CXCursor_OpenACCShutdownConstruct = 329;
    CXCursor_OpenACCSetConstruct = 330;
    CXCursor_OpenACCUpdateConstruct = 331;
    CXCursor_LastStmt = CXCursor_OpenACCUpdateConstruct;
    CXCursor_TranslationUnit = 350;
    CXCursor_FirstAttr = 400;
    CXCursor_UnexposedAttr = 400;
    CXCursor_IBActionAttr = 401;
    CXCursor_IBOutletAttr = 402;
    CXCursor_IBOutletCollectionAttr = 403;
    CXCursor_CXXFinalAttr = 404;
    CXCursor_CXXOverrideAttr = 405;
    CXCursor_AnnotateAttr = 406;
    CXCursor_AsmLabelAttr = 407;
    CXCursor_PackedAttr = 408;
    CXCursor_PureAttr = 409;
    CXCursor_ConstAttr = 410;
    CXCursor_NoDuplicateAttr = 411;
    CXCursor_CUDAConstantAttr = 412;
    CXCursor_CUDADeviceAttr = 413;
    CXCursor_CUDAGlobalAttr = 414;
    CXCursor_CUDAHostAttr = 415;
    CXCursor_CUDASharedAttr = 416;
    CXCursor_VisibilityAttr = 417;
    CXCursor_DLLExport = 418;
    CXCursor_DLLImport = 419;
    CXCursor_NSReturnsRetained = 420;
    CXCursor_NSReturnsNotRetained = 421;
    CXCursor_NSReturnsAutoreleased = 422;
    CXCursor_NSConsumesSelf = 423;
    CXCursor_NSConsumed = 424;
    CXCursor_ObjCException = 425;
    CXCursor_ObjCNSObject = 426;
    CXCursor_ObjCIndependentClass = 427;
    CXCursor_ObjCPreciseLifetime = 428;
    CXCursor_ObjCReturnsInnerPointer = 429;
    CXCursor_ObjCRequiresSuper = 430;
    CXCursor_ObjCRootClass = 431;
    CXCursor_ObjCSubclassingRestricted = 432;
    CXCursor_ObjCExplicitProtocolImpl = 433;
    CXCursor_ObjCDesignatedInitializer = 434;
    CXCursor_ObjCRuntimeVisible = 435;
    CXCursor_ObjCBoxable = 436;
    CXCursor_FlagEnum = 437;
    CXCursor_ConvergentAttr = 438;
    CXCursor_WarnUnusedAttr = 439;
    CXCursor_WarnUnusedResultAttr = 440;
    CXCursor_AlignedAttr = 441;
    CXCursor_LastAttr = CXCursor_AlignedAttr;
    CXCursor_PreprocessingDirective = 500;
    CXCursor_MacroDefinition = 501;
    CXCursor_MacroExpansion = 502;
    CXCursor_MacroInstantiation = CXCursor_MacroExpansion;
    CXCursor_InclusionDirective = 503;
    CXCursor_FirstPreprocessing = CXCursor_PreprocessingDirective;
    CXCursor_LastPreprocessing = CXCursor_InclusionDirective;
    CXCursor_ModuleImportDecl = 600;
    CXCursor_TypeAliasTemplateDecl = 601;
    CXCursor_StaticAssert = 602;
    CXCursor_FriendDecl = 603;
    CXCursor_ConceptDecl = 604;
    CXCursor_FirstExtraDecl = CXCursor_ModuleImportDecl;
    CXCursor_LastExtraDecl = CXCursor_ConceptDecl;
    CXCursor_OverloadCandidate = 700;

type
  PPCXCursor = ^PCXCursor;
  PCXCursor = ^TCXCursor;
  TCXCursor = record
      kind : TCXCursorKind;
      xdata : longint;
      data : array[0..2] of pointer;
    end;

function clang_getNullCursor:TCXCursor;cdecl;external libgclang;
function clang_getTranslationUnitCursor(para1:TCXTranslationUnit):TCXCursor;cdecl;external libgclang;
function clang_equalCursors(para1:TCXCursor; para2:TCXCursor):dword;cdecl;external libgclang;
function clang_Cursor_isNull(cursor:TCXCursor):longint;cdecl;external libgclang;
function clang_hashCursor(para1:TCXCursor):dword;cdecl;external libgclang;
function clang_getCursorKind(para1:TCXCursor):TCXCursorKind;cdecl;external libgclang;
function clang_isDeclaration(para1:TCXCursorKind):dword;cdecl;external libgclang;
function clang_isInvalidDeclaration(para1:TCXCursor):dword;cdecl;external libgclang;
function clang_isReference(para1:TCXCursorKind):dword;cdecl;external libgclang;
function clang_isExpression(para1:TCXCursorKind):dword;cdecl;external libgclang;
function clang_isStatement(para1:TCXCursorKind):dword;cdecl;external libgclang;
function clang_isAttribute(para1:TCXCursorKind):dword;cdecl;external libgclang;
function clang_Cursor_hasAttrs(C:TCXCursor):dword;cdecl;external libgclang;
function clang_isInvalid(para1:TCXCursorKind):dword;cdecl;external libgclang;
function clang_isTranslationUnit(para1:TCXCursorKind):dword;cdecl;external libgclang;
function clang_isPreprocessing(para1:TCXCursorKind):dword;cdecl;external libgclang;
function clang_isUnexposed(para1:TCXCursorKind):dword;cdecl;external libgclang;

type
  TCXLinkageKind =  Longint;
  Const
    CXLinkage_Invalid = 0;
    CXLinkage_NoLinkage = 1;
    CXLinkage_Internal = 2;
    CXLinkage_UniqueExternal = 3;
    CXLinkage_External = 4;

function clang_getCursorLinkage(cursor:TCXCursor):TCXLinkageKind;cdecl;external libgclang;

type
  TCXVisibilityKind =  Longint;
  Const
    CXVisibility_Invalid = 0;
    CXVisibility_Hidden = 1;
    CXVisibility_Protected = 2;
    CXVisibility_Default = 3;

function clang_getCursorVisibility(cursor:TCXCursor):TCXVisibilityKind;cdecl;external libgclang;
function clang_getCursorAvailability(cursor:TCXCursor):TCXAvailabilityKind;cdecl;external libgclang;

type
  PCXPlatformAvailability = ^TCXPlatformAvailability;
  TCXPlatformAvailability = record
      Platform : TCXString;
      Introduced : TCXVersion;
      Deprecated : TCXVersion;
      Obsoleted : TCXVersion;
      Unavailable : longint;
      Message : TCXString;
    end;

function clang_getCursorPlatformAvailability(cursor:TCXCursor; always_deprecated:Plongint; deprecated_message:PCXString; always_unavailable:Plongint; unavailable_message:PCXString; 
           availability:PCXPlatformAvailability; availability_size:longint):longint;cdecl;external libgclang;
procedure clang_disposeCXPlatformAvailability(availability:PCXPlatformAvailability);cdecl;external libgclang;
function clang_Cursor_getVarDeclInitializer(cursor:TCXCursor):TCXCursor;cdecl;external libgclang;
function clang_Cursor_hasVarDeclGlobalStorage(cursor:TCXCursor):longint;cdecl;external libgclang;
function clang_Cursor_hasVarDeclExternalStorage(cursor:TCXCursor):longint;cdecl;external libgclang;

type
  TCXLanguageKind =  Longint;
  Const
    CXLanguage_Invalid = 0;
    CXLanguage_C = 1;
    CXLanguage_ObjC = 2;
    CXLanguage_CPlusPlus = 3;

function clang_getCursorLanguage(cursor:TCXCursor):TCXLanguageKind;cdecl;external libgclang;

type
  TCXTLSKind =  Longint;
  Const
    CXTLS_None = 0;
    CXTLS_Dynamic = 1;
    CXTLS_Static = 2;

function clang_getCursorTLSKind(cursor:TCXCursor):TCXTLSKind;cdecl;external libgclang;
function clang_Cursor_getTranslationUnit(para1:TCXCursor):TCXTranslationUnit;cdecl;external libgclang;

type
  PCXCursorSet = ^TCXCursorSet;
  TCXCursorSet = type Pointer;

function clang_createCXCursorSet:TCXCursorSet;cdecl;external libgclang;
procedure clang_disposeCXCursorSet(cset:TCXCursorSet);cdecl;external libgclang;
function clang_CXCursorSet_contains(cset:TCXCursorSet; cursor:TCXCursor):dword;cdecl;external libgclang;
function clang_CXCursorSet_insert(cset:TCXCursorSet; cursor:TCXCursor):dword;cdecl;external libgclang;
function clang_getCursorSemanticParent(cursor:TCXCursor):TCXCursor;cdecl;external libgclang;
function clang_getCursorLexicalParent(cursor:TCXCursor):TCXCursor;cdecl;external libgclang;
procedure clang_getOverriddenCursors(cursor:TCXCursor; overridden:PPCXCursor; num_overridden:Pdword);cdecl;external libgclang;
procedure clang_disposeOverriddenCursors(overridden:PCXCursor);cdecl;external libgclang;
function clang_getIncludedFile(cursor:TCXCursor):TCXFile;cdecl;external libgclang;
function clang_getCursor(para1:TCXTranslationUnit; para2:TCXSourceLocation):TCXCursor;cdecl;external libgclang;
function clang_getCursorLocation(para1:TCXCursor):TCXSourceLocation;cdecl;external libgclang;
function clang_getCursorExtent(para1:TCXCursor):TCXSourceRange;cdecl;external libgclang;

type
  TCXTypeKind =  Longint;
  Const
    CXType_Invalid = 0;
    CXType_Unexposed = 1;
    CXType_Void = 2;
    CXType_Bool = 3;
    CXType_Char_U = 4;
    CXType_UChar = 5;
    CXType_Char16 = 6;
    CXType_Char32 = 7;
    CXType_UShort = 8;
    CXType_UInt = 9;
    CXType_ULong = 10;
    CXType_ULongLong = 11;
    CXType_UInt128 = 12;
    CXType_Char_S = 13;
    CXType_SChar = 14;
    CXType_WChar = 15;
    CXType_Short = 16;
    CXType_Int = 17;
    CXType_Long = 18;
    CXType_LongLong = 19;
    CXType_Int128 = 20;
    CXType_Float = 21;
    CXType_Double = 22;
    CXType_LongDouble = 23;
    CXType_NullPtr = 24;
    CXType_Overload = 25;
    CXType_Dependent = 26;
    CXType_ObjCId = 27;
    CXType_ObjCClass = 28;
    CXType_ObjCSel = 29;
    CXType_Float128 = 30;
    CXType_Half = 31;
    CXType_Float16 = 32;
    CXType_ShortAccum = 33;
    CXType_Accum = 34;
    CXType_LongAccum = 35;
    CXType_UShortAccum = 36;
    CXType_UAccum = 37;
    CXType_ULongAccum = 38;
    CXType_BFloat16 = 39;
    CXType_Ibm128 = 40;
    CXType_FirstBuiltin = CXType_Void;
    CXType_LastBuiltin = CXType_Ibm128;
    CXType_Complex = 100;
    CXType_Pointer = 101;
    CXType_BlockPointer = 102;
    CXType_LValueReference = 103;
    CXType_RValueReference = 104;
    CXType_Record = 105;
    CXType_Enum = 106;
    CXType_Typedef = 107;
    CXType_ObjCInterface = 108;
    CXType_ObjCObjectPointer = 109;
    CXType_FunctionNoProto = 110;
    CXType_FunctionProto = 111;
    CXType_ConstantArray = 112;
    CXType_Vector = 113;
    CXType_IncompleteArray = 114;
    CXType_VariableArray = 115;
    CXType_DependentSizedArray = 116;
    CXType_MemberPointer = 117;
    CXType_Auto = 118;
    CXType_Elaborated = 119;
    CXType_Pipe = 120;
    CXType_OCLImage1dRO = 121;
    CXType_OCLImage1dArrayRO = 122;
    CXType_OCLImage1dBufferRO = 123;
    CXType_OCLImage2dRO = 124;
    CXType_OCLImage2dArrayRO = 125;
    CXType_OCLImage2dDepthRO = 126;
    CXType_OCLImage2dArrayDepthRO = 127;
    CXType_OCLImage2dMSAARO = 128;
    CXType_OCLImage2dArrayMSAARO = 129;
    CXType_OCLImage2dMSAADepthRO = 130;
    CXType_OCLImage2dArrayMSAADepthRO = 131;
    CXType_OCLImage3dRO = 132;
    CXType_OCLImage1dWO = 133;
    CXType_OCLImage1dArrayWO = 134;
    CXType_OCLImage1dBufferWO = 135;
    CXType_OCLImage2dWO = 136;
    CXType_OCLImage2dArrayWO = 137;
    CXType_OCLImage2dDepthWO = 138;
    CXType_OCLImage2dArrayDepthWO = 139;
    CXType_OCLImage2dMSAAWO = 140;
    CXType_OCLImage2dArrayMSAAWO = 141;
    CXType_OCLImage2dMSAADepthWO = 142;
    CXType_OCLImage2dArrayMSAADepthWO = 143;
    CXType_OCLImage3dWO = 144;
    CXType_OCLImage1dRW = 145;
    CXType_OCLImage1dArrayRW = 146;
    CXType_OCLImage1dBufferRW = 147;
    CXType_OCLImage2dRW = 148;
    CXType_OCLImage2dArrayRW = 149;
    CXType_OCLImage2dDepthRW = 150;
    CXType_OCLImage2dArrayDepthRW = 151;
    CXType_OCLImage2dMSAARW = 152;
    CXType_OCLImage2dArrayMSAARW = 153;
    CXType_OCLImage2dMSAADepthRW = 154;
    CXType_OCLImage2dArrayMSAADepthRW = 155;
    CXType_OCLImage3dRW = 156;
    CXType_OCLSampler = 157;
    CXType_OCLEvent = 158;
    CXType_OCLQueue = 159;
    CXType_OCLReserveID = 160;
    CXType_ObjCObject = 161;
    CXType_ObjCTypeParam = 162;
    CXType_Attributed = 163;
    CXType_OCLIntelSubgroupAVCMcePayload = 164;
    CXType_OCLIntelSubgroupAVCImePayload = 165;
    CXType_OCLIntelSubgroupAVCRefPayload = 166;
    CXType_OCLIntelSubgroupAVCSicPayload = 167;
    CXType_OCLIntelSubgroupAVCMceResult = 168;
    CXType_OCLIntelSubgroupAVCImeResult = 169;
    CXType_OCLIntelSubgroupAVCRefResult = 170;
    CXType_OCLIntelSubgroupAVCSicResult = 171;
    CXType_OCLIntelSubgroupAVCImeResultSingleReferenceStreamout = 172;
    CXType_OCLIntelSubgroupAVCImeResultDualReferenceStreamout = 173;
    CXType_OCLIntelSubgroupAVCImeSingleReferenceStreamin = 174;
    CXType_OCLIntelSubgroupAVCImeDualReferenceStreamin = 175;
    CXType_OCLIntelSubgroupAVCImeResultSingleRefStreamout = 172;
    CXType_OCLIntelSubgroupAVCImeResultDualRefStreamout = 173;
    CXType_OCLIntelSubgroupAVCImeSingleRefStreamin = 174;
    CXType_OCLIntelSubgroupAVCImeDualRefStreamin = 175;
    CXType_ExtVector = 176;
    CXType_Atomic = 177;
    CXType_BTFTagAttributed = 178;
    CXType_HLSLResource = 179;
    CXType_HLSLAttributedResource = 180;

type
  TCXCallingConv =  Longint;
  Const
    CXCallingConv_Default = 0;
    CXCallingConv_C = 1;
    CXCallingConv_X86StdCall = 2;
    CXCallingConv_X86FastCall = 3;
    CXCallingConv_X86ThisCall = 4;
    CXCallingConv_X86Pascal = 5;
    CXCallingConv_AAPCS = 6;
    CXCallingConv_AAPCS_VFP = 7;
    CXCallingConv_X86RegCall = 8;
    CXCallingConv_IntelOclBicc = 9;
    CXCallingConv_Win64 = 10;
    CXCallingConv_X86_64Win64 = CXCallingConv_Win64;
    CXCallingConv_X86_64SysV = 11;
    CXCallingConv_X86VectorCall = 12;
    CXCallingConv_Swift = 13;
    CXCallingConv_PreserveMost = 14;
    CXCallingConv_PreserveAll = 15;
    CXCallingConv_AArch64VectorCall = 16;
    CXCallingConv_SwiftAsync = 17;
    CXCallingConv_AArch64SVEPCS = 18;
    CXCallingConv_M68kRTD = 19;
    CXCallingConv_PreserveNone = 20;
    CXCallingConv_RISCVVectorCall = 21;
    CXCallingConv_Invalid = 100;
    CXCallingConv_Unexposed = 200;

type
  PCXType = ^TCXType;
  TCXType = record
      kind : TCXTypeKind;
      data : array[0..1] of pointer;
    end;

function clang_getCursorType(C:TCXCursor):TCXType;cdecl;external libgclang;
function clang_getTypeSpelling(CT:TCXType):TCXString;cdecl;external libgclang;
function clang_getTypedefDeclUnderlyingType(C:TCXCursor):TCXType;cdecl;external libgclang;
function clang_getEnumDeclIntegerType(C:TCXCursor):TCXType;cdecl;external libgclang;
function clang_getEnumConstantDeclValue(C:TCXCursor):int64;cdecl;external libgclang;
function clang_getEnumConstantDeclUnsignedValue(C:TCXCursor):qword;cdecl;external libgclang;
function clang_Cursor_isBitField(C:TCXCursor):dword;cdecl;external libgclang;
function clang_getFieldDeclBitWidth(C:TCXCursor):longint;cdecl;external libgclang;
function clang_Cursor_getNumArguments(C:TCXCursor):longint;cdecl;external libgclang;
function clang_Cursor_getArgument(C:TCXCursor; i:dword):TCXCursor;cdecl;external libgclang;

type
  TCXTemplateArgumentKind =  Longint;
  Const
    CXTemplateArgumentKind_Null = 0;
    CXTemplateArgumentKind_Type = 1;
    CXTemplateArgumentKind_Declaration = 2;
    CXTemplateArgumentKind_NullPtr = 3;
    CXTemplateArgumentKind_Integral = 4;
    CXTemplateArgumentKind_Template = 5;
    CXTemplateArgumentKind_TemplateExpansion = 6;
    CXTemplateArgumentKind_Expression = 7;
    CXTemplateArgumentKind_Pack = 8;
    CXTemplateArgumentKind_Invalid = 9;

function clang_Cursor_getNumTemplateArguments(C:TCXCursor):longint;cdecl;external libgclang;
function clang_Cursor_getTemplateArgumentKind(C:TCXCursor; I:dword):TCXTemplateArgumentKind;cdecl;external libgclang;
function clang_Cursor_getTemplateArgumentType(C:TCXCursor; I:dword):TCXType;cdecl;external libgclang;
function clang_Cursor_getTemplateArgumentValue(C:TCXCursor; I:dword):int64;cdecl;external libgclang;
function clang_Cursor_getTemplateArgumentUnsignedValue(C:TCXCursor; I:dword):qword;cdecl;external libgclang;
function clang_equalTypes(A:TCXType; B:TCXType):dword;cdecl;external libgclang;
function clang_getCanonicalType(T:TCXType):TCXType;cdecl;external libgclang;
function clang_isConstQualifiedType(T:TCXType):dword;cdecl;external libgclang;
function clang_Cursor_isMacroFunctionLike(C:TCXCursor):dword;cdecl;external libgclang;
function clang_Cursor_isMacroBuiltin(C:TCXCursor):dword;cdecl;external libgclang;
function clang_Cursor_isFunctionInlined(C:TCXCursor):dword;cdecl;external libgclang;
function clang_isVolatileQualifiedType(T:TCXType):dword;cdecl;external libgclang;
function clang_isRestrictQualifiedType(T:TCXType):dword;cdecl;external libgclang;
function clang_getAddressSpace(T:TCXType):dword;cdecl;external libgclang;
function clang_getTypedefName(CT:TCXType):TCXString;cdecl;external libgclang;
function clang_getPointeeType(T:TCXType):TCXType;cdecl;external libgclang;
function clang_getUnqualifiedType(CT:TCXType):TCXType;cdecl;external libgclang;
function clang_getNonReferenceType(CT:TCXType):TCXType;cdecl;external libgclang;
function clang_getTypeDeclaration(T:TCXType):TCXCursor;cdecl;external libgclang;
function clang_getDeclObjCTypeEncoding(C:TCXCursor):TCXString;cdecl;external libgclang;
function clang_Type_getObjCEncoding(_type:TCXType):TCXString;cdecl;external libgclang;
function clang_getTypeKindSpelling(K:TCXTypeKind):TCXString;cdecl;external libgclang;
function clang_getFunctionTypeCallingConv(T:TCXType):TCXCallingConv;cdecl;external libgclang;
function clang_getResultType(T:TCXType):TCXType;cdecl;external libgclang;
function clang_getExceptionSpecificationType(T:TCXType):longint;cdecl;external libgclang;
function clang_getNumArgTypes(T:TCXType):longint;cdecl;external libgclang;
function clang_getArgType(T:TCXType; i:dword):TCXType;cdecl;external libgclang;
function clang_Type_getObjCObjectBaseType(T:TCXType):TCXType;cdecl;external libgclang;
function clang_Type_getNumObjCProtocolRefs(T:TCXType):dword;cdecl;external libgclang;
function clang_Type_getObjCProtocolDecl(T:TCXType; i:dword):TCXCursor;cdecl;external libgclang;
function clang_Type_getNumObjCTypeArgs(T:TCXType):dword;cdecl;external libgclang;
function clang_Type_getObjCTypeArg(T:TCXType; i:dword):TCXType;cdecl;external libgclang;
function clang_isFunctionTypeVariadic(T:TCXType):dword;cdecl;external libgclang;
function clang_getCursorResultType(C:TCXCursor):TCXType;cdecl;external libgclang;
function clang_getCursorExceptionSpecificationType(C:TCXCursor):longint;cdecl;external libgclang;
function clang_isPODType(T:TCXType):dword;cdecl;external libgclang;
function clang_getElementType(T:TCXType):TCXType;cdecl;external libgclang;
function clang_getNumElements(T:TCXType):int64;cdecl;external libgclang;
function clang_getArrayElementType(T:TCXType):TCXType;cdecl;external libgclang;
function clang_getArraySize(T:TCXType):int64;cdecl;external libgclang;
function clang_Type_getNamedType(T:TCXType):TCXType;cdecl;external libgclang;
function clang_Type_isTransparentTagTypedef(T:TCXType):dword;cdecl;external libgclang;

type
  TCXTypeNullabilityKind =  Longint;
  Const
    CXTypeNullability_NonNull = 0;
    CXTypeNullability_Nullable = 1;
    CXTypeNullability_Unspecified = 2;
    CXTypeNullability_Invalid = 3;
    CXTypeNullability_NullableResult = 4;

function clang_Type_getNullability(T:TCXType):TCXTypeNullabilityKind;cdecl;external libgclang;

type
  TCXTypeLayoutError =  Longint;
  Const
    CXTypeLayoutError_Invalid = -(1);
    CXTypeLayoutError_Incomplete = -(2);
    CXTypeLayoutError_Dependent = -(3);
    CXTypeLayoutError_NotConstantSize = -(4);
    CXTypeLayoutError_InvalidFieldName = -(5);
    CXTypeLayoutError_Undeduced = -(6);

function clang_Type_getAlignOf(T:TCXType):int64;cdecl;external libgclang;
function clang_Type_getClassType(T:TCXType):TCXType;cdecl;external libgclang;
function clang_Type_getSizeOf(T:TCXType):int64;cdecl;external libgclang;
function clang_Type_getOffsetOf(T:TCXType; S:Pchar):int64;cdecl;external libgclang;
function clang_Type_getModifiedType(T:TCXType):TCXType;cdecl;external libgclang;
function clang_Type_getValueType(CT:TCXType):TCXType;cdecl;external libgclang;
function clang_Cursor_getOffsetOfField(C:TCXCursor):int64;cdecl;external libgclang;
function clang_Cursor_isAnonymous(C:TCXCursor):dword;cdecl;external libgclang;
function clang_Cursor_isAnonymousRecordDecl(C:TCXCursor):dword;cdecl;external libgclang;
function clang_Cursor_isInlineNamespace(C:TCXCursor):dword;cdecl;external libgclang;

type
  TCXRefQualifierKind =  Longint;
  Const
    CXRefQualifier_None = 0;
    CXRefQualifier_LValue = 1;
    CXRefQualifier_RValue = 2;

function clang_Type_getNumTemplateArguments(T:TCXType):longint;cdecl;external libgclang;
function clang_Type_getTemplateArgumentAsType(T:TCXType; i:dword):TCXType;cdecl;external libgclang;
function clang_Type_getCXXRefQualifier(T:TCXType):TCXRefQualifierKind;cdecl;external libgclang;
function clang_isVirtualBase(para1:TCXCursor):dword;cdecl;external libgclang;
function clang_getOffsetOfBase(Parent:TCXCursor; Base:TCXCursor):int64;cdecl;external libgclang;

type
  TCX_CXXAccessSpecifier =  Longint;
  Const
    CX_CXXInvalidAccessSpecifier = 0;
    CX_CXXPublic = 1;
    CX_CXXProtected = 2;
    CX_CXXPrivate = 3;

function clang_getCXXAccessSpecifier(para1:TCXCursor):TCX_CXXAccessSpecifier;cdecl;external libgclang;

type
  TCX_StorageClass =  Longint;
  Const
    CX_SC_Invalid = 0;
    CX_SC_None = 1;
    CX_SC_Extern = 2;
    CX_SC_Static = 3;
    CX_SC_PrivateExtern = 4;
    CX_SC_OpenCLWorkGroupLocal = 5;
    CX_SC_Auto = 6;
    CX_SC_Register = 7;

type
  TCX_BinaryOperatorKind =  Longint;
  Const
    CX_BO_Invalid = 0;
    CX_BO_PtrMemD = 1;
    CX_BO_PtrMemI = 2;
    CX_BO_Mul = 3;
    CX_BO_Div = 4;
    CX_BO_Rem = 5;
    CX_BO_Add = 6;
    CX_BO_Sub = 7;
    CX_BO_Shl = 8;
    CX_BO_Shr = 9;
    CX_BO_Cmp = 10;
    CX_BO_LT = 11;
    CX_BO_GT = 12;
    CX_BO_LE = 13;
    CX_BO_GE = 14;
    CX_BO_EQ = 15;
    CX_BO_NE = 16;
    CX_BO_And = 17;
    CX_BO_Xor = 18;
    CX_BO_Or = 19;
    CX_BO_LAnd = 20;
    CX_BO_LOr = 21;
    CX_BO_Assign = 22;
    CX_BO_MulAssign = 23;
    CX_BO_DivAssign = 24;
    CX_BO_RemAssign = 25;
    CX_BO_AddAssign = 26;
    CX_BO_SubAssign = 27;
    CX_BO_ShlAssign = 28;
    CX_BO_ShrAssign = 29;
    CX_BO_AndAssign = 30;
    CX_BO_XorAssign = 31;
    CX_BO_OrAssign = 32;
    CX_BO_Comma = 33;
    CX_BO_LAST = CX_BO_Comma;

function clang_Cursor_getBinaryOpcode(C:TCXCursor):TCX_BinaryOperatorKind;cdecl;external libgclang;
function clang_Cursor_getBinaryOpcodeStr(Op:TCX_BinaryOperatorKind):TCXString;cdecl;external libgclang;
function clang_Cursor_getStorageClass(para1:TCXCursor):TCX_StorageClass;cdecl;external libgclang;
function clang_getNumOverloadedDecls(cursor:TCXCursor):dword;cdecl;external libgclang;
function clang_getOverloadedDecl(cursor:TCXCursor; index:dword):TCXCursor;cdecl;external libgclang;
function clang_getIBOutletCollectionType(para1:TCXCursor):TCXType;cdecl;external libgclang;

type
  PCXChildVisitResult=^TCXChildVisitResult;
  TCXChildVisitResult =  Longint;
  Const
    CXChildVisit_Break = 0;
    CXChildVisit_Continue = 1;
    CXChildVisit_Recurse = 2;

type
  TCXCursorVisitor = function (cursor:TCXCursor; parent:TCXCursor; client_data:TCXClientData):TCXChildVisitResult;cdecl;

function clang_visitChildren(parent:TCXCursor; visitor:TCXCursorVisitor; client_data:TCXClientData):dword;cdecl;external libgclang;

type
  PCXCursorVisitorBlock = ^TCXCursorVisitorBlock;
  TCXCursorVisitorBlock = PCXChildVisitResult;

function clang_visitChildrenWithBlock(parent:TCXCursor; block:TCXCursorVisitorBlock):dword;cdecl;external libgclang;
function clang_getCursorUSR(para1:TCXCursor):TCXString;cdecl;external libgclang;
function clang_constructUSR_ObjCClass(class_name:Pchar):TCXString;cdecl;external libgclang;
function clang_constructUSR_ObjCCategory(class_name:Pchar; category_name:Pchar):TCXString;cdecl;external libgclang;
function clang_constructUSR_ObjCProtocol(protocol_name:Pchar):TCXString;cdecl;external libgclang;
function clang_constructUSR_ObjCIvar(name:Pchar; classUSR:TCXString):TCXString;cdecl;external libgclang;
function clang_constructUSR_ObjCMethod(name:Pchar; isInstanceMethod:dword; classUSR:TCXString):TCXString;cdecl;external libgclang;
function clang_constructUSR_ObjCProperty(_property:Pchar; classUSR:TCXString):TCXString;cdecl;external libgclang;
function clang_getCursorSpelling(para1:TCXCursor):TCXString;cdecl;external libgclang;
function clang_Cursor_getSpellingNameRange(para1:TCXCursor; pieceIndex:dword; options:dword):TCXSourceRange;cdecl;external libgclang;

type
  PCXPrintingPolicy = ^TCXPrintingPolicy;
  TCXPrintingPolicy = pointer;

  type
  TCXPrintingPolicyProperty =  Longint;
  Const
    CXPrintingPolicy_Indentation = 0;
    CXPrintingPolicy_SuppressSpecifiers = 1;
    CXPrintingPolicy_SuppressTagKeyword = 2;
    CXPrintingPolicy_IncludeTagDefinition = 3;
    CXPrintingPolicy_SuppressScope = 4;
    CXPrintingPolicy_SuppressUnwrittenScope = 5;
    CXPrintingPolicy_SuppressInitializers = 6;
    CXPrintingPolicy_ConstantArraySizeAsWritten = 7;
    CXPrintingPolicy_AnonymousTagLocations = 8;
    CXPrintingPolicy_SuppressStrongLifetime = 9;
    CXPrintingPolicy_SuppressLifetimeQualifiers = 10;
    CXPrintingPolicy_SuppressTemplateArgsInCXXConstructors = 11;
    CXPrintingPolicy_Bool = 12;
    CXPrintingPolicy_Restrict = 13;
    CXPrintingPolicy_Alignof = 14;
    CXPrintingPolicy_UnderscoreAlignof = 15;
    CXPrintingPolicy_UseVoidForZeroParams = 16;
    CXPrintingPolicy_TerseOutput = 17;
    CXPrintingPolicy_PolishForDeclaration = 18;
    CXPrintingPolicy_Half = 19;
    CXPrintingPolicy_MSWChar = 20;
    CXPrintingPolicy_IncludeNewlines = 21;
    CXPrintingPolicy_MSVCFormatting = 22;
    CXPrintingPolicy_ConstantsAsWritten = 23;
    CXPrintingPolicy_SuppressImplicitBase = 24;
    CXPrintingPolicy_FullyQualifiedName = 25;
    CXPrintingPolicy_LastProperty = CXPrintingPolicy_FullyQualifiedName;

function clang_PrintingPolicy_getProperty(Policy:TCXPrintingPolicy; _Property:TCXPrintingPolicyProperty):dword;cdecl;external libgclang;
procedure clang_PrintingPolicy_setProperty(Policy:TCXPrintingPolicy; _Property:TCXPrintingPolicyProperty; Value:dword);cdecl;external libgclang;
function clang_getCursorPrintingPolicy(para1:TCXCursor):TCXPrintingPolicy;cdecl;external libgclang;
procedure clang_PrintingPolicy_dispose(Policy:TCXPrintingPolicy);cdecl;external libgclang;
function clang_getCursorPrettyPrinted(Cursor:TCXCursor; Policy:TCXPrintingPolicy):TCXString;cdecl;external libgclang;
function clang_getTypePrettyPrinted(CT:TCXType; cxPolicy:TCXPrintingPolicy):TCXString;cdecl;external libgclang;
function clang_getCursorDisplayName(para1:TCXCursor):TCXString;cdecl;external libgclang;
function clang_getCursorReferenced(para1:TCXCursor):TCXCursor;cdecl;external libgclang;
function clang_getCursorDefinition(para1:TCXCursor):TCXCursor;cdecl;external libgclang;
function clang_isCursorDefinition(para1:TCXCursor):dword;cdecl;external libgclang;
function clang_getCanonicalCursor(para1:TCXCursor):TCXCursor;cdecl;external libgclang;
function clang_Cursor_getObjCSelectorIndex(para1:TCXCursor):longint;cdecl;external libgclang;
function clang_Cursor_isDynamicCall(C:TCXCursor):longint;cdecl;external libgclang;
function clang_Cursor_getReceiverType(C:TCXCursor):TCXType;cdecl;external libgclang;

type
  PCXObjCPropertyAttrKind = ^TCXObjCPropertyAttrKind;
  TCXObjCPropertyAttrKind =  Longint;
  Const
    CXObjCPropertyAttr_noattr = $00;
    CXObjCPropertyAttr_readonly = $01;
    CXObjCPropertyAttr_getter = $02;
    CXObjCPropertyAttr_assign = $04;
    CXObjCPropertyAttr_readwrite = $08;
    CXObjCPropertyAttr_retain = $10;
    CXObjCPropertyAttr_copy = $20;
    CXObjCPropertyAttr_nonatomic = $40;
    CXObjCPropertyAttr_setter = $80;
    CXObjCPropertyAttr_atomic = $100;
    CXObjCPropertyAttr_weak = $200;
    CXObjCPropertyAttr_strong = $400;
    CXObjCPropertyAttr_unsafe_unretained = $800;
    CXObjCPropertyAttr_class = $1000;

function clang_Cursor_getObjCPropertyAttributes(C:TCXCursor; reserved:dword):dword;cdecl;external libgclang;
function clang_Cursor_getObjCPropertyGetterName(C:TCXCursor):TCXString;cdecl;external libgclang;
function clang_Cursor_getObjCPropertySetterName(C:TCXCursor):TCXString;cdecl;external libgclang;

type
  PCXObjCDeclQualifierKind = ^TCXObjCDeclQualifierKind;
  TCXObjCDeclQualifierKind =  Longint;
  Const
    CXObjCDeclQualifier_None = $0;
    CXObjCDeclQualifier_In = $1;
    CXObjCDeclQualifier_Inout = $2;
    CXObjCDeclQualifier_Out = $4;
    CXObjCDeclQualifier_Bycopy = $8;
    CXObjCDeclQualifier_Byref = $10;
    CXObjCDeclQualifier_Oneway = $20;

function clang_Cursor_getObjCDeclQualifiers(C:TCXCursor):dword;cdecl;external libgclang;
function clang_Cursor_isObjCOptional(C:TCXCursor):dword;cdecl;external libgclang;
function clang_Cursor_isVariadic(C:TCXCursor):dword;cdecl;external libgclang;
function clang_Cursor_isExternalSymbol(C:TCXCursor; language:PCXString; definedIn:PCXString; isGenerated:Pdword):dword;cdecl;external libgclang;
function clang_Cursor_getCommentRange(C:TCXCursor):TCXSourceRange;cdecl;external libgclang;
function clang_Cursor_getRawCommentText(C:TCXCursor):TCXString;cdecl;external libgclang;
function clang_Cursor_getBriefCommentText(C:TCXCursor):TCXString;cdecl;external libgclang;
function clang_Cursor_getMangling(para1:TCXCursor):TCXString;cdecl;external libgclang;
function clang_Cursor_getCXXManglings(para1:TCXCursor):PCXStringSet;cdecl;external libgclang;
function clang_Cursor_getObjCManglings(para1:TCXCursor):PCXStringSet;cdecl;external libgclang;

type
  PCXModule = ^TCXModule;
  TCXModule = pointer;

function clang_Cursor_getModule(C:TCXCursor):TCXModule;cdecl;external libgclang;
function clang_getModuleForFile(para1:TCXTranslationUnit; para2:TCXFile):TCXModule;cdecl;external libgclang;
function clang_Module_getASTFile(Module:TCXModule):TCXFile;cdecl;external libgclang;
function clang_Module_getParent(Module:TCXModule):TCXModule;cdecl;external libgclang;
function clang_Module_getName(Module:TCXModule):TCXString;cdecl;external libgclang;
function clang_Module_getFullName(Module:TCXModule):TCXString;cdecl;external libgclang;
function clang_Module_isSystem(Module:TCXModule):longint;cdecl;external libgclang;
function clang_Module_getNumTopLevelHeaders(para1:TCXTranslationUnit; Module:TCXModule):dword;cdecl;external libgclang;
function clang_Module_getTopLevelHeader(para1:TCXTranslationUnit; Module:TCXModule; Index:dword):TCXFile;cdecl;external libgclang;
function clang_CXXConstructor_isConvertingConstructor(C:TCXCursor):dword;cdecl;external libgclang;
function clang_CXXConstructor_isCopyConstructor(C:TCXCursor):dword;cdecl;external libgclang;
function clang_CXXConstructor_isDefaultConstructor(C:TCXCursor):dword;cdecl;external libgclang;
function clang_CXXConstructor_isMoveConstructor(C:TCXCursor):dword;cdecl;external libgclang;
function clang_CXXField_isMutable(C:TCXCursor):dword;cdecl;external libgclang;
function clang_CXXMethod_isDefaulted(C:TCXCursor):dword;cdecl;external libgclang;
function clang_CXXMethod_isDeleted(C:TCXCursor):dword;cdecl;external libgclang;
function clang_CXXMethod_isPureVirtual(C:TCXCursor):dword;cdecl;external libgclang;
function clang_CXXMethod_isStatic(C:TCXCursor):dword;cdecl;external libgclang;
function clang_CXXMethod_isVirtual(C:TCXCursor):dword;cdecl;external libgclang;
function clang_CXXMethod_isCopyAssignmentOperator(C:TCXCursor):dword;cdecl;external libgclang;
function clang_CXXMethod_isMoveAssignmentOperator(C:TCXCursor):dword;cdecl;external libgclang;
function clang_CXXMethod_isExplicit(C:TCXCursor):dword;cdecl;external libgclang;
function clang_CXXRecord_isAbstract(C:TCXCursor):dword;cdecl;external libgclang;
function clang_EnumDecl_isScoped(C:TCXCursor):dword;cdecl;external libgclang;
function clang_CXXMethod_isConst(C:TCXCursor):dword;cdecl;external libgclang;
function clang_getTemplateCursorKind(C:TCXCursor):TCXCursorKind;cdecl;external libgclang;
function clang_getSpecializedCursorTemplate(C:TCXCursor):TCXCursor;cdecl;external libgclang;
function clang_getCursorReferenceNameRange(C:TCXCursor; NameFlags:dword; PieceIndex:dword):TCXSourceRange;cdecl;external libgclang;

type
  TCXNameRefFlags =  Longint;
  Const
    CXNameRange_WantQualifier = $1;
    CXNameRange_WantTemplateArgs = $2;
    CXNameRange_WantSinglePiece = $4;

type
  PCXTokenKind = ^TCXTokenKind;
  TCXTokenKind =  Longint;
  Const
    CXToken_Punctuation = 0;
    CXToken_Keyword = 1;
    CXToken_Identifier = 2;
    CXToken_Literal = 3;
    CXToken_Comment = 4;

  type
    PPCXToken = ^PCXToken;
    PCXToken = ^TCXToken;
  TCXToken = record
      int_data : array[0..3] of dword;
      ptr_data : pointer;
    end;

function clang_getToken(TU:TCXTranslationUnit; Location:TCXSourceLocation):PCXToken;cdecl;external libgclang;
function clang_getTokenKind(para1:TCXToken):TCXTokenKind;cdecl;external libgclang;
function clang_getTokenSpelling(para1:TCXTranslationUnit; para2:TCXToken):TCXString;cdecl;external libgclang;
function clang_getTokenLocation(para1:TCXTranslationUnit; para2:TCXToken):TCXSourceLocation;cdecl;external libgclang;
function clang_getTokenExtent(para1:TCXTranslationUnit; para2:TCXToken):TCXSourceRange;cdecl;external libgclang;
procedure clang_tokenize(TU:TCXTranslationUnit; Range:TCXSourceRange; Tokens:PPCXToken; NumTokens:Pdword);cdecl;external libgclang;
procedure clang_annotateTokens(TU:TCXTranslationUnit; Tokens:PCXToken; NumTokens:dword; Cursors:PCXCursor);cdecl;external libgclang;
procedure clang_disposeTokens(TU:TCXTranslationUnit; Tokens:PCXToken; NumTokens:dword);cdecl;external libgclang;
function clang_getCursorKindSpelling(Kind:TCXCursorKind):TCXString;cdecl;external libgclang;
procedure clang_getDefinitionSpellingAndExtent(para1:TCXCursor; startBuf:PPchar; endBuf:PPchar; startLine:Pdword; startColumn:Pdword; 
            endLine:Pdword; endColumn:Pdword);cdecl;external libgclang;
procedure clang_enableStackTraces;cdecl;external libgclang;
procedure clang_executeOnThread(fn:procedure (para1:pointer); user_data:pointer; stack_size:dword);cdecl;external libgclang;

type
  PCXCompletionString = ^TCXCompletionString;
  TCXCompletionString = pointer;

  PCXCompletionResult = ^TCXCompletionResult;
  TCXCompletionResult = record
      CursorKind : TCXCursorKind;
      CompletionString : TCXCompletionString;
    end;

  type
  TCXCompletionChunkKind =  Longint;
  Const
    CXCompletionChunk_Optional = 0;
    CXCompletionChunk_TypedText = 1;
    CXCompletionChunk_Text = 2;
    CXCompletionChunk_Placeholder = 3;
    CXCompletionChunk_Informative = 4;
    CXCompletionChunk_CurrentParameter = 5;
    CXCompletionChunk_LeftParen = 6;
    CXCompletionChunk_RightParen = 7;
    CXCompletionChunk_LeftBracket = 8;
    CXCompletionChunk_RightBracket = 9;
    CXCompletionChunk_LeftBrace = 10;
    CXCompletionChunk_RightBrace = 11;
    CXCompletionChunk_LeftAngle = 12;
    CXCompletionChunk_RightAngle = 13;
    CXCompletionChunk_Comma = 14;
    CXCompletionChunk_ResultType = 15;
    CXCompletionChunk_Colon = 16;
    CXCompletionChunk_SemiColon = 17;
    CXCompletionChunk_Equal = 18;
    CXCompletionChunk_HorizontalSpace = 19;
    CXCompletionChunk_VerticalSpace = 20;

function clang_getCompletionChunkKind(completion_string:TCXCompletionString; chunk_number:dword):TCXCompletionChunkKind;cdecl;external libgclang;
function clang_getCompletionChunkText(completion_string:TCXCompletionString; chunk_number:dword):TCXString;cdecl;external libgclang;
function clang_getCompletionChunkCompletionString(completion_string:TCXCompletionString; chunk_number:dword):TCXCompletionString;cdecl;external libgclang;
function clang_getNumCompletionChunks(completion_string:TCXCompletionString):dword;cdecl;external libgclang;
function clang_getCompletionPriority(completion_string:TCXCompletionString):dword;cdecl;external libgclang;
function clang_getCompletionAvailability(completion_string:TCXCompletionString):TCXAvailabilityKind;cdecl;external libgclang;
function clang_getCompletionNumAnnotations(completion_string:TCXCompletionString):dword;cdecl;external libgclang;
function clang_getCompletionAnnotation(completion_string:TCXCompletionString; annotation_number:dword):TCXString;cdecl;external libgclang;
function clang_getCompletionParent(completion_string:TCXCompletionString; kind:PCXCursorKind):TCXString;cdecl;external libgclang;
function clang_getCompletionBriefComment(completion_string:TCXCompletionString):TCXString;cdecl;external libgclang;
function clang_getCursorCompletionString(cursor:TCXCursor):TCXCompletionString;cdecl;external libgclang;

type
  PCXCodeCompleteResults = ^TCXCodeCompleteResults;
  TCXCodeCompleteResults = record
      Results : PCXCompletionResult;
      NumResults : dword;
    end;

function clang_getCompletionNumFixIts(results:PCXCodeCompleteResults; completion_index:dword):dword;cdecl;external libgclang;
function clang_getCompletionFixIt(results:PCXCodeCompleteResults; completion_index:dword; fixit_index:dword; replacement_range:PCXSourceRange):TCXString;cdecl;external libgclang;

type
  TCXCodeComplete_Flags =  Longint;
  Const
    CXCodeComplete_IncludeMacros = $01;
    CXCodeComplete_IncludeCodePatterns = $02;
    CXCodeComplete_IncludeBriefComments = $04;
    CXCodeComplete_SkipPreamble = $08;
    CXCodeComplete_IncludeCompletionsWithFixIts = $10;

type
  TCXCompletionContext =  Longint;
  Const
    CXCompletionContext_Unexposed = 0;
    CXCompletionContext_AnyType = 1 shl 0;
    CXCompletionContext_AnyValue = 1 shl 1;
    CXCompletionContext_ObjCObjectValue = 1 shl 2;
    CXCompletionContext_ObjCSelectorValue = 1 shl 3;
    CXCompletionContext_CXXClassTypeValue = 1 shl 4;
    CXCompletionContext_DotMemberAccess = 1 shl 5;
    CXCompletionContext_ArrowMemberAccess = 1 shl 6;
    CXCompletionContext_ObjCPropertyAccess = 1 shl 7;
    CXCompletionContext_EnumTag = 1 shl 8;
    CXCompletionContext_UnionTag = 1 shl 9;
    CXCompletionContext_StructTag = 1 shl 10;
    CXCompletionContext_ClassTag = 1 shl 11;
    CXCompletionContext_Namespace = 1 shl 12;
    CXCompletionContext_NestedNameSpecifier = 1 shl 13;
    CXCompletionContext_ObjCInterface = 1 shl 14;
    CXCompletionContext_ObjCProtocol = 1 shl 15;
    CXCompletionContext_ObjCCategory = 1 shl 16;
    CXCompletionContext_ObjCInstanceMessage = 1 shl 17;
    CXCompletionContext_ObjCClassMessage = 1 shl 18;
    CXCompletionContext_ObjCSelectorName = 1 shl 19;
    CXCompletionContext_MacroName = 1 shl 20;
    CXCompletionContext_NaturalLanguage = 1 shl 21;
    CXCompletionContext_IncludedFile = 1 shl 22;
    CXCompletionContext_Unknown = (1 shl 23)-1;

function clang_defaultCodeCompleteOptions:dword;cdecl;external libgclang;
function clang_codeCompleteAt(TU:TCXTranslationUnit; complete_filename:Pchar; complete_line:dword; complete_column:dword; unsaved_files:PCXUnsavedFile;
           num_unsaved_files:dword; options:dword):PCXCodeCompleteResults;cdecl;external libgclang;
procedure clang_sortCodeCompletionResults(Results:PCXCompletionResult; NumResults:dword);cdecl;external libgclang;
procedure clang_disposeCodeCompleteResults(Results:PCXCodeCompleteResults);cdecl;external libgclang;
function clang_codeCompleteGetNumDiagnostics(Results:PCXCodeCompleteResults):dword;cdecl;external libgclang;
function clang_codeCompleteGetDiagnostic(Results:PCXCodeCompleteResults; Index:dword):TCXDiagnostic;cdecl;external libgclang;
function clang_codeCompleteGetContexts(Results:PCXCodeCompleteResults):qword;cdecl;external libgclang;
function clang_codeCompleteGetContainerKind(Results:PCXCodeCompleteResults; IsIncomplete:Pdword):TCXCursorKind;cdecl;external libgclang;
function clang_codeCompleteGetContainerUSR(Results:PCXCodeCompleteResults):TCXString;cdecl;external libgclang;
function clang_codeCompleteGetObjCSelector(Results:PCXCodeCompleteResults):TCXString;cdecl;external libgclang;
function clang_getClangVersion:TCXString;cdecl;external libgclang;
procedure clang_toggleCrashRecovery(isEnabled:dword);cdecl;external libgclang;

type
  TCXInclusionVisitor = procedure (included_file:TCXFile; inclusion_stack:PCXSourceLocation; include_len:dword; client_data:TCXClientData);cdecl;

procedure clang_getInclusions(tu:TCXTranslationUnit; visitor:TCXInclusionVisitor; client_data:TCXClientData);cdecl;external libgclang;
type
  PCXEvalResultKind = ^TCXEvalResultKind;
  TCXEvalResultKind =  Longint;
  Const
    CXEval_Int = 1;
    CXEval_Float = 2;
    CXEval_ObjCStrLiteral = 3;
    CXEval_StrLiteral = 4;
    CXEval_CFStr = 5;
    CXEval_Other = 6;
    CXEval_UnExposed = 0;

  type
  PCXEvalResult = ^TCXEvalResult;
  TCXEvalResult = pointer;

function clang_Cursor_Evaluate(C:TCXCursor):TCXEvalResult;cdecl;external libgclang;
function clang_EvalResult_getKind(E:TCXEvalResult):TCXEvalResultKind;cdecl;external libgclang;
function clang_EvalResult_getAsInt(E:TCXEvalResult):longint;cdecl;external libgclang;
function clang_EvalResult_getAsLongLong(E:TCXEvalResult):int64;cdecl;external libgclang;
function clang_EvalResult_isUnsignedInt(E:TCXEvalResult):dword;cdecl;external libgclang;
function clang_EvalResult_getAsUnsigned(E:TCXEvalResult):qword;cdecl;external libgclang;
function clang_EvalResult_getAsDouble(E:TCXEvalResult):Tdouble;cdecl;external libgclang;
function clang_EvalResult_getAsStr(E:TCXEvalResult):Pchar;cdecl;external libgclang;
procedure clang_EvalResult_dispose(E:TCXEvalResult);cdecl;external libgclang;

type
  PCXRemapping = ^TCXRemapping;
  TCXRemapping = pointer;

function clang_getRemappings(path:Pchar):TCXRemapping;cdecl;external libgclang;
function clang_getRemappingsFromFileList(filePaths:PPchar; numFiles:dword):TCXRemapping;cdecl;external libgclang;
function clang_remap_getNumFiles(para1:TCXRemapping):dword;cdecl;external libgclang;
procedure clang_remap_getFilenames(para1:TCXRemapping; index:dword; original:PCXString; transformed:PCXString);cdecl;external libgclang;
procedure clang_remap_dispose(para1:TCXRemapping);cdecl;external libgclang;

type
  TCXVisitorResult =  Longint;
  Const
    CXVisit_Break = 0;
    CXVisit_Continue = 1;

type
  PCXCursorAndRangeVisitor = ^TCXCursorAndRangeVisitor;
  TCXCursorAndRangeVisitor = record
      context : pointer;
      visit : function (context:pointer; para2:TCXCursor; para3:TCXSourceRange):TCXVisitorResult;cdecl;
    end;

  PCXResult = ^TCXResult;
  TCXResult =  Longint;
  Const
    CXResult_Success = 0;
    CXResult_Invalid = 1;
    CXResult_VisitBreak = 2;

function clang_findReferencesInFile(cursor:TCXCursor; file:TCXFile; visitor:TCXCursorAndRangeVisitor):TCXResult;cdecl;external libgclang;
function clang_findIncludesInFile(TU:TCXTranslationUnit; file:TCXFile; visitor:TCXCursorAndRangeVisitor):TCXResult;cdecl;external libgclang;

type
  PCXCursorAndRangeVisitorBlock = ^TCXCursorAndRangeVisitorBlock;
  TCXCursorAndRangeVisitorBlock = PCXCursorAndRangeVisitorBlock;

function clang_findReferencesInFileWithBlock(para1:TCXCursor; para2:TCXFile; para3:TCXCursorAndRangeVisitorBlock):TCXResult;cdecl;external libgclang;
function clang_findIncludesInFileWithBlock(para1:TCXTranslationUnit; para2:TCXFile; para3:TCXCursorAndRangeVisitorBlock):TCXResult;cdecl;external libgclang;

type
  PCXIdxClientFile = ^TCXIdxClientFile;
  TCXIdxClientFile = pointer;

  PCXIdxClientEntity = ^TCXIdxClientEntity;
  TCXIdxClientEntity = pointer;

  PCXIdxClientContainer = ^TCXIdxClientContainer;
  TCXIdxClientContainer = pointer;

  PCXIdxClientASTFile = ^TCXIdxClientASTFile;
  TCXIdxClientASTFile = pointer;

  PCXIdxLoc = ^TCXIdxLoc;
  TCXIdxLoc = record
      ptr_data : array[0..1] of pointer;
      int_data : dword;
    end;

  PCXIdxIncludedFileInfo = ^TCXIdxIncludedFileInfo;
  TCXIdxIncludedFileInfo = record
      hashLoc : TCXIdxLoc;
      filename : Pchar;
      file : TCXFile;
      isImport : longint;
      isAngled : longint;
      isModuleImport : longint;
    end;

  PCXIdxImportedASTFileInfo = ^TCXIdxImportedASTFileInfo;
  TCXIdxImportedASTFileInfo = record
      file : TCXFile;
      module : TCXModule;
      loc : TCXIdxLoc;
      isImplicit : longint;
    end;

  type
  PCXIdxEntityKind = ^TCXIdxEntityKind;
  TCXIdxEntityKind =  Longint;
  Const
    CXIdxEntity_Unexposed = 0;
    CXIdxEntity_Typedef = 1;
    CXIdxEntity_Function = 2;
    CXIdxEntity_Variable = 3;
    CXIdxEntity_Field = 4;
    CXIdxEntity_EnumConstant = 5;
    CXIdxEntity_ObjCClass = 6;
    CXIdxEntity_ObjCProtocol = 7;
    CXIdxEntity_ObjCCategory = 8;
    CXIdxEntity_ObjCInstanceMethod = 9;
    CXIdxEntity_ObjCClassMethod = 10;
    CXIdxEntity_ObjCProperty = 11;
    CXIdxEntity_ObjCIvar = 12;
    CXIdxEntity_Enum = 13;
    CXIdxEntity_Struct = 14;
    CXIdxEntity_Union = 15;
    CXIdxEntity_CXXClass = 16;
    CXIdxEntity_CXXNamespace = 17;
    CXIdxEntity_CXXNamespaceAlias = 18;
    CXIdxEntity_CXXStaticVariable = 19;
    CXIdxEntity_CXXStaticMethod = 20;
    CXIdxEntity_CXXInstanceMethod = 21;
    CXIdxEntity_CXXConstructor = 22;
    CXIdxEntity_CXXDestructor = 23;
    CXIdxEntity_CXXConversionFunction = 24;
    CXIdxEntity_CXXTypeAlias = 25;
    CXIdxEntity_CXXInterface = 26;
    CXIdxEntity_CXXConcept = 27;

type
  PCXIdxEntityLanguage = ^TCXIdxEntityLanguage;
  TCXIdxEntityLanguage =  Longint;
  Const
    CXIdxEntityLang_None = 0;
    CXIdxEntityLang_C = 1;
    CXIdxEntityLang_ObjC = 2;
    CXIdxEntityLang_CXX = 3;
    CXIdxEntityLang_Swift = 4;

  type
  PCXIdxEntityCXXTemplateKind = ^TCXIdxEntityCXXTemplateKind;
  TCXIdxEntityCXXTemplateKind =  Longint;
  Const
    CXIdxEntity_NonTemplate = 0;
    CXIdxEntity_Template = 1;
    CXIdxEntity_TemplatePartialSpecialization = 2;
    CXIdxEntity_TemplateSpecialization = 3;
;
type
  PCXIdxAttrKind = ^TCXIdxAttrKind;
  TCXIdxAttrKind =  Longint;
  Const
    CXIdxAttr_Unexposed = 0;
    CXIdxAttr_IBAction = 1;
    CXIdxAttr_IBOutlet = 2;
    CXIdxAttr_IBOutletCollection = 3;
;
type
  PCXIdxAttrInfo = ^TCXIdxAttrInfo;
  TCXIdxAttrInfo = record
      kind : TCXIdxAttrKind;
      cursor : TCXCursor;
      loc : TCXIdxLoc;
    end;

  PCXIdxEntityInfo = ^TCXIdxEntityInfo;
  TCXIdxEntityInfo = record
      kind : TCXIdxEntityKind;
      templateKind : TCXIdxEntityCXXTemplateKind;
      lang : TCXIdxEntityLanguage;
      name : Pchar;
      USR : Pchar;
      cursor : TCXCursor;
      attributes : ^PCXIdxAttrInfo;
      numAttributes : dword;
    end;

  PCXIdxContainerInfo = ^TCXIdxContainerInfo;
  TCXIdxContainerInfo = record
      cursor : TCXCursor;
    end;

  PCXIdxIBOutletCollectionAttrInfo = ^TCXIdxIBOutletCollectionAttrInfo;
  TCXIdxIBOutletCollectionAttrInfo = record
      attrInfo : PCXIdxAttrInfo;
      objcClass : PCXIdxEntityInfo;
      classCursor : TCXCursor;
      classLoc : TCXIdxLoc;
    end;

  PCXIdxDeclInfoFlags = ^TCXIdxDeclInfoFlags;
  TCXIdxDeclInfoFlags =  Longint;
  Const
    CXIdxDeclFlag_Skipped = $1;
;
{*
   * Generally same as #semanticContainer but can be different in
   * cases like out-of-line C++ member functions.
    }
{*
   * Whether the declaration exists in code or was created implicitly
   * by the compiler, e.g. implicit Objective-C methods for properties.
    }
type
  PCXIdxDeclInfo = ^TCXIdxDeclInfo;
  TCXIdxDeclInfo = record
      entityInfo : PCXIdxEntityInfo;
      cursor : TCXCursor;
      loc : TCXIdxLoc;
      semanticContainer : PCXIdxContainerInfo;
      lexicalContainer : PCXIdxContainerInfo;
      isRedeclaration : longint;
      isDefinition : longint;
      isContainer : longint;
      declAsContainer : PCXIdxContainerInfo;
      isImplicit : longint;
      attributes : ^PCXIdxAttrInfo;
      numAttributes : dword;
      flags : dword;
    end;

  PCXIdxObjCContainerKind = ^TCXIdxObjCContainerKind;
  TCXIdxObjCContainerKind =  Longint;
  Const
    CXIdxObjCContainer_ForwardRef = 0;
    CXIdxObjCContainer_Interface = 1;
    CXIdxObjCContainer_Implementation = 2;
;
type
  PCXIdxObjCContainerDeclInfo = ^TCXIdxObjCContainerDeclInfo;
  TCXIdxObjCContainerDeclInfo = record
      declInfo : PCXIdxDeclInfo;
      kind : TCXIdxObjCContainerKind;
    end;

  PCXIdxBaseClassInfo = ^TCXIdxBaseClassInfo;
  TCXIdxBaseClassInfo = record
      base : PCXIdxEntityInfo;
      cursor : TCXCursor;
      loc : TCXIdxLoc;
    end;

  PCXIdxObjCProtocolRefInfo = ^TCXIdxObjCProtocolRefInfo;
  TCXIdxObjCProtocolRefInfo = record
      protocol : PCXIdxEntityInfo;
      cursor : TCXCursor;
      loc : TCXIdxLoc;
    end;

  PCXIdxObjCProtocolRefListInfo = ^TCXIdxObjCProtocolRefListInfo;
  TCXIdxObjCProtocolRefListInfo = record
      protocols : ^PCXIdxObjCProtocolRefInfo;
      numProtocols : dword;
    end;

  PCXIdxObjCInterfaceDeclInfo = ^TCXIdxObjCInterfaceDeclInfo;
  TCXIdxObjCInterfaceDeclInfo = record
      containerInfo : PCXIdxObjCContainerDeclInfo;
      superInfo : PCXIdxBaseClassInfo;
      protocols : PCXIdxObjCProtocolRefListInfo;
    end;

  PCXIdxObjCCategoryDeclInfo = ^TCXIdxObjCCategoryDeclInfo;
  TCXIdxObjCCategoryDeclInfo = record
      containerInfo : PCXIdxObjCContainerDeclInfo;
      objcClass : PCXIdxEntityInfo;
      classCursor : TCXCursor;
      classLoc : TCXIdxLoc;
      protocols : PCXIdxObjCProtocolRefListInfo;
    end;

  PCXIdxObjCPropertyDeclInfo = ^TCXIdxObjCPropertyDeclInfo;
  TCXIdxObjCPropertyDeclInfo = record
      declInfo : PCXIdxDeclInfo;
      getter : PCXIdxEntityInfo;
      setter : PCXIdxEntityInfo;
    end;

  PCXIdxCXXClassDeclInfo = ^TCXIdxCXXClassDeclInfo;
  TCXIdxCXXClassDeclInfo = record
      declInfo : PCXIdxDeclInfo;
      bases : ^PCXIdxBaseClassInfo;
      numBases : dword;
    end;
{*
 * Data for IndexerCallbacks#indexEntityReference.
 *
 * This may be deprecated in a future version as this duplicates
 * the \c CXSymbolRole_Implicit bit in \c CXSymbolRole.
  }
{*
   * The entity is referenced directly in user's code.
    }
{*
   * An implicit reference, e.g. a reference of an Objective-C method
   * via the dot syntax.
    }

  PCXIdxEntityRefKind = ^TCXIdxEntityRefKind;
  TCXIdxEntityRefKind =  Longint;
  Const
    CXIdxEntityRef_Direct = 1;
    CXIdxEntityRef_Implicit = 2;
;
{*
 * Roles that are attributed to symbol occurrences.
 *
 * Internal: this currently mirrors low 9 bits of clang::index::SymbolRole with
 * higher bits zeroed. These high bits may be exposed in the future.
  }
type
  PCXSymbolRole = ^TCXSymbolRole;
  TCXSymbolRole =  Longint;
  Const
    CXSymbolRole_None = 0;
    CXSymbolRole_Declaration = 1 shl 0;
    CXSymbolRole_Definition = 1 shl 1;
    CXSymbolRole_Reference = 1 shl 2;
    CXSymbolRole_Read = 1 shl 3;
    CXSymbolRole_Write = 1 shl 4;
    CXSymbolRole_Call = 1 shl 5;
    CXSymbolRole_Dynamic = 1 shl 6;
    CXSymbolRole_AddressOf = 1 shl 7;
    CXSymbolRole_Implicit = 1 shl 8;
;
{*
 * Data for IndexerCallbacks#indexEntityReference.
  }
{*
   * Reference cursor.
    }
{*
   * The entity that gets referenced.
    }
{*
   * Immediate "parent" of the reference. For example:
   *
   * \code
   * Foo *var;
   * \endcode
   *
   * The parent of reference of type 'Foo' is the variable 'var'.
   * For references inside statement bodies of functions/methods,
   * the parentEntity will be the function/method.
    }
{*
   * Lexical container context of the reference.
    }
{*
   * Sets of symbol roles of the reference.
    }
type
  PCXIdxEntityRefInfo = ^TCXIdxEntityRefInfo;
  TCXIdxEntityRefInfo = record
      kind : TCXIdxEntityRefKind;
      cursor : TCXCursor;
      loc : TCXIdxLoc;
      referencedEntity : PCXIdxEntityInfo;
      parentEntity : PCXIdxEntityInfo;
      container : PCXIdxContainerInfo;
      role : TCXSymbolRole;
    end;
{*
 * A group of callbacks used by #clang_indexSourceFile and
 * #clang_indexTranslationUnit.
  }
{*
   * Called periodically to check whether indexing should be aborted.
   * Should return 0 to continue, and non-zero to abort.
    }
{*
   * Called at the end of indexing; passes the complete diagnostic set.
    }
{*
   * Called when a file gets \#included/\#imported.
    }
{*
   * Called when a AST file (PCH or module) gets imported.
   *
   * AST files will not get indexed (there will not be callbacks to index all
   * the entities in an AST file). The recommended action is that, if the AST
   * file is not already indexed, to initiate a new indexing job specific to
   * the AST file.
    }
{*
   * Called at the beginning of indexing a translation unit.
    }
{*
   * Called to index a reference of an entity.
    }

  PIndexerCallbacks = ^TIndexerCallbacks;
  TIndexerCallbacks = record
      abortQuery : function (client_data:TCXClientData; reserved:pointer):longint;cdecl;
      diagnostic : procedure (client_data:TCXClientData; para2:TCXDiagnosticSet; reserved:pointer);cdecl;
      enteredMainFile : function (client_data:TCXClientData; mainFile:TCXFile; reserved:pointer):TCXIdxClientFile;cdecl;
      ppIncludedFile : function (client_data:TCXClientData; para2:PCXIdxIncludedFileInfo):TCXIdxClientFile;cdecl;
      importedASTFile : function (client_data:TCXClientData; para2:PCXIdxImportedASTFileInfo):TCXIdxClientASTFile;cdecl;
      startedTranslationUnit : function (client_data:TCXClientData; reserved:pointer):TCXIdxClientContainer;cdecl;
      indexDeclaration : procedure (client_data:TCXClientData; para2:PCXIdxDeclInfo);cdecl;
      indexEntityReference : procedure (client_data:TCXClientData; para2:PCXIdxEntityRefInfo);cdecl;
    end;

function clang_index_isEntityObjCContainerKind(para1:TCXIdxEntityKind):longint;cdecl;external libgclang;
function clang_index_getObjCContainerDeclInfo(para1:PCXIdxDeclInfo):PCXIdxObjCContainerDeclInfo;cdecl;external libgclang;
function clang_index_getObjCInterfaceDeclInfo(para1:PCXIdxDeclInfo):PCXIdxObjCInterfaceDeclInfo;cdecl;external libgclang;
function clang_index_getObjCCategoryDeclInfo(para1:PCXIdxDeclInfo):PCXIdxObjCCategoryDeclInfo;cdecl;external libgclang;
function clang_index_getObjCProtocolRefListInfo(para1:PCXIdxDeclInfo):PCXIdxObjCProtocolRefListInfo;cdecl;external libgclang;
function clang_index_getObjCPropertyDeclInfo(para1:PCXIdxDeclInfo):PCXIdxObjCPropertyDeclInfo;cdecl;external libgclang;
function clang_index_getIBOutletCollectionAttrInfo(para1:PCXIdxAttrInfo):PCXIdxIBOutletCollectionAttrInfo;cdecl;external libgclang;
function clang_index_getCXXClassDeclInfo(para1:PCXIdxDeclInfo):PCXIdxCXXClassDeclInfo;cdecl;external libgclang;
{*
 * For retrieving a custom CXIdxClientContainer attached to a
 * container.
  }
function clang_index_getClientContainer(para1:PCXIdxContainerInfo):TCXIdxClientContainer;cdecl;external libgclang;
{*
 * For setting a custom CXIdxClientContainer attached to a
 * container.
  }
procedure clang_index_setClientContainer(para1:PCXIdxContainerInfo; para2:TCXIdxClientContainer);cdecl;external libgclang;
{*
 * For retrieving a custom CXIdxClientEntity attached to an entity.
  }
function clang_index_getClientEntity(para1:PCXIdxEntityInfo):TCXIdxClientEntity;cdecl;external libgclang;
{*
 * For setting a custom CXIdxClientEntity attached to an entity.
  }
procedure clang_index_setClientEntity(para1:PCXIdxEntityInfo; para2:TCXIdxClientEntity);cdecl;external libgclang;
{*
 * An indexing action/session, to be applied to one or multiple
 * translation units.
  }
type
  PCXIndexAction = ^TCXIndexAction;
  TCXIndexAction = pointer;
{*
 * An indexing action/session, to be applied to one or multiple
 * translation units.
 *
 * \param CIdx The index object with which the index action will be associated.
  }

function clang_IndexAction_create(CIdx:TCXIndex):TCXIndexAction;cdecl;external libgclang;
{*
 * Destroy the given index action.
 *
 * The index action must not be destroyed until all of the translation units
 * created within that index action have been destroyed.
  }
procedure clang_IndexAction_dispose(para1:TCXIndexAction);cdecl;external libgclang;
{*
   * Used to indicate that no special indexing options are needed.
    }
{*
   * Used to indicate that IndexerCallbacks#indexEntityReference should
   * be invoked for only one reference of an entity per source file that does
   * not also include a declaration/definition of the entity.
    }
{*
   * Function-local symbols should be indexed. If this is not set
   * function-local symbols will be ignored.
    }
{*
   * Implicit function/class template instantiations should be indexed.
   * If this is not set, implicit instantiations will be ignored.
    }
{*
   * Suppress all compiler warnings when parsing for indexing.
    }
{*
   * Skip a function/method body that was already parsed during an
   * indexing session associated with a \c CXIndexAction object.
   * Bodies in system headers are always skipped.
    }
type
  PCXIndexOptFlags = ^TCXIndexOptFlags;
  TCXIndexOptFlags =  Longint;
  Const
    CXIndexOpt_None = $0;
    CXIndexOpt_SuppressRedundantRefs = $1;
    CXIndexOpt_IndexFunctionLocalSymbols = $2;
    CXIndexOpt_IndexImplicitTemplateInstantiations = $4;
    CXIndexOpt_SuppressWarnings = $8;
    CXIndexOpt_SkipParsedBodiesInSession = $10;
;
{*
 * Index the given source file and the translation unit corresponding
 * to that file via callbacks implemented through #IndexerCallbacks.
 *
 * \param client_data pointer data supplied by the client, which will
 * be passed to the invoked callbacks.
 *
 * \param index_callbacks Pointer to indexing callbacks that the client
 * implements.
 *
 * \param index_callbacks_size Size of #IndexerCallbacks structure that gets
 * passed in index_callbacks.
 *
 * \param index_options A bitmask of options that affects how indexing is
 * performed. This should be a bitwise OR of the CXIndexOpt_XXX flags.
 *
 * \param[out] out_TU pointer to store a \c CXTranslationUnit that can be
 * reused after indexing is finished. Set to \c NULL if you do not require it.
 *
 * \returns 0 on success or if there were errors from which the compiler could
 * recover.  If there is a failure from which there is no recovery, returns
 * a non-zero \c CXErrorCode.
 *
 * The rest of the parameters are the same as #clang_parseTranslationUnit.
  }

function clang_indexSourceFile(para1:TCXIndexAction; client_data:TCXClientData; index_callbacks:PIndexerCallbacks; index_callbacks_size:dword; index_options:dword; 
           source_filename:Pchar; command_line_args:PPchar; num_command_line_args:longint; unsaved_files:PCXUnsavedFile; num_unsaved_files:dword; 
           out_TU:PCXTranslationUnit; TU_options:dword):longint;cdecl;external libgclang;
{*
 * Same as clang_indexSourceFile but requires a full command line
 * for \c command_line_args including argv[0]. This is useful if the standard
 * library paths are relative to the binary.
  }
function clang_indexSourceFileFullArgv(para1:TCXIndexAction; client_data:TCXClientData; index_callbacks:PIndexerCallbacks; index_callbacks_size:dword; index_options:dword; 
           source_filename:Pchar; command_line_args:PPchar; num_command_line_args:longint; unsaved_files:PCXUnsavedFile; num_unsaved_files:dword; 
           out_TU:PCXTranslationUnit; TU_options:dword):longint;cdecl;external libgclang;
{*
 * Index the given translation unit via callbacks implemented through
 * #IndexerCallbacks.
 *
 * The order of callback invocations is not guaranteed to be the same as
 * when indexing a source file. The high level order will be:
 *
 *   -Preprocessor callbacks invocations
 *   -Declaration/reference callbacks invocations
 *   -Diagnostic callback invocations
 *
 * The parameters are the same as #clang_indexSourceFile.
 *
 * \returns If there is a failure from which there is no recovery, returns
 * non-zero, otherwise returns 0.
  }
function clang_indexTranslationUnit(para1:TCXIndexAction; client_data:TCXClientData; index_callbacks:PIndexerCallbacks; index_callbacks_size:dword; index_options:dword; 
           para6:TCXTranslationUnit):longint;cdecl;external libgclang;
{*
 * Retrieve the CXIdxFile, file, line, column, and offset represented by
 * the given CXIdxLoc.
 *
 * If the location refers into a macro expansion, retrieves the
 * location of the macro expansion and if it refers into a macro argument
 * retrieves the location of the argument.
  }
procedure clang_indexLoc_getFileLocation(loc:TCXIdxLoc; indexFile:PCXIdxClientFile; file:PCXFile; line:Pdword; column:Pdword; 
            offset:Pdword);cdecl;external libgclang;
{*
 * Retrieve the CXSourceLocation represented by the given CXIdxLoc.
  }
function clang_indexLoc_getCXSourceLocation(loc:TCXIdxLoc):TCXSourceLocation;cdecl;external libgclang;
{*
 * Visitor invoked for each field found by a traversal.
 *
 * This visitor function will be invoked for each field found by
 * \c clang_Type_visitFields. Its first argument is the cursor being
 * visited, its second argument is the client data provided to
 * \c clang_Type_visitFields.
 *
 * The visitor should return one of the \c CXVisitorResult values
 * to direct \c clang_Type_visitFields.
  }
type

  TCXFieldVisitor = function (C:TCXCursor; client_data:TCXClientData):TCXVisitorResult;cdecl;
{*
 * Visit the fields of a particular type.
 *
 * This function visits all the direct fields of the given cursor,
 * invoking the given \p visitor function with the cursors of each
 * visited field. The traversal may be ended prematurely, if
 * the visitor returns \c CXFieldVisit_Break.
 *
 * \param T the record type whose field may be visited.
 *
 * \param visitor the visitor function that will be invoked for each
 * field of \p T.
 *
 * \param client_data pointer data supplied by the client, which will
 * be passed to the visitor each time it is invoked.
 *
 * \returns a non-zero value if the traversal was terminated
 * prematurely by the visitor returning \c CXFieldVisit_Break.
  }

function clang_Type_visitFields(T:TCXType; visitor:TCXFieldVisitor; client_data:TCXClientData):dword;cdecl;external libgclang;
{*
 * Visit the base classes of a type.
 *
 * This function visits all the direct base classes of a the given cursor,
 * invoking the given \p visitor function with the cursors of each
 * visited base. The traversal may be ended prematurely, if
 * the visitor returns \c CXFieldVisit_Break.
 *
 * \param T the record type whose field may be visited.
 *
 * \param visitor the visitor function that will be invoked for each
 * field of \p T.
 *
 * \param client_data pointer data supplied by the client, which will
 * be passed to the visitor each time it is invoked.
 *
 * \returns a non-zero value if the traversal was terminated
 * prematurely by the visitor returning \c CXFieldVisit_Break.
  }
function clang_visitCXXBaseClasses(T:TCXType; visitor:TCXFieldVisitor; client_data:TCXClientData):dword;cdecl;external libgclang;
{*
 * Describes the kind of binary operators.
  }
{* This value describes cursors which are not binary operators.  }
{* C++ Pointer - to - member operator.  }
{* C++ Pointer - to - member operator.  }
{* Multiplication operator.  }
{* Division operator.  }
{* Remainder operator.  }
{* Addition operator.  }
{* Subtraction operator.  }
{* Bitwise shift left operator.  }
{* Bitwise shift right operator.  }
{* C++ three-way comparison (spaceship) operator.  }
{* Less than operator.  }
{* Greater than operator.  }
{* Less or equal operator.  }
{* Greater or equal operator.  }
{* Equal operator.  }
{* Not equal operator.  }
{* Bitwise AND operator.  }
{* Bitwise XOR operator.  }
{* Bitwise OR operator.  }
{* Logical AND operator.  }
{* Logical OR operator.  }
{* Assignment operator.  }
{* Multiplication assignment operator.  }
{* Division assignment operator.  }
{* Remainder assignment operator.  }
{* Addition assignment operator.  }
{* Subtraction assignment operator.  }
{* Bitwise shift left assignment operator.  }
{* Bitwise shift right assignment operator.  }
{* Bitwise AND assignment operator.  }
{* Bitwise XOR assignment operator.  }
{* Bitwise OR assignment operator.  }
{* Comma operator.  }
type
  TCXBinaryOperatorKind =  Longint;
  Const
    CXBinaryOperator_Invalid = 0;
    CXBinaryOperator_PtrMemD = 1;
    CXBinaryOperator_PtrMemI = 2;
    CXBinaryOperator_Mul = 3;
    CXBinaryOperator_Div = 4;
    CXBinaryOperator_Rem = 5;
    CXBinaryOperator_Add = 6;
    CXBinaryOperator_Sub = 7;
    CXBinaryOperator_Shl = 8;
    CXBinaryOperator_Shr = 9;
    CXBinaryOperator_Cmp = 10;
    CXBinaryOperator_LT = 11;
    CXBinaryOperator_GT = 12;
    CXBinaryOperator_LE = 13;
    CXBinaryOperator_GE = 14;
    CXBinaryOperator_EQ = 15;
    CXBinaryOperator_NE = 16;
    CXBinaryOperator_And = 17;
    CXBinaryOperator_Xor = 18;
    CXBinaryOperator_Or = 19;
    CXBinaryOperator_LAnd = 20;
    CXBinaryOperator_LOr = 21;
    CXBinaryOperator_Assign = 22;
    CXBinaryOperator_MulAssign = 23;
    CXBinaryOperator_DivAssign = 24;
    CXBinaryOperator_RemAssign = 25;
    CXBinaryOperator_AddAssign = 26;
    CXBinaryOperator_SubAssign = 27;
    CXBinaryOperator_ShlAssign = 28;
    CXBinaryOperator_ShrAssign = 29;
    CXBinaryOperator_AndAssign = 30;
    CXBinaryOperator_XorAssign = 31;
    CXBinaryOperator_OrAssign = 32;
    CXBinaryOperator_Comma = 33;

{*
 * Retrieve the spelling of a given CXBinaryOperatorKind.
  }

function clang_getBinaryOperatorKindSpelling(kind:TCXBinaryOperatorKind):TCXString;cdecl;external libgclang;
{*
 * Retrieve the binary operator kind of this cursor.
 *
 * If this cursor is not a binary operator then returns Invalid.
  }
function clang_getCursorBinaryOperatorKind(cursor:TCXCursor):TCXBinaryOperatorKind;cdecl;external libgclang;
{*
 * Describes the kind of unary operators.
  }
{* This value describes cursors which are not unary operators.  }
{* Postfix increment operator.  }
{* Postfix decrement operator.  }
{* Prefix increment operator.  }
{* Prefix decrement operator.  }
{* Address of operator.  }
{* Dereference operator.  }
{* Plus operator.  }
{* Minus operator.  }
{* Not operator.  }
{* LNot operator.  }
{* "__real expr" operator.  }
{* "__imag expr" operator.  }
{* __extension__ marker operator.  }
{* C++ co_await operator.  }
type
  TCXUnaryOperatorKind =  Longint;
  Const
    CXUnaryOperator_Invalid = 0;
    CXUnaryOperator_PostInc = 1;
    CXUnaryOperator_PostDec = 2;
    CXUnaryOperator_PreInc = 3;
    CXUnaryOperator_PreDec = 4;
    CXUnaryOperator_AddrOf = 5;
    CXUnaryOperator_Deref = 6;
    CXUnaryOperator_Plus = 7;
    CXUnaryOperator_Minus = 8;
    CXUnaryOperator_Not = 9;
    CXUnaryOperator_LNot = 10;
    CXUnaryOperator_Real = 11;
    CXUnaryOperator_Imag = 12;
    CXUnaryOperator_Extension = 13;
    CXUnaryOperator_Coawait = 14;

{*
 * Retrieve the spelling of a given CXUnaryOperatorKind.
  }

function clang_getUnaryOperatorKindSpelling(kind:TCXUnaryOperatorKind):TCXString;cdecl;external libgclang;
{*
 * Retrieve the unary operator kind of this cursor.
 *
 * If this cursor is not a unary operator then returns Invalid.
  }
function clang_getCursorUnaryOperatorKind(cursor:TCXCursor):TCXUnaryOperatorKind;cdecl;external libgclang;
{*
 * @
  }
{*
 * @
  }
{$endif}

// === Konventiert am: 4-10-26 17:29:43 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CINDEX_VERSION_ENCODE(major,minor : longint) : longint;
begin
  CINDEX_VERSION_ENCODE:=(major*10000)+(minor*1);
end;

function ExcludeDeclarationsFromPCH(var a : CXIndexOptions) : dword;
begin
  ExcludeDeclarationsFromPCH:=(a.flag0 and bm_CXIndexOptions_ExcludeDeclarationsFromPCH) shr bp_CXIndexOptions_ExcludeDeclarationsFromPCH;
end;

procedure set_ExcludeDeclarationsFromPCH(var a : CXIndexOptions; __ExcludeDeclarationsFromPCH : dword);
begin
  a.flag0:=a.flag0 or ((__ExcludeDeclarationsFromPCH shl bp_CXIndexOptions_ExcludeDeclarationsFromPCH) and bm_CXIndexOptions_ExcludeDeclarationsFromPCH);
end;

function DisplayDiagnostics(var a : CXIndexOptions) : dword;
begin
  DisplayDiagnostics:=(a.flag0 and bm_CXIndexOptions_DisplayDiagnostics) shr bp_CXIndexOptions_DisplayDiagnostics;
end;

procedure set_DisplayDiagnostics(var a : CXIndexOptions; __DisplayDiagnostics : dword);
begin
  a.flag0:=a.flag0 or ((__DisplayDiagnostics shl bp_CXIndexOptions_DisplayDiagnostics) and bm_CXIndexOptions_DisplayDiagnostics);
end;

function StorePreamblesInMemory(var a : CXIndexOptions) : dword;
begin
  StorePreamblesInMemory:=(a.flag0 and bm_CXIndexOptions_StorePreamblesInMemory) shr bp_CXIndexOptions_StorePreamblesInMemory;
end;

procedure set_StorePreamblesInMemory(var a : CXIndexOptions; __StorePreamblesInMemory : dword);
begin
  a.flag0:=a.flag0 or ((__StorePreamblesInMemory shl bp_CXIndexOptions_StorePreamblesInMemory) and bm_CXIndexOptions_StorePreamblesInMemory);
end;

function xxxxxx(var a : CXIndexOptions) : dword;
begin
  xxxxxx:=(a.flag0 and bm_CXIndexOptions_xxxxxx) shr bp_CXIndexOptions_xxxxxx;
end;

procedure set_xxxxxx(var a : CXIndexOptions; __xxxxxx : dword);
begin
  a.flag0:=a.flag0 or ((__xxxxxx shl bp_CXIndexOptions_xxxxxx) and bm_CXIndexOptions_xxxxxx);
end;


end.
