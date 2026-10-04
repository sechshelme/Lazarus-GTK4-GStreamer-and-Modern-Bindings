unit CXString;

interface

uses
  fp_clang;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- clang-c/CXString.h - C Index strings  --------------------*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header provides the interface to C Index strings.                     *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_CLANG_C_CXSTRING_H}
{$define LLVM_CLANG_C_CXSTRING_H}
{$include "clang-c/ExternC.h"}
{$include "clang-c/Platform.h"}
{*
 * \defgroup CINDEX_STRING String manipulation routines
 * \ingroup CINDEX
 *
 * @
  }
{*
 * A character string.
 *
 * The \c CXString type is used to return strings from the interface when
 * the ownership of that string might differ from one call to the next.
 * Use \c clang_getCString() to retrieve the string data and, once finished
 * with the string data, call \c clang_disposeString() to free the string.
  }
type
  PCXString = ^TCXString;
  TCXString = record
      data : pointer;
      private_flags : dword;
    end;

  PCXStringSet = ^TCXStringSet;
  TCXStringSet = record
      Strings : PCXString;
      Count : dword;
    end;
{*
 * Retrieve the character data associated with the given string.
 *
 * The returned data is a reference and not owned by the user. This data
 * is only valid while the `CXString` is valid. This function is similar
 * to `std::string::c_str()`.
  }

function clang_getCString(_string:TCXString):Pchar;cdecl;external libgclang;
{*
 * Free the given string.
  }
procedure clang_disposeString(_string:TCXString);cdecl;external libgclang;
{*
 * Free the given string set.
  }
procedure clang_disposeStringSet(set:PCXStringSet);cdecl;external libgclang;
{*
 * @
  }
{$endif}

// === Konventiert am: 4-10-26 17:29:49 ===


implementation



end.
