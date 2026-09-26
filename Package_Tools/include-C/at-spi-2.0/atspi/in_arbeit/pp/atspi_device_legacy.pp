
unit atspi_device_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_device_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_device_legacy.h
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
PAtspiDeviceLegacy  = ^AtspiDeviceLegacy;
PAtspiDeviceLegacyClass  = ^AtspiDeviceLegacyClass;
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
{$ifndef _ATSPI_DEVICE_LEGACY_H_}
{$define _ATSPI_DEVICE_LEGACY_H_}
{$include "glib-object.h"}
{$include "atspi-device.h"}
{$include "atspi-types.h"}

{ was #define dname def_expr }
function ATSPI_TYPE_DEVICE_LEGACY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_LEGACY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_LEGACY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_DEVICE_LEGACY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_DEVICE_LEGACY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_LEGACY_GET_CLASS(obj : longint) : longint;

type
  PAtspiDeviceLegacy = ^TAtspiDeviceLegacy;
  TAtspiDeviceLegacy = record
      parent : TAtspiDevice;
    end;

  PAtspiDeviceLegacyClass = ^TAtspiDeviceLegacyClass;
  TAtspiDeviceLegacyClass = record
      parent_class : TAtspiDeviceClass;
    end;


function atspi_device_legacy_get_type:TGType;cdecl;external;
function atspi_device_legacy_new:PAtspiDeviceLegacy;cdecl;external;
{$endif}
{ _ATSPI_DEVICE_LEGACY_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_DEVICE_LEGACY : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_DEVICE_LEGACY:=atspi_device_legacy_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_LEGACY(obj : longint) : longint;
begin
  ATSPI_DEVICE_LEGACY:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_DEVICE_LEGACY,AtspiDeviceLegacy);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_LEGACY_CLASS(klass : longint) : longint;
begin
  ATSPI_DEVICE_LEGACY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,ATSPI_TYPE_DEVICE_LEGACY,AtspiDeviceLegacyClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_DEVICE_LEGACY(obj : longint) : longint;
begin
  ATSPI_IS_DEVICE_LEGACY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_DEVICE_LEGACY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_DEVICE_LEGACY_CLASS(klass : longint) : longint;
begin
  ATSPI_IS_DEVICE_LEGACY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,ATSPI_TYPE_DEVICE_LEGACY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_LEGACY_GET_CLASS(obj : longint) : longint;
begin
  ATSPI_DEVICE_LEGACY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,ATSPI_TYPE_DEVICE_LEGACY,AtspiDeviceLegacyClass);
end;


end.
