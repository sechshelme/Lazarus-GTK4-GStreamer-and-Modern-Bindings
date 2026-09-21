unit DebugInfo;

interface

uses
  fp_llvm, Types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PLLVMDIFlags = ^TLLVMDIFlags;
  TLLVMDIFlags = longint;
const
  LLVMDIFlagZero = 0;
  LLVMDIFlagPrivate = 1;
  LLVMDIFlagProtected = 2;
  LLVMDIFlagPublic = 3;
  LLVMDIFlagFwdDecl = 1 shl 2;
  LLVMDIFlagAppleBlock = 1 shl 3;
  LLVMDIFlagReservedBit4 = 1 shl 4;
  LLVMDIFlagVirtual = 1 shl 5;
  LLVMDIFlagArtificial = 1 shl 6;
  LLVMDIFlagExplicit = 1 shl 7;
  LLVMDIFlagPrototyped = 1 shl 8;
  LLVMDIFlagObjcClassComplete = 1 shl 9;
  LLVMDIFlagObjectPointer = 1 shl 10;
  LLVMDIFlagVector = 1 shl 11;
  LLVMDIFlagStaticMember = 1 shl 12;
  LLVMDIFlagLValueReference = 1 shl 13;
  LLVMDIFlagRValueReference = 1 shl 14;
  LLVMDIFlagReserved = 1 shl 15;
  LLVMDIFlagSingleInheritance = 1 shl 16;
  LLVMDIFlagMultipleInheritance = 2 shl 16;
  LLVMDIFlagVirtualInheritance = 3 shl 16;
  LLVMDIFlagIntroducedVirtual = 1 shl 18;
  LLVMDIFlagBitField = 1 shl 19;
  LLVMDIFlagNoReturn = 1 shl 20;
  LLVMDIFlagTypePassByValue = 1 shl 22;
  LLVMDIFlagTypePassByReference = 1 shl 23;
  LLVMDIFlagEnumClass = 1 shl 24;
  LLVMDIFlagFixedEnum = LLVMDIFlagEnumClass;
  LLVMDIFlagThunk = 1 shl 25;
  LLVMDIFlagNonTrivial = 1 shl 26;
  LLVMDIFlagBigEndian = 1 shl 27;
  LLVMDIFlagLittleEndian = 1 shl 28;
  LLVMDIFlagIndirectVirtualBase = (1 shl 2) or (1 shl 5);
  LLVMDIFlagAccessibility = (LLVMDIFlagPrivate or LLVMDIFlagProtected) or LLVMDIFlagPublic;
  LLVMDIFlagPtrToMemberRep = (LLVMDIFlagSingleInheritance or LLVMDIFlagMultipleInheritance) or LLVMDIFlagVirtualInheritance;

type
  PLLVMDWARFSourceLanguage = ^TLLVMDWARFSourceLanguage;
  TLLVMDWARFSourceLanguage = longint;
const
  LLVMDWARFSourceLanguageC89 = 0;
  LLVMDWARFSourceLanguageC = 1;
  LLVMDWARFSourceLanguageAda83 = 2;
  LLVMDWARFSourceLanguageC_plus_plus = 3;
  LLVMDWARFSourceLanguageCobol74 = 4;
  LLVMDWARFSourceLanguageCobol85 = 5;
  LLVMDWARFSourceLanguageFortran77 = 6;
  LLVMDWARFSourceLanguageFortran90 = 7;
  LLVMDWARFSourceLanguagePascal83 = 8;
  LLVMDWARFSourceLanguageModula2 = 9;
  LLVMDWARFSourceLanguageJava = 10;
  LLVMDWARFSourceLanguageC99 = 11;
  LLVMDWARFSourceLanguageAda95 = 12;
  LLVMDWARFSourceLanguageFortran95 = 13;
  LLVMDWARFSourceLanguagePLI = 14;
  LLVMDWARFSourceLanguageObjC = 15;
  LLVMDWARFSourceLanguageObjC_plus_plus = 16;
  LLVMDWARFSourceLanguageUPC = 17;
  LLVMDWARFSourceLanguageD = 18;
  LLVMDWARFSourceLanguagePython = 19;
  LLVMDWARFSourceLanguageOpenCL = 20;
  LLVMDWARFSourceLanguageGo = 21;
  LLVMDWARFSourceLanguageModula3 = 22;
  LLVMDWARFSourceLanguageHaskell = 23;
  LLVMDWARFSourceLanguageC_plus_plus_03 = 24;
  LLVMDWARFSourceLanguageC_plus_plus_11 = 25;
  LLVMDWARFSourceLanguageOCaml = 26;
  LLVMDWARFSourceLanguageRust = 27;
  LLVMDWARFSourceLanguageC11 = 28;
  LLVMDWARFSourceLanguageSwift = 29;
  LLVMDWARFSourceLanguageJulia = 30;
  LLVMDWARFSourceLanguageDylan = 31;
  LLVMDWARFSourceLanguageC_plus_plus_14 = 32;
  LLVMDWARFSourceLanguageFortran03 = 33;
  LLVMDWARFSourceLanguageFortran08 = 34;
  LLVMDWARFSourceLanguageRenderScript = 35;
  LLVMDWARFSourceLanguageBLISS = 36;
  LLVMDWARFSourceLanguageKotlin = 37;
  LLVMDWARFSourceLanguageZig = 38;
  LLVMDWARFSourceLanguageCrystal = 39;
  LLVMDWARFSourceLanguageC_plus_plus_17 = 40;
  LLVMDWARFSourceLanguageC_plus_plus_20 = 41;
  LLVMDWARFSourceLanguageC17 = 42;
  LLVMDWARFSourceLanguageFortran18 = 43;
  LLVMDWARFSourceLanguageAda2005 = 44;
  LLVMDWARFSourceLanguageAda2012 = 45;
  LLVMDWARFSourceLanguageHIP = 46;
  LLVMDWARFSourceLanguageAssembly = 47;
  LLVMDWARFSourceLanguageC_sharp = 48;
  LLVMDWARFSourceLanguageMojo = 49;
  LLVMDWARFSourceLanguageGLSL = 50;
  LLVMDWARFSourceLanguageGLSL_ES = 51;
  LLVMDWARFSourceLanguageHLSL = 52;
  LLVMDWARFSourceLanguageOpenCL_CPP = 53;
  LLVMDWARFSourceLanguageCPP_for_OpenCL = 54;
  LLVMDWARFSourceLanguageSYCL = 55;
  LLVMDWARFSourceLanguageRuby = 56;
  LLVMDWARFSourceLanguageMove = 57;
  LLVMDWARFSourceLanguageHylo = 58;
  LLVMDWARFSourceLanguageMetal = 59;
  LLVMDWARFSourceLanguageMips_Assembler = 60;
  LLVMDWARFSourceLanguageGOOGLE_RenderScript = 61;
  LLVMDWARFSourceLanguageBORLAND_Delphi = 62;

type
  PLLVMDWARFEmissionKind = ^TLLVMDWARFEmissionKind;
  TLLVMDWARFEmissionKind = longint;
const
  LLVMDWARFEmissionNone = 0;
  LLVMDWARFEmissionFull = 1;
  LLVMDWARFEmissionLineTablesOnly = 2;

const
  LLVMMDStringMetadataKind = 0;
  LLVMConstantAsMetadataMetadataKind = 1;
  LLVMLocalAsMetadataMetadataKind = 2;
  LLVMDistinctMDOperandPlaceholderMetadataKind = 3;
  LLVMMDTupleMetadataKind = 4;
  LLVMDILocationMetadataKind = 5;
  LLVMDIExpressionMetadataKind = 6;
  LLVMDIGlobalVariableExpressionMetadataKind = 7;
  LLVMGenericDINodeMetadataKind = 8;
  LLVMDISubrangeMetadataKind = 9;
  LLVMDIEnumeratorMetadataKind = 10;
  LLVMDIBasicTypeMetadataKind = 11;
  LLVMDIDerivedTypeMetadataKind = 12;
  LLVMDICompositeTypeMetadataKind = 13;
  LLVMDISubroutineTypeMetadataKind = 14;
  LLVMDIFileMetadataKind = 15;
  LLVMDICompileUnitMetadataKind = 16;
  LLVMDISubprogramMetadataKind = 17;
  LLVMDILexicalBlockMetadataKind = 18;
  LLVMDILexicalBlockFileMetadataKind = 19;
  LLVMDINamespaceMetadataKind = 20;
  LLVMDIModuleMetadataKind = 21;
  LLVMDITemplateTypeParameterMetadataKind = 22;
  LLVMDITemplateValueParameterMetadataKind = 23;
  LLVMDIGlobalVariableMetadataKind = 24;
  LLVMDILocalVariableMetadataKind = 25;
  LLVMDILabelMetadataKind = 26;
  LLVMDIObjCPropertyMetadataKind = 27;
  LLVMDIImportedEntityMetadataKind = 28;
  LLVMDIMacroMetadataKind = 29;
  LLVMDIMacroFileMetadataKind = 30;
  LLVMDICommonBlockMetadataKind = 31;
  LLVMDIStringTypeMetadataKind = 32;
  LLVMDIGenericSubrangeMetadataKind = 33;
  LLVMDIArgListMetadataKind = 34;
  LLVMDIAssignIDMetadataKind = 35;

type
  PLLVMMetadataKind = ^TLLVMMetadataKind;
  TLLVMMetadataKind = dword;

  PLLVMDWARFTypeEncoding = ^TLLVMDWARFTypeEncoding;
  TLLVMDWARFTypeEncoding = dword;

type
  PLLVMDWARFMacinfoRecordType = ^TLLVMDWARFMacinfoRecordType;
  TLLVMDWARFMacinfoRecordType = longint;
const
  LLVMDWARFMacinfoRecordTypeDefine = $01;
  LLVMDWARFMacinfoRecordTypeMacro = $02;
  LLVMDWARFMacinfoRecordTypeStartFile = $03;
  LLVMDWARFMacinfoRecordTypeEndFile = $04;
  LLVMDWARFMacinfoRecordTypeVendorExt = $ff;

function LLVMDebugMetadataVersion: dword; cdecl; external libllvm;
function LLVMGetModuleDebugMetadataVersion(Module: TLLVMModuleRef): dword; cdecl; external libllvm;
function LLVMStripModuleDebugInfo(Module: TLLVMModuleRef): TLLVMBool; cdecl; external libllvm;
function LLVMCreateDIBuilderDisallowUnresolved(M: TLLVMModuleRef): TLLVMDIBuilderRef; cdecl; external libllvm;
function LLVMCreateDIBuilder(M: TLLVMModuleRef): TLLVMDIBuilderRef; cdecl; external libllvm;
procedure LLVMDisposeDIBuilder(Builder: TLLVMDIBuilderRef); cdecl; external libllvm;
procedure LLVMDIBuilderFinalize(Builder: TLLVMDIBuilderRef); cdecl; external libllvm;
procedure LLVMDIBuilderFinalizeSubprogram(Builder: TLLVMDIBuilderRef; Subprogram: TLLVMMetadataRef); cdecl; external libllvm;
function LLVMDIBuilderCreateCompileUnit(Builder: TLLVMDIBuilderRef; Lang: TLLVMDWARFSourceLanguage; FileRef: TLLVMMetadataRef; Producer: pchar; ProducerLen: Tsize_t;
  isOptimized: TLLVMBool; Flags: pchar; FlagsLen: Tsize_t; RuntimeVer: dword; SplitName: pchar;
  SplitNameLen: Tsize_t; Kind: TLLVMDWARFEmissionKind; DWOId: dword; SplitDebugInlining: TLLVMBool; DebugInfoForProfiling: TLLVMBool;
  SysRoot: pchar; SysRootLen: Tsize_t; SDK: pchar; SDKLen: Tsize_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateFile(Builder: TLLVMDIBuilderRef; Filename: pchar; FilenameLen: Tsize_t; Directory: pchar; DirectoryLen: Tsize_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateModule(Builder: TLLVMDIBuilderRef; ParentScope: TLLVMMetadataRef; Name: pchar; NameLen: Tsize_t; ConfigMacros: pchar;
  ConfigMacrosLen: Tsize_t; IncludePath: pchar; IncludePathLen: Tsize_t; APINotesFile_: pchar; APINotesFileLen: Tsize_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateNameSpace(Builder: TLLVMDIBuilderRef; ParentScope: TLLVMMetadataRef; Name: pchar; NameLen: Tsize_t; ExportSymbols: TLLVMBool): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateFunction(Builder: TLLVMDIBuilderRef; Scope: TLLVMMetadataRef; Name: pchar; NameLen: Tsize_t; LinkageName: pchar;
  LinkageNameLen: Tsize_t; File_: TLLVMMetadataRef; LineNo: dword; Ty: TLLVMMetadataRef; IsLocalToUnit: TLLVMBool;
  IsDefinition: TLLVMBool; ScopeLine: dword; Flags: TLLVMDIFlags; IsOptimized: TLLVMBool): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateLexicalBlock(Builder: TLLVMDIBuilderRef; Scope: TLLVMMetadataRef; File_: TLLVMMetadataRef; Line: dword; Column: dword): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateLexicalBlockFile(Builder: TLLVMDIBuilderRef; Scope: TLLVMMetadataRef; File_: TLLVMMetadataRef; Discriminator: dword): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateImportedModuleFromNamespace(Builder: TLLVMDIBuilderRef; Scope: TLLVMMetadataRef; NS: TLLVMMetadataRef; File_: TLLVMMetadataRef; Line: dword): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateImportedModuleFromAlias(Builder: TLLVMDIBuilderRef; Scope: TLLVMMetadataRef; ImportedEntity: TLLVMMetadataRef; File_: TLLVMMetadataRef; Line: dword;
  Elements: PLLVMMetadataRef; NumElements: dword): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateImportedModuleFromModule(Builder: TLLVMDIBuilderRef; Scope: TLLVMMetadataRef; M: TLLVMMetadataRef; File_: TLLVMMetadataRef; Line: dword;
  Elements: PLLVMMetadataRef; NumElements: dword): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateImportedDeclaration(Builder: TLLVMDIBuilderRef; Scope: TLLVMMetadataRef; Decl: TLLVMMetadataRef; File_: TLLVMMetadataRef; Line: dword;
  Name: pchar; NameLen: Tsize_t; Elements: PLLVMMetadataRef; NumElements: dword): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateDebugLocation(Ctx: TLLVMContextRef; Line: dword; Column: dword; Scope: TLLVMMetadataRef; InlinedAt: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDILocationGetLine(Location: TLLVMMetadataRef): dword; cdecl; external libllvm;
function LLVMDILocationGetColumn(Location: TLLVMMetadataRef): dword; cdecl; external libllvm;
function LLVMDILocationGetScope(Location: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDILocationGetInlinedAt(Location: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIScopeGetFile(Scope: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIFileGetDirectory(File_: TLLVMMetadataRef; Len: Pdword): pchar; cdecl; external libllvm;
function LLVMDIFileGetFilename(File_: TLLVMMetadataRef; Len: Pdword): pchar; cdecl; external libllvm;
function LLVMDIFileGetSource(File_: TLLVMMetadataRef; Len: Pdword): pchar; cdecl; external libllvm;
function LLVMDIBuilderGetOrCreateTypeArray(Builder: TLLVMDIBuilderRef; Data: PLLVMMetadataRef; NumElements: Tsize_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateSubroutineType(Builder: TLLVMDIBuilderRef; File_: TLLVMMetadataRef; ParameterTypes: PLLVMMetadataRef; NumParameterTypes: dword; Flags: TLLVMDIFlags): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateMacro(Builder: TLLVMDIBuilderRef; ParentMacroFile_: TLLVMMetadataRef; Line: dword; RecordType: TLLVMDWARFMacinfoRecordType; Name: pchar;
  NameLen: Tsize_t; Value: pchar; ValueLen: Tsize_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateTempMacroFile(Builder: TLLVMDIBuilderRef; ParentMacroFile_: TLLVMMetadataRef; Line: dword; File_: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateEnumerator(Builder: TLLVMDIBuilderRef; Name: pchar; NameLen: Tsize_t; Value: Tint64_t; IsUnsigned: TLLVMBool): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateEnumerationType(Builder: TLLVMDIBuilderRef; Scope: TLLVMMetadataRef; Name: pchar; NameLen: Tsize_t; File_: TLLVMMetadataRef;
  LineNumber: dword; SizeInBits: Tuint64_t; AlignInBits: Tuint32_t; Elements: PLLVMMetadataRef; NumElements: dword;
  ClassTy: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateUnionType(Builder: TLLVMDIBuilderRef; Scope: TLLVMMetadataRef; Name: pchar; NameLen: Tsize_t; File_: TLLVMMetadataRef;
  LineNumber: dword; SizeInBits: Tuint64_t; AlignInBits: Tuint32_t; Flags: TLLVMDIFlags; Elements: PLLVMMetadataRef;
  NumElements: dword; RunTimeLang: dword; UniqueId: pchar; UniqueIdLen: Tsize_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateArrayType(Builder: TLLVMDIBuilderRef; Size: Tuint64_t; AlignInBits: Tuint32_t; Ty: TLLVMMetadataRef; Subscripts: PLLVMMetadataRef;
  NumSubscripts: dword): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateVectorType(Builder: TLLVMDIBuilderRef; Size: Tuint64_t; AlignInBits: Tuint32_t; Ty: TLLVMMetadataRef; Subscripts: PLLVMMetadataRef;
  NumSubscripts: dword): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateUnspecifiedType(Builder: TLLVMDIBuilderRef; Name: pchar; NameLen: Tsize_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateBasicType(Builder: TLLVMDIBuilderRef; Name: pchar; NameLen: Tsize_t; SizeInBits: Tuint64_t; Encoding: TLLVMDWARFTypeEncoding;
  Flags: TLLVMDIFlags): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreatePointerType(Builder: TLLVMDIBuilderRef; PointeeTy: TLLVMMetadataRef; SizeInBits: Tuint64_t; AlignInBits: Tuint32_t; AddressSpace: dword;
  Name: pchar; NameLen: Tsize_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateStructType(Builder: TLLVMDIBuilderRef; Scope: TLLVMMetadataRef; Name: pchar; NameLen: Tsize_t; File_: TLLVMMetadataRef;
  LineNumber: dword; SizeInBits: Tuint64_t; AlignInBits: Tuint32_t; Flags: TLLVMDIFlags; DerivedFrom: TLLVMMetadataRef;
  Elements: PLLVMMetadataRef; NumElements: dword; RunTimeLang: dword; VTableHolder: TLLVMMetadataRef; UniqueId: pchar;
  UniqueIdLen: Tsize_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateMemberType(Builder: TLLVMDIBuilderRef; Scope: TLLVMMetadataRef; Name: pchar; NameLen: Tsize_t; File_: TLLVMMetadataRef;
  LineNo: dword; SizeInBits: Tuint64_t; AlignInBits: Tuint32_t; OffsetInBits: Tuint64_t; Flags: TLLVMDIFlags;
  Ty: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateStaticMemberType(Builder: TLLVMDIBuilderRef; Scope: TLLVMMetadataRef; Name: pchar; NameLen: Tsize_t; File_: TLLVMMetadataRef;
  LineNumber: dword; _Type: TLLVMMetadataRef; Flags: TLLVMDIFlags; ConstantVal: TLLVMValueRef; AlignInBits: Tuint32_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateMemberPointerType(Builder: TLLVMDIBuilderRef; PointeeType: TLLVMMetadataRef; ClassType: TLLVMMetadataRef; SizeInBits: Tuint64_t; AlignInBits: Tuint32_t;
  Flags: TLLVMDIFlags): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateObjCIVar(Builder: TLLVMDIBuilderRef; Name: pchar; NameLen: Tsize_t; File_: TLLVMMetadataRef; LineNo: dword;
  SizeInBits: Tuint64_t; AlignInBits: Tuint32_t; OffsetInBits: Tuint64_t; Flags: TLLVMDIFlags; Ty: TLLVMMetadataRef;
  PropertyNode: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateObjCProperty(Builder: TLLVMDIBuilderRef; Name: pchar; NameLen: Tsize_t; File_: TLLVMMetadataRef; LineNo: dword;
  GetterName: pchar; GetterNameLen: Tsize_t; SetterName: pchar; SetterNameLen: Tsize_t; PropertyAttributes: dword;
  Ty: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateObjectPointerType(Builder: TLLVMDIBuilderRef; _Type: TLLVMMetadataRef; Implicit: TLLVMBool): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateQualifiedType(Builder: TLLVMDIBuilderRef; Tag: dword; _Type: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateReferenceType(Builder: TLLVMDIBuilderRef; Tag: dword; _Type: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateNullPtrType(Builder: TLLVMDIBuilderRef): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateTypedef(Builder: TLLVMDIBuilderRef; _Type: TLLVMMetadataRef; Name: pchar; NameLen: Tsize_t; File_: TLLVMMetadataRef;
  LineNo: dword; Scope: TLLVMMetadataRef; AlignInBits: Tuint32_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateInheritance(Builder: TLLVMDIBuilderRef; Ty: TLLVMMetadataRef; BaseTy: TLLVMMetadataRef; BaseOffset: Tuint64_t; VBPtrOffset: Tuint32_t;
  Flags: TLLVMDIFlags): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateForwardDecl(Builder: TLLVMDIBuilderRef; Tag: dword; Name: pchar; NameLen: Tsize_t; Scope: TLLVMMetadataRef;
  File_: TLLVMMetadataRef; Line: dword; RuntimeLang: dword; SizeInBits: Tuint64_t; AlignInBits: Tuint32_t;
  UniqueIdentifier: pchar; UniqueIdentifierLen: Tsize_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateReplaceableCompositeType(Builder: TLLVMDIBuilderRef; Tag: dword; Name: pchar; NameLen: Tsize_t; Scope: TLLVMMetadataRef;
  File_: TLLVMMetadataRef; Line: dword; RuntimeLang: dword; SizeInBits: Tuint64_t; AlignInBits: Tuint32_t;
  Flags: TLLVMDIFlags; UniqueIdentifier: pchar; UniqueIdentifierLen: Tsize_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateBitFieldMemberType(Builder: TLLVMDIBuilderRef; Scope: TLLVMMetadataRef; Name: pchar; NameLen: Tsize_t; File_: TLLVMMetadataRef;
  LineNumber: dword; SizeInBits: Tuint64_t; OffsetInBits: Tuint64_t; StorageOffsetInBits: Tuint64_t; Flags: TLLVMDIFlags;
  _Type: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateClassType(Builder: TLLVMDIBuilderRef; Scope: TLLVMMetadataRef; Name: pchar; NameLen: Tsize_t; File_: TLLVMMetadataRef;
  LineNumber: dword; SizeInBits: Tuint64_t; AlignInBits: Tuint32_t; OffsetInBits: Tuint64_t; Flags: TLLVMDIFlags;
  DerivedFrom: TLLVMMetadataRef; Elements: PLLVMMetadataRef; NumElements: dword; VTableHolder: TLLVMMetadataRef; TemplateParamsNode: TLLVMMetadataRef;
  UniqueIdentifier: pchar; UniqueIdentifierLen: Tsize_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateArtificialType(Builder: TLLVMDIBuilderRef; _Type: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDITypeGetName(DType: TLLVMMetadataRef; Length: Psize_t): pchar; cdecl; external libllvm;
function LLVMDITypeGetSizeInBits(DType: TLLVMMetadataRef): Tuint64_t; cdecl; external libllvm;
function LLVMDITypeGetOffsetInBits(DType: TLLVMMetadataRef): Tuint64_t; cdecl; external libllvm;
function LLVMDITypeGetAlignInBits(DType: TLLVMMetadataRef): Tuint32_t; cdecl; external libllvm;
function LLVMDITypeGetLine(DType: TLLVMMetadataRef): dword; cdecl; external libllvm;
function LLVMDITypeGetFlags(DType: TLLVMMetadataRef): TLLVMDIFlags; cdecl; external libllvm;
function LLVMDIBuilderGetOrCreateSubrange(Builder: TLLVMDIBuilderRef; LowerBound: Tint64_t; Count: Tint64_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderGetOrCreateArray(Builder: TLLVMDIBuilderRef; Data: PLLVMMetadataRef; NumElements: Tsize_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateExpression(Builder: TLLVMDIBuilderRef; Addr: Puint64_t; Length: Tsize_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateConstantValueExpression(Builder: TLLVMDIBuilderRef; Value: Tuint64_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateGlobalVariableExpression(Builder: TLLVMDIBuilderRef; Scope: TLLVMMetadataRef; Name: pchar; NameLen: Tsize_t; Linkage: pchar;
  LinkLen: Tsize_t; File_: TLLVMMetadataRef; LineNo: dword; Ty: TLLVMMetadataRef; LocalToUnit: TLLVMBool;
  Expr: TLLVMMetadataRef; Decl: TLLVMMetadataRef; AlignInBits: Tuint32_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMGetDINodeTag(MD: TLLVMMetadataRef): Tuint16_t; cdecl; external libllvm;
function LLVMDIGlobalVariableExpressionGetVariable(GVE: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIGlobalVariableExpressionGetExpression(GVE: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIVariableGetFile(Var_: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIVariableGetScope(Var_: TLLVMMetadataRef): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIVariableGetLine(Var_: TLLVMMetadataRef): dword; cdecl; external libllvm;
function LLVMTemporaryMDNode(Ctx: TLLVMContextRef; Data: PLLVMMetadataRef; NumElements: Tsize_t): TLLVMMetadataRef; cdecl; external libllvm;
procedure LLVMDisposeTemporaryMDNode(TempNode: TLLVMMetadataRef); cdecl; external libllvm;
procedure LLVMMetadataReplaceAllUsesWith(TempTargetMetadata: TLLVMMetadataRef; Replacement: TLLVMMetadataRef); cdecl; external libllvm;
function LLVMDIBuilderCreateTempGlobalVariableFwdDecl(Builder: TLLVMDIBuilderRef; Scope: TLLVMMetadataRef; Name: pchar; NameLen: Tsize_t; Linkage: pchar;
  LnkLen: Tsize_t; File_: TLLVMMetadataRef; LineNo: dword; Ty: TLLVMMetadataRef; LocalToUnit: TLLVMBool;
  Decl: TLLVMMetadataRef; AlignInBits: Tuint32_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderInsertDeclareRecordBefore(Builder: TLLVMDIBuilderRef; Storage: TLLVMValueRef; VarInfo: TLLVMMetadataRef; Expr: TLLVMMetadataRef; DebugLoc: TLLVMMetadataRef;
  Instr: TLLVMValueRef): TLLVMDbgRecordRef; cdecl; external libllvm;
function LLVMDIBuilderInsertDeclareRecordAtEnd(Builder: TLLVMDIBuilderRef; Storage: TLLVMValueRef; VarInfo: TLLVMMetadataRef; Expr: TLLVMMetadataRef; DebugLoc: TLLVMMetadataRef;
  Block: TLLVMBasicBlockRef): TLLVMDbgRecordRef; cdecl; external libllvm;
function LLVMDIBuilderInsertDbgValueRecordBefore(Builder: TLLVMDIBuilderRef; Val: TLLVMValueRef; VarInfo: TLLVMMetadataRef; Expr: TLLVMMetadataRef; DebugLoc: TLLVMMetadataRef;
  Instr: TLLVMValueRef): TLLVMDbgRecordRef; cdecl; external libllvm;
function LLVMDIBuilderInsertDbgValueRecordAtEnd(Builder: TLLVMDIBuilderRef; Val: TLLVMValueRef; VarInfo: TLLVMMetadataRef; Expr: TLLVMMetadataRef; DebugLoc: TLLVMMetadataRef;
  Block: TLLVMBasicBlockRef): TLLVMDbgRecordRef; cdecl; external libllvm;
function LLVMDIBuilderCreateAutoVariable(Builder: TLLVMDIBuilderRef; Scope: TLLVMMetadataRef; Name: pchar; NameLen: Tsize_t; File_: TLLVMMetadataRef;
  LineNo: dword; Ty: TLLVMMetadataRef; AlwaysPreserve: TLLVMBool; Flags: TLLVMDIFlags; AlignInBits: Tuint32_t): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderCreateParameterVariable(Builder: TLLVMDIBuilderRef; Scope: TLLVMMetadataRef; Name: pchar; NameLen: Tsize_t; ArgNo: dword;
  File_: TLLVMMetadataRef; LineNo: dword; Ty: TLLVMMetadataRef; AlwaysPreserve: TLLVMBool; Flags: TLLVMDIFlags): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMGetSubprogram(Func: TLLVMValueRef): TLLVMMetadataRef; cdecl; external libllvm;
procedure LLVMSetSubprogram(Func: TLLVMValueRef; SP: TLLVMMetadataRef); cdecl; external libllvm;
function LLVMDISubprogramGetLine(Subprogram: TLLVMMetadataRef): dword; cdecl; external libllvm;
function LLVMInstructionGetDebugLoc(Inst: TLLVMValueRef): TLLVMMetadataRef; cdecl; external libllvm;
procedure LLVMInstructionSetDebugLoc(Inst: TLLVMValueRef; Loc: TLLVMMetadataRef); cdecl; external libllvm;
function LLVMDIBuilderCreateLabel(Builder: TLLVMDIBuilderRef; Context: TLLVMMetadataRef; Name: pchar; NameLen: Tsize_t; File_: TLLVMMetadataRef;
  LineNo: dword; AlwaysPreserve: TLLVMBool): TLLVMMetadataRef; cdecl; external libllvm;
function LLVMDIBuilderInsertLabelBefore(Builder: TLLVMDIBuilderRef; LabelInfo: TLLVMMetadataRef; Location: TLLVMMetadataRef; InsertBefore: TLLVMValueRef): TLLVMDbgRecordRef; cdecl; external libllvm;
function LLVMDIBuilderInsertLabelAtEnd(Builder: TLLVMDIBuilderRef; LabelInfo: TLLVMMetadataRef; Location: TLLVMMetadataRef; InsertAtEnd: TLLVMBasicBlockRef): TLLVMDbgRecordRef; cdecl; external libllvm;
function LLVMGetMetadataKind(Metadata: TLLVMMetadataRef): TLLVMMetadataKind; cdecl; external libllvm;

// === Konventiert am: 20-9-26 15:59:55 ===


implementation



end.
