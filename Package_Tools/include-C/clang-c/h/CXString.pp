
unit CXString;
interface

{
  Automatically converted by H2Pas 1.0.0 from CXString.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    CXString.h
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
PCXString  = ^CXString;
PCXStringSet  = ^CXStringSet;
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
(* Const before type ignored *)
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
(* Const before type ignored *)

function clang_getCString(_string:TCXString):Pchar;cdecl;external;
{*
 * Free the given string.
  }
procedure clang_disposeString(_string:TCXString);cdecl;external;
{*
 * Free the given string set.
  }
procedure clang_disposeStringSet(set:PCXStringSet);cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
