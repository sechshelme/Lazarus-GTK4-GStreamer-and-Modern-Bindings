
unit atspi_text;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_text.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_text.h
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
PAtspiRange  = ^AtspiRange;
PAtspiRect  = ^AtspiRect;
PAtspiText  = ^AtspiText;
PAtspiTextRange  = ^AtspiTextRange;
PGArray  = ^GArray;
Pgchar  = ^gchar;
PGError  = ^GError;
PGHashTable  = ^GHashTable;
Pgint  = ^gint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * AT-SPI - Assistive Technology Service Provider Interface
 * (Gnome Accessibility Project; http://developer.gnome.org/projects/gap)
 *
 * Copyright 2002 Ximian, Inc.
 *           2002 Sun Microsystems Inc.
 * Copyright 2010, 2011 Novell, Inc.
 *
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
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef _ATSPI_TEXT_H_}
{$define _ATSPI_TEXT_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}
{$include "atspi-types.h"}
type
  PAtspiRange = ^TAtspiRange;
  TAtspiRange = record
      start_offset : Tgint;
      end_offset : Tgint;
    end;

{*
 * ATSPI_TYPE_RANGE:
 *
 * The #GType for a boxed type holding a range within a text bock.
  }

function atspi_range_get_type:TGType;cdecl;external;
function atspi_range_copy(src:PAtspiRange):PAtspiRange;cdecl;external;
type
  PAtspiTextRange = ^TAtspiTextRange;
  TAtspiTextRange = record
      start_offset : Tgint;
      end_offset : Tgint;
      content : Pgchar;
    end;

{*
 * ATSPI_TYPE_TEXT_RANGE:
 *
 * The #GType for a boxed type holding a range within a text bock.
  }

{ was #define dname def_expr }
function ATSPI_TYPE_TEXT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_TEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_TEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_TEXT_GET_IFACE(obj : longint) : longint;

{ was #define dname def_expr }
function ATSPI_TYPE_RANGE : longint; { return type might be wrong }

{ was #define dname def_expr }
function ATSPI_TYPE_TEXT_RANGE : longint; { return type might be wrong }

function atspi_text_get_type:TGType;cdecl;external;
type
  PAtspiText = ^TAtspiText;
  TAtspiText = record
      parent : TGTypeInterface;
    end;


function atspi_text_range_get_type:TGType;cdecl;external;
function atspi_text_get_character_count(obj:PAtspiText; error:PPGError):Tgint;cdecl;external;
function atspi_text_get_text(obj:PAtspiText; start_offset:Tgint; end_offset:Tgint; error:PPGError):Pgchar;cdecl;external;
function atspi_text_get_caret_offset(obj:PAtspiText; error:PPGError):Tgint;cdecl;external;
{$ifndef ATSPI_DISABLE_DEPRECATED}

function atspi_text_get_attributes(obj:PAtspiText; offset:Tgint; start_offset:Pgint; end_offset:Pgint; error:PPGError):PGHashTable;cdecl;external;
{$endif}

function atspi_text_get_text_attributes(obj:PAtspiText; offset:Tgint; start_offset:Pgint; end_offset:Pgint; error:PPGError):PGHashTable;cdecl;external;
function atspi_text_get_attribute_run(obj:PAtspiText; offset:Tgint; include_defaults:Tgboolean; start_offset:Pgint; end_offset:Pgint; 
           error:PPGError):PGHashTable;cdecl;external;
{$ifndef ATSPI_DISABLE_DEPRECATED}
(* Const before type ignored *)

function atspi_text_get_attribute_value(obj:PAtspiText; offset:Tgint; attribute_name:Pgchar; error:PPGError):Pgchar;cdecl;external;
{$endif}
(* Const before type ignored *)

function atspi_text_get_text_attribute_value(obj:PAtspiText; offset:Tgint; attribute_name:Pgchar; error:PPGError):Pgchar;cdecl;external;
function atspi_text_get_default_attributes(obj:PAtspiText; error:PPGError):PGHashTable;cdecl;external;
function atspi_text_set_caret_offset(obj:PAtspiText; new_offset:Tgint; error:PPGError):Tgboolean;cdecl;external;
{$ifndef ATSPI_DISABLE_DEPRECATED}

function atspi_text_get_text_before_offset(obj:PAtspiText; offset:Tgint; _type:TAtspiTextBoundaryType; error:PPGError):PAtspiTextRange;cdecl;external;
function atspi_text_get_text_at_offset(obj:PAtspiText; offset:Tgint; _type:TAtspiTextBoundaryType; error:PPGError):PAtspiTextRange;cdecl;external;
function atspi_text_get_text_after_offset(obj:PAtspiText; offset:Tgint; _type:TAtspiTextBoundaryType; error:PPGError):PAtspiTextRange;cdecl;external;
{$endif}

function atspi_text_get_string_at_offset(obj:PAtspiText; offset:Tgint; granularity:TAtspiTextGranularity; error:PPGError):PAtspiTextRange;cdecl;external;
function atspi_text_get_character_at_offset(obj:PAtspiText; offset:Tgint; error:PPGError):Tguint;cdecl;external;
function atspi_text_get_character_extents(obj:PAtspiText; offset:Tgint; _type:TAtspiCoordType; error:PPGError):PAtspiRect;cdecl;external;
function atspi_text_get_offset_at_point(obj:PAtspiText; x:Tgint; y:Tgint; _type:TAtspiCoordType; error:PPGError):Tgint;cdecl;external;
function atspi_text_get_range_extents(obj:PAtspiText; start_offset:Tgint; end_offset:Tgint; _type:TAtspiCoordType; error:PPGError):PAtspiRect;cdecl;external;
function atspi_text_get_bounded_ranges(obj:PAtspiText; x:Tgint; y:Tgint; width:Tgint; height:Tgint; 
           _type:TAtspiCoordType; clipTypeX:TAtspiTextClipType; clipTypeY:TAtspiTextClipType; error:PPGError):PGArray;cdecl;external;
function atspi_text_get_n_selections(obj:PAtspiText; error:PPGError):Tgint;cdecl;external;
function atspi_text_get_selection(obj:PAtspiText; selection_num:Tgint; error:PPGError):PAtspiRange;cdecl;external;
function atspi_text_add_selection(obj:PAtspiText; start_offset:Tgint; end_offset:Tgint; error:PPGError):Tgboolean;cdecl;external;
function atspi_text_remove_selection(obj:PAtspiText; selection_num:Tgint; error:PPGError):Tgboolean;cdecl;external;
function atspi_text_set_selection(obj:PAtspiText; selection_num:Tgint; start_offset:Tgint; end_offset:Tgint; error:PPGError):Tgboolean;cdecl;external;
function atspi_text_scroll_substring_to(obj:PAtspiText; start_offset:Tgint; end_offset:Tgint; _type:TAtspiScrollType; error:PPGError):Tgboolean;cdecl;external;
function atspi_text_scroll_substring_to_point(obj:PAtspiText; start_offset:Tgint; end_offset:Tgint; coords:TAtspiCoordType; x:Tgint; 
           y:Tgint; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ _ATSPI_TEXT_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_TEXT : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_TEXT:=atspi_text_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_TEXT(obj : longint) : longint;
begin
  ATSPI_TEXT:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_TEXT,AtspiText);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_TEXT(obj : longint) : longint;
begin
  ATSPI_IS_TEXT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_TEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_TEXT_GET_IFACE(obj : longint) : longint;
begin
  ATSPI_TEXT_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,ATSPI_TYPE_TEXT,AtspiText);
end;

{ was #define dname def_expr }
function ATSPI_TYPE_RANGE : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_RANGE:=atspi_range_get_type;
  end;

{ was #define dname def_expr }
function ATSPI_TYPE_TEXT_RANGE : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_TEXT_RANGE:=atspi_text_range_get_type;
  end;


end.
