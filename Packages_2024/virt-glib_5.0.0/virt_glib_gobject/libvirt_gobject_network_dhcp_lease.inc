{$IFDEF read_interface}


type
  PGVirIPAddrType = ^TGVirIPAddrType;
  TGVirIPAddrType = longint;
const
  GVIR_IP_ADDR_TYPE_IPV4 = 0;
  GVIR_IP_ADDR_TYPE_IPV6 = 1;

type
  PGVirNetworkDHCPLeasePrivate = type Pointer;

  PGVirNetworkDHCPLease = ^TGVirNetworkDHCPLease;
  TGVirNetworkDHCPLease = record
    parent: TGObject;
    priv: PGVirNetworkDHCPLeasePrivate;
  end;

  PGVirNetworkDHCPLeaseClass = ^TGVirNetworkDHCPLeaseClass;
  TGVirNetworkDHCPLeaseClass = record
    parent_class: TGObjectClass;
    padding: array[0..6] of Tgpointer;
  end;

function gvir_network_dhcp_lease_get_type: TGType; cdecl; external libvirtgobject;
function gvir_network_dhcp_lease_get_iface(lease: PGVirNetworkDHCPLease): Pgchar; cdecl; external libvirtgobject;
function gvir_network_dhcp_lease_get_expiry_time(lease: PGVirNetworkDHCPLease): Tgint64; cdecl; external libvirtgobject;
function gvir_network_dhcp_lease_get_ip_type(lease: PGVirNetworkDHCPLease): Tgint; cdecl; external libvirtgobject;
function gvir_network_dhcp_lease_get_mac(lease: PGVirNetworkDHCPLease): Pgchar; cdecl; external libvirtgobject;
function gvir_network_dhcp_lease_get_iaid(lease: PGVirNetworkDHCPLease): Pgchar; cdecl; external libvirtgobject;
function gvir_network_dhcp_lease_get_ip(lease: PGVirNetworkDHCPLease): Pgchar; cdecl; external libvirtgobject;
function gvir_network_dhcp_lease_get_prefix(lease: PGVirNetworkDHCPLease): Tguint; cdecl; external libvirtgobject;
function gvir_network_dhcp_lease_get_hostname(lease: PGVirNetworkDHCPLease): Pgchar; cdecl; external libvirtgobject;
function gvir_network_dhcp_lease_get_client_id(lease: PGVirNetworkDHCPLease): Pgchar; cdecl; external libvirtgobject;

// === Konventiert am: 18-10-26 19:32:05 ===

function GVIR_TYPE_NETWORK_DHCP_LEASE: TGType;
function GVIR_NETWORK_DHCP_LEASE(obj: Pointer): PGVirNetworkDHCPLease;
function GVIR_NETWORK_DHCP_LEASE_CLASS(klass: Pointer): PGVirNetworkDHCPLeaseClass;
function GVIR_IS_NETWORK_DHCP_LEASE(obj: Pointer): Tgboolean;
function GVIR_IS_NETWORK_DHCP_LEASE_CLASS(klass: Pointer): Tgboolean;
function GVIR_NETWORK_DHCP_LEASE_GET_CLASS(obj: Pointer): PGVirNetworkDHCPLeaseClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_TYPE_NETWORK_DHCP_LEASE: TGType;
begin
  GVIR_TYPE_NETWORK_DHCP_LEASE := gvir_network_dhcp_lease_get_type;
end;

function GVIR_NETWORK_DHCP_LEASE(obj: Pointer): PGVirNetworkDHCPLease;
begin
  Result := PGVirNetworkDHCPLease(g_type_check_instance_cast(obj, GVIR_TYPE_NETWORK_DHCP_LEASE));
end;

function GVIR_NETWORK_DHCP_LEASE_CLASS(klass: Pointer): PGVirNetworkDHCPLeaseClass;
begin
  Result := PGVirNetworkDHCPLeaseClass(g_type_check_class_cast(klass, GVIR_TYPE_NETWORK_DHCP_LEASE));
end;

function GVIR_IS_NETWORK_DHCP_LEASE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_TYPE_NETWORK_DHCP_LEASE);
end;

function GVIR_IS_NETWORK_DHCP_LEASE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_TYPE_NETWORK_DHCP_LEASE);
end;

function GVIR_NETWORK_DHCP_LEASE_GET_CLASS(obj: Pointer): PGVirNetworkDHCPLeaseClass;
begin
  Result := PGVirNetworkDHCPLeaseClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
