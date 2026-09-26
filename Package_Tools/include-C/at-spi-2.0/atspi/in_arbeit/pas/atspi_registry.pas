unit atspi_registry;

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
{$ifndef _ATSPI_REGISTRY_H_}
{$define _ATSPI_REGISTRY_H_}
{$include "atspi-accessible.h"}
{$include "atspi-device-listener.h"}
{$include "atspi-types.h"}
type

  TAtspiGenerateMouseEventCB = procedure (user_data:pointer);cdecl;

function atspi_key_definition_get_type:TGType;cdecl;external libatspi;
function atspi_get_desktop_count:Tgint;cdecl;external libatspi;
function atspi_get_desktop(i:Tgint):PAtspiAccessible;cdecl;external libatspi;
function atspi_get_desktop_list:PGArray;cdecl;external libatspi;
function atspi_register_keystroke_listener(listener:PAtspiDeviceListener; key_set:PGArray; modmask:TAtspiKeyMaskType; event_types:TAtspiKeyEventMask; sync_type:TAtspiKeyListenerSyncType; 
           error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_deregister_keystroke_listener(listener:PAtspiDeviceListener; key_set:PGArray; modmask:TAtspiKeyMaskType; event_types:TAtspiKeyEventMask; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_register_device_event_listener(listener:PAtspiDeviceListener; event_types:TAtspiDeviceEventMask; filter:pointer; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_deregister_device_event_listener(listener:PAtspiDeviceListener; filter:pointer; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_generate_keyboard_event(keyval:Tglong; keystring:Pgchar; synth_type:TAtspiKeySynthType; error:PPGError):Tgboolean;cdecl;external libatspi;
function atspi_generate_mouse_event(x:Tglong; y:Tglong; name:Pgchar; error:PPGError):Tgboolean;cdecl;external libatspi;
procedure atspi_generate_mouse_event_async(x:Tglong; y:Tglong; name:Pgchar; callback:TAtspiGenerateMouseEventCB; callback_data:pointer; 
            error:PPGError);cdecl;external libatspi;
procedure atspi_set_reference_window(accessible:PAtspiAccessible);cdecl;external libatspi;
{$endif}
{ _ATSPI_REGISTRY_H_  }

// === Konventiert am: 26-9-26 13:15:48 ===


implementation



end.
