
{$IFDEF read_interface}

type
  PPangoAttrType = ^TPangoAttrType;
  TPangoAttrType = longint;

const
  PANGO_ATTR_INVALID = 0;
  PANGO_ATTR_LANGUAGE = 1;
  PANGO_ATTR_FAMILY = 2;
  PANGO_ATTR_STYLE = 3;
  PANGO_ATTR_WEIGHT = 4;
  PANGO_ATTR_VARIANT = 5;
  PANGO_ATTR_STRETCH = 6;
  PANGO_ATTR_SIZE = 7;
  PANGO_ATTR_FONT_DESC = 8;
  PANGO_ATTR_FOREGROUND = 9;
  PANGO_ATTR_BACKGROUND = 10;
  PANGO_ATTR_UNDERLINE = 11;
  PANGO_ATTR_STRIKETHROUGH = 12;
  PANGO_ATTR_RISE = 13;
  PANGO_ATTR_SHAPE = 14;
  PANGO_ATTR_SCALE = 15;
  PANGO_ATTR_FALLBACK = 16;
  PANGO_ATTR_LETTER_SPACING = 17;
  PANGO_ATTR_UNDERLINE_COLOR = 18;
  PANGO_ATTR_STRIKETHROUGH_COLOR = 19;
  PANGO_ATTR_ABSOLUTE_SIZE = 20;
  PANGO_ATTR_GRAVITY = 21;
  PANGO_ATTR_GRAVITY_HINT = 22;
  PANGO_ATTR_FONT_FEATURES = 23;
  PANGO_ATTR_FOREGROUND_ALPHA = 24;
  PANGO_ATTR_BACKGROUND_ALPHA = 25;
  PANGO_ATTR_ALLOW_BREAKS = 26;
  PANGO_ATTR_SHOW = 27;
  PANGO_ATTR_INSERT_HYPHENS = 28;
  PANGO_ATTR_OVERLINE = 29;
  PANGO_ATTR_OVERLINE_COLOR = 30;
  PANGO_ATTR_LINE_HEIGHT = 31;
  PANGO_ATTR_ABSOLUTE_LINE_HEIGHT = 32;
  PANGO_ATTR_TEXT_TRANSFORM = 33;
  PANGO_ATTR_WORD = 34;
  PANGO_ATTR_SENTENCE = 35;
  PANGO_ATTR_BASELINE_SHIFT = 36;
  PANGO_ATTR_FONT_SCALE = 37;

type
  PPangoUnderline = ^TPangoUnderline;
  TPangoUnderline = longint;

const
  PANGO_UNDERLINE_NONE = 0;
  PANGO_UNDERLINE_SINGLE = 1;
  PANGO_UNDERLINE_DOUBLE = 2;
  PANGO_UNDERLINE_LOW = 3;
  PANGO_UNDERLINE_ERROR = 4;
  PANGO_UNDERLINE_SINGLE_LINE = 5;
  PANGO_UNDERLINE_DOUBLE_LINE = 6;
  PANGO_UNDERLINE_ERROR_LINE = 7;

type
  PPangoOverline = ^TPangoOverline;
  TPangoOverline = longint;

const
  PANGO_OVERLINE_NONE = 0;
  PANGO_OVERLINE_SINGLE = 1;

type
  PPangoShowFlags = ^TPangoShowFlags;
  TPangoShowFlags = longint;

const
  PANGO_SHOW_NONE = 0;
  PANGO_SHOW_SPACES = 1 shl 0;
  PANGO_SHOW_LINE_BREAKS = 1 shl 1;
  PANGO_SHOW_IGNORABLES = 1 shl 2;

type
  PPangoTextTransform = ^TPangoTextTransform;
  TPangoTextTransform = longint;

const
  PANGO_TEXT_TRANSFORM_NONE = 0;
  PANGO_TEXT_TRANSFORM_LOWERCASE = 1;
  PANGO_TEXT_TRANSFORM_UPPERCASE = 2;
  PANGO_TEXT_TRANSFORM_CAPITALIZE = 3;

type
  PPangoBaselineShift = ^TPangoBaselineShift;
  TPangoBaselineShift = longint;

const
  PANGO_BASELINE_SHIFT_NONE = 0;
  PANGO_BASELINE_SHIFT_SUPERSCRIPT = 1;
  PANGO_BASELINE_SHIFT_SUBSCRIPT = 2;

type
  PPangoFontScale = ^TPangoFontScale;
  TPangoFontScale = longint;

const
  PANGO_FONT_SCALE_NONE = 0;
  PANGO_FONT_SCALE_SUPERSCRIPT = 1;
  PANGO_FONT_SCALE_SUBSCRIPT = 2;
  PANGO_FONT_SCALE_SMALL_CAPS = 3;

type
  PPangoAttribute = ^TPangoAttribute;

  TPangoAttrClass = record
    _type: TPangoAttrType;
    copy: function(attr: PPangoAttribute): PPangoAttribute; cdecl;
    Destroy: procedure(attr: PPangoAttribute); cdecl;
    equal: function(attr1: PPangoAttribute; attr2: PPangoAttribute): Tgboolean; cdecl;
  end;
  PPangoAttrClass = ^TPangoAttrClass;

  TPangoAttribute = record
    klass: PPangoAttrClass;
    start_index: Tguint;
    end_index: Tguint;
  end;

  TPangoAttrFilterFunc = function(attribute: PPangoAttribute; user_data: Tgpointer): Tgboolean; cdecl;
  TPangoAttrDataCopyFunc = function(user_data: Tgconstpointer): Tgpointer; cdecl;

  TPangoAttrString = record
    attr: TPangoAttribute;
    Value: pchar;
  end;
  PPangoAttrString = ^TPangoAttrString;

  TPangoAttrLanguage = record
    attr: TPangoAttribute;
    Value: PPangoLanguage;
  end;
  PPangoAttrLanguage = ^TPangoAttrLanguage;

  TPangoAttrInt = record
    attr: TPangoAttribute;
    Value: longint;
  end;
  PPangoAttrInt = ^TPangoAttrInt;

  TPangoAttrFloat = record
    attr: TPangoAttribute;
    Value: double;
  end;
  PPangoAttrFloat = ^TPangoAttrFloat;

  TPangoAttrColor = record
    attr: TPangoAttribute;
    color: TPangoColor;
  end;
  PPangoAttrColor = ^TPangoAttrColor;

  TPangoAttrSize = record
    attr: TPangoAttribute;
    size: longint;
    absolute: 0..1;
  end;
  PPangoAttrSize = ^TPangoAttrSize;


type
  TPangoAttrShape = record
    attr: TPangoAttribute;
    ink_rect: TPangoRectangle;
    logical_rect: TPangoRectangle;
    Data: Tgpointer;
    copy_func: TPangoAttrDataCopyFunc;
    destroy_func: TGDestroyNotify;
  end;
  PPangoAttrShape = ^TPangoAttrShape;

  TPangoAttrFontDesc = record
    attr: TPangoAttribute;
    desc: PPangoFontDescription;
  end;
  PPangoAttrFontDesc = ^TPangoAttrFontDesc;

  TPangoAttrFontFeatures = record
    attr: TPangoAttribute;
    features: Pgchar;
  end;
  PPangoAttrFontFeatures = ^TPangoAttrFontFeatures;


function pango_attribute_get_type: TGType; cdecl; external libpango;
function pango_attr_type_register(Name: pchar): TPangoAttrType; cdecl; external libpango;
function pango_attr_type_get_name(_type: TPangoAttrType): pchar; cdecl; external libpango;
procedure pango_attribute_init(attr: PPangoAttribute; klass: PPangoAttrClass); cdecl; external libpango;
function pango_attribute_copy(attr: PPangoAttribute): PPangoAttribute; cdecl; external libpango;
procedure pango_attribute_destroy(attr: PPangoAttribute); cdecl; external libpango;
function pango_attribute_equal(attr1: PPangoAttribute; attr2: PPangoAttribute): Tgboolean; cdecl; external libpango;
function pango_attr_language_new(language: PPangoLanguage): PPangoAttribute; cdecl; external libpango;
function pango_attr_family_new(family: pchar): PPangoAttribute; cdecl; external libpango;
function pango_attr_foreground_new(red: Tguint16; green: Tguint16; blue: Tguint16): PPangoAttribute; cdecl; external libpango;
function pango_attr_background_new(red: Tguint16; green: Tguint16; blue: Tguint16): PPangoAttribute; cdecl; external libpango;
function pango_attr_size_new(size: longint): PPangoAttribute; cdecl; external libpango;
function pango_attr_size_new_absolute(size: longint): PPangoAttribute; cdecl; external libpango;
function pango_attr_style_new(style: TPangoStyle): PPangoAttribute; cdecl; external libpango;
function pango_attr_weight_new(weight: TPangoWeight): PPangoAttribute; cdecl; external libpango;
function pango_attr_variant_new(variant: TPangoVariant): PPangoAttribute; cdecl; external libpango;
function pango_attr_stretch_new(stretch: TPangoStretch): PPangoAttribute; cdecl; external libpango;
function pango_attr_font_desc_new(desc: PPangoFontDescription): PPangoAttribute; cdecl; external libpango;
function pango_attr_underline_new(underline: TPangoUnderline): PPangoAttribute; cdecl; external libpango;
function pango_attr_underline_color_new(red: Tguint16; green: Tguint16; blue: Tguint16): PPangoAttribute; cdecl; external libpango;
function pango_attr_strikethrough_new(strikethrough: Tgboolean): PPangoAttribute; cdecl; external libpango;
function pango_attr_strikethrough_color_new(red: Tguint16; green: Tguint16; blue: Tguint16): PPangoAttribute; cdecl; external libpango;
function pango_attr_rise_new(rise: longint): PPangoAttribute; cdecl; external libpango;
function pango_attr_baseline_shift_new(shift: longint): PPangoAttribute; cdecl; external libpango;
function pango_attr_font_scale_new(scale: TPangoFontScale): PPangoAttribute; cdecl; external libpango;
function pango_attr_scale_new(scale_factor: double): PPangoAttribute; cdecl; external libpango;
function pango_attr_fallback_new(enable_fallback: Tgboolean): PPangoAttribute; cdecl; external libpango;
function pango_attr_letter_spacing_new(letter_spacing: longint): PPangoAttribute; cdecl; external libpango;
function pango_attr_shape_new(ink_rect: PPangoRectangle; logical_rect: PPangoRectangle): PPangoAttribute; cdecl; external libpango;
function pango_attr_shape_new_with_data(ink_rect: PPangoRectangle; logical_rect: PPangoRectangle; Data: Tgpointer; copy_func: TPangoAttrDataCopyFunc; destroy_func: TGDestroyNotify): PPangoAttribute; cdecl; external libpango;
function pango_attr_gravity_new(gravity: TPangoGravity): PPangoAttribute; cdecl; external libpango;
function pango_attr_gravity_hint_new(hint: TPangoGravityHint): PPangoAttribute; cdecl; external libpango;
function pango_attr_font_features_new(features: pchar): PPangoAttribute; cdecl; external libpango;
function pango_attr_foreground_alpha_new(alpha: Tguint16): PPangoAttribute; cdecl; external libpango;
function pango_attr_background_alpha_new(alpha: Tguint16): PPangoAttribute; cdecl; external libpango;
function pango_attr_allow_breaks_new(allow_breaks: Tgboolean): PPangoAttribute; cdecl; external libpango;
function pango_attr_word_new: PPangoAttribute; cdecl; external libpango;
function pango_attr_sentence_new: PPangoAttribute; cdecl; external libpango;
function pango_attr_insert_hyphens_new(insert_hyphens: Tgboolean): PPangoAttribute; cdecl; external libpango;
function pango_attr_overline_new(overline: TPangoOverline): PPangoAttribute; cdecl; external libpango;
function pango_attr_overline_color_new(red: Tguint16; green: Tguint16; blue: Tguint16): PPangoAttribute; cdecl; external libpango;
function pango_attr_show_new(flags: TPangoShowFlags): PPangoAttribute; cdecl; external libpango;
function pango_attr_line_height_new(factor: double): PPangoAttribute; cdecl; external libpango;
function pango_attr_line_height_new_absolute(Height: longint): PPangoAttribute; cdecl; external libpango;
function pango_attr_text_transform_new(transform: TPangoTextTransform): PPangoAttribute; cdecl; external libpango;
function pango_attribute_as_string(attr: PPangoAttribute): PPangoAttrString; cdecl; external libpango;
function pango_attribute_as_language(attr: PPangoAttribute): PPangoAttrLanguage; cdecl; external libpango;
function pango_attribute_as_int(attr: PPangoAttribute): PPangoAttrInt; cdecl; external libpango;
function pango_attribute_as_size(attr: PPangoAttribute): PPangoAttrSize; cdecl; external libpango;
function pango_attribute_as_float(attr: PPangoAttribute): PPangoAttrFloat; cdecl; external libpango;
function pango_attribute_as_color(attr: PPangoAttribute): PPangoAttrColor; cdecl; external libpango;
function pango_attribute_as_font_desc(attr: PPangoAttribute): PPangoAttrFontDesc; cdecl; external libpango;
function pango_attribute_as_shape(attr: PPangoAttribute): PPangoAttrShape; cdecl; external libpango;
function pango_attribute_as_font_features(attr: PPangoAttribute): PPangoAttrFontFeatures; cdecl; external libpango;
function pango_attr_list_get_type: TGType; cdecl; external libpango;
function pango_attr_list_new: PPangoAttrList; cdecl; external libpango;
function pango_attr_list_ref(list: PPangoAttrList): PPangoAttrList; cdecl; external libpango;
procedure pango_attr_list_unref(list: PPangoAttrList); cdecl; external libpango;
function pango_attr_list_copy(list: PPangoAttrList): PPangoAttrList; cdecl; external libpango;
procedure pango_attr_list_insert(list: PPangoAttrList; attr: PPangoAttribute); cdecl; external libpango;
procedure pango_attr_list_insert_before(list: PPangoAttrList; attr: PPangoAttribute); cdecl; external libpango;
procedure pango_attr_list_change(list: PPangoAttrList; attr: PPangoAttribute); cdecl; external libpango;
procedure pango_attr_list_splice(list: PPangoAttrList; other: PPangoAttrList; pos: longint; len: longint); cdecl; external libpango;
procedure pango_attr_list_update(list: PPangoAttrList; pos: longint; remove: longint; add: longint); cdecl; external libpango;
function pango_attr_list_filter(list: PPangoAttrList; func: TPangoAttrFilterFunc; Data: Tgpointer): PPangoAttrList; cdecl; external libpango;
function pango_attr_list_get_attributes(list: PPangoAttrList): PGSList; cdecl; external libpango;
function pango_attr_list_equal(list: PPangoAttrList; other_list: PPangoAttrList): Tgboolean; cdecl; external libpango;
function pango_attr_list_to_string(list: PPangoAttrList): pchar; cdecl; external libpango;
function pango_attr_list_from_string(Text: pchar): PPangoAttrList; cdecl; external libpango;
function pango_attr_iterator_get_type: TGType; cdecl; external libpango;
function pango_attr_list_get_iterator(list: PPangoAttrList): PPangoAttrIterator; cdecl; external libpango;
procedure pango_attr_iterator_range(iterator: PPangoAttrIterator; start: Plongint; end_: Plongint); cdecl; external libpango;
function pango_attr_iterator_next(iterator: PPangoAttrIterator): Tgboolean; cdecl; external libpango;
function pango_attr_iterator_copy(iterator: PPangoAttrIterator): PPangoAttrIterator; cdecl; external libpango;
procedure pango_attr_iterator_destroy(iterator: PPangoAttrIterator); cdecl; external libpango;
function pango_attr_iterator_get(iterator: PPangoAttrIterator; _type: TPangoAttrType): PPangoAttribute; cdecl; external libpango;
procedure pango_attr_iterator_get_font(iterator: PPangoAttrIterator; desc: PPangoFontDescription; language: PPPangoLanguage; extra_attrs: PPGSList); cdecl; external libpango;
function pango_attr_iterator_get_attrs(iterator: PPangoAttrIterator): PGSList; cdecl; external libpango;


const
  PANGO_ATTR_INDEX_FROM_TEXT_BEGINNING = Tguint(0);
  PANGO_ATTR_INDEX_TO_TEXT_END = Tguint(G_MAXUINT + 0);

function PANGO_TYPE_ATTR_LIST: TGType;

// === Konventiert am: 23-11-24 15:54:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_TYPE_ATTR_LIST: TGType;
begin
  PANGO_TYPE_ATTR_LIST := pango_attr_list_get_type;
end;


{$ENDIF read_implementation}
