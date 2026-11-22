
unit cfileio;
interface

{
  Automatically converted by H2Pas 1.0.0 from cfileio.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cfileio.h
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
PaiFile  = ^aiFile;
PaiFileIO  = ^aiFileIO;
PaiFileOpenProc  = ^aiFileOpenProc;
PaiUserData  = ^aiUserData;
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
---------------------------------------------------------------------------
Open Asset Import Library (assimp)
---------------------------------------------------------------------------

Copyright (c) 2006-2022, assimp team

All rights reserved.

Redistribution and use of this software in source and binary forms,
with or without modification, are permitted provided that the following
conditions are met:

* Redistributions of source code must retain the above
  copyright notice, this list of conditions and the
  following disclaimer.

* Redistributions in binary form must reproduce the above
  copyright notice, this list of conditions and the
  following disclaimer in the documentation and/or other
  materials provided with the distribution.

* Neither the name of the assimp team, nor the names of its
  contributors may be used to endorse or promote products
  derived from this software without specific prior
  written permission of the assimp team.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
---------------------------------------------------------------------------
 }
{* @file cfileio.h
 *  @brief Defines generic C routines to access memory-mapped files
  }
(** unsupported pragma#pragma once*)
{$ifndef AI_FILEIO_H_INC}
{$define AI_FILEIO_H_INC}
{$ifdef __GNUC__}
(** unsupported pragma#pragma GCC system_header*)
{$endif}
{$include <assimp/types.h>}
{ C++ extern C conditionnal removed }
type
  PaiFileIO = ^TaiFileIO;
  TaiFileIO = record
      {undefined structure}
    end;

  PaiFile = ^TaiFile;
  TaiFile = record
      {undefined structure}
    end;

{ aiFile callbacks }
(* Const before type ignored *)

  TaiFileWriteProc = function (para1:PaiFile; para2:Pchar; para3:Tsize_t; para4:Tsize_t):Tsize_t;cdecl;

  TaiFileReadProc = function (para1:PaiFile; para2:Pchar; para3:Tsize_t; para4:Tsize_t):Tsize_t;cdecl;

  TaiFileTellProc = function (para1:PaiFile):Tsize_t;cdecl;

  TaiFileFlushProc = procedure (para1:PaiFile);cdecl;

  TaiFileSeek = function (para1:PaiFile; para2:Tsize_t; para3:TaiOrigin):TaiReturn;cdecl;
{ aiFileIO callbacks }
(* Const before type ignored *)
(* Const before type ignored *)

  PaiFileOpenProc = ^TaiFileOpenProc;
  TaiFileOpenProc = function (para1:PaiFileIO; para2:Pchar; para3:Pchar):PaiFile;cdecl;

  TaiFileCloseProc = procedure (para1:PaiFileIO; para2:PaiFile);cdecl;
{ Represents user-defined data }

  PaiUserData = ^TaiUserData;
  TaiUserData = Pchar;
{ ---------------------------------------------------------------------------------- }
{* @brief C-API: File system callbacks
 *
 *  Provided are functions to open and close files. Supply a custom structure to
 *  the import function. If you don't, a default implementation is used. Use custom
 *  file systems to enable reading from other sources, such as ZIPs
 *  or memory locations.  }
{* Function used to open a new file
      }
{* Function used to close an existing file
      }
{* User-defined, opaque data  }
  PaiFileIO = ^TaiFileIO;
  TaiFileIO = record
      OpenProc : TaiFileOpenProc;
      CloseProc : TaiFileCloseProc;
      UserData : TaiUserData;
    end;

{ ---------------------------------------------------------------------------------- }
{* @brief C-API: File callbacks
 *
 *  Actually, it's a data structure to wrap a set of fXXXX (e.g fopen)
 *  replacement functions.
 *
 *  The default implementation of the functions utilizes the fXXX functions from
 *  the CRT. However, you can supply a custom implementation to Assimp by
 *  delivering a custom aiFileIO. Use this to enable reading from other sources,
 *  such as ZIP archives or memory locations.  }
{* Callback to read from a file  }
{* Callback to write to a file  }
{* Callback to retrieve the current position of
     *  the file cursor (ftell())
      }
{* Callback to retrieve the size of the file,
     *  in bytes
      }
{* Callback to set the current position
     * of the file cursor (fseek())
      }
{* Callback to flush the file contents
      }
{* User-defined, opaque data
      }
  PaiFile = ^TaiFile;
  TaiFile = record
      ReadProc : TaiFileReadProc;
      WriteProc : TaiFileWriteProc;
      TellProc : TaiFileTellProc;
      FileSizeProc : TaiFileTellProc;
      SeekProc : TaiFileSeek;
      FlushProc : TaiFileFlushProc;
      UserData : TaiUserData;
    end;

{ C++ end of extern C conditionnal removed }
{$endif}
{ AI_FILEIO_H_INC }

implementation


end.
