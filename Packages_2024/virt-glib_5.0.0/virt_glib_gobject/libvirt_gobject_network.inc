{$IFDEF read_interface}


type
  PGVirNetworkPrivate = type Pointer;

  PGVirNetwork = ^TGVirNetwork;
  TGVirNetwork = record
    parent: TGObject;
    priv: PGVirNetworkPrivate;
  end;

  PGVirNetworkClass = ^TGVirNetworkClass;
  TGVirNetworkClass = record
    parent_class: TGObjectClass;
    started: procedure(net: PGVirNetwork); cdecl;
    stopped: procedure(net: PGVirNetwork); cdecl;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_network_get_type: TGType; cdecl; external libvirtgobject;
function gvir_network_handle_get_type: TGType; cdecl; external libvirtgobject;
function gvir_network_get_name(network: PGVirNetwork): Pgchar; cdecl; external libvirtgobject;
function gvir_network_get_uuid(network: PGVirNetwork): Pgchar; cdecl; external libvirtgobject;
function gvir_network_get_config(network: PGVirNetwork; flags: Tguint; err: PPGError): PGVirConfigNetwork; cdecl; external libvirtgobject;
function gvir_network_get_dhcp_leases(network: PGVirNetwork; mac: pchar; flags: Tguint; err: PPGError): PGList; cdecl; external libvirtgobject;

// === Konventiert am: 18-10-26 19:32:08 ===

function GVIR_TYPE_NETWORK: TGType;
function GVIR_NETWORK(obj: Pointer): PGVirNetwork;
function GVIR_NETWORK_CLASS(klass: Pointer): PGVirNetworkClass;
function GVIR_IS_NETWORK(obj: Pointer): Tgboolean;
function GVIR_IS_NETWORK_CLASS(klass: Pointer): Tgboolean;
function GVIR_NETWORK_GET_CLASS(obj: Pointer): PGVirNetworkClass;

function GVIR_TYPE_NETWORK_HANDLE: TGType;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_TYPE_NETWORK: TGType;
begin
  GVIR_TYPE_NETWORK := gvir_network_get_type;
end;

function GVIR_NETWORK(obj: Pointer): PGVirNetwork;
begin
  Result := PGVirNetwork(g_type_check_instance_cast(obj, GVIR_TYPE_NETWORK));
end;

function GVIR_NETWORK_CLASS(klass: Pointer): PGVirNetworkClass;
begin
  Result := PGVirNetworkClass(g_type_check_class_cast(klass, GVIR_TYPE_NETWORK));
end;

function GVIR_IS_NETWORK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_TYPE_NETWORK);
end;

function GVIR_IS_NETWORK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_TYPE_NETWORK);
end;

function GVIR_NETWORK_GET_CLASS(obj: Pointer): PGVirNetworkClass;
begin
  Result := PGVirNetworkClass(PGTypeInstance(obj)^.g_class);
end;


function GVIR_TYPE_NETWORK_HANDLE: TGType;
begin
  GVIR_TYPE_NETWORK_HANDLE := gvir_network_handle_get_type;
end;


{$ENDIF read_implementation}
