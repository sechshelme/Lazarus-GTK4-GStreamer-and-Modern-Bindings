
unit atspi_component;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_component.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_component.h
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
PAtspiComponent  = ^AtspiComponent;
PAtspiPoint  = ^AtspiPoint;
PAtspiRect  = ^AtspiRect;
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

function atspi_rect_get_type:TGType;cdecl;external;
function atspi_rect_copy(src:PAtspiRect):PAtspiRect;cdecl;external;
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

function atspi_point_get_type:TGType;cdecl;external;
function atspi_point_copy(src:PAtspiPoint):PAtspiPoint;cdecl;external;
{ was #define dname def_expr }
function ATSPI_TYPE_COMPONENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_COMPONENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_COMPONENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_COMPONENT_GET_IFACE(obj : longint) : longint;

{ was #define dname def_expr }
function ATSPI_TYPE_RECT : longint; { return type might be wrong }

{ was #define dname def_expr }
function ATSPI_TYPE_POINT : longint; { return type might be wrong }

function atspi_component_get_type:TGType;cdecl;external;
type
  PAtspiComponent = ^TAtspiComponent;
  TAtspiComponent = record
      parent : TGTypeInterface;
    end;


function atspi_component_contains(obj:PAtspiComponent; x:Tgint; y:Tgint; ctype:TAtspiCoordType; error:PPGError):Tgboolean;cdecl;external;
function atspi_component_get_accessible_at_point(obj:PAtspiComponent; x:Tgint; y:Tgint; ctype:TAtspiCoordType; error:PPGError):PAtspiAccessible;cdecl;external;
function atspi_component_get_extents(obj:PAtspiComponent; ctype:TAtspiCoordType; error:PPGError):PAtspiRect;cdecl;external;
function atspi_component_get_position(obj:PAtspiComponent; ctype:TAtspiCoordType; error:PPGError):PAtspiPoint;cdecl;external;
function atspi_component_get_size(obj:PAtspiComponent; error:PPGError):PAtspiPoint;cdecl;external;
function atspi_component_get_layer(obj:PAtspiComponent; error:PPGError):TAtspiComponentLayer;cdecl;external;
function atspi_component_get_mdi_z_order(obj:PAtspiComponent; error:PPGError):Tgshort;cdecl;external;
function atspi_component_grab_focus(obj:PAtspiComponent; error:PPGError):Tgboolean;cdecl;external;
function atspi_component_get_alpha(obj:PAtspiComponent; error:PPGError):Tgdouble;cdecl;external;
function atspi_component_set_extents(obj:PAtspiComponent; x:Tgint; y:Tgint; width:Tgint; height:Tgint; 
           ctype:TAtspiCoordType; error:PPGError):Tgboolean;cdecl;external;
function atspi_component_set_position(obj:PAtspiComponent; x:Tgint; y:Tgint; ctype:TAtspiCoordType; error:PPGError):Tgboolean;cdecl;external;
function atspi_component_set_size(obj:PAtspiComponent; width:Tgint; height:Tgint; error:PPGError):Tgboolean;cdecl;external;
function atspi_component_scroll_to(obj:PAtspiComponent; _type:TAtspiScrollType; error:PPGError):Tgboolean;cdecl;external;
function atspi_component_scroll_to_point(obj:PAtspiComponent; coords:TAtspiCoordType; x:Tgint; y:Tgint; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ _ATSPI_COMPONENT_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_COMPONENT : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_COMPONENT:=atspi_component_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_COMPONENT(obj : longint) : longint;
begin
  ATSPI_IS_COMPONENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_COMPONENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_COMPONENT(obj : longint) : longint;
begin
  ATSPI_COMPONENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_COMPONENT,AtspiComponent);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_COMPONENT_GET_IFACE(obj : longint) : longint;
begin
  ATSPI_COMPONENT_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,ATSPI_TYPE_COMPONENT,AtspiComponent);
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
