unit map_type;

interface

uses
  fp_isl, ctx, printer_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pisl_basic_map = type Pointer;
  Pisl_basic_map_list = type Pointer;
  Pisl_map = type Pointer;
  Pisl_map_list = type Pointer;
  Pisl_basic_set = type Pointer;
  Pisl_basic_set_list = type Pointer;
  Pisl_set = type Pointer;
  Pisl_set_list = type Pointer;

function isl_basic_set_list_get_ctx(list: Pisl_basic_set_list): Pisl_ctx; cdecl; external libisl;
function isl_basic_set_to_list(el: Pisl_basic_set): Pisl_basic_set_list; cdecl; external libisl;
function isl_basic_set_list_from_basic_set(el: Pisl_basic_set): Pisl_basic_set_list; cdecl; external libisl;
function isl_basic_set_list_alloc(ctx: Pisl_ctx; n: longint): Pisl_basic_set_list; cdecl; external libisl;
function isl_basic_set_list_copy(list: Pisl_basic_set_list): Pisl_basic_set_list; cdecl; external libisl;
function isl_basic_set_list_free(list: Pisl_basic_set_list): Pisl_basic_set_list; cdecl; external libisl;
function isl_basic_set_list_add(list: Pisl_basic_set_list; el: Pisl_basic_set): Pisl_basic_set_list; cdecl; external libisl;
function isl_basic_set_list_insert(list: Pisl_basic_set_list; pos: dword; el: Pisl_basic_set): Pisl_basic_set_list; cdecl; external libisl;
function isl_basic_set_list_drop(list: Pisl_basic_set_list; first: dword; n: dword): Pisl_basic_set_list; cdecl; external libisl;
function isl_basic_set_list_clear(list: Pisl_basic_set_list): Pisl_basic_set_list; cdecl; external libisl;
function isl_basic_set_list_swap(list: Pisl_basic_set_list; pos1: dword; pos2: dword): Pisl_basic_set_list; cdecl; external libisl;
function isl_basic_set_list_reverse(list: Pisl_basic_set_list): Pisl_basic_set_list; cdecl; external libisl;
function isl_basic_set_list_concat(list1: Pisl_basic_set_list; list2: Pisl_basic_set_list): Pisl_basic_set_list; cdecl; external libisl;
function isl_basic_set_list_size(list: Pisl_basic_set_list): Tisl_size; cdecl; external libisl;
function isl_basic_set_list_n_basic_set(list: Pisl_basic_set_list): Tisl_size; cdecl; external libisl;
function isl_basic_set_list_get_at(list: Pisl_basic_set_list; index: longint): Pisl_basic_set; cdecl; external libisl;
function isl_basic_set_list_get_basic_set(list: Pisl_basic_set_list; index: longint): Pisl_basic_set; cdecl; external libisl;
function isl_basic_set_list_set_at(list: Pisl_basic_set_list; index: longint; el: Pisl_basic_set): Pisl_basic_set_list; cdecl; external libisl;
function isl_basic_set_list_set_basic_set(list: Pisl_basic_set_list; index: longint; el: Pisl_basic_set): Pisl_basic_set_list; cdecl; external libisl;

type
  TsetList_func1 = function(el: Pisl_basic_set; user: pointer): Tisl_stat; cdecl;
  TsetList_func2 = function(el: Pisl_basic_set; user: pointer): Tisl_bool; cdecl;
  TsetList_func3 = function(el: Pisl_basic_set; user: pointer): Pisl_basic_set; cdecl;
  TsetList_func4 = function(a: Pisl_basic_set; b: Pisl_basic_set; user: pointer): longint; cdecl;
  TsetList_func5 = function(a: Pisl_basic_set; b: Pisl_basic_set; user: pointer): Tisl_bool; cdecl;
  TsetList_func6 = function(scc: Pisl_basic_set_list; user: pointer): Tisl_stat; cdecl;
  TsetList_func7 = function(el: Pisl_set; user: pointer): Tisl_stat; cdecl;
  TsetList_func8 = function(el: Pisl_set; user: pointer): Tisl_bool; cdecl;
  TsetList_func9 = function(el: Pisl_set; user: pointer): Pisl_set; cdecl;
  TsetList_func10 = function(a: Pisl_set; b: Pisl_set; user: pointer): longint; cdecl;
  TsetList_func11 = function(a: Pisl_set; b: Pisl_set; user: pointer): Tisl_bool; cdecl;
  TsetList_func12 = function(scc: Pisl_set_list; user: pointer): Tisl_stat; cdecl;

function isl_basic_set_list_foreach(list: Pisl_basic_set_list; fn: TsetList_func1; user: pointer): Tisl_stat; cdecl; external libisl;
function isl_basic_set_list_every(list: Pisl_basic_set_list; test: TsetList_func2; user: pointer): Tisl_bool; cdecl; external libisl;
function isl_basic_set_list_map(list: Pisl_basic_set_list; fn: TsetList_func3; user: pointer): Pisl_basic_set_list; cdecl; external libisl;
function isl_basic_set_list_sort(list: Pisl_basic_set_list; cmp: TsetList_func4; user: pointer): Pisl_basic_set_list; cdecl; external libisl;
function isl_basic_set_list_foreach_scc(list: Pisl_basic_set_list; follows: TsetList_func5; follows_user: pointer; fn: TsetList_func6; fn_user: pointer): Tisl_stat; cdecl; external libisl;
function isl_basic_set_list_to_str(list: Pisl_basic_set_list): Pchar; cdecl; external libisl;
function isl_printer_print_basic_set_list(p: Pisl_printer; list: Pisl_basic_set_list): Pisl_printer; cdecl; external libisl;
procedure isl_basic_set_list_dump(list: Pisl_basic_set_list); cdecl; external libisl;
function isl_set_list_get_ctx(list: Pisl_set_list): Pisl_ctx; cdecl; external libisl;
function isl_set_to_list(el: Pisl_set): Pisl_set_list; cdecl; external libisl;
function isl_set_list_from_set(el: Pisl_set): Pisl_set_list; cdecl; external libisl;
function isl_set_list_alloc(ctx: Pisl_ctx; n: longint): Pisl_set_list; cdecl; external libisl;
function isl_set_list_copy(list: Pisl_set_list): Pisl_set_list; cdecl; external libisl;
function isl_set_list_free(list: Pisl_set_list): Pisl_set_list; cdecl; external libisl;
function isl_set_list_add(list: Pisl_set_list; el: Pisl_set): Pisl_set_list; cdecl; external libisl;
function isl_set_list_insert(list: Pisl_set_list; pos: dword; el: Pisl_set): Pisl_set_list; cdecl; external libisl;
function isl_set_list_drop(list: Pisl_set_list; first: dword; n: dword): Pisl_set_list; cdecl; external libisl;
function isl_set_list_clear(list: Pisl_set_list): Pisl_set_list; cdecl; external libisl;
function isl_set_list_swap(list: Pisl_set_list; pos1: dword; pos2: dword): Pisl_set_list; cdecl; external libisl;
function isl_set_list_reverse(list: Pisl_set_list): Pisl_set_list; cdecl; external libisl;
function isl_set_list_concat(list1: Pisl_set_list; list2: Pisl_set_list): Pisl_set_list; cdecl; external libisl;
function isl_set_list_size(list: Pisl_set_list): Tisl_size; cdecl; external libisl;
function isl_set_list_n_set(list: Pisl_set_list): Tisl_size; cdecl; external libisl;
function isl_set_list_get_at(list: Pisl_set_list; index: longint): Pisl_set; cdecl; external libisl;
function isl_set_list_get_set(list: Pisl_set_list; index: longint): Pisl_set; cdecl; external libisl;
function isl_set_list_set_at(list: Pisl_set_list; index: longint; el: Pisl_set): Pisl_set_list; cdecl; external libisl;
function isl_set_list_set_set(list: Pisl_set_list; index: longint; el: Pisl_set): Pisl_set_list; cdecl; external libisl;
function isl_set_list_foreach(list: Pisl_set_list; fn: TsetList_func7; user: pointer): Tisl_stat; cdecl; external libisl;
function isl_set_list_every(list: Pisl_set_list; test: TsetList_func8; user: pointer): Tisl_bool; cdecl; external libisl;
function isl_set_list_map(list: Pisl_set_list; fn: TsetList_func9; user: pointer): Pisl_set_list; cdecl; external libisl;
function isl_set_list_sort(list: Pisl_set_list; cmp: TsetList_func10; user: pointer): Pisl_set_list; cdecl; external libisl;
function isl_set_list_foreach_scc(list: Pisl_set_list; follows: TsetList_func11; follows_user: pointer; fn: TsetList_func12; fn_user: pointer): Tisl_stat; cdecl; external libisl;
function isl_set_list_to_str(list: Pisl_set_list): Pchar; cdecl; external libisl;
function isl_printer_print_set_list(p: Pisl_printer; list: Pisl_set_list): Pisl_printer; cdecl; external libisl;
procedure isl_set_list_dump(list: Pisl_set_list); cdecl; external libisl;
function isl_set_list_read_from_str(ctx: Pisl_ctx; str: Pchar): Pisl_set_list; cdecl; external libisl;

// === Konventiert am: 5-11-26 15:43:14 ===


implementation



end.
