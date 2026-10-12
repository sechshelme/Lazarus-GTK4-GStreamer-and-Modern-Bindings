unit fp_thorvg_capi;

interface

const
  {$IFDEF Linux}
  libthorvg = 'thorvg-1';
  {$ENDIF}

  {$IFDEF Windows}
  libthorvg = 'libthorvg-1.dll';
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

  PPsingle = ^Psingle;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  TVG_VERSION_MAJOR = 1;
  TVG_VERSION_MINOR = 0;
  TVG_VERSION_MICRO = 2;

type
  TTvg_Canvas = type Pointer;
  TTvg_Paint = type Pointer;
  TTvg_Gradient = type Pointer;
  PTvg_Gradient = ^TTvg_Gradient;
  TTvg_Saver = type Pointer;
  TTvg_Animation = type Pointer;
  TTvg_Accessor = type Pointer;

type
  PTvg_Result = ^TTvg_Result;
  TTvg_Result = longint;

const
  TVG_RESULT_SUCCESS = 0;
  TVG_RESULT_INVALID_ARGUMENT = 1;
  TVG_RESULT_INSUFFICIENT_CONDITION = 2;
  TVG_RESULT_FAILED_ALLOCATION = 3;
  TVG_RESULT_MEMORY_CORRUPTION = 4;
  TVG_RESULT_NOT_SUPPORTED = 5;
  TVG_RESULT_UNKNOWN = 255;

type
  TTvg_Point = record
    x: single;
    y: single;
  end;
  PTvg_Point = ^TTvg_Point;
  PPTvg_Point = ^PTvg_Point;

  TTvg_Matrix = record
    e11: single;
    e12: single;
    e13: single;
    e21: single;
    e22: single;
    e23: single;
    e31: single;
    e32: single;
    e33: single;
  end;
  PTvg_Matrix = ^TTvg_Matrix;

type
  PTvg_Colorspace = ^TTvg_Colorspace;
  TTvg_Colorspace = longint;

const
  TVG_COLORSPACE_ABGR8888 = 0;
  TVG_COLORSPACE_ARGB8888 = 1;
  TVG_COLORSPACE_ABGR8888S = 2;
  TVG_COLORSPACE_ARGB8888S = 3;
  TVG_COLORSPACE_UNKNOWN = 255;

type
  PTvg_Engine_Option = ^TTvg_Engine_Option;
  TTvg_Engine_Option = longint;

const
  TVG_ENGINE_OPTION_NONE = 0;
  TVG_ENGINE_OPTION_DEFAULT = 1 shl 0;
  TVG_ENGINE_OPTION_SMART_RENDER = 1 shl 1;

type
  PTvg_Mask_Method = ^TTvg_Mask_Method;
  TTvg_Mask_Method = longint;

const
  TVG_MASK_METHOD_NONE = 0;
  TVG_MASK_METHOD_ALPHA = 1;
  TVG_MASK_METHOD_INVERSE_ALPHA = 2;
  TVG_MASK_METHOD_LUMA = 3;
  TVG_MASK_METHOD_INVERSE_LUMA = 4;
  TVG_MASK_METHOD_ADD = 5;
  TVG_MASK_METHOD_SUBTRACT = 6;
  TVG_MASK_METHOD_INTERSECT = 7;
  TVG_MASK_METHOD_DIFFERENCE = 8;
  TVG_MASK_METHOD_LIGHTEN = 9;
  TVG_MASK_METHOD_DARKEN = 10;

type
  PTvg_Blend_Method = ^TTvg_Blend_Method;
  TTvg_Blend_Method = longint;

const
  TVG_BLEND_METHOD_NORMAL = 0;
  TVG_BLEND_METHOD_MULTIPLY = 1;
  TVG_BLEND_METHOD_SCREEN = 2;
  TVG_BLEND_METHOD_OVERLAY = 3;
  TVG_BLEND_METHOD_DARKEN = 4;
  TVG_BLEND_METHOD_LIGHTEN = 5;
  TVG_BLEND_METHOD_COLORDODGE = 6;
  TVG_BLEND_METHOD_COLORBURN = 7;
  TVG_BLEND_METHOD_HARDLIGHT = 8;
  TVG_BLEND_METHOD_SOFTLIGHT = 9;
  TVG_BLEND_METHOD_DIFFERENCE = 10;
  TVG_BLEND_METHOD_EXCLUSION = 11;
  TVG_BLEND_METHOD_HUE = 12;
  TVG_BLEND_METHOD_SATURATION = 13;
  TVG_BLEND_METHOD_COLOR = 14;
  TVG_BLEND_METHOD_LUMINOSITY = 15;
  TVG_BLEND_METHOD_ADD = 16;
  TVG_BLEND_METHOD_COMPOSITION = 255;

type
  PTvg_Type = ^TTvg_Type;
  TTvg_Type = longint;

const
  TVG_TYPE_UNDEF = 0;
  TVG_TYPE_SHAPE = 1;
  TVG_TYPE_SCENE = 2;
  TVG_TYPE_PICTURE = 3;
  TVG_TYPE_TEXT = 4;
  TVG_TYPE_LINEAR_GRAD = 10;
  TVG_TYPE_RADIAL_GRAD = 11;

type
  PPTvg_Path_Command = ^PTvg_Path_Command;
  PTvg_Path_Command = ^TTvg_Path_Command;
  TTvg_Path_Command = Tuint8_t;

const
  TVG_PATH_COMMAND_CLOSE = 0;
  TVG_PATH_COMMAND_MOVE_TO = 1;
  TVG_PATH_COMMAND_LINE_TO = 2;
  TVG_PATH_COMMAND_CUBIC_TO = 3;

type
  PTvg_Stroke_Cap = ^TTvg_Stroke_Cap;
  TTvg_Stroke_Cap = longint;

const
  TVG_STROKE_CAP_BUTT = 0;
  TVG_STROKE_CAP_ROUND = 1;
  TVG_STROKE_CAP_SQUARE = 2;

type
  PTvg_Stroke_Join = ^TTvg_Stroke_Join;
  TTvg_Stroke_Join = longint;

const
  TVG_STROKE_JOIN_MITER = 0;
  TVG_STROKE_JOIN_ROUND = 1;
  TVG_STROKE_JOIN_BEVEL = 2;

type
  PTvg_Stroke_Fill = ^TTvg_Stroke_Fill;
  TTvg_Stroke_Fill = longint;

const
  TVG_STROKE_FILL_PAD = 0;
  TVG_STROKE_FILL_REFLECT = 1;
  TVG_STROKE_FILL_REPEAT = 2;

type
  PTvg_Fill_Rule = ^TTvg_Fill_Rule;
  TTvg_Fill_Rule = longint;

const
  TVG_FILL_RULE_NON_ZERO = 0;
  TVG_FILL_RULE_EVEN_ODD = 1;

type
  TTvg_Color_Stop = record
    offset: single;
    r: Tuint8_t;
    g: Tuint8_t;
    b: Tuint8_t;
    a: Tuint8_t;
  end;
  PTvg_Color_Stop = ^TTvg_Color_Stop;
  PPTvg_Color_Stop = ^PTvg_Color_Stop;

type
  PTvg_Text_Wrap = ^TTvg_Text_Wrap;
  TTvg_Text_Wrap = longint;

const
  TVG_TEXT_WRAP_NONE = 0;
  TVG_TEXT_WRAP_CHARACTER = 1;
  TVG_TEXT_WRAP_WORD = 2;
  TVG_TEXT_WRAP_SMART = 3;
  TVG_TEXT_WRAP_ELLIPSIS = 4;
  TVG_TEXT_WRAP_HYPHENATION = 5;

type
  PTvg_Filter_Method = ^TTvg_Filter_Method;
  TTvg_Filter_Method = longint;

const
  TVG_FILTER_METHOD_BILINEAR = 0;
  TVG_FILTER_METHOD_NEAREST = 1;

type
  TTvg_Text_Metrics = record
    ascent: single;
    descent: single;
    linegap: single;
    advance: single;
  end;
  PTvg_Text_Metrics = ^TTvg_Text_Metrics;

  TTvg_Glyph_Metrics = record
    advance: single;
    bearing: single;
    min: TTvg_Point;
    max: TTvg_Point;
  end;
  PTvg_Glyph_Metrics = ^TTvg_Glyph_Metrics;

  TTvg_Picture_Asset_Resolver = function(paint: TTvg_Paint; src: pchar; data: pointer): boolean; cdecl;

function tvg_engine_init(threads: dword): TTvg_Result; cdecl; external libthorvg;
function tvg_engine_term: TTvg_Result; cdecl; external libthorvg;
function tvg_engine_version(major: Puint32_t; minor: Puint32_t; micro: Puint32_t; version: PPchar): TTvg_Result; cdecl; external libthorvg;

function tvg_swcanvas_create(op: TTvg_Engine_Option): TTvg_Canvas; cdecl; external libthorvg;
function tvg_swcanvas_set_target(canvas: TTvg_Canvas; buffer: Puint32_t; stride: Tuint32_t; w: Tuint32_t; h: Tuint32_t; cs: TTvg_Colorspace): TTvg_Result; cdecl; external libthorvg;

function tvg_glcanvas_create(op: TTvg_Engine_Option): TTvg_Canvas; cdecl; external libthorvg;
function tvg_glcanvas_set_target(canvas: TTvg_Canvas; display: pointer; surface: pointer; context: pointer; id: Tint32_t; w: Tuint32_t; h: Tuint32_t; cs: TTvg_Colorspace): TTvg_Result; cdecl; external libthorvg;

function tvg_wgcanvas_create(op: TTvg_Engine_Option): TTvg_Canvas; cdecl; external libthorvg;
function tvg_wgcanvas_set_target(canvas: TTvg_Canvas; device: pointer; instance: pointer; target: pointer; w: Tuint32_t; h: Tuint32_t; cs: TTvg_Colorspace; _type: longint): TTvg_Result; cdecl; external libthorvg;

function tvg_canvas_destroy(canvas: TTvg_Canvas): TTvg_Result; cdecl; external libthorvg;
function tvg_canvas_add(canvas: TTvg_Canvas; paint: TTvg_Paint): TTvg_Result; cdecl; external libthorvg;
function tvg_canvas_insert(canvas: TTvg_Canvas; target: TTvg_Paint; at: TTvg_Paint): TTvg_Result; cdecl; external libthorvg;
function tvg_canvas_remove(canvas: TTvg_Canvas; paint: TTvg_Paint): TTvg_Result; cdecl; external libthorvg;
function tvg_canvas_update(canvas: TTvg_Canvas): TTvg_Result; cdecl; external libthorvg;
function tvg_canvas_draw(canvas: TTvg_Canvas; clear: boolean): TTvg_Result; cdecl; external libthorvg;
function tvg_canvas_sync(canvas: TTvg_Canvas): TTvg_Result; cdecl; external libthorvg;
function tvg_canvas_set_viewport(canvas: TTvg_Canvas; x: Tint32_t; y: Tint32_t; w: Tint32_t; h: Tint32_t): TTvg_Result; cdecl; external libthorvg;

function tvg_paint_rel(paint: TTvg_Paint): TTvg_Result; cdecl; external libthorvg;
function tvg_paint_ref(paint: TTvg_Paint): Tuint16_t; cdecl; external libthorvg;
function tvg_paint_unref(paint: TTvg_Paint; free: boolean): Tuint16_t; cdecl; external libthorvg;
function tvg_paint_get_ref(paint: TTvg_Paint): Tuint16_t; cdecl; external libthorvg;
function tvg_paint_set_visible(paint: TTvg_Paint; visible: boolean): TTvg_Result; cdecl; external libthorvg;
function tvg_paint_get_visible(paint: TTvg_Paint): boolean; cdecl; external libthorvg;
function tvg_paint_get_id(paint: TTvg_Paint): Tuint32_t; cdecl; external libthorvg;
function tvg_paint_set_id(paint: TTvg_Paint; id: Tuint32_t): TTvg_Result; cdecl; external libthorvg;
function tvg_paint_scale(paint: TTvg_Paint; factor: single): TTvg_Result; cdecl; external libthorvg;
function tvg_paint_rotate(paint: TTvg_Paint; degree: single): TTvg_Result; cdecl; external libthorvg;
function tvg_paint_translate(paint: TTvg_Paint; x: single; y: single): TTvg_Result; cdecl; external libthorvg;
function tvg_paint_set_transform(paint: TTvg_Paint; m: PTvg_Matrix): TTvg_Result; cdecl; external libthorvg;
function tvg_paint_get_transform(paint: TTvg_Paint; m: PTvg_Matrix): TTvg_Result; cdecl; external libthorvg;
function tvg_paint_set_opacity(paint: TTvg_Paint; opacity: Tuint8_t): TTvg_Result; cdecl; external libthorvg;
function tvg_paint_get_opacity(paint: TTvg_Paint; opacity: Puint8_t): TTvg_Result; cdecl; external libthorvg;
function tvg_paint_duplicate(paint: TTvg_Paint): TTvg_Paint; cdecl; external libthorvg;
function tvg_paint_intersects(paint: TTvg_Paint; x: Tint32_t; y: Tint32_t; w: Tint32_t; h: Tint32_t): boolean; cdecl; external libthorvg;
function tvg_paint_get_aabb(paint: TTvg_Paint; x: Psingle; y: Psingle; w: Psingle; h: Psingle): TTvg_Result; cdecl; external libthorvg;
function tvg_paint_get_obb(paint: TTvg_Paint; pt4: PTvg_Point): TTvg_Result; cdecl; external libthorvg;
function tvg_paint_set_mask_method(paint: TTvg_Paint; target: TTvg_Paint; method: TTvg_Mask_Method): TTvg_Result; cdecl; external libthorvg;
function tvg_paint_get_mask_method(paint: TTvg_Paint; target: TTvg_Paint; method: PTvg_Mask_Method): TTvg_Result; cdecl; external libthorvg;
function tvg_paint_set_clip(paint: TTvg_Paint; clipper: TTvg_Paint): TTvg_Result; cdecl; external libthorvg;
function tvg_paint_get_clip(paint: TTvg_Paint): TTvg_Paint; cdecl; external libthorvg;
function tvg_paint_get_parent(paint: TTvg_Paint): TTvg_Paint; cdecl; external libthorvg;
function tvg_paint_get_type(paint: TTvg_Paint; _type: PTvg_Type): TTvg_Result; cdecl; external libthorvg;
function tvg_paint_set_blend_method(paint: TTvg_Paint; method: TTvg_Blend_Method): TTvg_Result; cdecl; external libthorvg;

function tvg_shape_new: TTvg_Paint; cdecl; external libthorvg;
function tvg_shape_reset(paint: TTvg_Paint): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_move_to(paint: TTvg_Paint; x: single; y: single): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_line_to(paint: TTvg_Paint; x: single; y: single): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_cubic_to(paint: TTvg_Paint; cx1: single; cy1: single; cx2: single; cy2: single; x: single; y: single): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_close(paint: TTvg_Paint): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_append_rect(paint: TTvg_Paint; x: single; y: single; w: single; h: single; rx: single; ry: single; cw: boolean): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_append_circle(paint: TTvg_Paint; cx: single; cy: single; rx: single; ry: single; cw: boolean): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_append_path(paint: TTvg_Paint; cmds: PTvg_Path_Command; cmdCnt: Tuint32_t; pts: PTvg_Point; ptsCnt: Tuint32_t): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_get_path(paint: TTvg_Paint; cmds: PPTvg_Path_Command; cmdsCnt: Puint32_t; pts: PPTvg_Point; ptsCnt: Puint32_t): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_set_stroke_width(paint: TTvg_Paint; width: single): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_get_stroke_width(paint: TTvg_Paint; width: Psingle): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_set_stroke_color(paint: TTvg_Paint; r: Tuint8_t; g: Tuint8_t; b: Tuint8_t; a: Tuint8_t): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_get_stroke_color(paint: TTvg_Paint; r: Puint8_t; g: Puint8_t; b: Puint8_t; a: Puint8_t): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_set_stroke_gradient(paint: TTvg_Paint; grad: TTvg_Gradient): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_get_stroke_gradient(paint: TTvg_Paint; grad: PTvg_Gradient): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_set_stroke_dash(paint: TTvg_Paint; dashPattern: Psingle; cnt: Tuint32_t; offset: single): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_get_stroke_dash(paint: TTvg_Paint; dashPattern: PPsingle; cnt: Puint32_t; offset: Psingle): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_set_stroke_cap(paint: TTvg_Paint; cap: TTvg_Stroke_Cap): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_get_stroke_cap(paint: TTvg_Paint; cap: PTvg_Stroke_Cap): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_set_stroke_join(paint: TTvg_Paint; join: TTvg_Stroke_Join): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_get_stroke_join(paint: TTvg_Paint; join: PTvg_Stroke_Join): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_set_stroke_miterlimit(paint: TTvg_Paint; miterlimit: single): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_get_stroke_miterlimit(paint: TTvg_Paint; miterlimit: Psingle): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_set_trimpath(paint: TTvg_Paint; begin_: single; end_: single; simultaneous: boolean): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_set_fill_color(paint: TTvg_Paint; r: Tuint8_t; g: Tuint8_t; b: Tuint8_t; a: Tuint8_t): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_get_fill_color(paint: TTvg_Paint; r: Puint8_t; g: Puint8_t; b: Puint8_t; a: Puint8_t): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_set_fill_rule(paint: TTvg_Paint; rule: TTvg_Fill_Rule): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_get_fill_rule(paint: TTvg_Paint; rule: PTvg_Fill_Rule): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_set_paint_order(paint: TTvg_Paint; strokeFirst: boolean): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_set_gradient(paint: TTvg_Paint; grad: TTvg_Gradient): TTvg_Result; cdecl; external libthorvg;
function tvg_shape_get_gradient(paint: TTvg_Paint; grad: PTvg_Gradient): TTvg_Result; cdecl; external libthorvg;

function tvg_linear_gradient_new: TTvg_Gradient; cdecl; external libthorvg;
function tvg_radial_gradient_new: TTvg_Gradient; cdecl; external libthorvg;
function tvg_linear_gradient_set(grad: TTvg_Gradient; x1: single; y1: single; x2: single; y2: single): TTvg_Result; cdecl; external libthorvg;
function tvg_linear_gradient_get(grad: TTvg_Gradient; x1: Psingle; y1: Psingle; x2: Psingle; y2: Psingle): TTvg_Result; cdecl; external libthorvg;
function tvg_radial_gradient_set(grad: TTvg_Gradient; cx: single; cy: single; r: single; fx: single; fy: single; fr: single): TTvg_Result; cdecl; external libthorvg;
function tvg_radial_gradient_get(grad: TTvg_Gradient; cx: Psingle; cy: Psingle; r: Psingle; fx: Psingle; fy: Psingle; fr: Psingle): TTvg_Result; cdecl; external libthorvg;
function tvg_gradient_set_color_stops(grad: TTvg_Gradient; color_stop: PTvg_Color_Stop; cnt: Tuint32_t): TTvg_Result; cdecl; external libthorvg;
function tvg_gradient_get_color_stops(grad: TTvg_Gradient; color_stop: PPTvg_Color_Stop; cnt: Puint32_t): TTvg_Result; cdecl; external libthorvg;
function tvg_gradient_set_spread(grad: TTvg_Gradient; spread: TTvg_Stroke_Fill): TTvg_Result; cdecl; external libthorvg;
function tvg_gradient_get_spread(grad: TTvg_Gradient; spread: PTvg_Stroke_Fill): TTvg_Result; cdecl; external libthorvg;
function tvg_gradient_set_transform(grad: TTvg_Gradient; m: PTvg_Matrix): TTvg_Result; cdecl; external libthorvg;
function tvg_gradient_get_transform(grad: TTvg_Gradient; m: PTvg_Matrix): TTvg_Result; cdecl; external libthorvg;
function tvg_gradient_get_type(grad: TTvg_Gradient; _type: PTvg_Type): TTvg_Result; cdecl; external libthorvg;
function tvg_gradient_duplicate(grad: TTvg_Gradient): TTvg_Gradient; cdecl; external libthorvg;
function tvg_gradient_del(grad: TTvg_Gradient): TTvg_Result; cdecl; external libthorvg;

function tvg_picture_new: TTvg_Paint; cdecl; external libthorvg;
function tvg_picture_load(picture: TTvg_Paint; path: pchar): TTvg_Result; cdecl; external libthorvg;
function tvg_picture_load_raw(picture: TTvg_Paint; data: Puint32_t; w: Tuint32_t; h: Tuint32_t; cs: TTvg_Colorspace; copy: boolean): TTvg_Result; cdecl; external libthorvg;
function tvg_picture_load_data(picture: TTvg_Paint; data: pchar; size: Tuint32_t; mimetype: pchar; rpath: pchar; copy: boolean): TTvg_Result; cdecl; external libthorvg;
function tvg_picture_set_asset_resolver(picture: TTvg_Paint; resolver: TTvg_Picture_Asset_Resolver; data: pointer): TTvg_Result; cdecl; external libthorvg;
function tvg_picture_set_size(picture: TTvg_Paint; w: single; h: single): TTvg_Result; cdecl; external libthorvg;
function tvg_picture_get_size(picture: TTvg_Paint; w: Psingle; h: Psingle): TTvg_Result; cdecl; external libthorvg;
function tvg_picture_set_origin(picture: TTvg_Paint; x: single; y: single): TTvg_Result; cdecl; external libthorvg;
function tvg_picture_get_origin(picture: TTvg_Paint; x: Psingle; y: Psingle): TTvg_Result; cdecl; external libthorvg;
function tvg_picture_get_paint(picture: TTvg_Paint; id: Tuint32_t): TTvg_Paint; cdecl; external libthorvg;
function tvg_picture_set_filter(picture: TTvg_Paint; method: TTvg_Filter_Method): TTvg_Result; cdecl; external libthorvg;

function tvg_scene_new: TTvg_Paint; cdecl; external libthorvg;
function tvg_scene_add(scene: TTvg_Paint; paint: TTvg_Paint): TTvg_Result; cdecl; external libthorvg;
function tvg_scene_insert(scene: TTvg_Paint; target: TTvg_Paint; at: TTvg_Paint): TTvg_Result; cdecl; external libthorvg;
function tvg_scene_remove(scene: TTvg_Paint; paint: TTvg_Paint): TTvg_Result; cdecl; external libthorvg;
function tvg_scene_clear_effects(scene: TTvg_Paint): TTvg_Result; cdecl; external libthorvg;
function tvg_scene_add_effect_gaussian_blur(scene: TTvg_Paint; sigma: double; direction: longint; border: longint; quality: longint): TTvg_Result; cdecl; external libthorvg;
function tvg_scene_add_effect_drop_shadow(scene: TTvg_Paint; r: longint; g: longint; b: longint; a: longint; angle: double; distance: double; sigma: double; quality: longint): TTvg_Result; cdecl; external libthorvg;
function tvg_scene_add_effect_fill(scene: TTvg_Paint; r: longint; g: longint; b: longint; a: longint): TTvg_Result; cdecl; external libthorvg;
function tvg_scene_add_effect_tint(scene: TTvg_Paint; black_r: longint; black_g: longint; black_b: longint; white_r: longint; white_g: longint; white_b: longint; intensity: double): TTvg_Result; cdecl; external libthorvg;
function tvg_scene_add_effect_tritone(scene: TTvg_Paint; shadow_r: longint; shadow_g: longint; shadow_b: longint; midtone_r: longint; midtone_g: longint; midtone_b: longint; highlight_r: longint; highlight_g: longint; highlight_b: longint; blend: longint): TTvg_Result; cdecl; external libthorvg;

function tvg_text_new: TTvg_Paint; cdecl; external libthorvg;
function tvg_text_set_font(text: TTvg_Paint; name: pchar): TTvg_Result; cdecl; external libthorvg;
function tvg_text_set_size(text: TTvg_Paint; size: single): TTvg_Result; cdecl; external libthorvg;
function tvg_text_set_text(text: TTvg_Paint; utf8: pchar): TTvg_Result; cdecl; external libthorvg;
function tvg_text_get_text(text: TTvg_Paint): pchar; cdecl; external libthorvg;
function tvg_text_align(text: TTvg_Paint; x: single; y: single): TTvg_Result; cdecl; external libthorvg;
function tvg_text_layout(text: TTvg_Paint; w: single; h: single): TTvg_Result; cdecl; external libthorvg;
function tvg_text_wrap_mode(text: TTvg_Paint; mode: TTvg_Text_Wrap): TTvg_Result; cdecl; external libthorvg;
function tvg_text_line_count(text: TTvg_Paint): Tuint32_t; cdecl; external libthorvg;
function tvg_text_spacing(text: TTvg_Paint; letter: single; line: single): TTvg_Result; cdecl; external libthorvg;
function tvg_text_set_italic(text: TTvg_Paint; shear: single): TTvg_Result; cdecl; external libthorvg;
function tvg_text_set_outline(text: TTvg_Paint; width: single; r: Tuint8_t; g: Tuint8_t; b: Tuint8_t): TTvg_Result; cdecl; external libthorvg;
function tvg_text_set_color(text: TTvg_Paint; r: Tuint8_t; g: Tuint8_t; b: Tuint8_t): TTvg_Result; cdecl; external libthorvg;
function tvg_text_set_gradient(text: TTvg_Paint; gradient: TTvg_Gradient): TTvg_Result; cdecl; external libthorvg;
function tvg_text_get_text_metrics(text: TTvg_Paint; metrics: PTvg_Text_Metrics): TTvg_Result; cdecl; external libthorvg;
function tvg_text_get_glyph_metrics(text: TTvg_Paint; ch: pchar; metrics: PTvg_Glyph_Metrics): TTvg_Result; cdecl; external libthorvg;
function tvg_font_load(path: pchar): TTvg_Result; cdecl; external libthorvg;
function tvg_font_load_data(name: pchar; data: pchar; size: Tuint32_t; mimetype: pchar; copy: boolean): TTvg_Result; cdecl; external libthorvg;
function tvg_font_unload(path: pchar): TTvg_Result; cdecl; external libthorvg;

function tvg_saver_new: TTvg_Saver; cdecl; external libthorvg;
function tvg_saver_save_paint(saver: TTvg_Saver; paint: TTvg_Paint; path: pchar; quality: Tuint32_t): TTvg_Result; cdecl; external libthorvg;
function tvg_saver_save_animation(saver: TTvg_Saver; animation: TTvg_Animation; path: pchar; quality: Tuint32_t; fps: Tuint32_t): TTvg_Result; cdecl; external libthorvg;
function tvg_saver_sync(saver: TTvg_Saver): TTvg_Result; cdecl; external libthorvg;
function tvg_saver_del(saver: TTvg_Saver): TTvg_Result; cdecl; external libthorvg;

function tvg_animation_new: TTvg_Animation; cdecl; external libthorvg;
function tvg_animation_set_frame(animation: TTvg_Animation; no: single): TTvg_Result; cdecl; external libthorvg;
function tvg_animation_get_picture(animation: TTvg_Animation): TTvg_Paint; cdecl; external libthorvg;
function tvg_animation_get_frame(animation: TTvg_Animation; no: Psingle): TTvg_Result; cdecl; external libthorvg;
function tvg_animation_get_total_frame(animation: TTvg_Animation; cnt: Psingle): TTvg_Result; cdecl; external libthorvg;
function tvg_animation_get_duration(animation: TTvg_Animation; duration: Psingle): TTvg_Result; cdecl; external libthorvg;
function tvg_animation_set_segment(animation: TTvg_Animation; begin_: single; end_: single): TTvg_Result; cdecl; external libthorvg;
function tvg_animation_get_segment(animation: TTvg_Animation; begin_: Psingle; end_: Psingle): TTvg_Result; cdecl; external libthorvg;
function tvg_animation_del(animation: TTvg_Animation): TTvg_Result; cdecl; external libthorvg;

function tvg_accessor_new: TTvg_Accessor; cdecl; external libthorvg;
function tvg_accessor_del(accessor: TTvg_Accessor): TTvg_Result; cdecl; external libthorvg;

type
  Taccesoor_func = function(paint: TTvg_Paint; data: pointer): boolean; cdecl;

function tvg_accessor_set(accessor: TTvg_Accessor; paint: TTvg_Paint; func: Taccesoor_func; data: pointer): TTvg_Result; cdecl; external libthorvg;
function tvg_accessor_generate_id(name: pchar): Tuint32_t; cdecl; external libthorvg;

function tvg_lottie_animation_new: TTvg_Animation; cdecl; external libthorvg;
function tvg_lottie_animation_gen_slot(animation: TTvg_Animation; slot: pchar): Tuint32_t; cdecl; external libthorvg;
function tvg_lottie_animation_apply_slot(animation: TTvg_Animation; id: Tuint32_t): TTvg_Result; cdecl; external libthorvg;
function tvg_lottie_animation_del_slot(animation: TTvg_Animation; id: Tuint32_t): TTvg_Result; cdecl; external libthorvg;
function tvg_lottie_animation_set_marker(animation: TTvg_Animation; marker: pchar): TTvg_Result; cdecl; external libthorvg;
function tvg_lottie_animation_get_markers_cnt(animation: TTvg_Animation; cnt: Puint32_t): TTvg_Result; cdecl; external libthorvg;
function tvg_lottie_animation_get_marker(animation: TTvg_Animation; idx: Tuint32_t; name: PPchar): TTvg_Result; cdecl; external libthorvg;
function tvg_lottie_animation_get_marker_info(animation: TTvg_Animation; idx: Tuint32_t; name: PPchar; begin_: Psingle; end_: Psingle): TTvg_Result; cdecl; external libthorvg;
function tvg_lottie_animation_tween(animation: TTvg_Animation; from: single; to_: single; progress: single): TTvg_Result; cdecl; external libthorvg;
function tvg_lottie_animation_assign(animation: TTvg_Animation; layer: pchar; ix: Tuint32_t; var_: pchar; val: single): TTvg_Result; cdecl; external libthorvg;
function tvg_lottie_animation_set_quality(animation: TTvg_Animation; value: Tuint8_t): TTvg_Result; cdecl; external libthorvg;

// === Konventiert am: 15-3-26 17:01:32 ===


implementation



end.
