unit Rewrite;

interface

uses
  fp_clang;

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

function clang_CXRewriter_create(TU:TCXTranslationUnit):TCXRewriter;cdecl;external libgclang;
{*
 * Insert the specified string at the specified location in the original buffer.
  }
procedure clang_CXRewriter_insertTextBefore(Rew:TCXRewriter; Loc:TCXSourceLocation; Insert:Pchar);cdecl;external libgclang;
{*
 * Replace the specified range of characters in the input with the specified
 * replacement.
  }
procedure clang_CXRewriter_replaceText(Rew:TCXRewriter; ToBeReplaced:TCXSourceRange; Replacement:Pchar);cdecl;external libgclang;
{*
 * Remove the specified range.
  }
procedure clang_CXRewriter_removeText(Rew:TCXRewriter; ToBeRemoved:TCXSourceRange);cdecl;external libgclang;
{*
 * Save all changed files to disk.
 * Returns 1 if any files were not saved successfully, returns 0 otherwise.
  }
function clang_CXRewriter_overwriteChangedFiles(Rew:TCXRewriter):longint;cdecl;external libgclang;
{*
 * Write out rewritten version of the main file to stdout.
  }
procedure clang_CXRewriter_writeMainFileToStdOut(Rew:TCXRewriter);cdecl;external libgclang;
{*
 * Free the given CXRewriter.
  }
procedure clang_CXRewriter_dispose(Rew:TCXRewriter);cdecl;external libgclang;
{$endif}

// === Konventiert am: 4-10-26 17:29:41 ===


implementation



end.
