unit hash;

interface

uses
  fp_isl, ctx;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  isl_hash_init = 2166136261;

procedure isl_hash_byte(var h: Tuint32_t; b: uint8); inline;
procedure isl_hash_hash(var h: Tuint32_t; h2: uint32); inline;
function isl_hash_bits(h: Tuint32_t; bits: longint): uint32; inline;

function isl_hash_string(hash: Tuint32_t; s: Pchar): Tuint32_t; cdecl; external libisl;
function isl_hash_mem(hash: Tuint32_t; p: pointer; len: Tsize_t): Tuint32_t; cdecl; external libisl;

type
  Pisl_hash_table_entry = ^Tisl_hash_table_entry;
  Tisl_hash_table_entry = record
    hash: Tuint32_t;
    data: pointer;
  end;

  Pisl_hash_table = ^Tisl_hash_table;
  Tisl_hash_table = record
    bits: longint;
    n: longint;
    entries: Pisl_hash_table_entry;
  end;

function isl_hash_table_alloc(ctx: Pisl_ctx; min_size: longint): Pisl_hash_table; cdecl; external libisl;
procedure isl_hash_table_free(ctx: Pisl_ctx; table: Pisl_hash_table); cdecl; external libisl;
function isl_hash_table_init(ctx: Pisl_ctx; table: Pisl_hash_table; min_size: longint): longint; cdecl; external libisl;
procedure isl_hash_table_clear(table: Pisl_hash_table); cdecl; external libisl;

var
  isl_hash_table_entry_none: Pisl_hash_table_entry; cvar;external libisl;

type
  Thash_table_func1 = function(entry: pointer; val: pointer): Tisl_bool; cdecl;
  Thash_table_func2 = function(entry: Ppointer; user: pointer): Tisl_stat; cdecl;
  Thash_table_func3 = function(entry: Ppointer; user: pointer): Tisl_bool; cdecl;

function isl_hash_table_find(ctx: Pisl_ctx; table: Pisl_hash_table; key_hash: Tuint32_t; eq: Thash_table_func1; val: pointer;
  reserve: longint): Pisl_hash_table_entry; cdecl; external libisl;
function isl_hash_table_foreach(ctx: Pisl_ctx; table: Pisl_hash_table; fn: Thash_table_func2; user: pointer): Tisl_stat; cdecl; external libisl;
function isl_hash_table_every(ctx: Pisl_ctx; table: Pisl_hash_table; test: Thash_table_func3; user: pointer): Tisl_bool; cdecl; external libisl;
procedure isl_hash_table_remove(ctx: Pisl_ctx; table: Pisl_hash_table; entry: Pisl_hash_table_entry); cdecl; external libisl;

// === Konventiert am: 4-11-26 20:16:48 ===

implementation

procedure isl_hash_byte(var h: Tuint32_t; b: uint8);
begin
  h := h * 16777619;
  h := h xor b;
end;

procedure isl_hash_hash(var h: Tuint32_t; h2: uint32);
begin
  isl_hash_byte(h, h2 and $FF);
  isl_hash_byte(h, (h2 shr 8) and $FF);
  isl_hash_byte(h, (h2 shr 16) and $FF);
  isl_hash_byte(h, (h2 shr 24) and $FF);
end;

function isl_hash_bits(h: Tuint32_t; bits: longint): uint32;
begin
  if bits = 32 then begin Result := h; end else if bits >= 16 then begin Result := (h shr bits) xor (h and ((Tuint32_t(1) shl bits) - 1)); end else begin Result := ((h shr bits) xor h) and ((Tuint32_t(1) shl bits) - 1); end;
end;

end.
