
unit atspi_selection;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_selection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_selection.h
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
PAtspiAccessible  = ^AtspiAccessible;
PAtspiSelection  = ^AtspiSelection;
PGError  = ^GError;
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
{$ifndef _ATSPI_SELECTION_H_}
{$define _ATSPI_SELECTION_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}
{$include "atspi-types.h"}

{ was #define dname def_expr }
function ATSPI_TYPE_SELECTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_SELECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_SELECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_SELECTION_GET_IFACE(obj : longint) : longint;

function atspi_selection_get_type:TGType;cdecl;external;
type
  PAtspiSelection = ^TAtspiSelection;
  TAtspiSelection = record
      parent : TGTypeInterface;
    end;


function atspi_selection_get_n_selected_children(obj:PAtspiSelection; error:PPGError):Tgint;cdecl;external;
function atspi_selection_get_selected_child(obj:PAtspiSelection; selected_child_index:Tgint; error:PPGError):PAtspiAccessible;cdecl;external;
function atspi_selection_select_child(obj:PAtspiSelection; child_index:Tgint; error:PPGError):Tgboolean;cdecl;external;
function atspi_selection_deselect_selected_child(obj:PAtspiSelection; selected_child_index:Tgint; error:PPGError):Tgboolean;cdecl;external;
function atspi_selection_deselect_child(obj:PAtspiSelection; child_index:Tgint; error:PPGError):Tgboolean;cdecl;external;
function atspi_selection_is_child_selected(obj:PAtspiSelection; child_index:Tgint; error:PPGError):Tgboolean;cdecl;external;
function atspi_selection_select_all(obj:PAtspiSelection; error:PPGError):Tgboolean;cdecl;external;
function atspi_selection_clear_selection(obj:PAtspiSelection; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ _ATSPI_SELECTION_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_SELECTION : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_SELECTION:=atspi_selection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_SELECTION(obj : longint) : longint;
begin
  ATSPI_SELECTION:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_SELECTION,AtspiSelection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_SELECTION(obj : longint) : longint;
begin
  ATSPI_IS_SELECTION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_SELECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_SELECTION_GET_IFACE(obj : longint) : longint;
begin
  ATSPI_SELECTION_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,ATSPI_TYPE_SELECTION,AtspiSelection);
end;


end.
