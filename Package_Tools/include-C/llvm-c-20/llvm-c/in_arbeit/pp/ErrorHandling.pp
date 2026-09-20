
unit ErrorHandling;
interface

{
  Automatically converted by H2Pas 1.0.0 from ErrorHandling.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ErrorHandling.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- llvm-c/ErrorHandling.h - Error Handling C Interface -------*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This file defines the C interface to LLVM's error handling mechanism.      *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_C_ERRORHANDLING_H}
{$define LLVM_C_ERRORHANDLING_H}
{$include "llvm-c/ExternC.h"}
{*
 * @addtogroup LLVMCError
 *
 * @
  }
(* Const before type ignored *)
type

  TLLVMFatalErrorHandler = procedure (Reason:Pchar);cdecl;
{*
 * Install a fatal error handler. By default, if LLVM detects a fatal error, it
 * will call exit(1). This may not be appropriate in many contexts. For example,
 * doing exit(1) will bypass many crash reporting/tracing system tools. This
 * function allows you to install a callback that will be invoked prior to the
 * call to exit(1).
  }

procedure LLVMInstallFatalErrorHandler(Handler:TLLVMFatalErrorHandler);cdecl;external;
{*
 * Reset the fatal error handler. This resets LLVM's fatal error handling
 * behavior to the default.
  }
procedure LLVMResetFatalErrorHandler;cdecl;external;
{*
 * Enable LLVM's built-in stack trace code. This intercepts the OS's crash
 * signals and prints which component of LLVM you were in at the time if the
 * crash.
  }
procedure LLVMEnablePrettyStackTrace;cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
