
unit mlt_animation;
interface

{
  Automatically converted by H2Pas 1.0.0 from mlt_animation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mlt_animation.h
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
Pmlt_animation_item  = ^mlt_animation_item;
Pmlt_animation_item_s  = ^mlt_animation_item_s;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_animation.h
 * \brief Property Animation class declaration
 * \see mlt_animation_s
 *
 * Copyright (C) 2004-2018 Meltytech, LLC
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
{$ifndef MLT_ANIMATION_H}
{$define MLT_ANIMATION_H}
{$include "mlt_property.h"}
{$include "mlt_types.h"}
{* \brief Animation class
 *
 * Once an animation has been constructed using mlt_properties_s, this interface
 * provides a to query and manipulate the animation except for values. One must
 * use mlt_properties_s still to get, set, and change values.
 *
 * \envvar \em MLT_ANIMATION_TIME_FORMAT the time value string format to use,
 * defaults to mlt_time_frames. Use the numeric value of mlt_time_format as
 * the value of this variable.
  }
{* \brief An animation item that represents a keyframe-property combination.  }
{*< a boolean of whether this is a key frame or an interpolated item  }
{*< the frame number for this instance of the property  }
{*< the property for this point in time  }
{*< the method of interpolation for this key frame  }
type
  Pmlt_animation_item_s = ^Tmlt_animation_item_s;
  Tmlt_animation_item_s = record
      is_key : longint;
      frame : longint;
      _property : Tmlt_property;
      keyframe_type : Tmlt_keyframe_type;
    end;


  Pmlt_animation_item = ^Tmlt_animation_item;
  Tmlt_animation_item = Pmlt_animation_item_s;
{*< pointer to an animation item  }

function mlt_animation_new:Tmlt_animation;cdecl;external;
(* Const before type ignored *)
function mlt_animation_parse(self:Tmlt_animation; data:Pchar; length:longint; fps:Tdouble; locale:Tmlt_locale_t):longint;cdecl;external;
(* Const before type ignored *)
function mlt_animation_refresh(self:Tmlt_animation; data:Pchar; length:longint):longint;cdecl;external;
function mlt_animation_get_length(self:Tmlt_animation):longint;cdecl;external;
procedure mlt_animation_set_length(self:Tmlt_animation; length:longint);cdecl;external;
(* Const before type ignored *)
function mlt_animation_parse_item(self:Tmlt_animation; item:Tmlt_animation_item; data:Pchar):longint;cdecl;external;
function mlt_animation_get_item(self:Tmlt_animation; item:Tmlt_animation_item; position:longint):longint;cdecl;external;
function mlt_animation_insert(self:Tmlt_animation; item:Tmlt_animation_item):longint;cdecl;external;
function mlt_animation_remove(self:Tmlt_animation; position:longint):longint;cdecl;external;
procedure mlt_animation_interpolate(self:Tmlt_animation);cdecl;external;
function mlt_animation_next_key(self:Tmlt_animation; item:Tmlt_animation_item; position:longint):longint;cdecl;external;
function mlt_animation_prev_key(self:Tmlt_animation; item:Tmlt_animation_item; position:longint):longint;cdecl;external;
function mlt_animation_serialize_cut_tf(self:Tmlt_animation; in:longint; out:longint; para4:Tmlt_time_format):Pchar;cdecl;external;
function mlt_animation_serialize_cut(self:Tmlt_animation; in:longint; out:longint):Pchar;cdecl;external;
function mlt_animation_serialize_tf(self:Tmlt_animation; para2:Tmlt_time_format):Pchar;cdecl;external;
function mlt_animation_serialize(self:Tmlt_animation):Pchar;cdecl;external;
function mlt_animation_key_count(self:Tmlt_animation):longint;cdecl;external;
function mlt_animation_key_get(self:Tmlt_animation; item:Tmlt_animation_item; index:longint):longint;cdecl;external;
procedure mlt_animation_close(self:Tmlt_animation);cdecl;external;
function mlt_animation_key_set_type(self:Tmlt_animation; index:longint; _type:Tmlt_keyframe_type):longint;cdecl;external;
function mlt_animation_key_set_frame(self:Tmlt_animation; index:longint; frame:longint):longint;cdecl;external;
procedure mlt_animation_shift_frames(self:Tmlt_animation; shift:longint);cdecl;external;
(* Const before type ignored *)
function mlt_animation_get_string(self:Tmlt_animation):Pchar;cdecl;external;
{$endif}

implementation


end.
