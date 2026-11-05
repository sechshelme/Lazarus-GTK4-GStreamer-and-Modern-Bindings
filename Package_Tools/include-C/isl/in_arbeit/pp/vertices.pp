
unit vertices;
interface

{
  Automatically converted by H2Pas 1.0.0 from vertices.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vertices.h
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
Pisl_basic_set  = ^isl_basic_set;
Pisl_cell  = ^isl_cell;
Pisl_ctx  = ^isl_ctx;
Pisl_external_vertex  = ^isl_external_vertex;
Pisl_multi_aff  = ^isl_multi_aff;
Pisl_vertex  = ^isl_vertex;
Pisl_vertices  = ^isl_vertices;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ISL_VERTICES_H}
{$define ISL_VERTICES_H}
{$include <isl/aff_type.h>}
{$include <isl/set_type.h>}
{$if defined(__cplusplus)}
{$endif}
type
  Pisl_external_vertex = ^Tisl_external_vertex;
  Tisl_external_vertex = record
      {undefined structure}
    end;

  Tisl_external_vertex = Tisl_vertex;
  Pisl_cell = ^Tisl_cell;
  Tisl_cell = record
      {undefined structure}
    end;

  Pisl_vertices = ^Tisl_vertices;
  Tisl_vertices = record
      {undefined structure}
    end;


function isl_vertex_get_ctx(vertex:Pisl_vertex):Pisl_ctx;cdecl;external;
function isl_vertex_get_id(vertex:Pisl_vertex):Tisl_size;cdecl;external;
function isl_vertex_get_domain(vertex:Pisl_vertex):Pisl_basic_set;cdecl;external;
function isl_vertex_get_expr(vertex:Pisl_vertex):Pisl_multi_aff;cdecl;external;
function isl_vertex_free(vertex:Pisl_vertex):Pisl_vertex;cdecl;external;
function isl_basic_set_compute_vertices(bset:Pisl_basic_set):Pisl_vertices;cdecl;external;
function isl_vertices_get_ctx(vertices:Pisl_vertices):Pisl_ctx;cdecl;external;
function isl_vertices_get_n_vertices(vertices:Pisl_vertices):Tisl_size;cdecl;external;
function isl_vertices_foreach_vertex(vertices:Pisl_vertices; fn:function (vertex:Pisl_vertex; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external;
function isl_vertices_free(vertices:Pisl_vertices):Pisl_vertices;cdecl;external;
function isl_cell_get_ctx(cell:Pisl_cell):Pisl_ctx;cdecl;external;
function isl_cell_get_domain(cell:Pisl_cell):Pisl_basic_set;cdecl;external;
function isl_cell_foreach_vertex(cell:Pisl_cell; fn:function (vertex:Pisl_vertex; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external;
function isl_cell_free(cell:Pisl_cell):Pisl_cell;cdecl;external;
function isl_vertices_foreach_cell(vertices:Pisl_vertices; fn:function (cell:Pisl_cell; user:pointer):Tisl_stat; user:pointer):Tisl_stat;cdecl;external;
{$endif}

implementation


end.
