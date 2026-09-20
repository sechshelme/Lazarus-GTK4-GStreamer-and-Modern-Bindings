unit BitWriter;

interface

uses
  fp_llvm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- llvm-c/BitWriter.h - BitWriter Library C Interface ------*- C++ -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header declares the C interface to libLLVMBitWriter.a, which          *|
|* implements output of the LLVM bitcode format.                              *|
|*                                                                            *|
|* Many exotic languages can interoperate with C code but have a harder time  *|
|* with C++ due to name mangling. So in addition to C, this interface enables *|
|* tools written in such languages.                                           *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_C_BITWRITER_H}
{$define LLVM_C_BITWRITER_H}
{$include "llvm-c/ExternC.h"}
{$include "llvm-c/Types.h"}
{*
 * @defgroup LLVMCBitWriter Bit Writer
 * @ingroup LLVMC
 *
 * @
  }
{===-- Operations on modules ---------------------------------------------=== }
{* Writes a module to the specified path. Returns 0 on success.  }

function LLVMWriteBitcodeToFile(M:TLLVMModuleRef; Path:Pchar):longint;cdecl;external libllvm;
{* Writes a module to an open file descriptor. Returns 0 on success.  }
function LLVMWriteBitcodeToFD(M:TLLVMModuleRef; FD:longint; ShouldClose:longint; Unbuffered:longint):longint;cdecl;external libllvm;
{* Deprecated for LLVMWriteBitcodeToFD. Writes a module to an open file
    descriptor. Returns 0 on success. Closes the Handle.  }
function LLVMWriteBitcodeToFileHandle(M:TLLVMModuleRef; Handle:longint):longint;cdecl;external libllvm;
{* Writes a module to a new memory buffer and returns it.  }
function LLVMWriteBitcodeToMemoryBuffer(M:TLLVMModuleRef):TLLVMMemoryBufferRef;cdecl;external libllvm;
{*
 * @
  }
{$endif}

// === Konventiert am: 20-9-26 16:00:07 ===


implementation



end.
