
unit atspi_event_listener;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_event_listener.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_event_listener.h
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
PAtspiEvent  = ^AtspiEvent;
PAtspiEventListener  = ^AtspiEventListener;
PAtspiEventListenerClass  = ^AtspiEventListenerClass;
PGArray  = ^GArray;
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
{$ifndef _ATSPI_EVENT_LISTENER_H_}
{$define _ATSPI_EVENT_LISTENER_H_}
{$include "glib-object.h"}
{$include "atspi-types.h"}

function atspi_event_get_type:TGType;cdecl;external;
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
(* Const before type ignored *)

  TAtspiEventListenerSimpleCB = procedure (event:PAtspiEvent);cdecl;

{ was #define dname def_expr }
function ATSPI_TYPE_EVENT_LISTENER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_EVENT_LISTENER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_EVENT_LISTENER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_EVENT_LISTENER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_EVENT_LISTENER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_EVENT_LISTENER_GET_CLASS(obj : longint) : longint;

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


function atspi_event_listener_get_type:TGType;cdecl;external;
function atspi_event_listener_new(callback:TAtspiEventListenerCB; user_data:Tgpointer; callback_destroyed:TGDestroyNotify):PAtspiEventListener;cdecl;external;
function atspi_event_listener_new_simple(callback:TAtspiEventListenerSimpleCB; callback_destroyed:TGDestroyNotify):PAtspiEventListener;cdecl;external;
(* Const before type ignored *)
function atspi_event_listener_register(listener:PAtspiEventListener; event_type:Pgchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function atspi_event_listener_register_full(listener:PAtspiEventListener; event_type:Pgchar; properties:PGArray; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function atspi_event_listener_register_with_app(listener:PAtspiEventListener; event_type:Pgchar; properties:PGArray; app:PAtspiAccessible; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function atspi_event_listener_register_from_callback(callback:TAtspiEventListenerCB; user_data:pointer; callback_destroyed:TGDestroyNotify; event_type:Pgchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function atspi_event_listener_register_from_callback_full(callback:TAtspiEventListenerCB; user_data:pointer; callback_destroyed:TGDestroyNotify; event_type:Pgchar; properties:PGArray; 
           error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function atspi_event_listener_register_from_callback_with_app(callback:TAtspiEventListenerCB; user_data:pointer; callback_destroyed:TGDestroyNotify; event_type:Pgchar; properties:PGArray; 
           app:PAtspiAccessible; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function atspi_event_listener_register_no_data(callback:TAtspiEventListenerSimpleCB; callback_destroyed:TGDestroyNotify; event_type:Pgchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function atspi_event_listener_deregister(listener:PAtspiEventListener; event_type:Pgchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function atspi_event_listener_deregister_from_callback(callback:TAtspiEventListenerCB; user_data:pointer; event_type:Pgchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function atspi_event_listener_deregister_no_data(callback:TAtspiEventListenerSimpleCB; event_type:Pgchar; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ _ATSPI_EVENT_LISTENER_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_EVENT_LISTENER : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_EVENT_LISTENER:=atspi_event_listener_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_EVENT_LISTENER(obj : longint) : longint;
begin
  ATSPI_EVENT_LISTENER:=G_TYPE_CHECK_INSTANCE_CAST(obj,ATSPI_TYPE_EVENT_LISTENER,AtspiEventListener);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_EVENT_LISTENER_CLASS(klass : longint) : longint;
begin
  ATSPI_EVENT_LISTENER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,ATSPI_TYPE_EVENT_LISTENER,AtspiEventListenerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_EVENT_LISTENER(obj : longint) : longint;
begin
  ATSPI_IS_EVENT_LISTENER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,ATSPI_TYPE_EVENT_LISTENER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_IS_EVENT_LISTENER_CLASS(klass : longint) : longint;
begin
  ATSPI_IS_EVENT_LISTENER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,ATSPI_TYPE_EVENT_LISTENER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ATSPI_EVENT_LISTENER_GET_CLASS(obj : longint) : longint;
begin
  ATSPI_EVENT_LISTENER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,ATSPI_TYPE_EVENT_LISTENER,AtspiEventListenerClass);
end;


end.
