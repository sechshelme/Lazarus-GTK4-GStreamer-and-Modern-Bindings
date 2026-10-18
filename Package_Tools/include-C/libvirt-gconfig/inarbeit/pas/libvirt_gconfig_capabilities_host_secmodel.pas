unit libvirt_gconfig_capabilities_host_secmodel;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigCapabilitiesHostSecModelPrivate = type Pointer;

  PGVirConfigCapabilitiesHostSecModel = ^TGVirConfigCapabilitiesHostSecModel;
  TGVirConfigCapabilitiesHostSecModel = record
    parent: TGVirConfigObject;
    priv: PGVirConfigCapabilitiesHostSecModelPrivate;
  end;

  PGVirConfigCapabilitiesHostSecModelClass = ^TGVirConfigCapabilitiesHostSecModelClass;
  TGVirConfigCapabilitiesHostSecModelClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_capabilities_host_secmodel_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_capabilities_host_secmodel_get_model(secmodel: PGVirConfigCapabilitiesHostSecModel): Pgchar; cdecl; external libvirtgconfig;
function gvir_config_capabilities_host_secmodel_get_doi(secmodel: PGVirConfigCapabilitiesHostSecModel): Pgchar; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:51:51 ===

function GVIR_CONFIG_TYPE_CAPABILITIES_HOST_SECMODEL: TGType;
function GVIR_CONFIG_CAPABILITIES_HOST_SECMODEL(obj: Pointer): PGVirConfigCapabilitiesHostSecModel;
function GVIR_CONFIG_CAPABILITIES_HOST_SECMODEL_CLASS(klass: Pointer): PGVirConfigCapabilitiesHostSecModelClass;
function GVIR_CONFIG_IS_CAPABILITIES_HOST_SECMODEL(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_CAPABILITIES_HOST_SECMODEL_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_CAPABILITIES_HOST_SECMODEL_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesHostSecModelClass;

implementation

function GVIR_CONFIG_TYPE_CAPABILITIES_HOST_SECMODEL: TGType;
begin
  GVIR_CONFIG_TYPE_CAPABILITIES_HOST_SECMODEL := gvir_config_capabilities_host_secmodel_get_type;
end;

function GVIR_CONFIG_CAPABILITIES_HOST_SECMODEL(obj: Pointer): PGVirConfigCapabilitiesHostSecModel;
begin
  Result := PGVirConfigCapabilitiesHostSecModel(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_CAPABILITIES_HOST_SECMODEL));
end;

function GVIR_CONFIG_CAPABILITIES_HOST_SECMODEL_CLASS(klass: Pointer): PGVirConfigCapabilitiesHostSecModelClass;
begin
  Result := PGVirConfigCapabilitiesHostSecModelClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_CAPABILITIES_HOST_SECMODEL));
end;

function GVIR_CONFIG_IS_CAPABILITIES_HOST_SECMODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_CAPABILITIES_HOST_SECMODEL);
end;

function GVIR_CONFIG_IS_CAPABILITIES_HOST_SECMODEL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_CAPABILITIES_HOST_SECMODEL);
end;

function GVIR_CONFIG_CAPABILITIES_HOST_SECMODEL_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesHostSecModelClass;
begin
  Result := PGVirConfigCapabilitiesHostSecModelClass(PGTypeInstance(obj)^.g_class);
end;



end.
