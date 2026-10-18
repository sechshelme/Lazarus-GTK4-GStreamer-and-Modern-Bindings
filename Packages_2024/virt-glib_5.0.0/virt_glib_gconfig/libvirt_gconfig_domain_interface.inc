{$IFDEF read_interface}


type
  PGVirConfigDomainInterfacePrivate = type Pointer;

  PGVirConfigDomainInterface = ^TGVirConfigDomainInterface;
  TGVirConfigDomainInterface = record
    parent: TGVirConfigDomainDevice;
    priv: PGVirConfigDomainInterfacePrivate;
  end;

  PGVirConfigDomainInterfaceClass = ^TGVirConfigDomainInterfaceClass;
  TGVirConfigDomainInterfaceClass = record
    parent_class: TGVirConfigDomainDeviceClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirConfigDomainInterfaceLinkState = ^TGVirConfigDomainInterfaceLinkState;
  TGVirConfigDomainInterfaceLinkState = longint;
const
  GVIR_CONFIG_DOMAIN_INTERFACE_LINK_STATE_DEFAULT = 0;
  GVIR_CONFIG_DOMAIN_INTERFACE_LINK_STATE_UP = 1;
  GVIR_CONFIG_DOMAIN_INTERFACE_LINK_STATE_DOWN = 2;

function gvir_config_domain_interface_get_type: TGType; cdecl; external libvirtgconfig;
procedure gvir_config_domain_interface_set_ifname(iface: PGVirConfigDomainInterface; ifname: pchar); cdecl; external libvirtgconfig;
procedure gvir_config_domain_interface_set_link_state(iface: PGVirConfigDomainInterface; state: TGVirConfigDomainInterfaceLinkState); cdecl; external libvirtgconfig;
procedure gvir_config_domain_interface_set_mac(iface: PGVirConfigDomainInterface; mac_address: pchar); cdecl; external libvirtgconfig;
procedure gvir_config_domain_interface_set_model(iface: PGVirConfigDomainInterface; model: pchar); cdecl; external libvirtgconfig;
function gvir_config_domain_interface_get_ifname(iface: PGVirConfigDomainInterface): pchar; cdecl; external libvirtgconfig;
function gvir_config_domain_interface_get_link_state(iface: PGVirConfigDomainInterface): TGVirConfigDomainInterfaceLinkState; cdecl; external libvirtgconfig;
function gvir_config_domain_interface_get_mac(iface: PGVirConfigDomainInterface): pchar; cdecl; external libvirtgconfig;
function gvir_config_domain_interface_get_model(iface: PGVirConfigDomainInterface): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_domain_interface_set_filterref(iface: PGVirConfigDomainInterface; filterref: PGVirConfigDomainInterfaceFilterref); cdecl; external libvirtgconfig;
function gvir_config_domain_interface_get_filterref(iface: PGVirConfigDomainInterface): PGVirConfigDomainInterfaceFilterref; cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:43:24 ===

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE: TGType;
function GVIR_CONFIG_DOMAIN_INTERFACE(obj: Pointer): PGVirConfigDomainInterface;
function GVIR_CONFIG_DOMAIN_INTERFACE_CLASS(klass: Pointer): PGVirConfigDomainInterfaceClass;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_INTERFACE_GET_CLASS(obj: Pointer): PGVirConfigDomainInterfaceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_INTERFACE := gvir_config_domain_interface_get_type;
end;

function GVIR_CONFIG_DOMAIN_INTERFACE(obj: Pointer): PGVirConfigDomainInterface;
begin
  Result := PGVirConfigDomainInterface(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE));
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_CLASS(klass: Pointer): PGVirConfigDomainInterfaceClass;
begin
  Result := PGVirConfigDomainInterfaceClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE));
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE);
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE);
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_GET_CLASS(obj: Pointer): PGVirConfigDomainInterfaceClass;
begin
  Result := PGVirConfigDomainInterfaceClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
