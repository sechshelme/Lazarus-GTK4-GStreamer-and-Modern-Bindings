unit libvirt_gconfig_capabilities_cpu_feature;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigCapabilitiesCpuFeaturePrivate = type Pointer;

  PGVirConfigCapabilitiesCpuFeature = ^TGVirConfigCapabilitiesCpuFeature;
  TGVirConfigCapabilitiesCpuFeature = record
    parent: TGVirConfigObject;
    priv: PGVirConfigCapabilitiesCpuFeaturePrivate;
  end;

  PGVirConfigCapabilitiesCpuFeatureClass = ^TGVirConfigCapabilitiesCpuFeatureClass;
  TGVirConfigCapabilitiesCpuFeatureClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_capabilities_cpu_feature_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_capabilities_cpu_feature_get_name(feature: PGVirConfigCapabilitiesCpuFeature): Pgchar; cdecl; external libvirtgconfig;
procedure gvir_config_capabilities_cpu_feature_set_name(feature: PGVirConfigCapabilitiesCpuFeature; name: Pgchar); cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:52:45 ===

function GVIR_CONFIG_TYPE_CAPABILITIES_CPU_FEATURE: TGType;
function GVIR_CONFIG_CAPABILITIES_CPU_FEATURE(obj: Pointer): PGVirConfigCapabilitiesCpuFeature;
function GVIR_CONFIG_CAPABILITIES_CPU_FEATURE_CLASS(klass: Pointer): PGVirConfigCapabilitiesCpuFeatureClass;
function GVIR_CONFIG_IS_CAPABILITIES_CPU_FEATURE(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_CAPABILITIES_CPU_FEATURE_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_CAPABILITIES_CPU_FEATURE_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesCpuFeatureClass;

implementation

function GVIR_CONFIG_TYPE_CAPABILITIES_CPU_FEATURE: TGType;
begin
  GVIR_CONFIG_TYPE_CAPABILITIES_CPU_FEATURE := gvir_config_capabilities_cpu_feature_get_type;
end;

function GVIR_CONFIG_CAPABILITIES_CPU_FEATURE(obj: Pointer): PGVirConfigCapabilitiesCpuFeature;
begin
  Result := PGVirConfigCapabilitiesCpuFeature(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_CAPABILITIES_CPU_FEATURE));
end;

function GVIR_CONFIG_CAPABILITIES_CPU_FEATURE_CLASS(klass: Pointer): PGVirConfigCapabilitiesCpuFeatureClass;
begin
  Result := PGVirConfigCapabilitiesCpuFeatureClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_CAPABILITIES_CPU_FEATURE));
end;

function GVIR_CONFIG_IS_CAPABILITIES_CPU_FEATURE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_CAPABILITIES_CPU_FEATURE);
end;

function GVIR_CONFIG_IS_CAPABILITIES_CPU_FEATURE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_CAPABILITIES_CPU_FEATURE);
end;

function GVIR_CONFIG_CAPABILITIES_CPU_FEATURE_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesCpuFeatureClass;
begin
  Result := PGVirConfigCapabilitiesCpuFeatureClass(PGTypeInstance(obj)^.g_class);
end;



end.
