
unit Analysis;
interface

{
  Automatically converted by H2Pas 1.0.0 from Analysis.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Analysis.h
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
PLLVMVerifierFailureAction  = ^LLVMVerifierFailureAction;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- llvm-c/Analysis.h - Analysis Library C Interface --------*- C++ -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header declares the C interface to libLLVMAnalysis.a, which           *|
|* implements various analyses of the LLVM IR.                                *|
|*                                                                            *|
|* Many exotic languages can interoperate with C code but have a harder time  *|
|* with C++ due to name mangling. So in addition to C, this interface enables *|
|* tools written in such languages.                                           *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_C_ANALYSIS_H}
{$define LLVM_C_ANALYSIS_H}
{$include "llvm-c/ExternC.h"}
{$include "llvm-c/Types.h"}
{*
 * @defgroup LLVMCAnalysis Analysis
 * @ingroup LLVMC
 *
 * @
  }
{ verifier will print to stderr and abort()  }
{ verifier will print to stderr and return 1  }
{ verifier will just return 1  }
type
  PLLVMVerifierFailureAction = ^TLLVMVerifierFailureAction;
  TLLVMVerifierFailureAction =  Longint;
  Const
    LLVMAbortProcessAction = 0;
    LLVMPrintMessageAction = 1;
    LLVMReturnStatusAction = 2;
;
{ Verifies that a module is valid, taking the specified action if not.
   Optionally returns a human-readable description of any invalid constructs.
   OutMessage must be disposed with LLVMDisposeMessage.  }

function LLVMVerifyModule(M:TLLVMModuleRef; Action:TLLVMVerifierFailureAction; OutMessage:PPchar):TLLVMBool;cdecl;external;
{ Verifies that a single function is valid, taking the specified action. Useful
   for debugging.  }
function LLVMVerifyFunction(Fn:TLLVMValueRef; Action:TLLVMVerifierFailureAction):TLLVMBool;cdecl;external;
{ Open up a ghostview window that displays the CFG of the current function.
   Useful for debugging.  }
procedure LLVMViewFunctionCFG(Fn:TLLVMValueRef);cdecl;external;
procedure LLVMViewFunctionCFGOnly(Fn:TLLVMValueRef);cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
