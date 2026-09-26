unit atspi_device_listener;

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

function atspi_device_event_get_type:TGType;cdecl;external libatspi;
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

  TAtspiDeviceListenerSimpleCB = function (stroke:PAtspiDeviceEvent):Tgboolean;cdecl;

type
  PAtspiDeviceListener = ^TAtspiDeviceListener;
  TAtspiDeviceListener = record
      parent : TGObject;cdecl;
      id : Tguint;
      callbacks : PGList;
    end;

  PAtspiDeviceListenerClass = ^TAtspiDeviceListenerClass;
  TAtspiDeviceListenerClass = record
      parent_class : TGObjectClass;
      device_event : function (listener:PAtspiDeviceListener; event:PAtspiDeviceEvent):Tgboolean;cdecl;
    end;


function atspi_device_listener_get_type:TGType;cdecl;external libatspi;
function atspi_device_listener_new(callback:TAtspiDeviceListenerCB; user_data:pointer; callback_destroyed:TGDestroyNotify):PAtspiDeviceListener;cdecl;external libatspi;
function atspi_device_listener_new_simple(callback:TAtspiDeviceListenerSimpleCB; callback_destroyed:TGDestroyNotify):PAtspiDeviceListener;cdecl;external libatspi;
procedure atspi_device_listener_add_callback(listener:PAtspiDeviceListener; callback:TAtspiDeviceListenerCB; callback_destroyed:TGDestroyNotify; user_data:pointer);cdecl;external libatspi;
procedure atspi_device_listener_remove_callback(listener:PAtspiDeviceListener; callback:TAtspiDeviceListenerCB);cdecl;external libatspi;
{$endif}
{ _ATSPI_DEVICE_LISTENER_H_  }

// === Konventiert am: 26-9-26 12:52:20 ===

function ATSPI_TYPE_DEVICE_LISTENER : TGType;
function ATSPI_DEVICE_LISTENER(obj : Pointer) : PAtspiDeviceListener;
function ATSPI_DEVICE_LISTENER_CLASS(klass : Pointer) : PAtspiDeviceListenerClass;
function ATSPI_IS_DEVICE_LISTENER(obj : Pointer) : Tgboolean;
function ATSPI_IS_DEVICE_LISTENER_CLASS(klass : Pointer) : Tgboolean;
function ATSPI_DEVICE_LISTENER_GET_CLASS(obj : Pointer) : PAtspiDeviceListenerClass;

implementation

function ATSPI_TYPE_DEVICE_LISTENER : TGType;
  begin
    ATSPI_TYPE_DEVICE_LISTENER:=atspi_device_listener_get_type;
  end;

function ATSPI_DEVICE_LISTENER(obj : Pointer) : PAtspiDeviceListener;
begin
  Result := PAtspiDeviceListener(g_type_check_instance_cast(obj, ATSPI_TYPE_DEVICE_LISTENER));
end;

function ATSPI_DEVICE_LISTENER_CLASS(klass : Pointer) : PAtspiDeviceListenerClass;
begin
  Result := PAtspiDeviceListenerClass(g_type_check_class_cast(klass, ATSPI_TYPE_DEVICE_LISTENER));
end;

function ATSPI_IS_DEVICE_LISTENER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_DEVICE_LISTENER);
end;

function ATSPI_IS_DEVICE_LISTENER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  ATSPI_TYPE_DEVICE_LISTENER);
end;

function ATSPI_DEVICE_LISTENER_GET_CLASS(obj : Pointer) : PAtspiDeviceListenerClass;
begin
  Result := PAtspiDeviceListenerClass(PGTypeInstance(obj)^.g_class);
end;



end.
