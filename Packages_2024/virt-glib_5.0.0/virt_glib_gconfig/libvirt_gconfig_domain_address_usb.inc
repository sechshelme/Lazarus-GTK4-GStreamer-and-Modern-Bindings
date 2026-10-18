{$IFDEF read_interface}


type
  PGVirConfigDomainAddressUsbPrivate = type Pointer;

  PGVirConfigDomainAddressUsb = ^TGVirConfigDomainAddressUsb;
  TGVirConfigDomainAddressUsb = record
    parent: TGVirConfigDomainAddress;
    priv: PGVirConfigDomainAddressUsbPrivate;
  end;

  PGVirConfigDomainAddressUsbClass = ^TGVirConfigDomainAddressUsbClass;
  TGVirConfigDomainAddressUsbClass = record
    parent_class: TGVirConfigDomainAddressClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_address_usb_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_address_usb_new: PGVirConfigDomainAddressUsb; cdecl; external libvirtgconfig;
function gvir_config_domain_address_usb_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainAddressUsb; cdecl; external libvirtgconfig;
procedure gvir_config_domain_address_usb_set_bus(address: PGVirConfigDomainAddressUsb; bus: Tguint16); cdecl; external libvirtgconfig;
procedure gvir_config_domain_address_usb_set_port(address: PGVirConfigDomainAddressUsb; port: pchar); cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:56:14 ===

function GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_USB: TGType;
function GVIR_CONFIG_DOMAIN_ADDRESS_USB(obj: Pointer): PGVirConfigDomainAddressUsb;
function GVIR_CONFIG_DOMAIN_ADDRESS_USB_CLASS(klass: Pointer): PGVirConfigDomainAddressUsbClass;
function GVIR_CONFIG_IS_DOMAIN_ADDRESS_USB(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_ADDRESS_USB_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_ADDRESS_USB_GET_CLASS(obj: Pointer): PGVirConfigDomainAddressUsbClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_USB: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_USB := gvir_config_domain_address_usb_get_type;
end;

function GVIR_CONFIG_DOMAIN_ADDRESS_USB(obj: Pointer): PGVirConfigDomainAddressUsb;
begin
  Result := PGVirConfigDomainAddressUsb(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_USB));
end;

function GVIR_CONFIG_DOMAIN_ADDRESS_USB_CLASS(klass: Pointer): PGVirConfigDomainAddressUsbClass;
begin
  Result := PGVirConfigDomainAddressUsbClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_USB));
end;

function GVIR_CONFIG_IS_DOMAIN_ADDRESS_USB(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_USB);
end;

function GVIR_CONFIG_IS_DOMAIN_ADDRESS_USB_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_ADDRESS_USB);
end;

function GVIR_CONFIG_DOMAIN_ADDRESS_USB_GET_CLASS(obj: Pointer): PGVirConfigDomainAddressUsbClass;
begin
  Result := PGVirConfigDomainAddressUsbClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
