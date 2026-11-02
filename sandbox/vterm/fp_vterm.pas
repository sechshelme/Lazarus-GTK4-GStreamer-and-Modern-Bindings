unit fp_vterm;

interface

const
  {$IFDEF Linux}
  libvterm = 'vterm';
  {$ENDIF}

  {$IFDEF Windows}
  libvterm = 'libvterm-0.dll';
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

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // ==== vterm_keycodes.h

type
  PVTermModifier = ^TVTermModifier;
  TVTermModifier = longint;
const
  VTERM_MOD_NONE = $00;
  VTERM_MOD_SHIFT = $01;
  VTERM_MOD_ALT = $02;
  VTERM_MOD_CTRL = $04;
  VTERM_ALL_MODS_MASK = $07;

type
  PVTermKey = ^TVTermKey;
  TVTermKey = longint;
const
  VTERM_KEY_NONE = 0;
  VTERM_KEY_ENTER = 1;
  VTERM_KEY_TAB = 2;
  VTERM_KEY_BACKSPACE = 3;
  VTERM_KEY_ESCAPE = 4;
  VTERM_KEY_UP = 5;
  VTERM_KEY_DOWN = 6;
  VTERM_KEY_LEFT = 7;
  VTERM_KEY_RIGHT = 8;
  VTERM_KEY_INS = 9;
  VTERM_KEY_DEL = 10;
  VTERM_KEY_HOME = 11;
  VTERM_KEY_END = 12;
  VTERM_KEY_PAGEUP = 13;
  VTERM_KEY_PAGEDOWN = 14;
  VTERM_KEY_FUNCTION_0 = 256;
  VTERM_KEY_FUNCTION_MAX = VTERM_KEY_FUNCTION_0 + 255;
  VTERM_KEY_KP_0 = (VTERM_KEY_FUNCTION_0 + 255) + 1;
  VTERM_KEY_KP_1 = (VTERM_KEY_FUNCTION_0 + 255) + 2;
  VTERM_KEY_KP_2 = (VTERM_KEY_FUNCTION_0 + 255) + 3;
  VTERM_KEY_KP_3 = (VTERM_KEY_FUNCTION_0 + 255) + 4;
  VTERM_KEY_KP_4 = (VTERM_KEY_FUNCTION_0 + 255) + 5;
  VTERM_KEY_KP_5 = (VTERM_KEY_FUNCTION_0 + 255) + 6;
  VTERM_KEY_KP_6 = (VTERM_KEY_FUNCTION_0 + 255) + 7;
  VTERM_KEY_KP_7 = (VTERM_KEY_FUNCTION_0 + 255) + 8;
  VTERM_KEY_KP_8 = (VTERM_KEY_FUNCTION_0 + 255) + 9;
  VTERM_KEY_KP_9 = (VTERM_KEY_FUNCTION_0 + 255) + 10;
  VTERM_KEY_KP_MULT = (VTERM_KEY_FUNCTION_0 + 255) + 11;
  VTERM_KEY_KP_PLUS = (VTERM_KEY_FUNCTION_0 + 255) + 12;
  VTERM_KEY_KP_COMMA = (VTERM_KEY_FUNCTION_0 + 255) + 13;
  VTERM_KEY_KP_MINUS = (VTERM_KEY_FUNCTION_0 + 255) + 14;
  VTERM_KEY_KP_PERIOD = (VTERM_KEY_FUNCTION_0 + 255) + 15;
  VTERM_KEY_KP_DIVIDE = (VTERM_KEY_FUNCTION_0 + 255) + 16;
  VTERM_KEY_KP_ENTER = (VTERM_KEY_FUNCTION_0 + 255) + 17;
  VTERM_KEY_KP_EQUAL = (VTERM_KEY_FUNCTION_0 + 255) + 18;
  VTERM_KEY_MAX = (VTERM_KEY_FUNCTION_0 + 255) + 19;
  VTERM_N_KEYS = VTERM_KEY_MAX;

function VTERM_KEY_FUNCTION(n: longint): longint;


// ==== vterm.h

const
  VTERM_VERSION_MAJOR = 0;
  VTERM_VERSION_MINOR = 3;
  VTERM_VERSION_PATCH = 3;

type
  PVTerm = type Pointer;
  PVTermState = type Pointer;
  PVTermScreen = type Pointer;

const
  VTERM_MAX_CHARS_PER_CELL = 6;

type
  PVTermPos = ^TVTermPos;
  TVTermPos = record
    row: longint;
    col: longint;
  end;

  PVTermRect = ^TVTermRect;
  TVTermRect = record
    start_row: longint;
    end_row: longint;
    start_col: longint;
    end_col: longint;
  end;

type
  PVTermColorType = ^TVTermColorType;
  TVTermColorType = longint;
const
  VTERM_COLOR_RGB_ = $00;
  VTERM_COLOR_INDEXED_ = $01;
  VTERM_COLOR_TYPE_MASK = $01;
  VTERM_COLOR_DEFAULT_FG = $02;
  VTERM_COLOR_DEFAULT_BG = $04;
  VTERM_COLOR_DEFAULT_MASK = $06;

type
  PVTermColor = ^TVTermColor;
  TVTermColor = record
    case longint of
      0: (_type: Tuint8_t);
      1: (rgb: record
          _type: Tuint8_t;
          red: Tuint8_t;
          green: Tuint8_t;
          blue: Tuint8_t;
          end);
      2: (indexed: record
          _type: Tuint8_t;
          idx: Tuint8_t;
          end);
  end;

function vterm_color_is_equal(a: PVTermColor; b: PVTermColor): longint; cdecl; external libvterm;

type
  PVTermValueType = ^TVTermValueType;
  TVTermValueType = longint;
const
  VTERM_VALUETYPE_BOOL = 1;
  VTERM_VALUETYPE_INT = 2;
  VTERM_VALUETYPE_STRING = 3;
  VTERM_VALUETYPE_COLOR = 4;
  VTERM_N_VALUETYPES = 5;

type
  PVTermStringFragment = ^TVTermStringFragment;
  TVTermStringFragment = bitpacked record
    str: Pchar;
    len: 0..16383;
    initial: 0..1;
    final: 0..1;
  end;

type
  PVTermValue = ^TVTermValue;
  TVTermValue = record
    case longint of
      0: (boolean: longint);
      1: (number: longint);
      2: (_string: TVTermStringFragment);
      3: (color: TVTermColor);
  end;

type
  PVTermAttr = ^TVTermAttr;
  TVTermAttr = longint;
const
  VTERM_ATTR_BOLD = 1;
  VTERM_ATTR_UNDERLINE = 2;
  VTERM_ATTR_ITALIC = 3;
  VTERM_ATTR_BLINK = 4;
  VTERM_ATTR_REVERSE = 5;
  VTERM_ATTR_CONCEAL = 6;
  VTERM_ATTR_STRIKE = 7;
  VTERM_ATTR_FONT = 8;
  VTERM_ATTR_FOREGROUND = 9;
  VTERM_ATTR_BACKGROUND = 10;
  VTERM_ATTR_SMALL = 11;
  VTERM_ATTR_BASELINE = 12;
  VTERM_N_ATTRS = 13;

type
  PVTermProp = ^TVTermProp;
  TVTermProp = longint;
const
  VTERM_PROP_CURSORVISIBLE = 1;
  VTERM_PROP_CURSORBLINK = 2;
  VTERM_PROP_ALTSCREEN = 3;
  VTERM_PROP_TITLE = 4;
  VTERM_PROP_ICONNAME = 5;
  VTERM_PROP_REVERSE = 6;
  VTERM_PROP_CURSORSHAPE = 7;
  VTERM_PROP_MOUSE = 8;
  VTERM_PROP_FOCUSREPORT = 9;
  VTERM_N_PROPS = 10;

const
  VTERM_PROP_CURSORSHAPE_BLOCK = 1;
  VTERM_PROP_CURSORSHAPE_UNDERLINE = 2;
  VTERM_PROP_CURSORSHAPE_BAR_LEFT = 3;
  VTERM_N_PROP_CURSORSHAPES = 4;

const
  VTERM_PROP_MOUSE_NONE = 0;
  VTERM_PROP_MOUSE_CLICK = 1;
  VTERM_PROP_MOUSE_DRAG = 2;
  VTERM_PROP_MOUSE_MOVE = 3;
  VTERM_N_PROP_MOUSES = 4;

type
  PVTermSelectionMask = ^TVTermSelectionMask;
  TVTermSelectionMask = longint;
const
  VTERM_SELECTION_CLIPBOARD = 1 shl 0;
  VTERM_SELECTION_PRIMARY = 1 shl 1;
  VTERM_SELECTION_SECONDARY = 1 shl 2;
  VTERM_SELECTION_SELECT = 1 shl 3;
  VTERM_SELECTION_CUT0 = 1 shl 4;

type
  PVTermGlyphInfo = ^TVTermGlyphInfo;
  TVTermGlyphInfo = bitpacked record
    chars: Puint32_t;
    width: longint;
    protected_cell: 0..1;
    dwl: 0..1;
    dhl: 0..3;
  end;

type
  PVTermLineInfo = ^TVTermLineInfo;
  TVTermLineInfo = bitpacked record
    doublewidth: 0..1;
    doubleheight: 0..3;
    continuation: 0..1;
  end;

type
  PVTermStateFields = ^TVTermStateFields;
  TVTermStateFields = record
    pos: TVTermPos;
    lineinfos: array[0..1] of PVTermLineInfo;
  end;

  PVTermAllocatorFunctions = ^TVTermAllocatorFunctions;
  TVTermAllocatorFunctions = record
    malloc: function(size: Tsize_t; allocdata: pointer): pointer; cdecl;
    free: procedure(ptr: pointer; allocdata: pointer); cdecl;
  end;

procedure vterm_check_version(major: longint; minor: longint); cdecl; external libvterm;

type
  PVTermBuilder = ^TVTermBuilder;
  TVTermBuilder = record
    ver: longint;
    rows: longint;
    cols: longint;
    allocator: PVTermAllocatorFunctions;
    allocdata: pointer;
    outbuffer_len: Tsize_t;
    tmpbuffer_len: Tsize_t;
  end;

function vterm_build(builder: PVTermBuilder): PVTerm; cdecl; external libvterm;
function vterm_new(rows: longint; cols: longint): PVTerm; cdecl; external libvterm;
function vterm_new_with_allocator(rows: longint; cols: longint; funcs: PVTermAllocatorFunctions; allocdata: pointer): PVTerm; cdecl; external libvterm;
procedure vterm_free(vt: PVTerm); cdecl; external libvterm;
procedure vterm_get_size(vt: PVTerm; rowsp: Plongint; colsp: Plongint); cdecl; external libvterm;
procedure vterm_set_size(vt: PVTerm; rows: longint; cols: longint); cdecl; external libvterm;
function vterm_get_utf8(vt: PVTerm): longint; cdecl; external libvterm;
procedure vterm_set_utf8(vt: PVTerm; is_utf8: longint); cdecl; external libvterm;
function vterm_input_write(vt: PVTerm; bytes: Pchar; len: Tsize_t): Tsize_t; cdecl; external libvterm;

type
  TVTermOutputCallback = procedure(s: Pchar; len: Tsize_t; user: pointer); cdecl;

procedure vterm_output_set_callback(vt: PVTerm; func: TVTermOutputCallback; user: pointer); cdecl; external libvterm;
function vterm_output_get_buffer_size(vt: PVTerm): Tsize_t; cdecl; external libvterm;
function vterm_output_get_buffer_current(vt: PVTerm): Tsize_t; cdecl; external libvterm;
function vterm_output_get_buffer_remaining(vt: PVTerm): Tsize_t; cdecl; external libvterm;
function vterm_output_read(vt: PVTerm; buffer: Pchar; len: Tsize_t): Tsize_t; cdecl; external libvterm;
procedure vterm_keyboard_unichar(vt: PVTerm; c: Tuint32_t; mod_: TVTermModifier); cdecl; external libvterm;
procedure vterm_keyboard_key(vt: PVTerm; key: TVTermKey; mod_: TVTermModifier); cdecl; external libvterm;
procedure vterm_keyboard_start_paste(vt: PVTerm); cdecl; external libvterm;
procedure vterm_keyboard_end_paste(vt: PVTerm); cdecl; external libvterm;
procedure vterm_mouse_move(vt: PVTerm; row: longint; col: longint; mod_: TVTermModifier); cdecl; external libvterm;
procedure vterm_mouse_button(vt: PVTerm; button: longint; pressed: boolean; mod_: TVTermModifier); cdecl; external libvterm;

type
  PVTermParserCallbacks = ^TVTermParserCallbacks;
  TVTermParserCallbacks = record
    text: function(bytes: Pchar; len: Tsize_t; user: pointer): longint; cdecl;
    control: function(control: byte; user: pointer): longint; cdecl;
    escape: function(bytes: Pchar; len: Tsize_t; user: pointer): longint; cdecl;
    csi: function(leader: Pchar; args: Plongint; argcount: longint; intermed: Pchar; command: char;
      user: pointer): longint; cdecl;
    osc: function(command: longint; frag: TVTermStringFragment; user: pointer): longint; cdecl;
    dcs: function(command: Pchar; commandlen: Tsize_t; frag: TVTermStringFragment; user: pointer): longint; cdecl;
    apc: function(frag: TVTermStringFragment; user: pointer): longint; cdecl;
    pm: function(frag: TVTermStringFragment; user: pointer): longint; cdecl;
    sos: function(frag: TVTermStringFragment; user: pointer): longint; cdecl;
    resize: function(rows: longint; cols: longint; user: pointer): longint; cdecl;
  end;

procedure vterm_parser_set_callbacks(vt: PVTerm; callbacks: PVTermParserCallbacks; user: pointer); cdecl; external libvterm;
function vterm_parser_get_cbdata(vt: PVTerm): pointer; cdecl; external libvterm;
procedure vterm_parser_set_emit_nul(vt: PVTerm; emit: boolean); cdecl; external libvterm;

type
  PVTermStateCallbacks = ^TVTermStateCallbacks;
  TVTermStateCallbacks = record
    putglyph: function(info: PVTermGlyphInfo; pos: TVTermPos; user: pointer): longint; cdecl;
    movecursor: function(pos: TVTermPos; oldpos: TVTermPos; visible: longint; user: pointer): longint; cdecl;
    scrollrect: function(rect: TVTermRect; downward: longint; rightward: longint; user: pointer): longint; cdecl;
    moverect: function(dest: TVTermRect; src: TVTermRect; user: pointer): longint; cdecl;
    erase: function(rect: TVTermRect; selective: longint; user: pointer): longint; cdecl;
    initpen: function(user: pointer): longint; cdecl;
    setpenattr: function(attr: TVTermAttr; val: PVTermValue; user: pointer): longint; cdecl;
    settermprop: function(prop: TVTermProp; val: PVTermValue; user: pointer): longint; cdecl;
    bell: function(user: pointer): longint; cdecl;
    resize: function(rows: longint; cols: longint; fields: PVTermStateFields; user: pointer): longint; cdecl;
    setlineinfo: function(row: longint; newinfo: PVTermLineInfo; oldinfo: PVTermLineInfo; user: pointer): longint; cdecl;
    sb_clear: function(user: pointer): longint; cdecl;
  end;

  PVTermStateFallbacks = ^TVTermStateFallbacks;
  TVTermStateFallbacks = record
    control: function(control: byte; user: pointer): longint; cdecl;
    csi: function(leader: Pchar; args: Plongint; argcount: longint; intermed: Pchar; command: char;
      user: pointer): longint; cdecl;
    osc: function(command: longint; frag: TVTermStringFragment; user: pointer): longint; cdecl;
    dcs: function(command: Pchar; commandlen: Tsize_t; frag: TVTermStringFragment; user: pointer): longint; cdecl;
    apc: function(frag: TVTermStringFragment; user: pointer): longint; cdecl;
    pm: function(frag: TVTermStringFragment; user: pointer): longint; cdecl;
    sos: function(frag: TVTermStringFragment; user: pointer): longint; cdecl;
  end;

  PVTermSelectionCallbacks = ^TVTermSelectionCallbacks;
  TVTermSelectionCallbacks = record
    set_: function(mask: TVTermSelectionMask; frag: TVTermStringFragment; user: pointer): longint; cdecl;
    query: function(mask: TVTermSelectionMask; user: pointer): longint; cdecl;
  end;

function vterm_obtain_state(vt: PVTerm): PVTermState; cdecl; external libvterm;
procedure vterm_state_set_callbacks(state: PVTermState; callbacks: PVTermStateCallbacks; user: pointer); cdecl; external libvterm;
function vterm_state_get_cbdata(state: PVTermState): pointer; cdecl; external libvterm;
procedure vterm_state_set_unrecognised_fallbacks(state: PVTermState; fallbacks: PVTermStateFallbacks; user: pointer); cdecl; external libvterm;
function vterm_state_get_unrecognised_fbdata(state: PVTermState): pointer; cdecl; external libvterm;
procedure vterm_state_reset(state: PVTermState; hard: longint); cdecl; external libvterm;
procedure vterm_state_get_cursorpos(state: PVTermState; cursorpos: PVTermPos); cdecl; external libvterm;
procedure vterm_state_get_default_colors(state: PVTermState; default_fg: PVTermColor; default_bg: PVTermColor); cdecl; external libvterm;
procedure vterm_state_get_palette_color(state: PVTermState; index: longint; col: PVTermColor); cdecl; external libvterm;
procedure vterm_state_set_default_colors(state: PVTermState; default_fg: PVTermColor; default_bg: PVTermColor); cdecl; external libvterm;
procedure vterm_state_set_palette_color(state: PVTermState; index: longint; col: PVTermColor); cdecl; external libvterm;
procedure vterm_state_set_bold_highbright(state: PVTermState; bold_is_highbright: longint); cdecl; external libvterm;
function vterm_state_get_penattr(state: PVTermState; attr: TVTermAttr; val: PVTermValue): longint; cdecl; external libvterm;
function vterm_state_set_termprop(state: PVTermState; prop: TVTermProp; val: PVTermValue): longint; cdecl; external libvterm;
procedure vterm_state_focus_in(state: PVTermState); cdecl; external libvterm;
procedure vterm_state_focus_out(state: PVTermState); cdecl; external libvterm;
function vterm_state_get_lineinfo(state: PVTermState; row: longint): PVTermLineInfo; cdecl; external libvterm;

procedure vterm_state_convert_color_to_rgb(state: PVTermState; col: PVTermColor); cdecl; external libvterm;
procedure vterm_state_set_selection_callbacks(state: PVTermState; callbacks: PVTermSelectionCallbacks; user: pointer; buffer: Pchar; buflen: Tsize_t); cdecl; external libvterm;
procedure vterm_state_send_selection(state: PVTermState; mask: TVTermSelectionMask; frag: TVTermStringFragment); cdecl; external libvterm;

type
  PVTermScreenCellAttrs = ^TVTermScreenCellAttrs;
  TVTermScreenCellAttrs = bitpacked record
    bold: 0..1;
    underline: 0..3;
    italic: 0..1;
    blink: 0..1;
    reverse: 0..1;
    conceal: 0..1;
    strike: 0..1;
    font: 0..15;
    dwl: 0..1;
    dhl: 0..3;
    small: 0..1;
    baseline: 0..3;
    pad:Byte;
  end;

const
  VTERM_UNDERLINE_OFF = 0;
  VTERM_UNDERLINE_SINGLE = 1;
  VTERM_UNDERLINE_DOUBLE = 2;
  VTERM_UNDERLINE_CURLY = 3;

const
  VTERM_BASELINE_NORMAL = 0;
  VTERM_BASELINE_RAISE = 1;
  VTERM_BASELINE_LOWER = 2;

type
  PVTermScreenCell = ^TVTermScreenCell;
  TVTermScreenCell = record
    chars: array[0..(VTERM_MAX_CHARS_PER_CELL) - 1] of Tuint32_t;
    width: char;
    pad0, pad1, pad2: byte;
    attrs: TVTermScreenCellAttrs;
    fg: TVTermColor;
    bg: TVTermColor;
  end;

  PVTermScreenCallbacks = ^TVTermScreenCallbacks;
  TVTermScreenCallbacks = record
    damage: function(rect: TVTermRect; user: pointer): longint; cdecl;
    moverect: function(dest: TVTermRect; src: TVTermRect; user: pointer): longint; cdecl;
    movecursor: function(pos: TVTermPos; oldpos: TVTermPos; visible: longint; user: pointer): longint; cdecl;
    settermprop: function(prop: TVTermProp; val: PVTermValue; user: pointer): longint; cdecl;
    bell: function(user: pointer): longint; cdecl;
    resize: function(rows: longint; cols: longint; user: pointer): longint; cdecl;
    sb_pushline: function(cols: longint; cells: PVTermScreenCell; user: pointer): longint; cdecl;
    sb_popline: function(cols: longint; cells: PVTermScreenCell; user: pointer): longint; cdecl;
    sb_clear: function(user: pointer): longint; cdecl;
  end;

function vterm_obtain_screen(vt: PVTerm): PVTermScreen; cdecl; external libvterm;
procedure vterm_screen_set_callbacks(screen: PVTermScreen; callbacks: PVTermScreenCallbacks; user: pointer); cdecl; external libvterm;
function vterm_screen_get_cbdata(screen: PVTermScreen): pointer; cdecl; external libvterm;
procedure vterm_screen_set_unrecognised_fallbacks(screen: PVTermScreen; fallbacks: PVTermStateFallbacks; user: pointer); cdecl; external libvterm;
function vterm_screen_get_unrecognised_fbdata(screen: PVTermScreen): pointer; cdecl; external libvterm;
procedure vterm_screen_enable_reflow(screen: PVTermScreen; reflow: boolean); cdecl; external libvterm;

procedure vterm_screen_enable_altscreen(screen: PVTermScreen; altscreen: longint); cdecl; external libvterm;

type
  PVTermDamageSize = ^TVTermDamageSize;
  TVTermDamageSize = longint;
const
  VTERM_DAMAGE_CELL = 0;
  VTERM_DAMAGE_ROW = 1;
  VTERM_DAMAGE_SCREEN = 2;
  VTERM_DAMAGE_SCROLL = 3;
  VTERM_N_DAMAGES = 4;

procedure vterm_screen_flush_damage(screen: PVTermScreen); cdecl; external libvterm;
procedure vterm_screen_set_damage_merge(screen: PVTermScreen; size: TVTermDamageSize); cdecl; external libvterm;
procedure vterm_screen_reset(screen: PVTermScreen; hard: longint); cdecl; external libvterm;
function vterm_screen_get_chars(screen: PVTermScreen; chars: Puint32_t; len: Tsize_t; rect: TVTermRect): Tsize_t; cdecl; external libvterm;
function vterm_screen_get_text(screen: PVTermScreen; str: Pchar; len: Tsize_t; rect: TVTermRect): Tsize_t; cdecl; external libvterm;

type
  PVTermAttrMask = ^TVTermAttrMask;
  TVTermAttrMask = longint;
const
  VTERM_ATTR_BOLD_MASK = 1 shl 0;
  VTERM_ATTR_UNDERLINE_MASK = 1 shl 1;
  VTERM_ATTR_ITALIC_MASK = 1 shl 2;
  VTERM_ATTR_BLINK_MASK = 1 shl 3;
  VTERM_ATTR_REVERSE_MASK = 1 shl 4;
  VTERM_ATTR_STRIKE_MASK = 1 shl 5;
  VTERM_ATTR_FONT_MASK = 1 shl 6;
  VTERM_ATTR_FOREGROUND_MASK = 1 shl 7;
  VTERM_ATTR_BACKGROUND_MASK = 1 shl 8;
  VTERM_ATTR_CONCEAL_MASK = 1 shl 9;
  VTERM_ATTR_SMALL_MASK = 1 shl 10;
  VTERM_ATTR_BASELINE_MASK = 1 shl 11;
  VTERM_ALL_ATTRS_MASK = (1 shl 12) - 1;

function vterm_screen_get_attrs_extent(screen: PVTermScreen; extent: PVTermRect; pos: TVTermPos; attrs: TVTermAttrMask): longint; cdecl; external libvterm;
function vterm_screen_get_cell(screen: PVTermScreen; pos: TVTermPos; cell: PVTermScreenCell): longint; cdecl; external libvterm;
function vterm_screen_is_eol(screen: PVTermScreen; pos: TVTermPos): longint; cdecl; external libvterm;
procedure vterm_screen_convert_color_to_rgb(screen: PVTermScreen; col: PVTermColor); cdecl; external libvterm;
procedure vterm_screen_set_default_colors(screen: PVTermScreen; default_fg: PVTermColor; default_bg: PVTermColor); cdecl; external libvterm;

function vterm_get_attr_type(attr: TVTermAttr): TVTermValueType; cdecl; external libvterm;
function vterm_get_prop_type(prop: TVTermProp): TVTermValueType; cdecl; external libvterm;

type
  Tscroll_rect1_func = function(src: TVTermRect; dest: TVTermRect; user: pointer): longint; cdecl;
  Tscroll_rect2_func = function(rect: TVTermRect; selective: longint; user: pointer): longint; cdecl;
  Tcopy_cells_func = procedure(dest: TVTermPos; src: TVTermPos; user: pointer); cdecl;

procedure vterm_scroll_rect(rect: TVTermRect; downward: longint; rightward: longint; moverect: Tscroll_rect1_func; eraserect: Tscroll_rect2_func;
  user: pointer); cdecl; external libvterm;
procedure vterm_copy_cells(dest: TVTermRect; src: TVTermRect; copycell: Tcopy_cells_func; user: pointer); cdecl; external libvterm;

function vterm_pos_cmp(a, b: TVTermPos): longint; inline;
function vterm_rect_contains(r: TVTermRect; p: TVTermPos): boolean; inline;
procedure vterm_rect_move(rect: PVTermRect; row_delta, col_delta: longint); inline;

function VTERM_COLOR_IS_INDEXED(col: PVTermColor): boolean;
function VTERM_COLOR_IS_RGB(col: PVTermColor): boolean;
function VTERM_COLOR_IS_DEFAULT_FG(col: PVTermColor): boolean;
function VTERM_COLOR_IS_DEFAULT_BG(col: PVTermColor): boolean;

procedure vterm_color_rgb(col: PVTermColor; red, green, blue: uint8); inline;
procedure vterm_color_indexed(col: PVTermColor; idx: uint8); inline;

// === Konventiert am: 1-11-26 19:19:25 ===


implementation

// ==== vterm_keycodes.h

function VTERM_KEY_FUNCTION(n: longint): longint;
begin
  VTERM_KEY_FUNCTION := VTERM_KEY_FUNCTION_0 + n;
end;


// ==== vterm.h


function vterm_pos_cmp(a, b: TVTermPos): longint;
begin
  if a.row = b.row then begin Result := a.col - b.col; end else begin Result := a.row - b.row; end;
end;

function vterm_rect_contains(r: TVTermRect; p: TVTermPos): boolean;
begin
  Result := (p.row >= r.start_row) and (p.row < r.end_row) and
    (p.col >= r.start_col) and (p.col < r.end_col);
end;

procedure vterm_rect_move(rect: PVTermRect; row_delta, col_delta: longint);
begin
  if rect <> nil then begin
    rect^.start_row := rect^.start_row + row_delta;
    rect^.end_row := rect^.end_row + row_delta;
    rect^.start_col := rect^.start_col + col_delta;
    rect^.end_col := rect^.end_col + col_delta;
  end;
end;

procedure vterm_color_rgb(col: PVTermColor; red, green, blue: uint8);
begin
  if col <> nil then  begin
    col^._type := VTERM_COLOR_RGB_;
    col^.rgb.red := red;
    col^.rgb.green := green;
    col^.rgb.blue := blue;
  end;
end;

procedure vterm_color_indexed(col: PVTermColor; idx: uint8);
begin
  if col <> nil then begin
    col^._type := VTERM_COLOR_INDEXED_;
    col^.indexed.idx := idx;
  end;
end;

function VTERM_COLOR_IS_INDEXED(col: PVTermColor): boolean;
begin
  VTERM_COLOR_IS_INDEXED := ((col^._type) and VTERM_COLOR_TYPE_MASK) = VTERM_COLOR_INDEXED_;
end;

function VTERM_COLOR_IS_RGB(col: PVTermColor): boolean;
begin
  VTERM_COLOR_IS_RGB := ((col^._type) and VTERM_COLOR_TYPE_MASK) = VTERM_COLOR_RGB_;
end;

function VTERM_COLOR_IS_DEFAULT_FG(col: PVTermColor): boolean;
begin
  VTERM_COLOR_IS_DEFAULT_FG := not not (col^._type and VTERM_COLOR_DEFAULT_FG <> 0);
end;

function VTERM_COLOR_IS_DEFAULT_BG(col: PVTermColor): boolean;
begin
  VTERM_COLOR_IS_DEFAULT_BG := not not (col^._type and VTERM_COLOR_DEFAULT_BG <> 0);
end;

end.
