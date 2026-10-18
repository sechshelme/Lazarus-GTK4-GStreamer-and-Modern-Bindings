{$IFDEF read_interface}


type
  PGVirConfigDomainAddressPrivate = type Pointer;

  PGVirConfigDomainAddress = ^TGVirConfigDomainAddress;
  TGVirConfigDomainAddress = record
    parent: TGVirConfigObject;
    priv: PGVirConfigDomainAddressPrivate;
  end;

  PGVirConfigDomainAddressClass = ^TGVirConfigDomainAddressClass;
  TGVirConfigDomainAddressClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_address_get_type: TGType; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:56:19 ===

function GVIR_CONFIG_TYPE_DOMAIN_ADDRESS: TGType;
function GVIR_CONFIG_DOMAIN_ADDRESS(obj: Pointer): PGVirConfigDomainAddress;
function GVIR_CONFIG_DOMAIN_ADDRESS_CLASS(klass: Pointer): PGVirConfigDomainAddressClass;
function GVIR_CONFIG_IS_DOMAIN_ADDRESS(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_ADDRESS_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_ADDRESS_GET_CLASS(obj: Pointer): PGVirConfigDomainAddressClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_ADDRESS: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_ADDRESS := gvir_config_domain_address_get_type;
end;

function GVIR_CONFIG_DOMAIN_ADDRESS(obj: Pointer): PGVirConfigDomainAddress;
begin
  Result := PGVirConfigDomainAddress(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_ADDRESS));
end;

function GVIR_CONFIG_DOMAIN_ADDRESS_CLASS(klass: Pointer): PGVirConfigDomainAddressClass;
begin
  Result := PGVirConfigDomainAddressClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_ADDRESS));
end;

function GVIR_CONFIG_IS_DOMAIN_ADDRESS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_ADDRESS);
end;

function GVIR_CONFIG_IS_DOMAIN_ADDRESS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_ADDRESS);
end;

function GVIR_CONFIG_DOMAIN_ADDRESS_GET_CLASS(obj: Pointer): PGVirConfigDomainAddressClass;
begin
  Result := PGVirConfigDomainAddressClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
