
unit ogr_recordbatch;
interface

{
  Automatically converted by H2Pas 1.0.0 from ogr_recordbatch.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ogr_recordbatch.h
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
PArrowArray  = ^ArrowArray;
PArrowArrayStream  = ^ArrowArrayStream;
PArrowSchema  = ^ArrowSchema;
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Licensed to the Apache Software Foundation (ASF) under one }
{ or more contributor license agreements.  See the NOTICE file }
{ distributed with this work for additional information }
{ regarding copyright ownership.  The ASF licenses this file }
{ to you under the Apache License, Version 2.0 (the }
{ "License"); you may not use this file except in compliance }
{ with the License.  You may obtain a copy of the License at }
{ }
{   http://www.apache.org/licenses/LICENSE-2.0 }
{ }
{ Unless required by applicable law or agreed to in writing, }
{ software distributed under the License is distributed on an }
{ "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY }
{ KIND, either express or implied.  See the License for the }
{ specific language governing permissions and limitations }
{ under the License. }
{ This file is an extract }
{ https://github.com/apache/arrow/blob/main/cpp/src/arrow/c/abi.h WARNING: DO }
{ NOT MODIFY the content as it would break interoperability ! }
(** unsupported pragma#pragma once*)
{! @cond Doxygen_Suppress  }
{$include <stdint.h>}

const
  ARROW_FLAG_DICTIONARY_ORDERED = 1;  
  ARROW_FLAG_NULLABLE = 2;  
  ARROW_FLAG_MAP_KEYS_SORTED = 4;  
{ Array type description }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ Release callback }
{ Opaque producer-specific data }
type
  PArrowSchema = ^TArrowSchema;
  TArrowSchema = record
      format : Pchar;
      name : Pchar;
      metadata : Pchar;
      flags : Tint64_t;
      n_children : Tint64_t;
      children : ^PArrowSchema;
      dictionary : PArrowSchema;
      release : procedure (para1:PArrowSchema);cdecl;
      private_data : pointer;
    end;

{ Array data description }
(* Const before type ignored *)
{ Release callback }
{ Opaque producer-specific data }
  PArrowArray = ^TArrowArray;
  TArrowArray = record
      length : Tint64_t;
      null_count : Tint64_t;
      offset : Tint64_t;
      n_buffers : Tint64_t;
      n_children : Tint64_t;
      buffers : ^pointer;
      children : ^PArrowArray;
      dictionary : PArrowArray;
      release : procedure (para1:PArrowArray);cdecl;
      private_data : pointer;
    end;

{ EXPERIMENTAL: C stream interface }
{ Callback to get the stream type }
{ (will be the same for all arrays in the stream). }
{ }
{ Return value: 0 if successful, an `errno`-compatible error code }
{ otherwise. }
{ }
{ If successful, the ArrowSchema must be released independently from }
{ the stream. }
{ Callback to get the next array }
{ (if no error and the array is released, the stream has ended) }
{ }
{ Return value: 0 if successful, an `errno`-compatible error code }
{ otherwise. }
{ }
{ If successful, the ArrowArray must be released independently from the }
{ stream. }
{ Callback to get optional detailed error information. }
{ This must only be called if the last stream operation failed }
{ with a non-0 return code. }
{ }
{ Return value: pointer to a null-terminated character array describing }
{ the last error, or NULL if no description is available. }
{ }
{ The returned pointer is only valid until the next operation on this }
{ stream (including release). }
(* Const before type ignored *)
{ Release callback: release the stream's own resources. }
{ Note that arrays returned by `get_next` must be individually }
{ released. }
{ Opaque producer-specific data }
  PArrowArrayStream = ^TArrowArrayStream;
  TArrowArrayStream = record
      get_schema : function (para1:PArrowArrayStream; out:PArrowSchema):longint;cdecl;
      get_next : function (para1:PArrowArrayStream; out:PArrowArray):longint;cdecl;
      get_last_error : function (para1:PArrowArrayStream):Pchar;cdecl;
      release : procedure (para1:PArrowArrayStream);cdecl;
      private_data : pointer;
    end;

{ C++ end of extern C conditionnal removed }
{! @endcond  }

implementation


end.
