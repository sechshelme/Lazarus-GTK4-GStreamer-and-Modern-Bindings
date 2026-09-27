unit atspi_device_x11;

interface

uses
  fp_glib2, fp_atspi, atspi_device;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAtspiDeviceX11 = ^TAtspiDeviceX11;
  TAtspiDeviceX11 = record
    parent: TAtspiDevice;
  end;

  PAtspiDeviceX11Class = ^TAtspiDeviceX11Class;
  TAtspiDeviceX11Class = record
    parent_class: TAtspiDeviceClass;
  end;

function atspi_device_x11_get_type: TGType; cdecl; external libatspi;
function atspi_device_x11_new: PAtspiDeviceX11; cdecl; external libatspi;

// === Konventiert am: 26-9-26 12:52:13 ===

function ATSPI_TYPE_DEVICE_X11: TGType;
function ATSPI_DEVICE_X11(obj: Pointer): PAtspiDeviceX11;
function ATSPI_DEVICE_X11_CLASS(klass: Pointer): PAtspiDeviceX11Class;
function ATSPI_IS_DEVICE_X11(obj: Pointer): Tgboolean;
function ATSPI_IS_DEVICE_X11_CLASS(klass: Pointer): Tgboolean;
function ATSPI_DEVICE_X11_GET_CLASS(obj: Pointer): PAtspiDeviceX11Class;

implementation

function ATSPI_TYPE_DEVICE_X11: TGType;
begin
  ATSPI_TYPE_DEVICE_X11 := atspi_device_x11_get_type;
end;

function ATSPI_DEVICE_X11(obj: Pointer): PAtspiDeviceX11;
begin
  Result := PAtspiDeviceX11(g_type_check_instance_cast(obj, ATSPI_TYPE_DEVICE_X11));
end;

function ATSPI_DEVICE_X11_CLASS(klass: Pointer): PAtspiDeviceX11Class;
begin
  Result := PAtspiDeviceX11Class(g_type_check_class_cast(klass, ATSPI_TYPE_DEVICE_X11));
end;

function ATSPI_IS_DEVICE_X11(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_DEVICE_X11);
end;

function ATSPI_IS_DEVICE_X11_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ATSPI_TYPE_DEVICE_X11);
end;

function ATSPI_DEVICE_X11_GET_CLASS(obj: Pointer): PAtspiDeviceX11Class;
begin
  Result := PAtspiDeviceX11Class(PGTypeInstance(obj)^.g_class);
end;



end.
