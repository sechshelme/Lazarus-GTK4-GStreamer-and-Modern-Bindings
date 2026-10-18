{$IFDEF read_interface}


type
  PGVirConfigDomainInputPrivate = type Pointer;

  PGVirConfigDomainInput = ^TGVirConfigDomainInput;
  TGVirConfigDomainInput = record
    parent: TGVirConfigDomainDevice;
    priv: PGVirConfigDomainInputPrivate;
  end;

  PGVirConfigDomainInputClass = ^TGVirConfigDomainInputClass;
  TGVirConfigDomainInputClass = record
    parent_class: TGVirConfigDomainDeviceClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirConfigDomainInputDeviceType = ^TGVirConfigDomainInputDeviceType;
  TGVirConfigDomainInputDeviceType = longint;
const
  GVIR_CONFIG_DOMAIN_INPUT_DEVICE_MOUSE = 0;
  GVIR_CONFIG_DOMAIN_INPUT_DEVICE_TABLET = 1;
  GVIR_CONFIG_DOMAIN_INPUT_DEVICE_KEYBOARD = 2;

type
  PGVirConfigDomainInputBus = ^TGVirConfigDomainInputBus;
  TGVirConfigDomainInputBus = longint;
const
  GVIR_CONFIG_DOMAIN_INPUT_BUS_PS2 = 0;
  GVIR_CONFIG_DOMAIN_INPUT_BUS_USB = 1;
  GVIR_CONFIG_DOMAIN_INPUT_BUS_XEN = 2;

function gvir_config_domain_input_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_input_new: PGVirConfigDomainInput; cdecl; external libvirtgconfig;
function gvir_config_domain_input_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainInput; cdecl; external libvirtgconfig;
function gvir_config_domain_input_get_device_type(input: PGVirConfigDomainInput): TGVirConfigDomainInputDeviceType; cdecl; external libvirtgconfig;
procedure gvir_config_domain_input_set_device_type(input: PGVirConfigDomainInput; _type: TGVirConfigDomainInputDeviceType); cdecl; external libvirtgconfig;
function gvir_config_domain_input_get_bus(input: PGVirConfigDomainInput): TGVirConfigDomainInputBus; cdecl; external libvirtgconfig;
procedure gvir_config_domain_input_set_bus(input: PGVirConfigDomainInput; bus: TGVirConfigDomainInputBus); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:43:26 ===

function GVIR_CONFIG_TYPE_DOMAIN_INPUT: TGType;
function GVIR_CONFIG_DOMAIN_INPUT(obj: Pointer): PGVirConfigDomainInput;
function GVIR_CONFIG_DOMAIN_INPUT_CLASS(klass: Pointer): PGVirConfigDomainInputClass;
function GVIR_CONFIG_IS_DOMAIN_INPUT(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_INPUT_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_INPUT_GET_CLASS(obj: Pointer): PGVirConfigDomainInputClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_INPUT: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_INPUT := gvir_config_domain_input_get_type;
end;

function GVIR_CONFIG_DOMAIN_INPUT(obj: Pointer): PGVirConfigDomainInput;
begin
  Result := PGVirConfigDomainInput(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_INPUT));
end;

function GVIR_CONFIG_DOMAIN_INPUT_CLASS(klass: Pointer): PGVirConfigDomainInputClass;
begin
  Result := PGVirConfigDomainInputClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_INPUT));
end;

function GVIR_CONFIG_IS_DOMAIN_INPUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_INPUT);
end;

function GVIR_CONFIG_IS_DOMAIN_INPUT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_INPUT);
end;

function GVIR_CONFIG_DOMAIN_INPUT_GET_CLASS(obj: Pointer): PGVirConfigDomainInputClass;
begin
  Result := PGVirConfigDomainInputClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
