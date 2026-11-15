unit mbexp;

interface

uses
xft, x, xlib, fp_pango, fp_mb, mbpixbuf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
PMBColor = ^TMBColor;
  TMBColor = record
      pb : PMBPixbuf;
      r : byte;
      g : byte;
      b : byte;
      a : byte;
      xcol : TXColor;
      xftcol : TXftColor;
      ref_cnt : longint;
    end;

type
PMBFont = ^TMBFont;
  TMBFont = record
      dpy : PDisplay;
      family : Pchar;
      weight : longint;
      slant : longint;
      pt_size : longint;
      have_shadow : TBool;
      col : PMBColor;
      pgo_context : PPangoContext;
      pgo_fontmap : PPangoFontMap;
      fontdes : PPangoFontDescription;
      font : PPangoFont;
      metrics : PPangoFontMetrics;
      _have_fresh_font_object : TBool;
      ref_cnt : longint;
    end;

  type
  PMBEncoding = ^TMBEncoding;
  TMBEncoding =  Longint;
  Const
    MB_ENCODING_LATIN = 0;
    MB_ENCODING_UTF8 = 1;

  type
  PMBFontWeight = ^TMBFontWeight;
  TMBFontWeight =  Longint;
  Const
    MB_NORMAL = 0;
    MB_LIGHT = 1;
    MB_MEDIUM = 2;
    MB_DEMIBOLD = 3;
    MB_BOLD = 4;
    MB_BLACK = 5;
    MB_N_WEIGHTS = 6;

  type
  PMBFontSlant = ^TMBFontSlant;
  TMBFontSlant =  Longint;
  Const
    MB_ROMAN = 0;
    MB_ITALIC = 1;
    MB_OBLIQUE = 2;
    MB_N_SLANTS = 3;

  type
  PMBFontRenderOpts = ^TMBFontRenderOpts;
  TMBFontRenderOpts =  Longint;
  Const
    MB_FONT_RENDER_OPTS_NONE = 0;
    MB_FONT_RENDER_OPTS_CLIP_TRAIL = 1 shl 1;
    MB_FONT_RENDER_ALIGN_CENTER = 1 shl 2;
    MB_FONT_RENDER_ALIGN_RIGHT = 1 shl 3;
    MB_FONT_RENDER_EFFECT_SHADOW = 1 shl 4;
    MB_FONT_RENDER_VALIGN_MIDDLE = 1 shl 5;

  type
  PMBDrawable = ^TMBDrawable;
  TMBDrawable = record
      pb : PMBPixbuf;
      xpixmap : TPixmap;
      have_ext_pxm : TBool;
      xftdraw : PXftDraw;
      width : longint;
      height : longint;
    end;

  PMBLayout = ^TMBLayout;
  TMBLayout = record
      x : longint;
      y : longint;
      width : longint;
      height : longint;
      line_spacing : longint;
      txt : Pbyte;
      txt_encoding : TMBEncoding;
      font : PMBFont;
      _have_autocalc_size : TBool;
    end;

function mb_col_new_from_spec(pb:PMBPixbuf; spec:Pchar):PMBColor;cdecl;external libmb;
function mb_col_set(col:PMBColor; spec:Pchar):TBool;cdecl;external libmb;
procedure mb_col_set_rgba(col:PMBColor; red:byte; green:byte; blue:byte; alpha:byte);cdecl;external libmb;
procedure mb_col_get_rgba(col:PMBColor; red:Pbyte; green:Pbyte; blue:Pbyte; alpha:Pbyte);cdecl;external libmb;

procedure mb_col_unref(col:PMBColor);cdecl;external libmb;
function mb_font_new(dpy:PDisplay; family:Pchar):PMBFont;cdecl;external libmb;
procedure mb_font_ref(font:PMBFont);cdecl;external libmb;
procedure mb_font_unref(font:PMBFont);cdecl;external libmb;
function mb_font_new_from_string(dpy:PDisplay; spec:Pchar):PMBFont;cdecl;external libmb;
function mb_font_set_from_string(font:PMBFont; spec:Pchar):PMBFont;cdecl;external libmb;
procedure mb_font_set_family(font:PMBFont; family:Pchar);cdecl;external libmb;
function mb_font_get_family(font:PMBFont):Pchar;cdecl;external libmb;
function mb_font_get(font:PMBFont):Pchar;cdecl;external libmb;
procedure mb_font_set_weight(font:PMBFont; weight:TMBFontWeight);cdecl;external libmb;
function mb_font_get_weight(font:PMBFont):TMBFontWeight;cdecl;external libmb;
procedure mb_font_set_slant(font:PMBFont; slant:TMBFontSlant);cdecl;external libmb;
procedure mb_font_set_point_size(font:PMBFont; points:longint);cdecl;external libmb;
function mb_font_get_point_size(font:PMBFont):longint;cdecl;external libmb;
function mb_font_set_size_to_pixels(font:PMBFont; max_pixels:longint; points_to_try:Plongint):longint;cdecl;external libmb;
procedure mb_font_set_color(font:PMBFont; col:PMBColor);cdecl;external libmb;
function mb_font_get_color(font:PMBFont):PMBColor;cdecl;external libmb;
function mb_font_get_txt_width(font:PMBFont; txt:Pbyte; byte_len:longint; encoding:longint):longint;cdecl;external libmb;
function mb_font_get_height(font:PMBFont):longint;cdecl;external libmb;
function mb_font_get_ascent(font:PMBFont):longint;cdecl;external libmb;
function mb_font_get_descent(font:PMBFont):longint;cdecl;external libmb;
function mb_font_render_simple(font:PMBFont; drw:PMBDrawable; x:longint; y:longint; width:longint;
           text:Pbyte; encoding:longint; opts:TMBFontRenderOpts):longint;cdecl;external libmb;
function mb_font_render_simple_get_width(font:PMBFont; width:longint; text:Pbyte; encoding:longint; opts:TMBFontRenderOpts):longint;cdecl;external libmb;
function mb_layout_new:PMBLayout;cdecl;external libmb;
procedure mb_layout_unref(layout:PMBLayout);cdecl;external libmb;
procedure mb_layout_set_font(layout:PMBLayout; font:PMBFont);cdecl;external libmb;
procedure mb_layout_set_geometry(layout:PMBLayout; width:longint; height:longint);cdecl;external libmb;
procedure mb_layout_get_geometry(layout:PMBLayout; width:Plongint; height:Plongint);cdecl;external libmb;
procedure mb_layout_set_text(layout:PMBLayout; text:Pbyte; encoding:TMBEncoding);cdecl;external libmb;
procedure mb_layout_destroy(layout:PMBLayout);cdecl;external libmb;
procedure mb_layout_set_multiline(layout:PMBLayout; want_multiline:TBool);cdecl;external libmb;
procedure mb_layout_set_align(layout:PMBLayout; horizontal:longint; vertical:longint);cdecl;external libmb;
procedure mb_layout_set_clip_style(layout:PMBLayout; clip_stype:longint);cdecl;external libmb;
procedure mb_layout_render(layout:PMBLayout; drw:PMBDrawable; x:longint; y:longint; opts:TMBFontRenderOpts);cdecl;external libmb;

function mb_drawable_new(pixbuf:PMBPixbuf; width:longint; height:longint):PMBDrawable;cdecl;external libmb;
function mb_drawable_new_from_pixmap(pixbuf:PMBPixbuf; pxm:TPixmap):PMBDrawable;cdecl;external libmb;
procedure mb_drawable_unref(drw:PMBDrawable);cdecl;external libmb;


function mb_util_next_utf8_char(_string:PPbyte):longint;cdecl;external libmb;

function mb_col_red(col: PMBPixbufColor): byte; inline;
function mb_col_green(col: PMBPixbufColor): byte; inline;
function mb_col_blue(col: PMBPixbufColor): byte; inline;
function mb_col_alpha(col: PMBPixbufColor): byte; inline;
function mb_col_xpixel(col: PMBColor): UInt64; inline;

function mb_layout_width(l: PMBLayout): longint; inline;
function mb_layout_height(l: PMBLayout): longint; inline;
function mb_drawable_pixmap(drw: PMBDrawable): TPixmap; inline;

// === Konventiert am: 15-11-26 17:34:57 ===

implementation

function mb_col_red(col: PMBPixbufColor): byte; inline;
begin
  Result := col^.r;
end;

function mb_col_green(col: PMBPixbufColor): byte; inline;
begin
  Result := col^.g;
end;

function mb_col_blue(col: PMBPixbufColor): byte; inline;
begin
  Result := col^.b;
end;

function mb_col_alpha(col: PMBPixbufColor): byte; inline;
begin
  Result := col^.pixel;
end;

function mb_col_xpixel(col: PMBColor): UInt64;
begin
  Result := col^.xcol.pixel;
end;

function mb_layout_width(l: PMBLayout): longint; inline;
begin
  Result := l^.width;
end;

function mb_layout_height(l: PMBLayout): longint; inline;
begin
  Result := l^.height;
end;

function mb_drawable_pixmap(drw: PMBDrawable): TPixmap; inline;
begin
  Result := drw^.xpixmap;
end;
end.
