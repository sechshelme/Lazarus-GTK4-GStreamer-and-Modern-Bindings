
unit atspi_device_x11;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_device_x11.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_device_x11.h
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
PAtspiDeviceX11  = ^AtspiDeviceX11;
PAtspiDeviceX11Class  = ^AtspiDeviceX11Class;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * AT-SPI - Assistive Technology Service Provider Interface
 * (Gnome Accessibility Project; http://developer.gnome.org/projects/gap)
 *
 * Copyright 2020 SUSE LLC.
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
{$ifndef _ATSPI_DEVICE_X11_H_}
{$define _ATSPI_DEVICE_X11_H_}
{$include "glib-object.h"}
{$include "atspi-device.h"}
{$include "atspi-types.h"}

{ was #define dname def_expr }
function ATSPI_TYPE_DEVICE_X11 : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_X11(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_X11_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_DEVICE_X11(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_DEVICE_X11_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_X11_GET_CLASS(obj : longint) : longint;

type
  PAtspiDeviceX11 = ^TAtspiDeviceX11;
  TAtspiDeviceX11 = record
      parent : TAtspiDevice;
    end;

  PAtspiDeviceX11Class = ^TAtspiDeviceX11Class;
  TAtspiDeviceX11Class = record
      parent_class : TAtspiDeviceClass;
    end;


function atspi_device_x11_get_type:TGType;cdecl;external;
function atspi_device_x11_new:PAtspiDeviceX11;cdecl;external;
{$endif}
{ _ATSPI_DEVICE_X11_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_DEVICE_X11 : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_DEVICE_X11:=atspi_device_x11_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_X11(obj : longint) : longint;
begin
  ATSPI_DEVICE_X11:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_DEVICE_X11,AtspiDeviceX11);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_X11_CLASS(klass : longint) : longint;
begin
  ATSPI_DEVICE_X11_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,ATSPI_TYPE_DEVICE_X11,AtspiDeviceX11Class);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_DEVICE_X11(obj : longint) : longint;
begin
  ATSPI_IS_DEVICE_X11:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_DEVICE_X11);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_DEVICE_X11_CLASS(klass : longint) : longint;
begin
  ATSPI_IS_DEVICE_X11_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,ATSPI_TYPE_DEVICE_X11);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_X11_GET_CLASS(obj : longint) : longint;
begin
  ATSPI_DEVICE_X11_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,ATSPI_TYPE_DEVICE_X11,AtspiDeviceX11Class);
end;


end.
