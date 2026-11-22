
unit version;
interface

{
  Automatically converted by H2Pas 1.0.0 from version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    version.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
---------------------------------------------------------------------------
Open Asset Import Library (assimp)
---------------------------------------------------------------------------

Copyright (c) 2006-2023, assimp team

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
{* @file  version.h
 *  @brief Functions to query the version of the Assimp runtime, check
 *    compile flags, ...
  }
(** unsupported pragma#pragma once*)
{$ifndef AI_VERSION_H_INC}
{$define AI_VERSION_H_INC}
{$include <assimp/defs.h>}
{ C++ extern C conditionnal removed }
{ --------------------------------------------------------------------------- }
{* @brief Returns a string with legal copyright and licensing information
 *  about Assimp. The string may include multiple lines.
 *  @return Pointer to static string.
  }
(* Const before type ignored *)

function aiGetLegalString:Pchar;cdecl;external;
{ --------------------------------------------------------------------------- }
{* @brief Returns the current patch version number of Assimp.
 *  @return Patch version of the Assimp runtime the application was
 *    linked/built against
  }
function aiGetVersionPatch:dword;cdecl;external;
{ --------------------------------------------------------------------------- }
{* @brief Returns the current minor version number of Assimp.
 *  @return Minor version of the Assimp runtime the application was
 *    linked/built against
  }
function aiGetVersionMinor:dword;cdecl;external;
{ --------------------------------------------------------------------------- }
{* @brief Returns the current major version number of Assimp.
 *  @return Major version of the Assimp runtime the application was
 *    linked/built against
  }
function aiGetVersionMajor:dword;cdecl;external;
{ --------------------------------------------------------------------------- }
{* @brief Returns the repository revision of the Assimp runtime.
 *  @return SVN Repository revision number of the Assimp runtime the
 *          application was linked/built against.
  }
function aiGetVersionRevision:dword;cdecl;external;
{ --------------------------------------------------------------------------- }
{* @brief Returns the branch-name of the Assimp runtime.
 *  @return The current branch name.
  }
(* Const before type ignored *)
function aiGetBranchName:Pchar;cdecl;external;
{! Assimp was compiled as a shared object (Windows: DLL) }
const
  ASSIMP_CFLAGS_SHARED = $1;  
{! Assimp was compiled against STLport }
  ASSIMP_CFLAGS_STLPORT = $2;  
{! Assimp was compiled as a debug build }
  ASSIMP_CFLAGS_DEBUG = $4;  
{! Assimp was compiled with ASSIMP_BUILD_BOOST_WORKAROUND defined }
  ASSIMP_CFLAGS_NOBOOST = $8;  
{! Assimp was compiled with ASSIMP_BUILD_SINGLETHREADED defined }
  ASSIMP_CFLAGS_SINGLETHREADED = $10;  
{! Assimp was compiled with ASSIMP_BUILD_SINGLETHREADED defined }
  ASSIMP_CFLAGS_DOUBLE_SUPPORT = $20;  
{ --------------------------------------------------------------------------- }
{* @brief Returns assimp's compile flags
 *  @return Any bitwise combination of the ASSIMP_CFLAGS_xxx constants.
  }

function aiGetCompileFlags:dword;cdecl;external;
{$endif}
{ !! #ifndef AI_VERSION_H_INC }

implementation


end.
