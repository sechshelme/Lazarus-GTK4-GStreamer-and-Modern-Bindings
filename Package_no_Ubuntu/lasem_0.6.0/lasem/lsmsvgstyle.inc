{$IFDEF read_interface}


type
  TLsmSvgCompOpProperty = record
    base: TLsmProperty;
    value: TLsmSvgCompOp;
  end;
  PLsmSvgCompOpProperty = ^TLsmSvgCompOpProperty;

  TLsmSvgDoubleProperty = record
    base: TLsmProperty;
    value: double;
  end;
  PLsmSvgDoubleProperty = ^TLsmSvgDoubleProperty;

  TLsmSvgEnableBackgroundProperty = record
    base: TLsmProperty;
    value: TLsmSvgEnableBackground;
  end;
  PLsmSvgEnableBackgroundProperty = ^TLsmSvgEnableBackgroundProperty;

  TLsmSvgLengthProperty = record
    base: TLsmProperty;
    length: TLsmSvgLength;
  end;
  PLsmSvgLengthProperty = ^TLsmSvgLengthProperty;

  TLsmSvgOverflowProperty = record
    base: TLsmProperty;
    value: TLsmSvgOverflow;
  end;
  PLsmSvgOverflowProperty = ^TLsmSvgOverflowProperty;

  TLsmSvgPaintProperty = record
    base: TLsmProperty;
    paint: TLsmSvgPaint;
  end;
  PLsmSvgPaintProperty = ^TLsmSvgPaintProperty;

  TLsmSvgColorProperty = record
    base: TLsmProperty;
    value: TLsmSvgColor;
  end;
  PLsmSvgColorProperty = ^TLsmSvgColorProperty;

  TLsmSvgTransformProperty = record
    base: TLsmProperty;
    matrix: TLsmSvgMatrix;
  end;
  PLsmSvgTransformProperty = ^TLsmSvgTransformProperty;

  TLsmSvgFillRuleProperty = record
    base: TLsmProperty;
    value: TLsmSvgFillRule;
  end;
  PLsmSvgFillRuleProperty = ^TLsmSvgFillRuleProperty;

  TLsmSvgFontStretchProperty = record
    base: TLsmProperty;
    value: TLsmSvgFontStretch;
  end;
  PLsmSvgFontStretchProperty = ^TLsmSvgFontStretchProperty;

  TLsmSvgFontStyleProperty = record
    base: TLsmProperty;
    value: TLsmSvgFontStyle;
  end;
  PLsmSvgFontStyleProperty = ^TLsmSvgFontStyleProperty;

  TLsmSvgFontWeightProperty = record
    base: TLsmProperty;
    value: TLsmSvgFontWeight;
  end;
  PLsmSvgFontWeightProperty = ^TLsmSvgFontWeightProperty;

  TLsmSvgLineJoinProperty = record
    base: TLsmProperty;
    value: TLsmSvgLineJoin;
  end;
  PLsmSvgLineJoinProperty = ^TLsmSvgLineJoinProperty;

  TLsmSvgLineCapProperty = record
    base: TLsmProperty;
    value: TLsmSvgLineCap;
  end;
  PLsmSvgLineCapProperty = ^TLsmSvgLineCapProperty;

  TLsmSvgDashArrayProperty = record
    base: TLsmProperty;
    value: TLsmSvgDashArray;
  end;
  PLsmSvgDashArrayProperty = ^TLsmSvgDashArrayProperty;

  TLsmSvgTextAnchorProperty = record
    base: TLsmProperty;
    value: TLsmSvgTextAnchor;
  end;
  PLsmSvgTextAnchorProperty = ^TLsmSvgTextAnchorProperty;

  TLsmSvgDisplayProperty = record
    base: TLsmProperty;
    value: TLsmSvgDisplay;
  end;
  PLsmSvgDisplayProperty = ^TLsmSvgDisplayProperty;

  TLsmSvgVisibilityProperty = record
    base: TLsmProperty;
    value: TLsmSvgVisibility;
  end;
  PLsmSvgVisibilityProperty = ^TLsmSvgVisibilityProperty;

  TLsmSvgWritingModeProperty = record
    base: TLsmProperty;
    value: TLsmSvgWritingMode;
  end;
  PLsmSvgWritingModeProperty = ^TLsmSvgWritingModeProperty;

  //TLsmSvgStyle = record
  //  alignment_baseline: PLsmProperty;
  //  baseline_shift: PLsmProperty;
  //  clip: PLsmProperty;
  //  clip_path: PLsmProperty;
  //  comp_op: PLsmSvgCompOpProperty;
  //  dominant_baseline: PLsmProperty;
  //  enable_background: PLsmSvgEnableBackgroundProperty;
  //  filter: PLsmProperty;
  //  flood_color: PLsmSvgColorProperty;
  //  flood_opacity: PLsmSvgDoubleProperty;
  //  lighting_color: PLsmSvgColorProperty;
  //  mask: PLsmProperty;
  //  opacity: PLsmSvgDoubleProperty;
  //  overflow: PLsmSvgOverflowProperty;
  //  stop_color: PLsmSvgColorProperty;
  //  stop_opacity: PLsmSvgDoubleProperty;
  //  text_decoration: PLsmProperty;
  //  unicode_bidi: PLsmProperty;
  //  viewport_fill: PLsmSvgPaintProperty;
  //  viewport_fill_opacity: PLsmSvgDoubleProperty;
  //  clip_rule: PLsmSvgFillRuleProperty;
  //  color: PLsmSvgColorProperty;
  //  color_interpolation: PLsmProperty;
  //  color_interpolation_filters: PLsmProperty;
  //  color_profile: PLsmProperty;
  //  color_rendering: PLsmProperty;
  //  cursor: PLsmProperty;
  //  direction: PLsmProperty;
  //  display: PLsmSvgDisplayProperty;
  //  fill: PLsmSvgPaintProperty;
  //  fill_opacity: PLsmSvgDoubleProperty;
  //  fill_rule: PLsmSvgFillRuleProperty;
  //  font: PLsmProperty;
  //  font_family: PLsmProperty;
  //  font_size: PLsmSvgLengthProperty;
  //  font_size_adjust: PLsmProperty;
  //  font_stretch: PLsmSvgFontStretchProperty;
  //  font_style: PLsmSvgFontStyleProperty;
  //  font_variant: PLsmProperty;
  //  font_weight: PLsmSvgFontWeightProperty;
  //  glyph_orientation_horizontal: PLsmProperty;
  //  glyph_orientation_vertical: PLsmProperty;
  //  image_rendering: PLsmProperty;
  //  kerning: PLsmProperty;
  //  letter_spacing: PLsmProperty;
  //  marker: PLsmProperty;
  //  marker_end: PLsmProperty;
  //  marker_mid: PLsmProperty;
  //  marker_start: PLsmProperty;
  //  pointer_events: PLsmProperty;
  //  shape_rendering: PLsmProperty;
  //  stroke: PLsmSvgPaintProperty;
  //  stroke_dash_array: PLsmSvgDashArrayProperty;
  //  stroke_dash_offset: PLsmSvgLengthProperty;
  //  stroke_line_cap: PLsmSvgLineCapProperty;
  //  stroke_line_join: PLsmSvgLineJoinProperty;
  //  stroke_miter_limit: PLsmSvgDoubleProperty;
  //  stroke_opacity: PLsmSvgDoubleProperty;
  //  stroke_width: PLsmSvgLengthProperty;
  //  text_anchor: PLsmSvgTextAnchorProperty;
  //  text_rendering: PLsmProperty;
  //  visibility: PLsmSvgVisibilityProperty;
  //  word_spacing: PLsmProperty;
  //  writing_mode: PLsmSvgWritingModeProperty;
  //  font_size_px: double;
  //  ignore_group_opacity: Tgboolean;
  //end;
  //PLsmSvgStyle = ^TLsmSvgStyle;

procedure lsm_svg_property_bag_set_property(property_bag: PLsmPropertyBag; name: pchar; value: pchar); cdecl; external liblasem;
function lsm_svg_property_bag_get_property(property_bag: PLsmPropertyBag; name: pchar): pchar; cdecl; external liblasem;
procedure lsm_svg_property_bag_clean(property_bag: PLsmPropertyBag); cdecl; external liblasem;
function lsm_svg_property_bag_serialize(property_bag: PLsmPropertyBag): pchar; cdecl; external liblasem;
function lsm_svg_style_new: PLsmSvgStyle; cdecl; external liblasem;
function lsm_svg_style_ref(style: PLsmSvgStyle): PLsmSvgStyle; cdecl; external liblasem;
procedure lsm_svg_style_unref(style: PLsmSvgStyle); cdecl; external liblasem;
function lsm_svg_style_new_inherited(parent_style: PLsmSvgStyle; property_bag: PLsmPropertyBag): PLsmSvgStyle; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:11:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
