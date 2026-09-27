

  {$IFDEF read_struct}
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
    source: Pointer; // PAtspiAccessible;
    detail1: Tgint;
    detail2: Tgint;
    any_data: TGValue;
    sender: Pointer; // PAtspiAccessible;
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
  {$ENDIF read_struct}

  {$IFDEF read_enum}
type
  PAtspiKeyListenerSyncType = ^TAtspiKeyListenerSyncType;
  TAtspiKeyListenerSyncType = longint;
const
  ATSPI_KEYLISTENER_NOSYNC = 0;
  ATSPI_KEYLISTENER_SYNCHRONOUS = 1 shl 0;
  ATSPI_KEYLISTENER_CANCONSUME = 1 shl 1;
  ATSPI_KEYLISTENER_ALL_WINDOWS = 1 shl 2;
  {$ENDIF read_enum}

  // === Konventiert am: 26-9-26 13:14:53 ===


{$IFDEF read_implementation}


{$ENDIF read_implementation}
