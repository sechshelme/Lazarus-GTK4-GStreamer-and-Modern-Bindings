unit local_space;

interface

uses
  fp_isl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_LOCAL_SPACE_H}
{$define ISL_LOCAL_SPACE_H}
{$include <isl/aff_type.h>}
{$include <isl/space_type.h>}
{$include <isl/printer.h>}
{$include <isl/map_type.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_local_space = ^Tisl_local_space;
  Tisl_local_space = record
      {undefined structure}
    end;


function isl_local_space_get_ctx(ls:Pisl_local_space):Pisl_ctx;cdecl;external libisl;
function isl_local_space_from_space(space:Pisl_space):Pisl_local_space;cdecl;external libisl;
function isl_local_space_copy(ls:Pisl_local_space):Pisl_local_space;cdecl;external libisl;
function isl_local_space_free(ls:Pisl_local_space):Pisl_local_space;cdecl;external libisl;
function isl_local_space_is_params(ls:Pisl_local_space):Tisl_bool;cdecl;external libisl;
function isl_local_space_is_set(ls:Pisl_local_space):Tisl_bool;cdecl;external libisl;
function isl_local_space_set_tuple_id(ls:Pisl_local_space; _type:Tisl_dim_type; id:Pisl_id):Pisl_local_space;cdecl;external libisl;
function isl_local_space_dim(ls:Pisl_local_space; _type:Tisl_dim_type):Tisl_size;cdecl;external libisl;
function isl_local_space_has_dim_name(ls:Pisl_local_space; _type:Tisl_dim_type; pos:dword):Tisl_bool;cdecl;external libisl;
function isl_local_space_get_dim_name(ls:Pisl_local_space; _type:Tisl_dim_type; pos:dword):Pchar;cdecl;external libisl;
function isl_local_space_set_dim_name(ls:Pisl_local_space; _type:Tisl_dim_type; pos:dword; s:Pchar):Pisl_local_space;cdecl;external libisl;
function isl_local_space_has_dim_id(ls:Pisl_local_space; _type:Tisl_dim_type; pos:dword):Tisl_bool;cdecl;external libisl;
function isl_local_space_get_dim_id(ls:Pisl_local_space; _type:Tisl_dim_type; pos:dword):Pisl_id;cdecl;external libisl;
function isl_local_space_set_dim_id(ls:Pisl_local_space; _type:Tisl_dim_type; pos:dword; id:Pisl_id):Pisl_local_space;cdecl;external libisl;
function isl_local_space_get_space(ls:Pisl_local_space):Pisl_space;cdecl;external libisl;
function isl_local_space_get_div(ls:Pisl_local_space; pos:longint):Pisl_aff;cdecl;external libisl;
function isl_local_space_find_dim_by_name(ls:Pisl_local_space; _type:Tisl_dim_type; name:Pchar):longint;cdecl;external libisl;
function isl_local_space_domain(ls:Pisl_local_space):Pisl_local_space;cdecl;external libisl;
function isl_local_space_range(ls:Pisl_local_space):Pisl_local_space;cdecl;external libisl;
function isl_local_space_from_domain(ls:Pisl_local_space):Pisl_local_space;cdecl;external libisl;
function isl_local_space_add_dims(ls:Pisl_local_space; _type:Tisl_dim_type; n:dword):Pisl_local_space;cdecl;external libisl;
function isl_local_space_drop_dims(ls:Pisl_local_space; _type:Tisl_dim_type; first:dword; n:dword):Pisl_local_space;cdecl;external libisl;
function isl_local_space_insert_dims(ls:Pisl_local_space; _type:Tisl_dim_type; first:dword; n:dword):Pisl_local_space;cdecl;external libisl;
function isl_local_space_set_from_params(ls:Pisl_local_space):Pisl_local_space;cdecl;external libisl;
function isl_local_space_intersect(ls1:Pisl_local_space; ls2:Pisl_local_space):Pisl_local_space;cdecl;external libisl;
function isl_local_space_wrap(ls:Pisl_local_space):Pisl_local_space;cdecl;external libisl;
function isl_local_space_is_equal(ls1:Pisl_local_space; ls2:Pisl_local_space):Tisl_bool;cdecl;external libisl;
function isl_local_space_lifting(ls:Pisl_local_space):Pisl_basic_map;cdecl;external libisl;
function isl_local_space_flatten_domain(ls:Pisl_local_space):Pisl_local_space;cdecl;external libisl;
function isl_local_space_flatten_range(ls:Pisl_local_space):Pisl_local_space;cdecl;external libisl;
function isl_printer_print_local_space(p:Pisl_printer; ls:Pisl_local_space):Pisl_printer;cdecl;external libisl;
procedure isl_local_space_dump(ls:Pisl_local_space);cdecl;external libisl;
{$endif}

// === Konventiert am: 5-11-26 15:29:00 ===


implementation



end.
