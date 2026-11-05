unit hash;

interface

uses
  fp_isl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2008-2009 Katholieke Universiteit Leuven
 *
 * Use of this software is governed by the MIT license
 *
 * Written by Sven Verdoolaege, K.U.Leuven, Departement
 * Computerwetenschappen, Celestijnenlaan 200A, B-3001 Leuven, Belgium
  }
{$ifndef ISL_HASH_H}
{$define ISL_HASH_H}
{$include <stdlib.h>}
{$include <isl/stdint.h>}
{$include <isl/ctx.h>}
{$if defined(__cplusplus)}
{$endif}
{ was #define dname(params) para_def_expr }
{ return type might be wrong }   

function isl_hash_init : longint;

{xxxxxxxxx
#define isl_hash_byte(h,b)	do 					\
					h *= 16777619;			\
					h ^= b;				\
				 while(0)
#define isl_hash_hash(h,h2)						\
	do 								\
		isl_hash_byte(h, (h2) & 0xFF);				\
		isl_hash_byte(h, ((h2) >> 8) & 0xFF);			\
		isl_hash_byte(h, ((h2) >> 16) & 0xFF);			\
		isl_hash_byte(h, ((h2) >> 24) & 0xFF);			\
	 while(0)
#define isl_hash_bits(h,bits)						\
	((bits) == 32) ? (h) :						\
	((bits) >= 16) ?						\
	      ((h) >> (bits)) ^ ((h) & (((uint32_t)1 << (bits)) - 1)) :	\
	      (((h) >> (bits)) ^ (h)) & (((uint32_t)1 << (bits)) - 1)
 }
function isl_hash_string(hash:Tuint32_t; s:Pchar):Tuint32_t;cdecl;external libisl;
function isl_hash_mem(hash:Tuint32_t; p:pointer; len:Tsize_t):Tuint32_t;cdecl;external libisl;
type
  Pisl_hash_table_entry = ^Tisl_hash_table_entry;
  Tisl_hash_table_entry = record
      hash : Tuint32_t;
      data : pointer;
    end;

  Pisl_hash_table = ^Tisl_hash_table;
  Tisl_hash_table = record
      bits : longint;
      n : longint;
      entries : Pisl_hash_table_entry;
    end;


function isl_hash_table_alloc(ctx:Pisl_ctx; min_size:longint):Pisl_hash_table;cdecl;external libisl;
procedure isl_hash_table_free(ctx:Pisl_ctx; table:Pisl_hash_table);cdecl;external libisl;
function isl_hash_table_init(ctx:Pisl_ctx; table:Pisl_hash_table; min_size:longint):longint;cdecl;external libisl;
procedure isl_hash_table_clear(table:Pisl_hash_table);cdecl;external libisl;
  var
    isl_hash_table_entry_none : Pisl_hash_table_entry;cvar;external libisl;

function isl_hash_table_find(ctx:Pisl_ctx; table:Pisl_hash_table; key_hash:Tuint32_t; eq:function (entry:pointer; val:pointer):Tisl_bool; val:pointer; 
           reserve:longint):Pisl_hash_table_entry;cdecl;external libisl;
function isl_hash_table_foreach(ctx:Pisl_ctx; table:Pisl_hash_table; fn:function (entry:Ppointer; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external libisl;
function isl_hash_table_every(ctx:Pisl_ctx; table:Pisl_hash_table; test:function (entry:Ppointer; user:pointer):Tisl_bool; user:pointer):Tisl_bool;cdecl;external libisl;
procedure isl_hash_table_remove(ctx:Pisl_ctx; table:Pisl_hash_table; entry:Pisl_hash_table_entry);cdecl;external libisl;
{$endif}

// === Konventiert am: 4-11-26 20:16:48 ===


implementation


{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function isl_hash_init : longint;
begin
  isl_hash_init:=2166136261;
end;


end.
