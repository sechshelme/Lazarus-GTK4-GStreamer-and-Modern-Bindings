unit Support;

interface

uses
  fp_llvm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- llvm-c/Support.h - Support C Interface --------------------*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This file defines the C interface to the LLVM support library.             *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_C_SUPPORT_H}
{$define LLVM_C_SUPPORT_H}
{$include "llvm-c/DataTypes.h"}
{$include "llvm-c/ExternC.h"}
{$include "llvm-c/Types.h"}
{*
 * @addtogroup LLVMCCore
 *
 * @
  }
{*
 * This function permanently loads the dynamic library at the given path.
 * It is safe to call this function multiple times for the same library.
 *
 * @see sys::DynamicLibrary::LoadLibraryPermanently()
   }

function LLVMLoadLibraryPermanently(Filename:Pchar):TLLVMBool;cdecl;external libllvm;
{*
 * This function parses the given arguments using the LLVM command line parser.
 * Note that the only stable thing about this function is its signature; you
 * cannot rely on any particular set of command line arguments being interpreted
 * the same way across LLVM versions.
 *
 * @see llvm::cl::ParseCommandLineOptions()
  }
procedure LLVMParseCommandLineOptions(argc:longint; argv:PPchar; Overview:Pchar);cdecl;external libllvm;
{*
 * This function will search through all previously loaded dynamic
 * libraries for the symbol \p symbolName. If it is found, the address of
 * that symbol is returned. If not, null is returned.
 *
 * @see sys::DynamicLibrary::SearchForAddressOfSymbol()
  }
function LLVMSearchForAddressOfSymbol(symbolName:Pchar):pointer;cdecl;external libllvm;
{*
 * This functions permanently adds the symbol \p symbolName with the
 * value \p symbolValue.  These symbols are searched before any
 * libraries.
 *
 * @see sys::DynamicLibrary::AddSymbol()
  }
procedure LLVMAddSymbol(symbolName:Pchar; symbolValue:pointer);cdecl;external libllvm;
{*
 * @
  }
{$endif}

// === Konventiert am: 20-9-26 17:11:06 ===


implementation



end.
