{$IFDEF read_interface}


type
  PLsmSvgAngleType = ^TLsmSvgAngleType;
  TLsmSvgAngleType = longint;

const
  LSM_SVG_ANGLE_TYPE_ERROR = -(1);
  LSM_SVG_ANGLE_TYPE_AUTO = (-(1)) + 1;
  LSM_SVG_ANGLE_TYPE_FIXED = (-(1)) + 2;

type
  PLsmSvgBlendingMode = ^TLsmSvgBlendingMode;
  TLsmSvgBlendingMode = longint;

const
  LSM_SVG_BLENDING_MODE_ERROR = -(1);
  LSM_SVG_BLENDING_MODE_NORMAL = (-(1)) + 1;
  LSM_SVG_BLENDING_MODE_MULTIPLY = (-(1)) + 2;
  LSM_SVG_BLENDING_MODE_SCREEN = (-(1)) + 3;
  LSM_SVG_BLENDING_MODE_DARKEN = (-(1)) + 4;
  LSM_SVG_BLENDING_MODE_LIGHTEN = (-(1)) + 5;
  LSM_SVG_BLENDING_MODE_OVER = (-(1)) + 6;
  LSM_SVG_BLENDING_MODE_IN = (-(1)) + 7;
  LSM_SVG_BLENDING_MODE_OUT = (-(1)) + 8;
  LSM_SVG_BLENDING_MODE_ATOP = (-(1)) + 9;
  LSM_SVG_BLENDING_MODE_XOR = (-(1)) + 10;

function lsm_svg_blending_mode_to_string(blending_mode: TLsmSvgBlendingMode): pchar; cdecl; external liblasem;
function lsm_svg_blending_mode_from_string(_string: pchar): TLsmSvgBlendingMode; cdecl; external liblasem;

type
  PLsmSvgEnableBackground = ^TLsmSvgEnableBackground;
  TLsmSvgEnableBackground = longint;

const
  LSM_SVG_ENABLE_BACKGROUND_ERROR = -(1);
  LSM_SVG_ENABLE_BACKGROUND_ACCUMULATE = (-(1)) + 1;
  LSM_SVG_ENABLE_BACKGROUND_NEW = (-(1)) + 2;

function lsm_svg_enable_background_to_string(enable_background: TLsmSvgEnableBackground): pchar; cdecl; external liblasem;
function lsm_svg_enable_background_from_string(_string: pchar): TLsmSvgEnableBackground; cdecl; external liblasem;

type
  PLsmSvgPaintType = ^TLsmSvgPaintType;
  TLsmSvgPaintType = longint;

const
  LSM_SVG_PAINT_TYPE_ERROR = -(1);
  LSM_SVG_PAINT_TYPE_UNKNOWN = 0;
  LSM_SVG_PAINT_TYPE_RGB_COLOR = 1;
  LSM_SVG_PAINT_TYPE_RGB_COLOR_ICC_COLOR = 2;
  LSM_SVG_PAINT_TYPE_NONE = 101;
  LSM_SVG_PAINT_TYPE_CURRENT_COLOR = 102;
  LSM_SVG_PAINT_TYPE_URI_NONE = 103;
  LSM_SVG_PAINT_TYPE_URI_CURRENT_COLOR = 104;
  LSM_SVG_PAINT_TYPE_URI_RGB_COLOR = 105;
  LSM_SVG_PAINT_TYPE_URI_RGB_COLOR_ICC_COLOR = 106;
  LSM_SVG_PAINT_TYPE_URI = 107;

type
  PLsmSvgLengthDirection = ^TLsmSvgLengthDirection;
  TLsmSvgLengthDirection = longint;

const
  LSM_SVG_LENGTH_DIRECTION_ERROR = -(1);
  LSM_SVG_LENGTH_DIRECTION_HORIZONTAL = (-(1)) + 1;
  LSM_SVG_LENGTH_DIRECTION_VERTICAL = (-(1)) + 2;
  LSM_SVG_LENGTH_DIRECTION_DIAGONAL = (-(1)) + 3;

type
  PLsmSvgLengthType = ^TLsmSvgLengthType;
  TLsmSvgLengthType = longint;

const
  LSM_SVG_LENGTH_TYPE_ERROR = -(1);
  LSM_SVG_LENGTH_TYPE_NUMBER = (-(1)) + 1;
  LSM_SVG_LENGTH_TYPE_PERCENTAGE = (-(1)) + 2;
  LSM_SVG_LENGTH_TYPE_EMS = (-(1)) + 3;
  LSM_SVG_LENGTH_TYPE_EXS = (-(1)) + 4;
  LSM_SVG_LENGTH_TYPE_PX = (-(1)) + 5;
  LSM_SVG_LENGTH_TYPE_CM = (-(1)) + 6;
  LSM_SVG_LENGTH_TYPE_MM = (-(1)) + 7;
  LSM_SVG_LENGTH_TYPE_IN = (-(1)) + 8;
  LSM_SVG_LENGTH_TYPE_PT = (-(1)) + 9;
  LSM_SVG_LENGTH_TYPE_PC = (-(1)) + 10;

function lsm_svg_length_type_to_string(length_type: TLsmSvgLengthType): pchar; cdecl; external liblasem;
function lsm_svg_length_type_from_string(_string: pchar): TLsmSvgLengthType; cdecl; external liblasem;

type
  PLsmSvgFillRule = ^TLsmSvgFillRule;
  TLsmSvgFillRule = longint;

const
  LSM_SVG_FILL_RULE_ERROR = -(1);
  LSM_SVG_FILL_RULE_NON_ZERO = (-(1)) + 1;
  LSM_SVG_FILL_RULE_EVEN_ODD = (-(1)) + 2;

function lsm_svg_fill_rule_to_string(fill_rule: TLsmSvgFillRule): pchar; cdecl; external liblasem;
function lsm_svg_fill_rule_from_string(_string: pchar): TLsmSvgFillRule; cdecl; external liblasem;

type
  PLsmSvgLineJoin = ^TLsmSvgLineJoin;
  TLsmSvgLineJoin = longint;

const
  LSM_SVG_LINE_JOIN_ERROR = -(1);
  LSM_SVG_LINE_JOIN_MITER = (-(1)) + 1;
  LSM_SVG_LINE_JOIN_ROUND = (-(1)) + 2;
  LSM_SVG_LINE_JOIN_BEVEL = (-(1)) + 3;

function lsm_svg_line_join_to_string(line_join: TLsmSvgLineJoin): pchar; cdecl; external liblasem;
function lsm_svg_line_join_from_string(_string: pchar): TLsmSvgLineJoin; cdecl; external liblasem;

type
  PLsmSvgLineCap = ^TLsmSvgLineCap;
  TLsmSvgLineCap = longint;

const
  LSM_SVG_LINE_CAP_ERROR = -(1);
  LSM_SVG_LINE_CAP_BUTT = (-(1)) + 1;
  LSM_SVG_LINE_CAP_ROUND = (-(1)) + 2;
  LSM_SVG_LINE_CAP_SQUARE = (-(1)) + 3;

function lsm_svg_line_cap_to_string(line_cap: TLsmSvgLineCap): pchar; cdecl; external liblasem;
function lsm_svg_line_cap_from_string(_string: pchar): TLsmSvgLineCap; cdecl; external liblasem;

type
  PLsmSvgTransformType = ^TLsmSvgTransformType;
  TLsmSvgTransformType = longint;

const
  LSM_SVG_TRANSFORM_TYPE_ERROR = -(1);
  LSM_SVG_TRANSFORM_TYPE_MATRIX = (-(1)) + 1;
  LSM_SVG_TRANSFORM_TYPE_TRANSLATE = (-(1)) + 2;
  LSM_SVG_TRANSFORM_TYPE_SCALE = (-(1)) + 3;
  LSM_SVG_TRANSFORM_TYPE_ROTATE = (-(1)) + 4;
  LSM_SVG_TRANSFORM_TYPE_SKEW_X = (-(1)) + 5;
  LSM_SVG_TRANSFORM_TYPE_SKEW_Y = (-(1)) + 6;

type
  PLsmSvgOverflow = ^TLsmSvgOverflow;
  TLsmSvgOverflow = longint;

const
  LSM_SVG_OVERFLOW_ERROR = -(1);
  LSM_SVG_OVERFLOW_VISIBLE = (-(1)) + 1;
  LSM_SVG_OVERFLOW_HIDDEN = (-(1)) + 2;
  LSM_SVG_OVERFLOW_SCROLL = (-(1)) + 3;
  LSM_SVG_OVERFLOW_AUTO = (-(1)) + 4;

function lsm_svg_overflow_to_string(overflow: TLsmSvgOverflow): pchar; cdecl; external liblasem;
function lsm_svg_overflow_from_string(_string: pchar): TLsmSvgOverflow; cdecl; external liblasem;

type
  PLsmSvgPatternUnits = ^TLsmSvgPatternUnits;
  TLsmSvgPatternUnits = longint;

const
  LSM_SVG_PATTERN_UNITS_ERROR = -(1);
  LSM_SVG_PATTERN_UNITS_USER_SPACE_ON_USE = (-(1)) + 1;
  LSM_SVG_PATTERN_UNITS_OBJECT_BOUNDING_BOX = (-(1)) + 2;

function lsm_svg_pattern_units_to_string(units: TLsmSvgPatternUnits): pchar; cdecl; external liblasem;
function lsm_svg_pattern_units_from_string(_string: pchar): TLsmSvgPatternUnits; cdecl; external liblasem;

type
  PLsmSvgMarkerUnits = ^TLsmSvgMarkerUnits;
  TLsmSvgMarkerUnits = longint;

const
  LSM_SVG_MARKER_UNITS_ERROR = -(1);
  LSM_SVG_MARKER_UNITS_STROKE_WIDTH = (-(1)) + 1;
  LSM_SVG_MARKER_UNITS_USER_SPACE_ON_USE = (-(1)) + 2;

function lsm_svg_marker_units_to_string(units: TLsmSvgMarkerUnits): pchar; cdecl; external liblasem;
function lsm_svg_marker_units_from_string(_string: pchar): TLsmSvgMarkerUnits; cdecl; external liblasem;

type
  PLsmSvgSpreadMethod = ^TLsmSvgSpreadMethod;
  TLsmSvgSpreadMethod = longint;

const
  LSM_SVG_SPREAD_METHOD_ERROR = -(1);
  LSM_SVG_SPREAD_METHOD_PAD = (-(1)) + 1;
  LSM_SVG_SPREAD_METHOD_REFLECT = (-(1)) + 2;
  LSM_SVG_SPREAD_METHOD_REPEAT = (-(1)) + 3;

function lsm_svg_spread_method_to_string(method: TLsmSvgSpreadMethod): pchar; cdecl; external liblasem;
function lsm_svg_spread_method_from_string(_string: pchar): TLsmSvgSpreadMethod; cdecl; external liblasem;

type
  PLsmSvgAlign = ^TLsmSvgAlign;
  TLsmSvgAlign = longint;

const
  LSM_SVG_ALIGN_ERROR = -(1);
  LSM_SVG_ALIGN_NONE = (-(1)) + 1;
  LSM_SVG_ALIGN_X_MIN_Y_MIN = (-(1)) + 2;
  LSM_SVG_ALIGN_X_MID_Y_MIN = (-(1)) + 3;
  LSM_SVG_ALIGN_X_MAX_Y_MIN = (-(1)) + 4;
  LSM_SVG_ALIGN_X_MIN_Y_MID = (-(1)) + 5;
  LSM_SVG_ALIGN_X_MID_Y_MID = (-(1)) + 6;
  LSM_SVG_ALIGN_X_MAX_Y_MID = (-(1)) + 7;
  LSM_SVG_ALIGN_X_MIN_Y_MAX = (-(1)) + 8;
  LSM_SVG_ALIGN_X_MID_Y_MAX = (-(1)) + 9;
  LSM_SVG_ALIGN_X_MAX_Y_MAX = (-(1)) + 10;

function lsm_svg_align_to_string(align: TLsmSvgAlign): pchar; cdecl; external liblasem;
function lsm_svg_align_from_string(_string: pchar): TLsmSvgAlign; cdecl; external liblasem;

type
  PLsmSvgMeetOrSlice = ^TLsmSvgMeetOrSlice;
  TLsmSvgMeetOrSlice = longint;

const
  LSM_SVG_MEET_OR_SLICE_ERROR = -(1);
  LSM_SVG_MEET_OR_SLICE_MEET = (-(1)) + 1;
  LSM_SVG_MEET_OR_SLICE_SLICE = (-(1)) + 2;

function lsm_svg_meet_or_slice_to_string(meet_or_slice: TLsmSvgMeetOrSlice): pchar; cdecl; external liblasem;
function lsm_svg_meet_or_slice_from_string(_string: pchar): TLsmSvgMeetOrSlice; cdecl; external liblasem;

type
  PLsmSvgCompOp = ^TLsmSvgCompOp;
  TLsmSvgCompOp = longint;

const
  LSM_SVG_COMP_OP_ERROR = -(1);
  LSM_SVG_COMP_OP_CLEAR = (-(1)) + 1;
  LSM_SVG_COMP_OP_SRC = (-(1)) + 2;
  LSM_SVG_COMP_OP_DST = (-(1)) + 3;
  LSM_SVG_COMP_OP_SRC_OVER = (-(1)) + 4;
  LSM_SVG_COMP_OP_DST_OVER = (-(1)) + 5;
  LSM_SVG_COMP_OP_SRC_IN = (-(1)) + 6;
  LSM_SVG_COMP_OP_DST_IN = (-(1)) + 7;
  LSM_SVG_COMP_OP_SRC_OUT = (-(1)) + 8;
  LSM_SVG_COMP_OP_DST_OUT = (-(1)) + 9;
  LSM_SVG_COMP_OP_SRC_ATOP = (-(1)) + 10;
  LSM_SVG_COMP_OP_DST_ATOP = (-(1)) + 11;
  LSM_SVG_COMP_OP_XOR = (-(1)) + 12;
  LSM_SVG_COMP_OP_PLUS = (-(1)) + 13;
  LSM_SVG_COMP_OP_MULTIPLY = (-(1)) + 14;
  LSM_SVG_COMP_OP_SCREEN = (-(1)) + 15;
  LSM_SVG_COMP_OP_OVERLAY = (-(1)) + 16;
  LSM_SVG_COMP_OP_DARKEN = (-(1)) + 17;
  LSM_SVG_COMP_OP_LIGHTEN = (-(1)) + 18;
  LSM_SVG_COMP_OP_COLOR_DODGE = (-(1)) + 19;
  LSM_SVG_COMP_OP_COLOR_BURN = (-(1)) + 20;
  LSM_SVG_COMP_OP_HARD_LIGHT = (-(1)) + 21;
  LSM_SVG_COMP_OP_SOFT_LIGHT = (-(1)) + 22;
  LSM_SVG_COMP_OP_DIFFERENCE = (-(1)) + 23;
  LSM_SVG_COMP_OP_EXCLUSION = (-(1)) + 24;

function lsm_svg_comp_op_to_string(comp_op: TLsmSvgCompOp): pchar; cdecl; external liblasem;
function lsm_svg_comp_op_from_string(_string: pchar): TLsmSvgCompOp; cdecl; external liblasem;

type
  PLsmSvgFontStretch = ^TLsmSvgFontStretch;
  TLsmSvgFontStretch = longint;

const
  LSM_SVG_FONT_STRETCH_ERROR = -(1);
  LSM_SVG_FONT_STRETCH_NORMAL = (-(1)) + 1;
  LSM_SVG_FONT_STRETCH_ULTRA_CONDENSED = (-(1)) + 2;
  LSM_SVG_FONT_STRETCH_EXTRA_CONDENSED = (-(1)) + 3;
  LSM_SVG_FONT_STRETCH_CONDENSED = (-(1)) + 4;
  LSM_SVG_FONT_STRETCH_SEMI_CONDENSED = (-(1)) + 5;
  LSM_SVG_FONT_STRETCH_SEMI_EXPANDED = (-(1)) + 6;
  LSM_SVG_FONT_STRETCH_EXPANDED = (-(1)) + 7;
  LSM_SVG_FONT_STRETCH_EXTRA_EXPANDED = (-(1)) + 8;
  LSM_SVG_FONT_STRETCH_ULTRA_EXPANDED = (-(1)) + 9;

function lsm_svg_font_stretch_to_string(font_stretch: TLsmSvgFontStretch): pchar; cdecl; external liblasem;
function lsm_svg_font_stretch_from_string(_string: pchar): TLsmSvgFontStretch; cdecl; external liblasem;

type
  PLsmSvgFontStyle = ^TLsmSvgFontStyle;
  TLsmSvgFontStyle = longint;

const
  LSM_SVG_FONT_STYLE_ERROR = -(1);
  LSM_SVG_FONT_STYLE_NORMAL = (-(1)) + 1;
  LSM_SVG_FONT_STYLE_OBLIQUE = (-(1)) + 2;
  LSM_SVG_FONT_STYLE_ITALIC = (-(1)) + 3;

function lsm_svg_font_style_to_string(font_style: TLsmSvgFontStyle): pchar; cdecl; external liblasem;
function lsm_svg_font_style_from_string(_string: pchar): TLsmSvgFontStyle; cdecl; external liblasem;

type
  PLsmSvgFontWeight = ^TLsmSvgFontWeight;
  TLsmSvgFontWeight = longint;

const
  LSM_SVG_FONT_WEIGHT_ERROR = -(1);
  LSM_SVG_FONT_WEIGHT_NORMAL = 400;
  LSM_SVG_FONT_WEIGHT_BOLD = 700;

function lsm_svg_font_weight_to_string(font_weight: TLsmSvgFontWeight): pchar; cdecl; external liblasem;
function lsm_svg_font_weight_from_string(_string: pchar): TLsmSvgFontWeight; cdecl; external liblasem;

type
  PLsmSvgTextAnchor = ^TLsmSvgTextAnchor;
  TLsmSvgTextAnchor = longint;

const
  LSM_SVG_TEXT_ANCHOR_ERROR = -(1);
  LSM_SVG_TEXT_ANCHOR_START = (-(1)) + 1;
  LSM_SVG_TEXT_ANCHOR_MIDDLE = (-(1)) + 2;
  LSM_SVG_TEXT_ANCHOR_END = (-(1)) + 3;

function lsm_svg_text_anchor_to_string(text_anchor: TLsmSvgTextAnchor): pchar; cdecl; external liblasem;
function lsm_svg_text_anchor_from_string(_string: pchar): TLsmSvgTextAnchor; cdecl; external liblasem;

type
  PLsmSvgFilterInput = ^TLsmSvgFilterInput;
  TLsmSvgFilterInput = longint;

const
  LSM_SVG_FILTER_INPUT_ERROR = -(1);
  LSM_SVG_FILTER_INPUT_SOURCE_GRAPHIC = (-(1)) + 1;
  LSM_SVG_FILTER_INPUT_SOURCE_ALPHA = (-(1)) + 2;
  LSM_SVG_FILTER_INPUT_BACKGROUND_IMAGE = (-(1)) + 3;
  LSM_SVG_FILTER_INPUT_BACKGROUND_ALPHA = (-(1)) + 4;
  LSM_SVG_FILTER_INPUT_FILL_PAINT = (-(1)) + 5;
  LSM_SVG_FILTER_INPUT_STROKE_PAINT = (-(1)) + 6;

type
  PLsmSvgDisplay = ^TLsmSvgDisplay;
  TLsmSvgDisplay = longint;

const
  LSM_SVG_DISPLAY_ERROR = -(1);
  LSM_SVG_DISPLAY_NONE = (-(1)) + 1;
  LSM_SVG_DISPLAY_INLINE = (-(1)) + 2;
  LSM_SVG_DISPLAY_BLOCK = (-(1)) + 3;
  LSM_SVG_DISPLAY_LIST_ITEM = (-(1)) + 4;
  LSM_SVG_DISPLAY_RUN_IN = (-(1)) + 5;
  LSM_SVG_DISPLAY_COMPACT = (-(1)) + 6;
  LSM_SVG_DISPLAY_MARKER = (-(1)) + 7;
  LSM_SVG_DISPLAY_TABLE = (-(1)) + 8;
  LSM_SVG_DISPLAY_INLINE_TABLE = (-(1)) + 9;
  LSM_SVG_DISPLAY_TABLE_ROW_GROUP = (-(1)) + 10;
  LSM_SVG_DISPLAY_TABLE_HEADER_GROUP = (-(1)) + 11;
  LSM_SVG_DISPLAY_TABLE_FOOTER_GROUP = (-(1)) + 12;
  LSM_SVG_DISPLAY_TABLE_ROW = (-(1)) + 13;
  LSM_SVG_DISPLAY_TABLE_COLUMN_GROUP = (-(1)) + 14;
  LSM_SVG_DISPLAY_TABLE_COLUMN = (-(1)) + 15;
  LSM_SVG_DISPLAY_TABLE_CELL = (-(1)) + 16;
  LSM_SVG_DISPLAY_TABLE_CAPTION = (-(1)) + 17;

function lsm_svg_display_to_string(display: TLsmSvgDisplay): pchar; cdecl; external liblasem;
function lsm_svg_display_from_string(_string: pchar): TLsmSvgDisplay; cdecl; external liblasem;

type
  PLsmSvgVisibility = ^TLsmSvgVisibility;
  TLsmSvgVisibility = longint;

const
  LSM_SVG_VISIBILITY_ERROR = -(1);
  LSM_SVG_VISIBILITY_VISIBLE = (-(1)) + 1;
  LSM_SVG_VISIBILITY_HIDDEN = (-(1)) + 2;
  LSM_SVG_VISIBILITY_COLLAPSE = (-(1)) + 3;

function lsm_svg_visibility_to_string(visibility: TLsmSvgVisibility): pchar; cdecl; external liblasem;
function lsm_svg_visibility_from_string(_string: pchar): TLsmSvgVisibility; cdecl; external liblasem;

type
  PLsmSvgElementCategory = ^TLsmSvgElementCategory;
  TLsmSvgElementCategory = longint;

const
  LSM_SVG_ELEMENT_CATEGORY_NONE = 1 shl 0;
  LSM_SVG_ELEMENT_CATEGORY_DESCRIPTIVE = 1 shl 1;
  LSM_SVG_ELEMENT_CATEGORY_CONTAINER = 1 shl 2;
  LSM_SVG_ELEMENT_CATEGORY_STRUCTURAL = 1 shl 3;
  LSM_SVG_ELEMENT_CATEGORY_GRAPHICS_REFERENCING = 1 shl 4;
  LSM_SVG_ELEMENT_CATEGORY_GRAPHICS = 1 shl 5;
  LSM_SVG_ELEMENT_CATEGORY_SHAPE = 1 shl 6;
  LSM_SVG_ELEMENT_CATEGORY_BASIC_SHAPE = 1 shl 7;
  LSM_SVG_ELEMENT_CATEGORY_TEXT_CONTENT = 1 shl 8;
  LSM_SVG_ELEMENT_CATEGORY_TEXT_CONTENT_CHILD = 1 shl 9;
  LSM_SVG_ELEMENT_CATEGORY_GRADIENT = 1 shl 10;
  LSM_SVG_ELEMENT_CATEGORY_FILTER_PRIMITIVE = 1 shl 11;
  LSM_SVG_ELEMENT_CATEGORY_ANIMATION = 1 shl 12;

type
  PLsmSvgWritingMode = ^TLsmSvgWritingMode;
  TLsmSvgWritingMode = longint;

const
  LSM_SVG_WRITING_MODE_ERROR = -(1);
  LSM_SVG_WRITING_MODE_LR_TB = (-(1)) + 1;
  LSM_SVG_WRITING_MODE_RL_TB = (-(1)) + 2;
  LSM_SVG_WRITING_MODE_TB_RL = (-(1)) + 3;
  LSM_SVG_WRITING_MODE_LR = (-(1)) + 4;
  LSM_SVG_WRITING_MODE_RL = (-(1)) + 5;
  LSM_SVG_WRITING_MODE_TB = (-(1)) + 6;

function lsm_svg_writing_mode_to_string(writing_mode: TLsmSvgWritingMode): pchar; cdecl; external liblasem;
function lsm_svg_writing_mode_from_string(_string: pchar): TLsmSvgWritingMode; cdecl; external liblasem;

type
  PLsmSvgColorFilterType = ^TLsmSvgColorFilterType;
  TLsmSvgColorFilterType = longint;

const
  LSM_SVG_COLOR_FILTER_TYPE_ERROR = -(1);
  LSM_SVG_COLOR_FILTER_TYPE_MATRIX = (-(1)) + 1;
  LSM_SVG_COLOR_FILTER_TYPE_SATURATE = (-(1)) + 2;
  LSM_SVG_COLOR_FILTER_TYPE_HUE_ROTATE = (-(1)) + 3;
  LSM_SVG_COLOR_FILTER_TYPE_LUMINANCE_TO_ALPHA = (-(1)) + 4;

function lsm_svg_color_filter_type_to_string(_type: TLsmSvgColorFilterType): pchar; cdecl; external liblasem;
function lsm_svg_color_filter_type_from_string(_string: pchar): TLsmSvgColorFilterType; cdecl; external liblasem;

type
  PLsmSvgMorphologyOperator = ^TLsmSvgMorphologyOperator;
  TLsmSvgMorphologyOperator = longint;

const
  LSM_SVG_MORPHOLOGY_OPERATOR_ERROR = -(1);
  LSM_SVG_MORPHOLOGY_OPERATOR_ERODE = (-(1)) + 1;
  LSM_SVG_MORPHOLOGY_OPERATOR_DILATE = (-(1)) + 2;

function lsm_svg_morphology_operator_to_string(morpholoy_operator: TLsmSvgMorphologyOperator): pchar; cdecl; external liblasem;
function lsm_svg_morphology_operator_from_string(_string: pchar): TLsmSvgMorphologyOperator; cdecl; external liblasem;

type
  PLsmSvgEdgeMode = ^TLsmSvgEdgeMode;
  TLsmSvgEdgeMode = longint;

const
  LSM_SVG_EDGE_MODE_ERROR = -(1);
  LSM_SVG_EDGE_MODE_DUPLICATE = (-(1)) + 1;
  LSM_SVG_EDGE_MODE_WRAP = (-(1)) + 2;
  LSM_SVG_EDGE_MODE_NONE = (-(1)) + 3;

function lsm_svg_edge_mode_to_string(edge_mode: TLsmSvgEdgeMode): pchar; cdecl; external liblasem;
function lsm_svg_edge_mode_from_string(_string: pchar): TLsmSvgEdgeMode; cdecl; external liblasem;

type
  PLsmSvgStitchTiles = ^TLsmSvgStitchTiles;
  TLsmSvgStitchTiles = longint;

const
  LSM_SVG_STITCH_TILES_ERROR = -(1);
  LSM_SVG_STITCH_TILES_NO_STITCH = (-(1)) + 1;
  LSM_SVG_STITCH_TILES_STITCH = (-(1)) + 2;

function lsm_svg_stitch_tiles_to_string(stitch_tiles: TLsmSvgStitchTiles): pchar; cdecl; external liblasem;
function lsm_svg_stitch_tiles_from_string(_string: pchar): TLsmSvgStitchTiles; cdecl; external liblasem;

type
  PLsmSvgTurbulenceType = ^TLsmSvgTurbulenceType;
  TLsmSvgTurbulenceType = longint;

const
  LSM_SVG_TURBULENCE_TYPE_ERROR = -(1);
  LSM_SVG_TURBULENCE_TYPE_TURBULENCE = (-(1)) + 1;
  LSM_SVG_TURBULENCE_TYPE_FRACTAL_NOISE = (-(1)) + 2;

function lsm_svg_turbulence_type_to_string(turbulence_type: TLsmSvgTurbulenceType): pchar; cdecl; external liblasem;
function lsm_svg_turbulence_type_from_string(_string: pchar): TLsmSvgTurbulenceType; cdecl; external liblasem;

type
  PLsmSvgChannelSelector = ^TLsmSvgChannelSelector;
  TLsmSvgChannelSelector = longint;

const
  LSM_SVG_CHANNEL_SELECTOR_ERROR = -(1);
  LSM_SVG_CHANNEL_SELECTOR_RED = (-(1)) + 1;
  LSM_SVG_CHANNEL_SELECTOR_GREEN = (-(1)) + 2;
  LSM_SVG_CHANNEL_SELECTOR_BLUE = (-(1)) + 3;
  LSM_SVG_CHANNEL_SELECTOR_ALPHA = (-(1)) + 4;

function lsm_svg_channel_selector_to_string(channel_selector: TLsmSvgChannelSelector): pchar; cdecl; external liblasem;
function lsm_svg_channel_selector_from_string(_string: pchar): TLsmSvgChannelSelector; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:59:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
