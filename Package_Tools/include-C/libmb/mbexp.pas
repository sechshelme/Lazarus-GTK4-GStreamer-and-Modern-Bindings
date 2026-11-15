unit mbexp;

interface

uses
  fp_mb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ libmb
 * Copyright (C) 2002 Matthew Allum
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{ 
 * XXXXXXXXX WARNING XXXXXXXXXXXX
 *
 * mbexp contains experimetal unstable code that is subject to
 * constant change and therefore USE AT YOUR OWN RISK. 
 *
 * XXXXXXXXX WARNING XXXXXXXXXXXX
  }
{$ifndef _MB_EXP_H_}
{$define _MB_EXP_H_}
{$include <libmb/mbconfig.h>}
{$include <libmb/mbpixbuf.h>}
{$include <libmb/mbdotdesktop.h>}
{$ifdef USE_XFT}
{$include <X11/Xft/Xft.h>}
{$include <locale.h>}
{$include <langinfo.h>}
{$endif}
{$ifdef USE_PANGO}
{$include <pango/pango.h>}
{$include <pango/pangoxft.h>}
{$endif}
{ C++ extern C conditionnal removed }
{*
 * @defgroup MBFont MBFont - Simple font abstraction and rendering tools
 * @brief mbpixbuf contains simple image manipulation and composition 
 * functions for client side images.
 *
 *
 *
 * @
  }
{*
 * @typedef MBColor
 *
 * 
 *
 * Its not recommended you touch structure internals directly. 
  }
{$if defined (USE_XFT) || defined (USE_PANGO)}
{$endif}
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
{*
 * @typedef MBFont
 *
 * 
 *
 * Its not recommended you touch structure internals directly. 
  }
{ A *little* hakkie  }
{$ifdef USE_PANGO}
(*** was #elif ****){$else defined (USE_XFT)}
{$else}
{$endif}
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
      font : PXftFont;
      gc : TGC;
      font : PXFontStruct;
      _have_fresh_font_object : TBool;
      ref_cnt : longint;
    end;
{*
 * @typedef MBEncoding
 *
 * enumerated types for text encodings
  }

  PMBEncoding = ^TMBEncoding;
  TMBEncoding =  Longint;
  Const
    MB_ENCODING_LATIN = 0;
    MB_ENCODING_UTF8 = 1;
;
{*
 * @typedef MBFontWeight
 *
 * enumerated types for font weights.
  }
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
;
{*
 * @typedef MBFontSlant
 *
 * enumerated types for font slant styles
  }
type
  PMBFontSlant = ^TMBFontSlant;
  TMBFontSlant =  Longint;
  Const
    MB_ROMAN = 0;
    MB_ITALIC = 1;
    MB_OBLIQUE = 2;
    MB_N_SLANTS = 3;
;
{*
 * @typedef MBFontRenderOpts
 *
 * Option flags for text rendering
  }
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
;
{*
 * @typedef MBDrawable
 *
 * Type for representing an mbdrawable. This basically
 * wraps X pixmaps and Xft Drawables 
 *
 * Its not recommended you touch this directly. 
  }
{$if defined (USE_XFT) || defined (USE_PANGO)}
{$endif}
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
{*
 * @typedef MBLayout
 *
 * Experimental and therefore not as yet documented
 *
 * Its not recommended you touch this directly. 
  }

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
{ Color  }
{*
 * Constructs a new MBColor from a string specification
 * 
 * The format of the specification can be a color name
 * or the format '#rrggbb[aa]'
 *
 * @param pb MBPixbuf reference
 * @param spec 
 * @returns a MBColor object or NULL on failure.
  }

function mb_col_new_from_spec(pb:PMBPixbuf; spec:Pchar):PMBColor;cdecl;external libmb;
{*
 * Sets an existing MBColor from a string specification
 * 
 * The format of the specification can be a color name
 * or the format '#rrggbb[aa]'
 *
 * @param col  MBColor object to modify 
 * @param spec New Color specification
 * @returns True or False on failure.
  }
function mb_col_set(col:PMBColor; spec:Pchar):TBool;cdecl;external libmb;
{*
 * Sets an existing MBColor from r,g,b,a values
 * 
 *
 * @param col MBColor object to modify 
 * @param red red component
 * @param green green component
 * @param blue blue component
 * @param alpha alpha component
  }
procedure mb_col_set_rgba(col:PMBColor; red:byte; green:byte; blue:byte; alpha:byte);cdecl;external libmb;
{*
 * Gets an r,g,b,a values from an existing MBColor
 * 
 *
 * @param col MBColor object to query
 * @param red red component
 * @param green green component
 * @param blue blue component
 * @param alpha alpha component
  }
procedure mb_col_get_rgba(col:PMBColor; red:Pbyte; green:Pbyte; blue:Pbyte; alpha:Pbyte);cdecl;external libmb;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_col_red(col : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_col_green(col : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_col_blue(col : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_col_alpha(col : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_col_xpixel(col : longint) : longint;

{ FIXME: need mb_col_ref func  }
{*
 * Unrefs ( frees ) a created MBColor object.
 *
 * @param col MBColor object to unref
  }
procedure mb_col_unref(col:PMBColor);cdecl;external libmb;
{ Fonts  }
{*
 * Constructs a new MBFont instance
 *
 * @param dpy X Display
 * @param family font family name or NULL
 * @returns a MBFont object or NULL on failure.
  }
function mb_font_new(dpy:PDisplay; family:Pchar):PMBFont;cdecl;external libmb;
{*
 * Refs a created MBFont object.
 *
 * @param font MBFont object to unref
  }
procedure mb_font_ref(font:PMBFont);cdecl;external libmb;
{*
 * Unrefs ( frees ) a created MBColor object.
 *
 * @param font MBFont object to unref
  }
procedure mb_font_unref(font:PMBFont);cdecl;external libmb;
{*
 * Constructs a new MBFont instance
 *
 * @param dpy X Display
 * @param spec A description of the font. 
 *             This will take Gtk2 style font descriptions or Xft style ones
 * @returns a MBFont object or NULL on failure.
  }
function mb_font_new_from_string(dpy:PDisplay; spec:Pchar):PMBFont;cdecl;external libmb;
{*
 * Sets the font propertys from a textual description
 *
 * @param font the font to alter
 * @param spec A description of the font. 
 *             This will take Gtk2 style font descriptions or Xft style ones
 * @returns the MBFont object
  }
function mb_font_set_from_string(font:PMBFont; spec:Pchar):PMBFont;cdecl;external libmb;
{*
 * Sets the fonts family.
 *
 * @param font the font to alter
 * @param family font family name
  }
procedure mb_font_set_family(font:PMBFont; family:Pchar);cdecl;external libmb;
{*
 * Gets the fonts family.
 *
 * @param font The font to query
 * @returns font family name
  }
function mb_font_get_family(font:PMBFont):Pchar;cdecl;external libmb;
{ FIXME: what is this ?  }
function mb_font_get(font:PMBFont):Pchar;cdecl;external libmb;
{*
 * Sets the fonts weight.
 *
 * @param font The font to alter
 * @param weight The requested font weight
  }
procedure mb_font_set_weight(font:PMBFont; weight:TMBFontWeight);cdecl;external libmb;
{*
 * Gets the fonts weight.
 *
 * @param font The font to query
 * @returns The font weight
  }
function mb_font_get_weight(font:PMBFont):TMBFontWeight;cdecl;external libmb;
{*
 * Sets the fonts slant.
 *
 * @param font The font to alter
 * @param slant The requested font slant
  }
procedure mb_font_set_slant(font:PMBFont; slant:TMBFontSlant);cdecl;external libmb;
{ FIXME: need mb_font_get_slant()  }
{*
 * Sets the fonts size.
 *
 * @param font The font to alter
 * @param points requested size in points
  }
procedure mb_font_set_point_size(font:PMBFont; points:longint);cdecl;external libmb;
{*
 * Gets the fonts point size.
 *
 * @param font The font to query
 * @returns The font point size
  }
function mb_font_get_point_size(font:PMBFont):longint;cdecl;external libmb;
{*
 * Attempts to fit the point size to a pixel size
 *
 * @param font The font to alter
 * @param max_pixels Pixel size to fit to
 * @param points_to_try a list on point sizes to try or NULL ( to use default values )
 * @returns 1 on a successful fit, 0 on failure. 
  }
function mb_font_set_size_to_pixels(font:PMBFont; max_pixels:longint; points_to_try:Plongint):longint;cdecl;external libmb;
{*
 * Sets the fonts color.
 * *Note* you must set a fonts color for it to be rendered 
 * - there is no default.
 *
 * @param font The font to alter
 * @param col The requested color.
  }
procedure mb_font_set_color(font:PMBFont; col:PMBColor);cdecl;external libmb;
{*
 * Gets the fonts point size.
 *
 * @param font The font to query
 * @returns The fonts color 
  }
function mb_font_get_color(font:PMBFont):PMBColor;cdecl;external libmb;
{ FIXME: encoding param should be enum  }
function mb_font_get_txt_width(font:PMBFont; txt:Pbyte; byte_len:longint; encoding:longint):longint;cdecl;external libmb;
{*
 * Gets the fonts height in pixels
 *
 * @param font The font to query
 * @returns The font height in pixels
  }
function mb_font_get_height(font:PMBFont):longint;cdecl;external libmb;
{*
 * Gets the fonts ascent in pixels
 *
 * @param font The font to query
 * @returns The font ascent in pixels
  }
function mb_font_get_ascent(font:PMBFont):longint;cdecl;external libmb;
{*
 * Gets the fonts descent in pixels
 *
 * @param font The font to query
 * @returns The font descent in pixels
  }
function mb_font_get_descent(font:PMBFont):longint;cdecl;external libmb;
{*
 * Renders a line of text onto a MBDrawable
 *
 * @param font The font to render
 * @param drw  The MBDrawable to render too
 * @param x    The X position on MBDrawable to render too
 * @param y    The Y position on MBDrawable to render too
 * @param width The maximum width in pixels to render
 * @param text The text to render.
 * @param encoding the encoding of the text to render
 * @param opts Or'd #MBFontRenderOpts
 * @returns The number of glyths rendered
  }
function mb_font_render_simple(font:PMBFont; drw:PMBDrawable; x:longint; y:longint; width:longint; 
           text:Pbyte; encoding:longint; opts:TMBFontRenderOpts):longint;cdecl;external libmb;
{*
 * Returns the width in pixels of any text rendered with
 * #mb_font_render_simple, taking into account any clipping.
 * 
 * @param font The font to render
 * @param width The maximum width in pixels to render
 * @param text The text to render.
 * @param encoding the encoding of the text to render
 * @param opts Or'd #MBFontRenderOpts
 * @returns The width in pixels
  }
function mb_font_render_simple_get_width(font:PMBFont; width:longint; text:Pbyte; encoding:longint; opts:TMBFontRenderOpts):longint;cdecl;external libmb;
{ Layout stuff 
 *
 * XXX: This stuff is experimental, subject to change and shouldn't 
 *      really be used as yet unless you really know what you doing.
 *
  }
function mb_layout_new:PMBLayout;cdecl;external libmb;
procedure mb_layout_unref(layout:PMBLayout);cdecl;external libmb;
procedure mb_layout_set_font(layout:PMBLayout; font:PMBFont);cdecl;external libmb;
{ If layout not set size is autocalculated  }
procedure mb_layout_set_geometry(layout:PMBLayout; width:longint; height:longint);cdecl;external libmb;
procedure mb_layout_get_geometry(layout:PMBLayout; width:Plongint; height:Plongint);cdecl;external libmb;
{ call set text, then get geometry for the space it takes up  }
procedure mb_layout_set_text(layout:PMBLayout; text:Pbyte; encoding:TMBEncoding);cdecl;external libmb;
{ XXX plus text len ?  }
procedure mb_layout_destroy(layout:PMBLayout);cdecl;external libmb;
procedure mb_layout_set_multiline(layout:PMBLayout; want_multiline:TBool);cdecl;external libmb;
procedure mb_layout_set_align(layout:PMBLayout; horizontal:longint; vertical:longint);cdecl;external libmb;
{ dots, word, letter, none   }
procedure mb_layout_set_clip_style(layout:PMBLayout; clip_stype:longint);cdecl;external libmb;
procedure mb_layout_render(layout:PMBLayout; drw:PMBDrawable; x:longint; y:longint; opts:TMBFontRenderOpts);cdecl;external libmb;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_layout_width(l : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_layout_height(l : longint) : longint;

{ Drawables  }
{*
 * Creates a new MBDrawable instance. MBDrawables are what MBfonts get 
 * rendered too.  
 *
 * @param pixbuf A MBPixbuf Instance. 
 * @param width  Width of requested drawable. 
 * @param height Height of requested drawable. 
 * @returns A MBDrawable Instance
  }
function mb_drawable_new(pixbuf:PMBPixbuf; width:longint; height:longint):PMBDrawable;cdecl;external libmb;
{*
 * Creates a new MBDrawable instance from a pre-existing pixmap. 
 * Note, if created like this you are responsable for freeing the
 *       the drawables pixmap
 *
 * @param pixbuf A MBPixbuf Instance. 
 * @param pxm the pixmap to create the drawable from
 * @returns A MBDrawable Instance
  }
function mb_drawable_new_from_pixmap(pixbuf:PMBPixbuf; pxm:TPixmap):PMBDrawable;cdecl;external libmb;
{*
 * Unrefs ( frees ) a drawable
 *
 * @param drw MBDrawable to unref
 * 
  }
procedure mb_drawable_unref(drw:PMBDrawable);cdecl;external libmb;
{*
 * @def mb_drawable_pixmap 
 *
 * Returns a drawables X pixmap
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_drawable_pixmap(drw : longint) : longint;

{ FIXME: document  }
function mb_util_next_utf8_char(_string:PPbyte):longint;cdecl;external libmb;
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 15-11-26 17:34:57 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_col_red(col : longint) : longint;
begin
  mb_col_red:=col^.r;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_col_green(col : longint) : longint;
begin
  mb_col_green:=col^.g;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_col_blue(col : longint) : longint;
begin
  mb_col_blue:=col^.b;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_col_alpha(col : longint) : longint;
begin
  mb_col_alpha:=col^.a;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_col_xpixel(col : longint) : longint;
begin
  mb_col_xpixel:=col^.(xcol.pixel);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_layout_width(l : longint) : longint;
begin
  mb_layout_width:=l^.width;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_layout_height(l : longint) : longint;
begin
  mb_layout_height:=l^.height;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_drawable_pixmap(drw : longint) : longint;
begin
  mb_drawable_pixmap:=drw^.xpixmap;
end;


end.
