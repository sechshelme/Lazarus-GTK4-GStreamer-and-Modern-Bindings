{$IFDEF read_interface}


type
  TLsmSvgVector = record
    n_values: dword;
    values: Pdouble;
  end;
  PLsmSvgVector = ^TLsmSvgVector;

  TLsmSvgAngle = record
    _type: TLsmSvgAngleType;
    angle: double;
  end;
  PLsmSvgAngle = ^TLsmSvgAngle;

  TLsmSvgColor = record
    red: double;
    green: double;
    blue: double;
  end;
  PLsmSvgColor = ^TLsmSvgColor;

var
  lsm_svg_color_null : TLsmSvgColor;cvar;external liblasem;

type
  TLsmSvgDashArray = record
    n_dashes: dword;
    dashes: PLsmSvgLength;
  end;
  PLsmSvgDashArray = ^TLsmSvgDashArray;

var
  lsm_svg_dash_array_null : TLsmSvgDashArray;cvar;external liblasem;

function lsm_svg_dash_array_new(n_dashes: dword): PLsmSvgDashArray; cdecl; external liblasem;
procedure lsm_svg_dash_array_free(arr: PLsmSvgDashArray); cdecl; external liblasem;
function lsm_svg_dash_array_duplicate(origin: PLsmSvgDashArray): PLsmSvgDashArray; cdecl; external liblasem;
procedure lsm_svg_dash_array_copy(to_: PLsmSvgDashArray; from: PLsmSvgDashArray); cdecl; external liblasem;

type
  TLsmSvgPaint = record
    _type: TLsmSvgPaintType;
    url: pchar;
    color: TLsmSvgColor;
  end;
  PLsmSvgPaint = ^TLsmSvgPaint;

  TLsmSvgPreserveAspectRatio = record
    defer: Tgboolean;
    align: TLsmSvgAlign;
    meet_or_slice: TLsmSvgMeetOrSlice;
  end;
  PLsmSvgPreserveAspectRatio = ^TLsmSvgPreserveAspectRatio;

  TLsmSvgOneOrTwoDouble = record
    a: double;
    b: double;
  end;
  PLsmSvgOneOrTwoDouble = ^TLsmSvgOneOrTwoDouble;

  TLsmSvgOneOrTwoInteger = record
    a: longint;
    b: longint;
  end;
  PLsmSvgOneOrTwoInteger = ^TLsmSvgOneOrTwoInteger;

var
  lsm_svg_angle_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_blending_mode_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_enable_background_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_channel_selector_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_color_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_color_filter_type_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_comp_op_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_dash_array_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_display_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_edge_mode_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_fill_rule_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_font_stretch_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_font_style_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_font_weight_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_one_or_two_integer_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_length_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_length_list_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_line_join_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_line_cap_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_marker_units_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_matrix_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_morphology_operator_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_one_or_two_double_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_overflow_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_paint_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_pattern_units_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_preserve_aspect_ratio_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_spread_method_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_stitch_tiles_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_text_anchor_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_turbulence_type_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_vector_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_visibility_trait_class : TLsmTraitClass;cvar;external liblasem;
  lsm_svg_writing_mode_trait_class : TLsmTraitClass;cvar;external liblasem;

// === Konventiert am: 3-3-26 17:11:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
