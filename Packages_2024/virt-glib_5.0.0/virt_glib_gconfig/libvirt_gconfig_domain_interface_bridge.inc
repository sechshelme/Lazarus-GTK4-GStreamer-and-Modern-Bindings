{$IFDEF read_interface}


type
  PGVirConfigDomainInterfaceBridgePrivate = type Pointer;

  PGVirConfigDomainInterfaceBridge = ^TGVirConfigDomainInterfaceBridge;
  TGVirConfigDomainInterfaceBridge = record
    parent: TGVirConfigDomainInterface;
    priv: PGVirConfigDomainInterfaceBridgePrivate;
  end;

  PGVirConfigDomainInterfaceBridgeClass = ^TGVirConfigDomainInterfaceBridgeClass;
  TGVirConfigDomainInterfaceBridgeClass = record
    parent_class: TGVirConfigDomainInterfaceClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_interface_bridge_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_interface_bridge_new: PGVirConfigDomainInterfaceBridge; cdecl; external libvirtgconfig;
function gvir_config_domain_interface_bridge_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainInterfaceBridge; cdecl; external libvirtgconfig;
procedure gvir_config_domain_interface_bridge_set_source(iface: PGVirConfigDomainInterfaceBridge; brname: pchar); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:43:21 ===

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_BRIDGE: TGType;
function GVIR_CONFIG_DOMAIN_INTERFACE_BRIDGE(obj: Pointer): PGVirConfigDomainInterfaceBridge;
function GVIR_CONFIG_DOMAIN_INTERFACE_BRIDGE_CLASS(klass: Pointer): PGVirConfigDomainInterfaceBridgeClass;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_BRIDGE(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_BRIDGE_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_INTERFACE_BRIDGE_GET_CLASS(obj: Pointer): PGVirConfigDomainInterfaceBridgeClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_BRIDGE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_BRIDGE := gvir_config_domain_interface_bridge_get_type;
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_BRIDGE(obj: Pointer): PGVirConfigDomainInterfaceBridge;
begin
  Result := PGVirConfigDomainInterfaceBridge(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_BRIDGE));
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_BRIDGE_CLASS(klass: Pointer): PGVirConfigDomainInterfaceBridgeClass;
begin
  Result := PGVirConfigDomainInterfaceBridgeClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_BRIDGE));
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE_BRIDGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_BRIDGE);
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE_BRIDGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_BRIDGE);
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_BRIDGE_GET_CLASS(obj: Pointer): PGVirConfigDomainInterfaceBridgeClass;
begin
  Result := PGVirConfigDomainInterfaceBridgeClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
