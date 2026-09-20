
unit DebugInfo;
interface

{
  Automatically converted by H2Pas 1.0.0 from DebugInfo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    DebugInfo.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pdword  = ^dword;
PLLVMDIFlags  = ^LLVMDIFlags;
PLLVMDWARFEmissionKind  = ^LLVMDWARFEmissionKind;
PLLVMDWARFMacinfoRecordType  = ^LLVMDWARFMacinfoRecordType;
PLLVMDWARFSourceLanguage  = ^LLVMDWARFSourceLanguage;
PLLVMDWARFTypeEncoding  = ^LLVMDWARFTypeEncoding;
PLLVMMetadataKind  = ^LLVMMetadataKind;
PLLVMMetadataRef  = ^LLVMMetadataRef;
Psize_t  = ^size_t;
Puint64_t  = ^uint64_t;
Pxxxxxxxxxxx  = ^xxxxxxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===------------ DebugInfo.h - LLVM C API Debug Info API -----------------===// }
{ }
{ Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions. }
{ See https://llvm.org/LICENSE.txt for license information. }
{ SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception }
{ }
{===----------------------------------------------------------------------===// }
{/ }
{/ This file declares the C API endpoints for generating DWARF Debug Info }
{/ }
{/ Note: This interface is experimental. It is *NOT* stable, and may be }
{/       changed without warning. }
{/ }
{===----------------------------------------------------------------------===// }
{$ifndef LLVM_C_DEBUGINFO_H}
{$define LLVM_C_DEBUGINFO_H}
{$include "llvm-c/ExternC.h"}
{$include "llvm-c/Types.h"}
{*
 * @defgroup LLVMCCoreDebugInfo Debug Information
 * @ingroup LLVMCCore
 *
 * @
  }
{*
 * Debug info flags.
  }
{ Deprecated. }
type
  PLLVMDIFlags = ^TLLVMDIFlags;
  TLLVMDIFlags =  Longint;
  Const
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
;
{*
 * Source languages known by DWARF.
  }
{ New in DWARF v3: }
{ New in DWARF v4: }
{ New in DWARF v5: }
{ Vendor extensions: }
type
  PLLVMDWARFSourceLanguage = ^TLLVMDWARFSourceLanguage;
  TLLVMDWARFSourceLanguage =  Longint;
  Const
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
;
{*
 * The amount of debug information to emit.
  }
type
  PLLVMDWARFEmissionKind = ^TLLVMDWARFEmissionKind;
  TLLVMDWARFEmissionKind =  Longint;
  Const
    LLVMDWARFEmissionNone = 0;
    LLVMDWARFEmissionFull = 1;
    LLVMDWARFEmissionLineTablesOnly = 2;
;
{*
 * The kind of metadata nodes.
  }
type
  Txxxxxxxxxxx =  Longint;
  Const
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
{*
 * An LLVM DWARF type encoding.
  }

  PLLVMDWARFTypeEncoding = ^TLLVMDWARFTypeEncoding;
  TLLVMDWARFTypeEncoding = dword;
{*
 * Describes the kind of macro declaration used for LLVMDIBuilderCreateMacro.
 * @see llvm::dwarf::MacinfoRecordType
 * @note Values are from DW_MACINFO_* constants in the DWARF specification.
  }

  PLLVMDWARFMacinfoRecordType = ^TLLVMDWARFMacinfoRecordType;
  TLLVMDWARFMacinfoRecordType =  Longint;
  Const
    LLVMDWARFMacinfoRecordTypeDefine = $01;
    LLVMDWARFMacinfoRecordTypeMacro = $02;
    LLVMDWARFMacinfoRecordTypeStartFile = $03;
    LLVMDWARFMacinfoRecordTypeEndFile = $04;
    LLVMDWARFMacinfoRecordTypeVendorExt = $ff;
;
{*
 * The current debug metadata version number.
  }

function LLVMDebugMetadataVersion:dword;cdecl;external;
{*
 * The version of debug metadata that's present in the provided \c Module.
  }
function LLVMGetModuleDebugMetadataVersion(Module:TLLVMModuleRef):dword;cdecl;external;
{*
 * Strip debug info in the module if it exists.
 * To do this, we remove all calls to the debugger intrinsics and any named
 * metadata for debugging. We also remove debug locations for instructions.
 * Return true if module is modified.
  }
function LLVMStripModuleDebugInfo(Module:TLLVMModuleRef):TLLVMBool;cdecl;external;
{*
 * Construct a builder for a module, and do not allow for unresolved nodes
 * attached to the module.
  }
function LLVMCreateDIBuilderDisallowUnresolved(M:TLLVMModuleRef):TLLVMDIBuilderRef;cdecl;external;
{*
 * Construct a builder for a module and collect unresolved nodes attached
 * to the module in order to resolve cycles during a call to
 * \c LLVMDIBuilderFinalize.
  }
function LLVMCreateDIBuilder(M:TLLVMModuleRef):TLLVMDIBuilderRef;cdecl;external;
{*
 * Deallocates the \c DIBuilder and everything it owns.
 * @note You must call \c LLVMDIBuilderFinalize before this
  }
procedure LLVMDisposeDIBuilder(Builder:TLLVMDIBuilderRef);cdecl;external;
{*
 * Construct any deferred debug info descriptors.
  }
procedure LLVMDIBuilderFinalize(Builder:TLLVMDIBuilderRef);cdecl;external;
{*
 * Finalize a specific subprogram.
 * No new variables may be added to this subprogram afterwards.
  }
procedure LLVMDIBuilderFinalizeSubprogram(Builder:TLLVMDIBuilderRef; Subprogram:TLLVMMetadataRef);cdecl;external;
{*
 * A CompileUnit provides an anchor for all debugging
 * information generated during this instance of compilation.
 * \param Lang          Source programming language, eg.
 *                      \c LLVMDWARFSourceLanguageC99
 * \param FileRef       File info.
 * \param Producer      Identify the producer of debugging information
 *                      and code.  Usually this is a compiler
 *                      version string.
 * \param ProducerLen   The length of the C string passed to \c Producer.
 * \param isOptimized   A boolean flag which indicates whether optimization
 *                      is enabled or not.
 * \param Flags         This string lists command line options. This
 *                      string is directly embedded in debug info
 *                      output which may be used by a tool
 *                      analyzing generated debugging information.
 * \param FlagsLen      The length of the C string passed to \c Flags.
 * \param RuntimeVer    This indicates runtime version for languages like
 *                      Objective-C.
 * \param SplitName     The name of the file that we'll split debug info
 *                      out into.
 * \param SplitNameLen  The length of the C string passed to \c SplitName.
 * \param Kind          The kind of debug information to generate.
 * \param DWOId         The DWOId if this is a split skeleton compile unit.
 * \param SplitDebugInlining    Whether to emit inline debug info.
 * \param DebugInfoForProfiling Whether to emit extra debug info for
 *                              profile collection.
 * \param SysRoot         The Clang system root (value of -isysroot).
 * \param SysRootLen      The length of the C string passed to \c SysRoot.
 * \param SDK           The SDK. On Darwin, the last component of the sysroot.
 * \param SDKLen        The length of the C string passed to \c SDK.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function LLVMDIBuilderCreateCompileUnit(Builder:TLLVMDIBuilderRef; Lang:TLLVMDWARFSourceLanguage; FileRef:TLLVMMetadataRef; Producer:Pchar; ProducerLen:Tsize_t; 
           isOptimized:TLLVMBool; Flags:Pchar; FlagsLen:Tsize_t; RuntimeVer:dword; SplitName:Pchar; 
           SplitNameLen:Tsize_t; Kind:TLLVMDWARFEmissionKind; DWOId:dword; SplitDebugInlining:TLLVMBool; DebugInfoForProfiling:TLLVMBool; 
           SysRoot:Pchar; SysRootLen:Tsize_t; SDK:Pchar; SDKLen:Tsize_t):TLLVMMetadataRef;cdecl;external;
{*
 * Create a file descriptor to hold debugging information for a file.
 * \param Builder      The \c DIBuilder.
 * \param Filename     File name.
 * \param FilenameLen  The length of the C string passed to \c Filename.
 * \param Directory    Directory.
 * \param DirectoryLen The length of the C string passed to \c Directory.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function LLVMDIBuilderCreateFile(Builder:TLLVMDIBuilderRef; Filename:Pchar; FilenameLen:Tsize_t; Directory:Pchar; DirectoryLen:Tsize_t):TLLVMMetadataRef;cdecl;external;
{*
 * Creates a new descriptor for a module with the specified parent scope.
 * \param Builder         The \c DIBuilder.
 * \param ParentScope     The parent scope containing this module declaration.
 * \param Name            Module name.
 * \param NameLen         The length of the C string passed to \c Name.
 * \param ConfigMacros    A space-separated shell-quoted list of -D macro
                          definitions as they would appear on a command line.
 * \param ConfigMacrosLen The length of the C string passed to \c ConfigMacros.
 * \param IncludePath     The path to the module map file.
 * \param IncludePathLen  The length of the C string passed to \c IncludePath.
 * \param APINotesFile    The path to an API notes file for the module.
 * \param APINotesFileLen The length of the C string passed to \c APINotestFile.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function LLVMDIBuilderCreateModule(Builder:TLLVMDIBuilderRef; ParentScope:TLLVMMetadataRef; Name:Pchar; NameLen:Tsize_t; ConfigMacros:Pchar; 
           ConfigMacrosLen:Tsize_t; IncludePath:Pchar; IncludePathLen:Tsize_t; APINotesFile:Pchar; APINotesFileLen:Tsize_t):TLLVMMetadataRef;cdecl;external;
{*
 * Creates a new descriptor for a namespace with the specified parent scope.
 * \param Builder          The \c DIBuilder.
 * \param ParentScope      The parent scope containing this module declaration.
 * \param Name             NameSpace name.
 * \param NameLen          The length of the C string passed to \c Name.
 * \param ExportSymbols    Whether or not the namespace exports symbols, e.g.
 *                         this is true of C++ inline namespaces.
  }
(* Const before type ignored *)
function LLVMDIBuilderCreateNameSpace(Builder:TLLVMDIBuilderRef; ParentScope:TLLVMMetadataRef; Name:Pchar; NameLen:Tsize_t; ExportSymbols:TLLVMBool):TLLVMMetadataRef;cdecl;external;
{*
 * Create a new descriptor for the specified subprogram.
 * \param Builder         The \c DIBuilder.
 * \param Scope           Function scope.
 * \param Name            Function name.
 * \param NameLen         Length of enumeration name.
 * \param LinkageName     Mangled function name.
 * \param LinkageNameLen  Length of linkage name.
 * \param File            File where this variable is defined.
 * \param LineNo          Line number.
 * \param Ty              Function type.
 * \param IsLocalToUnit   True if this function is not externally visible.
 * \param IsDefinition    True if this is a function definition.
 * \param ScopeLine       Set to the beginning of the scope this starts
 * \param Flags           E.g.: \c LLVMDIFlagLValueReference. These flags are
 *                        used to emit dwarf attributes.
 * \param IsOptimized     True if optimization is ON.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function LLVMDIBuilderCreateFunction(Builder:TLLVMDIBuilderRef; Scope:TLLVMMetadataRef; Name:Pchar; NameLen:Tsize_t; LinkageName:Pchar; 
           LinkageNameLen:Tsize_t; File:TLLVMMetadataRef; LineNo:dword; Ty:TLLVMMetadataRef; IsLocalToUnit:TLLVMBool; 
           IsDefinition:TLLVMBool; ScopeLine:dword; Flags:TLLVMDIFlags; IsOptimized:TLLVMBool):TLLVMMetadataRef;cdecl;external;
{*
 * Create a descriptor for a lexical block with the specified parent context.
 * \param Builder      The \c DIBuilder.
 * \param Scope        Parent lexical block.
 * \param File         Source file.
 * \param Line         The line in the source file.
 * \param Column       The column in the source file.
  }
function LLVMDIBuilderCreateLexicalBlock(Builder:TLLVMDIBuilderRef; Scope:TLLVMMetadataRef; File:TLLVMMetadataRef; Line:dword; Column:dword):TLLVMMetadataRef;cdecl;external;
{*
 * Create a descriptor for a lexical block with a new file attached.
 * \param Builder        The \c DIBuilder.
 * \param Scope          Lexical block.
 * \param File           Source file.
 * \param Discriminator  DWARF path discriminator value.
  }
function LLVMDIBuilderCreateLexicalBlockFile(Builder:TLLVMDIBuilderRef; Scope:TLLVMMetadataRef; File:TLLVMMetadataRef; Discriminator:dword):TLLVMMetadataRef;cdecl;external;
{*
 * Create a descriptor for an imported namespace. Suitable for e.g. C++
 * using declarations.
 * \param Builder    The \c DIBuilder.
 * \param Scope      The scope this module is imported into
 * \param File       File where the declaration is located.
 * \param Line       Line number of the declaration.
  }
function LLVMDIBuilderCreateImportedModuleFromNamespace(Builder:TLLVMDIBuilderRef; Scope:TLLVMMetadataRef; NS:TLLVMMetadataRef; File:TLLVMMetadataRef; Line:dword):TLLVMMetadataRef;cdecl;external;
{*
 * Create a descriptor for an imported module that aliases another
 * imported entity descriptor.
 * \param Builder        The \c DIBuilder.
 * \param Scope          The scope this module is imported into
 * \param ImportedEntity Previous imported entity to alias.
 * \param File           File where the declaration is located.
 * \param Line           Line number of the declaration.
 * \param Elements       Renamed elements.
 * \param NumElements    Number of renamed elements.
  }
function LLVMDIBuilderCreateImportedModuleFromAlias(Builder:TLLVMDIBuilderRef; Scope:TLLVMMetadataRef; ImportedEntity:TLLVMMetadataRef; File:TLLVMMetadataRef; Line:dword; 
           Elements:PLLVMMetadataRef; NumElements:dword):TLLVMMetadataRef;cdecl;external;
{*
 * Create a descriptor for an imported module.
 * \param Builder        The \c DIBuilder.
 * \param Scope          The scope this module is imported into
 * \param M              The module being imported here
 * \param File           File where the declaration is located.
 * \param Line           Line number of the declaration.
 * \param Elements       Renamed elements.
 * \param NumElements    Number of renamed elements.
  }
function LLVMDIBuilderCreateImportedModuleFromModule(Builder:TLLVMDIBuilderRef; Scope:TLLVMMetadataRef; M:TLLVMMetadataRef; File:TLLVMMetadataRef; Line:dword; 
           Elements:PLLVMMetadataRef; NumElements:dword):TLLVMMetadataRef;cdecl;external;
{*
 * Create a descriptor for an imported function, type, or variable.  Suitable
 * for e.g. FORTRAN-style USE declarations.
 * \param Builder        The DIBuilder.
 * \param Scope          The scope this module is imported into.
 * \param Decl           The declaration (or definition) of a function, type,
                         or variable.
 * \param File           File where the declaration is located.
 * \param Line           Line number of the declaration.
 * \param Name           A name that uniquely identifies this imported
 declaration.
 * \param NameLen        The length of the C string passed to \c Name.
 * \param Elements       Renamed elements.
 * \param NumElements    Number of renamed elements.
  }
(* Const before type ignored *)
function LLVMDIBuilderCreateImportedDeclaration(Builder:TLLVMDIBuilderRef; Scope:TLLVMMetadataRef; Decl:TLLVMMetadataRef; File:TLLVMMetadataRef; Line:dword; 
           Name:Pchar; NameLen:Tsize_t; Elements:PLLVMMetadataRef; NumElements:dword):TLLVMMetadataRef;cdecl;external;
{*
 * Creates a new DebugLocation that describes a source location.
 * \param Line The line in the source file.
 * \param Column The column in the source file.
 * \param Scope The scope in which the location resides.
 * \param InlinedAt The scope where this location was inlined, if at all.
 *                  (optional).
 * \note If the item to which this location is attached cannot be
 *       attributed to a source line, pass 0 for the line and column.
  }
function LLVMDIBuilderCreateDebugLocation(Ctx:TLLVMContextRef; Line:dword; Column:dword; Scope:TLLVMMetadataRef; InlinedAt:TLLVMMetadataRef):TLLVMMetadataRef;cdecl;external;
{*
 * Get the line number of this debug location.
 * \param Location     The debug location.
 *
 * @see DILocation::getLine()
  }
function LLVMDILocationGetLine(Location:TLLVMMetadataRef):dword;cdecl;external;
{*
 * Get the column number of this debug location.
 * \param Location     The debug location.
 *
 * @see DILocation::getColumn()
  }
function LLVMDILocationGetColumn(Location:TLLVMMetadataRef):dword;cdecl;external;
{*
 * Get the local scope associated with this debug location.
 * \param Location     The debug location.
 *
 * @see DILocation::getScope()
  }
function LLVMDILocationGetScope(Location:TLLVMMetadataRef):TLLVMMetadataRef;cdecl;external;
{*
 * Get the "inline at" location associated with this debug location.
 * \param Location     The debug location.
 *
 * @see DILocation::getInlinedAt()
  }
function LLVMDILocationGetInlinedAt(Location:TLLVMMetadataRef):TLLVMMetadataRef;cdecl;external;
{*
 * Get the metadata of the file associated with a given scope.
 * \param Scope     The scope object.
 *
 * @see DIScope::getFile()
  }
function LLVMDIScopeGetFile(Scope:TLLVMMetadataRef):TLLVMMetadataRef;cdecl;external;
{*
 * Get the directory of a given file.
 * \param File     The file object.
 * \param Len      The length of the returned string.
 *
 * @see DIFile::getDirectory()
  }
(* Const before type ignored *)
function LLVMDIFileGetDirectory(File:TLLVMMetadataRef; Len:Pdword):Pchar;cdecl;external;
{*
 * Get the name of a given file.
 * \param File     The file object.
 * \param Len      The length of the returned string.
 *
 * @see DIFile::getFilename()
  }
(* Const before type ignored *)
function LLVMDIFileGetFilename(File:TLLVMMetadataRef; Len:Pdword):Pchar;cdecl;external;
{*
 * Get the source of a given file.
 * \param File     The file object.
 * \param Len      The length of the returned string.
 *
 * @see DIFile::getSource()
  }
(* Const before type ignored *)
function LLVMDIFileGetSource(File:TLLVMMetadataRef; Len:Pdword):Pchar;cdecl;external;
{*
 * Create a type array.
 * \param Builder        The DIBuilder.
 * \param Data           The type elements.
 * \param NumElements    Number of type elements.
  }
function LLVMDIBuilderGetOrCreateTypeArray(Builder:TLLVMDIBuilderRef; Data:PLLVMMetadataRef; NumElements:Tsize_t):TLLVMMetadataRef;cdecl;external;
{*
 * Create subroutine type.
 * \param Builder        The DIBuilder.
 * \param File            The file in which the subroutine resides.
 * \param ParameterTypes  An array of subroutine parameter types. This
 *                        includes return type at 0th index.
 * \param NumParameterTypes The number of parameter types in \c ParameterTypes
 * \param Flags           E.g.: \c LLVMDIFlagLValueReference.
 *                        These flags are used to emit dwarf attributes.
  }
function LLVMDIBuilderCreateSubroutineType(Builder:TLLVMDIBuilderRef; File:TLLVMMetadataRef; ParameterTypes:PLLVMMetadataRef; NumParameterTypes:dword; Flags:TLLVMDIFlags):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry for a macro.
 * @param Builder         The DIBuilder.
 * @param ParentMacroFile Macro parent (could be NULL).
 * @param Line            Source line number where the macro is defined.
 * @param RecordType      DW_MACINFO_define or DW_MACINFO_undef.
 * @param Name            Macro name.
 * @param NameLen         Macro name length.
 * @param Value           Macro value.
 * @param ValueLen        Macro value length.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function LLVMDIBuilderCreateMacro(Builder:TLLVMDIBuilderRef; ParentMacroFile:TLLVMMetadataRef; Line:dword; RecordType:TLLVMDWARFMacinfoRecordType; Name:Pchar; 
           NameLen:Tsize_t; Value:Pchar; ValueLen:Tsize_t):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information temporary entry for a macro file.
 * List of macro node direct children will be calculated by DIBuilder,
 * using the \p ParentMacroFile relationship.
 * @param Builder         The DIBuilder.
 * @param ParentMacroFile Macro parent (could be NULL).
 * @param Line            Source line number where the macro file is included.
 * @param File            File descriptor containing the name of the macro file.
  }
function LLVMDIBuilderCreateTempMacroFile(Builder:TLLVMDIBuilderRef; ParentMacroFile:TLLVMMetadataRef; Line:dword; File:TLLVMMetadataRef):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry for an enumerator.
 * @param Builder        The DIBuilder.
 * @param Name           Enumerator name.
 * @param NameLen        Length of enumerator name.
 * @param Value          Enumerator value.
 * @param IsUnsigned     True if the value is unsigned.
  }
(* Const before type ignored *)
function LLVMDIBuilderCreateEnumerator(Builder:TLLVMDIBuilderRef; Name:Pchar; NameLen:Tsize_t; Value:Tint64_t; IsUnsigned:TLLVMBool):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry for an enumeration.
 * \param Builder        The DIBuilder.
 * \param Scope          Scope in which this enumeration is defined.
 * \param Name           Enumeration name.
 * \param NameLen        Length of enumeration name.
 * \param File           File where this member is defined.
 * \param LineNumber     Line number.
 * \param SizeInBits     Member size.
 * \param AlignInBits    Member alignment.
 * \param Elements       Enumeration elements.
 * \param NumElements    Number of enumeration elements.
 * \param ClassTy        Underlying type of a C++11/ObjC fixed enum.
  }
(* Const before type ignored *)
function LLVMDIBuilderCreateEnumerationType(Builder:TLLVMDIBuilderRef; Scope:TLLVMMetadataRef; Name:Pchar; NameLen:Tsize_t; File:TLLVMMetadataRef; 
           LineNumber:dword; SizeInBits:Tuint64_t; AlignInBits:Tuint32_t; Elements:PLLVMMetadataRef; NumElements:dword; 
           ClassTy:TLLVMMetadataRef):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry for a union.
 * \param Builder      The DIBuilder.
 * \param Scope        Scope in which this union is defined.
 * \param Name         Union name.
 * \param NameLen      Length of union name.
 * \param File         File where this member is defined.
 * \param LineNumber   Line number.
 * \param SizeInBits   Member size.
 * \param AlignInBits  Member alignment.
 * \param Flags        Flags to encode member attribute, e.g. private
 * \param Elements     Union elements.
 * \param NumElements  Number of union elements.
 * \param RunTimeLang  Optional parameter, Objective-C runtime version.
 * \param UniqueId     A unique identifier for the union.
 * \param UniqueIdLen  Length of unique identifier.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function LLVMDIBuilderCreateUnionType(Builder:TLLVMDIBuilderRef; Scope:TLLVMMetadataRef; Name:Pchar; NameLen:Tsize_t; File:TLLVMMetadataRef; 
           LineNumber:dword; SizeInBits:Tuint64_t; AlignInBits:Tuint32_t; Flags:TLLVMDIFlags; Elements:PLLVMMetadataRef; 
           NumElements:dword; RunTimeLang:dword; UniqueId:Pchar; UniqueIdLen:Tsize_t):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry for an array.
 * \param Builder      The DIBuilder.
 * \param Size         Array size.
 * \param AlignInBits  Alignment.
 * \param Ty           Element type.
 * \param Subscripts   Subscripts.
 * \param NumSubscripts Number of subscripts.
  }
function LLVMDIBuilderCreateArrayType(Builder:TLLVMDIBuilderRef; Size:Tuint64_t; AlignInBits:Tuint32_t; Ty:TLLVMMetadataRef; Subscripts:PLLVMMetadataRef; 
           NumSubscripts:dword):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry for a vector type.
 * \param Builder      The DIBuilder.
 * \param Size         Vector size.
 * \param AlignInBits  Alignment.
 * \param Ty           Element type.
 * \param Subscripts   Subscripts.
 * \param NumSubscripts Number of subscripts.
  }
function LLVMDIBuilderCreateVectorType(Builder:TLLVMDIBuilderRef; Size:Tuint64_t; AlignInBits:Tuint32_t; Ty:TLLVMMetadataRef; Subscripts:PLLVMMetadataRef; 
           NumSubscripts:dword):TLLVMMetadataRef;cdecl;external;
{*
 * Create a DWARF unspecified type.
 * \param Builder   The DIBuilder.
 * \param Name      The unspecified type's name.
 * \param NameLen   Length of type name.
  }
(* Const before type ignored *)
function LLVMDIBuilderCreateUnspecifiedType(Builder:TLLVMDIBuilderRef; Name:Pchar; NameLen:Tsize_t):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry for a basic
 * type.
 * \param Builder     The DIBuilder.
 * \param Name        Type name.
 * \param NameLen     Length of type name.
 * \param SizeInBits  Size of the type.
 * \param Encoding    DWARF encoding code, e.g. \c LLVMDWARFTypeEncoding_float.
 * \param Flags       Flags to encode optional attribute like endianity
  }
(* Const before type ignored *)
function LLVMDIBuilderCreateBasicType(Builder:TLLVMDIBuilderRef; Name:Pchar; NameLen:Tsize_t; SizeInBits:Tuint64_t; Encoding:TLLVMDWARFTypeEncoding; 
           Flags:TLLVMDIFlags):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry for a pointer.
 * \param Builder     The DIBuilder.
 * \param PointeeTy         Type pointed by this pointer.
 * \param SizeInBits        Size.
 * \param AlignInBits       Alignment. (optional, pass 0 to ignore)
 * \param AddressSpace      DWARF address space. (optional, pass 0 to ignore)
 * \param Name              Pointer type name. (optional)
 * \param NameLen           Length of pointer type name. (optional)
  }
(* Const before type ignored *)
function LLVMDIBuilderCreatePointerType(Builder:TLLVMDIBuilderRef; PointeeTy:TLLVMMetadataRef; SizeInBits:Tuint64_t; AlignInBits:Tuint32_t; AddressSpace:dword; 
           Name:Pchar; NameLen:Tsize_t):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry for a struct.
 * \param Builder     The DIBuilder.
 * \param Scope        Scope in which this struct is defined.
 * \param Name         Struct name.
 * \param NameLen      Struct name length.
 * \param File         File where this member is defined.
 * \param LineNumber   Line number.
 * \param SizeInBits   Member size.
 * \param AlignInBits  Member alignment.
 * \param Flags        Flags to encode member attribute, e.g. private
 * \param Elements     Struct elements.
 * \param NumElements  Number of struct elements.
 * \param RunTimeLang  Optional parameter, Objective-C runtime version.
 * \param VTableHolder The object containing the vtable for the struct.
 * \param UniqueId     A unique identifier for the struct.
 * \param UniqueIdLen  Length of the unique identifier for the struct.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function LLVMDIBuilderCreateStructType(Builder:TLLVMDIBuilderRef; Scope:TLLVMMetadataRef; Name:Pchar; NameLen:Tsize_t; File:TLLVMMetadataRef; 
           LineNumber:dword; SizeInBits:Tuint64_t; AlignInBits:Tuint32_t; Flags:TLLVMDIFlags; DerivedFrom:TLLVMMetadataRef; 
           Elements:PLLVMMetadataRef; NumElements:dword; RunTimeLang:dword; VTableHolder:TLLVMMetadataRef; UniqueId:Pchar; 
           UniqueIdLen:Tsize_t):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry for a member.
 * \param Builder      The DIBuilder.
 * \param Scope        Member scope.
 * \param Name         Member name.
 * \param NameLen      Length of member name.
 * \param File         File where this member is defined.
 * \param LineNo       Line number.
 * \param SizeInBits   Member size.
 * \param AlignInBits  Member alignment.
 * \param OffsetInBits Member offset.
 * \param Flags        Flags to encode member attribute, e.g. private
 * \param Ty           Parent type.
  }
(* Const before type ignored *)
function LLVMDIBuilderCreateMemberType(Builder:TLLVMDIBuilderRef; Scope:TLLVMMetadataRef; Name:Pchar; NameLen:Tsize_t; File:TLLVMMetadataRef; 
           LineNo:dword; SizeInBits:Tuint64_t; AlignInBits:Tuint32_t; OffsetInBits:Tuint64_t; Flags:TLLVMDIFlags; 
           Ty:TLLVMMetadataRef):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry for a
 * C++ static data member.
 * \param Builder      The DIBuilder.
 * \param Scope        Member scope.
 * \param Name         Member name.
 * \param NameLen      Length of member name.
 * \param File         File where this member is declared.
 * \param LineNumber   Line number.
 * \param Type         Type of the static member.
 * \param Flags        Flags to encode member attribute, e.g. private.
 * \param ConstantVal  Const initializer of the member.
 * \param AlignInBits  Member alignment.
  }
(* Const before type ignored *)
function LLVMDIBuilderCreateStaticMemberType(Builder:TLLVMDIBuilderRef; Scope:TLLVMMetadataRef; Name:Pchar; NameLen:Tsize_t; File:TLLVMMetadataRef; 
           LineNumber:dword; _Type:TLLVMMetadataRef; Flags:TLLVMDIFlags; ConstantVal:TLLVMValueRef; AlignInBits:Tuint32_t):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry for a pointer to member.
 * \param Builder      The DIBuilder.
 * \param PointeeType  Type pointed to by this pointer.
 * \param ClassType    Type for which this pointer points to members of.
 * \param SizeInBits   Size.
 * \param AlignInBits  Alignment.
 * \param Flags        Flags.
  }
function LLVMDIBuilderCreateMemberPointerType(Builder:TLLVMDIBuilderRef; PointeeType:TLLVMMetadataRef; ClassType:TLLVMMetadataRef; SizeInBits:Tuint64_t; AlignInBits:Tuint32_t; 
           Flags:TLLVMDIFlags):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry for Objective-C instance variable.
 * \param Builder      The DIBuilder.
 * \param Name         Member name.
 * \param NameLen      The length of the C string passed to \c Name.
 * \param File         File where this member is defined.
 * \param LineNo       Line number.
 * \param SizeInBits   Member size.
 * \param AlignInBits  Member alignment.
 * \param OffsetInBits Member offset.
 * \param Flags        Flags to encode member attribute, e.g. private
 * \param Ty           Parent type.
 * \param PropertyNode Property associated with this ivar.
  }
(* Const before type ignored *)
function LLVMDIBuilderCreateObjCIVar(Builder:TLLVMDIBuilderRef; Name:Pchar; NameLen:Tsize_t; File:TLLVMMetadataRef; LineNo:dword; 
           SizeInBits:Tuint64_t; AlignInBits:Tuint32_t; OffsetInBits:Tuint64_t; Flags:TLLVMDIFlags; Ty:TLLVMMetadataRef; 
           PropertyNode:TLLVMMetadataRef):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry for Objective-C property.
 * \param Builder            The DIBuilder.
 * \param Name               Property name.
 * \param NameLen            The length of the C string passed to \c Name.
 * \param File               File where this property is defined.
 * \param LineNo             Line number.
 * \param GetterName         Name of the Objective C property getter selector.
 * \param GetterNameLen      The length of the C string passed to \c GetterName.
 * \param SetterName         Name of the Objective C property setter selector.
 * \param SetterNameLen      The length of the C string passed to \c SetterName.
 * \param PropertyAttributes Objective C property attributes.
 * \param Ty                 Type.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function LLVMDIBuilderCreateObjCProperty(Builder:TLLVMDIBuilderRef; Name:Pchar; NameLen:Tsize_t; File:TLLVMMetadataRef; LineNo:dword; 
           GetterName:Pchar; GetterNameLen:Tsize_t; SetterName:Pchar; SetterNameLen:Tsize_t; PropertyAttributes:dword; 
           Ty:TLLVMMetadataRef):TLLVMMetadataRef;cdecl;external;
{*
 * Create a uniqued DIType* clone with FlagObjectPointer. If \c Implicit
 * is true, then also set FlagArtificial.
 * \param Builder   The DIBuilder.
 * \param Type      The underlying type to which this pointer points.
 * \param Implicit  Indicates whether this pointer was implicitly generated
 *                  (i.e., not spelled out in source).
  }
function LLVMDIBuilderCreateObjectPointerType(Builder:TLLVMDIBuilderRef; _Type:TLLVMMetadataRef; Implicit:TLLVMBool):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry for a qualified
 * type, e.g. 'const int'.
 * \param Builder     The DIBuilder.
 * \param Tag         Tag identifying type,
 *                    e.g. LLVMDWARFTypeQualifier_volatile_type
 * \param Type        Base Type.
  }
function LLVMDIBuilderCreateQualifiedType(Builder:TLLVMDIBuilderRef; Tag:dword; _Type:TLLVMMetadataRef):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry for a c++
 * style reference or rvalue reference type.
 * \param Builder   The DIBuilder.
 * \param Tag       Tag identifying type,
 * \param Type      Base Type.
  }
function LLVMDIBuilderCreateReferenceType(Builder:TLLVMDIBuilderRef; Tag:dword; _Type:TLLVMMetadataRef):TLLVMMetadataRef;cdecl;external;
{*
 * Create C++11 nullptr type.
 * \param Builder   The DIBuilder.
  }
function LLVMDIBuilderCreateNullPtrType(Builder:TLLVMDIBuilderRef):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry for a typedef.
 * \param Builder    The DIBuilder.
 * \param Type       Original type.
 * \param Name       Typedef name.
 * \param File       File where this type is defined.
 * \param LineNo     Line number.
 * \param Scope      The surrounding context for the typedef.
  }
(* Const before type ignored *)
function LLVMDIBuilderCreateTypedef(Builder:TLLVMDIBuilderRef; _Type:TLLVMMetadataRef; Name:Pchar; NameLen:Tsize_t; File:TLLVMMetadataRef; 
           LineNo:dword; Scope:TLLVMMetadataRef; AlignInBits:Tuint32_t):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry to establish inheritance relationship
 * between two types.
 * \param Builder       The DIBuilder.
 * \param Ty            Original type.
 * \param BaseTy        Base type. Ty is inherits from base.
 * \param BaseOffset    Base offset.
 * \param VBPtrOffset  Virtual base pointer offset.
 * \param Flags         Flags to describe inheritance attribute, e.g. private
  }
function LLVMDIBuilderCreateInheritance(Builder:TLLVMDIBuilderRef; Ty:TLLVMMetadataRef; BaseTy:TLLVMMetadataRef; BaseOffset:Tuint64_t; VBPtrOffset:Tuint32_t; 
           Flags:TLLVMDIFlags):TLLVMMetadataRef;cdecl;external;
{*
 * Create a permanent forward-declared type.
 * \param Builder             The DIBuilder.
 * \param Tag                 A unique tag for this type.
 * \param Name                Type name.
 * \param NameLen             Length of type name.
 * \param Scope               Type scope.
 * \param File                File where this type is defined.
 * \param Line                Line number where this type is defined.
 * \param RuntimeLang         Indicates runtime version for languages like
 *                            Objective-C.
 * \param SizeInBits          Member size.
 * \param AlignInBits         Member alignment.
 * \param UniqueIdentifier    A unique identifier for the type.
 * \param UniqueIdentifierLen Length of the unique identifier.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function LLVMDIBuilderCreateForwardDecl(Builder:TLLVMDIBuilderRef; Tag:dword; Name:Pchar; NameLen:Tsize_t; Scope:TLLVMMetadataRef; 
           File:TLLVMMetadataRef; Line:dword; RuntimeLang:dword; SizeInBits:Tuint64_t; AlignInBits:Tuint32_t; 
           UniqueIdentifier:Pchar; UniqueIdentifierLen:Tsize_t):TLLVMMetadataRef;cdecl;external;
{*
 * Create a temporary forward-declared type.
 * \param Builder             The DIBuilder.
 * \param Tag                 A unique tag for this type.
 * \param Name                Type name.
 * \param NameLen             Length of type name.
 * \param Scope               Type scope.
 * \param File                File where this type is defined.
 * \param Line                Line number where this type is defined.
 * \param RuntimeLang         Indicates runtime version for languages like
 *                            Objective-C.
 * \param SizeInBits          Member size.
 * \param AlignInBits         Member alignment.
 * \param Flags               Flags.
 * \param UniqueIdentifier    A unique identifier for the type.
 * \param UniqueIdentifierLen Length of the unique identifier.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function LLVMDIBuilderCreateReplaceableCompositeType(Builder:TLLVMDIBuilderRef; Tag:dword; Name:Pchar; NameLen:Tsize_t; Scope:TLLVMMetadataRef; 
           File:TLLVMMetadataRef; Line:dword; RuntimeLang:dword; SizeInBits:Tuint64_t; AlignInBits:Tuint32_t; 
           Flags:TLLVMDIFlags; UniqueIdentifier:Pchar; UniqueIdentifierLen:Tsize_t):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry for a bit field member.
 * \param Builder             The DIBuilder.
 * \param Scope               Member scope.
 * \param Name                Member name.
 * \param NameLen             Length of member name.
 * \param File                File where this member is defined.
 * \param LineNumber          Line number.
 * \param SizeInBits          Member size.
 * \param OffsetInBits        Member offset.
 * \param StorageOffsetInBits Member storage offset.
 * \param Flags               Flags to encode member attribute.
 * \param Type                Parent type.
  }
(* Const before type ignored *)
function LLVMDIBuilderCreateBitFieldMemberType(Builder:TLLVMDIBuilderRef; Scope:TLLVMMetadataRef; Name:Pchar; NameLen:Tsize_t; File:TLLVMMetadataRef; 
           LineNumber:dword; SizeInBits:Tuint64_t; OffsetInBits:Tuint64_t; StorageOffsetInBits:Tuint64_t; Flags:TLLVMDIFlags; 
           _Type:TLLVMMetadataRef):TLLVMMetadataRef;cdecl;external;
{*
 * Create debugging information entry for a class.
 * \param Scope               Scope in which this class is defined.
 * \param Name                Class name.
 * \param NameLen             The length of the C string passed to \c Name.
 * \param File                File where this member is defined.
 * \param LineNumber          Line number.
 * \param SizeInBits          Member size.
 * \param AlignInBits         Member alignment.
 * \param OffsetInBits        Member offset.
 * \param Flags               Flags to encode member attribute, e.g. private.
 * \param DerivedFrom         Debug info of the base class of this type.
 * \param Elements            Class members.
 * \param NumElements         Number of class elements.
 * \param VTableHolder        Debug info of the base class that contains vtable
 *                            for this type. This is used in
 *                            DW_AT_containing_type. See DWARF documentation
 *                            for more info.
 * \param TemplateParamsNode  Template type parameters.
 * \param UniqueIdentifier    A unique identifier for the type.
 * \param UniqueIdentifierLen Length of the unique identifier.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function LLVMDIBuilderCreateClassType(Builder:TLLVMDIBuilderRef; Scope:TLLVMMetadataRef; Name:Pchar; NameLen:Tsize_t; File:TLLVMMetadataRef; 
           LineNumber:dword; SizeInBits:Tuint64_t; AlignInBits:Tuint32_t; OffsetInBits:Tuint64_t; Flags:TLLVMDIFlags; 
           DerivedFrom:TLLVMMetadataRef; Elements:PLLVMMetadataRef; NumElements:dword; VTableHolder:TLLVMMetadataRef; TemplateParamsNode:TLLVMMetadataRef; 
           UniqueIdentifier:Pchar; UniqueIdentifierLen:Tsize_t):TLLVMMetadataRef;cdecl;external;
{*
 * Create a uniqued DIType* clone with FlagArtificial set.
 * \param Builder     The DIBuilder.
 * \param Type        The underlying type.
  }
function LLVMDIBuilderCreateArtificialType(Builder:TLLVMDIBuilderRef; _Type:TLLVMMetadataRef):TLLVMMetadataRef;cdecl;external;
{*
 * Get the name of this DIType.
 * \param DType     The DIType.
 * \param Length    The length of the returned string.
 *
 * @see DIType::getName()
  }
(* Const before type ignored *)
function LLVMDITypeGetName(DType:TLLVMMetadataRef; Length:Psize_t):Pchar;cdecl;external;
{*
 * Get the size of this DIType in bits.
 * \param DType     The DIType.
 *
 * @see DIType::getSizeInBits()
  }
function LLVMDITypeGetSizeInBits(DType:TLLVMMetadataRef):Tuint64_t;cdecl;external;
{*
 * Get the offset of this DIType in bits.
 * \param DType     The DIType.
 *
 * @see DIType::getOffsetInBits()
  }
function LLVMDITypeGetOffsetInBits(DType:TLLVMMetadataRef):Tuint64_t;cdecl;external;
{*
 * Get the alignment of this DIType in bits.
 * \param DType     The DIType.
 *
 * @see DIType::getAlignInBits()
  }
function LLVMDITypeGetAlignInBits(DType:TLLVMMetadataRef):Tuint32_t;cdecl;external;
{*
 * Get the source line where this DIType is declared.
 * \param DType     The DIType.
 *
 * @see DIType::getLine()
  }
function LLVMDITypeGetLine(DType:TLLVMMetadataRef):dword;cdecl;external;
{*
 * Get the flags associated with this DIType.
 * \param DType     The DIType.
 *
 * @see DIType::getFlags()
  }
function LLVMDITypeGetFlags(DType:TLLVMMetadataRef):TLLVMDIFlags;cdecl;external;
{*
 * Create a descriptor for a value range.
 * \param Builder    The DIBuilder.
 * \param LowerBound Lower bound of the subrange, e.g. 0 for C, 1 for Fortran.
 * \param Count      Count of elements in the subrange.
  }
function LLVMDIBuilderGetOrCreateSubrange(Builder:TLLVMDIBuilderRef; LowerBound:Tint64_t; Count:Tint64_t):TLLVMMetadataRef;cdecl;external;
{*
 * Create an array of DI Nodes.
 * \param Builder        The DIBuilder.
 * \param Data           The DI Node elements.
 * \param NumElements    Number of DI Node elements.
  }
function LLVMDIBuilderGetOrCreateArray(Builder:TLLVMDIBuilderRef; Data:PLLVMMetadataRef; NumElements:Tsize_t):TLLVMMetadataRef;cdecl;external;
{*
 * Create a new descriptor for the specified variable which has a complex
 * address expression for its address.
 * \param Builder     The DIBuilder.
 * \param Addr        An array of complex address operations.
 * \param Length      Length of the address operation array.
  }
function LLVMDIBuilderCreateExpression(Builder:TLLVMDIBuilderRef; Addr:Puint64_t; Length:Tsize_t):TLLVMMetadataRef;cdecl;external;
{*
 * Create a new descriptor for the specified variable that does not have an
 * address, but does have a constant value.
 * \param Builder     The DIBuilder.
 * \param Value       The constant value.
  }
function LLVMDIBuilderCreateConstantValueExpression(Builder:TLLVMDIBuilderRef; Value:Tuint64_t):TLLVMMetadataRef;cdecl;external;
{*
 * Create a new descriptor for the specified variable.
 * \param Scope       Variable scope.
 * \param Name        Name of the variable.
 * \param NameLen     The length of the C string passed to \c Name.
 * \param Linkage     Mangled  name of the variable.
 * \param LinkLen     The length of the C string passed to \c Linkage.
 * \param File        File where this variable is defined.
 * \param LineNo      Line number.
 * \param Ty          Variable Type.
 * \param LocalToUnit Boolean flag indicate whether this variable is
 *                    externally visible or not.
 * \param Expr        The location of the global relative to the attached
 *                    GlobalVariable.
 * \param Decl        Reference to the corresponding declaration.
 *                    variables.
 * \param AlignInBits Variable alignment(or 0 if no alignment attr was
 *                    specified)
  }
(* Const before type ignored *)
(* Const before type ignored *)
function LLVMDIBuilderCreateGlobalVariableExpression(Builder:TLLVMDIBuilderRef; Scope:TLLVMMetadataRef; Name:Pchar; NameLen:Tsize_t; Linkage:Pchar; 
           LinkLen:Tsize_t; File:TLLVMMetadataRef; LineNo:dword; Ty:TLLVMMetadataRef; LocalToUnit:TLLVMBool; 
           Expr:TLLVMMetadataRef; Decl:TLLVMMetadataRef; AlignInBits:Tuint32_t):TLLVMMetadataRef;cdecl;external;
{*
 * Get the dwarf::Tag of a DINode
  }
function LLVMGetDINodeTag(MD:TLLVMMetadataRef):Tuint16_t;cdecl;external;
{*
 * Retrieves the \c DIVariable associated with this global variable expression.
 * \param GVE    The global variable expression.
 *
 * @see llvm::DIGlobalVariableExpression::getVariable()
  }
function LLVMDIGlobalVariableExpressionGetVariable(GVE:TLLVMMetadataRef):TLLVMMetadataRef;cdecl;external;
{*
 * Retrieves the \c DIExpression associated with this global variable expression.
 * \param GVE    The global variable expression.
 *
 * @see llvm::DIGlobalVariableExpression::getExpression()
  }
function LLVMDIGlobalVariableExpressionGetExpression(GVE:TLLVMMetadataRef):TLLVMMetadataRef;cdecl;external;
{*
 * Get the metadata of the file associated with a given variable.
 * \param Var     The variable object.
 *
 * @see DIVariable::getFile()
  }
function LLVMDIVariableGetFile(Var:TLLVMMetadataRef):TLLVMMetadataRef;cdecl;external;
{*
 * Get the metadata of the scope associated with a given variable.
 * \param Var     The variable object.
 *
 * @see DIVariable::getScope()
  }
function LLVMDIVariableGetScope(Var:TLLVMMetadataRef):TLLVMMetadataRef;cdecl;external;
{*
 * Get the source line where this \c DIVariable is declared.
 * \param Var     The DIVariable.
 *
 * @see DIVariable::getLine()
  }
function LLVMDIVariableGetLine(Var:TLLVMMetadataRef):dword;cdecl;external;
{*
 * Create a new temporary \c MDNode.  Suitable for use in constructing cyclic
 * \c MDNode structures. A temporary \c MDNode is not uniqued, may be RAUW'd,
 * and must be manually deleted with \c LLVMDisposeTemporaryMDNode.
 * \param Ctx            The context in which to construct the temporary node.
 * \param Data           The metadata elements.
 * \param NumElements    Number of metadata elements.
  }
function LLVMTemporaryMDNode(Ctx:TLLVMContextRef; Data:PLLVMMetadataRef; NumElements:Tsize_t):TLLVMMetadataRef;cdecl;external;
{*
 * Deallocate a temporary node.
 *
 * Calls \c replaceAllUsesWith(nullptr) before deleting, so any remaining
 * references will be reset.
 * \param TempNode    The temporary metadata node.
  }
procedure LLVMDisposeTemporaryMDNode(TempNode:TLLVMMetadataRef);cdecl;external;
{*
 * Replace all uses of temporary metadata.
 * \param TempTargetMetadata    The temporary metadata node.
 * \param Replacement           The replacement metadata node.
  }
procedure LLVMMetadataReplaceAllUsesWith(TempTargetMetadata:TLLVMMetadataRef; Replacement:TLLVMMetadataRef);cdecl;external;
{*
 * Create a new descriptor for the specified global variable that is temporary
 * and meant to be RAUWed.
 * \param Scope       Variable scope.
 * \param Name        Name of the variable.
 * \param NameLen     The length of the C string passed to \c Name.
 * \param Linkage     Mangled  name of the variable.
 * \param LnkLen      The length of the C string passed to \c Linkage.
 * \param File        File where this variable is defined.
 * \param LineNo      Line number.
 * \param Ty          Variable Type.
 * \param LocalToUnit Boolean flag indicate whether this variable is
 *                    externally visible or not.
 * \param Decl        Reference to the corresponding declaration.
 * \param AlignInBits Variable alignment(or 0 if no alignment attr was
 *                    specified)
  }
(* Const before type ignored *)
(* Const before type ignored *)
function LLVMDIBuilderCreateTempGlobalVariableFwdDecl(Builder:TLLVMDIBuilderRef; Scope:TLLVMMetadataRef; Name:Pchar; NameLen:Tsize_t; Linkage:Pchar; 
           LnkLen:Tsize_t; File:TLLVMMetadataRef; LineNo:dword; Ty:TLLVMMetadataRef; LocalToUnit:TLLVMBool; 
           Decl:TLLVMMetadataRef; AlignInBits:Tuint32_t):TLLVMMetadataRef;cdecl;external;
{*
 * Only use in "new debug format" (LLVMIsNewDbgInfoFormat() is true).
 * See https://llvm.org/docs/RemoveDIsDebugInfo.html#c-api-changes
 *
 * The debug format can be switched later after inserting the records using
 * LLVMSetIsNewDbgInfoFormat, if needed for legacy or transitionary reasons.
 *
 * Insert a Declare DbgRecord before the given instruction.
 * \param Builder     The DIBuilder.
 * \param Storage     The storage of the variable to declare.
 * \param VarInfo     The variable's debug info descriptor.
 * \param Expr        A complex location expression for the variable.
 * \param DebugLoc    Debug info location.
 * \param Instr       Instruction acting as a location for the new record.
  }
function LLVMDIBuilderInsertDeclareRecordBefore(Builder:TLLVMDIBuilderRef; Storage:TLLVMValueRef; VarInfo:TLLVMMetadataRef; Expr:TLLVMMetadataRef; DebugLoc:TLLVMMetadataRef; 
           Instr:TLLVMValueRef):TLLVMDbgRecordRef;cdecl;external;
{*
 * Only use in "new debug format" (LLVMIsNewDbgInfoFormat() is true).
 * See https://llvm.org/docs/RemoveDIsDebugInfo.html#c-api-changes
 *
 * The debug format can be switched later after inserting the records using
 * LLVMSetIsNewDbgInfoFormat, if needed for legacy or transitionary reasons.
 *
 * Insert a Declare DbgRecord at the end of the given basic block. If the basic
 * block has a terminator instruction, the record is inserted before that
 * terminator instruction.
 * \param Builder     The DIBuilder.
 * \param Storage     The storage of the variable to declare.
 * \param VarInfo     The variable's debug info descriptor.
 * \param Expr        A complex location expression for the variable.
 * \param DebugLoc    Debug info location.
 * \param Block       Basic block acting as a location for the new record.
  }
function LLVMDIBuilderInsertDeclareRecordAtEnd(Builder:TLLVMDIBuilderRef; Storage:TLLVMValueRef; VarInfo:TLLVMMetadataRef; Expr:TLLVMMetadataRef; DebugLoc:TLLVMMetadataRef; 
           Block:TLLVMBasicBlockRef):TLLVMDbgRecordRef;cdecl;external;
{*
 * Only use in "new debug format" (LLVMIsNewDbgInfoFormat() is true).
 * See https://llvm.org/docs/RemoveDIsDebugInfo.html#c-api-changes
 *
 * The debug format can be switched later after inserting the records using
 * LLVMSetIsNewDbgInfoFormat, if needed for legacy or transitionary reasons.
 *
 * Insert a new debug record before the given instruction.
 * \param Builder     The DIBuilder.
 * \param Val         The value of the variable.
 * \param VarInfo     The variable's debug info descriptor.
 * \param Expr        A complex location expression for the variable.
 * \param DebugLoc    Debug info location.
 * \param Instr       Instruction acting as a location for the new record.
  }
function LLVMDIBuilderInsertDbgValueRecordBefore(Builder:TLLVMDIBuilderRef; Val:TLLVMValueRef; VarInfo:TLLVMMetadataRef; Expr:TLLVMMetadataRef; DebugLoc:TLLVMMetadataRef; 
           Instr:TLLVMValueRef):TLLVMDbgRecordRef;cdecl;external;
{*
 * Only use in "new debug format" (LLVMIsNewDbgInfoFormat() is true).
 * See https://llvm.org/docs/RemoveDIsDebugInfo.html#c-api-changes
 *
 * The debug format can be switched later after inserting the records using
 * LLVMSetIsNewDbgInfoFormat, if needed for legacy or transitionary reasons.
 *
 * Insert a new debug record at the end of the given basic block. If the
 * basic block has a terminator instruction, the record is inserted before
 * that terminator instruction.
 * \param Builder     The DIBuilder.
 * \param Val         The value of the variable.
 * \param VarInfo     The variable's debug info descriptor.
 * \param Expr        A complex location expression for the variable.
 * \param DebugLoc    Debug info location.
 * \param Block       Basic block acting as a location for the new record.
  }
function LLVMDIBuilderInsertDbgValueRecordAtEnd(Builder:TLLVMDIBuilderRef; Val:TLLVMValueRef; VarInfo:TLLVMMetadataRef; Expr:TLLVMMetadataRef; DebugLoc:TLLVMMetadataRef; 
           Block:TLLVMBasicBlockRef):TLLVMDbgRecordRef;cdecl;external;
{*
 * Create a new descriptor for a local auto variable.
 * \param Builder         The DIBuilder.
 * \param Scope           The local scope the variable is declared in.
 * \param Name            Variable name.
 * \param NameLen         Length of variable name.
 * \param File            File where this variable is defined.
 * \param LineNo          Line number.
 * \param Ty              Metadata describing the type of the variable.
 * \param AlwaysPreserve  If true, this descriptor will survive optimizations.
 * \param Flags           Flags.
 * \param AlignInBits     Variable alignment.
  }
(* Const before type ignored *)
function LLVMDIBuilderCreateAutoVariable(Builder:TLLVMDIBuilderRef; Scope:TLLVMMetadataRef; Name:Pchar; NameLen:Tsize_t; File:TLLVMMetadataRef; 
           LineNo:dword; Ty:TLLVMMetadataRef; AlwaysPreserve:TLLVMBool; Flags:TLLVMDIFlags; AlignInBits:Tuint32_t):TLLVMMetadataRef;cdecl;external;
{*
 * Create a new descriptor for a function parameter variable.
 * \param Builder         The DIBuilder.
 * \param Scope           The local scope the variable is declared in.
 * \param Name            Variable name.
 * \param NameLen         Length of variable name.
 * \param ArgNo           Unique argument number for this variable; starts at 1.
 * \param File            File where this variable is defined.
 * \param LineNo          Line number.
 * \param Ty              Metadata describing the type of the variable.
 * \param AlwaysPreserve  If true, this descriptor will survive optimizations.
 * \param Flags           Flags.
  }
(* Const before type ignored *)
function LLVMDIBuilderCreateParameterVariable(Builder:TLLVMDIBuilderRef; Scope:TLLVMMetadataRef; Name:Pchar; NameLen:Tsize_t; ArgNo:dword; 
           File:TLLVMMetadataRef; LineNo:dword; Ty:TLLVMMetadataRef; AlwaysPreserve:TLLVMBool; Flags:TLLVMDIFlags):TLLVMMetadataRef;cdecl;external;
{*
 * Get the metadata of the subprogram attached to a function.
 *
 * @see llvm::Function::getSubprogram()
  }
function LLVMGetSubprogram(Func:TLLVMValueRef):TLLVMMetadataRef;cdecl;external;
{*
 * Set the subprogram attached to a function.
 *
 * @see llvm::Function::setSubprogram()
  }
procedure LLVMSetSubprogram(Func:TLLVMValueRef; SP:TLLVMMetadataRef);cdecl;external;
{*
 * Get the line associated with a given subprogram.
 * \param Subprogram     The subprogram object.
 *
 * @see DISubprogram::getLine()
  }
function LLVMDISubprogramGetLine(Subprogram:TLLVMMetadataRef):dword;cdecl;external;
{*
 * Get the debug location for the given instruction.
 *
 * @see llvm::Instruction::getDebugLoc()
  }
function LLVMInstructionGetDebugLoc(Inst:TLLVMValueRef):TLLVMMetadataRef;cdecl;external;
{*
 * Set the debug location for the given instruction.
 *
 * To clear the location metadata of the given instruction, pass NULL to \p Loc.
 *
 * @see llvm::Instruction::setDebugLoc()
  }
procedure LLVMInstructionSetDebugLoc(Inst:TLLVMValueRef; Loc:TLLVMMetadataRef);cdecl;external;
{*
 * Create a new descriptor for a label
 *
 * \param Builder         The DIBuilder.
 * \param Scope           The scope to create the label in.
 * \param Name            Variable name.
 * \param NameLen         Length of variable name.
 * \param File            The file to create the label in.
 * \param LineNo          Line Number.
 * \param AlwaysPreserve  Preserve the label regardless of optimization.
 *
 * @see llvm::DIBuilder::createLabel()
  }
(* Const before type ignored *)
function LLVMDIBuilderCreateLabel(Builder:TLLVMDIBuilderRef; Context:TLLVMMetadataRef; Name:Pchar; NameLen:Tsize_t; File:TLLVMMetadataRef; 
           LineNo:dword; AlwaysPreserve:TLLVMBool):TLLVMMetadataRef;cdecl;external;
{*
 * Insert a new llvm.dbg.label intrinsic call
 *
 * \param Builder         The DIBuilder.
 * \param LabelInfo       The Label's debug info descriptor
 * \param Location        The debug info location
 * \param InsertBefore    Location for the new intrinsic.
 *
 * @see llvm::DIBuilder::insertLabel()
  }
function LLVMDIBuilderInsertLabelBefore(Builder:TLLVMDIBuilderRef; LabelInfo:TLLVMMetadataRef; Location:TLLVMMetadataRef; InsertBefore:TLLVMValueRef):TLLVMDbgRecordRef;cdecl;external;
{*
 * Insert a new llvm.dbg.label intrinsic call
 *
 * \param Builder         The DIBuilder.
 * \param LabelInfo       The Label's debug info descriptor
 * \param Location        The debug info location
 * \param InsertAtEnd     Location for the new intrinsic.
 *
 * @see llvm::DIBuilder::insertLabel()
  }
function LLVMDIBuilderInsertLabelAtEnd(Builder:TLLVMDIBuilderRef; LabelInfo:TLLVMMetadataRef; Location:TLLVMMetadataRef; InsertAtEnd:TLLVMBasicBlockRef):TLLVMDbgRecordRef;cdecl;external;
{*
 * Obtain the enumerated type of a Metadata instance.
 *
 * @see llvm::Metadata::getMetadataID()
  }
function LLVMGetMetadataKind(Metadata:TLLVMMetadataRef):TLLVMMetadataKind;cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
