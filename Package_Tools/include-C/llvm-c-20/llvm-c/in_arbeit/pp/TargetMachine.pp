
unit TargetMachine;
interface

{
  Automatically converted by H2Pas 1.0.0 from TargetMachine.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    TargetMachine.h
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
PLLVMCodeGenFileType  = ^LLVMCodeGenFileType;
PLLVMCodeGenOptLevel  = ^LLVMCodeGenOptLevel;
PLLVMCodeModel  = ^LLVMCodeModel;
PLLVMGlobalISelAbortMode  = ^LLVMGlobalISelAbortMode;
PLLVMMemoryBufferRef  = ^LLVMMemoryBufferRef;
PLLVMOpaqueTargetMachine  = ^LLVMOpaqueTargetMachine;
PLLVMOpaqueTargetMachineOptions  = ^LLVMOpaqueTargetMachineOptions;
PLLVMRelocMode  = ^LLVMRelocMode;
PLLVMTarget  = ^LLVMTarget;
PLLVMTargetMachineOptionsRef  = ^LLVMTargetMachineOptionsRef;
PLLVMTargetMachineRef  = ^LLVMTargetMachineRef;
PLLVMTargetRef  = ^LLVMTargetRef;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- llvm-c/TargetMachine.h - Target Machine Library C Interface - C++ -*-=*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header declares the C interface to the Target and TargetMachine       *|
|* classes, which can be used to generate assembly or object files.           *|
|*                                                                            *|
|* Many exotic languages can interoperate with C code but have a harder time  *|
|* with C++ due to name mangling. So in addition to C, this interface enables *|
|* tools written in such languages.                                           *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_C_TARGETMACHINE_H}
{$define LLVM_C_TARGETMACHINE_H}
{$include "llvm-c/ExternC.h"}
{$include "llvm-c/Target.h"}
{$include "llvm-c/Types.h"}
{*
 * @addtogroup LLVMCTarget
 *
 * @
  }
type
  PLLVMTargetMachineOptionsRef = ^TLLVMTargetMachineOptionsRef;
  TLLVMTargetMachineOptionsRef = PLLVMOpaqueTargetMachineOptions;

  PLLVMTargetMachineRef = ^TLLVMTargetMachineRef;
  TLLVMTargetMachineRef = PLLVMOpaqueTargetMachine;

  PLLVMTargetRef = ^TLLVMTargetRef;
  TLLVMTargetRef = PLLVMTarget;

  PLLVMCodeGenOptLevel = ^TLLVMCodeGenOptLevel;
  TLLVMCodeGenOptLevel =  Longint;
  Const
    LLVMCodeGenLevelNone = 0;
    LLVMCodeGenLevelLess = 1;
    LLVMCodeGenLevelDefault = 2;
    LLVMCodeGenLevelAggressive = 3;
;
type
  PLLVMRelocMode = ^TLLVMRelocMode;
  TLLVMRelocMode =  Longint;
  Const
    LLVMRelocDefault = 0;
    LLVMRelocStatic = 1;
    LLVMRelocPIC = 2;
    LLVMRelocDynamicNoPic = 3;
    LLVMRelocROPI = 4;
    LLVMRelocRWPI = 5;
    LLVMRelocROPI_RWPI = 6;
;
type
  PLLVMCodeModel = ^TLLVMCodeModel;
  TLLVMCodeModel =  Longint;
  Const
    LLVMCodeModelDefault = 0;
    LLVMCodeModelJITDefault = 1;
    LLVMCodeModelTiny = 2;
    LLVMCodeModelSmall = 3;
    LLVMCodeModelKernel = 4;
    LLVMCodeModelMedium = 5;
    LLVMCodeModelLarge = 6;
;
type
  PLLVMCodeGenFileType = ^TLLVMCodeGenFileType;
  TLLVMCodeGenFileType =  Longint;
  Const
    LLVMAssemblyFile = 0;
    LLVMObjectFile = 1;
;
type
  PLLVMGlobalISelAbortMode = ^TLLVMGlobalISelAbortMode;
  TLLVMGlobalISelAbortMode =  Longint;
  Const
    LLVMGlobalISelAbortEnable = 0;
    LLVMGlobalISelAbortDisable = 1;
    LLVMGlobalISelAbortDisableWithDiag = 2;
;
{* Returns the first llvm::Target in the registered targets list.  }

function LLVMGetFirstTarget:TLLVMTargetRef;cdecl;external;
{* Returns the next llvm::Target given a previous one (or null if there's none)  }
function LLVMGetNextTarget(T:TLLVMTargetRef):TLLVMTargetRef;cdecl;external;
{===-- Target ------------------------------------------------------------=== }
{* Finds the target corresponding to the given name and stores it in \p T.
  Returns 0 on success.  }
(* Const before type ignored *)
function LLVMGetTargetFromName(Name:Pchar):TLLVMTargetRef;cdecl;external;
{* Finds the target corresponding to the given triple and stores it in \p T.
  Returns 0 on success. Optionally returns any error in ErrorMessage.
  Use LLVMDisposeMessage to dispose the message.  }
(* Const before type ignored *)
function LLVMGetTargetFromTriple(Triple:Pchar; T:PLLVMTargetRef; ErrorMessage:PPchar):TLLVMBool;cdecl;external;
{* Returns the name of a target. See llvm::Target::getName  }
(* Const before type ignored *)
function LLVMGetTargetName(T:TLLVMTargetRef):Pchar;cdecl;external;
{* Returns the description  of a target. See llvm::Target::getDescription  }
(* Const before type ignored *)
function LLVMGetTargetDescription(T:TLLVMTargetRef):Pchar;cdecl;external;
{* Returns if the target has a JIT  }
function LLVMTargetHasJIT(T:TLLVMTargetRef):TLLVMBool;cdecl;external;
{* Returns if the target has a TargetMachine associated  }
function LLVMTargetHasTargetMachine(T:TLLVMTargetRef):TLLVMBool;cdecl;external;
{* Returns if the target as an ASM backend (required for emitting output)  }
function LLVMTargetHasAsmBackend(T:TLLVMTargetRef):TLLVMBool;cdecl;external;
{===-- Target Machine ----------------------------------------------------=== }
{*
 * Create a new set of options for an llvm::TargetMachine.
 *
 * The returned option structure must be released with
 * LLVMDisposeTargetMachineOptions() after the call to
 * LLVMCreateTargetMachineWithOptions().
  }
function LLVMCreateTargetMachineOptions:TLLVMTargetMachineOptionsRef;cdecl;external;
{*
 * Dispose of an LLVMTargetMachineOptionsRef instance.
  }
procedure LLVMDisposeTargetMachineOptions(Options:TLLVMTargetMachineOptionsRef);cdecl;external;
(* Const before type ignored *)
procedure LLVMTargetMachineOptionsSetCPU(Options:TLLVMTargetMachineOptionsRef; CPU:Pchar);cdecl;external;
{*
 * Set the list of features for the target machine.
 *
 * \param Features a comma-separated list of features.
  }
(* Const before type ignored *)
procedure LLVMTargetMachineOptionsSetFeatures(Options:TLLVMTargetMachineOptionsRef; Features:Pchar);cdecl;external;
(* Const before type ignored *)
procedure LLVMTargetMachineOptionsSetABI(Options:TLLVMTargetMachineOptionsRef; ABI:Pchar);cdecl;external;
procedure LLVMTargetMachineOptionsSetCodeGenOptLevel(Options:TLLVMTargetMachineOptionsRef; Level:TLLVMCodeGenOptLevel);cdecl;external;
procedure LLVMTargetMachineOptionsSetRelocMode(Options:TLLVMTargetMachineOptionsRef; Reloc:TLLVMRelocMode);cdecl;external;
procedure LLVMTargetMachineOptionsSetCodeModel(Options:TLLVMTargetMachineOptionsRef; CodeModel:TLLVMCodeModel);cdecl;external;
{*
 * Create a new llvm::TargetMachine.
 *
 * \param T the target to create a machine for.
 * \param Triple a triple describing the target machine.
 * \param Options additional configuration (see
 *                LLVMCreateTargetMachineOptions()).
  }
(* Const before type ignored *)
function LLVMCreateTargetMachineWithOptions(T:TLLVMTargetRef; Triple:Pchar; Options:TLLVMTargetMachineOptionsRef):TLLVMTargetMachineRef;cdecl;external;
{* Creates a new llvm::TargetMachine. See llvm::Target::createTargetMachine  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function LLVMCreateTargetMachine(T:TLLVMTargetRef; Triple:Pchar; CPU:Pchar; Features:Pchar; Level:TLLVMCodeGenOptLevel; 
           Reloc:TLLVMRelocMode; CodeModel:TLLVMCodeModel):TLLVMTargetMachineRef;cdecl;external;
{* Dispose the LLVMTargetMachineRef instance generated by
  LLVMCreateTargetMachine.  }
procedure LLVMDisposeTargetMachine(T:TLLVMTargetMachineRef);cdecl;external;
{* Returns the Target used in a TargetMachine  }
function LLVMGetTargetMachineTarget(T:TLLVMTargetMachineRef):TLLVMTargetRef;cdecl;external;
{* Returns the triple used creating this target machine. See
  llvm::TargetMachine::getTriple. The result needs to be disposed with
  LLVMDisposeMessage.  }
function LLVMGetTargetMachineTriple(T:TLLVMTargetMachineRef):Pchar;cdecl;external;
{* Returns the cpu used creating this target machine. See
  llvm::TargetMachine::getCPU. The result needs to be disposed with
  LLVMDisposeMessage.  }
function LLVMGetTargetMachineCPU(T:TLLVMTargetMachineRef):Pchar;cdecl;external;
{* Returns the feature string used creating this target machine. See
  llvm::TargetMachine::getFeatureString. The result needs to be disposed with
  LLVMDisposeMessage.  }
function LLVMGetTargetMachineFeatureString(T:TLLVMTargetMachineRef):Pchar;cdecl;external;
{* Create a DataLayout based on the targetMachine.  }
function LLVMCreateTargetDataLayout(T:TLLVMTargetMachineRef):TLLVMTargetDataRef;cdecl;external;
{* Set the target machine's ASM verbosity.  }
procedure LLVMSetTargetMachineAsmVerbosity(T:TLLVMTargetMachineRef; VerboseAsm:TLLVMBool);cdecl;external;
{* Enable fast-path instruction selection.  }
procedure LLVMSetTargetMachineFastISel(T:TLLVMTargetMachineRef; Enable:TLLVMBool);cdecl;external;
{* Enable global instruction selection.  }
procedure LLVMSetTargetMachineGlobalISel(T:TLLVMTargetMachineRef; Enable:TLLVMBool);cdecl;external;
{* Set abort behaviour when global instruction selection fails to lower/select
 * an instruction.  }
procedure LLVMSetTargetMachineGlobalISelAbort(T:TLLVMTargetMachineRef; Mode:TLLVMGlobalISelAbortMode);cdecl;external;
{* Enable the MachineOutliner pass.  }
procedure LLVMSetTargetMachineMachineOutliner(T:TLLVMTargetMachineRef; Enable:TLLVMBool);cdecl;external;
{* Emits an asm or object file for the given module to the filename. This
  wraps several c++ only classes (among them a file stream). Returns any
  error in ErrorMessage. Use LLVMDisposeMessage to dispose the message.  }
(* Const before type ignored *)
function LLVMTargetMachineEmitToFile(T:TLLVMTargetMachineRef; M:TLLVMModuleRef; Filename:Pchar; codegen:TLLVMCodeGenFileType; ErrorMessage:PPchar):TLLVMBool;cdecl;external;
{* Compile the LLVM IR stored in \p M and store the result in \p OutMemBuf.  }
function LLVMTargetMachineEmitToMemoryBuffer(T:TLLVMTargetMachineRef; M:TLLVMModuleRef; codegen:TLLVMCodeGenFileType; ErrorMessage:PPchar; OutMemBuf:PLLVMMemoryBufferRef):TLLVMBool;cdecl;external;
{===-- Triple ------------------------------------------------------------=== }
{* Get a triple for the host machine as a string. The result needs to be
  disposed with LLVMDisposeMessage.  }
function LLVMGetDefaultTargetTriple:Pchar;cdecl;external;
{* Normalize a target triple. The result needs to be disposed with
  LLVMDisposeMessage.  }
(* Const before type ignored *)
function LLVMNormalizeTargetTriple(triple:Pchar):Pchar;cdecl;external;
{* Get the host CPU as a string. The result needs to be disposed with
  LLVMDisposeMessage.  }
function LLVMGetHostCPUName:Pchar;cdecl;external;
{* Get the host CPU's features as a string. The result needs to be disposed
  with LLVMDisposeMessage.  }
function LLVMGetHostCPUFeatures:Pchar;cdecl;external;
{* Adds the target-specific analysis passes to the pass manager.  }
procedure LLVMAddAnalysisPasses(T:TLLVMTargetMachineRef; PM:TLLVMPassManagerRef);cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
