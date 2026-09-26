
unit atspi_device;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_device.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_device
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
PAtspiDevice  = ^AtspiDevice;
PAtspiDeviceClass  = ^AtspiDeviceClass;
PAtspiKeyDefinition  = ^AtspiKeyDefinition;
Pgchar  = ^gchar;
PGError  = ^GError;
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

{ was #define dname def_expr }
function ATSPI_TYPE_DEVICE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_DEVICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_DEVICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_GET_CLASS(obj : longint) : longint;

type
  PAtspiDevice = ^TAtspiDevice;
  TAtspiDevice = record
      parent : TGObject;
    end;

(* Const before type ignored *)
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


function atspi_device_get_type:TGType;cdecl;external;
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
(* Const before type ignored *)
type

  TAtspiKeyCallback = procedure (device:PAtspiDevice; pressed:Tgboolean; keycode:Tguint; keysym:Tguint; modifiers:Tguint; 
                keystring:Pgchar; user_data:pointer);cdecl;

function atspi_device_new:PAtspiDevice;cdecl;external;
(* Const before type ignored *)
function atspi_device_notify_key(device:PAtspiDevice; pressed:Tgboolean; keycode:longint; keysym:longint; state:Tgint; 
           text:Pgchar):Tgboolean;cdecl;external;
function atspi_device_add_key_grab(device:PAtspiDevice; kd:PAtspiKeyDefinition; callback:TAtspiKeyCallback; user_data:pointer; callback_destroyed:TGDestroyNotify):Tguint;cdecl;external;
procedure atspi_device_remove_key_grab(device:PAtspiDevice; id:Tguint);cdecl;external;
procedure atspi_device_add_key_watcher(device:PAtspiDevice; callback:TAtspiKeyCallback; user_data:pointer; callback_destroyed:TGDestroyNotify);cdecl;external;
function atspi_device_get_grab_by_id(device:PAtspiDevice; id:Tguint):PAtspiKeyDefinition;cdecl;external;
function atspi_device_map_modifier(device:PAtspiDevice; keycode:Tgint):Tguint;cdecl;external;
procedure atspi_device_unmap_modifier(device:PAtspiDevice; keycode:Tgint);cdecl;external;
function atspi_device_get_modifier(device:PAtspiDevice; keycode:Tgint):Tguint;cdecl;external;
function atspi_device_get_locked_modifiers(device:PAtspiDevice):Tguint;cdecl;external;
function atspi_device_grab_keyboard(device:PAtspiDevice):Tgboolean;cdecl;external;
procedure atspi_device_ungrab_keyboard(device:PAtspiDevice);cdecl;external;
(* Const before type ignored *)
procedure atspi_device_generate_mouse_event(device:PAtspiDevice; obj:PAtspiAccessible; x:Tgint; y:Tgint; name:Pgchar; 
            error:PPGError);cdecl;external;
{$endif}
{ _ATSPI_DEVICE_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_DEVICE : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_DEVICE:=atspi_device_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE(obj : longint) : longint;
begin
  ATSPI_DEVICE:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_DEVICE,AtspiDevice);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_CLASS(klass : longint) : longint;
begin
  ATSPI_DEVICE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,ATSPI_TYPE_DEVICE,AtspiDeviceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_DEVICE(obj : longint) : longint;
begin
  ATSPI_IS_DEVICE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_DEVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_DEVICE_CLASS(klass : longint) : longint;
begin
  ATSPI_IS_DEVICE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,ATSPI_TYPE_DEVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_GET_CLASS(obj : longint) : longint;
begin
  ATSPI_DEVICE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,ATSPI_TYPE_DEVICE,AtspiDeviceClass);
end;


end.
