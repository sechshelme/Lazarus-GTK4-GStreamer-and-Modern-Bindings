unit atspi_selection;

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
{$ifndef _ATSPI_SELECTION_H_}
{$define _ATSPI_SELECTION_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}
{$include "atspi-types.h"}

function atspi_selection_get_type:TGType;cdecl;external libatspi;
type
  PAtspiSelection = ^TAtspiSelection;
  TAtspiSelection = record
      parent : TGTypeInterface;
    end;


function atspi_selection_get_n_selected_children(obj:PAtspiSelection; error:PPGError):Tgint;cdecl;external libatspi;
function atspi_selection_get_selected_child(obj:PAtspiSelection; selected_child_index:Tgint; error:PPGError):PAtspiAccessible;cdecl;external libatspi;
function atspi_selection_select_child(obj:PAtspiSelection; child_index:Tgint; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_selection_deselect_selected_child(obj:PAtspiSelection; selected_child_index:Tgint; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_selection_deselect_child(obj:PAtspiSelection; child_index:Tgint; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_selection_is_child_selected(obj:PAtspiSelection; child_index:Tgint; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_selection_select_all(obj:PAtspiSelection; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_selection_clear_selection(obj:PAtspiSelection; error:PPGError):Tgboolean;cdecl;external libatspi;
{$endif}
{ _ATSPI_SELECTION_H_  }

// === Konventiert am: 26-9-26 13:15:35 ===

function ATSPI_TYPE_SELECTION : TGType;
function ATSPI_SELECTION(obj : Pointer) : PAtspiSelection;
function ATSPI_IS_SELECTION(obj : Pointer) : Tgboolean;
function ATSPI_SELECTION_GET_IFACE(obj : Pointer) : PAtspiSelection;

implementation

function ATSPI_TYPE_SELECTION : TGType;
  begin
    ATSPI_TYPE_SELECTION:=atspi_selection_get_type;
  end;

function ATSPI_SELECTION(obj : Pointer) : PAtspiSelection;
begin
  Result := PAtspiSelection(g_type_check_instance_cast(obj, ATSPI_TYPE_SELECTION));
end;

function ATSPI_IS_SELECTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_SELECTION);
end;

function ATSPI_SELECTION_GET_IFACE(obj : Pointer) : PAtspiSelection;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_SELECTION);
end;



end.
