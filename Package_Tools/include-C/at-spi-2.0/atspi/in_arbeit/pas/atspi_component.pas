unit atspi_component;

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
{$ifndef _ATSPI_COMPONENT_H_}
{$define _ATSPI_COMPONENT_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}
{$include "atspi-types.h"}
type
  PAtspiRect = ^TAtspiRect;
  TAtspiRect = record
      x : Tgint;
      y : Tgint;
      width : Tgint;
      height : Tgint;
    end;

{*
 * ATSPI_TYPE_RECT:
 *
 * The #GType for a boxed type holding a #AtspiRect.
  }

function atspi_rect_get_type:TGType;cdecl;external libatspi;
function atspi_rect_copy(src:PAtspiRect):PAtspiRect;cdecl;external libatspi;
type
  PAtspiPoint = ^TAtspiPoint;
  TAtspiPoint = record
      x : Tgint;
      y : Tgint;
    end;

{*
 * ATSPI_TYPE_POINT:
 *
 * The #GType for a boxed type holding a #AtspiPoint.
  }

function atspi_point_get_type:TGType;cdecl;external libatspi;
function atspi_point_copy(src:PAtspiPoint):PAtspiPoint;cdecl;external libatspi;
{ was #define dname def_expr }
function ATSPI_TYPE_RECT : longint; { return type might be wrong }

{ was #define dname def_expr }
function ATSPI_TYPE_POINT : longint; { return type might be wrong }

function atspi_component_get_type:TGType;cdecl;external libatspi;
type
  PAtspiComponent = ^TAtspiComponent;
  TAtspiComponent = record
      parent : TGTypeInterface;
    end;


function atspi_component_contains(obj:PAtspiComponent; x:Tgint; y:Tgint; ctype:TAtspiCoordType; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_component_get_accessible_at_point(obj:PAtspiComponent; x:Tgint; y:Tgint; ctype:TAtspiCoordType; error:PPGError):PAtspiAccessible;cdecl;external libatspi;
function atspi_component_get_extents(obj:PAtspiComponent; ctype:TAtspiCoordType; error:PPGError):PAtspiRect;cdecl;external libatspi;
function atspi_component_get_position(obj:PAtspiComponent; ctype:TAtspiCoordType; error:PPGError):PAtspiPoint;cdecl;external libatspi;
function atspi_component_get_size(obj:PAtspiComponent; error:PPGError):PAtspiPoint;cdecl;external libatspi;
function atspi_component_get_layer(obj:PAtspiComponent; error:PPGError):TAtspiComponentLayer;cdecl;external libatspi;
function atspi_component_get_mdi_z_order(obj:PAtspiComponent; error:PPGError):Tgshort;cdecl;external libatspi;
function atspi_component_grab_focus(obj:PAtspiComponent; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_component_get_alpha(obj:PAtspiComponent; error:PPGError):Tgdouble;cdecl;external libatspi;
function atspi_component_set_extents(obj:PAtspiComponent; x:Tgint; y:Tgint; width:Tgint; height:Tgint; 
           ctype:TAtspiCoordType; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_component_set_position(obj:PAtspiComponent; x:Tgint; y:Tgint; ctype:TAtspiCoordType; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_component_set_size(obj:PAtspiComponent; width:Tgint; height:Tgint; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_component_scroll_to(obj:PAtspiComponent; _type:TAtspiScrollType; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_component_scroll_to_point(obj:PAtspiComponent; coords:TAtspiCoordType; x:Tgint; y:Tgint; error:PPGError):Tgboolean;cdecl;external libatspi;
{$endif}
{ _ATSPI_COMPONENT_H_  }

// === Konventiert am: 26-9-26 12:56:18 ===

function ATSPI_TYPE_COMPONENT : TGType;
function ATSPI_IS_COMPONENT(obj : Pointer) : P;;
function ATSPI_COMPONENT(obj : Pointer) : Tgboolean;
function ATSPI_COMPONENT_GET_IFACE(obj : Pointer) : PAtspiComponent;

implementation

function ATSPI_TYPE_COMPONENT : TGType;
  begin
    ATSPI_TYPE_COMPONENT:=atspi_component_get_type;
  end;

function ATSPI_IS_COMPONENT(obj : Pointer) : P;;
begin
  Result := P;(g_type_check_instance_cast(obj, ATSPI_TYPE_COMPONENT));
end;

function ATSPI_COMPONENT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_COMPONENT);
end;

function ATSPI_COMPONENT_GET_IFACE(obj : Pointer) : PAtspiComponent;
begin
  Result := g_type_interface_peek(obj, ATSPI_TYPE_COMPONENT);
end;


{ was #define dname def_expr }
function ATSPI_TYPE_RECT : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_RECT:=atspi_rect_get_type;
  end;

{ was #define dname def_expr }
function ATSPI_TYPE_POINT : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_POINT:=atspi_point_get_type;
  end;


end.
