{$IFDEF read_interface}


type
  PLsmSvgFilterSurface = type Pointer;

function lsm_svg_filter_surface_get_type: TGType; cdecl; external liblasem;
function lsm_svg_filter_surface_new(name: pchar; width: dword; height: dword; subregion: PLsmBox): PLsmSvgFilterSurface; cdecl; external liblasem;
function lsm_svg_filter_surface_new_with_content(name: pchar; surface: Pcairo_surface_t; subregion: PLsmBox): PLsmSvgFilterSurface; cdecl; external liblasem;
function lsm_svg_filter_surface_new_similar(name: pchar; model: PLsmSvgFilterSurface; subregion: PLsmBox): PLsmSvgFilterSurface; cdecl; external liblasem;
function lsm_svg_filter_surface_get_name(surface: PLsmSvgFilterSurface): pchar; cdecl; external liblasem;
function lsm_svg_filter_surface_get_cairo_surface(surface: PLsmSvgFilterSurface): Pcairo_surface_t; cdecl; external liblasem;
function lsm_svg_filter_surface_get_subregion(surface: PLsmSvgFilterSurface): PLsmBox; cdecl; external liblasem;
procedure lsm_svg_filter_surface_unref(filter_surface: PLsmSvgFilterSurface); cdecl; external liblasem;
function lsm_svg_filter_surface_ref(filter_surface: PLsmSvgFilterSurface): PLsmSvgFilterSurface; cdecl; external liblasem;
procedure lsm_svg_filter_surface_alpha(input: PLsmSvgFilterSurface; output: PLsmSvgFilterSurface); cdecl; external liblasem;
procedure lsm_svg_filter_surface_blend(input_1: PLsmSvgFilterSurface; input_2: PLsmSvgFilterSurface; output: PLsmSvgFilterSurface; blending_mode: longint); cdecl; external liblasem;
procedure lsm_svg_filter_surface_blur(input: PLsmSvgFilterSurface; output: PLsmSvgFilterSurface; sx: double; sy: double); cdecl; external liblasem;
procedure lsm_svg_filter_surface_flood(surface: PLsmSvgFilterSurface; red: double; green: double; blue: double; opacity: double); cdecl; external liblasem;
procedure lsm_svg_filter_surface_offset(input: PLsmSvgFilterSurface; output: PLsmSvgFilterSurface; dx: longint; dy: longint); cdecl; external liblasem;
procedure lsm_svg_filter_surface_merge(input: PLsmSvgFilterSurface; output: PLsmSvgFilterSurface); cdecl; external liblasem;
procedure lsm_svg_filter_surface_tile(input: PLsmSvgFilterSurface; output: PLsmSvgFilterSurface); cdecl; external liblasem;
procedure lsm_svg_filter_surface_color_matrix(input: PLsmSvgFilterSurface; output: PLsmSvgFilterSurface; _type: TLsmSvgColorFilterType; n_values: dword; values: Pdouble); cdecl; external liblasem;
procedure lsm_svg_filter_surface_convolve_matrix(input: PLsmSvgFilterSurface; output: PLsmSvgFilterSurface; x_order: dword; y_order: dword; n_values: dword;
  values: Pdouble; divisor: double; bias: double; target_x: dword; target_y: dword;
  edge_mode: TLsmSvgEdgeMode; preserve_alpha: Tgboolean); cdecl; external liblasem;
procedure lsm_svg_filter_surface_displacement_map(input_1: PLsmSvgFilterSurface; input_2: PLsmSvgFilterSurface; output: PLsmSvgFilterSurface; x_scale: double; y_scale: double;
  x_channel_selector: TLsmSvgChannelSelector; y_channel_selector: TLsmSvgChannelSelector); cdecl; external liblasem;
procedure lsm_svg_filter_surface_image(output: PLsmSvgFilterSurface; pixbuf: PGdkPixbuf; preserve_aspect_ratio: TLsmSvgPreserveAspectRatio); cdecl; external liblasem;
procedure lsm_svg_filter_surface_morphology(input_surface: PLsmSvgFilterSurface; output_surface: PLsmSvgFilterSurface; op: TLsmSvgMorphologyOperator; rx: double; ry: double); cdecl; external liblasem;
procedure lsm_svg_filter_surface_specular_lighting(output_surface: PLsmSvgFilterSurface; surface_scale: double; specular_constant: double; specular_exponent: double; dx: double;
  dy: double); cdecl; external liblasem;
procedure lsm_svg_filter_surface_turbulence(output_surface: PLsmSvgFilterSurface; base_frequency_x: double; base_frequency_y: double; n_octaves: longint; seed: double;
  stitch_tiles: TLsmSvgStitchTiles; _type: TLsmSvgTurbulenceType; transform: Pcairo_matrix_t); cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:01:22 ===

function LSM_TYPE_FILTER_SURFACE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_FILTER_SURFACE: TGType;
begin
  LSM_TYPE_FILTER_SURFACE := lsm_svg_filter_surface_get_type;
end;



{$ENDIF read_implementation}
