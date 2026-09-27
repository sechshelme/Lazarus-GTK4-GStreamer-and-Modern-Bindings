

  {$IFDEF read_struct}
type
  TAtspiGenerateMouseEventCB = procedure(user_data: pointer); cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function atspi_key_definition_get_type: TGType; cdecl; external libatspi;
function atspi_get_desktop_count: Tgint; cdecl; external libatspi;
function atspi_get_desktop(i: Tgint): PAtspiAccessible; cdecl; external libatspi;
function atspi_get_desktop_list: PGArray; cdecl; external libatspi;
function atspi_register_keystroke_listener(listener: PAtspiDeviceListener; key_set: PGArray; modmask: TAtspiKeyMaskType; event_types: TAtspiKeyEventMask; sync_type: TAtspiKeyListenerSyncType;
  error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_deregister_keystroke_listener(listener: PAtspiDeviceListener; key_set: PGArray; modmask: TAtspiKeyMaskType; event_types: TAtspiKeyEventMask; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_register_device_event_listener(listener: PAtspiDeviceListener; event_types: TAtspiDeviceEventMask; filter: pointer; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_deregister_device_event_listener(listener: PAtspiDeviceListener; filter: pointer; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_generate_keyboard_event(keyval: Tglong; keystring: Pgchar; synth_type: TAtspiKeySynthType; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_generate_mouse_event(x: Tglong; y: Tglong; name: Pgchar; error: PPGError): Tgboolean; cdecl; external libatspi;
procedure atspi_generate_mouse_event_async(x: Tglong; y: Tglong; name: Pgchar; callback: TAtspiGenerateMouseEventCB; callback_data: pointer;
  error: PPGError); cdecl; external libatspi;
procedure atspi_set_reference_window(accessible: PAtspiAccessible); cdecl; external libatspi;

// === Konventiert am: 26-9-26 13:15:48 ===

function ATSPI_TYPE_KEY_DEFINITION: TGType;
{$ENDIF read_function}


{$IFDEF read_implementation}

function ATSPI_TYPE_KEY_DEFINITION: TGType;
begin
  ATSPI_TYPE_KEY_DEFINITION := atspi_key_definition_get_type;
end;

{$ENDIF read_implementation}
