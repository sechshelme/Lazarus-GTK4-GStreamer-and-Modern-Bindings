{$IFDEF read_interface}


type
  PGVirConfigDomainInterfaceNetworkPrivate = type Pointer;

  PGVirConfigDomainInterfaceNetwork = ^TGVirConfigDomainInterfaceNetwork;
  TGVirConfigDomainInterfaceNetwork = record
    parent: TGVirConfigDomainInterface;
    priv: PGVirConfigDomainInterfaceNetworkPrivate;
  end;

  PGVirConfigDomainInterfaceNetworkClass = ^TGVirConfigDomainInterfaceNetworkClass;
  TGVirConfigDomainInterfaceNetworkClass = record
    parent_class: TGVirConfigDomainInterfaceClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_interface_network_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_interface_network_new: PGVirConfigDomainInterfaceNetwork; cdecl; external libvirtgconfig;
function gvir_config_domain_interface_network_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainInterfaceNetwork; cdecl; external libvirtgconfig;
procedure gvir_config_domain_interface_network_set_source(iface: PGVirConfigDomainInterfaceNetwork; source: pchar); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:43:13 ===

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_NETWORK: TGType;
function GVIR_CONFIG_DOMAIN_INTERFACE_NETWORK(obj: Pointer): PGVirConfigDomainInterfaceNetwork;
function GVIR_CONFIG_DOMAIN_INTERFACE_NETWORK_CLASS(klass: Pointer): PGVirConfigDomainInterfaceNetworkClass;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_NETWORK(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_INTERFACE_NETWORK_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_INTERFACE_NETWORK_GET_CLASS(obj: Pointer): PGVirConfigDomainInterfaceNetworkClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_NETWORK: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_NETWORK := gvir_config_domain_interface_network_get_type;
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_NETWORK(obj: Pointer): PGVirConfigDomainInterfaceNetwork;
begin
  Result := PGVirConfigDomainInterfaceNetwork(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_NETWORK));
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_NETWORK_CLASS(klass: Pointer): PGVirConfigDomainInterfaceNetworkClass;
begin
  Result := PGVirConfigDomainInterfaceNetworkClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_NETWORK));
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE_NETWORK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_NETWORK);
end;

function GVIR_CONFIG_IS_DOMAIN_INTERFACE_NETWORK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_NETWORK);
end;

function GVIR_CONFIG_DOMAIN_INTERFACE_NETWORK_GET_CLASS(obj: Pointer): PGVirConfigDomainInterfaceNetworkClass;
begin
  Result := PGVirConfigDomainInterfaceNetworkClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
