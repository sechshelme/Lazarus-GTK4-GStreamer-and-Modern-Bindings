{$IFDEF read_interface}


type
  PGVirConfigDomainControllerUsbPrivate = type Pointer;

  PGVirConfigDomainControllerUsb = ^TGVirConfigDomainControllerUsb;
  TGVirConfigDomainControllerUsb = record
    parent: TGVirConfigDomainController;
    priv: PGVirConfigDomainControllerUsbPrivate;
  end;

  PGVirConfigDomainControllerUsbClass = ^TGVirConfigDomainControllerUsbClass;
  TGVirConfigDomainControllerUsbClass = record
    parent_class: TGVirConfigDomainControllerClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirConfigDomainControllerUsbModel = ^TGVirConfigDomainControllerUsbModel;
  TGVirConfigDomainControllerUsbModel = longint;
const
  GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_PIIX3_UHCI = 0;
  GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_PIIX4_UHCI = 1;
  GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_EHCI = 2;
  GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_ICH9_EHCI1 = 3;
  GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_ICH9_UHCI1 = 4;
  GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_ICH9_UHCI2 = 5;
  GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_ICH9_UHCI3 = 6;
  GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_VT82C686B_UHCI = 7;
  GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_PCI_OHCI = 8;
  GVIR_CONFIG_DOMAIN_CONTROLLER_USB_MODEL_QEMU_XHCI = 9;

function gvir_config_domain_controller_usb_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_controller_usb_new: PGVirConfigDomainControllerUsb; cdecl; external libvirtgconfig;
function gvir_config_domain_controller_usb_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainControllerUsb; cdecl; external libvirtgconfig;
procedure gvir_config_domain_controller_usb_set_model(controller: PGVirConfigDomainControllerUsb; model: TGVirConfigDomainControllerUsbModel); cdecl; external libvirtgconfig;
procedure gvir_config_domain_controller_usb_set_master(controller: PGVirConfigDomainControllerUsb; master: PGVirConfigDomainControllerUsb; startport: Tguint); cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:59:39 ===

function GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER_USB: TGType;
function GVIR_CONFIG_DOMAIN_CONTROLLER_USB(obj: Pointer): PGVirConfigDomainControllerUsb;
function GVIR_CONFIG_DOMAIN_CONTROLLER_USB_CLASS(klass: Pointer): PGVirConfigDomainControllerUsbClass;
function GVIR_CONFIG_IS_DOMAIN_CONTROLLER_USB(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CONTROLLER_USB_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_CONTROLLER_USB_GET_CLASS(obj: Pointer): PGVirConfigDomainControllerUsbClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER_USB: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER_USB := gvir_config_domain_controller_usb_get_type;
end;

function GVIR_CONFIG_DOMAIN_CONTROLLER_USB(obj: Pointer): PGVirConfigDomainControllerUsb;
begin
  Result := PGVirConfigDomainControllerUsb(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER_USB));
end;

function GVIR_CONFIG_DOMAIN_CONTROLLER_USB_CLASS(klass: Pointer): PGVirConfigDomainControllerUsbClass;
begin
  Result := PGVirConfigDomainControllerUsbClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER_USB));
end;

function GVIR_CONFIG_IS_DOMAIN_CONTROLLER_USB(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER_USB);
end;

function GVIR_CONFIG_IS_DOMAIN_CONTROLLER_USB_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER_USB);
end;

function GVIR_CONFIG_DOMAIN_CONTROLLER_USB_GET_CLASS(obj: Pointer): PGVirConfigDomainControllerUsbClass;
begin
  Result := PGVirConfigDomainControllerUsbClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
