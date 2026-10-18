unit libvirt_gconfig_domain_cpu_feature;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object, libvirt_gconfig_capabilities_cpu;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainCpuFeaturePrivate = type Pointer;

  PGVirConfigDomainCpuFeature = ^TGVirConfigDomainCpuFeature;
  TGVirConfigDomainCpuFeature = record
    parent: TGVirConfigCapabilitiesCpu;
    priv: PGVirConfigDomainCpuFeaturePrivate;
  end;

  PGVirConfigDomainCpuFeatureClass = ^TGVirConfigDomainCpuFeatureClass;
  TGVirConfigDomainCpuFeatureClass = record
    parent_class: TGVirConfigCapabilitiesCpuClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirConfigDomainCpuFeaturePolicy = ^TGVirConfigDomainCpuFeaturePolicy;
  TGVirConfigDomainCpuFeaturePolicy = longint;
const
  GVIR_CONFIG_DOMAIN_CPU_FEATURE_POLICY_FORCE = 0;
  GVIR_CONFIG_DOMAIN_CPU_FEATURE_POLICY_REQUIRE = 1;
  GVIR_CONFIG_DOMAIN_CPU_FEATURE_POLICY_OPTIONAL = 2;
  GVIR_CONFIG_DOMAIN_CPU_FEATURE_POLICY_DISABLE = 3;
  GVIR_CONFIG_DOMAIN_CPU_FEATURE_POLICY_FORBID = 4;

function gvir_config_domain_cpu_feature_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_cpu_feature_new: PGVirConfigDomainCpuFeature; cdecl; external libvirtgconfig;
function gvir_config_domain_cpu_feature_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainCpuFeature; cdecl; external libvirtgconfig;
procedure gvir_config_domain_cpu_feature_set_policy(feature: PGVirConfigDomainCpuFeature; policy: TGVirConfigDomainCpuFeaturePolicy); cdecl; external libvirtgconfig;
function gvir_config_domain_cpu_feature_get_policy(feature: PGVirConfigDomainCpuFeature): TGVirConfigDomainCpuFeaturePolicy; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:59:32 ===

function GVIR_CONFIG_TYPE_DOMAIN_CPU_FEATURE: TGType;
function GVIR_CONFIG_DOMAIN_CPU_FEATURE(obj: Pointer): PGVirConfigDomainCpuFeature;
function GVIR_CONFIG_DOMAIN_CPU_FEATURE_CLASS(klass: Pointer): PGVirConfigDomainCpuFeatureClass;
function GVIR_CONFIG_IS_DOMAIN_CPU_FEATURE(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CPU_FEATURE_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_CPU_FEATURE_GET_CLASS(obj: Pointer): PGVirConfigDomainCpuFeatureClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_CPU_FEATURE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CPU_FEATURE := gvir_config_domain_cpu_feature_get_type;
end;

function GVIR_CONFIG_DOMAIN_CPU_FEATURE(obj: Pointer): PGVirConfigDomainCpuFeature;
begin
  Result := PGVirConfigDomainCpuFeature(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CPU_FEATURE));
end;

function GVIR_CONFIG_DOMAIN_CPU_FEATURE_CLASS(klass: Pointer): PGVirConfigDomainCpuFeatureClass;
begin
  Result := PGVirConfigDomainCpuFeatureClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CPU_FEATURE));
end;

function GVIR_CONFIG_IS_DOMAIN_CPU_FEATURE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_CPU_FEATURE);
end;

function GVIR_CONFIG_IS_DOMAIN_CPU_FEATURE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_CPU_FEATURE);
end;

function GVIR_CONFIG_DOMAIN_CPU_FEATURE_GET_CLASS(obj: Pointer): PGVirConfigDomainCpuFeatureClass;
begin
  Result := PGVirConfigDomainCpuFeatureClass(PGTypeInstance(obj)^.g_class);
end;



end.
