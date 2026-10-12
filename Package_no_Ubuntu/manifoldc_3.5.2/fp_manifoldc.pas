unit fp_manifoldc;

interface

// nicht in der lib !!!!
// manifold_cross_section_warp_context(Pointer(Fmem), cs.Fobj, fun, ctx);


const
  {$IFDEF Linux}
  libmanifoldc = 'manifoldc';
  {$ENDIF}

  {$IFDEF Windows}
  libmanifoldc = 'libmanifoldc.dll';
  {$ENDIF}

type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // ===== types.h

type
  PManifoldManifold = type Pointer;
  PManifoldManifoldVec = type Pointer;
  PManifoldCrossSection = type Pointer;
  PManifoldCrossSectionVec = type Pointer;
  PManifoldRayHitVec =type Pointer;
  PManifoldSimplePolygon = type Pointer;
  PPManifoldSimplePolygon = ^PManifoldSimplePolygon;
  PManifoldPolygons = type Pointer;
  PManifoldMeshGL = type Pointer;
  PManifoldMeshGL64 = type Pointer;
  PManifoldBox = type Pointer;
  PManifoldRect = type Pointer;
  PManifoldTriangulation = type Pointer;
  PManifoldExecutionContext =type Pointer;

type
  TManifoldManifoldPair = record
    first: PManifoldManifold;
    second: PManifoldManifold;
  end;
  PManifoldManifoldPair = ^TManifoldManifoldPair;

  TManifoldVec2 = record
    x: double;
    y: double;
  end;
  PManifoldVec2 = ^TManifoldVec2;

  TManifoldVec3 = record
    x: double;
    y: double;
    z: double;
  end;
  PManifoldVec3 = ^TManifoldVec3;

  TManifoldIVec3 = record
    x: longint;
    y: longint;
    z: longint;
  end;
  PManifoldIVec3 = ^TManifoldIVec3;

  TManifoldVec4 = record
    x: double;
    y: double;
    z: double;
    w: double;
  end;
  PManifoldVec4 = ^TManifoldVec4;

  TManifoldProperties = record
    surface_area: double;
    volume: double;
  end;
  PManifoldProperties = ^TManifoldProperties;

  TManifoldMeshGLOptions = record
    run_indices: Puint32_t;
    run_indices_length: Tsize_t;
    run_original_ids: Puint32_t;
    run_original_ids_length: Tsize_t;
    merge_from_vert: Puint32_t;
    merge_to_vert: Puint32_t;
    merge_verts_length: Tsize_t;
    halfedge_tangents: Psingle;
  end;
  PManifoldMeshGLOptions = ^TManifoldMeshGLOptions;

  TManifoldMeshGL64Options = record
    run_indices: Puint64_t;
    run_indices_length: Tsize_t;
    run_original_ids: Puint32_t;
    run_original_ids_length: Tsize_t;
    merge_from_vert: Puint64_t;
    merge_to_vert: Puint64_t;
    merge_verts_length: Tsize_t;
    halfedge_tangents: Pdouble;
  end;
  PManifoldMeshGL64Options = ^TManifoldMeshGL64Options;

type
  TManifoldRayHit = record
    face_id: Tuint64_t;
    distance: Double;
    position: TManifoldVec3;
    normal: TManifoldVec3;
  end;
  PManifoldRayHit = ^TManifoldRayHit;

type
  PManifoldOpType = ^TManifoldOpType;
  TManifoldOpType = longint;

const
  MANIFOLD_ADD = 0;
  MANIFOLD_SUBTRACT = 1;
  MANIFOLD_INTERSECT = 2;

type
  PManifoldError = ^TManifoldError;
  TManifoldError = longint;

const
  MANIFOLD_NO_ERROR = 0;
  MANIFOLD_NON_FINITE_VERTEX = 1;
  MANIFOLD_NOT_MANIFOLD = 2;
  MANIFOLD_VERTEX_INDEX_OUT_OF_BOUNDS = 3;
  MANIFOLD_PROPERTIES_WRONG_LENGTH = 4;
  MANIFOLD_MISSING_POSITION_PROPERTIES = 5;
  MANIFOLD_MERGE_VECTORS_DIFFERENT_LENGTHS = 6;
  MANIFOLD_MERGE_INDEX_OUT_OF_BOUNDS = 7;
  MANIFOLD_TRANSFORM_WRONG_LENGTH = 8;
  MANIFOLD_RUN_INDEX_WRONG_LENGTH = 9;
  MANIFOLD_FACE_ID_WRONG_LENGTH = 10;
  MANIFOLD_INVALID_CONSTRUCTION = 11;
  MANIFOLD_RESULT_TOO_LARGE = 12;
  MANIFOLD_INVALID_TANGENTS=13;
  MANIFOLD_CANCELLED=14;

type
  PManifoldJoinType = ^TManifoldJoinType;
  TManifoldJoinType = longint;

const
  MANIFOLD_JOIN_TYPE_SQUARE = 0;
  MANIFOLD_JOIN_TYPE_ROUND = 1;
  MANIFOLD_JOIN_TYPE_MITER = 2;
  MANIFOLD_JOIN_TYPE_BEVEL = 3;

type
  TManifoldSdf = function(para1: double; para2: double; para3: double; para4: pointer): double; cdecl;


  // ===== manifoldc.h

function manifold_simple_polygon(mem: pointer; ps: PManifoldVec2; length: Tsize_t): PManifoldSimplePolygon; cdecl; external libmanifoldc;
function manifold_polygons(mem: pointer; ps: PPManifoldSimplePolygon; length: Tsize_t): PManifoldPolygons; cdecl; external libmanifoldc;
function manifold_simple_polygon_length(p: PManifoldSimplePolygon): Tsize_t; cdecl; external libmanifoldc;
function manifold_polygons_length(ps: PManifoldPolygons): Tsize_t; cdecl; external libmanifoldc;
function manifold_polygons_simple_length(ps: PManifoldPolygons; idx: Tsize_t): Tsize_t; cdecl; external libmanifoldc;
function manifold_simple_polygon_get_point(p: PManifoldSimplePolygon; idx: Tsize_t): TManifoldVec2; cdecl; external libmanifoldc;
function manifold_polygons_get_simple(mem: pointer; ps: PManifoldPolygons; idx: Tsize_t): PManifoldSimplePolygon; cdecl; external libmanifoldc;
function manifold_polygons_get_point(ps: PManifoldPolygons; simple_idx: Tsize_t; pt_idx: Tsize_t): TManifoldVec2; cdecl; external libmanifoldc;

function manifold_meshgl(mem: pointer; vert_props: Psingle; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint32_t; n_tris: Tsize_t): PManifoldMeshGL; cdecl; external libmanifoldc;
function manifold_meshgl_w_tangents(mem: pointer; vert_props: Psingle; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint32_t; n_tris: Tsize_t; halfedge_tangent: Psingle): PManifoldMeshGL; cdecl; external libmanifoldc;
function manifold_meshgl_w_options(mem:pointer; vert_props:Psingle; n_verts:Tsize_t; n_props:Tsize_t; tri_verts:Puint32_t;           n_tris:Tsize_t; options:PManifoldMeshGLOptions):PManifoldMeshGL;cdecl;external libmanifoldc;
function manifold_get_meshgl(mem: pointer; m: PManifoldManifold): PManifoldMeshGL; cdecl; external libmanifoldc;
function manifold_get_meshgl_w_normals(mem:pointer; m:PManifoldManifold; normalIdx:Tint32_t):PManifoldMeshGL;cdecl;external libmanifoldc;

function manifold_meshgl_copy(mem: pointer; m: PManifoldMeshGL): PManifoldMeshGL; cdecl; external libmanifoldc;
function manifold_meshgl_merge(mem: pointer; m: PManifoldMeshGL): PManifoldMeshGL; cdecl; external libmanifoldc;
function manifold_meshgl64(mem: pointer; vert_props: Pdouble; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint64_t; n_tris: Tsize_t): PManifoldMeshGL64; cdecl; external libmanifoldc;
function manifold_meshgl64_w_tangents(mem: pointer; vert_props: Pdouble; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint64_t; n_tris: Tsize_t; halfedge_tangent: Pdouble): PManifoldMeshGL64; cdecl; external libmanifoldc;

function manifold_meshgl64_w_options(mem:pointer; vert_props:Pdouble; n_verts:Tsize_t; n_props:Tsize_t; tri_verts:Puint64_t;           n_tris:Tsize_t; options:PManifoldMeshGL64Options):PManifoldMeshGL64;cdecl;external libmanifoldc;
function manifold_get_meshgl64(mem: pointer; m: PManifoldManifold): PManifoldMeshGL64; cdecl; external libmanifoldc;

function manifold_get_meshgl64_w_normals(mem:pointer; m:PManifoldManifold; normalIdx:Tint32_t):PManifoldMeshGL64;cdecl;external libmanifoldc;
function manifold_meshgl64_copy(mem: pointer; m: PManifoldMeshGL64): PManifoldMeshGL64; cdecl; external libmanifoldc;
function manifold_meshgl64_merge(mem: pointer; m: PManifoldMeshGL64): PManifoldMeshGL64; cdecl; external libmanifoldc;

function manifold_level_set(mem: pointer; sdf: TManifoldSdf; bounds: PManifoldBox; edge_length: double; level: double; tolerance: double; ctx: pointer): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_level_set_seq(mem: pointer; sdf: TManifoldSdf; bounds: PManifoldBox; edge_length: double; level: double; tolerance: double; ctx: pointer): PManifoldManifold; cdecl; external libmanifoldc;

function manifold_manifold_empty_vec(mem: pointer): PManifoldManifoldVec; cdecl; external libmanifoldc;
function manifold_manifold_vec(mem: pointer; sz: Tsize_t): PManifoldManifoldVec; cdecl; external libmanifoldc;
procedure manifold_manifold_vec_reserve(ms: PManifoldManifoldVec; sz: Tsize_t); cdecl; external libmanifoldc;
function manifold_manifold_vec_length(ms: PManifoldManifoldVec): Tsize_t; cdecl; external libmanifoldc;
function manifold_manifold_vec_get(mem: pointer; ms: PManifoldManifoldVec; idx: Tsize_t): PManifoldManifold; cdecl; external libmanifoldc;
procedure manifold_manifold_vec_set(ms: PManifoldManifoldVec; idx: Tsize_t; m: PManifoldManifold); cdecl; external libmanifoldc;
procedure manifold_manifold_vec_push_back(ms: PManifoldManifoldVec; m: PManifoldManifold); cdecl; external libmanifoldc;

function manifold_boolean(mem: pointer; a: PManifoldManifold; b: PManifoldManifold; op: TManifoldOpType): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_batch_boolean(mem: pointer; ms: PManifoldManifoldVec; op: TManifoldOpType): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_union(mem: pointer; a: PManifoldManifold; b: PManifoldManifold): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_difference(mem: pointer; a: PManifoldManifold; b: PManifoldManifold): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_intersection(mem: pointer; a: PManifoldManifold; b: PManifoldManifold): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_split(mem_first: pointer; mem_second: pointer; a: PManifoldManifold; b: PManifoldManifold): TManifoldManifoldPair; cdecl; external libmanifoldc;
function manifold_split_by_plane(mem_first: pointer; mem_second: pointer; m: PManifoldManifold; normal_x: double; normal_y: double; normal_z: double; offset: double): TManifoldManifoldPair; cdecl; external libmanifoldc;
function manifold_minkowski_sum(mem:pointer; a:PManifoldManifold; b:PManifoldManifold):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_minkowski_difference(mem:pointer; a:PManifoldManifold; b:PManifoldManifold):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_trim_by_plane(mem: pointer; m: PManifoldManifold; normal_x: double; normal_y: double; normal_z: double; offset: double): PManifoldManifold; cdecl; external libmanifoldc;

function manifold_slice(mem: pointer; m: PManifoldManifold; height: double): PManifoldPolygons; cdecl; external libmanifoldc;
function manifold_project(mem: pointer; m: PManifoldManifold): PManifoldPolygons; cdecl; external libmanifoldc;

function manifold_hull(mem: pointer; m: PManifoldManifold): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_batch_hull(mem: pointer; ms: PManifoldManifoldVec): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_hull_pts(mem: pointer; ps: PManifoldVec3; length: Tsize_t): PManifoldManifold; cdecl; external libmanifoldc;

function manifold_translate(mem: pointer; m: PManifoldManifold; x: double; y: double; z: double): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_rotate(mem: pointer; m: PManifoldManifold; x: double; y: double; z: double): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_scale(mem: pointer; m: PManifoldManifold; x: double; y: double; z: double): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_transform(mem: pointer; m: PManifoldManifold; x1: double; y1: double; z1: double; x2: double; y2: double; z2: double; x3: double; y3: double; z3: double; x4: double; y4: double; z4: double): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_mirror(mem: pointer; m: PManifoldManifold; nx: double; ny: double; nz: double): PManifoldManifold; cdecl; external libmanifoldc;

type
  Twarp_func = function(para1: double; para2: double; para3: double; para4: pointer): TManifoldVec3; cdecl;

function manifold_warp(mem: pointer; m: PManifoldManifold; fun: Twarp_func; ctx: pointer): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_smooth_by_normals(mem: pointer; m: PManifoldManifold; normalIdx: longint): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_smooth_out(mem: pointer; m: PManifoldManifold; minSharpAngle: double; minSmoothness: double): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_refine(mem: pointer; m: PManifoldManifold; refine: longint): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_refine_to_length(mem: pointer; m: PManifoldManifold; length: double): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_refine_to_tolerance(mem: pointer; m: PManifoldManifold; tolerance: double): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_set_tolerance(mem: pointer; m: PManifoldManifold; tolerance: double): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_simplify(mem: pointer; m: PManifoldManifold; tolerance: double): PManifoldManifold; cdecl; external libmanifoldc;

function manifold_empty(mem: pointer): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_copy(mem: pointer; m: PManifoldManifold): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_tetrahedron(mem: pointer): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_cube(mem: pointer; x: double; y: double; z: double; center: longint): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_cylinder(mem: pointer; height: double; radius_low: double; radius_high: double; circular_segments: longint; center: longint): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_sphere(mem: pointer; radius: double; circular_segments: longint): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_of_meshgl(mem: pointer; mesh: PManifoldMeshGL): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_of_meshgl64(mem: pointer; mesh: PManifoldMeshGL64): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_smooth(mem: pointer; mesh: PManifoldMeshGL; half_edges: Psize_t; smoothness: Pdouble; n_idxs: Tsize_t): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_smooth64(mem: pointer; mesh: PManifoldMeshGL64; half_edges: Psize_t; smoothness: Pdouble; n_idxs: Tsize_t): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_extrude(mem: pointer; cs: PManifoldPolygons; height: double; slices: longint; twist_degrees: double; scale_x: double; scale_y: double): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_revolve(mem: pointer; cs: PManifoldPolygons; circular_segments: longint; revolve_degrees: double): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_compose(mem: pointer; ms: PManifoldManifoldVec): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_decompose(mem: pointer; m: PManifoldManifold): PManifoldManifoldVec; cdecl; external libmanifoldc;
function manifold_as_original(mem: pointer; m: PManifoldManifold): PManifoldManifold; cdecl; external libmanifoldc;

function manifold_is_empty(m: PManifoldManifold): longint; cdecl; external libmanifoldc;
function manifold_status(m: PManifoldManifold): TManifoldError; cdecl; external libmanifoldc;
function manifold_with_context(mem: pointer; m: PManifoldManifold; ctx: PManifoldExecutionContext): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_num_vert(m: PManifoldManifold): Tsize_t; cdecl; external libmanifoldc;
function manifold_num_edge(m: PManifoldManifold): Tsize_t; cdecl; external libmanifoldc;
function manifold_num_tri(m: PManifoldManifold): Tsize_t; cdecl; external libmanifoldc;
function manifold_num_prop(m: PManifoldManifold): Tsize_t; cdecl; external libmanifoldc;
function manifold_bounding_box(mem: pointer; m: PManifoldManifold): PManifoldBox; cdecl; external libmanifoldc;
function manifold_epsilon(m: PManifoldManifold): double; cdecl; external libmanifoldc;
function manifold_get_tolerance(m: PManifoldManifold): double; cdecl; external libmanifoldc;
function manifold_num_prop_vert(m: PManifoldManifold): Tsize_t; cdecl; external libmanifoldc;
function manifold_genus(m: PManifoldManifold): longint; cdecl; external libmanifoldc;
function manifold_surface_area(m: PManifoldManifold): double; cdecl; external libmanifoldc;
function manifold_volume(m: PManifoldManifold): double; cdecl; external libmanifoldc;
function manifold_get_circular_segments(radius: double): longint; cdecl; external libmanifoldc;
function manifold_original_id(m: PManifoldManifold): longint; cdecl; external libmanifoldc;
function manifold_reserve_ids(n: Tuint32_t): Tuint32_t; cdecl; external libmanifoldc;

type
  Tproperties_func = procedure(new_prop: Pdouble; position: TManifoldVec3; old_prop: Pdouble; ctx: pointer); cdecl;

function manifold_set_properties(mem: pointer; m: PManifoldManifold; num_prop: longint; fun: Tproperties_func; ctx: pointer): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_calculate_curvature(mem: pointer; m: PManifoldManifold; gaussian_idx: longint; mean_idx: longint): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_min_gap(m: PManifoldManifold; other: PManifoldManifold; searchLength: double): double; cdecl; external libmanifoldc;
function manifold_calculate_normals(mem: pointer; m: PManifoldManifold; normal_idx: longint; min_sharp_angle: double): PManifoldManifold; cdecl; external libmanifoldc;

function manifold_ray_cast(mem: pointer; m: PManifoldManifold; origin_x: double; origin_y: double; origin_z: double; end_x: double; end_y: double; end_z: double): PManifoldRayHitVec; cdecl; external libmanifoldc;
function manifold_ray_hit_vec_length(v: PManifoldRayHitVec): Tsize_t; cdecl; external libmanifoldc;
function manifold_ray_hit_vec_get(v: PManifoldRayHitVec; idx: Tsize_t): TManifoldRayHit; cdecl; external libmanifoldc;

function manifold_winding_number(m: PManifoldManifold; x: double; y: double; z: double): longint; cdecl; external libmanifoldc;

function manifold_execution_context(mem: pointer): PManifoldExecutionContext; cdecl; external libmanifoldc;
procedure manifold_execution_context_cancel(ctx: PManifoldExecutionContext); cdecl; external libmanifoldc;
function manifold_execution_context_cancelled(ctx: PManifoldExecutionContext): longint; cdecl; external libmanifoldc;
function manifold_execution_context_progress(ctx: PManifoldExecutionContext): double; cdecl; external libmanifoldc;

function manifold_execution_context_level_set(mem: pointer; ec: PManifoldExecutionContext; sdf: TManifoldSdf; bounds: PManifoldBox; edge_length: double; level: double; tolerance: double; sdf_context: pointer): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_execution_context_level_set_seq(mem: pointer; ec: PManifoldExecutionContext; sdf: TManifoldSdf; bounds: PManifoldBox; edge_length: double; level: double; tolerance: double; sdf_context: pointer): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_execution_context_of_meshgl(mem: pointer; ec: PManifoldExecutionContext; mesh: PManifoldMeshGL): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_execution_context_of_meshgl64(mem: pointer; ec: PManifoldExecutionContext; mesh: PManifoldMeshGL64): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_execution_context_smooth(mem: pointer; ec: PManifoldExecutionContext; mesh: PManifoldMeshGL; half_edges: Psize_t; smoothness: Pdouble; n_edges: Tsize_t): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_execution_context_smooth64(mem: pointer; ec: PManifoldExecutionContext; mesh: PManifoldMeshGL64; half_edges: Psize_t; smoothness: Pdouble; n_edges: Tsize_t): PManifoldManifold; cdecl; external libmanifoldc;

(******)function manifold_cross_section_empty(mem: pointer): PManifoldCrossSection; cdecl; external libmanifoldc;
(******)function manifold_cross_section_copy(mem: pointer; cs: PManifoldCrossSection): PManifoldCrossSection; cdecl; external libmanifoldc;
(******)function manifold_cross_section_of_simple_polygon(mem: pointer; p: PManifoldSimplePolygon): PManifoldCrossSection; cdecl; external libmanifoldc;
(******)function manifold_cross_section_of_polygons(mem: pointer; p: PManifoldPolygons): PManifoldCrossSection; cdecl; external libmanifoldc;
(******)function manifold_cross_section_square(mem: pointer; x: double; y: double; center: longint): PManifoldCrossSection; cdecl; external libmanifoldc;
(******)function manifold_cross_section_circle(mem: pointer; radius: double; circular_segments: longint): PManifoldCrossSection; cdecl; external libmanifoldc;
(******)function manifold_cross_section_compose(mem: pointer; csv: PManifoldCrossSectionVec): PManifoldCrossSection; cdecl; external libmanifoldc;
function manifold_cross_section_decompose(mem: pointer; cs: PManifoldCrossSection): PManifoldCrossSectionVec; cdecl; external libmanifoldc;

function manifold_cross_section_empty_vec(mem: pointer): PManifoldCrossSectionVec; cdecl; external libmanifoldc;
function manifold_cross_section_vec(mem: pointer; sz: Tsize_t): PManifoldCrossSectionVec; cdecl; external libmanifoldc;
procedure manifold_cross_section_vec_reserve(csv: PManifoldCrossSectionVec; sz: Tsize_t); cdecl; external libmanifoldc;
function manifold_cross_section_vec_length(csv: PManifoldCrossSectionVec): Tsize_t; cdecl; external libmanifoldc;
function manifold_cross_section_vec_get(mem: pointer; csv: PManifoldCrossSectionVec; idx: Tsize_t): PManifoldCrossSection; cdecl; external libmanifoldc;
procedure manifold_cross_section_vec_set(csv: PManifoldCrossSectionVec; idx: Tsize_t; cs: PManifoldCrossSection); cdecl; external libmanifoldc;
procedure manifold_cross_section_vec_push_back(csv: PManifoldCrossSectionVec; cs: PManifoldCrossSection); cdecl; external libmanifoldc;

function manifold_cross_section_boolean(mem: pointer; a: PManifoldCrossSection; b: PManifoldCrossSection; op: TManifoldOpType): PManifoldCrossSection; cdecl; external libmanifoldc;
function manifold_cross_section_batch_boolean(mem: pointer; csv: PManifoldCrossSectionVec; op: TManifoldOpType): PManifoldCrossSection; cdecl; external libmanifoldc;
function manifold_cross_section_union(mem: pointer; a: PManifoldCrossSection; b: PManifoldCrossSection): PManifoldCrossSection; cdecl; external libmanifoldc;
function manifold_cross_section_difference(mem: pointer; a: PManifoldCrossSection; b: PManifoldCrossSection): PManifoldCrossSection; cdecl; external libmanifoldc;
function manifold_cross_section_intersection(mem: pointer; a: PManifoldCrossSection; b: PManifoldCrossSection): PManifoldCrossSection; cdecl; external libmanifoldc;

function manifold_cross_section_hull(mem: pointer; cs: PManifoldCrossSection): PManifoldCrossSection; cdecl; external libmanifoldc;
function manifold_cross_section_batch_hull(mem: pointer; css: PManifoldCrossSectionVec): PManifoldCrossSection; cdecl; external libmanifoldc;
function manifold_cross_section_hull_simple_polygon(mem: pointer; ps: PManifoldSimplePolygon): PManifoldCrossSection; cdecl; external libmanifoldc;
function manifold_cross_section_hull_polygons(mem: pointer; ps: PManifoldPolygons): PManifoldCrossSection; cdecl; external libmanifoldc;

function manifold_cross_section_translate(mem: pointer; cs: PManifoldCrossSection; x: double; y: double): PManifoldCrossSection; cdecl; external libmanifoldc;
function manifold_cross_section_rotate(mem: pointer; cs: PManifoldCrossSection; deg: double): PManifoldCrossSection; cdecl; external libmanifoldc;
function manifold_cross_section_scale(mem: pointer; cs: PManifoldCrossSection; x: double; y: double): PManifoldCrossSection; cdecl; external libmanifoldc;
function manifold_cross_section_mirror(mem: pointer; cs: PManifoldCrossSection; ax_x: double; ax_y: double): PManifoldCrossSection; cdecl; external libmanifoldc;
function manifold_cross_section_transform(mem: pointer; cs: PManifoldCrossSection; x1: double; y1: double; x2: double; y2: double; x3: double; y3: double): PManifoldCrossSection; cdecl; external libmanifoldc;

type
  Tsection_warp_func = function(para1: double; para2: double): TManifoldVec2; cdecl;
  Twarp_context_func = function(para1: double; para2: double; para3: pointer): TManifoldVec2; cdecl;

function manifold_cross_section_warp_context(mem: pointer; cs: PManifoldCrossSection; fun: Twarp_context_func; ctx: pointer): PManifoldCrossSection; cdecl; external libmanifoldc;
function manifold_cross_section_simplify(mem: pointer; cs: PManifoldCrossSection; tolerance: double): PManifoldCrossSection; cdecl; external libmanifoldc;
function manifold_cross_section_set_tolerance(mem: pointer; cs: PManifoldCrossSection; tolerance: double): PManifoldCrossSection; cdecl; external libmanifoldc;
function manifold_cross_section_offset(mem: pointer; cs: PManifoldCrossSection; delta: double; jt: TManifoldJoinType; miter_limit: double; circular_segments: longint): PManifoldCrossSection; cdecl; external libmanifoldc;

function manifold_cross_section_area(cs: PManifoldCrossSection): double; cdecl; external libmanifoldc;
function manifold_cross_section_get_tolerance(cs: PManifoldCrossSection): double; cdecl; external libmanifoldc;
function manifold_cross_section_num_vert(cs: PManifoldCrossSection): Tsize_t; cdecl; external libmanifoldc;
function manifold_cross_section_num_contour(cs: PManifoldCrossSection): Tsize_t; cdecl; external libmanifoldc;
function manifold_cross_section_is_empty(cs: PManifoldCrossSection): longint; cdecl; external libmanifoldc;
function manifold_cross_section_bounds(mem: pointer; cs: PManifoldCrossSection): PManifoldRect; cdecl; external libmanifoldc;
function manifold_cross_section_to_polygons(mem: pointer; cs: PManifoldCrossSection): PManifoldPolygons; cdecl; external libmanifoldc;

function manifold_rect(mem: pointer; x1: double; y1: double; x2: double; y2: double): PManifoldRect; cdecl; external libmanifoldc;
function manifold_rect_min(r: PManifoldRect): TManifoldVec2; cdecl; external libmanifoldc;
function manifold_rect_max(r: PManifoldRect): TManifoldVec2; cdecl; external libmanifoldc;
function manifold_rect_dimensions(r: PManifoldRect): TManifoldVec2; cdecl; external libmanifoldc;
function manifold_rect_center(r: PManifoldRect): TManifoldVec2; cdecl; external libmanifoldc;
function manifold_rect_scale(r: PManifoldRect): double; cdecl; external libmanifoldc;
function manifold_rect_contains_pt(r: PManifoldRect; x: double; y: double): longint; cdecl; external libmanifoldc;
function manifold_rect_contains_rect(a: PManifoldRect; b: PManifoldRect): longint; cdecl; external libmanifoldc;
procedure manifold_rect_include_pt(r: PManifoldRect; x: double; y: double); cdecl; external libmanifoldc;
function manifold_rect_union(mem: pointer; a: PManifoldRect; b: PManifoldRect): PManifoldRect; cdecl; external libmanifoldc;
function manifold_rect_transform(mem: pointer; r: PManifoldRect; x1: double; y1: double; x2: double; y2: double; x3: double; y3: double): PManifoldRect; cdecl; external libmanifoldc;
function manifold_rect_translate(mem: pointer; r: PManifoldRect; x: double; y: double): PManifoldRect; cdecl; external libmanifoldc;
function manifold_rect_mul(mem: pointer; r: PManifoldRect; x: double; y: double): PManifoldRect; cdecl; external libmanifoldc;
function manifold_rect_does_overlap_rect(a: PManifoldRect; r: PManifoldRect): longint; cdecl; external libmanifoldc;
function manifold_rect_is_empty(r: PManifoldRect): longint; cdecl; external libmanifoldc;
function manifold_rect_is_finite(r: PManifoldRect): longint; cdecl; external libmanifoldc;

function manifold_box(mem: pointer; x1: double; y1: double; z1: double; x2: double; y2: double; z2: double): PManifoldBox; cdecl; external libmanifoldc;
function manifold_box_min(b: PManifoldBox): TManifoldVec3; cdecl; external libmanifoldc;
function manifold_box_max(b: PManifoldBox): TManifoldVec3; cdecl; external libmanifoldc;
function manifold_box_dimensions(b: PManifoldBox): TManifoldVec3; cdecl; external libmanifoldc;
function manifold_box_center(b: PManifoldBox): TManifoldVec3; cdecl; external libmanifoldc;
function manifold_box_scale(b: PManifoldBox): double; cdecl; external libmanifoldc;
function manifold_box_contains_pt(b: PManifoldBox; x: double; y: double; z: double): longint; cdecl; external libmanifoldc;
function manifold_box_contains_box(a: PManifoldBox; b: PManifoldBox): longint; cdecl; external libmanifoldc;
procedure manifold_box_include_pt(b: PManifoldBox; x: double; y: double; z: double); cdecl; external libmanifoldc;
function manifold_box_union(mem: pointer; a: PManifoldBox; b: PManifoldBox): PManifoldBox; cdecl; external libmanifoldc;
function manifold_box_transform(mem: pointer; b: PManifoldBox; x1: double; y1: double; z1: double; x2: double; y2: double; z2: double; x3: double; y3: double; z3: double; x4: double; y4: double; z4: double): PManifoldBox; cdecl; external libmanifoldc;
function manifold_box_translate(mem: pointer; b: PManifoldBox; x: double; y: double; z: double): PManifoldBox; cdecl; external libmanifoldc;
function manifold_box_mul(mem: pointer; b: PManifoldBox; x: double; y: double; z: double): PManifoldBox; cdecl; external libmanifoldc;
function manifold_box_does_overlap_pt(b: PManifoldBox; x: double; y: double; z: double): longint; cdecl; external libmanifoldc;
function manifold_box_does_overlap_box(a: PManifoldBox; b: PManifoldBox): longint; cdecl; external libmanifoldc;
function manifold_box_is_finite(b: PManifoldBox): longint; cdecl; external libmanifoldc;

procedure manifold_set_min_circular_angle(degrees: double); cdecl; external libmanifoldc;
procedure manifold_set_min_circular_edge_length(length: double); cdecl; external libmanifoldc;
procedure manifold_set_circular_segments(number: longint); cdecl; external libmanifoldc;
procedure manifold_reset_to_circular_defaults; cdecl; external libmanifoldc;

function manifold_meshgl_num_prop(m: PManifoldMeshGL): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl_num_vert(m: PManifoldMeshGL): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl_num_tri(m: PManifoldMeshGL): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl_vert_properties_length(m: PManifoldMeshGL): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl_tri_length(m: PManifoldMeshGL): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl_merge_length(m: PManifoldMeshGL): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl_run_index_length(m: PManifoldMeshGL): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl_run_original_id_length(m: PManifoldMeshGL): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl_run_transform_length(m: PManifoldMeshGL): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl_face_id_length(m: PManifoldMeshGL): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl_tangent_length(m: PManifoldMeshGL): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl_vert_properties(mem: pointer; m: PManifoldMeshGL): Psingle; cdecl; external libmanifoldc;
function manifold_meshgl_tri_verts(mem: pointer; m: PManifoldMeshGL): Puint32_t; cdecl; external libmanifoldc;
function manifold_meshgl_merge_from_vert(mem: pointer; m: PManifoldMeshGL): Puint32_t; cdecl; external libmanifoldc;
function manifold_meshgl_merge_to_vert(mem: pointer; m: PManifoldMeshGL): Puint32_t; cdecl; external libmanifoldc;
function manifold_meshgl_run_index(mem: pointer; m: PManifoldMeshGL): Puint32_t; cdecl; external libmanifoldc;
function manifold_meshgl_run_original_id(mem: pointer; m: PManifoldMeshGL): Puint32_t; cdecl; external libmanifoldc;
function manifold_meshgl_run_transform(mem: pointer; m: PManifoldMeshGL): Psingle; cdecl; external libmanifoldc;
function manifold_meshgl_face_id(mem: pointer; m: PManifoldMeshGL): Puint32_t; cdecl; external libmanifoldc;
function manifold_meshgl_halfedge_tangent(mem: pointer; m: PManifoldMeshGL): Psingle; cdecl; external libmanifoldc;
function manifold_meshgl_tolerance(m: PManifoldMeshGL): single; cdecl; external libmanifoldc;
function manifold_meshgl_run_flags_length(m: PManifoldMeshGL): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl_run_flags(mem: pointer; m: PManifoldMeshGL): Puint8_t; cdecl; external libmanifoldc;
function manifold_meshgl_num_run(m: PManifoldMeshGL): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl_backside(m: PManifoldMeshGL; run: Tsize_t): longint; cdecl; external libmanifoldc;
function manifold_meshgl_has_normals(m: PManifoldMeshGL; run: Tsize_t): longint; cdecl; external libmanifoldc;

function manifold_meshgl64_num_prop(m: PManifoldMeshGL64): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl64_num_vert(m: PManifoldMeshGL64): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl64_num_tri(m: PManifoldMeshGL64): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl64_vert_properties_length(m: PManifoldMeshGL64): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl64_tri_length(m: PManifoldMeshGL64): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl64_merge_length(m: PManifoldMeshGL64): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl64_run_index_length(m: PManifoldMeshGL64): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl64_run_original_id_length(m: PManifoldMeshGL64): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl64_run_transform_length(m: PManifoldMeshGL64): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl64_face_id_length(m: PManifoldMeshGL64): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl64_tangent_length(m: PManifoldMeshGL64): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl64_vert_properties(mem: pointer; m: PManifoldMeshGL64): Pdouble; cdecl; external libmanifoldc;
function manifold_meshgl64_tri_verts(mem: pointer; m: PManifoldMeshGL64): Puint64_t; cdecl; external libmanifoldc;
function manifold_meshgl64_merge_from_vert(mem: pointer; m: PManifoldMeshGL64): Puint64_t; cdecl; external libmanifoldc;
function manifold_meshgl64_merge_to_vert(mem: pointer; m: PManifoldMeshGL64): Puint64_t; cdecl; external libmanifoldc;
function manifold_meshgl64_run_index(mem: pointer; m: PManifoldMeshGL64): Puint64_t; cdecl; external libmanifoldc;
function manifold_meshgl64_run_original_id(mem: pointer; m: PManifoldMeshGL64): Puint32_t; cdecl; external libmanifoldc;
function manifold_meshgl64_run_transform(mem: pointer; m: PManifoldMeshGL64): Pdouble; cdecl; external libmanifoldc;
function manifold_meshgl64_face_id(mem: pointer; m: PManifoldMeshGL64): Puint64_t; cdecl; external libmanifoldc;
function manifold_meshgl64_halfedge_tangent(mem: pointer; m: PManifoldMeshGL64): Pdouble; cdecl; external libmanifoldc;
function manifold_meshgl64_tolerance(m: PManifoldMeshGL64): double; cdecl; external libmanifoldc;
function manifold_meshgl64_run_flags_length(m: PManifoldMeshGL64): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl64_run_flags(mem: pointer; m: PManifoldMeshGL64): Puint8_t; cdecl; external libmanifoldc;
function manifold_meshgl64_num_run(m: PManifoldMeshGL64): Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl64_backside(m: PManifoldMeshGL64; run: Tsize_t): longint; cdecl; external libmanifoldc;
function manifold_meshgl64_has_normals(m: PManifoldMeshGL64; run: Tsize_t): longint; cdecl; external libmanifoldc;

function manifold_triangulate(mem: pointer; ps: PManifoldPolygons; epsilon: double): PManifoldTriangulation; cdecl; external libmanifoldc;
function manifold_triangulation_num_tri(m: PManifoldTriangulation): Tsize_t; cdecl; external libmanifoldc;
function manifold_triangulation_tri_verts(mem: pointer; m: PManifoldTriangulation): Plongint; cdecl; external libmanifoldc;

function manifold_manifold_size: Tsize_t; cdecl; external libmanifoldc;
function manifold_manifold_vec_size: Tsize_t; cdecl; external libmanifoldc;
function manifold_cross_section_size: Tsize_t; cdecl; external libmanifoldc;
function manifold_cross_section_vec_size: Tsize_t; cdecl; external libmanifoldc;
function manifold_ray_hit_vec_size: Tsize_t; cdecl; external libmanifoldc;
function manifold_simple_polygon_size: Tsize_t; cdecl; external libmanifoldc;
function manifold_polygons_size: Tsize_t; cdecl; external libmanifoldc;
function manifold_manifold_pair_size: Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl_size: Tsize_t; cdecl; external libmanifoldc;
function manifold_meshgl64_size: Tsize_t; cdecl; external libmanifoldc;
function manifold_box_size: Tsize_t; cdecl; external libmanifoldc;
function manifold_rect_size: Tsize_t; cdecl; external libmanifoldc;
function manifold_curvature_size: Tsize_t; cdecl; external libmanifoldc;
function manifold_triangulation_size: Tsize_t; cdecl; external libmanifoldc;
function manifold_execution_context_size: Tsize_t; cdecl; external libmanifoldc;

function manifold_alloc_manifold: PManifoldManifold; cdecl; external libmanifoldc;
function manifold_alloc_manifold_vec: PManifoldManifoldVec; cdecl; external libmanifoldc;
function manifold_alloc_cross_section: PManifoldCrossSection; cdecl; external libmanifoldc;
function manifold_alloc_cross_section_vec: PManifoldCrossSectionVec; cdecl; external libmanifoldc;
function manifold_alloc_ray_hit_vec: PManifoldRayHitVec; cdecl; external libmanifoldc;
function manifold_alloc_simple_polygon: PManifoldSimplePolygon; cdecl; external libmanifoldc;
function manifold_alloc_polygons: PManifoldPolygons; cdecl; external libmanifoldc;
function manifold_alloc_meshgl: PManifoldMeshGL; cdecl; external libmanifoldc;
function manifold_alloc_meshgl64: PManifoldMeshGL64; cdecl; external libmanifoldc;
function manifold_alloc_box: PManifoldBox; cdecl; external libmanifoldc;
function manifold_alloc_rect: PManifoldRect; cdecl; external libmanifoldc;
function manifold_alloc_triangulation: PManifoldTriangulation; cdecl; external libmanifoldc;
function manifold_alloc_execution_context: PManifoldExecutionContext; cdecl; external libmanifoldc;

procedure manifold_destruct_manifold(m: PManifoldManifold); cdecl; external libmanifoldc;
procedure manifold_destruct_manifold_vec(ms: PManifoldManifoldVec); cdecl; external libmanifoldc;
procedure manifold_destruct_cross_section(m: PManifoldCrossSection); cdecl; external libmanifoldc;
procedure manifold_destruct_cross_section_vec(csv: PManifoldCrossSectionVec); cdecl; external libmanifoldc;
procedure manifold_destruct_ray_hit_vec(v: PManifoldRayHitVec); cdecl; external libmanifoldc;
procedure manifold_destruct_simple_polygon(p: PManifoldSimplePolygon); cdecl; external libmanifoldc;
procedure manifold_destruct_polygons(p: PManifoldPolygons); cdecl; external libmanifoldc;
procedure manifold_destruct_meshgl(m: PManifoldMeshGL); cdecl; external libmanifoldc;
procedure manifold_destruct_meshgl64(m: PManifoldMeshGL64); cdecl; external libmanifoldc;
procedure manifold_destruct_box(b: PManifoldBox); cdecl; external libmanifoldc;
procedure manifold_destruct_rect(b: PManifoldRect); cdecl; external libmanifoldc;
procedure manifold_destruct_triangulation(M: PManifoldTriangulation); cdecl; external libmanifoldc;
procedure manifold_destruct_execution_context(ctx: PManifoldExecutionContext); cdecl; external libmanifoldc;

procedure manifold_delete_manifold(m: PManifoldManifold); cdecl; external libmanifoldc;
procedure manifold_delete_manifold_vec(ms: PManifoldManifoldVec); cdecl; external libmanifoldc;
procedure manifold_delete_cross_section(cs: PManifoldCrossSection); cdecl; external libmanifoldc;
procedure manifold_delete_cross_section_vec(csv: PManifoldCrossSectionVec); cdecl; external libmanifoldc;
procedure manifold_delete_ray_hit_vec(v: PManifoldRayHitVec); cdecl; external libmanifoldc;
procedure manifold_delete_simple_polygon(p: PManifoldSimplePolygon); cdecl; external libmanifoldc;
procedure manifold_delete_polygons(p: PManifoldPolygons); cdecl; external libmanifoldc;
procedure manifold_delete_meshgl(m: PManifoldMeshGL); cdecl; external libmanifoldc;
procedure manifold_delete_meshgl64(m: PManifoldMeshGL64); cdecl; external libmanifoldc;
procedure manifold_delete_box(b: PManifoldBox); cdecl; external libmanifoldc;
procedure manifold_delete_rect(b: PManifoldRect); cdecl; external libmanifoldc;
procedure manifold_delete_triangulation(m: PManifoldTriangulation); cdecl; external libmanifoldc;
procedure manifold_delete_execution_context(ctx: PManifoldExecutionContext); cdecl; external libmanifoldc;

type
  Tmani_write_proc = procedure(para1: pchar; para2: pointer); cdecl;

function manifold_read_obj(mem: pointer; obj_file: pchar): PManifoldManifold; cdecl; external libmanifoldc;
function manifold_meshgl64_read_obj(mem: pointer; obj_file: pchar): PManifoldMeshGL64; cdecl; external libmanifoldc;
procedure manifold_write_obj(manifold: PManifoldManifold; callback: Tmani_write_proc; args: pointer); cdecl; external libmanifoldc;
procedure manifold_meshgl64_write_obj(mesh: PManifoldMeshGL64; callback: Tmani_write_proc; args: pointer); cdecl; external libmanifoldc;


// === Konventiert am: 8-2-26 15:46:53 ===


implementation

// wegen "division_by_zero" in den clibs
{$IF defined(CPUX86) or defined(CPUX64)}
{$asmmode intel}
procedure SetMXCSR;
var
  w2: word = 8064;
begin
  asm
           Ldmxcsr w2
  end;
end;
{$ENDIF}

begin
  {$IF defined(CPUX86) or defined(CPUX64)}
  SetMXCSR;
  {$ENDIF}
end.
end.
