unit TargetMachine;

interface

uses
  fp_llvm;

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

function LLVMGetFirstTarget:TLLVMTargetRef;cdecl;external libllvm;
{* Returns the next llvm::Target given a previous one (or null if there's none)  }
function LLVMGetNextTarget(T:TLLVMTargetRef):TLLVMTargetRef;cdecl;external libllvm;
{===-- Target ------------------------------------------------------------=== }
{* Finds the target corresponding to the given name and stores it in \p T.
  Returns 0 on success.  }
function LLVMGetTargetFromName(Name:Pchar):TLLVMTargetRef;cdecl;external libllvm;
{* Finds the target corresponding to the given triple and stores it in \p T.
  Returns 0 on success. Optionally returns any error in ErrorMessage.
  Use LLVMDisposeMessage to dispose the message.  }
function LLVMGetTargetFromTriple(Triple:Pchar; T:PLLVMTargetRef; ErrorMessage:PPchar):TLLVMBool;cdecl;external libllvm;
{* Returns the name of a target. See llvm::Target::getName  }
function LLVMGetTargetName(T:TLLVMTargetRef):Pchar;cdecl;external libllvm;
{* Returns the description  of a target. See llvm::Target::getDescription  }
function LLVMGetTargetDescription(T:TLLVMTargetRef):Pchar;cdecl;external libllvm;
{* Returns if the target has a JIT  }
function LLVMTargetHasJIT(T:TLLVMTargetRef):TLLVMBool;cdecl;external libllvm;
{* Returns if the target has a TargetMachine associated  }
function LLVMTargetHasTargetMachine(T:TLLVMTargetRef):TLLVMBool;cdecl;external libllvm;
{* Returns if the target as an ASM backend (required for emitting output)  }
function LLVMTargetHasAsmBackend(T:TLLVMTargetRef):TLLVMBool;cdecl;external libllvm;
{===-- Target Machine ----------------------------------------------------=== }
{*
 * Create a new set of options for an llvm::TargetMachine.
 *
 * The returned option structure must be released with
 * LLVMDisposeTargetMachineOptions() after the call to
 * LLVMCreateTargetMachineWithOptions().
  }
function LLVMCreateTargetMachineOptions:TLLVMTargetMachineOptionsRef;cdecl;external libllvm;
{*
 * Dispose of an LLVMTargetMachineOptionsRef instance.
  }
procedure LLVMDisposeTargetMachineOptions(Options:TLLVMTargetMachineOptionsRef);cdecl;external libllvm;
procedure LLVMTargetMachineOptionsSetCPU(Options:TLLVMTargetMachineOptionsRef; CPU:Pchar);cdecl;external libllvm;
{*
 * Set the list of features for the target machine.
 *
 * \param Features a comma-separated list of features.
  }
procedure LLVMTargetMachineOptionsSetFeatures(Options:TLLVMTargetMachineOptionsRef; Features:Pchar);cdecl;external libllvm;
procedure LLVMTargetMachineOptionsSetABI(Options:TLLVMTargetMachineOptionsRef; ABI:Pchar);cdecl;external libllvm;
procedure LLVMTargetMachineOptionsSetCodeGenOptLevel(Options:TLLVMTargetMachineOptionsRef; Level:TLLVMCodeGenOptLevel);cdecl;external libllvm;
procedure LLVMTargetMachineOptionsSetRelocMode(Options:TLLVMTargetMachineOptionsRef; Reloc:TLLVMRelocMode);cdecl;external libllvm;
procedure LLVMTargetMachineOptionsSetCodeModel(Options:TLLVMTargetMachineOptionsRef; CodeModel:TLLVMCodeModel);cdecl;external libllvm;
{*
 * Create a new llvm::TargetMachine.
 *
 * \param T the target to create a machine for.
 * \param Triple a triple describing the target machine.
 * \param Options additional configuration (see
 *                LLVMCreateTargetMachineOptions()).
  }
function LLVMCreateTargetMachineWithOptions(T:TLLVMTargetRef; Triple:Pchar; Options:TLLVMTargetMachineOptionsRef):TLLVMTargetMachineRef;cdecl;external libllvm;
{* Creates a new llvm::TargetMachine. See llvm::Target::createTargetMachine  }
function LLVMCreateTargetMachine(T:TLLVMTargetRef; Triple:Pchar; CPU:Pchar; Features:Pchar; Level:TLLVMCodeGenOptLevel; 
           Reloc:TLLVMRelocMode; CodeModel:TLLVMCodeModel):TLLVMTargetMachineRef;cdecl;external libllvm;
{* Dispose the LLVMTargetMachineRef instance generated by
  LLVMCreateTargetMachine.  }
procedure LLVMDisposeTargetMachine(T:TLLVMTargetMachineRef);cdecl;external libllvm;
{* Returns the Target used in a TargetMachine  }
function LLVMGetTargetMachineTarget(T:TLLVMTargetMachineRef):TLLVMTargetRef;cdecl;external libllvm;
{* Returns the triple used creating this target machine. See
  llvm::TargetMachine::getTriple. The result needs to be disposed with
  LLVMDisposeMessage.  }
function LLVMGetTargetMachineTriple(T:TLLVMTargetMachineRef):Pchar;cdecl;external libllvm;
{* Returns the cpu used creating this target machine. See
  llvm::TargetMachine::getCPU. The result needs to be disposed with
  LLVMDisposeMessage.  }
function LLVMGetTargetMachineCPU(T:TLLVMTargetMachineRef):Pchar;cdecl;external libllvm;
{* Returns the feature string used creating this target machine. See
  llvm::TargetMachine::getFeatureString. The result needs to be disposed with
  LLVMDisposeMessage.  }
function LLVMGetTargetMachineFeatureString(T:TLLVMTargetMachineRef):Pchar;cdecl;external libllvm;
{* Create a DataLayout based on the targetMachine.  }
function LLVMCreateTargetDataLayout(T:TLLVMTargetMachineRef):TLLVMTargetDataRef;cdecl;external libllvm;
{* Set the target machine's ASM verbosity.  }
procedure LLVMSetTargetMachineAsmVerbosity(T:TLLVMTargetMachineRef; VerboseAsm:TLLVMBool);cdecl;external libllvm;
{* Enable fast-path instruction selection.  }
procedure LLVMSetTargetMachineFastISel(T:TLLVMTargetMachineRef; Enable:TLLVMBool);cdecl;external libllvm;
{* Enable global instruction selection.  }
procedure LLVMSetTargetMachineGlobalISel(T:TLLVMTargetMachineRef; Enable:TLLVMBool);cdecl;external libllvm;
{* Set abort behaviour when global instruction selection fails to lower/select
 * an instruction.  }
procedure LLVMSetTargetMachineGlobalISelAbort(T:TLLVMTargetMachineRef; Mode:TLLVMGlobalISelAbortMode);cdecl;external libllvm;
{* Enable the MachineOutliner pass.  }
procedure LLVMSetTargetMachineMachineOutliner(T:TLLVMTargetMachineRef; Enable:TLLVMBool);cdecl;external libllvm;
{* Emits an asm or object file for the given module to the filename. This
  wraps several c++ only classes (among them a file stream). Returns any
  error in ErrorMessage. Use LLVMDisposeMessage to dispose the message.  }
function LLVMTargetMachineEmitToFile(T:TLLVMTargetMachineRef; M:TLLVMModuleRef; Filename:Pchar; codegen:TLLVMCodeGenFileType; ErrorMessage:PPchar):TLLVMBool;cdecl;external libllvm;
{* Compile the LLVM IR stored in \p M and store the result in \p OutMemBuf.  }
function LLVMTargetMachineEmitToMemoryBuffer(T:TLLVMTargetMachineRef; M:TLLVMModuleRef; codegen:TLLVMCodeGenFileType; ErrorMessage:PPchar; OutMemBuf:PLLVMMemoryBufferRef):TLLVMBool;cdecl;external libllvm;
{===-- Triple ------------------------------------------------------------=== }
{* Get a triple for the host machine as a string. The result needs to be
  disposed with LLVMDisposeMessage.  }
function LLVMGetDefaultTargetTriple:Pchar;cdecl;external libllvm;
{* Normalize a target triple. The result needs to be disposed with
  LLVMDisposeMessage.  }
function LLVMNormalizeTargetTriple(triple:Pchar):Pchar;cdecl;external libllvm;
{* Get the host CPU as a string. The result needs to be disposed with
  LLVMDisposeMessage.  }
function LLVMGetHostCPUName:Pchar;cdecl;external libllvm;
{* Get the host CPU's features as a string. The result needs to be disposed
  with LLVMDisposeMessage.  }
function LLVMGetHostCPUFeatures:Pchar;cdecl;external libllvm;
{* Adds the target-specific analysis passes to the pass manager.  }
procedure LLVMAddAnalysisPasses(T:TLLVMTargetMachineRef; PM:TLLVMPassManagerRef);cdecl;external libllvm;
{*
 * @
  }
{$endif}

// === Konventiert am: 20-9-26 17:11:02 ===


implementation



end.
