unit atspi_types;

interface

uses
  fp_glib2, fp_atspi, atspi_constants;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAtspiControllerEventMask = ^TAtspiControllerEventMask;
  TAtspiControllerEventMask = Tguint;

  PAtspiKeyMaskType = ^TAtspiKeyMaskType;
  TAtspiKeyMaskType = Tguint;

  PAtspiKeyEventMask = ^TAtspiKeyEventMask;
  TAtspiKeyEventMask = Tguint;

  PAtspiDeviceEventMask = ^TAtspiDeviceEventMask;
  TAtspiDeviceEventMask = Tguint;

  PAtspiDeviceEvent = ^TAtspiDeviceEvent;
  TAtspiDeviceEvent = record
    _type: TAtspiEventType;
    id: Tguint;
    hw_code: Tgushort;
    modifiers: Tgushort;
    timestamp: Tguint;
    event_string: Pgchar;
    is_text: Tgboolean;
  end;

  PAtspiEventListenerMode = ^TAtspiEventListenerMode;
  TAtspiEventListenerMode = record
    synchronous: Tgboolean;
    preemptive: Tgboolean;
    global: Tgboolean;
  end;

  PAtspiKeyDefinition = ^TAtspiKeyDefinition;
  TAtspiKeyDefinition = record
    keycode: Tgint;
    keysym: Tgint;
    keystring: Pgchar;
    modifiers: Tguint;
  end;

  PAtspiEvent = ^TAtspiEvent;
  TAtspiEvent = record
    _type: Pgchar;
    source: PAtspiAccessible;
    detail1: Tgint;
    detail2: Tgint;
    any_data: TGValue;
    sender: PAtspiAccessible;
  end;

type
  PAtspiKeystrokeListener = ^TAtspiKeystrokeListener;
  TAtspiKeystrokeListener = pointer;

  PAtspiKeySet = ^TAtspiKeySet;
  TAtspiKeySet = record
    keysyms: Pguint;
    keycodes: Pgushort;
    keystrings: ^Pgchar;
    len: Tgshort;
  end;

type
  PAtspiKeyListenerSyncType = ^TAtspiKeyListenerSyncType;
  TAtspiKeyListenerSyncType = longint;
const
  ATSPI_KEYLISTENER_NOSYNC = 0;
  ATSPI_KEYLISTENER_SYNCHRONOUS = 1 shl 0;
  ATSPI_KEYLISTENER_CANCONSUME = 1 shl 1;
  ATSPI_KEYLISTENER_ALL_WINDOWS = 1 shl 2;

  // === Konventiert am: 26-9-26 13:14:53 ===

function ATSPI_TYPE_KEY_DEFINITION: TGType;
function ATSPI_TYPE_DEVICE_EVENT: TGType;
function ATSPI_TYPE_EVENT: TGType;



implementation


function ATSPI_TYPE_KEY_DEFINITION: TGType;
begin
  ATSPI_TYPE_KEY_DEFINITION := atspi_key_definition_get_type;
end;

function ATSPI_TYPE_DEVICE_EVENT: TGType;
begin
  ATSPI_TYPE_DEVICE_EVENT := atspi_device_event_get_type;
end;

function ATSPI_TYPE_EVENT: TGType;
begin
  ATSPI_TYPE_EVENT := atspi_event_get_type;
end;


end.
