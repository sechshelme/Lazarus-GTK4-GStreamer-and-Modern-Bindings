
unit Comdat;
interface

{
  Automatically converted by H2Pas 1.0.0 from Comdat.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Comdat.h
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
PLLVMComdatSelectionKind  = ^LLVMComdatSelectionKind;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- llvm-c/Comdat.h - Module Comdat C Interface -------------*- C++ -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This file defines the C interface to COMDAT.                               *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_C_COMDAT_H}
{$define LLVM_C_COMDAT_H}
{$include "llvm-c/ExternC.h"}
{$include "llvm-c/Types.h"}
{*
 * @defgroup LLVMCCoreComdat Comdats
 * @ingroup LLVMCCore
 *
 * @
  }
{/< The linker may choose any COMDAT. }
{/< The data referenced by the COMDAT must }
{/< be the same. }
{/< The linker will choose the largest }
{/< COMDAT. }
{/< No deduplication is performed. }
{/< The data referenced by the COMDAT must be }
{/< the same size. }
type
  PLLVMComdatSelectionKind = ^TLLVMComdatSelectionKind;
  TLLVMComdatSelectionKind =  Longint;
  Const
    LLVMAnyComdatSelectionKind = 0;
    LLVMExactMatchComdatSelectionKind = 1;
    LLVMLargestComdatSelectionKind = 2;
    LLVMNoDeduplicateComdatSelectionKind = 3;
    LLVMSameSizeComdatSelectionKind = 4;
;
{*
 * Return the Comdat in the module with the specified name. It is created
 * if it didn't already exist.
 *
 * @see llvm::Module::getOrInsertComdat()
  }
(* Const before type ignored *)

function LLVMGetOrInsertComdat(M:TLLVMModuleRef; Name:Pchar):TLLVMComdatRef;cdecl;external;
{*
 * Get the Comdat assigned to the given global object.
 *
 * @see llvm::GlobalObject::getComdat()
  }
function LLVMGetComdat(V:TLLVMValueRef):TLLVMComdatRef;cdecl;external;
{*
 * Assign the Comdat to the given global object.
 *
 * @see llvm::GlobalObject::setComdat()
  }
procedure LLVMSetComdat(V:TLLVMValueRef; C:TLLVMComdatRef);cdecl;external;
{
 * Get the conflict resolution selection kind for the Comdat.
 *
 * @see llvm::Comdat::getSelectionKind()
  }
function LLVMGetComdatSelectionKind(C:TLLVMComdatRef):TLLVMComdatSelectionKind;cdecl;external;
{
 * Set the conflict resolution selection kind for the Comdat.
 *
 * @see llvm::Comdat::setSelectionKind()
  }
procedure LLVMSetComdatSelectionKind(C:TLLVMComdatRef; Kind:TLLVMComdatSelectionKind);cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
