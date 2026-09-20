unit Error;

interface

uses
  fp_llvm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===------- llvm-c/Error.h - llvm::Error class C Interface -------*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This file defines the C interface to LLVM's Error class.                   *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_C_ERROR_H}
{$define LLVM_C_ERROR_H}
{$include "llvm-c/ExternC.h"}
{*
 * @defgroup LLVMCError Error Handling
 * @ingroup LLVMC
 *
 * @
  }

const
  LLVMErrorSuccess = 0;  
{*
 * Opaque reference to an error instance. Null serves as the 'success' value.
  }
type
  PLLVMErrorRef = ^TLLVMErrorRef;
  TLLVMErrorRef = PLLVMOpaqueError;
{*
 * Error type identifier.
  }

  PLLVMErrorTypeId = ^TLLVMErrorTypeId;
  TLLVMErrorTypeId = pointer;
{*
 * Returns the type id for the given error instance, which must be a failure
 * value (i.e. non-null).
  }

function LLVMGetErrorTypeId(Err:TLLVMErrorRef):TLLVMErrorTypeId;cdecl;external libllvm;
{*
 * Dispose of the given error without handling it. This operation consumes the
 * error, and the given LLVMErrorRef value is not usable once this call returns.
 * Note: This method *only* needs to be called if the error is not being passed
 * to some other consuming operation, e.g. LLVMGetErrorMessage.
  }
procedure LLVMConsumeError(Err:TLLVMErrorRef);cdecl;external libllvm;
{*
 * Report a fatal error if Err is a failure value.
 *
 * This function can be used to wrap calls to fallible functions ONLY when it is
 * known that the Error will always be a success value.
  }
procedure LLVMCantFail(Err:TLLVMErrorRef);cdecl;external libllvm;
{*
 * Returns the given string's error message. This operation consumes the error,
 * and the given LLVMErrorRef value is not usable once this call returns.
 * The caller is responsible for disposing of the string by calling
 * LLVMDisposeErrorMessage.
  }
function LLVMGetErrorMessage(Err:TLLVMErrorRef):Pchar;cdecl;external libllvm;
{*
 * Dispose of the given error message.
  }
procedure LLVMDisposeErrorMessage(ErrMsg:Pchar);cdecl;external libllvm;
{*
 * Returns the type id for llvm StringError.
  }
function LLVMGetStringErrorTypeId:TLLVMErrorTypeId;cdecl;external libllvm;
{*
 * Create a StringError.
  }
function LLVMCreateStringError(ErrMsg:Pchar):TLLVMErrorRef;cdecl;external libllvm;
{*
 * @
  }
{$endif}

// === Konventiert am: 20-9-26 17:06:31 ===


implementation



end.
