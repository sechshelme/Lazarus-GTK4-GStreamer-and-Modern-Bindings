
unit IRReader;
interface

{
  Automatically converted by H2Pas 1.0.0 from IRReader.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    IRReader.h
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


{===-- llvm-c/IRReader.h - IR Reader C Interface -----------------*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This file defines the C interface to the IR Reader.                        *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_C_IRREADER_H}
{$define LLVM_C_IRREADER_H}
{$include "llvm-c/ExternC.h"}
{$include "llvm-c/Types.h"}
{*
 * @defgroup LLVMCCoreIRReader IR Reader
 * @ingroup LLVMCCore
 *
 * @
  }
{*
 * Read LLVM IR from a memory buffer and convert it into an in-memory Module
 * object. Returns 0 on success.
 * Optionally returns a human-readable description of any errors that
 * occurred during parsing IR. OutMessage must be disposed with
 * LLVMDisposeMessage.
 *
 * @see llvm::ParseIR()
  }

function LLVMParseIRInContext(ContextRef:TLLVMContextRef; MemBuf:TLLVMMemoryBufferRef; OutM:PLLVMModuleRef; OutMessage:PPchar):TLLVMBool;cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
