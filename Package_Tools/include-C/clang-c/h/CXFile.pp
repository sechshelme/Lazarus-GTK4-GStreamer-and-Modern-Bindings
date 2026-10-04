
unit CXFile;
interface

{
  Automatically converted by H2Pas 1.0.0 from CXFile.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    CXFile.h
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
PCXFile  = ^CXFile;
PCXFileUniqueID  = ^CXFileUniqueID;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- clang-c/CXFile.h - C Index File ---------------------------*- C -*-===*\
|*                                                                            *|
|* Part of the LLVM Project, under the Apache License v2.0 with LLVM          *|
|* Exceptions.                                                                *|
|* See https://llvm.org/LICENSE.txt for license information.                  *|
|* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header provides the interface to C Index files.                       *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_CLANG_C_CXFILE_H}
{$define LLVM_CLANG_C_CXFILE_H}
{$include <time.h>}
{$include "clang-c/CXString.h"}
{$include "clang-c/ExternC.h"}
{$include "clang-c/Platform.h"}
{*
 * \defgroup CINDEX_FILES File manipulation routines
 *
 * @
  }
{*
 * A particular source file that is part of a translation unit.
  }
type
  PCXFile = ^TCXFile;
  TCXFile = pointer;
{*
 * Retrieve the complete file and path name of the given file.
  }

function clang_getFileName(SFile:TCXFile):TCXString;cdecl;external;
{*
 * Retrieve the last modification time of the given file.
  }
function clang_getFileTime(SFile:TCXFile):Ttime_t;cdecl;external;
{*
 * Uniquely identifies a CXFile, that refers to the same underlying file,
 * across an indexing session.
  }
type
  PCXFileUniqueID = ^TCXFileUniqueID;
  TCXFileUniqueID = record
      data : array[0..2] of qword;
    end;
{*
 * Retrieve the unique ID for the given \c file.
 *
 * \param file the file to get the ID for.
 * \param outID stores the returned CXFileUniqueID.
 * \returns If there was a failure getting the unique ID, returns non-zero,
 * otherwise returns 0.
  }

function clang_getFileUniqueID(file:TCXFile; outID:PCXFileUniqueID):longint;cdecl;external;
{*
 * Returns non-zero if the \c file1 and \c file2 point to the same file,
 * or they are both NULL.
  }
function clang_File_isEqual(file1:TCXFile; file2:TCXFile):longint;cdecl;external;
{*
 * Returns the real path name of \c file.
 *
 * An empty string may be returned. Use \c clang_getFileName() in that case.
  }
function clang_File_tryGetRealPathName(file:TCXFile):TCXString;cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
