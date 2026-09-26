
unit atspi_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from atspi_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    atspi_types.h
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
PAtspiControllerEventMask  = ^AtspiControllerEventMask;
PAtspiDeviceEvent  = ^AtspiDeviceEvent;
PAtspiDeviceEventMask  = ^AtspiDeviceEventMask;
PAtspiEvent  = ^AtspiEvent;
PAtspiEventListenerMode  = ^AtspiEventListenerMode;
PAtspiKeyDefinition  = ^AtspiKeyDefinition;
PAtspiKeyEventMask  = ^AtspiKeyEventMask;
PAtspiKeyListenerSyncType  = ^AtspiKeyListenerSyncType;
PAtspiKeyMaskType  = ^AtspiKeyMaskType;
PAtspiKeySet  = ^AtspiKeySet;
PAtspiKeystrokeListener  = ^AtspiKeystrokeListener;
Pgchar  = ^gchar;
Pguint  = ^guint;
Pgushort  = ^gushort;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * AT-SPI - Assistive Technology Service Provider Interface
 * (Gnome Accessibility Project; http://developer.gnome.org/projects/gap)
 *
 * Copyright 2002 Ximian, Inc.
 *           2002 Sun Microsystems Inc.
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
{$ifndef _ATSPI_TYPES_H_}
{$define _ATSPI_TYPES_H_}
{$include "glib-object.h"}
{$include "atspi-constants.h"}
{*
 * AtspiTypes:
 *
 * Type definitions needed by multiple interfaces.
  }
type

  PAtspiControllerEventMask = ^TAtspiControllerEventMask;
  TAtspiControllerEventMask = Tguint;

  PAtspiKeyMaskType = ^TAtspiKeyMaskType;
  TAtspiKeyMaskType = Tguint;

  PAtspiKeyEventMask = ^TAtspiKeyEventMask;
  TAtspiKeyEventMask = Tguint;

  PAtspiDeviceEventMask = ^TAtspiDeviceEventMask;
  TAtspiDeviceEventMask = Tguint;
{ TODO: auto-generate the below structs }
  PAtspiDeviceEvent = ^TAtspiDeviceEvent;
  TAtspiDeviceEvent = record
      _type : TAtspiEventType;
      id : Tguint;
      hw_code : Tgushort;
      modifiers : Tgushort;
      timestamp : Tguint;
      event_string : Pgchar;
      is_text : Tgboolean;
    end;

  PAtspiEventListenerMode = ^TAtspiEventListenerMode;
  TAtspiEventListenerMode = record
      synchronous : Tgboolean;
      preemptive : Tgboolean;
      global : Tgboolean;
    end;

  PAtspiKeyDefinition = ^TAtspiKeyDefinition;
  TAtspiKeyDefinition = record
      keycode : Tgint;
      keysym : Tgint;
      keystring : Pgchar;
      modifiers : Tguint;
    end;

{*
 * ATSPI_TYPE_KEY_DEFINITION:
 *
 * The #GType for a boxed type holding a #AtspiKeyDefinition.
  }

{ was #define dname def_expr }
function ATSPI_TYPE_KEY_DEFINITION : longint; { return type might be wrong }

type
  PAtspiEvent = ^TAtspiEvent;
  TAtspiEvent = record
      _type : Pgchar;
      source : PAtspiAccessible;
      detail1 : Tgint;
      detail2 : Tgint;
      any_data : TGValue;
      sender : PAtspiAccessible;
    end;

{*
 * ATSPI_TYPE_DEVICE_EVENT:
 *
 * The #GType for a boxed type holding a #AtspiDeviceEvent.
  }

{ was #define dname def_expr }
function ATSPI_TYPE_DEVICE_EVENT : longint; { return type might be wrong }

{*
 * ATSPI_TYPE_EVENT:
 *
 * The #GType for a boxed type holding a #AtspiEvent.
  }
{ was #define dname def_expr }
function ATSPI_TYPE_EVENT : longint; { return type might be wrong }

type
  PAtspiKeystrokeListener = ^TAtspiKeystrokeListener;
  TAtspiKeystrokeListener = pointer;
{*
 * AtspiKeySet:
 * @keysyms:
 * @keycodes:
 * @len:
 *
 * Structure containing identifying information about a set of keycode or
 *        keysyms.
 * }

  PAtspiKeySet = ^TAtspiKeySet;
  TAtspiKeySet = record
      keysyms : Pguint;
      keycodes : Pgushort;
      keystrings : ^Pgchar;
      len : Tgshort;
    end;
{*
 * AtspiKeyListenerSyncType:
 * @ATSPI_KEYLISTENER_NOSYNC: Events may be delivered asynchronously,
 * which means in some cases they may already have been delivered to the
 * application before the AT client receives the notification.
 * @ATSPI_KEYLISTENER_SYNCHRONOUS: Events are delivered synchronously, before the
 * currently focused application sees them.
 * @ATSPI_KEYLISTENER_CANCONSUME: Events may be consumed by the AT client.  Presumes and
 * requires #ATSPI_KEYLISTENER_SYNCHRONOUS, incompatible with #ATSPI_KEYLISTENER_NOSYNC.
 * @ATSPI_KEYLISTENER_ALL_WINDOWS: Events are received not from the application toolkit layer, but
 * from the device driver or windowing system subsystem; such notifications are 'global' in the
 * sense that they are not broken or defeated by applications that participate poorly
 * in the accessibility APIs, or not at all; however because of the intrusive nature of
 * such snooping, it can have side-effects on certain older platforms.  If unconditional
 * event notifications, even when inaccessible or "broken" applications have focus, are not
 * required, it may be best to avoid this enum value/flag.
 *
 * Specifies the type of a key listener event.
 * The values above can and should be bitwise-'OR'-ed
 * together, observing the compatibility limitations specified in the description of
 * each value.  For instance, #ATSPI_KEYLISTENER_ALL_WINDOWS | #ATSPI_KEYLISTENER_CANCONSUME is
 * a commonly used combination which gives the AT complete control over the delivery of matching
 * events.  However, such filters should be used sparingly as they may have a negative impact on
 * system performance.
 * }

  PAtspiKeyListenerSyncType = ^TAtspiKeyListenerSyncType;
  TAtspiKeyListenerSyncType =  Longint;
  Const
    ATSPI_KEYLISTENER_NOSYNC = 0;
    ATSPI_KEYLISTENER_SYNCHRONOUS = 1 shl 0;
    ATSPI_KEYLISTENER_CANCONSUME = 1 shl 1;
    ATSPI_KEYLISTENER_ALL_WINDOWS = 1 shl 2;
;
{$endif}
{ _ATSPI_TYPES_H_  }

implementation

{ was #define dname def_expr }
function ATSPI_TYPE_KEY_DEFINITION : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_KEY_DEFINITION:=atspi_key_definition_get_type;
  end;

{ was #define dname def_expr }
function ATSPI_TYPE_DEVICE_EVENT : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_DEVICE_EVENT:=atspi_device_event_get_type;
  end;

{ was #define dname def_expr }
function ATSPI_TYPE_EVENT : longint; { return type might be wrong }
  begin
    ATSPI_TYPE_EVENT:=atspi_event_get_type;
  end;


end.
