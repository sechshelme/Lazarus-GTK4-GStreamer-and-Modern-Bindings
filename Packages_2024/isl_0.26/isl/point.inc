{$IFDEF read_interface}


type
  Pisl_point = type Pointer;

function isl_point_get_ctx(pnt: Pisl_point): Pisl_ctx; cdecl; external libisl;
function isl_point_get_space(pnt: Pisl_point): Pisl_space; cdecl; external libisl;
function isl_point_zero(space: Pisl_space): Pisl_point; cdecl; external libisl;
function isl_point_copy(pnt: Pisl_point): Pisl_point; cdecl; external libisl;
function isl_point_free(pnt: Pisl_point): Pisl_point; cdecl; external libisl;
function isl_point_get_coordinate_val(pnt: Pisl_point; _type: Tisl_dim_type; pos: longint): Pisl_val; cdecl; external libisl;
function isl_point_set_coordinate_val(pnt: Pisl_point; _type: Tisl_dim_type; pos: longint; v: Pisl_val): Pisl_point; cdecl; external libisl;
function isl_point_get_multi_val(pnt: Pisl_point): Pisl_multi_val; cdecl; external libisl;
function isl_point_add_ui(pnt: Pisl_point; _type: Tisl_dim_type; pos: longint; val: dword): Pisl_point; cdecl; external libisl;
function isl_point_sub_ui(pnt: Pisl_point; _type: Tisl_dim_type; pos: longint; val: dword): Pisl_point; cdecl; external libisl;
function isl_point_void(space: Pisl_space): Pisl_point; cdecl; external libisl;
function isl_point_is_void(pnt: Pisl_point): Tisl_bool; cdecl; external libisl;
function isl_printer_print_point(printer: Pisl_printer; pnt: Pisl_point): Pisl_printer; cdecl; external libisl;
function isl_point_to_str(pnt: Pisl_point): Pchar; cdecl; external libisl;
procedure isl_point_dump(pnt: Pisl_point); cdecl; external libisl;

// === Konventiert am: 5-11-26 15:45:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
