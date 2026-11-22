
unit defs;
interface

{
  Automatically converted by H2Pas 1.0.0 from defs.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    defs.h
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
Pai_int  = ^ai_int;
Pai_real  = ^ai_real;
Pai_uint  = ^ai_uint;
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
{* @file defs.h
 *  @brief Assimp build configuration setup. See the notes in the comment
 *  blocks to find out how to customize _your_ Assimp build.
  }
(** unsupported pragma#pragma once*)
{$ifndef AI_DEFINES_H_INC}
{$define AI_DEFINES_H_INC}
{$ifdef __GNUC__}
(** unsupported pragma#pragma GCC system_header*)
{$endif}
{$include <assimp/config.h>}
{//////////////////////////////////////////////////////////////////////// }
{ Define ASSIMP_BUILD_NO_XX_IMPORTER to disable a specific
 * file format loader. The loader is be excluded from the
 * build in this case. 'XX' stands for the most common file
 * extension of the file format. E.g.:
 * ASSIMP_BUILD_NO_X_IMPORTER disables the X loader.
 *
 * If you're unsure about that, take a look at the implementation of the
 * import plugin you wish to disable. You'll find the right define in the
 * first lines of the corresponding unit.
 *
 * Other (mixed) configuration switches are listed here:
 *    ASSIMP_BUILD_NO_COMPRESSED_X
 *      - Disable support for compressed X files (zip)
 *    ASSIMP_BUILD_NO_COMPRESSED_BLEND
 *      - Disable support for compressed Blender files (zip)
 *    ASSIMP_BUILD_NO_COMPRESSED_IFC
 *      - Disable support for IFCZIP files (unzip)
  }
{//////////////////////////////////////////////////////////////////////// }
{$ifndef ASSIMP_BUILD_NO_COMPRESSED_X}
{$define ASSIMP_BUILD_NEED_Z_INFLATE}
{$endif}
{$ifndef ASSIMP_BUILD_NO_COMPRESSED_BLEND}
{$define ASSIMP_BUILD_NEED_Z_INFLATE}
{$endif}
{$ifndef ASSIMP_BUILD_NO_COMPRESSED_IFC}
{$define ASSIMP_BUILD_NEED_Z_INFLATE}
{$define ASSIMP_BUILD_NEED_UNZIP}
{$endif}
{$ifndef ASSIMP_BUILD_NO_Q3BSP_IMPORTER}
{$define ASSIMP_BUILD_NEED_Z_INFLATE}
{$define ASSIMP_BUILD_NEED_UNZIP}
{$endif}
{ We need those constants, workaround for any platforms where nobody defined them yet }
{$if (!defined SIZE_MAX)}

{ was #define dname def_expr }
function SIZE_MAX : longint; { return type might be wrong }

{$endif}
{#if (!defined UINT_MAX)
#define UINT_MAX (~((unsigned int)0))
#endif }
{//////////////////////////////////////////////////////////////////////// }
{ Define ASSIMP_BUILD_NO_XX_PROCESS to disable a specific
 * post processing step. This is the current list of process names ('XX'):
 * CALCTANGENTS
 * JOINVERTICES
 * TRIANGULATE
 * DROPFACENORMALS
 * GENFACENORMALS
 * GENVERTEXNORMALS
 * REMOVEVC
 * SPLITLARGEMESHES
 * PRETRANSFORMVERTICES
 * LIMITBONEWEIGHTS
 * VALIDATEDS
 * IMPROVECACHELOCALITY
 * FIXINFACINGNORMALS
 * REMOVE_REDUNDANTMATERIALS
 * OPTIMIZEGRAPH
 * SORTBYPTYPE
 * FINDINVALIDDATA
 * TRANSFORMTEXCOORDS
 * GENUVCOORDS
 * ENTITYMESHBUILDER
 * EMBEDTEXTURES
 * MAKELEFTHANDED
 * FLIPUVS
 * FLIPWINDINGORDER
 * OPTIMIZEMESHES
 * OPTIMIZEANIMS
 * OPTIMIZEGRAPH
 * GENENTITYMESHES
 * FIXTEXTUREPATHS
 * GENBOUNDINGBOXES  }
{//////////////////////////////////////////////////////////////////////// }
{$ifdef ASSIMP_DOUBLE_PRECISION}
type
  Pai_real = ^Tai_real;
  Tai_real = Tdouble;

  Pai_int = ^Tai_int;
  Tai_int = int64;

  Pai_uint = ^Tai_uint;
  Tai_uint = qword;
{$ifndef ASSIMP_AI_REAL_TEXT_PRECISION}

const
  ASSIMP_AI_REAL_TEXT_PRECISION = 17;  
{$endif}
{ ASSIMP_AI_REAL_TEXT_PRECISION }
{$else}
{ ASSIMP_DOUBLE_PRECISION }
type
  Pai_real = ^Tai_real;
  Tai_real = single;

  Pai_int = ^Tai_int;
  Tai_int = longint;

  Pai_uint = ^Tai_uint;
  Tai_uint = dword;
{$ifndef ASSIMP_AI_REAL_TEXT_PRECISION}

const
  ASSIMP_AI_REAL_TEXT_PRECISION = 9;  
{$endif}
{ ASSIMP_AI_REAL_TEXT_PRECISION }
{$endif}
{ ASSIMP_DOUBLE_PRECISION }
{//////////////////////////////////////////////////////////////////////// }
{ Useful constants  }
{//////////////////////////////////////////////////////////////////////// }
{ This is PI. Hi PI.  }

const
  AI_MATH_PI = 3.141592653589793238462643383279;  
{ xxxxxxxx #define AI_MATH_TWO_PI (AI_MATH_PI * 2.0) }
{ xxxxxxxxxx #define AI_MATH_HALF_PI (AI_MATH_PI * 0.5) }
{ And this is to avoid endless casts to float  }
  AI_MATH_PI_F = 3.1415926538;  
{ xxxxxxx #define AI_MATH_TWO_PI_F (AI_MATH_PI_F * 2.0) }
{ xxxxxxxx #define AI_MATH_HALF_PI_F (AI_MATH_PI_F * 0.5) }
{ Tiny macro to convert from radians to degrees and back  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function AI_DEG_TO_RAD(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AI_RAD_TO_DEG(x : longint) : longint;

{ Numerical limits  }
{ was #define dname def_expr }
function ai_epsilon : Tai_real;  

{ Support for big-endian builds  }
{$if defined(__BYTE_ORDER__)}
{$if (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)}
{$if !defined(__BIG_ENDIAN__)}
{$define __BIG_ENDIAN__}
{$endif}
{$else}
{ little endian  }
{$if defined(__BIG_ENDIAN__)}
{$undef __BIG_ENDIAN__}
{$endif}
{$endif}
{$endif}
{$if defined(__BIG_ENDIAN__)}
{$define AI_BUILD_BIG_ENDIAN}
{$endif}
{*
 *  To avoid running out of memory
 *  This can be adjusted for specific use cases
 *  It's NOT a total limit, just a limit for individual allocations
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function AI_MAX_ALLOC(_type : longint) : longint;


implementation

{ was #define dname def_expr }
function SIZE_MAX : longint; { return type might be wrong }
  begin
    SIZE_MAX:= not (Tsize_t(0));
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AI_DEG_TO_RAD(x : longint) : longint;
begin
  AI_DEG_TO_RAD:=x*(Tai_real(0.0174532925));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AI_RAD_TO_DEG(x : longint) : longint;
begin
  AI_RAD_TO_DEG:=x*(Tai_real(57.2957795));
end;

{ was #define dname def_expr }
function ai_epsilon : Tai_real;
  begin
    ai_epsilon:=Tai_real(1e-6);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AI_MAX_ALLOC(_type : longint) : longint;
begin
  AI_MAX_ALLOC:=((256*1024)*1024)/(sizeof(_type));
end;


end.
