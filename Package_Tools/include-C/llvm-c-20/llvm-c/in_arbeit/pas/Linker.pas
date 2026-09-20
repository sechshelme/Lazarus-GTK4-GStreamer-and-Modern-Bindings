unit Linker;

interface

uses
  fp_llvm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- llvm-c/Linker.h - Module Linker C Interface -------------*- C++ -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This file defines the C interface to the module/file/archive linker.       *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_C_LINKER_H}
{$define LLVM_C_LINKER_H}
{$include "llvm-c/ExternC.h"}
{$include "llvm-c/Types.h"}
{*
 * @defgroup LLVMCCoreLinker Linker
 * @ingroup LLVMCCore
 *
 * @
  }
{ This enum is provided for backwards-compatibility only. It has no effect.  }
{ This is the default behavior.  }
{ This option has been deprecated and
                                          should not be used.  }
type
  PLLVMLinkerMode = ^TLLVMLinkerMode;
  TLLVMLinkerMode =  Longint;
  Const
    LLVMLinkerDestroySource = 0;
    LLVMLinkerPreserveSource_Removed = 1;
;
{ Links the source module into the destination module. The source module is
 * destroyed.
 * The return value is true if an error occurred, false otherwise.
 * Use the diagnostic handler to get any diagnostic message.
 }

function LLVMLinkModules2(Dest:TLLVMModuleRef; Src:TLLVMModuleRef):TLLVMBool;cdecl;external libllvm;
{*
 * @
  }
{$endif}

// === Konventiert am: 20-9-26 17:06:39 ===


implementation



end.
