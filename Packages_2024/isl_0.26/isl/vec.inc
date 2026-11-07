{$IFDEF read_interface}


type
  Pisl_vec = type Pointer;

function isl_vec_alloc(ctx: Pisl_ctx; size: dword): Pisl_vec; cdecl; external libisl;
function isl_vec_zero(ctx: Pisl_ctx; size: dword): Pisl_vec; cdecl; external libisl;
function isl_vec_copy(vec: Pisl_vec): Pisl_vec; cdecl; external libisl;
function isl_vec_free(vec: Pisl_vec): Pisl_vec; cdecl; external libisl;
function isl_vec_get_ctx(vec: Pisl_vec): Pisl_ctx; cdecl; external libisl;
function isl_vec_size(vec: Pisl_vec): Tisl_size; cdecl; external libisl;
function isl_vec_get_element_val(vec: Pisl_vec; pos: longint): Pisl_val; cdecl; external libisl;
function isl_vec_set_element_si(vec: Pisl_vec; pos: longint; v: longint): Pisl_vec; cdecl; external libisl;
function isl_vec_set_element_val(vec: Pisl_vec; pos: longint; v: Pisl_val): Pisl_vec; cdecl; external libisl;
function isl_vec_is_equal(vec1: Pisl_vec; vec2: Pisl_vec): Tisl_bool; cdecl; external libisl;
function isl_vec_cmp_element(vec1: Pisl_vec; vec2: Pisl_vec; pos: longint): longint; cdecl; external libisl;
procedure isl_vec_dump(vec: Pisl_vec); cdecl; external libisl;
function isl_printer_print_vec(printer: Pisl_printer; vec: Pisl_vec): Pisl_printer; cdecl; external libisl;
function isl_vec_ceil(vec: Pisl_vec): Pisl_vec; cdecl; external libisl;
function isl_vec_normalize(vec: Pisl_vec): Pisl_vec; cdecl; external libisl;
function isl_vec_set_si(vec: Pisl_vec; v: longint): Pisl_vec; cdecl; external libisl;
function isl_vec_set_val(vec: Pisl_vec; v: Pisl_val): Pisl_vec; cdecl; external libisl;
function isl_vec_clr(vec: Pisl_vec): Pisl_vec; cdecl; external libisl;
function isl_vec_neg(vec: Pisl_vec): Pisl_vec; cdecl; external libisl;
function isl_vec_add(vec1: Pisl_vec; vec2: Pisl_vec): Pisl_vec; cdecl; external libisl;
function isl_vec_extend(vec: Pisl_vec; size: dword): Pisl_vec; cdecl; external libisl;
function isl_vec_zero_extend(vec: Pisl_vec; size: dword): Pisl_vec; cdecl; external libisl;
function isl_vec_concat(vec1: Pisl_vec; vec2: Pisl_vec): Pisl_vec; cdecl; external libisl;
function isl_vec_sort(vec: Pisl_vec): Pisl_vec; cdecl; external libisl;
function isl_vec_read_from_file(ctx: Pisl_ctx; input: PFILE): Pisl_vec; cdecl; external libisl;
function isl_vec_drop_els(vec: Pisl_vec; pos: dword; n: dword): Pisl_vec; cdecl; external libisl;
function isl_vec_add_els(vec: Pisl_vec; n: dword): Pisl_vec; cdecl; external libisl;
function isl_vec_insert_els(vec: Pisl_vec; pos: dword; n: dword): Pisl_vec; cdecl; external libisl;
function isl_vec_insert_zero_els(vec: Pisl_vec; pos: dword; n: dword): Pisl_vec; cdecl; external libisl;
function isl_vec_move_els(vec: Pisl_vec; dst_col: dword; src_col: dword; n: dword): Pisl_vec; cdecl; external libisl;

// === Konventiert am: 5-11-26 16:55:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
