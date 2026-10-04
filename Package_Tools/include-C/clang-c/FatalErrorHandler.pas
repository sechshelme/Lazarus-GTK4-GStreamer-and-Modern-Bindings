unit FatalErrorHandler;

interface

uses
  fp_clang;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- clang-c/FatalErrorHandler.h - Fatal Error Handling --------*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_CLANG_C_FATAL_ERROR_HANDLER_H}
{$define LLVM_CLANG_C_FATAL_ERROR_HANDLER_H}
{$include "clang-c/ExternC.h"}
{*
 * Installs error handler that prints error message to stderr and calls abort().
 * Replaces currently installed error handler (if any).
  }

procedure clang_install_aborting_llvm_fatal_error_handler;cdecl;external libgclang;
{*
 * Removes currently installed error handler (if any).
 * If no error handler is intalled, the default strategy is to print error
 * message to stderr and call exit(1).
  }
procedure clang_uninstall_llvm_fatal_error_handler;cdecl;external libgclang;
{$endif}

// === Konventiert am: 4-10-26 17:29:45 ===


implementation



end.
