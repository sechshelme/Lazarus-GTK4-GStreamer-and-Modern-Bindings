
unit metadata;
interface

{
  Automatically converted by H2Pas 1.0.0 from metadata.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    metadata.h
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
PaiMetadata  = ^aiMetadata;
PaiMetadataEntry  = ^aiMetadataEntry;
PaiMetadataType  = ^aiMetadataType;
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
{* @file metadata.h
 *  @brief Defines the data structures for holding node meta information.
  }
(** unsupported pragma#pragma once*)
{$ifndef AI_METADATA_H_INC}
{$define AI_METADATA_H_INC}
{$ifdef __GNUC__}
(** unsupported pragma#pragma GCC system_header*)
{$endif}
{$if defined(_MSC_VER) && (_MSC_VER <= 1500)}
{$include "Compiler/pstdint.h"}
{$else}
{$include <stdint.h>}
{$endif}
{$include <assimp/quaternion.h>}
{ ------------------------------------------------------------------------------- }
{*
  * Enum used to distinguish data types
   }
{ ------------------------------------------------------------------------------- }
{$ifndef SWIG}
{$endif}
type
  PaiMetadataType = ^TaiMetadataType;
  TaiMetadataType =  Longint;
  Const
    AI_BOOL = 0;
    AI_INT32 = 1;
    AI_UINT64 = 2;
    AI_FLOAT = 3;
    AI_DOUBLE = 4;
    AI_AISTRING = 5;
    AI_AIVECTOR3D = 6;
    AI_AIMETADATA = 7;
    AI_INT64 = 8;
    AI_UINT32 = 9;
    AI_META_MAX = 10;
    FORCE_32BIT = INT_MAX;
;
{ ------------------------------------------------------------------------------- }
{*
  * Metadata entry
  *
  * The type field uniquely identifies the underlying type of the data field
   }
{ ------------------------------------------------------------------------------- }
type
  PaiMetadataEntry = ^TaiMetadataEntry;
  TaiMetadataEntry = record
      mType : TaiMetadataType;
      mData : pointer;
    end;

{ __cplusplus }
{ ------------------------------------------------------------------------------- }
{*
  * Container for holding metadata.
  *
  * Metadata is a key-value store using string keys and values.
   }
{ ------------------------------------------------------------------------------- }
{* Length of the mKeys and mValues arrays, respectively  }
{* Arrays of keys, may not be NULL. Entries in this array may not be NULL as well.  }
{* Arrays of values, may not be NULL. Entries in this array may be NULL if the
      * corresponding property key has no assigned value.  }
{ __cplusplus }
  PaiMetadata = ^TaiMetadata;
  TaiMetadata = record
      mNumProperties : dword;
      mKeys : PaiString;
      mValues : PaiMetadataEntry;
    end;

{$endif}
{ AI_METADATA_H_INC }

implementation


end.
