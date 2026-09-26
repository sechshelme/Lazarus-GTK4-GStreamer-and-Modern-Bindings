
unit atspi_device_listener;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_device_listener.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_device_listener.h
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
PAtspiDeviceEvent  = ^AtspiDeviceEvent;
PAtspiDeviceListener  = ^AtspiDeviceListener;
PAtspiDeviceListenerClass  = ^AtspiDeviceListenerClass;
PGList  = ^GList;
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
{$ifndef _ATSPI_DEVICE_LISTENER_H_}
{$define _ATSPI_DEVICE_LISTENER_H_}
{$include "glib-object.h"}
{$include "atspi-types.h"}

function atspi_device_event_get_type:TGType;cdecl;external;
{*
 * AtspiDeviceListenerCB:
 * @stroke: (transfer full): The #AtspiDeviceEvent for which notification is
 *          being received.
 * @user_data: Data which is passed to the client each time this callback is notified.
 *
 * A callback function prototype via which clients receive device event notifications.
 *
 * Returns: #TRUE if the client wishes to consume/preempt the event, preventing it from being
 * relayed to the currently focussed application, #FALSE if the event delivery should proceed as normal.
 * }
type

  TAtspiDeviceListenerCB = function (stroke:PAtspiDeviceEvent; user_data:pointer):Tgboolean;cdecl;
{*
 * AtspiDeviceListenerSimpleCB:
 * @stroke: (transfer full): The #AtspiDeviceEvent for which notification is
 *          being received.
 *
 * Similar to #AtspiDeviceListenerCB, but with no user data.
 *
 * Returns: #TRUE if the client wishes to consume/preempt the event, preventing it from being
 * relayed to the currently focussed application, #FALSE if the event delivery should proceed as normal.
 * }
(* Const before type ignored *)

  TAtspiDeviceListenerSimpleCB = function (stroke:PAtspiDeviceEvent):Tgboolean;cdecl;

{ was #define dname def_expr }
function ATSPI_TYPE_DEVICE_LISTENER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_LISTENER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_LISTENER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_DEVICE_LISTENER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_DEVICE_LISTENER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_LISTENER_GET_CLASS(obj : longint) : longint;

type
  PAtspiDeviceListener = ^TAtspiDeviceListener;
  TAtspiDeviceListener = record
      parent : TGObject;cdecl;
      id : Tguint;
      callbacks : PGList;
    end;

(* Const before type ignored *)
  PAtspiDeviceListenerClass = ^TAtspiDeviceListenerClass;
  TAtspiDeviceListenerClass = record
      parent_class : TGObjectClass;
      device_event : function (listener:PAtspiDeviceListener; event:PAtspiDeviceEvent):Tgboolean;cdecl;
    end;


function atspi_device_listener_get_type:TGType;cdecl;external;
function atspi_device_listener_new(callback:TAtspiDeviceListenerCB; user_data:pointer; callback_destroyed:TGDestroyNotify):PAtspiDeviceListener;cdecl;external;
function atspi_device_listener_new_simple(callback:TAtspiDeviceListenerSimpleCB; callback_destroyed:TGDestroyNotify):PAtspiDeviceListener;cdecl;external;
procedure atspi_device_listener_add_callback(listener:PAtspiDeviceListener; callback:TAtspiDeviceListenerCB; callback_destroyed:TGDestroyNotify; user_data:pointer);cdecl;external;
procedure atspi_device_listener_remove_callback(listener:PAtspiDeviceListener; callback:TAtspiDeviceListenerCB);cdecl;external;
{$endif}
{ _ATSPI_DEVICE_LISTENER_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_DEVICE_LISTENER : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_DEVICE_LISTENER:=atspi_device_listener_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_LISTENER(obj : longint) : longint;
begin
  ATSPI_DEVICE_LISTENER:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_DEVICE_LISTENER,AtspiDeviceListener);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_LISTENER_CLASS(klass : longint) : longint;
begin
  ATSPI_DEVICE_LISTENER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,ATSPI_TYPE_DEVICE_LISTENER,AtspiDeviceListenerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_DEVICE_LISTENER(obj : longint) : longint;
begin
  ATSPI_IS_DEVICE_LISTENER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_DEVICE_LISTENER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_DEVICE_LISTENER_CLASS(klass : longint) : longint;
begin
  ATSPI_IS_DEVICE_LISTENER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,ATSPI_TYPE_DEVICE_LISTENER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_DEVICE_LISTENER_GET_CLASS(obj : longint) : longint;
begin
  ATSPI_DEVICE_LISTENER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,ATSPI_TYPE_DEVICE_LISTENER,AtspiDeviceListenerClass);
end;


end.
