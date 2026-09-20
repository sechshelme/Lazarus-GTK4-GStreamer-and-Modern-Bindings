
unit BitReader;
interface

{
  Automatically converted by H2Pas 1.0.0 from BitReader.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    BitReader.h
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
PLLVMModuleRef  = ^LLVMModuleRef;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- llvm-c/BitReader.h - BitReader Library C Interface ------*- C++ -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header declares the C interface to libLLVMBitReader.a, which          *|
|* implements input of the LLVM bitcode format.                               *|
|*                                                                            *|
|* Many exotic languages can interoperate with C code but have a harder time  *|
|* with C++ due to name mangling. So in addition to C, this interface enables *|
|* tools written in such languages.                                           *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_C_BITREADER_H}
{$define LLVM_C_BITREADER_H}
{$include "llvm-c/ExternC.h"}
{$include "llvm-c/Types.h"}
{*
 * @defgroup LLVMCBitReader Bit Reader
 * @ingroup LLVMC
 *
 * @
  }
{ Builds a module from the bitcode in the specified memory buffer, returning a
   reference to the module via the OutModule parameter. Returns 0 on success.
   Optionally returns a human-readable error message via OutMessage.

   This is deprecated. Use LLVMParseBitcode2.  }

function LLVMParseBitcode(MemBuf:TLLVMMemoryBufferRef; OutModule:PLLVMModuleRef; OutMessage:PPchar):TLLVMBool;cdecl;external;
{ Builds a module from the bitcode in the specified memory buffer, returning a
   reference to the module via the OutModule parameter. Returns 0 on success.  }
function LLVMParseBitcode2(MemBuf:TLLVMMemoryBufferRef; OutModule:PLLVMModuleRef):TLLVMBool;cdecl;external;
{ This is deprecated. Use LLVMParseBitcodeInContext2.  }
function LLVMParseBitcodeInContext(ContextRef:TLLVMContextRef; MemBuf:TLLVMMemoryBufferRef; OutModule:PLLVMModuleRef; OutMessage:PPchar):TLLVMBool;cdecl;external;
function LLVMParseBitcodeInContext2(ContextRef:TLLVMContextRef; MemBuf:TLLVMMemoryBufferRef; OutModule:PLLVMModuleRef):TLLVMBool;cdecl;external;
{* Reads a module from the specified path, returning via the OutMP parameter
    a module provider which performs lazy deserialization. Returns 0 on success.
    Optionally returns a human-readable error message via OutMessage.
    This is deprecated. Use LLVMGetBitcodeModuleInContext2.  }
function LLVMGetBitcodeModuleInContext(ContextRef:TLLVMContextRef; MemBuf:TLLVMMemoryBufferRef; OutM:PLLVMModuleRef; OutMessage:PPchar):TLLVMBool;cdecl;external;
{* Reads a module from the given memory buffer, returning via the OutMP
 * parameter a module provider which performs lazy deserialization.
 *
 * Returns 0 on success.
 *
 * Takes ownership of \p MemBuf if (and only if) the module was read
 * successfully.  }
function LLVMGetBitcodeModuleInContext2(ContextRef:TLLVMContextRef; MemBuf:TLLVMMemoryBufferRef; OutM:PLLVMModuleRef):TLLVMBool;cdecl;external;
{ This is deprecated. Use LLVMGetBitcodeModule2.  }
function LLVMGetBitcodeModule(MemBuf:TLLVMMemoryBufferRef; OutM:PLLVMModuleRef; OutMessage:PPchar):TLLVMBool;cdecl;external;
function LLVMGetBitcodeModule2(MemBuf:TLLVMMemoryBufferRef; OutM:PLLVMModuleRef):TLLVMBool;cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
