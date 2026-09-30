
unit mlt_properties;
interface

{
  Automatically converted by H2Pas 1.0.0 from mlt_properties.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mlt_properties.h
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
PFILE  = ^FILE;
Plongint  = ^longint;
Pmlt_properties_s  = ^mlt_properties_s;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_properties.h
 * \brief Properties class declaration
 * \see mlt_properties_s
 *
 * Copyright (C) 2003-2022 Meltytech, LLC
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
{$ifndef MLT_PROPERTIES_H}
{$define MLT_PROPERTIES_H}
{$include "mlt_events.h"}
{$include "mlt_types.h"}
{$include <stdio.h>}
{* \brief Properties class
 *
 * Properties is a combination list/dictionary of name/::mlt_property pairs.
 * It is also a base class for many of the other MLT classes.
 *
 * \event \em property-changed a property's value changed;
 *   the event data is a string for the name of the property
  }
{*< \private the object of a subclass  }
{*< \private instance object  }
{* the destructor virtual function  }
{*< the object supplied to the close virtual function  }
type
  Pmlt_properties_s = ^Tmlt_properties_s;
  Tmlt_properties_s = record
      child : pointer;
      local : pointer;
      close : Tmlt_destructor;
      close_object : pointer;
    end;


function mlt_properties_init(para1:Tmlt_properties; child:pointer):longint;cdecl;external;
function mlt_properties_new:Tmlt_properties;cdecl;external;
(* Const before type ignored *)
function mlt_properties_set_lcnumeric(para1:Tmlt_properties; locale:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_get_lcnumeric(self:Tmlt_properties):Pchar;cdecl;external;
(* Const before type ignored *)
function mlt_properties_load(file:Pchar):Tmlt_properties;cdecl;external;
(* Const before type ignored *)
function mlt_properties_preset(self:Tmlt_properties; name:Pchar):longint;cdecl;external;
function mlt_properties_inc_ref(self:Tmlt_properties):longint;cdecl;external;
function mlt_properties_dec_ref(self:Tmlt_properties):longint;cdecl;external;
function mlt_properties_ref_count(self:Tmlt_properties):longint;cdecl;external;
procedure mlt_properties_mirror(self:Tmlt_properties; that:Tmlt_properties);cdecl;external;
function mlt_properties_inherit(self:Tmlt_properties; that:Tmlt_properties):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_copy(self:Tmlt_properties; that:Tmlt_properties; prefix:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_pass(self:Tmlt_properties; that:Tmlt_properties; prefix:Pchar):longint;cdecl;external;
(* Const before type ignored *)
procedure mlt_properties_pass_property(self:Tmlt_properties; that:Tmlt_properties; name:Pchar);cdecl;external;
(* Const before type ignored *)
function mlt_properties_pass_list(self:Tmlt_properties; that:Tmlt_properties; list:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mlt_properties_set(self:Tmlt_properties; name:Pchar; value:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mlt_properties_set_or_default(self:Tmlt_properties; name:Pchar; value:Pchar; def:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mlt_properties_set_string(self:Tmlt_properties; name:Pchar; value:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_parse(self:Tmlt_properties; namevalue:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_get(self:Tmlt_properties; name:Pchar):Pchar;cdecl;external;
function mlt_properties_get_name(self:Tmlt_properties; index:longint):Pchar;cdecl;external;
function mlt_properties_get_value_tf(self:Tmlt_properties; index:longint; para3:Tmlt_time_format):Pchar;cdecl;external;
function mlt_properties_get_value(self:Tmlt_properties; index:longint):Pchar;cdecl;external;
function mlt_properties_get_data_at(self:Tmlt_properties; index:longint; size:Plongint):pointer;cdecl;external;
(* Const before type ignored *)
function mlt_properties_get_int(self:Tmlt_properties; name:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_set_int(self:Tmlt_properties; name:Pchar; value:longint):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_get_int64(self:Tmlt_properties; name:Pchar):Tint64_t;cdecl;external;
(* Const before type ignored *)
function mlt_properties_set_int64(self:Tmlt_properties; name:Pchar; value:Tint64_t):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_get_double(self:Tmlt_properties; name:Pchar):Tdouble;cdecl;external;
(* Const before type ignored *)
function mlt_properties_set_double(self:Tmlt_properties; name:Pchar; value:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_get_position(self:Tmlt_properties; name:Pchar):Tmlt_position;cdecl;external;
(* Const before type ignored *)
function mlt_properties_set_position(self:Tmlt_properties; name:Pchar; value:Tmlt_position):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_set_data(self:Tmlt_properties; name:Pchar; value:pointer; length:longint; para5:Tmlt_destructor; 
           para6:Tmlt_serialiser):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_get_data(self:Tmlt_properties; name:Pchar; length:Plongint):pointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mlt_properties_rename(self:Tmlt_properties; source:Pchar; dest:Pchar):longint;cdecl;external;
function mlt_properties_count(self:Tmlt_properties):longint;cdecl;external;
procedure mlt_properties_dump(self:Tmlt_properties; output:PFILE);cdecl;external;
(* Const before type ignored *)
procedure mlt_properties_debug(self:Tmlt_properties; title:Pchar; output:PFILE);cdecl;external;
(* Const before type ignored *)
function mlt_properties_save(para1:Tmlt_properties; para2:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mlt_properties_dir_list(para1:Tmlt_properties; para2:Pchar; para3:Pchar; para4:longint):longint;cdecl;external;
procedure mlt_properties_close(self:Tmlt_properties);cdecl;external;
function mlt_properties_is_sequence(self:Tmlt_properties):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_parse_yaml(file:Pchar):Tmlt_properties;cdecl;external;
function mlt_properties_serialise_yaml(self:Tmlt_properties):Pchar;cdecl;external;
procedure mlt_properties_lock(self:Tmlt_properties);cdecl;external;
procedure mlt_properties_unlock(self:Tmlt_properties);cdecl;external;
(* Const before type ignored *)
procedure mlt_properties_clear(self:Tmlt_properties; name:Pchar);cdecl;external;
(* Const before type ignored *)
function mlt_properties_exists(self:Tmlt_properties; name:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_get_time(para1:Tmlt_properties; name:Pchar; para3:Tmlt_time_format):Pchar;cdecl;external;
function mlt_properties_frames_to_time(para1:Tmlt_properties; para2:Tmlt_position; para3:Tmlt_time_format):Pchar;cdecl;external;
(* Const before type ignored *)
function mlt_properties_time_to_frames(para1:Tmlt_properties; time:Pchar):Tmlt_position;cdecl;external;
(* Const before type ignored *)
function mlt_properties_set_color(para1:Tmlt_properties; name:Pchar; value:Tmlt_color):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_get_color(para1:Tmlt_properties; name:Pchar):Tmlt_color;cdecl;external;
(* Const before type ignored *)
function mlt_properties_anim_set_color(self:Tmlt_properties; name:Pchar; value:Tmlt_color; position:longint; length:longint; 
           keyframe_type:Tmlt_keyframe_type):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_anim_get_color(self:Tmlt_properties; name:Pchar; position:longint; length:longint):Tmlt_color;cdecl;external;
(* Const before type ignored *)
function mlt_properties_anim_get(self:Tmlt_properties; name:Pchar; position:longint; length:longint):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mlt_properties_anim_set(self:Tmlt_properties; name:Pchar; value:Pchar; position:longint; length:longint):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_anim_get_int(self:Tmlt_properties; name:Pchar; position:longint; length:longint):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_anim_set_int(self:Tmlt_properties; name:Pchar; value:longint; position:longint; length:longint; 
           keyframe_type:Tmlt_keyframe_type):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_anim_get_double(self:Tmlt_properties; name:Pchar; position:longint; length:longint):Tdouble;cdecl;external;
(* Const before type ignored *)
function mlt_properties_anim_set_double(self:Tmlt_properties; name:Pchar; value:Tdouble; position:longint; length:longint; 
           keyframe_type:Tmlt_keyframe_type):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_get_animation(self:Tmlt_properties; name:Pchar):Tmlt_animation;cdecl;external;
(* Const before type ignored *)
function mlt_properties_is_anim(self:Tmlt_properties; name:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_set_rect(self:Tmlt_properties; name:Pchar; value:Tmlt_rect):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_get_rect(self:Tmlt_properties; name:Pchar):Tmlt_rect;cdecl;external;
(* Const before type ignored *)
function mlt_properties_anim_set_rect(self:Tmlt_properties; name:Pchar; value:Tmlt_rect; position:longint; length:longint; 
           keyframe_type:Tmlt_keyframe_type):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_anim_get_rect(self:Tmlt_properties; name:Pchar; position:longint; length:longint):Tmlt_rect;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mlt_properties_from_utf8(properties:Tmlt_properties; name_from:Pchar; name_to:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mlt_properties_to_utf8(properties:Tmlt_properties; name_from:Pchar; name_to:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_set_properties(self:Tmlt_properties; name:Pchar; properties:Tmlt_properties):longint;cdecl;external;
(* Const before type ignored *)
function mlt_properties_get_properties(self:Tmlt_properties; name:Pchar):Tmlt_properties;cdecl;external;
function mlt_properties_get_properties_at(self:Tmlt_properties; index:longint):Tmlt_properties;cdecl;external;
{$endif}

implementation


end.
