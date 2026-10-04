unit CXErrorCode;

interface

uses
  fp_clang;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- clang-c/CXErrorCode.h - C Index Error Codes  --------------*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header provides the CXErrorCode enumerators.                          *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_CLANG_C_CXERRORCODE_H}
{$define LLVM_CLANG_C_CXERRORCODE_H}
{$include "clang-c/ExternC.h"}
{$include "clang-c/Platform.h"}
{*
 * Error codes returned by libclang routines.
 *
 * Zero (\c CXError_Success) is the only error code indicating success.  Other
 * error codes, including not yet assigned non-zero values, indicate errors.
  }
{*
   * No error.
    }
{*
   * A generic error code, no further details are available.
   *
   * Errors of this kind can get their own specific error codes in future
   * libclang versions.
    }
{*
   * libclang crashed while performing the requested operation.
    }
{*
   * The function detected that the arguments violate the function
   * contract.
    }
{*
   * An AST deserialization error has occurred.
    }
type
  TCXErrorCode =  Longint;
  Const
    CXError_Success = 0;
    CXError_Failure = 1;
    CXError_Crashed = 2;
    CXError_InvalidArguments = 3;
    CXError_ASTReadError = 4;

{$endif}

// === Konventiert am: 4-10-26 17:29:56 ===


implementation



end.
