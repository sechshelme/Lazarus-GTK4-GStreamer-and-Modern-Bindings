unit fp_manifold_obj;

interface

uses
  fp_manifoldc;

type
  TCrossSectionClass = class;
  TManifoldClass = class;
  TMeshGLClass = class;
  TMeshGL64Class = class;
  TPolygonsClass = class;
  TBoxClass = class;
  TTriangulationClass = class;
  TRectClass = class;
  TCrossSectionVecClass = class;
  TSimplePolygonClass = class;
  TManifoldVecClass = class;
  TManifoldManifoldPairClass = class;
  TExecutionContextClass = class;
  TRayHitVec = class;


  { TCrossSectionClass }

  TCrossSectionClass = class(TObject)
  private
    Fmem: array of byte;
    Fobj: PManifoldCrossSection;
    procedure Init;
  public
    property obj: PManifoldCrossSection read Fobj;

    constructor cross_section_empty;
    constructor cross_section_copy(cs: TCrossSectionClass; clean: boolean);
    constructor cross_section_of_simple_polygon(p: TSimplePolygonClass; clean: boolean);
    constructor cross_section_of_polygons(p: TPolygonsClass; clean: boolean);
    constructor cross_section_square(x, y: double; center: longint);
    constructor cross_section_circle(radius: double; circular_segments: longint);
    constructor cross_section_compose(csv: TCrossSectionVecClass; clean: boolean);
    constructor cross_section_vec_get(csv: TCrossSectionVecClass; idx: Tsize_t; clean: boolean);
    constructor cross_section_boolean(a: TCrossSectionClass; b: TCrossSectionClass; op: TManifoldOpType; clean_a, clean_b: boolean);
    constructor cross_section_batch_boolean(csv: TCrossSectionVecClass; op: TManifoldOpType; clean: boolean);
    constructor cross_section_union(a: TCrossSectionClass; b: TCrossSectionClass; clean_a, clean_b: boolean);
    constructor cross_section_difference(a: TCrossSectionClass; b: TCrossSectionClass; clean_a, clean_b: boolean);
    constructor cross_section_intersection(a: TCrossSectionClass; b: TCrossSectionClass; clean_a, clean_b: boolean);
    constructor cross_section_hull(cs: TCrossSectionClass; clean: boolean);
    constructor cross_section_batch_hull(css: TCrossSectionVecClass; clean: boolean);
    constructor cross_section_hull_simple_polygon(ps: TSimplePolygonClass; clean: boolean);
    constructor cross_section_hull_polygons(ps: TPolygonsClass; clean: boolean);
    constructor cross_section_translate(cs: TCrossSectionClass; x, y: double; clean: boolean);
    constructor cross_section_rotate(cs: TCrossSectionClass; deg: double; clean: boolean);
    constructor cross_section_scale(cs: TCrossSectionClass; x, y: double; clean: boolean);
    constructor cross_section_mirror(cs: TCrossSectionClass; ax_x, ax_y: double; clean: boolean);
    constructor cross_section_transform(cs: TCrossSectionClass; x1, y1, x2, y2, x3, y3: double; clean: boolean);
    constructor cross_section_warp_context(cs: TCrossSectionClass; fun: Twarp_context_func; ctx: pointer; clean: boolean);
    constructor cross_section_simplify(cs: TCrossSectionClass; epsilon: double; clean: boolean);
    constructor cross_section_offset(cs: TCrossSectionClass; delta: double; jt: TManifoldJoinType; miter_limit: double; circular_segments: longint; clean: boolean);
    constructor cross_section_set_tolerance(cs: TCrossSectionClass; tolerance: double; clean: boolean);

    function cross_section_area: double;
    function cross_section_num_vert: Tsize_t;
    function cross_section_num_contour: Tsize_t;
    function cross_section_is_empty: longint;
    function cross_section_get_tolerance: double;

    destructor Destroy; override;
  end;


  { TManifoldClass }

  TManifoldClass = class(TObject)
  private
    Fmem: array of byte;
    Fobj: PManifoldManifold;
    procedure Init;
  public
    property obj: PManifoldManifold read Fobj;

    constructor level_set(sdf: TManifoldSdf; bounds: TBoxClass; edge_length, level, tolerance: double; ctx: pointer; clean: boolean);
    constructor level_set_seq(sdf: TManifoldSdf; bounds: TBoxClass; edge_length, level, tolerance: double; ctx: pointer; clean: boolean);
    constructor boolean(a, b: TManifoldClass; op: TManifoldOpType; clean_a, clean_b: boolean);
    constructor batch_boolean(ms: TManifoldVecClass; op: TManifoldOpType; clean: boolean);
    constructor union(a, b: TManifoldClass; clean_a: boolean; clean_b: boolean);
    constructor difference(a, b: TManifoldClass; clean_a: boolean; clean_b: boolean);
    constructor intersection(a, b: TManifoldClass; clean_a: boolean; clean_b: boolean);
    constructor trim_by_plane(m: TManifoldClass; normal_x, normal_y, normal_z, offset: double; clean: boolean);
    constructor hull(m: TManifoldClass; clean: boolean);
    constructor batch_hull(ms: TManifoldVecClass; clean: boolean);
    constructor hull_pts(ps: PManifoldVec3; length: Tsize_t);
    constructor translate(m: TManifoldClass; x, y, z: double; clean: boolean);
    constructor rotate(m: TManifoldClass; x, y, z: double; clean: boolean);
    constructor scale(m: TManifoldClass; x, y, z: double; clean: boolean);
    constructor transform(m: TManifoldClass; x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4: double; clean: boolean);
    constructor mirror(m: TManifoldClass; nx, ny, nz: double; clean: boolean);
    constructor empty;
    constructor copy(m: TManifoldClass; clean: boolean);
    constructor tetrahedron;
    constructor warp(m: TManifoldClass; fun: Twarp_func; ctx: pointer; clean: boolean);
    constructor smooth_by_normals(m: TManifoldClass; normalIdx: longint; clean: boolean);
    constructor smooth_out(m: TManifoldClass; minSharpAngle, minSmoothness: double; clean: boolean);
    constructor refine(m: TManifoldClass; refine: longint; clean: boolean);
    constructor refine_to_length(m: TManifoldClass; length: double; clean: boolean);
    constructor refine_to_tolerance(m: TManifoldClass; tolerance: double; clean: boolean);
    constructor manifold_vec_get(ms: TManifoldVecClass; idx: Tsize_t; clean: boolean);
    constructor cube(x, y, z: double; center: longint);
    constructor cylinder(height, radius_low, radius_high: double; circular_segments, center: longint);
    constructor sphere(radius: double; circular_segments: longint);
    constructor of_meshgl(mesh: TMeshGLClass; clean: boolean);
    constructor of_meshgl64(mesh: TMeshGL64Class; clean: boolean);
    constructor smooth(mesh: TMeshGLClass; half_edges: Psize_t; smoothness: Pdouble; n_idxs: Tsize_t; clean: boolean);
    constructor smooth64(mesh: TMeshGL64Class; half_edges: Psize_t; smoothness: Pdouble; n_idxs: Tsize_t; clean: boolean);
    constructor extrude(cs: TPolygonsClass; height: double; slices: longint; twist_degrees, scale_x, scale_y: double; clean: boolean);
    constructor revolve(cs: TPolygonsClass; circular_segments: longint; revolve_degrees: double; clean: boolean);
    constructor compose(ms: TManifoldVecClass; clean: boolean);
    constructor decompose(m: TManifoldClass; clean: boolean);
    constructor as_original(m: TManifoldClass; clean: boolean);
    constructor set_properties(m: TManifoldClass; num_prop: longint; fun: Tproperties_func; ctx: pointer; clean: boolean);
    constructor calculate_curvature(m: TManifoldClass; gaussian_idx, mean_idx: longint; clean: boolean);
    constructor calculate_normals(m: TManifoldClass; normal_idx: longint; min_sharp_angle: double; clean: boolean);
    constructor read_obj(obj_file: pchar);
    constructor minkowski_sum(a, b: TManifoldClass; clean_a, clean_b: boolean);
    constructor minkowski_difference(a, b: TManifoldClass; clean_a, clean_b: boolean);
    constructor set_tolerance(m: TManifoldClass; tolerance: double; clean: boolean);
    constructor simplify(m: TManifoldClass; tolerance: double; clean: boolean);
    constructor with_context(m: TManifoldClass; ctx: TExecutionContextClass; clean_m, clean_ctx: boolean);
    constructor execution_context_level_set(ec: TExecutionContextClass; sdf: TManifoldSdf; bounds: TBoxClass; edge_length, level, tolerance: double; sdf_context: pointer; clean_ec, clean_b: boolean);
    constructor execution_context_level_set_seq(ec: TExecutionContextClass; sdf: TManifoldSdf; bounds: TBoxClass; edge_length, level, tolerance: double; sdf_context: pointer; clean_ec, clean_b: boolean);
    constructor execution_context_of_meshgl(ec: TExecutionContextClass; mesh: TMeshGLClass; clean_ec, clean_mg: boolean);
    constructor execution_context_of_meshgl64(ec: TExecutionContextClass; mesh: TMeshGL64Class; clean_ec, clean_mg: boolean);
    constructor execution_context_smooth(ec: TExecutionContextClass; mesh: TMeshGLClass; half_edges: Psize_t; smoothness: Pdouble; n_edges: Tsize_t; clean_ec, clean_mg: boolean);
    constructor execution_context_smooth64(ec: TExecutionContextClass; mesh: TMeshGL64Class; half_edges: Psize_t; smoothness: Pdouble; n_edges: Tsize_t; clean_ec, clean_mg: boolean);

    function is_empty: longint;
    function status: TManifoldError;
    function num_vert: Tsize_t;
    function num_edge: Tsize_t;
    function num_tri: Tsize_t;
    function num_prop: Tsize_t;
    function epsilon: double;
    function genus: longint;
    function surface_area: double;
    function volume: double;
    function original_id: longint;
    function get_tolerance: double;
    function num_prop_vert: Tsize_t;
    function winding_number(x: double; y: double; z: double): longint;

    procedure write_obj(callback: Tmani_write_proc; args: pointer);

    destructor Destroy; override;
  end;

  { TMeshGLClass }

  TMeshGLClass = class(TObject)
  private
    Fmem: array of byte;
    Fobj: PManifoldMeshGL;
    vpmem, tvmem, mfvmem, mtvmem, rimem, roimem, rtmem, fimem, htmem, rfmem: array of byte;
    procedure Init;
  public
    property obj: PManifoldMeshGL read Fobj;

    constructor meshgl(vert_props: Psingle; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint32_t; n_tris: Tsize_t);
    constructor meshgl_w_tangents(vert_props: Psingle; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint32_t; n_tris: Tsize_t; halfedge_tangent: Psingle);
    constructor get_meshgl(m: TManifoldClass; clean: boolean);
    constructor meshgl_copy(m: TMeshGLClass; clean: boolean);
    constructor meshgl_merge(m: TMeshGLClass; clean: boolean);
    constructor meshgl_w_options(vert_props: Psingle; n_verts, n_props: Tsize_t; tri_verts: Puint32_t; n_tris: Tsize_t; options: PManifoldMeshGLOptions);
    constructor get_meshgl_w_normals(m: TManifoldClass; normalIdx: Tint32_t; clean: boolean);

    function meshgl_num_prop: Tsize_t;
    function meshgl_num_vert: Tsize_t;
    function meshgl_num_tri: Tsize_t;
    function meshgl_vert_properties_length: Tsize_t;
    function meshgl_tri_length: Tsize_t;
    function meshgl_merge_length: Tsize_t;
    function meshgl_run_index_length: Tsize_t;
    function meshgl_run_original_id_length: Tsize_t;
    function meshgl_run_transform_length: Tsize_t;
    function meshgl_face_id_length: Tsize_t;
    function meshgl_tangent_length: Tsize_t;
    function meshgl_vert_properties: Psingle;
    function meshgl_tri_verts: Puint32_t;
    function meshgl_merge_from_vert: Puint32_t;
    function meshgl_merge_to_vert: Puint32_t;
    function meshgl_run_index: Puint32_t;
    function meshgl_run_original_id: Puint32_t;
    function meshgl_run_transform: Psingle;
    function meshgl_face_id: Puint32_t;
    function meshgl_halfedge_tangent: Psingle;
    function meshgl_tolerance: single;
    function meshgl_run_flags_length: Tsize_t;
    function meshgl_run_flags: Puint8_t;
    function meshgl_num_run: Tsize_t;
    function meshgl_backside(run: Tsize_t): longint;
    function meshgl_has_normals(run: Tsize_t): longint;

    destructor Destroy; override;
  end;

  { TMeshGL64Class }

  TMeshGL64Class = class(TObject)
  private
    Fmem: array of byte;
    Fobj: PManifoldMeshGL64;
    vpmem, tvmem, mfvmem, mtvmem, rimem, roimem, rtmem, fimem, htmem, rfmem: array of byte;
    procedure Init;
  public
    property obj: PManifoldMeshGL64 read Fobj;

    constructor meshgl(vert_props: PDouble; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint64_t; n_tris: Tsize_t);
    constructor meshgl_w_tangents(vert_props: PDouble; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint64_t; n_tris: Tsize_t; halfedge_tangent: PDouble);
    constructor get_meshgl(m: TManifoldClass; clean: boolean);
    constructor meshgl_copy(m: TMeshGL64Class; clean: boolean);
    constructor meshgl_merge(m: TMeshGL64Class; clean: boolean);
    constructor meshgl64_read_obj(obj_file: pchar);
    constructor get_meshgl64_w_normals(m: TManifoldClass; normalIdx: Tint32_t; clean: boolean);
    constructor meshgl64_w_options(vert_props: Pdouble; n_verts, n_props: Tsize_t; tri_verts: Puint64_t; n_tris: Tsize_t; options: PManifoldMeshGL64Options);

    function meshgl64_num_prop: Tsize_t;
    function meshgl64_num_vert: Tsize_t;
    function meshgl64_num_tri: Tsize_t;
    function meshgl64_vert_properties_length: Tsize_t;
    function meshgl64_tri_length: Tsize_t;
    function meshgl64_merge_length: Tsize_t;
    function meshgl64_run_index_length: Tsize_t;
    function meshgl64_run_original_id_length: Tsize_t;
    function meshgl64_run_transform_length: Tsize_t;
    function meshgl64_face_id_length: Tsize_t;
    function meshgl64_tangent_length: Tsize_t;
    function meshgl64_vert_properties: PDouble;
    function meshgl64_tri_verts: Puint64_t;
    function meshgl64_merge_from_vert: Puint64_t;
    function meshgl64_merge_to_vert: Puint64_t;
    function meshgl64_run_index: Puint64_t;
    function meshgl64_run_original_id: Puint32_t;
    function meshgl64_run_transform: PDouble;
    function meshgl64_face_id: Puint64_t;
    function meshgl64_halfedge_tangent: PDouble;
    function meshgl64_tolerance: double;
    function meshgl64_run_flags_length: Tsize_t;
    function meshgl64_run_flags: Puint8_t;
    function meshgl64_num_run: Tsize_t;
    function meshgl64_backside(run: Tsize_t): longint;
    function meshgl64_has_normals(run: Tsize_t): longint;

    procedure meshgl64_write_obj(callback: Tmani_write_proc; args: pointer);

    destructor Destroy; override;
  end;

  { TPolygonsClass }

  TPolygonsClass = class(TObject)
  private
    Fmem: array of byte;
    Fobj: PManifoldPolygons;
    procedure Init;
  public
    property obj: PManifoldPolygons read Fobj;

    constructor polygons(ps: PPManifoldSimplePolygon; len: Tsize_t);  // ????
    constructor slice(m: TManifoldClass; height: double; clean: boolean);
    constructor project(m: TManifoldClass; clean: boolean);
    constructor cross_section_to_polygons(cs: TCrossSectionClass; clean: boolean);

    function polygons_length: Tsize_t;
    function polygons_simple_length(idx: Tsize_t): Tsize_t;
    function polygons_get_point(simple_idx: Tsize_t; pt_idx: Tsize_t): TManifoldVec2;

    destructor Destroy; override;
  end;

  { TBoxClass }

  TBoxClass = class(TObject)
  private
    Fmem: array of byte;
    Fobj: PManifoldBox;
    procedure Init;
  public
    property obj: PManifoldBox read Fobj;

    constructor box(x1, y1, z1, x2, y2, z2: double);
    constructor bounding_box(m: TManifoldClass; clean: boolean);
    constructor box_union(a: TBoxClass; b: TBoxClass; clean_a: boolean; clean_b: boolean);
    constructor translate(b: TBoxClass; x, y, z: double; clean: boolean);
    constructor box_mul(b: TBoxClass; x, y, z: double; clean: boolean);
    constructor box_transform(b: TBoxClass; x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4: double; clean: boolean);

    function box_min: TManifoldVec3;
    function box_max: TManifoldVec3;
    function box_dimensions: TManifoldVec3;
    function box_center: TManifoldVec3;
    function box_scale: double;
    function box_contains_pt(x, y, z: double): longint;
    procedure box_include_pt(x, y, z: double);
    function box_does_overlap_pt(x, y, z: double): longint;
    function box_is_finite: longint;

    destructor Destroy; override;
  end;

  { TTriangulationClass }

  TTriangulationClass = class(TObject)
  private
    Fmem: array of byte;
    Fobj: PManifoldTriangulation;
    tvmem: array of byte;
    procedure Init;
  public
    property obj: PManifoldTriangulation read Fobj;

    constructor triangulate(ps: TPolygonsClass; epsilon: double; clean: boolean);

    function triangulation_num_tri: Tsize_t;
    function triangulation_tri_verts: Plongint;

    destructor Destroy; override;
  end;

  { TRectClass }

  TRectClass = class(TObject)
  private
    Fmem: array of byte;
    Fobj: PManifoldRect;
    procedure Init;
  public
    property obj: PManifoldRect read Fobj;

    constructor cross_section_bounds(cs: TCrossSectionClass; clean: boolean);
    constructor rect(x1, y1, x2, y2: double);
    constructor rect_union(a, b: TRectClass; clean_a, clean_b: boolean);
    constructor rect_transform(r: TRectClass; x1, y1, x2, y2, x3, y3: double; clean: boolean);
    constructor rect_translate(r: TRectClass; x, y: double; clean: boolean);
    constructor rect_mul(r: TRectClass; x, y: double; clean: boolean);

    function rect_min: TManifoldVec2;
    function rect_max: TManifoldVec2;
    function rect_dimensions: TManifoldVec2;
    function rect_center: TManifoldVec2;
    function rect_scale: double;
    function rect_contains_pt(x, y: double): longint;
    procedure rect_include_pt(x, y: double);
    function rect_is_empty: longint;
    function rect_is_finite: longint;

    destructor Destroy; override;
  end;


  { TCrossSectionVecClass }

  TCrossSectionVecClass = class(TObject)
  private
    Fmem: array of byte;
    Fobj: PManifoldCrossSectionVec;
    procedure Init;
  public
    property obj: PManifoldCrossSectionVec read Fobj;

    constructor cross_section_decompose(cs: TCrossSectionClass; clean: boolean);
    constructor cross_section_empty_vec;
    constructor cross_section_vec(sz: Tsize_t);

    procedure cross_section_vec_reserve(sz: Tsize_t);
    function cross_section_vec_length: Tsize_t;
    procedure cross_section_vec_set(idx: Tsize_t; cs: TCrossSectionClass);
    procedure cross_section_vec_push_back(cs: TCrossSectionClass);

    destructor Destroy; override;
  end;

  { TSimplePolygonClass }

  TSimplePolygonClass = class(TObject)
  private
    Fmem: array of byte;
    Fobj: PManifoldSimplePolygon;
    procedure Init;
  public
    property obj: PManifoldSimplePolygon read Fobj;

    constructor simple_polygon(ps: PManifoldVec2; len: Tsize_t);
    constructor polygons_get_simple(ps: TPolygonsClass; idx: Tsize_t; clean: boolean);

    function simple_polygon_length: Tsize_t;
    function simple_polygon_get_point(idx: Tsize_t): TManifoldVec2;

    destructor Destroy; override;
  end;


  { TManifoldVecClass }

  TManifoldVecClass = class(TObject)
  private
    Fmem: array of byte;
    Fobj: PManifoldManifoldVec;
    procedure Init;
  public
    property obj: PManifoldManifoldVec read Fobj;

    constructor manifold_empty_vec;
    constructor manifold_vec(sz: Tsize_t);

    procedure manifold_vec_reserve(sz: Tsize_t);
    function manifold_vec_length: Tsize_t;
    procedure manifold_vec_set(idx: Tsize_t; m: TManifoldClass; clean: boolean);
    procedure manifold_vec_push_back(m: TManifoldClass; clean: boolean);

    destructor Destroy; override;
  end;


  { TManifoldManifoldPairClass }

  TManifoldManifoldPairClass = class(TObject)
  private
    Fmem1, Fmem2: array of byte;
    Fobj: TManifoldManifoldPair;
    procedure Init;
  public
    property obj: TManifoldManifoldPair read Fobj;

    constructor split(a, b: TManifoldClass; clean_a, clean_b: boolean);
    constructor split_by_plane(m: TManifoldClass; normal_x, normal_y, normal_z, offset: double; clean: boolean);

    destructor Destroy; override;
  end;

  { TExecutionContextClass }

  TExecutionContextClass = class(TObject)
  private
    Fmem: array of byte;
    Fobj: PManifoldExecutionContext;
    procedure Init;
  public
    property obj: PManifoldExecutionContext read Fobj;

    constructor execution_context;

    procedure execution_context_cancel;
    function execution_context_cancelled: longint;
    function execution_context_progress: double;

    destructor Destroy; override;
  end;


  { TRayHitVec }

  TRayHitVec = class(TObject)
  private
    Fmem: array of byte;
    Fobj: PManifoldRayHitVec;
    procedure Init;
  public
    property obj: PManifoldRayHitVec read Fobj;

    constructor ray_cast(m: TManifoldClass; origin_x, origin_y, origin_z, end_x, end_y, end_z: double; clean: boolean);

    function ray_hit_vec_length: Tsize_t;
    function ray_hit_vec_get(idx: Tsize_t): TManifoldRayHit;

    destructor Destroy; override;
  end;

implementation

{ TCrossSectionClass }

procedure TCrossSectionClass.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_cross_section_size;
  SetLength(Fmem, m_size);
end;

constructor TCrossSectionClass.cross_section_empty;
begin
  Init;
  Fobj := manifold_cross_section_empty(Pointer(Fmem));
end;

constructor TCrossSectionClass.cross_section_copy(cs: TCrossSectionClass; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_copy(Pointer(Fmem), cs.Fobj);
  if clean then begin
    cs.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_of_simple_polygon(p: TSimplePolygonClass; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_of_simple_polygon(Pointer(Fmem), p.Fobj);
  if clean then begin
    p.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_of_polygons(p: TPolygonsClass; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_of_polygons(Pointer(Fmem), p.Fobj);
  if clean then begin
    p.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_square(x, y: double; center: longint);
begin
  Init;
  Fobj := manifold_cross_section_square(Pointer(Fmem), x, y, center);
end;

constructor TCrossSectionClass.cross_section_circle(radius: double; circular_segments: longint);
begin
  Init;
  Fobj := manifold_cross_section_circle(Pointer(Fmem), radius, circular_segments);
end;

constructor TCrossSectionClass.cross_section_compose(csv: TCrossSectionVecClass; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_compose(Pointer(Fmem), csv.Fobj);
  if clean then begin
    csv.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_vec_get(csv: TCrossSectionVecClass; idx: Tsize_t; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_vec_get(Pointer(Fmem), csv.Fobj, idx);
  if clean then begin
    csv.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_boolean(a: TCrossSectionClass; b: TCrossSectionClass; op: TManifoldOpType; clean_a, clean_b: boolean);
begin
  Init;
  Fobj := manifold_cross_section_boolean(Pointer(Fmem), a.Fobj, b.Fobj, op);
  if clean_a then begin
    a.Free;
  end;
  if clean_b then begin
    b.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_batch_boolean(csv: TCrossSectionVecClass; op: TManifoldOpType; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_batch_boolean(Pointer(Fmem), csv.Fobj, op);
  if clean then begin
    csv.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_union(a: TCrossSectionClass; b: TCrossSectionClass; clean_a, clean_b: boolean);
begin
  Init;
  Fobj := manifold_cross_section_union(Pointer(Fmem), a.Fobj, b.Fobj);
  if clean_a then begin
    a.Free;
  end;
  if clean_b then begin
    b.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_difference(a: TCrossSectionClass; b: TCrossSectionClass; clean_a, clean_b: boolean);
begin
  Init;
  Fobj := manifold_cross_section_difference(Pointer(Fmem), a.Fobj, b.Fobj);
  if clean_a then begin
    a.Free;
  end;
  if clean_b then begin
    b.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_intersection(a: TCrossSectionClass; b: TCrossSectionClass; clean_a, clean_b: boolean);
begin
  Init;
  Fobj := manifold_cross_section_intersection(Pointer(Fmem), a.Fobj, b.Fobj);
  if clean_a then begin
    a.Free;
  end;
  if clean_b then begin
    b.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_hull(cs: TCrossSectionClass; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_hull(Pointer(Fmem), cs.Fobj);
  if clean then begin
    cs.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_batch_hull(css: TCrossSectionVecClass; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_batch_hull(Pointer(Fmem), css.Fobj);
  if clean then begin
    css.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_hull_simple_polygon(ps: TSimplePolygonClass; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_hull_simple_polygon(Pointer(Fmem), ps.Fobj);
  if clean then begin
    ps.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_hull_polygons(ps: TPolygonsClass; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_hull_polygons(Pointer(Fmem), ps.Fobj);
  if clean then begin
    ps.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_translate(cs: TCrossSectionClass; x, y: double; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_translate(Pointer(Fmem), cs.Fobj, x, y);
  if clean then begin
    cs.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_rotate(cs: TCrossSectionClass; deg: double; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_rotate(Pointer(Fmem), cs.Fobj, deg);
  if clean then begin
    cs.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_scale(cs: TCrossSectionClass; x, y: double; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_scale(Pointer(Fmem), cs.Fobj, x, y);
  if clean then begin
    cs.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_mirror(cs: TCrossSectionClass; ax_x, ax_y: double; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_mirror(Pointer(Fmem), cs.Fobj, ax_x, ax_y);
  if clean then begin
    cs.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_transform(cs: TCrossSectionClass; x1, y1, x2, y2, x3, y3: double; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_transform(Pointer(Fmem), cs.Fobj, x1, y1, x2, y2, x3, y3);
  if clean then begin
    cs.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_warp_context(cs: TCrossSectionClass; fun: Twarp_context_func; ctx: pointer; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_warp_context(Pointer(Fmem), cs.Fobj, fun, ctx);
  if clean then begin
    cs.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_simplify(cs: TCrossSectionClass; epsilon: double; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_simplify(Pointer(Fmem), cs.Fobj, epsilon);
  if clean then begin
    cs.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_offset(cs: TCrossSectionClass; delta: double; jt: TManifoldJoinType; miter_limit: double; circular_segments: longint; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_offset(Pointer(Fmem), cs.Fobj, delta, jt, miter_limit, circular_segments);
  if clean then begin
    cs.Free;
  end;
end;

constructor TCrossSectionClass.cross_section_set_tolerance(cs: TCrossSectionClass; tolerance: double; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_set_tolerance(Pointer(Fmem), cs.Fobj, tolerance);
  if clean then begin
    cs.Free;
  end;
end;

function TCrossSectionClass.cross_section_area: double;
begin
  Result := manifold_cross_section_area(Fobj);
end;

function TCrossSectionClass.cross_section_num_vert: Tsize_t;
begin
  Result := manifold_cross_section_num_vert(Fobj);
end;

function TCrossSectionClass.cross_section_num_contour: Tsize_t;
begin
  Result := manifold_cross_section_num_contour(Fobj);
end;

function TCrossSectionClass.cross_section_is_empty: longint;
begin
  Result := manifold_cross_section_is_empty(Fobj);
end;

function TCrossSectionClass.cross_section_get_tolerance: double;
begin
  Result := manifold_cross_section_get_tolerance(Fobj);
end;

destructor TCrossSectionClass.Destroy;
begin
  manifold_destruct_cross_section(Fobj);
  inherited Destroy;
end;


{ TManifoldClass }

procedure TManifoldClass.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_manifold_size;
  SetLength(Fmem, m_size);
end;

constructor TManifoldClass.level_set(sdf: TManifoldSdf; bounds: TBoxClass; edge_length, level, tolerance: double; ctx: pointer; clean: boolean);
begin
  Init;
  Fobj := manifold_level_set(Pointer(Fmem), sdf, bounds.Fobj, edge_length, level, tolerance, ctx);
  if clean then begin
    bounds.Free;
  end;
end;

constructor TManifoldClass.level_set_seq(sdf: TManifoldSdf; bounds: TBoxClass; edge_length, level, tolerance: double; ctx: pointer; clean: boolean);
begin
  Init;
  Fobj := manifold_level_set_seq(Pointer(Fmem), sdf, bounds.Fobj, edge_length, level, tolerance, ctx);
  if clean then begin
    bounds.Free;
  end;
end;

constructor TManifoldClass.boolean(a, b: TManifoldClass; op: TManifoldOpType; clean_a, clean_b: boolean);
begin
  Init;
  Fobj := manifold_boolean(Pointer(Fmem), a.Fobj, b.Fobj, op);
  if clean_a then begin
    a.Free;
  end;
  if clean_b then begin
    b.Free;
  end;
end;

constructor TManifoldClass.batch_boolean(ms: TManifoldVecClass; op: TManifoldOpType; clean: boolean);
begin
  Init;
  Fobj := manifold_batch_boolean(Pointer(Fmem), ms.Fobj, op);
  if clean then begin
    ms.Free;
  end;
end;

constructor TManifoldClass.union(a, b: TManifoldClass; clean_a: boolean; clean_b: boolean);
begin
  Init;
  Fobj := manifold_union(Pointer(Fmem), a.Fobj, b.Fobj);
  if clean_a then begin
    a.Free;
  end;
  if clean_b then begin
    b.Free;
  end;
end;

constructor TManifoldClass.difference(a, b: TManifoldClass; clean_a: boolean; clean_b: boolean);
begin
  Init;
  Fobj := manifold_difference(Pointer(Fmem), a.Fobj, b.Fobj);
  if clean_a then begin
    a.Free;
  end;
  if clean_b then begin
    b.Free;
  end;
end;

constructor TManifoldClass.intersection(a, b: TManifoldClass; clean_a: boolean; clean_b: boolean);
begin
  Init;
  Fobj := manifold_intersection(Pointer(Fmem), a.Fobj, b.Fobj);
  if clean_a then begin
    a.Free;
  end;
  if clean_b then begin
    b.Free;
  end;
end;

constructor TManifoldClass.trim_by_plane(m: TManifoldClass; normal_x, normal_y, normal_z, offset: double; clean: boolean);
begin
  Init;
  Fobj := manifold_trim_by_plane(Pointer(Fmem), m.Fobj, normal_x, normal_y, normal_z, offset);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.hull(m: TManifoldClass; clean: boolean);
begin
  Init;
  Fobj := manifold_hull(Pointer(Fmem), m.Fobj);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.batch_hull(ms: TManifoldVecClass; clean: boolean);
begin
  Init;
  Fobj := manifold_batch_hull(Pointer(Fmem), ms.Fobj);
  if clean then begin
    ms.Free;
  end;
end;

constructor TManifoldClass.hull_pts(ps: PManifoldVec3; length: Tsize_t);
begin
  Init;
  Fobj := manifold_hull_pts(Pointer(Fmem), ps, length);
end;

constructor TManifoldClass.translate(m: TManifoldClass; x, y, z: double; clean: boolean);
begin
  Init;
  Fobj := manifold_translate(Pointer(Fmem), m.Fobj, x, y, z);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.rotate(m: TManifoldClass; x, y, z: double; clean: boolean);
begin
  Init;
  Fobj := manifold_rotate(Pointer(Fmem), m.Fobj, x, y, z);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.scale(m: TManifoldClass; x, y, z: double; clean: boolean);
begin
  Init;
  Fobj := manifold_scale(Pointer(Fmem), m.Fobj, x, y, z);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.transform(m: TManifoldClass; x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4: double; clean: boolean);
begin
  Init;
  Fobj := manifold_transform(Pointer(Fmem), m.Fobj, x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.mirror(m: TManifoldClass; nx, ny, nz: double; clean: boolean);
begin
  Init;
  Fobj := manifold_mirror(Pointer(Fmem), m.Fobj, nx, ny, nz);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.empty;
begin
  Init;
  Fobj := manifold_empty(Pointer(Fmem));
end;

constructor TManifoldClass.copy(m: TManifoldClass; clean: boolean);
begin
  Init;
  Fobj := manifold_copy(Pointer(Fmem), m.Fobj);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.tetrahedron;
begin
  Init;
  Fobj := manifold_tetrahedron(Pointer(Fmem));
end;

constructor TManifoldClass.warp(m: TManifoldClass; fun: Twarp_func; ctx: pointer; clean: boolean);
begin
  Init;
  Fobj := manifold_warp(Pointer(Fmem), m.Fobj, fun, ctx);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.smooth_by_normals(m: TManifoldClass; normalIdx: longint; clean: boolean);
begin
  Init;
  Fobj := manifold_smooth_by_normals(Pointer(Fmem), m.Fobj, normalIdx);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.smooth_out(m: TManifoldClass; minSharpAngle, minSmoothness: double; clean: boolean);
begin
  Init;
  Fobj := manifold_smooth_out(Pointer(Fmem), m.Fobj, minSharpAngle, minSmoothness);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.refine(m: TManifoldClass; refine: longint; clean: boolean);
begin
  Init;
  Fobj := manifold_refine(Pointer(Fmem), m.Fobj, refine);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.refine_to_length(m: TManifoldClass; length: double; clean: boolean);
begin
  Init;
  Fobj := manifold_refine_to_length(Pointer(Fmem), m.Fobj, length);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.refine_to_tolerance(m: TManifoldClass; tolerance: double; clean: boolean);
begin
  Init;
  Fobj := manifold_refine_to_tolerance(Pointer(Fmem), m.Fobj, tolerance);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.manifold_vec_get(ms: TManifoldVecClass; idx: Tsize_t; clean: boolean);
begin
  Init;
  Fobj := manifold_manifold_vec_get(Pointer(Fmem), ms.Fobj, idx);
  if clean then begin
    ms.Free;
  end;
end;

constructor TManifoldClass.cube(x, y, z: double; center: longint);
begin
  Init;
  Fobj := manifold_cube(Pointer(Fmem), x, y, z, center);
end;

constructor TManifoldClass.cylinder(height, radius_low, radius_high: double; circular_segments, center: longint);
begin
  Init;
  Fobj := manifold_cylinder(Pointer(Fmem), height, radius_low, radius_high, circular_segments, center);
end;

constructor TManifoldClass.sphere(radius: double; circular_segments: longint);
begin
  Init;
  Fobj := manifold_sphere(Pointer(Fmem), radius, circular_segments);
end;

constructor TManifoldClass.of_meshgl(mesh: TMeshGLClass; clean: boolean);
begin
  Init;
  Fobj := manifold_of_meshgl(Pointer(Fmem), mesh.Fobj);
  if clean then begin
    mesh.Free;
  end;
end;

constructor TManifoldClass.of_meshgl64(mesh: TMeshGL64Class; clean: boolean);
begin
  Init;
  Fobj := manifold_of_meshgl64(Pointer(Fmem), mesh.Fobj);
  if clean then begin
    mesh.Free;
  end;
end;

constructor TManifoldClass.smooth(mesh: TMeshGLClass; half_edges: Psize_t; smoothness: Pdouble; n_idxs: Tsize_t; clean: boolean);
begin
  Init;
  Fobj := manifold_smooth(Pointer(Fmem), mesh.Fobj, half_edges, smoothness, n_idxs);
  if clean then begin
    mesh.Free;
  end;
end;

constructor TManifoldClass.smooth64(mesh: TMeshGL64Class; half_edges: Psize_t; smoothness: Pdouble; n_idxs: Tsize_t; clean: boolean);
begin
  Init;
  Fobj := manifold_smooth64(Pointer(Fmem), mesh.Fobj, half_edges, smoothness, n_idxs);
  if clean then begin
    mesh.Free;
  end;
end;

constructor TManifoldClass.extrude(cs: TPolygonsClass; height: double; slices: longint; twist_degrees, scale_x, scale_y: double; clean: boolean);
begin
  Init;
  Fobj := manifold_extrude(Pointer(Fmem), cs.Fobj, height, slices, twist_degrees, scale_x, scale_y);
  if clean then begin
    cs.Free;
  end;
end;

constructor TManifoldClass.revolve(cs: TPolygonsClass; circular_segments: longint; revolve_degrees: double; clean: boolean);
begin
  Init;
  Fobj := manifold_revolve(Pointer(Fmem), cs.Fobj, circular_segments, revolve_degrees);
  if clean then begin
    cs.Free;
  end;
end;

constructor TManifoldClass.compose(ms: TManifoldVecClass; clean: boolean);
begin
  Init;
  Fobj := manifold_compose(Pointer(Fmem), ms.Fobj);
  if clean then begin
    ms.Free;
  end;
end;

constructor TManifoldClass.decompose(m: TManifoldClass; clean: boolean);
begin
  Init;
  Fobj := manifold_decompose(Pointer(Fmem), m.Fobj);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.as_original(m: TManifoldClass; clean: boolean);
begin
  Init;
  Fobj := manifold_as_original(Pointer(Fmem), m.Fobj);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.set_properties(m: TManifoldClass; num_prop: longint; fun: Tproperties_func; ctx: pointer; clean: boolean);
begin
  Init;
  Fobj := manifold_set_properties(Pointer(Fmem), m.Fobj, num_prop, fun, ctx);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.calculate_curvature(m: TManifoldClass; gaussian_idx, mean_idx: longint; clean: boolean);
begin
  Init;
  Fobj := manifold_calculate_curvature(Pointer(Fmem), m.Fobj, gaussian_idx, mean_idx);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.calculate_normals(m: TManifoldClass; normal_idx: longint; min_sharp_angle: double; clean: boolean);
begin
  Init;
  Fobj := manifold_calculate_normals(Pointer(Fmem), m.Fobj, normal_idx, min_sharp_angle);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.read_obj(obj_file: pchar);
begin
  Init;
  Fobj := manifold_read_obj(Pointer(Fmem), obj_file);
end;

constructor TManifoldClass.minkowski_sum(a, b: TManifoldClass; clean_a, clean_b: boolean);
begin
  Init;
  Fobj := manifold_minkowski_sum(Pointer(Fmem), a.Fobj, b.Fobj);
  if clean_a then begin
    a.Free;
  end;
  if clean_b then begin
    b.Free;
  end;
end;

constructor TManifoldClass.minkowski_difference(a, b: TManifoldClass; clean_a, clean_b: boolean);
begin
  Init;
  Fobj := manifold_minkowski_difference(Pointer(Fmem), a.Fobj, b.Fobj);
  if clean_a then begin
    a.Free;
  end;
  if clean_b then begin
    b.Free;
  end;
end;

constructor TManifoldClass.set_tolerance(m: TManifoldClass; tolerance: double; clean: boolean);
begin
  Init;
  Fobj := manifold_set_tolerance(Pointer(Fmem), m.Fobj, tolerance);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.simplify(m: TManifoldClass; tolerance: double; clean: boolean);
begin
  Init;
  Fobj := manifold_simplify(Pointer(Fmem), m.Fobj, tolerance);
  if clean then begin
    m.Free;
  end;
end;

constructor TManifoldClass.with_context(m: TManifoldClass; ctx: TExecutionContextClass; clean_m, clean_ctx: boolean);
begin
  Init;
  Fobj := manifold_with_context(Pointer(Fmem), m.Fobj, ctx.Fobj);
  if clean_m then begin
    m.Free;
  end;
  if clean_ctx then begin
    ctx.Free;
  end;
end;

constructor TManifoldClass.execution_context_level_set(ec: TExecutionContextClass; sdf: TManifoldSdf; bounds: TBoxClass; edge_length, level, tolerance: double; sdf_context: pointer; clean_ec, clean_b: boolean);
begin
  Init;
  Fobj := manifold_execution_context_level_set(Pointer(Fmem), ec.Fobj, sdf, bounds.Fobj, edge_length, level, tolerance, sdf_context);
  if clean_ec then begin
    ec.Free;
  end;
  if clean_b then begin
    bounds.Free;
  end;
end;

constructor TManifoldClass.execution_context_level_set_seq(ec: TExecutionContextClass; sdf: TManifoldSdf; bounds: TBoxClass; edge_length, level, tolerance: double; sdf_context: pointer; clean_ec, clean_b: boolean);
begin
  Init;
  Fobj := manifold_execution_context_level_set_seq(Pointer(Fmem), ec.Fobj, sdf, bounds.Fobj, edge_length, level, tolerance, sdf_context);
  if clean_ec then begin
    ec.Free;
  end;
  if clean_b then begin
    bounds.Free;
  end;
end;

constructor TManifoldClass.execution_context_of_meshgl(ec: TExecutionContextClass; mesh: TMeshGLClass; clean_ec, clean_mg: boolean);
begin
  Init;
  Fobj := manifold_execution_context_of_meshgl(Pointer(Fmem), ec.Fobj, mesh.Fobj);
  if clean_ec then begin
    ec.Free;
  end;
  if clean_mg then begin
    mesh.Free;
  end;
end;

constructor TManifoldClass.execution_context_of_meshgl64(ec: TExecutionContextClass; mesh: TMeshGL64Class; clean_ec, clean_mg: boolean);
begin
  Init;
  Fobj := manifold_execution_context_of_meshgl64(Pointer(Fmem), ec.Fobj, mesh.Fobj);
  if clean_ec then begin
    ec.Free;
  end;
  if clean_mg then begin
    mesh.Free;
  end;
end;

constructor TManifoldClass.execution_context_smooth(ec: TExecutionContextClass; mesh: TMeshGLClass; half_edges: Psize_t; smoothness: Pdouble; n_edges: Tsize_t; clean_ec, clean_mg: boolean);
begin
  Init;
  Fobj := manifold_execution_context_smooth(Pointer(Fmem), ec.Fobj, mesh.Fobj, half_edges, smoothness, n_edges);
  if clean_ec then begin
    ec.Free;
  end;
  if clean_mg then begin
    mesh.Free;
  end;
end;

constructor TManifoldClass.execution_context_smooth64(ec: TExecutionContextClass; mesh: TMeshGL64Class; half_edges: Psize_t; smoothness: Pdouble; n_edges: Tsize_t; clean_ec, clean_mg: boolean);
begin
  Init;
  Fobj := manifold_execution_context_smooth64(Pointer(Fmem), ec.Fobj, mesh.Fobj, half_edges, smoothness, n_edges);
  if clean_ec then begin
    ec.Free;
  end;
  if clean_mg then begin
    mesh.Free;
  end;
end;

function TManifoldClass.is_empty: longint;
begin
  Result := manifold_is_empty(Fobj);
end;

function TManifoldClass.status: TManifoldError;
begin
  Result := manifold_status(Fobj);
end;

function TManifoldClass.num_vert: Tsize_t;
begin
  Result := manifold_num_vert(Fobj);
end;

function TManifoldClass.num_edge: Tsize_t;
begin
  Result := manifold_num_edge(Fobj);
end;

function TManifoldClass.num_tri: Tsize_t;
begin
  Result := manifold_num_tri(Fobj);
end;

function TManifoldClass.num_prop: Tsize_t;
begin
  Result := manifold_num_prop(Fobj);
end;

function TManifoldClass.epsilon: double;
begin
  Result := manifold_epsilon(Fobj);
end;

function TManifoldClass.genus: longint;
begin
  Result := manifold_genus(Fobj);
end;

function TManifoldClass.surface_area: double;
begin
  Result := manifold_surface_area(Fobj);
end;

function TManifoldClass.volume: double;
begin
  Result := manifold_volume(Fobj);
end;

function TManifoldClass.original_id: longint;
begin
  Result := manifold_original_id(Fobj);
end;

function TManifoldClass.get_tolerance: double;
begin
  Result := manifold_get_tolerance(Fobj);
end;

function TManifoldClass.num_prop_vert: Tsize_t;
begin
  Result := manifold_num_prop_vert(Fobj);
end;

function TManifoldClass.winding_number(x: double; y: double; z: double): longint;
begin
  Result := manifold_winding_number(Fobj, x, y, z);
end;

procedure TManifoldClass.write_obj(callback: Tmani_write_proc; args: pointer);
begin
  manifold_write_obj(Fobj, callback, args);
end;

destructor TManifoldClass.Destroy;
begin
  manifold_destruct_manifold(Fobj);
  inherited Destroy;
end;

{ TMeshGLClass }

procedure TMeshGLClass.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_meshgl_size;
  SetLength(Fmem, m_size);
end;

constructor TMeshGLClass.meshgl(vert_props: Psingle; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint32_t; n_tris: Tsize_t);
begin
  Init;
  Fobj := manifold_meshgl(Pointer(Fmem), vert_props, n_verts, n_props, tri_verts, n_tris);
end;

constructor TMeshGLClass.meshgl_w_tangents(vert_props: Psingle; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint32_t; n_tris: Tsize_t; halfedge_tangent: Psingle);
begin
  Init;
  Fobj := manifold_meshgl_w_tangents(Pointer(Fmem), vert_props, n_verts, n_props, tri_verts, n_tris, halfedge_tangent);
end;

constructor TMeshGLClass.get_meshgl(m: TManifoldClass; clean: boolean);
begin
  Init;
  Fobj := manifold_get_meshgl(Pointer(Fmem), m.Fobj);
  if clean then begin
    m.Free;
  end;
end;

constructor TMeshGLClass.meshgl_copy(m: TMeshGLClass; clean: boolean);
begin
  Init;
  Fobj := manifold_meshgl_copy(Pointer(Fmem), m.Fobj);
  if clean then begin
    m.Free;
  end;
end;

constructor TMeshGLClass.meshgl_merge(m: TMeshGLClass; clean: boolean);
begin
  Init;
  Fobj := manifold_meshgl_merge(Pointer(Fmem), m.Fobj);
  if clean then begin
    m.Free;
  end;
end;

constructor TMeshGLClass.meshgl_w_options(vert_props: Psingle; n_verts, n_props: Tsize_t; tri_verts: Puint32_t; n_tris: Tsize_t; options: PManifoldMeshGLOptions);
begin
  Init;
  Fobj := manifold_meshgl_w_options(Pointer(Fmem), vert_props, n_verts, n_props, tri_verts, n_tris, options);
end;

constructor TMeshGLClass.get_meshgl_w_normals(m: TManifoldClass; normalIdx: Tint32_t; clean: boolean);
begin
  Init;
  Fobj := manifold_get_meshgl_w_normals(Pointer(Fmem), m.Fobj, normalIdx);
  if clean then begin
    m.Free;
  end;
end;

function TMeshGLClass.meshgl_num_prop: Tsize_t;
begin
  Result := manifold_meshgl_num_prop(Fobj);
end;

function TMeshGLClass.meshgl_num_vert: Tsize_t;
begin
  Result := manifold_meshgl_num_vert(Fobj);
end;

function TMeshGLClass.meshgl_num_tri: Tsize_t;
begin
  Result := manifold_meshgl_num_tri(Fobj);
end;

function TMeshGLClass.meshgl_vert_properties_length: Tsize_t;
begin
  Result := manifold_meshgl_vert_properties_length(Fobj);
end;

function TMeshGLClass.meshgl_tri_length: Tsize_t;
begin
  Result := manifold_meshgl_tri_length(Fobj);
end;

function TMeshGLClass.meshgl_merge_length: Tsize_t;
begin
  Result := manifold_meshgl_merge_length(Fobj);
end;

function TMeshGLClass.meshgl_run_index_length: Tsize_t;
begin
  Result := manifold_meshgl_run_index_length(Fobj);
end;

function TMeshGLClass.meshgl_run_original_id_length: Tsize_t;
begin
  Result := manifold_meshgl_run_original_id_length(Fobj);
end;

function TMeshGLClass.meshgl_run_transform_length: Tsize_t;
begin
  Result := manifold_meshgl_run_transform_length(Fobj);
end;

function TMeshGLClass.meshgl_face_id_length: Tsize_t;
begin
  Result := manifold_meshgl_face_id_length(Fobj);
end;

function TMeshGLClass.meshgl_tangent_length: Tsize_t;
begin
  Result := manifold_meshgl_tangent_length(Fobj);
end;

function TMeshGLClass.meshgl_vert_properties: Psingle;
var
  len: Tsize_t;
begin
  len := meshgl_vert_properties_length;
  SetLength(vpmem, len * SizeOf(single));
  Result := manifold_meshgl_vert_properties(Pointer(vpmem), Fobj);
end;

function TMeshGLClass.meshgl_tri_verts: Puint32_t;
var
  len: Tsize_t;
begin
  len := meshgl_tri_length;
  SetLength(tvmem, len * SizeOf(Tuint32_t));
  Result := manifold_meshgl_tri_verts(Pointer(tvmem), Fobj);
end;

function TMeshGLClass.meshgl_merge_from_vert: Puint32_t;
var
  len: Tsize_t;
begin
  len := meshgl_merge_length;
  SetLength(mfvmem, len * SizeOf(Tuint32_t));
  Result := manifold_meshgl_merge_from_vert(Pointer(mfvmem), Fobj);
end;

function TMeshGLClass.meshgl_merge_to_vert: Puint32_t;
var
  len: Tsize_t;
begin
  len := meshgl_merge_length;
  SetLength(mtvmem, len * SizeOf(Tuint32_t));
  Result := manifold_meshgl_merge_to_vert(Pointer(mtvmem), Fobj);
end;

function TMeshGLClass.meshgl_run_index: Puint32_t;
var
  len: Tsize_t;
begin
  len := meshgl_run_index_length;
  SetLength(rimem, len * SizeOf(Tuint32_t));
  Result := manifold_meshgl_run_index(Pointer(rimem), Fobj);
end;

function TMeshGLClass.meshgl_run_original_id: Puint32_t;
var
  len: Tsize_t;
begin
  len := meshgl_run_original_id_length;
  SetLength(roimem, len * SizeOf(Tuint32_t));
  Result := manifold_meshgl_run_original_id(Pointer(roimem), Fobj);
end;

function TMeshGLClass.meshgl_run_transform: Psingle;
var
  len: Tsize_t;
begin
  len := meshgl_run_transform_length;
  SetLength(rtmem, len * SizeOf(single));
  Result := manifold_meshgl_run_transform(Pointer(rtmem), Fobj);
end;

function TMeshGLClass.meshgl_face_id: Puint32_t;
var
  len: Tsize_t;
begin
  len := meshgl_face_id_length;
  SetLength(fimem, len * SizeOf(uint32));
  Result := manifold_meshgl_face_id(Pointer(fimem), Fobj);
end;

function TMeshGLClass.meshgl_halfedge_tangent: Psingle;
var
  len: Tsize_t;
begin
  len := meshgl_tangent_length;
  SetLength(htmem, len * SizeOf(single));
  Result := manifold_meshgl_halfedge_tangent(Pointer(htmem), Fobj);
end;

function TMeshGLClass.meshgl_tolerance: single;
begin
  Result := manifold_meshgl_tolerance(Fobj);
end;

function TMeshGLClass.meshgl_run_flags_length: Tsize_t;
begin
  Result := manifold_meshgl_run_flags_length(Fobj);
end;

function TMeshGLClass.meshgl_run_flags: Puint8_t;
var
  len: Tsize_t;
begin
  len := meshgl_run_flags_length;
  SetLength(rfmem, len * SizeOf(Tuint8_t));
  Result := manifold_meshgl_run_flags(Pointer(rfmem), Fobj);
end;

function TMeshGLClass.meshgl_num_run: Tsize_t;
begin
  Result := manifold_meshgl_num_run(Fobj);
end;

function TMeshGLClass.meshgl_backside(run: Tsize_t): longint;
begin
  Result := manifold_meshgl_backside(Fobj, run);
end;

function TMeshGLClass.meshgl_has_normals(run: Tsize_t): longint;
begin
  Result := manifold_meshgl_has_normals(Fobj, run);
end;

destructor TMeshGLClass.Destroy;
begin
  manifold_destruct_meshgl(Fobj);
  inherited Destroy;
end;


{ TMeshGL64Class }

procedure TMeshGL64Class.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_meshgl_size;
  SetLength(Fmem, m_size);
end;

constructor TMeshGL64Class.meshgl(vert_props: PDouble; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint64_t; n_tris: Tsize_t);
begin
  Init;
  Fobj := manifold_meshgl64(Pointer(Fmem), vert_props, n_verts, n_props, tri_verts, n_tris);
end;

constructor TMeshGL64Class.meshgl_w_tangents(vert_props: PDouble; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint64_t; n_tris: Tsize_t; halfedge_tangent: PDouble);
begin
  Init;
  Fobj := manifold_meshgl64_w_tangents(Pointer(Fmem), vert_props, n_verts, n_props, tri_verts, n_tris, halfedge_tangent);
end;

constructor TMeshGL64Class.get_meshgl(m: TManifoldClass; clean: boolean);
begin
  Init;
  Fobj := manifold_get_meshgl64(Pointer(Fmem), m.Fobj);
  if clean then begin
    m.Free;
  end;
end;

constructor TMeshGL64Class.meshgl_copy(m: TMeshGL64Class; clean: boolean);
begin
  Init;
  Fobj := manifold_meshgl64_copy(Pointer(Fmem), m.Fobj);
  if clean then begin
    m.Free;
  end;
end;

constructor TMeshGL64Class.meshgl_merge(m: TMeshGL64Class; clean: boolean);
begin
  Init;
  Fobj := manifold_meshgl64_merge(Pointer(Fmem), m.Fobj);
  if clean then begin
    m.Free;
  end;
end;

constructor TMeshGL64Class.meshgl64_read_obj(obj_file: pchar);
begin
  Init;
  Fobj := manifold_meshgl64_read_obj(Pointer(Fmem), obj_file);
end;

constructor TMeshGL64Class.get_meshgl64_w_normals(m: TManifoldClass; normalIdx: Tint32_t; clean: boolean);
begin
  Init;
  Fobj := manifold_get_meshgl64_w_normals(Pointer(Fmem), m.Fobj, normalIdx);
  if clean then begin
    m.Free;
  end;
end;

constructor TMeshGL64Class.meshgl64_w_options(vert_props: Pdouble; n_verts, n_props: Tsize_t; tri_verts: Puint64_t; n_tris: Tsize_t; options: PManifoldMeshGL64Options);
begin
  Init;
  Fobj := manifold_meshgl64_w_options(Pointer(Fmem), vert_props, n_verts, n_props, tri_verts, n_tris, options);
end;

function TMeshGL64Class.meshgl64_num_prop: Tsize_t;
begin
  Result := manifold_meshgl64_num_prop(Fobj);
end;

function TMeshGL64Class.meshgl64_num_vert: Tsize_t;
begin
  Result := manifold_meshgl64_num_vert(Fobj);
end;

function TMeshGL64Class.meshgl64_num_tri: Tsize_t;
begin
  Result := manifold_meshgl64_num_tri(Fobj);
end;

function TMeshGL64Class.meshgl64_vert_properties_length: Tsize_t;
begin
  Result := manifold_meshgl64_vert_properties_length(Fobj);
end;

function TMeshGL64Class.meshgl64_tri_length: Tsize_t;
begin
  Result := manifold_meshgl64_tri_length(Fobj);
end;

function TMeshGL64Class.meshgl64_merge_length: Tsize_t;
begin
  Result := manifold_meshgl64_merge_length(Fobj);
end;

function TMeshGL64Class.meshgl64_run_index_length: Tsize_t;
begin
  Result := manifold_meshgl64_run_index_length(Fobj);
end;

function TMeshGL64Class.meshgl64_run_original_id_length: Tsize_t;
begin
  Result := manifold_meshgl64_run_original_id_length(Fobj);
end;

function TMeshGL64Class.meshgl64_run_transform_length: Tsize_t;
begin
  Result := manifold_meshgl64_run_transform_length(Fobj);
end;

function TMeshGL64Class.meshgl64_face_id_length: Tsize_t;
begin
  Result := manifold_meshgl64_face_id_length(Fobj);
end;

function TMeshGL64Class.meshgl64_tangent_length: Tsize_t;
begin
  Result := manifold_meshgl64_tangent_length(Fobj);
end;

function TMeshGL64Class.meshgl64_vert_properties: PDouble;
var
  len: Tsize_t;
begin
  len := meshgl64_vert_properties_length;
  SetLength(vpmem, len * SizeOf(double));
  Result := manifold_meshgl64_vert_properties(Pointer(vpmem), Fobj);
end;

function TMeshGL64Class.meshgl64_tri_verts: Puint64_t;
var
  len: Tsize_t;
begin
  len := meshgl64_tri_length;
  SetLength(tvmem, len * SizeOf(Tuint64_t));
  Result := manifold_meshgl64_tri_verts(Pointer(tvmem), Fobj);
end;

function TMeshGL64Class.meshgl64_merge_from_vert: Puint64_t;
var
  len: Tsize_t;
begin
  len := meshgl64_merge_length;
  SetLength(mfvmem, len * SizeOf(Tuint64_t));
  Result := manifold_meshgl64_merge_from_vert(Pointer(mfvmem), Fobj);
end;

function TMeshGL64Class.meshgl64_merge_to_vert: Puint64_t;
var
  len: Tsize_t;
begin
  len := meshgl64_merge_length;
  SetLength(mtvmem, len * SizeOf(Tuint64_t));
  Result := manifold_meshgl64_merge_to_vert(Pointer(mtvmem), Fobj);
end;

function TMeshGL64Class.meshgl64_run_index: Puint64_t;
var
  len: Tsize_t;
begin
  len := meshgl64_run_index_length;
  SetLength(rimem, len * SizeOf(Tuint64_t));
  Result := manifold_meshgl64_run_index(Pointer(rimem), Fobj);
end;

function TMeshGL64Class.meshgl64_run_original_id: Puint32_t;
var
  len: Tsize_t;
begin
  len := meshgl64_run_original_id_length;
  SetLength(roimem, len * SizeOf(Tuint32_t));
  Result := manifold_meshgl64_run_original_id(Pointer(roimem), Fobj);
end;

function TMeshGL64Class.meshgl64_run_transform: PDouble;
var
  len: Tsize_t;
begin
  len := meshgl64_run_transform_length;
  SetLength(rtmem, len * SizeOf(double));
  Result := manifold_meshgl64_run_transform(Pointer(rtmem), Fobj);
end;

function TMeshGL64Class.meshgl64_face_id: Puint64_t;
var
  len: Tsize_t;
begin
  len := meshgl64_face_id_length;
  SetLength(fimem, len * SizeOf(uint64));
  Result := manifold_meshgl64_face_id(Pointer(fimem), Fobj);
end;

function TMeshGL64Class.meshgl64_halfedge_tangent: PDouble;
var
  len: Tsize_t;
begin
  len := meshgl64_tangent_length;
  SetLength(htmem, len * SizeOf(double));
  Result := manifold_meshgl64_halfedge_tangent(Pointer(htmem), Fobj);
end;

function TMeshGL64Class.meshgl64_tolerance: double;
begin
  Result := manifold_meshgl64_tolerance(Fobj);
end;

function TMeshGL64Class.meshgl64_run_flags_length: Tsize_t;
begin
  Result := manifold_meshgl64_run_flags_length(Fobj);
end;

function TMeshGL64Class.meshgl64_run_flags: Puint8_t;
var
  len: Tsize_t;
begin
  len := meshgl64_run_flags_length;
  SetLength(rfmem, len * SizeOf(Tuint8_t));
  Result := manifold_meshgl64_run_flags(Pointer(rfmem), Fobj);
end;

function TMeshGL64Class.meshgl64_num_run: Tsize_t;
begin
  Result := manifold_meshgl64_num_run(Fobj);
end;

function TMeshGL64Class.meshgl64_backside(run: Tsize_t): longint;
begin
  Result := manifold_meshgl64_backside(Fobj, run);
end;

function TMeshGL64Class.meshgl64_has_normals(run: Tsize_t): longint;
begin
  Result := manifold_meshgl64_has_normals(Fobj, run);
end;

procedure TMeshGL64Class.meshgl64_write_obj(callback: Tmani_write_proc; args: pointer);
begin
  manifold_meshgl64_write_obj(Fobj, callback, args);
end;

destructor TMeshGL64Class.Destroy;
begin
  manifold_destruct_meshgl64(Fobj);
  inherited Destroy;
end;


{ TPolygonsClass }

procedure TPolygonsClass.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_polygons_size;
  SetLength(Fmem, m_size);
end;

constructor TPolygonsClass.polygons(ps: PPManifoldSimplePolygon; len: Tsize_t);
begin
  Init;
  Fobj := manifold_polygons(Pointer(Fmem), ps, len);
end;

constructor TPolygonsClass.slice(m: TManifoldClass; height: double; clean: boolean);
begin
  Init;
  Fobj := manifold_slice(Pointer(Fmem), m.Fobj, height);
  if clean then begin
    m.Free;
  end;
end;

constructor TPolygonsClass.project(m: TManifoldClass; clean: boolean);
begin
  Init;
  Fobj := manifold_project(Pointer(Fmem), m.Fobj);
  if clean then begin
    m.Free;
  end;
end;

constructor TPolygonsClass.cross_section_to_polygons(cs: TCrossSectionClass; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_to_polygons(Pointer(Fmem), cs.Fobj);
  if clean then begin
    cs.Free;
  end;
end;

function TPolygonsClass.polygons_length: Tsize_t;
begin
  Result := manifold_polygons_length(Fobj);
end;

function TPolygonsClass.polygons_simple_length(idx: Tsize_t): Tsize_t;
begin
  Result := manifold_polygons_simple_length(Fobj, idx);
end;

function TPolygonsClass.polygons_get_point(simple_idx: Tsize_t; pt_idx: Tsize_t): TManifoldVec2;
begin
  Result := manifold_polygons_get_point(Fobj, simple_idx, pt_idx);
end;

destructor TPolygonsClass.Destroy;
begin
  manifold_destruct_polygons(Fobj);
  inherited Destroy;
end;

{ TBoxClass }

procedure TBoxClass.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_box_size;
  SetLength(Fmem, m_size);
end;

constructor TBoxClass.box(x1, y1, z1, x2, y2, z2: double);
begin
  Init;
  Fobj := manifold_box(Pointer(Fmem), x1, y1, z1, x2, y2, z2);
end;

constructor TBoxClass.bounding_box(m: TManifoldClass; clean: boolean);
begin
  Init;
  Fobj := manifold_bounding_box(Pointer(Fmem), m.Fobj);
  if clean then begin
    m.Free;
  end;
end;

constructor TBoxClass.box_union(a: TBoxClass; b: TBoxClass; clean_a, clean_b: boolean);
begin
  Init;
  Fobj := manifold_box_union(Pointer(Fmem), a.Fobj, b.Fobj);
  if clean_a then begin
    a.Free;
  end;
  if clean_b then begin
    b.Free;
  end;
end;

constructor TBoxClass.translate(b: TBoxClass; x, y, z: double; clean: boolean);
begin
  Init;
  Fobj := manifold_box_translate(Pointer(Fmem), b.Fobj, x, y, z);
  if clean then begin
    b.Free;
  end;
end;

constructor TBoxClass.box_mul(b: TBoxClass; x, y, z: double; clean: boolean);
begin
  Init;
  Fobj := manifold_box_mul(Pointer(Fmem), b.Fobj, x, y, z);
  if clean then begin
    b.Free;
  end;
end;

constructor TBoxClass.box_transform(b: TBoxClass; x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4: double; clean: boolean);
begin
  Init;
  Fobj := manifold_box_transform(Pointer(Fmem), b.Fobj, x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4);
  if clean then begin
    b.Free;
  end;
end;

function TBoxClass.box_min: TManifoldVec3;
begin
  Result := manifold_box_min(Fobj);
end;

function TBoxClass.box_max: TManifoldVec3;
begin
  Result := manifold_box_max(Fobj);
end;

function TBoxClass.box_dimensions: TManifoldVec3;
begin
  Result := manifold_box_dimensions(Fobj);
end;

function TBoxClass.box_center: TManifoldVec3;
begin
  Result := manifold_box_center(Fobj);
end;

function TBoxClass.box_scale: double;
begin
  Result := manifold_box_scale(Fobj);
end;

function TBoxClass.box_contains_pt(x, y, z: double): longint;
begin
  Result := manifold_box_contains_pt(Fobj, x, y, z);
end;

procedure TBoxClass.box_include_pt(x, y, z: double);
begin
  manifold_box_include_pt(Fobj, x, y, z);
end;

function TBoxClass.box_does_overlap_pt(x, y, z: double): longint;
begin
  Result := manifold_box_does_overlap_pt(Fobj, x, y, z);
end;

function TBoxClass.box_is_finite: longint;
begin
  Result := manifold_box_is_finite(Fobj);
end;

destructor TBoxClass.Destroy;
begin
  manifold_destruct_box(Fobj);
  inherited Destroy;
end;

{ TTriangulationClass }

procedure TTriangulationClass.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_triangulation_size;
  SetLength(Fmem, m_size);
end;

constructor TTriangulationClass.triangulate(ps: TPolygonsClass; epsilon: double; clean: boolean);
begin
  Init;
  Fobj := manifold_triangulate(Pointer(Fmem), ps.Fobj, epsilon);
  if clean then begin
    ps.Free;
  end;
end;

function TTriangulationClass.triangulation_num_tri: Tsize_t;
begin
  Result := manifold_triangulation_num_tri(Pointer(Fmem));
end;

function TTriangulationClass.triangulation_tri_verts: Plongint;
var
  len: Tsize_t;
begin
  len := triangulation_num_tri;
  SetLength(tvmem, len * 3 * SizeOf(longint));
  Result := manifold_triangulation_tri_verts(Pointer(tvmem), Fobj);
end;

destructor TTriangulationClass.Destroy;
begin
  manifold_destruct_triangulation(Fobj);
  inherited Destroy;
end;

{ TRectClass }

procedure TRectClass.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_rect_size;
  SetLength(Fmem, m_size);
end;

constructor TRectClass.cross_section_bounds(cs: TCrossSectionClass; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_bounds(Pointer(Fmem), cs.Fobj);
  if clean then begin
    cs.Free;
  end;
end;

constructor TRectClass.rect(x1, y1, x2, y2: double);
begin
  Init;
  Fobj := manifold_rect(Pointer(Fmem), x1, y1, x2, y2);
end;

constructor TRectClass.rect_union(a, b: TRectClass; clean_a, clean_b: boolean);
begin
  Init;
  Fobj := manifold_rect_union(Pointer(Fmem), a.Fobj, b.Fobj);
  if clean_a then begin
    a.Free;
  end;
  if clean_b then begin
    b.Free;
  end;
end;

constructor TRectClass.rect_transform(r: TRectClass; x1, y1, x2, y2, x3, y3: double; clean: boolean);
begin
  Init;
  Fobj := manifold_rect_transform(Pointer(Fmem), r.Fobj, x1, y1, x2, y2, x3, y3);
  if clean then begin
    r.Free;
  end;
end;

constructor TRectClass.rect_translate(r: TRectClass; x, y: double; clean: boolean);
begin
  Init;
  Fobj := manifold_rect_translate(Pointer(Fmem), r.Fobj, x, y);
  if clean then begin
    r.Free;
  end;
end;

constructor TRectClass.rect_mul(r: TRectClass; x, y: double; clean: boolean);
begin
  Init;
  Fobj := manifold_rect_mul(Pointer(Fmem), r.Fobj, x, y);
  if clean then begin
    r.Free;
  end;
end;

function TRectClass.rect_min: TManifoldVec2;
begin
  Result := manifold_rect_min(Fobj);
end;

function TRectClass.rect_max: TManifoldVec2;
begin
  Result := manifold_rect_max(Fobj);
end;

function TRectClass.rect_dimensions: TManifoldVec2;
begin
  Result := manifold_rect_dimensions(Fobj);
end;

function TRectClass.rect_center: TManifoldVec2;
begin
  Result := manifold_rect_center(Fobj);
end;

function TRectClass.rect_scale: double;
begin
  Result := manifold_rect_scale(Fobj);
end;

function TRectClass.rect_contains_pt(x, y: double): longint;
begin
  Result := manifold_rect_contains_pt(Fobj, x, y);
end;

procedure TRectClass.rect_include_pt(x, y: double);
begin
  manifold_rect_include_pt(Fobj, x, y);
end;

function TRectClass.rect_is_empty: longint;
begin
  Result := manifold_rect_is_empty(Fobj);
end;

function TRectClass.rect_is_finite: longint;
begin
  Result := manifold_rect_is_finite(Fobj);
end;

destructor TRectClass.Destroy;
begin
  manifold_destruct_rect(Fobj);
  inherited Destroy;
end;

{ TCrossSectionVecClass }

procedure TCrossSectionVecClass.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_cross_section_vec_size;
  SetLength(Fmem, m_size);
end;

constructor TCrossSectionVecClass.cross_section_decompose(cs: TCrossSectionClass; clean: boolean);
begin
  Init;
  Fobj := manifold_cross_section_decompose(Pointer(Fmem), cs.Fobj);
  if clean then begin
    cs.Free;
  end;
end;

constructor TCrossSectionVecClass.cross_section_empty_vec;
begin
  Init;
  Fobj := manifold_cross_section_empty_vec(Pointer(Fmem));
end;

constructor TCrossSectionVecClass.cross_section_vec(sz: Tsize_t);
begin
  Init;
  Fobj := manifold_cross_section_vec(Pointer(Fmem), sz);
end;

procedure TCrossSectionVecClass.cross_section_vec_reserve(sz: Tsize_t);
begin
  manifold_cross_section_vec_reserve(Fobj, sz);
end;

function TCrossSectionVecClass.cross_section_vec_length: Tsize_t;
begin
  Result := manifold_cross_section_vec_length(Fobj);
end;

procedure TCrossSectionVecClass.cross_section_vec_set(idx: Tsize_t; cs: TCrossSectionClass);
begin
  manifold_cross_section_vec_set(Fobj, idx, cs.Fobj);
end;

procedure TCrossSectionVecClass.cross_section_vec_push_back(cs: TCrossSectionClass);
begin
  manifold_cross_section_vec_push_back(Fobj, cs.Fobj);
end;

destructor TCrossSectionVecClass.Destroy;
begin
  manifold_destruct_cross_section_vec(Fobj);
  inherited Destroy;
end;

{ TSimplePolygonClass }

procedure TSimplePolygonClass.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_simple_polygon_size;
  SetLength(Fmem, m_size);
end;

constructor TSimplePolygonClass.simple_polygon(ps: PManifoldVec2; len: Tsize_t);
begin
  Init;
  Fobj := manifold_simple_polygon(Pointer(Fmem), ps, len);
end;

constructor TSimplePolygonClass.polygons_get_simple(ps: TPolygonsClass; idx: Tsize_t; clean: boolean);
begin
  Init;
  Fobj := manifold_polygons_get_simple(Pointer(Fmem), ps.Fobj, idx);
  if clean then begin
    ps.Free;
  end;
end;

function TSimplePolygonClass.simple_polygon_length: Tsize_t;
begin
  Result := manifold_simple_polygon_length(Fobj);
end;

function TSimplePolygonClass.simple_polygon_get_point(idx: Tsize_t): TManifoldVec2;
begin
  Result := manifold_simple_polygon_get_point(Fobj, idx);
end;

destructor TSimplePolygonClass.Destroy;
begin
  manifold_destruct_simple_polygon(Fobj);
  inherited Destroy;
end;

{ TManifoldVecClass }

procedure TManifoldVecClass.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_manifold_vec_size;
  SetLength(Fmem, m_size);
end;

constructor TManifoldVecClass.manifold_empty_vec;
begin
  Init;
  Fobj := manifold_manifold_empty_vec(Pointer(Fmem));
end;

constructor TManifoldVecClass.manifold_vec(sz: Tsize_t);
begin
  Init;
  Fobj := manifold_manifold_vec(Pointer(Fmem), sz);
end;

procedure TManifoldVecClass.manifold_vec_reserve(sz: Tsize_t);
begin
  manifold_manifold_vec_reserve(Fobj, sz);
end;

function TManifoldVecClass.manifold_vec_length: Tsize_t;
begin
  Result := manifold_manifold_vec_length(Fobj);
end;

procedure TManifoldVecClass.manifold_vec_set(idx: Tsize_t; m: TManifoldClass; clean: boolean);
begin
  manifold_manifold_vec_set(Fobj, idx, m.Fobj);
  if clean then begin
    m.Free;
  end;
end;

procedure TManifoldVecClass.manifold_vec_push_back(m: TManifoldClass; clean: boolean);
begin
  manifold_manifold_vec_push_back(Fobj, m.Fobj);
  if clean then begin
    m.Free;
  end;
end;

destructor TManifoldVecClass.Destroy;
begin
  manifold_destruct_manifold_vec(Fobj);
  inherited Destroy;
end;

{ TManifoldManifoldPairClass }

procedure TManifoldManifoldPairClass.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_manifold_size;
  SetLength(Fmem1, m_size);
  SetLength(Fmem2, m_size);
end;

constructor TManifoldManifoldPairClass.split(a, b: TManifoldClass; clean_a, clean_b: boolean);
begin
  Init;
  Fobj := manifold_split(Pointer(Fmem1), Pointer(Fmem2), a.Fobj, b.Fobj);
  if clean_a then begin
    a.Free;
  end;
  if clean_b then begin
    b.Free;
  end;
end;

constructor TManifoldManifoldPairClass.split_by_plane(m: TManifoldClass; normal_x, normal_y, normal_z, offset: double; clean: boolean);
begin
  Init;
  Fobj := manifold_split_by_plane(Pointer(Fmem1), Pointer(Fmem2), m.Fobj, normal_x, normal_y, normal_z, offset);
  if clean then begin
    m.Free;
  end;
end;

destructor TManifoldManifoldPairClass.Destroy;
begin
  manifold_destruct_cross_section(Fobj.first);
  manifold_destruct_cross_section(Fobj.second);
  inherited Destroy;
end;

{ TExecutionContextClass }

procedure TExecutionContextClass.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_execution_context_size;
  SetLength(Fmem, m_size);
end;

constructor TExecutionContextClass.execution_context;
begin
  Init;
  Fobj := manifold_execution_context(Pointer(Fmem));
end;

procedure TExecutionContextClass.execution_context_cancel;
begin
  manifold_execution_context_cancel(Fobj);
end;

function TExecutionContextClass.execution_context_cancelled: longint;
begin
  Result := manifold_execution_context_cancelled(Fobj);
end;

function TExecutionContextClass.execution_context_progress: double;
begin
  Result := manifold_execution_context_progress(Fobj);
end;

destructor TExecutionContextClass.Destroy;
begin
  manifold_destruct_execution_context(Fobj);
  inherited Destroy;
end;

{ TRayHitVec }

procedure TRayHitVec.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_ray_hit_vec_size;
  SetLength(Fmem, m_size);
end;

constructor TRayHitVec.ray_cast(m: TManifoldClass; origin_x, origin_y, origin_z, end_x, end_y, end_z: double; clean: boolean);
begin
  Init;
  Fobj := manifold_ray_cast(Pointer(Fmem), m.Fobj, origin_x, origin_y, origin_z, end_x, end_y, end_z);
  if clean then begin
    m.Free;
  end;
end;

function TRayHitVec.ray_hit_vec_length: Tsize_t;
begin
  Result := manifold_ray_hit_vec_length(Fobj);
end;

function TRayHitVec.ray_hit_vec_get(idx: Tsize_t): TManifoldRayHit;
begin
  Result := manifold_ray_hit_vec_get(Fobj, idx);
end;

destructor TRayHitVec.Destroy;
begin
  manifold_destruct_ray_hit_vec(Fobj);
  inherited Destroy;
end;

end.
