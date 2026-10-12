{$IFDEF read_interface}

type
  TLsmSvgDocument = record
    document: TLsmDomDocument;
    ids: PGHashTable;
  end;
  PLsmSvgDocument = ^TLsmSvgDocument;

  TLsmSvgDocumentClass = record
    parent_class: TLsmDomDocumentClass;
  end;
  PLsmSvgDocumentClass = ^TLsmSvgDocumentClass;

type
  PLsmSvgViewSurfaceType = ^TLsmSvgViewSurfaceType;
  TLsmSvgViewSurfaceType = longint;

const
  LSM_SVG_VIEW_SURFACE_TYPE_AUTO = 0;
  LSM_SVG_VIEW_SURFACE_TYPE_IMAGE = 1;

type
  //TLsmSvgView = record
  //  dom_view: TLsmDomView;
  //  resolution_ppi: double;
  //  style: PLsmSvgStyle;
  //  style_stack: PGSList;
  //  element_stack: PGSList;
  //  viewbox_stack: PGSList;
  //  matrix_stack: PGSList;
  //  pango_layout_stack: PGSList;
  //  background_stack: PGList;
  //  is_pango_layout_in_use: Tgboolean;
  //  pattern_data: PLsmSvgViewPatternData;
  //  pango_layout: PPangoLayout;
  //  pattern_stack: PGSList;
  //  is_clipping: Tgboolean;
  //  clip_extents: TLsmBox;
  //  last_stop_offset: double;
  //  filter_surfaces: PGSList;
  //  debug_filter: Tgboolean;
  //  debug_mask: Tgboolean;
  //  debug_pattern: Tgboolean;
  //  debug_group: Tgboolean;
  //  debug_text: Tgboolean;
  //end;

  TLsmSvgViewClass = record
    parent_class: TLsmDomViewClass;
  end;
  PLsmSvgViewClass = ^TLsmSvgViewClass;

function lsm_svg_view_get_type: TGType; cdecl; external liblasem;
function lsm_svg_view_new(document: PLsmSvgDocument): PLsmSvgView; cdecl; external liblasem;
function lsm_svg_view_normalize_length(view: PLsmSvgView; length: PLsmSvgLength; direction: TLsmSvgLengthDirection): double; cdecl; external liblasem;
function lsm_svg_view_normalize_length_list(view: PLsmSvgView; list: PLsmSvgLengthList; direction: TLsmSvgLengthDirection; n_data: Pdword): Pdouble; cdecl; external liblasem;
function lsm_svg_view_get_pattern_extents(view: PLsmSvgView): PLsmBox; cdecl; external liblasem;
function lsm_svg_view_get_object_extents(view: PLsmSvgView): PLsmBox; cdecl; external liblasem;
function lsm_svg_view_get_clip_extents(view: PLsmSvgView): PLsmBox; cdecl; external liblasem;
procedure lsm_svg_view_path_extents(view: PLsmSvgView; path: pchar; extents: PLsmExtents); cdecl; external liblasem;
procedure lsm_svg_view_create_radial_gradient(view: PLsmSvgView; cx: double; cy: double; r: double; fx: double; fy: double); cdecl; external liblasem;
procedure lsm_svg_view_create_linear_gradient(view: PLsmSvgView; x1: double; y1: double; x2: double; y2: double); cdecl; external liblasem;
procedure lsm_svg_view_add_gradient_color_stop(view: PLsmSvgView; offset: double); cdecl; external liblasem;
function lsm_svg_view_set_gradient_properties(view: PLsmSvgView; method: TLsmSvgSpreadMethod; units: TLsmSvgPatternUnits; matrix: PLsmSvgMatrix): Tgboolean; cdecl; external liblasem;
function lsm_svg_view_create_surface_pattern(view: PLsmSvgView; viewport: PLsmBox; matrix: PLsmSvgMatrix; surface_type: TLsmSvgViewSurfaceType): Tgboolean; cdecl; external liblasem;
procedure lsm_svg_view_show_viewport(view: PLsmSvgView; viewport: PLsmBox); cdecl; external liblasem;
procedure lsm_svg_view_show_rectangle(view: PLsmSvgView; x: double; y: double; width: double; height: double; rx: double; ry: double); cdecl; external liblasem;
procedure lsm_svg_view_show_circle(view: PLsmSvgView; cx: double; cy: double; r: double); cdecl; external liblasem;
procedure lsm_svg_view_show_ellipse(view: PLsmSvgView; cx: double; cy: double; rx: double; ry: double); cdecl; external liblasem;
procedure lsm_svg_view_show_path(view: PLsmSvgView; d: pchar); cdecl; external liblasem;
procedure lsm_svg_view_show_line(view: PLsmSvgView; x1: double; y1: double; x2: double; y2: double); cdecl; external liblasem;
procedure lsm_svg_view_show_polyline(view: PLsmSvgView; points: pchar); cdecl; external liblasem;
procedure lsm_svg_view_show_polygon(view: PLsmSvgView; points: pchar); cdecl; external liblasem;
procedure lsm_svg_view_start_text(view: PLsmSvgView); cdecl; external liblasem;
procedure lsm_svg_view_end_text(view: PLsmSvgView); cdecl; external liblasem;
procedure lsm_svg_view_show_text(view: PLsmSvgView; _string: pchar; n_x: dword; x: Pdouble; n_y: dword; y: Pdouble; n_dx: dword; dx: Pdouble; n_dy: dword; dy: Pdouble); cdecl; external liblasem;
procedure lsm_svg_view_text_extents(view: PLsmSvgView; _string: pchar; x: double; y: double; n_dx: dword; dx: Pdouble; n_dy: dword; dy: Pdouble; extents: PLsmExtents); cdecl; external liblasem;
procedure lsm_svg_view_show_pixbuf(view: PLsmSvgView; pixbuf: PGdkPixbuf); cdecl; external liblasem;
procedure lsm_svg_view_push_viewbox(view: PLsmSvgView; viewbox: PLsmBox); cdecl; external liblasem;
procedure lsm_svg_view_pop_viewbox(view: PLsmSvgView); cdecl; external liblasem;
procedure lsm_svg_view_push_viewport(view: PLsmSvgView; viewport: PLsmBox; viewbox: PLsmBox; aspect_ratio: PLsmSvgPreserveAspectRatio; overflow: TLsmSvgOverflow); cdecl; external liblasem;
procedure lsm_svg_view_pop_viewport(view: PLsmSvgView); cdecl; external liblasem;
procedure lsm_svg_view_viewbox_to_viewport(view: PLsmSvgView; viewport: PLsmBox; viewbox: PLsmBox; aspect_ratio: PLsmSvgPreserveAspectRatio; x: Pdouble; y: Pdouble); cdecl; external liblasem;
function lsm_svg_view_push_matrix(view: PLsmSvgView; matrix: PLsmSvgMatrix): Tgboolean; cdecl; external liblasem;
procedure lsm_svg_view_pop_matrix(view: PLsmSvgView); cdecl; external liblasem;
procedure lsm_svg_view_push_element(view: PLsmSvgView; element: PLsmSvgElement); cdecl; external liblasem;
procedure lsm_svg_view_pop_element(view: PLsmSvgView); cdecl; external liblasem;
function lsm_svg_view_get_referencing_element(view: PLsmSvgView): PLsmSvgElement; cdecl; external liblasem;
procedure lsm_svg_view_push_style(view: PLsmSvgView; style: PLsmSvgStyle); cdecl; external liblasem;
procedure lsm_svg_view_pop_style(view: PLsmSvgView); cdecl; external liblasem;
function lsm_svg_view_get_current_style(view: PLsmSvgView): PLsmSvgStyle; cdecl; external liblasem;
procedure lsm_svg_view_push_composition(view: PLsmSvgView; style: PLsmSvgStyle); cdecl; external liblasem;
procedure lsm_svg_view_pop_composition(view: PLsmSvgView); cdecl; external liblasem;
function lsm_svg_view_get_filter_surface_extents(view: PLsmSvgView; name: pchar): TLsmBox; cdecl; external liblasem;
procedure lsm_svg_view_apply_blend(view: PLsmSvgView; input_1: pchar; input_2: pchar; output: pchar; subregion: PLsmBox; mode: TLsmSvgBlendingMode); cdecl; external liblasem;
procedure lsm_svg_view_apply_flood(view: PLsmSvgView; output: pchar; subregion: PLsmBox); cdecl; external liblasem;
procedure lsm_svg_view_apply_gaussian_blur(view: PLsmSvgView; input: pchar; output: pchar; subregion: PLsmBox; std_x: double; std_y: double); cdecl; external liblasem;
procedure lsm_svg_view_apply_offset(view: PLsmSvgView; input: pchar; output: pchar; subregion: PLsmBox; dx: double; dy: double); cdecl; external liblasem;
procedure lsm_svg_view_apply_color_matrix(view: PLsmSvgView; input: pchar; output: pchar; subregion: PLsmBox; _type: TLsmSvgColorFilterType; n_values: dword; values: Pdouble); cdecl; external liblasem;
procedure lsm_svg_view_apply_displacement_map(view: PLsmSvgView; input_1: pchar; input_2: pchar; output: pchar; subregion: PLsmBox;
  scale: double; x_channel_selector: TLsmSvgChannelSelector; y_channel_selector: TLsmSvgChannelSelector); cdecl; external liblasem;
procedure lsm_svg_view_apply_merge(view: PLsmSvgView; input: pchar; output: pchar; subregion: PLsmBox); cdecl; external liblasem;
procedure lsm_svg_view_apply_tile(view: PLsmSvgView; input: pchar; output: pchar; subregion: PLsmBox); cdecl; external liblasem;
procedure lsm_svg_view_apply_image(view: PLsmSvgView; output: pchar; subregion: PLsmBox; pixbuf: PGdkPixbuf; preserve_aspect_ratio: TLsmSvgPreserveAspectRatio); cdecl; external liblasem;
procedure lsm_svg_view_apply_morphology(view: PLsmSvgView; input: pchar; output: pchar; subregion: PLsmBox; op: TLsmSvgMorphologyOperator; radius: double); cdecl; external liblasem;
procedure lsm_svg_view_apply_convolve_matrix(view: PLsmSvgView; input: pchar; output: pchar; subregion: PLsmBox; a: dword;
  b: dword; n_values: dword; values: Pdouble; divisor: double; bias: double;
  target_x: longint; target_y: longint; edge_mode: TLsmSvgEdgeMode; preserve_alpha: Tgboolean); cdecl; external liblasem;
procedure lsm_svg_view_apply_specular_lighting(view: PLsmSvgView; output: pchar; subregion: PLsmBox; surface_scale: double; specular_constant: double; specular_exponent: double; dx: double; dy: double); cdecl; external liblasem;
procedure lsm_svg_view_apply_turbulence(view: PLsmSvgView; output: pchar; subregion: PLsmBox; base_frequency_x: double; base_frequency_y: double; n_octaves: longint; seed: double; stitch_tiles: TLsmSvgStitchTiles; _type: TLsmSvgTurbulenceType); cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:12:17 ===

function LSM_TYPE_SVG_VIEW: TGType;
function LSM_SVG_VIEW(obj: Pointer): PLsmSvgView;
function LSM_SVG_VIEW_CLASS(klass: Pointer): PLsmSvgViewClass;
function LSM_IS_SVG_VIEW(obj: Pointer): Tgboolean;
function LSM_IS_SVG_VIEW_CLASS(klass: Pointer): Tgboolean;
function LSM_SVG_VIEW_GET_CLASS(obj: Pointer): PLsmSvgViewClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_VIEW: TGType;
begin
  LSM_TYPE_SVG_VIEW := lsm_svg_view_get_type;
end;

function LSM_SVG_VIEW(obj: Pointer): PLsmSvgView;
begin
  Result := PLsmSvgView(g_type_check_instance_cast(obj, LSM_TYPE_SVG_VIEW));
end;

function LSM_SVG_VIEW_CLASS(klass: Pointer): PLsmSvgViewClass;
begin
  Result := PLsmSvgViewClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_VIEW));
end;

function LSM_IS_SVG_VIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_SVG_VIEW);
end;

function LSM_IS_SVG_VIEW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_SVG_VIEW);
end;

function LSM_SVG_VIEW_GET_CLASS(obj: Pointer): PLsmSvgViewClass;
begin
  Result := PLsmSvgViewClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
