{$IFDEF read_interface}


type
  PLsmMathmlCssType = ^TLsmMathmlCssType;
  TLsmMathmlCssType = longint;

const
  LSM_MATHML_CSS_TYPE_USER = 0;
  LSM_MATHML_CSS_TYPE_AUTHOR = 1;
  LSM_MATHML_CSS_TYPE_AUTHOR_IMPORTANT = 2;
  LSM_MATHML_CSS_TYPE_USER_IMPORTANT = 3;

type
  PLsmMathmlMode = ^TLsmMathmlMode;
  TLsmMathmlMode = longint;

const
  LSM_MATHML_MODE_ERROR = -(1);
  LSM_MATHML_MODE_DISPLAY = (-(1)) + 1;
  LSM_MATHML_MODE_INLINE = (-(1)) + 2;

function lsm_mathml_mode_to_string(mode: TLsmMathmlMode): pchar; cdecl; external liblasem;
function lsm_mathml_mode_from_string(_string: pchar): TLsmMathmlMode; cdecl; external liblasem;

type
  PLsmMathmlDisplay = ^TLsmMathmlDisplay;
  TLsmMathmlDisplay = longint;

const
  LSM_MATHML_DISPLAY_ERROR = -(1);
  LSM_MATHML_DISPLAY_BLOCK = (-(1)) + 1;
  LSM_MATHML_DISPLAY_INLINE = (-(1)) + 2;

function lsm_mathml_display_to_string(display: TLsmMathmlDisplay): pchar; cdecl; external liblasem;
function lsm_mathml_display_from_string(_string: pchar): TLsmMathmlDisplay; cdecl; external liblasem;

type
  PLsmMathmlSpaceName = ^TLsmMathmlSpaceName;
  TLsmMathmlSpaceName = longint;

const
  LSM_MATHML_SPACE_NAME_ERROR = -(1);
  LSM_MATHML_SPACE_NAME_NEGATIVE_VERY_VERY_THIN = (-(1)) + 1;
  LSM_MATHML_SPACE_NAME_NEGATIVE_VERY_THIN = (-(1)) + 2;
  LSM_MATHML_SPACE_NAME_NEGATIVE_THIN = (-(1)) + 3;
  LSM_MATHML_SPACE_NAME_NEGATIVE_MEDIUM = (-(1)) + 4;
  LSM_MATHML_SPACE_NAME_NEGATIVE_THICK = (-(1)) + 5;
  LSM_MATHML_SPACE_NAME_NEGATIVE_VERY_THICK = (-(1)) + 6;
  LSM_MATHML_SPACE_NAME_NEGATIVE_VERY_VERY_THICK = (-(1)) + 7;
  LSM_MATHML_SPACE_NAME_VERY_VERY_THIN = (-(1)) + 8;
  LSM_MATHML_SPACE_NAME_VERY_THIN = (-(1)) + 9;
  LSM_MATHML_SPACE_NAME_THIN = (-(1)) + 10;
  LSM_MATHML_SPACE_NAME_MEDIUM = (-(1)) + 11;
  LSM_MATHML_SPACE_NAME_THICK = (-(1)) + 12;
  LSM_MATHML_SPACE_NAME_VERY_THICK = (-(1)) + 13;
  LSM_MATHML_SPACE_NAME_VERY_VERY_THICK = (-(1)) + 14;
  LSM_MATHML_SPACE_NAME_INFINITY = (-(1)) + 15;

function lsm_mathml_space_name_to_string(name: TLsmMathmlSpaceName): pchar; cdecl; external liblasem;
function lsm_mathml_space_name_from_string(_string: pchar): TLsmMathmlSpaceName; cdecl; external liblasem;

type
  PLsmMathmlUnit = ^TLsmMathmlUnit;
  TLsmMathmlUnit = longint;

const
  LSM_MATHML_UNIT_ERROR = -(1);
  LSM_MATHML_UNIT_NONE = (-(1)) + 1;
  LSM_MATHML_UNIT_EM = (-(1)) + 2;
  LSM_MATHML_UNIT_EX = (-(1)) + 3;
  LSM_MATHML_UNIT_IN = (-(1)) + 4;
  LSM_MATHML_UNIT_CM = (-(1)) + 5;
  LSM_MATHML_UNIT_MM = (-(1)) + 6;
  LSM_MATHML_UNIT_PT = (-(1)) + 7;
  LSM_MATHML_UNIT_PX = (-(1)) + 8;
  LSM_MATHML_UNIT_PC = (-(1)) + 9;
  LSM_MATHML_UNIT_PERCENT = (-(1)) + 10;

function lsm_mathml_unit_to_string(unit_: TLsmMathmlUnit): pchar; cdecl; external liblasem;
function lsm_mathml_unit_from_string(_string: pchar): TLsmMathmlUnit; cdecl; external liblasem;

type
  PLsmMathmlFontStyle = ^TLsmMathmlFontStyle;
  TLsmMathmlFontStyle = longint;

const
  LSM_MATHML_FONT_STYLE_ERROR = -(1);
  LSM_MATHML_FONT_STYLE_NORMAL = (-(1)) + 1;
  LSM_MATHML_FONT_STYLE_ITALIC = (-(1)) + 2;

function lsm_mathml_font_style_to_string(font_style: TLsmMathmlFontStyle): pchar; cdecl; external liblasem;
function lsm_mathml_font_style_from_string(_string: pchar): TLsmMathmlFontStyle; cdecl; external liblasem;

type
  PLsmMathmlFontWeight = ^TLsmMathmlFontWeight;
  TLsmMathmlFontWeight = longint;

const
  LSM_MATHML_FONT_WEIGHT_ERROR = -(1);
  LSM_MATHML_FONT_WEIGHT_NORMAL = (-(1)) + 1;
  LSM_MATHML_FONT_WEIGHT_BOLD = (-(1)) + 2;

function lsm_mathml_font_weight_to_string(font_weight: TLsmMathmlFontWeight): pchar; cdecl; external liblasem;
function lsm_mathml_font_weight_from_string(_string: pchar): TLsmMathmlFontWeight; cdecl; external liblasem;

type
  PLsmMathmlVariant = ^TLsmMathmlVariant;
  TLsmMathmlVariant = longint;

const
  LSM_MATHML_VARIANT_ERROR = -(1);
  LSM_MATHML_VARIANT_NORMAL = (-(1)) + 1;
  LSM_MATHML_VARIANT_BOLD = (-(1)) + 2;
  LSM_MATHML_VARIANT_ITALIC = (-(1)) + 3;
  LSM_MATHML_VARIANT_BOLD_ITALIC = (-(1)) + 4;
  LSM_MATHML_VARIANT_DOUBLE_STRUCK = (-(1)) + 5;
  LSM_MATHML_VARIANT_FRAKTUR_BOLD = (-(1)) + 6;
  LSM_MATHML_VARIANT_SCRIPT = (-(1)) + 7;
  LSM_MATHML_VARIANT_SCRIPT_BOLD = (-(1)) + 8;
  LSM_MATHML_VARIANT_FRAKTUR = (-(1)) + 9;
  LSM_MATHML_VARIANT_SANS_SERIF = (-(1)) + 10;
  LSM_MATHML_VARIANT_SANS_SERIF_BOLD = (-(1)) + 11;
  LSM_MATHML_VARIANT_SANS_SERIF_ITALIC = (-(1)) + 12;
  LSM_MATHML_VARIANT_SANS_SERIF_BOLD_ITALIC = (-(1)) + 13;
  LSM_MATHML_VARIANT_MONOSPACE = (-(1)) + 14;

function lsm_mathml_variant_to_string(variant: TLsmMathmlVariant): pchar; cdecl; external liblasem;
function lsm_mathml_variant_from_string(_string: pchar): TLsmMathmlVariant; cdecl; external liblasem;
procedure lsm_mathml_variant_set_font_style(variant: PLsmMathmlVariant; style: TLsmMathmlFontStyle); cdecl; external liblasem;
procedure lsm_mathml_variant_set_font_weight(variant: PLsmMathmlVariant; weight: TLsmMathmlFontWeight); cdecl; external liblasem;

type
  PLsmMathmlForm = ^TLsmMathmlForm;
  TLsmMathmlForm = longint;

const
  LSM_MATHML_FORM_ERROR = -(1);
  LSM_MATHML_FORM_PREFIX = (-(1)) + 1;
  LSM_MATHML_FORM_POSTFIX = (-(1)) + 2;
  LSM_MATHML_FORM_INFIX = (-(1)) + 3;

function lsm_mathml_form_to_string(form: TLsmMathmlForm): pchar; cdecl; external liblasem;
function lsm_mathml_form_from_string(_string: pchar): TLsmMathmlForm; cdecl; external liblasem;

type
  PLsmMathmlRowAlign = ^TLsmMathmlRowAlign;
  TLsmMathmlRowAlign = longint;

const
  LSM_MATHML_ROW_ALIGN_ERROR = -(1);
  LSM_MATHML_ROW_ALIGN_BASELINE = (-(1)) + 1;
  LSM_MATHML_ROW_ALIGN_TOP = (-(1)) + 2;
  LSM_MATHML_ROW_ALIGN_BOTTOM = (-(1)) + 3;
  LSM_MATHML_ROW_ALIGN_CENTER = (-(1)) + 4;
  LSM_MATHML_ROW_ALIGN_AXIS = (-(1)) + 5;

function lsm_mathml_row_align_to_string(row_align: TLsmMathmlRowAlign): pchar; cdecl; external liblasem;
function lsm_mathml_row_align_from_string(_string: pchar): TLsmMathmlRowAlign; cdecl; external liblasem;

type
  PLsmMathmlColumnAlign = ^TLsmMathmlColumnAlign;
  TLsmMathmlColumnAlign = longint;

const
  LSM_MATHML_COLUMN_ALIGN_ERROR = -(1);
  LSM_MATHML_COLUMN_ALIGN_CENTER = (-(1)) + 1;
  LSM_MATHML_COLUMN_ALIGN_LEFT = (-(1)) + 2;
  LSM_MATHML_COLUMN_ALIGN_RIGHT = (-(1)) + 3;

function lsm_mathml_column_align_to_string(column_align: TLsmMathmlColumnAlign): pchar; cdecl; external liblasem;
function lsm_mathml_column_align_from_string(_string: pchar): TLsmMathmlColumnAlign; cdecl; external liblasem;

type
  PLsmMathmlLine = ^TLsmMathmlLine;
  TLsmMathmlLine = longint;

const
  LSM_MATHML_LINE_ERROR = -(1);
  LSM_MATHML_LINE_NONE = (-(1)) + 1;
  LSM_MATHML_LINE_SOLID = (-(1)) + 2;
  LSM_MATHML_LINE_DASHED = (-(1)) + 3;

function lsm_mathml_line_to_string(line: TLsmMathmlLine): pchar; cdecl; external liblasem;
function lsm_mathml_line_from_string(_string: pchar): TLsmMathmlLine; cdecl; external liblasem;

type
  PLsmMathmlScriptLevelSign = ^TLsmMathmlScriptLevelSign;
  TLsmMathmlScriptLevelSign = longint;

const
  LSM_MATHML_SCRIPT_LEVEL_SIGN_ERROR = -(1);
  LSM_MATHML_SCRIPT_LEVEL_SIGN_NONE = (-(1)) + 1;
  LSM_MATHML_SCRIPT_LEVEL_SIGN_PLUS = (-(1)) + 2;
  LSM_MATHML_SCRIPT_LEVEL_SIGN_MINUS = (-(1)) + 3;

type
  PLsmMathmlNotation = ^TLsmMathmlNotation;
  TLsmMathmlNotation = longint;

const
  LSM_MATHML_NOTATION_ERROR = -(1);
  LSM_MATHML_NOTATION_LONGDIV = (-(1)) + 1;
  LSM_MATHML_NOTATION_ACTUARIAL = (-(1)) + 2;
  LSM_MATHML_NOTATION_RADICAL = (-(1)) + 3;
  LSM_MATHML_NOTATION_BOX = (-(1)) + 4;
  LSM_MATHML_NOTATION_ROUNDED_BOX = (-(1)) + 5;
  LSM_MATHML_NOTATION_CIRCLE = (-(1)) + 6;
  LSM_MATHML_NOTATION_LEFT = (-(1)) + 7;
  LSM_MATHML_NOTATION_RIGHT = (-(1)) + 8;
  LSM_MATHML_NOTATION_TOP = (-(1)) + 9;
  LSM_MATHML_NOTATION_BOTTOM = (-(1)) + 10;
  LSM_MATHML_NOTATION_UP_DIAGONAL_STRIKE = (-(1)) + 11;
  LSM_MATHML_NOTATION_DOWN_DIAGONAL_STRIKE = (-(1)) + 12;
  LSM_MATHML_NOTATION_VERTICAL_STRIKE = (-(1)) + 13;
  LSM_MATHML_NOTATION_HORIZONTAL_STRIKE = (-(1)) + 14;
  LSM_MATHML_NOTATION_MADRUWB = (-(1)) + 15;
  LSM_MATHML_NOTATION_UP_DIAGONAL_ARROW = (-(1)) + 16;
  LSM_MATHML_NOTATION_LAST = (-(1)) + 17;

function lsm_mathml_notation_to_string(notation: TLsmMathmlNotation): pchar; cdecl; external liblasem;
function lsm_mathml_notation_from_string(_string: pchar): TLsmMathmlNotation; cdecl; external liblasem;

type
  PLsmMathmlLinebreak = ^TLsmMathmlLinebreak;
  TLsmMathmlLinebreak = longint;

const
  LSM_MATHML_LINEBREAK_ERROR = -(1);
  LSM_MATHML_LINEBREAK_AUTO = (-(1)) + 1;
  LSM_MATHML_LINEBREAK_NEWLINE = (-(1)) + 2;
  LSM_MATHML_LINEBREAK_NOBREAK = (-(1)) + 3;
  LSM_MATHML_LINEBREAK_GOODBREAK = (-(1)) + 4;
  LSM_MATHML_LINEBREAK_BADBREAK = (-(1)) + 5;

function lsm_mathml_linebreak_to_string(linebreak: TLsmMathmlLinebreak): pchar; cdecl; external liblasem;
function lsm_mathml_linebreak_from_string(_string: pchar): TLsmMathmlLinebreak; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:45:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
