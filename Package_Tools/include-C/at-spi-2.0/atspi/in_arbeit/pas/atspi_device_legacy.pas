unit atspi_device_legacy;

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

type
  PAtspiDeviceLegacy = ^TAtspiDeviceLegacy;
  TAtspiDeviceLegacy = record
      parent : TAtspiDevice;
    end;

  PAtspiDeviceLegacyClass = ^TAtspiDeviceLegacyClass;
  TAtspiDeviceLegacyClass = record
      parent_class : TAtspiDeviceClass;
    end;


function atspi_device_legacy_get_type:TGType;cdecl;external libatspi;
function atspi_device_legacy_new:PAtspiDeviceLegacy;cdecl;external libatspi;
{$endif}
{ _ATSPI_DEVICE_LEGACY_H_  }

// === Konventiert am: 26-9-26 12:52:25 ===

function ATSPI_TYPE_DEVICE_LEGACY : TGType;
function ATSPI_DEVICE_LEGACY(obj : Pointer) : PAtspiDeviceLegacy;
function ATSPI_DEVICE_LEGACY_CLASS(klass : Pointer) : PAtspiDeviceLegacyClass;
function ATSPI_IS_DEVICE_LEGACY(obj : Pointer) : Tgboolean;
function ATSPI_IS_DEVICE_LEGACY_CLASS(klass : Pointer) : Tgboolean;
function ATSPI_DEVICE_LEGACY_GET_CLASS(obj : Pointer) : PAtspiDeviceLegacyClass;

implementation

function ATSPI_TYPE_DEVICE_LEGACY : TGType;
  begin
    ATSPI_TYPE_DEVICE_LEGACY:=atspi_device_legacy_get_type;
  end;

function ATSPI_DEVICE_LEGACY(obj : Pointer) : PAtspiDeviceLegacy;
begin
  Result := PAtspiDeviceLegacy(g_type_check_instance_cast(obj, ATSPI_TYPE_DEVICE_LEGACY));
end;

function ATSPI_DEVICE_LEGACY_CLASS(klass : Pointer) : PAtspiDeviceLegacyClass;
begin
  Result := PAtspiDeviceLegacyClass(g_type_check_class_cast(klass, ATSPI_TYPE_DEVICE_LEGACY));
end;

function ATSPI_IS_DEVICE_LEGACY(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_DEVICE_LEGACY);
end;

function ATSPI_IS_DEVICE_LEGACY_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  ATSPI_TYPE_DEVICE_LEGACY);
end;

function ATSPI_DEVICE_LEGACY_GET_CLASS(obj : Pointer) : PAtspiDeviceLegacyClass;
begin
  Result := PAtspiDeviceLegacyClass(PGTypeInstance(obj)^.g_class);
end;



end.
