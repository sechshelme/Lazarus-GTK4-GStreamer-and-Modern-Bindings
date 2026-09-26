unit atspi_device;

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
{$ifndef _ATSPI_DEVICE_H_}
{$define _ATSPI_DEVICE_H_}
{$include "glib-object.h"}
{$include "atspi-types.h"}

type
  PAtspiDevice = ^TAtspiDevice;
  TAtspiDevice = record
      parent : TGObject;
    end;

  PAtspiDeviceClass = ^TAtspiDeviceClass;
  TAtspiDeviceClass = record
      parent_class : TGObjectClass;
      add_key_grab : function (device:PAtspiDevice; kd:PAtspiKeyDefinition):Tgboolean;cdecl;
      remove_key_grab : procedure (device:PAtspiDevice; id:Tguint);cdecl;
      map_modifier : function (device:PAtspiDevice; keycode:Tgint):Tguint;cdecl;
      unmap_modifier : procedure (device:PAtspiDevice; keycode:Tgint);cdecl;
      get_modifier : function (device:PAtspiDevice; keycode:Tgint):Tguint;cdecl;
      grab_keyboard : function (device:PAtspiDevice):Tgboolean;cdecl;
      ungrab_keyboard : procedure (device:PAtspiDevice);cdecl;
      get_locked_modifiers : function (device:PAtspiDevice):Tguint;cdecl;
      generate_mouse_event : procedure (device:PAtspiDevice; obj:PAtspiAccessible; x:Tgint; y:Tgint; name:Pgchar; 
                    error:PPGError);cdecl;
    end;


function atspi_device_get_type:TGType;cdecl;external libatspi;
{*
 * AtspiKeyCallback:
 * @device: the device.
 * @pressed: TRUE if the key is being pressed, FALSE if being released.
 * @keycode: the hardware code for the key.
 * @keysym: the keysym for the key.
 * @modifiers: a bitflag indicating which key modifiers are active.
 * @keystring: the text corresponding to the keypress.
 * @user_data: (closure): user-supplied data
 *
 * A callback that will be invoked when a key is pressed.
  }
type

  TAtspiKeyCallback = procedure (device:PAtspiDevice; pressed:Tgboolean; keycode:Tguint; keysym:Tguint; modifiers:Tguint; 
                keystring:Pgchar; user_data:pointer);cdecl;

function atspi_device_new:PAtspiDevice;cdecl;external libatspi;
function atspi_device_notify_key(device:PAtspiDevice; pressed:Tgboolean; keycode:longint; keysym:longint; state:Tgint; 
           text:Pgchar):Tgboolean;cdecl;external libatspi;
function atspi_device_add_key_grab(device:PAtspiDevice; kd:PAtspiKeyDefinition; callback:TAtspiKeyCallback; user_data:pointer; callback_destroyed:TGDestroyNotify):Tguint;cdecl;external libatspi;
procedure atspi_device_remove_key_grab(device:PAtspiDevice; id:Tguint);cdecl;external libatspi;
procedure atspi_device_add_key_watcher(device:PAtspiDevice; callback:TAtspiKeyCallback; user_data:pointer; callback_destroyed:TGDestroyNotify);cdecl;external libatspi;
function atspi_device_get_grab_by_id(device:PAtspiDevice; id:Tguint):PAtspiKeyDefinition;cdecl;external libatspi;
function atspi_device_map_modifier(device:PAtspiDevice; keycode:Tgint):Tguint;cdecl;external libatspi;
procedure atspi_device_unmap_modifier(device:PAtspiDevice; keycode:Tgint);cdecl;external libatspi;
function atspi_device_get_modifier(device:PAtspiDevice; keycode:Tgint):Tguint;cdecl;external libatspi;
function atspi_device_get_locked_modifiers(device:PAtspiDevice):Tguint;cdecl;external libatspi;
function atspi_device_grab_keyboard(device:PAtspiDevice):Tgboolean;cdecl;external libatspi;
procedure atspi_device_ungrab_keyboard(device:PAtspiDevice);cdecl;external libatspi;
procedure atspi_device_generate_mouse_event(device:PAtspiDevice; obj:PAtspiAccessible; x:Tgint; y:Tgint; name:Pgchar; 
            error:PPGError);cdecl;external libatspi;
{$endif}
{ _ATSPI_DEVICE_H_  }

// === Konventiert am: 26-9-26 12:52:30 ===

function ATSPI_TYPE_DEVICE : TGType;
function ATSPI_DEVICE(obj : Pointer) : PAtspiDevice;
function ATSPI_DEVICE_CLASS(klass : Pointer) : PAtspiDeviceClass;
function ATSPI_IS_DEVICE(obj : Pointer) : Tgboolean;
function ATSPI_IS_DEVICE_CLASS(klass : Pointer) : Tgboolean;
function ATSPI_DEVICE_GET_CLASS(obj : Pointer) : PAtspiDeviceClass;

implementation

function ATSPI_TYPE_DEVICE : TGType;
  begin
    ATSPI_TYPE_DEVICE:=atspi_device_get_type;
  end;

function ATSPI_DEVICE(obj : Pointer) : PAtspiDevice;
begin
  Result := PAtspiDevice(g_type_check_instance_cast(obj, ATSPI_TYPE_DEVICE));
end;

function ATSPI_DEVICE_CLASS(klass : Pointer) : PAtspiDeviceClass;
begin
  Result := PAtspiDeviceClass(g_type_check_class_cast(klass, ATSPI_TYPE_DEVICE));
end;

function ATSPI_IS_DEVICE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_DEVICE);
end;

function ATSPI_IS_DEVICE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  ATSPI_TYPE_DEVICE);
end;

function ATSPI_DEVICE_GET_CLASS(obj : Pointer) : PAtspiDeviceClass;
begin
  Result := PAtspiDeviceClass(PGTypeInstance(obj)^.g_class);
end;



end.
