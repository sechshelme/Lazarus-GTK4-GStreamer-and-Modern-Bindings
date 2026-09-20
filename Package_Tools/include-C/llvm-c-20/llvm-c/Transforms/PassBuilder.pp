
unit PassBuilder;
interface

{
  Automatically converted by H2Pas 1.0.0 from PassBuilder.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    PassBuilder.h
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
PLLVMOpaquePassBuilderOptions  = ^LLVMOpaquePassBuilderOptions;
PLLVMPassBuilderOptionsRef  = ^LLVMPassBuilderOptionsRef;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- llvm-c/Transform/PassBuilder.h - PassBuilder for LLVM C ---*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header contains the LLVM-C interface into the new pass manager        *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_C_TRANSFORMS_PASSBUILDER_H}
{$define LLVM_C_TRANSFORMS_PASSBUILDER_H}
{$include "llvm-c/Error.h"}
{$include "llvm-c/TargetMachine.h"}
{$include "llvm-c/Types.h"}
{*
 * @defgroup LLVMCCoreNewPM New Pass Manager
 * @ingroup LLVMCCore
 *
 * @
  }
{*
 * A set of options passed which are attached to the Pass Manager upon run.
 *
 * This corresponds to an llvm::LLVMPassBuilderOptions instance
 *
 * The details for how the different properties of this structure are used can
 * be found in the source for LLVMRunPasses
  }
type
  PLLVMPassBuilderOptionsRef = ^TLLVMPassBuilderOptionsRef;
  TLLVMPassBuilderOptionsRef = PLLVMOpaquePassBuilderOptions;
{*
 * Construct and run a set of passes over a module
 *
 * This function takes a string with the passes that should be used. The format
 * of this string is the same as opt's -passes argument for the new pass
 * manager. Individual passes may be specified, separated by commas. Full
 * pipelines may also be invoked using `default<O3>` and friends. See opt for
 * full reference of the Passes format.
  }
(* Const before type ignored *)

function LLVMRunPasses(M:TLLVMModuleRef; Passes:Pchar; TM:TLLVMTargetMachineRef; Options:TLLVMPassBuilderOptionsRef):TLLVMErrorRef;cdecl;external;
{*
 * Construct and run a set of passes over a function.
 *
 * This function behaves the same as LLVMRunPasses, but operates on a single
 * function instead of an entire module.
  }
(* Const before type ignored *)
function LLVMRunPassesOnFunction(F:TLLVMValueRef; Passes:Pchar; TM:TLLVMTargetMachineRef; Options:TLLVMPassBuilderOptionsRef):TLLVMErrorRef;cdecl;external;
{*
 * Create a new set of options for a PassBuilder
 *
 * Ownership of the returned instance is given to the client, and they are
 * responsible for it. The client should call LLVMDisposePassBuilderOptions
 * to free the pass builder options.
  }
function LLVMCreatePassBuilderOptions:TLLVMPassBuilderOptionsRef;cdecl;external;
{*
 * Toggle adding the VerifierPass for the PassBuilder, ensuring all functions
 * inside the module is valid.
  }
procedure LLVMPassBuilderOptionsSetVerifyEach(Options:TLLVMPassBuilderOptionsRef; VerifyEach:TLLVMBool);cdecl;external;
{*
 * Toggle debug logging when running the PassBuilder
  }
procedure LLVMPassBuilderOptionsSetDebugLogging(Options:TLLVMPassBuilderOptionsRef; DebugLogging:TLLVMBool);cdecl;external;
{*
 * Specify a custom alias analysis pipeline for the PassBuilder to be used
 * instead of the default one. The string argument is not copied; the caller
 * is responsible for ensuring it outlives the PassBuilderOptions instance.
  }
(* Const before type ignored *)
procedure LLVMPassBuilderOptionsSetAAPipeline(Options:TLLVMPassBuilderOptionsRef; AAPipeline:Pchar);cdecl;external;
procedure LLVMPassBuilderOptionsSetLoopInterleaving(Options:TLLVMPassBuilderOptionsRef; LoopInterleaving:TLLVMBool);cdecl;external;
procedure LLVMPassBuilderOptionsSetLoopVectorization(Options:TLLVMPassBuilderOptionsRef; LoopVectorization:TLLVMBool);cdecl;external;
procedure LLVMPassBuilderOptionsSetSLPVectorization(Options:TLLVMPassBuilderOptionsRef; SLPVectorization:TLLVMBool);cdecl;external;
procedure LLVMPassBuilderOptionsSetLoopUnrolling(Options:TLLVMPassBuilderOptionsRef; LoopUnrolling:TLLVMBool);cdecl;external;
procedure LLVMPassBuilderOptionsSetForgetAllSCEVInLoopUnroll(Options:TLLVMPassBuilderOptionsRef; ForgetAllSCEVInLoopUnroll:TLLVMBool);cdecl;external;
procedure LLVMPassBuilderOptionsSetLicmMssaOptCap(Options:TLLVMPassBuilderOptionsRef; LicmMssaOptCap:dword);cdecl;external;
procedure LLVMPassBuilderOptionsSetLicmMssaNoAccForPromotionCap(Options:TLLVMPassBuilderOptionsRef; LicmMssaNoAccForPromotionCap:dword);cdecl;external;
procedure LLVMPassBuilderOptionsSetCallGraphProfile(Options:TLLVMPassBuilderOptionsRef; CallGraphProfile:TLLVMBool);cdecl;external;
procedure LLVMPassBuilderOptionsSetMergeFunctions(Options:TLLVMPassBuilderOptionsRef; MergeFunctions:TLLVMBool);cdecl;external;
procedure LLVMPassBuilderOptionsSetInlinerThreshold(Options:TLLVMPassBuilderOptionsRef; Threshold:longint);cdecl;external;
{*
 * Dispose of a heap-allocated PassBuilderOptions instance
  }
procedure LLVMDisposePassBuilderOptions(Options:TLLVMPassBuilderOptionsRef);cdecl;external;
{*
 * @
  }
{$endif}
{ LLVM_C_TRANSFORMS_PASSBUILDER_H }

implementation


end.
