{$IFDEF read_interface}

type
  PLsmMathmlGlyphFlags = ^TLsmMathmlGlyphFlags;
  TLsmMathmlGlyphFlags = longint;

const
  LSM_MATHML_GLYPH_FLAG_STRETCH_VERTICAL = 1 shl 0;
  LSM_MATHML_GLYPH_FLAG_STRETCH_HORIZONTAL = 1 shl 1;
  LSM_MATHML_GLYPH_FLAG_TYPE_SIZED = 1 shl 2;
  LSM_MATHML_GLYPH_FLAG_ALIGN_AXIS = 1 shl 3;
  LSM_MATHML_GLYPH_FLAG_HAS_LARGE_VERSION = 1 shl 4;
  LSM_MATHML_GLYPH_FLAG_INTEGRAL_SLANT = 1 shl 5;

type
  PLsmMathmlFont = ^TLsmMathmlFont;
  TLsmMathmlFont = longint;

const
  LSM_MATHML_FONT_ERROR = 0;
  LSM_MATHML_FONT_DEFAULT = 1;
  LSM_MATHML_FONT_CMR10 = 2;
  LSM_MATHML_FONT_CMMI10 = 3;
  LSM_MATHML_FONT_CMEX10 = 4;
  LSM_MATHML_FONT_CMSY10 = 5;
  LSM_MATHML_FONT_SYMBOL = 6;

type
  TLsmMathmlGlyph = record
    font: TLsmMathmlFont;
    utf8: array[0..5] of char;
  end;
  PLsmMathmlGlyph = ^TLsmMathmlGlyph;

  TLsmMathmlOperatorGlyph = record
    utf8: array[0..5] of char;
    flags: TLsmMathmlGlyphFlags;
    start_glyph: TLsmMathmlGlyph;
    middle_glyph: TLsmMathmlGlyph;
    stop_glyph: TLsmMathmlGlyph;
    glue_glyph: TLsmMathmlGlyph;
    n_sized_glyphs: dword;
    sized_glyphs: array[0..4] of TLsmMathmlGlyph;
  end;
  PLsmMathmlOperatorGlyph = ^TLsmMathmlOperatorGlyph;

type
  TLsmMathmlViewClass = record
    dom_view_class: TLsmDomViewClass;
  end;
  PLsmMathmlViewClass = ^TLsmMathmlViewClass;

function lsm_mathml_view_get_type: TGType; cdecl; external liblasem;
function lsm_mathml_view_new(document: PLsmMathmlDocument): PLsmMathmlView; cdecl; external liblasem;

function lsm_mathml_view_measure_axis_offset(view: PLsmMathmlView; math_size: double): double; cdecl; external liblasem;
procedure lsm_mathml_view_get_font_metrics(view: PLsmMathmlView; style: PLsmMathmlElementStyle; ascent: Pdouble; descent: Pdouble); cdecl; external liblasem;
procedure lsm_mathml_view_measure_text(view: PLsmMathmlView; style: PLsmMathmlElementStyle; text: pchar; bbox: PLsmMathmlBbox); cdecl; external liblasem;
procedure lsm_mathml_view_show_text(view: PLsmMathmlView; style: PLsmMathmlElementStyle; x: double; y: double; text: pchar); cdecl; external liblasem;
procedure lsm_mathml_view_measure_operator(view: PLsmMathmlView; style: PLsmMathmlElementStyle; text: pchar; large: Tgboolean; symmetric: Tgboolean;
  axis_offset: double; min_size: double; max_size: double; stretch_bbox: PLsmMathmlBbox; bbox: PLsmMathmlBbox); cdecl; external liblasem;
procedure lsm_mathml_view_show_operator(view: PLsmMathmlView; style: PLsmMathmlElementStyle; x: double; y: double; text: pchar;
  large: Tgboolean; stretch_bbox: PLsmMathmlBbox); cdecl; external liblasem;
function lsm_mathml_view_get_operator_slant(view: PLsmMathmlView; style: PLsmMathmlElementStyle; text: pchar): double; cdecl; external liblasem;
procedure lsm_mathml_view_measure_radical(view: PLsmMathmlView; style: PLsmMathmlElementStyle; stretch_bbox: PLsmMathmlBbox; bbox: PLsmMathmlBbox; x_offset: Pdouble;
  y_offset: Pdouble); cdecl; external liblasem;
procedure lsm_mathml_view_show_radical(view: PLsmMathmlView; style: PLsmMathmlElementStyle; x: double; y: double; width: double;
  stretch_bbox: PLsmMathmlBbox); cdecl; external liblasem;
procedure lsm_mathml_view_measure_notation(view: PLsmMathmlView; style: PLsmMathmlElementStyle; notation: TLsmMathmlNotation; stretch_bbox: PLsmMathmlBbox; bbox: PLsmMathmlBbox;
  x_child_offset: Pdouble); cdecl; external liblasem;
procedure lsm_mathml_view_show_notation(view: PLsmMathmlView; style: PLsmMathmlElementStyle; notation: TLsmMathmlNotation; x: double; y: double;
  bbox: PLsmMathmlBbox; x_child_offset: double); cdecl; external liblasem;
procedure lsm_mathml_view_show_background(view: PLsmMathmlView; style: PLsmMathmlElementStyle; x: double; y: double; bbox: PLsmMathmlBbox); cdecl; external liblasem;
procedure lsm_mathml_view_show_rectangle(view: PLsmMathmlView; style: PLsmMathmlElementStyle; x: double; y: double; width: double;
  height: double; line: TLsmMathmlLine; line_width: double); cdecl; external liblasem;
procedure lsm_mathml_view_show_line(view: PLsmMathmlView; style: PLsmMathmlElementStyle; x0: double; y0: double; x1: double;
  y1: double; line: TLsmMathmlLine; line_width: double); cdecl; external liblasem;
procedure lsm_mathml_view_show_fraction_line(view: PLsmMathmlView; style: PLsmMathmlElementStyle; x: double; y: double; width: double;
  thickness: double); cdecl; external liblasem;
procedure lsm_mathml_view_show_bbox(view: PLsmMathmlView; x: double; y: double; bbox: PLsmMathmlBbox); cdecl; external liblasem;
procedure lsm_mathml_view_draw_root(view: PLsmMathmlView; x: double; y: double; width: double; height: double;
  top_width: double; thickness: double; color: PLsmMathmlColor); cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:53:52 ===

function LSM_TYPE_MATHML_VIEW: TGType;
function LSM_MATHML_VIEW(obj: Pointer): PLsmMathmlView;
function LSM_MATHML_VIEW_CLASS(klass: Pointer): PLsmMathmlViewClass;
function LSM_IS_MATHML_VIEW(obj: Pointer): Tgboolean;
function LSM_IS_MATHML_VIEW_CLASS(klass: Pointer): Tgboolean;
function LSM_MATHML_VIEW_GET_CLASS(obj: Pointer): PLsmMathmlViewClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_MATHML_VIEW: TGType;
begin
  LSM_TYPE_MATHML_VIEW := lsm_mathml_view_get_type;
end;

function LSM_MATHML_VIEW(obj: Pointer): PLsmMathmlView;
begin
  Result := PLsmMathmlView(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_VIEW));
end;

function LSM_MATHML_VIEW_CLASS(klass: Pointer): PLsmMathmlViewClass;
begin
  Result := PLsmMathmlViewClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_VIEW));
end;

function LSM_IS_MATHML_VIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_MATHML_VIEW);
end;

function LSM_IS_MATHML_VIEW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_MATHML_VIEW);
end;

function LSM_MATHML_VIEW_GET_CLASS(obj: Pointer): PLsmMathmlViewClass;
begin
  Result := PLsmMathmlViewClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
