

  {$IFDEF read_struct}
type
  PAtspiDeviceLegacy = ^TAtspiDeviceLegacy;
  TAtspiDeviceLegacy = record
    parent: TAtspiDevice;
  end;

  PAtspiDeviceLegacyClass = ^TAtspiDeviceLegacyClass;
  TAtspiDeviceLegacyClass = record
    parent_class: TAtspiDeviceClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function atspi_device_legacy_get_type: TGType; cdecl; external libatspi;
function atspi_device_legacy_new: PAtspiDeviceLegacy; cdecl; external libatspi;

// === Konventiert am: 26-9-26 12:52:25 ===

function ATSPI_TYPE_DEVICE_LEGACY: TGType;
function ATSPI_DEVICE_LEGACY(obj: Pointer): PAtspiDeviceLegacy;
function ATSPI_DEVICE_LEGACY_CLASS(klass: Pointer): PAtspiDeviceLegacyClass;
function ATSPI_IS_DEVICE_LEGACY(obj: Pointer): Tgboolean;
function ATSPI_IS_DEVICE_LEGACY_CLASS(klass: Pointer): Tgboolean;
function ATSPI_DEVICE_LEGACY_GET_CLASS(obj: Pointer): PAtspiDeviceLegacyClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function ATSPI_TYPE_DEVICE_LEGACY: TGType;
begin
  ATSPI_TYPE_DEVICE_LEGACY := atspi_device_legacy_get_type;
end;

function ATSPI_DEVICE_LEGACY(obj: Pointer): PAtspiDeviceLegacy;
begin
  Result := PAtspiDeviceLegacy(g_type_check_instance_cast(obj, ATSPI_TYPE_DEVICE_LEGACY));
end;

function ATSPI_DEVICE_LEGACY_CLASS(klass: Pointer): PAtspiDeviceLegacyClass;
begin
  Result := PAtspiDeviceLegacyClass(g_type_check_class_cast(klass, ATSPI_TYPE_DEVICE_LEGACY));
end;

function ATSPI_IS_DEVICE_LEGACY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ATSPI_TYPE_DEVICE_LEGACY);
end;

function ATSPI_IS_DEVICE_LEGACY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ATSPI_TYPE_DEVICE_LEGACY);
end;

function ATSPI_DEVICE_LEGACY_GET_CLASS(obj: Pointer): PAtspiDeviceLegacyClass;
begin
  Result := PAtspiDeviceLegacyClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
