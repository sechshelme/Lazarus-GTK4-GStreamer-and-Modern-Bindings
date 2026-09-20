
unit blake3;
interface

{
  Automatically converted by H2Pas 1.0.0 from blake3.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    blake3.h
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
Pllvm_blake3_chunk_state  = ^llvm_blake3_chunk_state;
Pllvm_blake3_hasher  = ^llvm_blake3_hasher;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{===-- llvm-c/blake3.h - BLAKE3 C Interface ----------------------*- C -*-===*\
|*                                                                            *|
|* Released into the public domain with CC0 1.0                               *|
|* See 'llvm/lib/Support/BLAKE3/LICENSE' for info.                            *|
|* SPDX-License-Identifier: CC0-1.0                                           *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header declares the C interface to LLVM's BLAKE3 implementation.      *|
|* Original BLAKE3 C API: https://github.com/BLAKE3-team/BLAKE3/tree/1.3.1/c  *|
|*                                                                            *|
|* Symbols are prefixed with 'llvm' to avoid a potential conflict with        *|
|* another BLAKE3 version within the same program.                            *|
|*                                                                            *|
\*===----------------------------------------------------------------------=== }
{$ifndef LLVM_C_BLAKE3_H}
{$define LLVM_C_BLAKE3_H}
{$include <stddef.h>}
{$include <stdint.h>}
{ C++ extern C conditionnal removed }

const
  LLVM_BLAKE3_VERSION_STRING = '1.3.1';  
  LLVM_BLAKE3_KEY_LEN = 32;  
  LLVM_BLAKE3_OUT_LEN = 32;  
  LLVM_BLAKE3_BLOCK_LEN = 64;  
  LLVM_BLAKE3_CHUNK_LEN = 1024;  
  LLVM_BLAKE3_MAX_DEPTH = 54;  
{ This struct is a private implementation detail. It has to be here because }
{ it's part of llvm_blake3_hasher below. }
type
  Pllvm_blake3_chunk_state = ^Tllvm_blake3_chunk_state;
  Tllvm_blake3_chunk_state = record
      cv : array[0..7] of Tuint32_t;
      chunk_counter : Tuint64_t;
      buf : array[0..(LLVM_BLAKE3_BLOCK_LEN)-1] of Tuint8_t;
      buf_len : Tuint8_t;
      blocks_compressed : Tuint8_t;
      flags : Tuint8_t;
    end;
{ The stack size is MAX_DEPTH + 1 because we do lazy merging. For example, }
{ with 7 chunks, we have 3 entries in the stack. Adding an 8th chunk }
{ requires a 4th entry, rather than merging everything down to 1, because we }
{ don't know whether more input is coming. This is different from how the }
{ reference implementation does things. }

  Pllvm_blake3_hasher = ^Tllvm_blake3_hasher;
  Tllvm_blake3_hasher = record
      key : array[0..7] of Tuint32_t;
      chunk : Tllvm_blake3_chunk_state;
      cv_stack_len : Tuint8_t;
      cv_stack : array[0..((LLVM_BLAKE3_MAX_DEPTH+1)*LLVM_BLAKE3_OUT_LEN)-1] of Tuint8_t;
    end;
(* Const before type ignored *)

function llvm_blake3_version:Pchar;cdecl;external;
procedure llvm_blake3_hasher_init(self:Pllvm_blake3_hasher);cdecl;external;
(* Const before type ignored *)
procedure llvm_blake3_hasher_init_keyed(self:Pllvm_blake3_hasher; key:array[0..(LLVM_BLAKE3_KEY_LEN)-1] of Tuint8_t);cdecl;external;
(* Const before type ignored *)
procedure llvm_blake3_hasher_init_derive_key(self:Pllvm_blake3_hasher; context:Pchar);cdecl;external;
(* Const before type ignored *)
procedure llvm_blake3_hasher_init_derive_key_raw(self:Pllvm_blake3_hasher; context:pointer; context_len:Tsize_t);cdecl;external;
(* Const before type ignored *)
procedure llvm_blake3_hasher_update(self:Pllvm_blake3_hasher; input:pointer; input_len:Tsize_t);cdecl;external;
(* Const before type ignored *)
procedure llvm_blake3_hasher_finalize(self:Pllvm_blake3_hasher; out:Puint8_t; out_len:Tsize_t);cdecl;external;
(* Const before type ignored *)
procedure llvm_blake3_hasher_finalize_seek(self:Pllvm_blake3_hasher; seek:Tuint64_t; out:Puint8_t; out_len:Tsize_t);cdecl;external;
procedure llvm_blake3_hasher_reset(self:Pllvm_blake3_hasher);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LLVM_C_BLAKE3_H  }

implementation


end.
