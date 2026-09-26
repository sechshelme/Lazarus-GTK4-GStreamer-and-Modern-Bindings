unit atspi_event_listener;

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
{$ifndef _ATSPI_EVENT_LISTENER_H_}
{$define _ATSPI_EVENT_LISTENER_H_}
{$include "glib-object.h"}
{$include "atspi-types.h"}

function atspi_event_get_type:TGType;cdecl;external libatspi;
{*
 * AtspiEventListenerCB:
 * @event: (transfer full): The event for which notification is sent.
 * @user_data: User data which is passed to the callback each time a notification takes place.
 *
 * A function prototype for callbacks via which clients are notified of AT-SPI events.
 *
 * }
type

  TAtspiEventListenerCB = procedure (event:PAtspiEvent; user_data:pointer);cdecl;
{*
 * AtspiEventListenerSimpleCB:
 * @event: (transfer full): The event for which notification is sent.
 *
 * Like #AtspiEventlistenerCB, but with no user_data.
 *
 * }

  TAtspiEventListenerSimpleCB = procedure (event:PAtspiEvent);cdecl;

type
  PAtspiEventListener = ^TAtspiEventListener;
  TAtspiEventListener = record
      parent : TGObject;cdecl;
      callback : TAtspiEventListenerCB;
      user_data : pointer;
      cb_destroyed : TGDestroyNotify;
    end;

  PAtspiEventListenerClass = ^TAtspiEventListenerClass;
  TAtspiEventListenerClass = record
      parent_class : TGObjectClass;
    end;


function atspi_event_listener_get_type:TGType;cdecl;external libatspi;
function atspi_event_listener_new(callback:TAtspiEventListenerCB; user_data:Tgpointer; callback_destroyed:TGDestroyNotify):PAtspiEventListener;cdecl;external libatspi;
function atspi_event_listener_new_simple(callback:TAtspiEventListenerSimpleCB; callback_destroyed:TGDestroyNotify):PAtspiEventListener;cdecl;external libatspi;
function atspi_event_listener_register(listener:PAtspiEventListener; event_type:Pgchar; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_event_listener_register_full(listener:PAtspiEventListener; event_type:Pgchar; properties:PGArray; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_event_listener_register_with_app(listener:PAtspiEventListener; event_type:Pgchar; properties:PGArray; app:PAtspiAccessible; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_event_listener_register_from_callback(callback:TAtspiEventListenerCB; user_data:pointer; callback_destroyed:TGDestroyNotify; event_type:Pgchar; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_event_listener_register_from_callback_full(callback:TAtspiEventListenerCB; user_data:pointer; callback_destroyed:TGDestroyNotify; event_type:Pgchar; properties:PGArray; 
           error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_event_listener_register_from_callback_with_app(callback:TAtspiEventListenerCB; user_data:pointer; callback_destroyed:TGDestroyNotify; event_type:Pgchar; properties:PGArray; 
           app:PAtspiAccessible; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_event_listener_register_no_data(callback:TAtspiEventListenerSimpleCB; callback_destroyed:TGDestroyNotify; event_type:Pgchar; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_event_listener_deregister(listener:PAtspiEventListener; event_type:Pgchar; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_event_listener_deregister_from_callback(callback:TAtspiEventListenerCB; user_data:pointer; event_type:Pgchar; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_event_listener_deregister_no_data(callback:TAtspiEventListenerSimpleCB; event_type:Pgchar; error:PPGError):Tgboolean;cdecl;external libatspi;
{$endif}
{ _ATSPI_EVENT_LISTENER_H_  }

// === Konventiert am: 26-9-26 13:08:05 ===

function ATSPI_TYPE_EVENT_LISTENER : TGType;
function ATSPI_EVENT_LISTENER(obj : Pointer) : PAtspiEventListener;
function ATSPI_EVENT_LISTENER_CLASS(klass : Pointer) : PAtspiEventListenerClass;
function ATSPI_IS_EVENT_LISTENER(obj : Pointer) : Tgboolean;
function ATSPI_IS_EVENT_LISTENER_CLASS(klass : Pointer) : Tgboolean;
function ATSPI_EVENT_LISTENER_GET_CLASS(obj : Pointer) : PAtspiEventListenerClass;

implementation

function ATSPI_TYPE_EVENT_LISTENER : TGType;
  begin
    ATSPI_TYPE_EVENT_LISTENER:=atspi_event_listener_get_type;
  end;

function ATSPI_EVENT_LISTENER(obj : Pointer) : PAtspiEventListener;
begin
  Result := PAtspiEventListener(g_type_check_instance_cast(obj, ATSPI_TYPE_EVENT_LISTENER));
end;

function ATSPI_EVENT_LISTENER_CLASS(klass : Pointer) : PAtspiEventListenerClass;
begin
  Result := PAtspiEventListenerClass(g_type_check_class_cast(klass, ATSPI_TYPE_EVENT_LISTENER));
end;

function ATSPI_IS_EVENT_LISTENER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  ATSPI_TYPE_EVENT_LISTENER);
end;

function ATSPI_IS_EVENT_LISTENER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  ATSPI_TYPE_EVENT_LISTENER);
end;

function ATSPI_EVENT_LISTENER_GET_CLASS(obj : Pointer) : PAtspiEventListenerClass;
begin
  Result := PAtspiEventListenerClass(PGTypeInstance(obj)^.g_class);
end;



end.
