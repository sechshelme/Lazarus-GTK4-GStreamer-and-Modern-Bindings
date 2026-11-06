unit vertices;

interface

uses
  fp_isl, ctx, map_type, aff_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Pisl_external_vertex = type Pointer;
  Pisl_vertex = Pisl_external_vertex;
  Pisl_cell = type Pointer;
  Pisl_vertices = type Pointer;

function isl_vertex_get_ctx(vertex: Pisl_vertex): Pisl_ctx; cdecl; external libisl;
function isl_vertex_get_id(vertex: Pisl_vertex): Tisl_size; cdecl; external libisl;
function isl_vertex_get_domain(vertex: Pisl_vertex): Pisl_basic_set; cdecl; external libisl;
function isl_vertex_get_expr(vertex: Pisl_vertex): Pisl_multi_aff; cdecl; external libisl;
function isl_vertex_free(vertex: Pisl_vertex): Pisl_vertex; cdecl; external libisl;
function isl_basic_set_compute_vertices(bset: Pisl_basic_set): Pisl_vertices; cdecl; external libisl;
function isl_vertices_get_ctx(vertices: Pisl_vertices): Pisl_ctx; cdecl; external libisl;
function isl_vertices_get_n_vertices(vertices: Pisl_vertices): Tisl_size; cdecl; external libisl;

type
  Tisl_vertices_func1 = function(vertex: Pisl_vertex; user: pointer): Tisl_stat; cdecl;
  Tisl_vertices_func2 = function(vertex: Pisl_vertex; user: pointer): Tisl_stat; cdecl;
  Tisl_vertices_func3 = function(cell: Pisl_cell; user: pointer): Tisl_stat; cdecl;

function isl_vertices_foreach_vertex(vertices: Pisl_vertices; fn: Tisl_vertices_func1; user: pointer): Tisl_stat; cdecl; external libisl;
function isl_vertices_free(vertices: Pisl_vertices): Pisl_vertices; cdecl; external libisl;
function isl_cell_get_ctx(cell: Pisl_cell): Pisl_ctx; cdecl; external libisl;
function isl_cell_get_domain(cell: Pisl_cell): Pisl_basic_set; cdecl; external libisl;
function isl_cell_foreach_vertex(cell: Pisl_cell; fn: Tisl_vertices_func2; user: pointer): Tisl_stat; cdecl; external libisl;
function isl_cell_free(cell: Pisl_cell): Pisl_cell; cdecl; external libisl;
function isl_vertices_foreach_cell(vertices: Pisl_vertices; fn: Tisl_vertices_func3; user: pointer): Tisl_stat; cdecl; external libisl;

// === Konventiert am: 5-11-26 16:55:26 ===


implementation



end.
