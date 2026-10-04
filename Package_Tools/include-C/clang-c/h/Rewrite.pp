
unit Rewrite;
interface

{
  Automatically converted by H2Pas 1.0.0 from Rewrite.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Rewrite.h
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
PCXRewriter  = ^CXRewriter;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- clang-c/Rewrite.h - C CXRewriter   --------------------------*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------=== }
{$ifndef LLVM_CLANG_C_REWRITE_H}
{$define LLVM_CLANG_C_REWRITE_H}
{$include "clang-c/CXString.h"}
{$include "clang-c/ExternC.h"}
{$include "clang-c/Index.h"}
{$include "clang-c/Platform.h"}
type
  PCXRewriter = ^TCXRewriter;
  TCXRewriter = pointer;
{*
 * Create CXRewriter.
  }

function clang_CXRewriter_create(TU:TCXTranslationUnit):TCXRewriter;cdecl;external;
{*
 * Insert the specified string at the specified location in the original buffer.
  }
(* Const before type ignored *)
procedure clang_CXRewriter_insertTextBefore(Rew:TCXRewriter; Loc:TCXSourceLocation; Insert:Pchar);cdecl;external;
{*
 * Replace the specified range of characters in the input with the specified
 * replacement.
  }
(* Const before type ignored *)
procedure clang_CXRewriter_replaceText(Rew:TCXRewriter; ToBeReplaced:TCXSourceRange; Replacement:Pchar);cdecl;external;
{*
 * Remove the specified range.
  }
procedure clang_CXRewriter_removeText(Rew:TCXRewriter; ToBeRemoved:TCXSourceRange);cdecl;external;
{*
 * Save all changed files to disk.
 * Returns 1 if any files were not saved successfully, returns 0 otherwise.
  }
function clang_CXRewriter_overwriteChangedFiles(Rew:TCXRewriter):longint;cdecl;external;
{*
 * Write out rewritten version of the main file to stdout.
  }
procedure clang_CXRewriter_writeMainFileToStdOut(Rew:TCXRewriter);cdecl;external;
{*
 * Free the given CXRewriter.
  }
procedure clang_CXRewriter_dispose(Rew:TCXRewriter);cdecl;external;
{$endif}

implementation


end.
