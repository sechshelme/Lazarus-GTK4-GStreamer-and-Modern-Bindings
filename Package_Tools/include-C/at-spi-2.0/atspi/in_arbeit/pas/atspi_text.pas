unit atspi_text;

interface

uses
  fp_glib2, fp_atspi;

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

function atspi_range_get_type:TGType;cdecl;external libatspi;
function atspi_range_copy(src:PAtspiRange):PAtspiRange;cdecl;external libatspi;
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
function ATSPI_TYPE_RANGE : longint; { return type might be wrong }

{ was #define dname def_expr }
function ATSPI_TYPE_TEXT_RANGE : longint; { return type might be wrong }

function atspi_text_get_type:TGType;cdecl;external libatspi;
type
  PAtspiText = ^TAtspiText;
  TAtspiText = record
      parent : TGTypeInterface;
    end;


function atspi_text_range_get_type:TGType;cdecl;external libatspi;
function atspi_text_get_character_count(obj:PAtspiText; error:PPGError):Tgint;cdecl;external libatspi;
function atspi_text_get_text(obj:PAtspiText; start_offset:Tgint; end_offset:Tgint; error:PPGError):Pgchar;cdecl;external libatspi;
function atspi_text_get_caret_offset(obj:PAtspiText; error:PPGError):Tgint;cdecl;external libatspi;
{$ifndef ATSPI_DISABLE_DEPRECATED}

function atspi_text_get_attributes(obj:PAtspiText; offset:Tgint; start_offset:Pgint; end_offset:Pgint; error:PPGError):PGHashTable;cdecl;external libatspi;
{$endif}

function atspi_text_get_text_attributes(obj:PAtspiText; offset:Tgint; start_offset:Pgint; end_offset:Pgint; error:PPGError):PGHashTable;cdecl;external libatspi;
function atspi_text_get_attribute_run(obj:PAtspiText; offset:Tgint; include_defaults:Tgboolean; start_offset:Pgint; end_offset:Pgint; 
           error:PPGError):PGHashTable;cdecl;external libatspi;
{$ifndef ATSPI_DISABLE_DEPRECATED}

function atspi_text_get_attribute_value(obj:PAtspiText; offset:Tgint; attribute_name:Pgchar; error:PPGError):Pgchar;cdecl;external libatspi;
{$endif}

function atspi_text_get_text_attribute_value(obj:PAtspiText; offset:Tgint; attribute_name:Pgchar; error:PPGError):Pgchar;cdecl;external libatspi;
function atspi_text_get_default_attributes(obj:PAtspiText; error:PPGError):PGHashTable;cdecl;external libatspi;
function atspi_text_set_caret_offset(obj:PAtspiText; new_offset:Tgint; error:PPGError):Tgboolean;cdecl;external libatspi;
{$ifndef ATSPI_DISABLE_DEPRECATED}

function atspi_text_get_text_before_offset(obj:PAtspiText; offset:Tgint; _type:TAtspiTextBoundaryType; error:PPGError):PAtspiTextRange;cdecl;external libatspi;
function atspi_text_get_text_at_offset(obj:PAtspiText; offset:Tgint; _type:TAtspiTextBoundaryType; error:PPGError):PAtspiTextRange;cdecl;external libatspi;
function atspi_text_get_text_after_offset(obj:PAtspiText; offset:Tgint; _type:TAtspiTextBoundaryType; error:PPGError):PAtspiTextRange;cdecl;external libatspi;
{$endif}

function atspi_text_get_string_at_offset(obj:PAtspiText; offset:Tgint; granularity:TAtspiTextGranularity; error:PPGError):PAtspiTextRange;cdecl;external libatspi;
function atspi_text_get_character_at_offset(obj:PAtspiText; offset:Tgint; error:PPGError):Tguint;cdecl;external libatspi;
function atspi_text_get_character_extents(obj:PAtspiText; offset:Tgint; _type:TAtspiCoordType; error:PPGError):PAtspiRect;cdecl;external libatspi;
function atspi_text_get_offset_at_point(obj:PAtspiText; x:Tgint; y:Tgint; _type:TAtspiCoordType; error:PPGError):Tgint;cdecl;external libatspi;
function atspi_text_get_range_extents(obj:PAtspiText; start_offset:Tgint; end_offset:Tgint; _type:TAtspiCoordType; error:PPGError):PAtspiRect;cdecl;external libatspi;
function atspi_text_get_bounded_ranges(obj:PAtspiText; x:Tgint; y:Tgint; width:Tgint; height:Tgint; 
           _type:TAtspiCoordType; clipTypeX:TAtspiTextClipType; clipTypeY:TAtspiTextClipType; error:PPGError):PGArray;cdecl;external libatspi;
function atspi_text_get_n_selections(obj:PAtspiText; error:PPGError):Tgint;cdecl;external libatspi;
function atspi_text_get_selection(obj:PAtspiText; selection_num:Tgint; error:PPGError):PAtspiRange;cdecl;external libatspi;
function atspi_text_add_selection(obj:PAtspiText; start_offset:Tgint; end_offset:Tgint; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_text_remove_selection(obj:PAtspiText; selection_num:Tgint; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_text_set_selection(obj:PAtspiText; selection_num:Tgint; start_offset:Tgint; end_offset:Tgint; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_text_scroll_substring_to(obj:PAtspiText; start_offset:Tgint; end_offset:Tgint; _type:TAtspiScrollType; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_text_scroll_substring_to_point(obj:PAtspiText; start_offset:Tgint; end_offset:Tgint; coords:TAtspiCoordType; x:Tgint; 
           y:Tgint; error:PPGError):Tgboolean;cdecl;external libatspi;
{$endif}
{ _ATSPI_TEXT_H_  }

// === Konventiert am: 26-9-26 13:15:05 ===

function ATSPI_TYPE_TEXT : TGType;
function ATSPI_TEXT(obj : Pointer) : PAtspiText;
function ATSPI_IS_TEXT(obj : Pointer) : Tgboolean;
function ATSPI_TEXT_GET_IFACE(obj : Pointer) : PAtspiText;

implementation

function ATSPI_TYPE_TEXT : TGType;
  begin
    ATSPI_TYPE_TEXT:=atspi_text_get_type;
  end;

function ATSPI_TEXT(obj : Pointer) : PAtspiText;
begin
  Result := PAtspiText(g_type_check_instance_cast(obj, ATSPI_TYPE_TEXT));
end;

function ATSPI_IS_TEXT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_TEXT);
end;

function ATSPI_TEXT_GET_IFACE(obj : Pointer) : PAtspiText;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_TEXT);
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
