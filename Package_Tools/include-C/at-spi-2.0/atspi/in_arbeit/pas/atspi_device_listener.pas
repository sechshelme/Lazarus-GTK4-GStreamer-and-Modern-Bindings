unit atspi_device_listener;

interface

uses
  fp_glib2, fp_atspi, atspi_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function atspi_device_event_get_type: TGType; cdecl; external libatspi;

type
  TAtspiDeviceListenerCB = function(stroke: PAtspiDeviceEvent; user_data: pointer): Tgboolean; cdecl;
  TAtspiDeviceListenerSimpleCB = function(stroke: PAtspiDeviceEvent): Tgboolean; cdecl;

  PAtspiDeviceListener = ^TAtspiDeviceListener;
  TAtspiDeviceListener = record
    parent: TGObject;
    id: Tguint;
    callbacks: PGList;
  end;

  PAtspiDeviceListenerClass = ^TAtspiDeviceListenerClass;
  TAtspiDeviceListenerClass = record
    parent_class: TGObjectClass;
    device_event: function(listener: PAtspiDeviceListener; event: PAtspiDeviceEvent): Tgboolean; cdecl;
  end;

function atspi_device_listener_get_type: TGType; cdecl; external libatspi;
function atspi_device_listener_new(callback: TAtspiDeviceListenerCB; user_data: pointer; callback_destroyed: TGDestroyNotify): PAtspiDeviceListener; cdecl; external libatspi;
function atspi_device_listener_new_simple(callback: TAtspiDeviceListenerSimpleCB; callback_destroyed: TGDestroyNotify): PAtspiDeviceListener; cdecl; external libatspi;
procedure atspi_device_listener_add_callback(listener: PAtspiDeviceListener; callback: TAtspiDeviceListenerCB; callback_destroyed: TGDestroyNotify; user_data: pointer); cdecl; external libatspi;
procedure atspi_device_listener_remove_callback(listener: PAtspiDeviceListener; callback: TAtspiDeviceListenerCB); cdecl; external libatspi;

// === Konventiert am: 26-9-26 12:52:20 ===

function ATSPI_TYPE_DEVICE_LISTENER: TGType;
function ATSPI_DEVICE_LISTENER(obj: Pointer): PAtspiDeviceListener;
function ATSPI_DEVICE_LISTENER_CLASS(klass: Pointer): PAtspiDeviceListenerClass;
function ATSPI_IS_DEVICE_LISTENER(obj: Pointer): Tgboolean;
function ATSPI_IS_DEVICE_LISTENER_CLASS(klass: Pointer): Tgboolean;
function ATSPI_DEVICE_LISTENER_GET_CLASS(obj: Pointer): PAtspiDeviceListenerClass;

implementation

function ATSPI_TYPE_DEVICE_LISTENER: TGType;
begin
  ATSPI_TYPE_DEVICE_LISTENER := atspi_device_listener_get_type;
end;

function ATSPI_DEVICE_LISTENER(obj: Pointer): PAtspiDeviceListener;
begin
  Result := PAtspiDeviceListener(g_type_check_instance_cast(obj, ATSPI_TYPE_DEVICE_LISTENER));
end;

function ATSPI_DEVICE_LISTENER_CLASS(klass: Pointer): PAtspiDeviceListenerClass;
begin
  Result := PAtspiDeviceListenerClass(g_type_check_class_cast(klass, ATSPI_TYPE_DEVICE_LISTENER));
end;

function ATSPI_IS_DEVICE_LISTENER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_DEVICE_LISTENER);
end;

function ATSPI_IS_DEVICE_LISTENER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ATSPI_TYPE_DEVICE_LISTENER);
end;

function ATSPI_DEVICE_LISTENER_GET_CLASS(obj: Pointer): PAtspiDeviceListenerClass;
begin
  Result := PAtspiDeviceListenerClass(PGTypeInstance(obj)^.g_class);
end;



end.
