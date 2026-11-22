
unit types;
interface

{
  Automatically converted by H2Pas 1.0.0 from types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    types.h
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
Pai_int32  = ^ai_int32;
Pai_uint32  = ^ai_uint32;
PaiColor3D  = ^aiColor3D;
PaiDefaultLogStream  = ^aiDefaultLogStream;
PaiMemoryInfo  = ^aiMemoryInfo;
PaiOrigin  = ^aiOrigin;
PaiPlane  = ^aiPlane;
PaiRay  = ^aiRay;
PaiReturn  = ^aiReturn;
PaiString  = ^aiString;
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
{* @file types.h
 *  Basic data types and primitives, such as vectors or colors.
  }
(** unsupported pragma#pragma once*)
{$ifndef AI_TYPES_H_INC}
{$define AI_TYPES_H_INC}
{$ifdef __GNUC__}
(** unsupported pragma#pragma GCC system_header*)
{$endif}
{ Some runtime headers }
{$include <limits.h>}
{$include <stddef.h>}
{$include <stdint.h>}
{$include <string.h>}
{$include <sys/types.h>}
{ Our compile configuration }
{$include <assimp/defs.h>}
{ Some types moved to separate header due to size of operators }
{$include <assimp/vector2.h>}
{$include <assimp/vector3.h>}
{$include <assimp/color4.h>}
{$include <assimp/matrix3x3.h>}
{$include <assimp/matrix4x4.h>}
{$include <assimp/quaternion.h>}
type
  Pai_int32 = ^Tai_int32;
  Tai_int32 = Tint32_t;

  Pai_uint32 = ^Tai_uint32;
  Tai_uint32 = Tuint32_t;
{* Maximum dimension for strings, ASSIMP strings are zero terminated.  }

const
  MAXLEN = 1024;  
{ ---------------------------------------------------------------------------------- }
{* Represents a plane in a three-dimensional, euclidean space
 }
{ !__cplusplus }
{! Plane equation }
type
  PaiPlane = ^TaiPlane;
  TaiPlane = record
      a : Tai_real;
      b : Tai_real;
      c : Tai_real;
      d : Tai_real;
    end;

{ !struct aiPlane }
{ ---------------------------------------------------------------------------------- }
{* Represents a ray
 }
{ !__cplusplus }
{! Position and direction of the ray }
  PaiRay = ^TaiRay;
  TaiRay = record
      pos : TaiVector3D;
      dir : TaiVector3D;
    end;

{ !struct aiRay }
{ ---------------------------------------------------------------------------------- }
{* Represents a color in Red-Green-Blue space.
 }
{ !__cplusplus }
{! Red, green and blue color values }
  PaiColor3D = ^TaiColor3D;
  TaiColor3D = record
      r : Tai_real;
      g : Tai_real;
      b : Tai_real;
    end;

{ !struct aiColor3D }
{ ---------------------------------------------------------------------------------- }
{* Represents an UTF-8 string, zero byte terminated.
 *
 *  The character set of an aiString is explicitly defined to be UTF-8. This Unicode
 *  transformation was chosen in the belief that most strings in 3d files are limited
 *  to ASCII, thus the character set needed to be strictly ASCII compatible.
 *
 *  Most text file loaders provide proper Unicode input file handling, special unicode
 *  characters are correctly transcoded to UTF8 and are kept throughout the libraries'
 *  import pipeline.
 *
 *  For most applications, it will be absolutely sufficient to interpret the
 *  aiString as ASCII data and work with it as one would work with a plain char*.
 *  Windows users in need of proper support for i.e asian characters can use the
 *  MultiByteToWideChar(), WideCharToMultiByte() WinAPI functionality to convert the
 *  UTF-8 strings to their working character set (i.e. MBCS, WideChar).
 *
 *  We use this representation instead of std::string to be C-compatible. The
 *  (binary) length of such a string is limited to MAXLEN characters (including the
 *  the terminating zero).
 }
{ !__cplusplus }
{* Binary length of the string excluding the terminal 0. This is NOT the
     *  logical length of strings containing UTF-8 multi-byte sequences! It's
     *  the number of bytes from the beginning of the string to its end. }
{* String buffer. Size limit is MAXLEN  }
  PaiString = ^TaiString;
  TaiString = record
      length : Tai_uint32;
      data : array[0..(MAXLEN)-1] of char;
    end;

{ !struct aiString }
{ ---------------------------------------------------------------------------------- }
{* Standard return type for some library functions.
 * Rarely used, and if, mostly in the C API.
  }
{* Indicates that a function was successful  }
{* Indicates that a function failed  }
{* Indicates that not enough memory was available
     * to perform the requested operation
      }
{* @cond never
     *  Force 32-bit size enum
      }
{/ @endcond }

  PaiReturn = ^TaiReturn;
  TaiReturn =  Longint;
  Const
    aiReturn_SUCCESS = $0;
    aiReturn_FAILURE = -($1);
    aiReturn_OUTOFMEMORY = -($3);
    _AI_ENFORCE_ENUM_SIZE = $7fffffff;
;
{ !enum aiReturn }
{ just for backwards compatibility, don't use these constants anymore }
  AI_SUCCESS = aiReturn_SUCCESS;  
  AI_FAILURE = aiReturn_FAILURE;  
  AI_OUTOFMEMORY = aiReturn_OUTOFMEMORY;  
{ ---------------------------------------------------------------------------------- }
{* Seek origins (for the virtual file system API).
 *  Much cooler than using SEEK_SET, SEEK_CUR or SEEK_END.
  }
{* Beginning of the file  }
{* Current position of the file pointer  }
{* End of the file, offsets must be negative  }
{*  @cond never
     *   Force 32-bit size enum
      }
{/ @endcond }
type
  TaiOrigin =  Longint;
  Const
    aiOrigin_SET = $0;
    aiOrigin_CUR = $1;
    aiOrigin_END = $2;
    _AI_ORIGIN_ENFORCE_ENUM_SIZE = $7fffffff;

{ !enum aiOrigin }
{ ---------------------------------------------------------------------------------- }
{* @brief Enumerates predefined log streaming destinations.
 *  Logging to these streams can be enabled with a single call to
 *   #LogStream::createDefaultStream.
  }
{* Stream the log to a file  }
{* Stream the log to std::cout  }
{* Stream the log to std::cerr  }
{* MSVC only: Stream the log the the debugger
     * (this relies on OutputDebugString from the Win32 SDK)
      }
{* @cond never
     *  Force 32-bit size enum
      }
{/ @endcond }
type
  TaiDefaultLogStream =  Longint;
  Const
    aiDefaultLogStream_FILE = $1;
    aiDefaultLogStream_STDOUT = $2;
    aiDefaultLogStream_STDERR = $4;
    aiDefaultLogStream_DEBUGGER = $8;
    _AI_DLS_ENFORCE_ENUM_SIZE = $7fffffff;

{ !enum aiDefaultLogStream }
{ just for backwards compatibility, don't use these constants anymore }
  DLS_FILE = aiDefaultLogStream_FILE;  
  DLS_STDOUT = aiDefaultLogStream_STDOUT;  
  DLS_STDERR = aiDefaultLogStream_STDERR;  
  DLS_DEBUGGER = aiDefaultLogStream_DEBUGGER;  
{ ---------------------------------------------------------------------------------- }
{* Stores the memory requirements for different components (e.g. meshes, materials,
 *  animations) of an import. All sizes are in bytes.
 *  @see Importer::GetMemoryRequirements()
 }
{* Storage allocated for texture data  }
{* Storage allocated for material data   }
{* Storage allocated for mesh data  }
{* Storage allocated for node data  }
{* Storage allocated for animation data  }
{* Storage allocated for camera data  }
{* Storage allocated for light data  }
{* Total storage allocated for the full import.  }
type
  PaiMemoryInfo = ^TaiMemoryInfo;
  TaiMemoryInfo = record
      textures : dword;
      materials : dword;
      meshes : dword;
      nodes : dword;
      animations : dword;
      cameras : dword;
      lights : dword;
      total : dword;
    end;

{ !struct aiMemoryInfo }
{ C++ end of extern C conditionnal removed }
{!  __cplusplus }
{ Include implementation files }
{$include "vector2.inl"}
{$include "vector3.inl"}
{$include "color4.inl"}
{$include "matrix3x3.inl"}
{$include "matrix4x4.inl"}
{$include "quaternion.inl"}
{$endif}
{ AI_TYPES_H_INC }

implementation


end.
