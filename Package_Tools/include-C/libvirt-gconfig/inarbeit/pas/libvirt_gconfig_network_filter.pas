unit libvirt_gconfig_network_filter;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigNetworkFilterPrivate = type Pointer;

  PGVirConfigNetworkFilter = ^TGVirConfigNetworkFilter;
  TGVirConfigNetworkFilter = record
    parent: TGVirConfigObject;
    priv: PGVirConfigNetworkFilterPrivate;
  end;

  PGVirConfigNetworkFilterClass = ^TGVirConfigNetworkFilterClass;
  TGVirConfigNetworkFilterClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_network_filter_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_network_filter_new: PGVirConfigNetworkFilter; cdecl; external libvirtgconfig;
function gvir_config_network_filter_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigNetworkFilter; cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:53:11 ===

function GVIR_CONFIG_TYPE_NETWORK_FILTER: TGType;
function GVIR_CONFIG_NETWORK_FILTER(obj: Pointer): PGVirConfigNetworkFilter;
function GVIR_CONFIG_NETWORK_FILTER_CLASS(klass: Pointer): PGVirConfigNetworkFilterClass;
function GVIR_CONFIG_IS_NETWORK_FILTER(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_NETWORK_FILTER_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_NETWORK_FILTER_GET_CLASS(obj: Pointer): PGVirConfigNetworkFilterClass;

implementation

function GVIR_CONFIG_TYPE_NETWORK_FILTER: TGType;
begin
  GVIR_CONFIG_TYPE_NETWORK_FILTER := gvir_config_network_filter_get_type;
end;

function GVIR_CONFIG_NETWORK_FILTER(obj: Pointer): PGVirConfigNetworkFilter;
begin
  Result := PGVirConfigNetworkFilter(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_NETWORK_FILTER));
end;

function GVIR_CONFIG_NETWORK_FILTER_CLASS(klass: Pointer): PGVirConfigNetworkFilterClass;
begin
  Result := PGVirConfigNetworkFilterClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_NETWORK_FILTER));
end;

function GVIR_CONFIG_IS_NETWORK_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_NETWORK_FILTER);
end;

function GVIR_CONFIG_IS_NETWORK_FILTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_NETWORK_FILTER);
end;

function GVIR_CONFIG_NETWORK_FILTER_GET_CLASS(obj: Pointer): PGVirConfigNetworkFilterClass;
begin
  Result := PGVirConfigNetworkFilterClass(PGTypeInstance(obj)^.g_class);
end;



end.
