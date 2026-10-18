unit libvirt_gconfig_network;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigNetworkPrivate = type Pointer;

  PGVirConfigNetwork = ^TGVirConfigNetwork;
  TGVirConfigNetwork = record
    parent: TGVirConfigObject;
    priv: PGVirConfigNetworkPrivate;
  end;

  PGVirConfigNetworkClass = ^TGVirConfigNetworkClass;
  TGVirConfigNetworkClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_network_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_network_new: PGVirConfigNetwork; cdecl; external libvirtgconfig;
function gvir_config_network_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigNetwork; cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:53:13 ===

function GVIR_CONFIG_TYPE_NETWORK: TGType;
function GVIR_CONFIG_NETWORK(obj: Pointer): PGVirConfigNetwork;
function GVIR_CONFIG_NETWORK_CLASS(klass: Pointer): PGVirConfigNetworkClass;
function GVIR_CONFIG_IS_NETWORK(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_NETWORK_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_NETWORK_GET_CLASS(obj: Pointer): PGVirConfigNetworkClass;

implementation

function GVIR_CONFIG_TYPE_NETWORK: TGType;
begin
  GVIR_CONFIG_TYPE_NETWORK := gvir_config_network_get_type;
end;

function GVIR_CONFIG_NETWORK(obj: Pointer): PGVirConfigNetwork;
begin
  Result := PGVirConfigNetwork(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_NETWORK));
end;

function GVIR_CONFIG_NETWORK_CLASS(klass: Pointer): PGVirConfigNetworkClass;
begin
  Result := PGVirConfigNetworkClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_NETWORK));
end;

function GVIR_CONFIG_IS_NETWORK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_NETWORK);
end;

function GVIR_CONFIG_IS_NETWORK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_NETWORK);
end;

function GVIR_CONFIG_NETWORK_GET_CLASS(obj: Pointer): PGVirConfigNetworkClass;
begin
  Result := PGVirConfigNetworkClass(PGTypeInstance(obj)^.g_class);
end;



end.
