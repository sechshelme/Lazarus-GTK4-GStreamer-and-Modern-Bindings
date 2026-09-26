
unit atspi_value;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_value.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_value.h
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
PAtspiValue  = ^AtspiValue;
Pgchar  = ^gchar;
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
{$ifndef _ATSPI_VALUE_H_}
{$define _ATSPI_VALUE_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}
{$include "atspi-types.h"}

{ was #define dname def_expr }
function ATSPI_TYPE_VALUE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_VALUE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_VALUE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_VALUE_GET_IFACE(obj : longint) : longint;

function atspi_value_get_type:TGType;cdecl;external;
type
  PAtspiValue = ^TAtspiValue;
  TAtspiValue = record
      parent : TGTypeInterface;
    end;


function atspi_value_get_minimum_value(obj:PAtspiValue; error:PPGError):Tgdouble;cdecl;external;
function atspi_value_get_current_value(obj:PAtspiValue; error:PPGError):Tgdouble;cdecl;external;
function atspi_value_get_maximum_value(obj:PAtspiValue; error:PPGError):Tgdouble;cdecl;external;
function atspi_value_set_current_value(obj:PAtspiValue; new_value:Tgdouble; error:PPGError):Tgboolean;cdecl;external;
function atspi_value_get_minimum_increment(obj:PAtspiValue; error:PPGError):Tgdouble;cdecl;external;
function atspi_value_get_text(obj:PAtspiValue; error:PPGError):Pgchar;cdecl;external;
{$endif}
{ _ATSPI_VALUE_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_VALUE : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_VALUE:=atspi_value_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_VALUE(obj : longint) : longint;
begin
  ATSPI_VALUE:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_VALUE,AtspiValue);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_VALUE(obj : longint) : longint;
begin
  ATSPI_IS_VALUE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_VALUE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_VALUE_GET_IFACE(obj : longint) : longint;
begin
  ATSPI_VALUE_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,ATSPI_TYPE_VALUE,AtspiValue);
end;


end.
