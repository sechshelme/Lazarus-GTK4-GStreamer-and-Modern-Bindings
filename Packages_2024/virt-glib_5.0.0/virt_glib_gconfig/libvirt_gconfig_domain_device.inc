{$IFDEF read_interface}


type
  PGVirConfigDomainDevicePrivate = type Pointer;

  PGVirConfigDomainDevice = ^TGVirConfigDomainDevice;
  TGVirConfigDomainDevice = record
    parent: TGVirConfigObject;
    priv: PGVirConfigDomainDevicePrivate;
  end;

  PGVirConfigDomainDeviceClass = ^TGVirConfigDomainDeviceClass;
  TGVirConfigDomainDeviceClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_device_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_device_get_alias(dev: PGVirConfigDomainDevice): Pgchar; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 20:09:12 ===

function GVIR_CONFIG_TYPE_DOMAIN_DEVICE: TGType;
function GVIR_CONFIG_DOMAIN_DEVICE(obj: Pointer): PGVirConfigDomainDevice;
function GVIR_CONFIG_DOMAIN_DEVICE_CLASS(klass: Pointer): PGVirConfigDomainDeviceClass;
function GVIR_CONFIG_IS_DOMAIN_DEVICE(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_DEVICE_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_DEVICE_GET_CLASS(obj: Pointer): PGVirConfigDomainDeviceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_DEVICE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_DEVICE := gvir_config_domain_device_get_type;
end;

function GVIR_CONFIG_DOMAIN_DEVICE(obj: Pointer): PGVirConfigDomainDevice;
begin
  Result := PGVirConfigDomainDevice(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_DEVICE));
end;

function GVIR_CONFIG_DOMAIN_DEVICE_CLASS(klass: Pointer): PGVirConfigDomainDeviceClass;
begin
  Result := PGVirConfigDomainDeviceClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_DEVICE));
end;

function GVIR_CONFIG_IS_DOMAIN_DEVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_DEVICE);
end;

function GVIR_CONFIG_IS_DOMAIN_DEVICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_DEVICE);
end;

function GVIR_CONFIG_DOMAIN_DEVICE_GET_CLASS(obj: Pointer): PGVirConfigDomainDeviceClass;
begin
  Result := PGVirConfigDomainDeviceClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
