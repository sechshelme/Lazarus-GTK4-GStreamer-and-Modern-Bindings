unit atspi_device_x11;

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
{$ifndef _ATSPI_DEVICE_X11_H_}
{$define _ATSPI_DEVICE_X11_H_}
{$include "glib-object.h"}
{$include "atspi-device.h"}
{$include "atspi-types.h"}

type
  PAtspiDeviceX11 = ^TAtspiDeviceX11;
  TAtspiDeviceX11 = record
      parent : TAtspiDevice;
    end;

  PAtspiDeviceX11Class = ^TAtspiDeviceX11Class;
  TAtspiDeviceX11Class = record
      parent_class : TAtspiDeviceClass;
    end;


function atspi_device_x11_get_type:TGType;cdecl;external libatspi;
function atspi_device_x11_new:PAtspiDeviceX11;cdecl;external libatspi;
{$endif}
{ _ATSPI_DEVICE_X11_H_  }

// === Konventiert am: 26-9-26 12:52:13 ===

function ATSPI_TYPE_DEVICE_X11 : TGType;
function ATSPI_DEVICE_X11(obj : Pointer) : PAtspiDeviceX11;
function ATSPI_DEVICE_X11_CLASS(klass : Pointer) : PAtspiDeviceX11Class;
function ATSPI_IS_DEVICE_X11(obj : Pointer) : Tgboolean;
function ATSPI_IS_DEVICE_X11_CLASS(klass : Pointer) : Tgboolean;
function ATSPI_DEVICE_X11_GET_CLASS(obj : Pointer) : PAtspiDeviceX11Class;

implementation

function ATSPI_TYPE_DEVICE_X11 : TGType;
  begin
    ATSPI_TYPE_DEVICE_X11:=atspi_device_x11_get_type;
  end;

function ATSPI_DEVICE_X11(obj : Pointer) : PAtspiDeviceX11;
begin
  Result := PAtspiDeviceX11(g_type_check_instance_cast(obj, ATSPI_TYPE_DEVICE_X11));
end;

function ATSPI_DEVICE_X11_CLASS(klass : Pointer) : PAtspiDeviceX11Class;
begin
  Result := PAtspiDeviceX11Class(g_type_check_class_cast(klass, ATSPI_TYPE_DEVICE_X11));
end;

function ATSPI_IS_DEVICE_X11(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_DEVICE_X11);
end;

function ATSPI_IS_DEVICE_X11_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  ATSPI_TYPE_DEVICE_X11);
end;

function ATSPI_DEVICE_X11_GET_CLASS(obj : Pointer) : PAtspiDeviceX11Class;
begin
  Result := PAtspiDeviceX11Class(PGTypeInstance(obj)^.g_class);
end;



end.
