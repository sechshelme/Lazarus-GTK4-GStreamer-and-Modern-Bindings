
unit mlt_property;
interface

{
  Automatically converted by H2Pas 1.0.0 from mlt_property.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mlt_property.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Plongint  = ^longint;
Pmlt_locale_t  = ^mlt_locale_t;
Pmlt_property  = ^mlt_property;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_property.h
 * \brief Property class declaration
 * \see mlt_property_s
 *
 * Copyright (C) 2003-2023 Meltytech, LLC
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
  }
{$ifndef MLT_PROPERTY_H}
{$define MLT_PROPERTY_H}
{$include "mlt_types.h"}
{$if defined(__FreeBSD__)}
{ This header has existed since 1994 and defines __FreeBSD_version below.  }
{$include <sys/param.h>}
{$endif}
{$if (defined(__linux__) && !defined(__APPLE__))}
{$include <locale.h>}
type
  Pmlt_locale_t = ^Tmlt_locale_t;
  Tmlt_locale_t = Tlocale_t;
(*** was #elif ****){$else defined(__APPLE__) || (defined(__FreeBSD_version) && __FreeBSD_version >= 900506)}
{$include <xlocale.h>}
type
  Pmlt_locale_t = ^Tmlt_locale_t;
  Tmlt_locale_t = Tlocale_t;
(*** was #elif ****){$else defined(__OpenBSD__)}
{ XXX matches __nop_locale glue in libc++  }
type
  Pmlt_locale_t = ^Tmlt_locale_t;
  Tmlt_locale_t = pointer;
{$else}
type
  Pmlt_locale_t = ^Tmlt_locale_t;
  Tmlt_locale_t = Pchar;
{$endif}

function mlt_property_init:Tmlt_property;cdecl;external;
procedure mlt_property_clear(self:Tmlt_property);cdecl;external;
function mlt_property_is_clear(self:Tmlt_property):longint;cdecl;external;
function mlt_property_set_int(self:Tmlt_property; value:longint):longint;cdecl;external;
function mlt_property_set_double(self:Tmlt_property; value:Tdouble):longint;cdecl;external;
function mlt_property_set_position(self:Tmlt_property; value:Tmlt_position):longint;cdecl;external;
function mlt_property_set_int64(self:Tmlt_property; value:Tint64_t):longint;cdecl;external;
(* Const before type ignored *)
function mlt_property_set_string(self:Tmlt_property; value:Pchar):longint;cdecl;external;
function mlt_property_set_data(self:Tmlt_property; value:pointer; length:longint; destructor:Tmlt_destructor; serialiser:Tmlt_serialiser):longint;cdecl;external;
function mlt_property_get_int(self:Tmlt_property; fps:Tdouble; para3:Tmlt_locale_t):longint;cdecl;external;
function mlt_property_get_double(self:Tmlt_property; fps:Tdouble; para3:Tmlt_locale_t):Tdouble;cdecl;external;
function mlt_property_get_position(self:Tmlt_property; fps:Tdouble; para3:Tmlt_locale_t):Tmlt_position;cdecl;external;
function mlt_property_get_int64(self:Tmlt_property):Tint64_t;cdecl;external;
function mlt_property_get_string_tf(self:Tmlt_property; para2:Tmlt_time_format):Pchar;cdecl;external;
function mlt_property_get_string(self:Tmlt_property):Pchar;cdecl;external;
function mlt_property_get_string_l_tf(self:Tmlt_property; para2:Tmlt_locale_t; para3:Tmlt_time_format):Pchar;cdecl;external;
function mlt_property_get_string_l(self:Tmlt_property; para2:Tmlt_locale_t):Pchar;cdecl;external;
function mlt_property_get_data(self:Tmlt_property; length:Plongint):pointer;cdecl;external;
procedure mlt_property_close(self:Tmlt_property);cdecl;external;
procedure mlt_property_pass(self:Tmlt_property; that:Tmlt_property);cdecl;external;
function mlt_property_get_time(self:Tmlt_property; para2:Tmlt_time_format; fps:Tdouble; para4:Tmlt_locale_t):Pchar;cdecl;external;
function mlt_property_interpolate(self:Tmlt_property; points:Pmlt_property; progress:Tdouble; fps:Tdouble; locale:Tmlt_locale_t; 
           interp:Tmlt_keyframe_type):longint;cdecl;external;
function mlt_property_anim_get_double(self:Tmlt_property; fps:Tdouble; locale:Tmlt_locale_t; position:longint; length:longint):Tdouble;cdecl;external;
function mlt_property_anim_get_int(self:Tmlt_property; fps:Tdouble; locale:Tmlt_locale_t; position:longint; length:longint):longint;cdecl;external;
function mlt_property_anim_get_string(self:Tmlt_property; fps:Tdouble; locale:Tmlt_locale_t; position:longint; length:longint):Pchar;cdecl;external;
function mlt_property_anim_set_double(self:Tmlt_property; value:Tdouble; fps:Tdouble; locale:Tmlt_locale_t; position:longint; 
           length:longint; keyframe_type:Tmlt_keyframe_type):longint;cdecl;external;
function mlt_property_anim_set_int(self:Tmlt_property; value:longint; fps:Tdouble; locale:Tmlt_locale_t; position:longint; 
           length:longint; keyframe_type:Tmlt_keyframe_type):longint;cdecl;external;
(* Const before type ignored *)
function mlt_property_anim_set_string(self:Tmlt_property; value:Pchar; fps:Tdouble; locale:Tmlt_locale_t; position:longint; 
           length:longint):longint;cdecl;external;
function mlt_property_get_animation(self:Tmlt_property):Tmlt_animation;cdecl;external;
function mlt_property_is_anim(self:Tmlt_property):longint;cdecl;external;
function mlt_property_set_color(self:Tmlt_property; value:Tmlt_color):longint;cdecl;external;
function mlt_property_get_color(self:Tmlt_property; fps:Tdouble; locale:Tmlt_locale_t):Tmlt_color;cdecl;external;
function mlt_property_anim_set_color(self:Tmlt_property; value:Tmlt_color; fps:Tdouble; locale:Tmlt_locale_t; position:longint; 
           length:longint; keyframe_type:Tmlt_keyframe_type):longint;cdecl;external;
function mlt_property_anim_get_color(self:Tmlt_property; fps:Tdouble; locale:Tmlt_locale_t; position:longint; length:longint):Tmlt_color;cdecl;external;
function mlt_property_set_rect(self:Tmlt_property; value:Tmlt_rect):longint;cdecl;external;
function mlt_property_get_rect(self:Tmlt_property; locale:Tmlt_locale_t):Tmlt_rect;cdecl;external;
function mlt_property_anim_set_rect(self:Tmlt_property; value:Tmlt_rect; fps:Tdouble; locale:Tmlt_locale_t; position:longint; 
           length:longint; keyframe_type:Tmlt_keyframe_type):longint;cdecl;external;
function mlt_property_anim_get_rect(self:Tmlt_property; fps:Tdouble; locale:Tmlt_locale_t; position:longint; length:longint):Tmlt_rect;cdecl;external;
function mlt_property_set_properties(self:Tmlt_property; properties:Tmlt_properties):longint;cdecl;external;
function mlt_property_get_properties(self:Tmlt_property):Tmlt_properties;cdecl;external;
function mlt_property_is_color(self:Tmlt_property):longint;cdecl;external;
function mlt_property_is_numeric(self:Tmlt_property; locale:Tmlt_locale_t):longint;cdecl;external;
function mlt_property_is_rect(self:Tmlt_property):longint;cdecl;external;
{$endif}

implementation


end.
