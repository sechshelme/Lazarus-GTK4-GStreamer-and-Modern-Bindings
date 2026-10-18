unit libvirt_gobject_connection;

interface

uses
  fp_glib2, fp_virt_glib, libvirt_gobject_stream, libvirt_gobject_domain, libvirt_gobject_interface;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirNodeInfo = ^TGVirNodeInfo;
  TGVirNodeInfo = record
    model: array[0..31] of Tgchar;
    memory: Tgulong;
    cpus: Tguint;
    mhz: Tguint;
    nodes: Tguint;
    sockets: Tguint;
    cores: Tguint;
    threads: Tguint;
  end;

  PGVirConnectionPrivate = type Pointer;

  PGVirConnection = ^TGVirConnection;
  TGVirConnection = record
    parent: TGObject;
    priv: PGVirConnectionPrivate;
  end;

  PGVirConnectionClass = ^TGVirConnectionClass;
  TGVirConnectionClass = record
    parent_class: TGObjectClass;
    connection_opened: procedure(conn: PGVirConnection); cdecl;
    connection_closed: procedure(conn: PGVirConnection); cdecl;
    domain_added: procedure(conn: PGVirConnection; dom: PGVirDomain); cdecl;
    domain_removed: procedure(conn: PGVirConnection; dom: PGVirDomain); cdecl;
    stream_new: function(conn: PGVirConnection; handle: Tgpointer): PGVirStream; cdecl;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_connection_get_type: TGType; cdecl; external libvirtgobject;
function gvir_connection_handle_get_type: TGType; cdecl; external libvirtgobject;
function gvir_node_info_get_type: TGType; cdecl; external libvirtgobject;
function gvir_connection_new(uri: pchar): PGVirConnection; cdecl; external libvirtgobject;
function gvir_connection_open(conn: PGVirConnection; cancellable: PGCancellable; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_connection_open_read_only(conn: PGVirConnection; cancellable: PGCancellable; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_connection_open_async(conn: PGVirConnection; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_connection_open_finish(conn: PGVirConnection; result: PGAsyncResult; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_connection_open_read_only_async(conn: PGVirConnection; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_connection_open_read_only_finish(conn: PGVirConnection; result: PGAsyncResult; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_connection_is_open(conn: PGVirConnection): Tgboolean; cdecl; external libvirtgobject;
function gvir_connection_is_read_only(conn: PGVirConnection): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_connection_close(conn: PGVirConnection); cdecl; external libvirtgobject;
function gvir_connection_fetch_domains(conn: PGVirConnection; cancellable: PGCancellable; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_connection_fetch_domains_async(conn: PGVirConnection; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_connection_fetch_domains_finish(conn: PGVirConnection; result: PGAsyncResult; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_connection_get_uri(conn: PGVirConnection): Pgchar; cdecl; external libvirtgobject;
function gvir_connection_get_hypervisor_name(conn: PGVirConnection; err: PPGError): Pgchar; cdecl; external libvirtgobject;
function gvir_connection_get_version(conn: PGVirConnection; err: PPGError): Tgulong; cdecl; external libvirtgobject;
function gvir_connection_get_domains(conn: PGVirConnection): PGList; cdecl; external libvirtgobject;
function gvir_connection_get_domain(conn: PGVirConnection; uuid: Pgchar): PGVirDomain; cdecl; external libvirtgobject;
function gvir_connection_find_domain_by_id(conn: PGVirConnection; id: Tgint): PGVirDomain; cdecl; external libvirtgobject;
function gvir_connection_find_domain_by_name(conn: PGVirConnection; name: Pgchar): PGVirDomain; cdecl; external libvirtgobject;
function gvir_connection_create_domain(conn: PGVirConnection; conf: PGVirConfigDomain; err: PPGError): PGVirDomain; cdecl; external libvirtgobject;
function gvir_connection_start_domain(conn: PGVirConnection; conf: PGVirConfigDomain; flags: Tguint; err: PPGError): PGVirDomain; cdecl; external libvirtgobject;
function gvir_connection_fetch_interfaces(conn: PGVirConnection; cancellable: PGCancellable; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_connection_fetch_interfaces_async(conn: PGVirConnection; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_connection_fetch_interfaces_finish(conn: PGVirConnection; result: PGAsyncResult; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_connection_get_interfaces(conn: PGVirConnection): PGList; cdecl; external libvirtgobject;
function gvir_connection_get_interface(conn: PGVirConnection; name: Pgchar): PGVirInterface; cdecl; external libvirtgobject;
function gvir_connection_find_interface_by_mac(conn: PGVirConnection; macaddr: Pgchar): PGVirInterface; cdecl; external libvirtgobject;
function gvir_connection_fetch_networks(conn: PGVirConnection; cancellable: PGCancellable; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_connection_fetch_networks_async(conn: PGVirConnection; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_connection_fetch_networks_finish(conn: PGVirConnection; result: PGAsyncResult; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_connection_get_networks(conn: PGVirConnection): PGList; cdecl; external libvirtgobject;
function gvir_connection_get_network(conn: PGVirConnection; uuid: Pgchar): PGVirNetwork; cdecl; external libvirtgobject;
function gvir_connection_find_network_by_name(conn: PGVirConnection; name: Pgchar): PGVirNetwork; cdecl; external libvirtgobject;

function gvir_connection_fetch_storage_pools(conn: PGVirConnection; cancellable: PGCancellable; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_connection_fetch_storage_pools_async(conn: PGVirConnection; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_connection_fetch_storage_pools_finish(conn: PGVirConnection; result: PGAsyncResult; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_connection_get_storage_pools(conn: PGVirConnection): PGList; cdecl; external libvirtgobject;
function gvir_connection_get_storage_pool(conn: PGVirConnection; uuid: Pgchar): PGVirStoragePool; cdecl; external libvirtgobject;
function gvir_connection_find_storage_pool_by_name(conn: PGVirConnection; name: Pgchar): PGVirStoragePool; cdecl; external libvirtgobject;
function gvir_connection_create_storage_pool(conn: PGVirConnection; conf: PGVirConfigStoragePool; flags: Tguint; err: PPGError): PGVirStoragePool; cdecl; external libvirtgobject;
function gvir_connection_get_stream(conn: PGVirConnection; flags: Tguint): PGVirStream; cdecl; external libvirtgobject;
function gvir_connection_get_node_info(conn: PGVirConnection; err: PPGError): PGVirNodeInfo; cdecl; external libvirtgobject;
function gvir_connection_get_capabilities(conn: PGVirConnection; err: PPGError): PGVirConfigCapabilities; cdecl; external libvirtgobject;
procedure gvir_connection_get_capabilities_async(conn: PGVirConnection; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_connection_get_capabilities_finish(conn: PGVirConnection; result: PGAsyncResult; err: PPGError): PGVirConfigCapabilities; cdecl; external libvirtgobject;
function gvir_connection_restore_domain_from_file(conn: PGVirConnection; filename: Pgchar; custom_conf: PGVirConfigDomain; flags: Tguint; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_connection_restore_domain_from_file_async(conn: PGVirConnection; filename: Pgchar; custom_conf: PGVirConfigDomain; flags: Tguint; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_connection_restore_domain_from_file_finish(conn: PGVirConnection; result: PGAsyncResult; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_connection_get_domain_capabilities(conn: PGVirConnection; emulatorbin: Pgchar; arch: Pgchar; machine: Pgchar; virttype: Pgchar;
  flags: Tguint; err: PPGError): PGVirConfigDomainCapabilities; cdecl; external libvirtgobject;
procedure gvir_connection_get_domain_capabilities_async(conn: PGVirConnection; emulatorbin: Pgchar; arch: Pgchar; machine: Pgchar; virttype: Pgchar;
  flags: Tguint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_connection_get_domain_capabilities_finish(conn: PGVirConnection; result: PGAsyncResult; err: PPGError): PGVirConfigDomainCapabilities; cdecl; external libvirtgobject;

// === Konventiert am: 18-10-26 19:32:47 ===

function GVIR_TYPE_CONNECTION: TGType;
function GVIR_CONNECTION(obj: Pointer): PGVirConnection;
function GVIR_CONNECTION_CLASS(klass: Pointer): PGVirConnectionClass;
function GVIR_IS_CONNECTION(obj: Pointer): Tgboolean;
function GVIR_IS_CONNECTION_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONNECTION_GET_CLASS(obj: Pointer): PGVirConnectionClass;

function GVIR_TYPE_CONNECTION_HANDLE: TGType;



implementation

function GVIR_TYPE_CONNECTION: TGType;
begin
  GVIR_TYPE_CONNECTION := gvir_connection_get_type;
end;

function GVIR_CONNECTION(obj: Pointer): PGVirConnection;
begin
  Result := PGVirConnection(g_type_check_instance_cast(obj, GVIR_TYPE_CONNECTION));
end;

function GVIR_CONNECTION_CLASS(klass: Pointer): PGVirConnectionClass;
begin
  Result := PGVirConnectionClass(g_type_check_class_cast(klass, GVIR_TYPE_CONNECTION));
end;

function GVIR_IS_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_TYPE_CONNECTION);
end;

function GVIR_IS_CONNECTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_TYPE_CONNECTION);
end;

function GVIR_CONNECTION_GET_CLASS(obj: Pointer): PGVirConnectionClass;
begin
  Result := PGVirConnectionClass(PGTypeInstance(obj)^.g_class);
end;


function GVIR_TYPE_CONNECTION_HANDLE: TGType;
begin
  GVIR_TYPE_CONNECTION_HANDLE := gvir_connection_handle_get_type;
end;


end.
