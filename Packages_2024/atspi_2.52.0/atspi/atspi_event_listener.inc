

  {$IFDEF read_struct}
type
  TAtspiEventListenerCB = procedure(event: PAtspiEvent; user_data: pointer); cdecl;
  TAtspiEventListenerSimpleCB = procedure(event: PAtspiEvent); cdecl;

type
  PAtspiEventListener = ^TAtspiEventListener;
  TAtspiEventListener = record
    parent: TGObject;
    callback: TAtspiEventListenerCB;
    user_data: pointer;
    cb_destroyed: TGDestroyNotify;
  end;

  PAtspiEventListenerClass = ^TAtspiEventListenerClass;
  TAtspiEventListenerClass = record
    parent_class: TGObjectClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function atspi_event_get_type: TGType; cdecl; external libatspi;
function atspi_event_listener_get_type: TGType; cdecl; external libatspi;
function atspi_event_listener_new(callback: TAtspiEventListenerCB; user_data: Tgpointer; callback_destroyed: TGDestroyNotify): PAtspiEventListener; cdecl; external libatspi;
function atspi_event_listener_new_simple(callback: TAtspiEventListenerSimpleCB; callback_destroyed: TGDestroyNotify): PAtspiEventListener; cdecl; external libatspi;
function atspi_event_listener_register(listener: PAtspiEventListener; event_type: Pgchar; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_event_listener_register_full(listener: PAtspiEventListener; event_type: Pgchar; properties: PGArray; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_event_listener_register_with_app(listener: PAtspiEventListener; event_type: Pgchar; properties: PGArray; app: PAtspiAccessible; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_event_listener_register_from_callback(callback: TAtspiEventListenerCB; user_data: pointer; callback_destroyed: TGDestroyNotify; event_type: Pgchar; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_event_listener_register_from_callback_full(callback: TAtspiEventListenerCB; user_data: pointer; callback_destroyed: TGDestroyNotify; event_type: Pgchar; properties: PGArray;
  error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_event_listener_register_from_callback_with_app(callback: TAtspiEventListenerCB; user_data: pointer; callback_destroyed: TGDestroyNotify; event_type: Pgchar; properties: PGArray;
  app: PAtspiAccessible; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_event_listener_register_no_data(callback: TAtspiEventListenerSimpleCB; callback_destroyed: TGDestroyNotify; event_type: Pgchar; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_event_listener_deregister(listener: PAtspiEventListener; event_type: Pgchar; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_event_listener_deregister_from_callback(callback: TAtspiEventListenerCB; user_data: pointer; event_type: Pgchar; error: PPGError): Tgboolean; cdecl; external libatspi;
function atspi_event_listener_deregister_no_data(callback: TAtspiEventListenerSimpleCB; event_type: Pgchar; error: PPGError): Tgboolean; cdecl; external libatspi;

function ATSPI_TYPE_EVENT: TGType;

// === Konventiert am: 26-9-26 13:08:05 ===

function ATSPI_TYPE_EVENT_LISTENER: TGType;
function ATSPI_EVENT_LISTENER(obj: Pointer): PAtspiEventListener;
function ATSPI_EVENT_LISTENER_CLASS(klass: Pointer): PAtspiEventListenerClass;
function ATSPI_IS_EVENT_LISTENER(obj: Pointer): Tgboolean;
function ATSPI_IS_EVENT_LISTENER_CLASS(klass: Pointer): Tgboolean;
function ATSPI_EVENT_LISTENER_GET_CLASS(obj: Pointer): PAtspiEventListenerClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function ATSPI_TYPE_EVENT_LISTENER: TGType;
begin
  ATSPI_TYPE_EVENT_LISTENER := atspi_event_listener_get_type;
end;

function ATSPI_EVENT_LISTENER(obj: Pointer): PAtspiEventListener;
begin
  Result := PAtspiEventListener(g_type_check_instance_cast(obj, ATSPI_TYPE_EVENT_LISTENER));
end;

function ATSPI_EVENT_LISTENER_CLASS(klass: Pointer): PAtspiEventListenerClass;
begin
  Result := PAtspiEventListenerClass(g_type_check_class_cast(klass, ATSPI_TYPE_EVENT_LISTENER));
end;

function ATSPI_IS_EVENT_LISTENER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_EVENT_LISTENER);
end;

function ATSPI_IS_EVENT_LISTENER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ATSPI_TYPE_EVENT_LISTENER);
end;

function ATSPI_EVENT_LISTENER_GET_CLASS(obj: Pointer): PAtspiEventListenerClass;
begin
  Result := PAtspiEventListenerClass(PGTypeInstance(obj)^.g_class);
end;


function ATSPI_TYPE_EVENT: TGType;
begin
  ATSPI_TYPE_EVENT := atspi_event_get_type;
end;

{$ENDIF read_implementation}
