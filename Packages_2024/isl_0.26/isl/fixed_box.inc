{$IFDEF read_interface}


type
  Pisl_fixed_box = type Pointer;

function isl_fixed_box_get_ctx(box:Pisl_fixed_box):Pisl_ctx;cdecl;external libisl;
function isl_fixed_box_get_space(box:Pisl_fixed_box):Pisl_space;cdecl;external libisl;
function isl_fixed_box_is_valid(box:Pisl_fixed_box):Tisl_bool;cdecl;external libisl;
function isl_fixed_box_get_offset(box:Pisl_fixed_box):Pisl_multi_aff;cdecl;external libisl;
function isl_fixed_box_get_size(box:Pisl_fixed_box):Pisl_multi_val;cdecl;external libisl;
function isl_fixed_box_copy(box:Pisl_fixed_box):Pisl_fixed_box;cdecl;external libisl;
function isl_fixed_box_free(box:Pisl_fixed_box):Pisl_fixed_box;cdecl;external libisl;
function isl_fixed_box_read_from_str(ctx:Pisl_ctx; str:Pchar):Pisl_fixed_box;cdecl;external libisl;
function isl_printer_print_fixed_box(p:Pisl_printer; box:Pisl_fixed_box):Pisl_printer;cdecl;external libisl;
function isl_fixed_box_to_str(box:Pisl_fixed_box):Pchar;cdecl;external libisl;
procedure isl_fixed_box_dump(box:Pisl_fixed_box);cdecl;external libisl;

// === Konventiert am: 4-11-26 20:16:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
