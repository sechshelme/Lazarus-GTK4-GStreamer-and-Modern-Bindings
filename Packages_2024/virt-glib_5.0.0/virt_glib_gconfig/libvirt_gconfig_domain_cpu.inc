{$IFDEF read_interface}


type
  PGVirConfigDomainCpuPrivate = type Pointer;

  PGVirConfigDomainCpu = ^TGVirConfigDomainCpu;
  TGVirConfigDomainCpu = record
    parent: TGVirConfigCapabilitiesCpu;
    priv: PGVirConfigDomainCpuPrivate;
  end;

  PGVirConfigDomainCpuClass = ^TGVirConfigDomainCpuClass;
  TGVirConfigDomainCpuClass = record
    parent_class: TGVirConfigCapabilitiesCpuClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirConfigDomainCpuMatchPolicy = ^TGVirConfigDomainCpuMatchPolicy;
  TGVirConfigDomainCpuMatchPolicy = longint;
const
  GVIR_CONFIG_DOMAIN_CPU_MATCH_POLICY_MINIMUM = 0;
  GVIR_CONFIG_DOMAIN_CPU_MATCH_POLICY_EXACT = 1;
  GVIR_CONFIG_DOMAIN_CPU_MATCH_POLICY_STRICT = 2;

type
  PGVirConfigDomainCpuMode = ^TGVirConfigDomainCpuMode;
  TGVirConfigDomainCpuMode = longint;
const
  GVIR_CONFIG_DOMAIN_CPU_MODE_CUSTOM = 0;
  GVIR_CONFIG_DOMAIN_CPU_MODE_HOST_MODEL = 1;
  GVIR_CONFIG_DOMAIN_CPU_MODE_HOST_PASSTHROUGH = 2;

function gvir_config_domain_cpu_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_cpu_new: PGVirConfigDomainCpu; cdecl; external libvirtgconfig;
function gvir_config_domain_cpu_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainCpu; cdecl; external libvirtgconfig;
procedure gvir_config_domain_cpu_set_match_policy(cpu: PGVirConfigDomainCpu; policy: TGVirConfigDomainCpuMatchPolicy); cdecl; external libvirtgconfig;
function gvir_config_domain_cpu_get_match_policy(cpu: PGVirConfigDomainCpu): TGVirConfigDomainCpuMatchPolicy; cdecl; external libvirtgconfig;
procedure gvir_config_domain_cpu_set_mode(cpu: PGVirConfigDomainCpu; mode: TGVirConfigDomainCpuMode); cdecl; external libvirtgconfig;
procedure gvir_config_domain_cpu_set_model(cpu: PGVirConfigDomainCpu; model: PGVirConfigDomainCpuModel); cdecl; external libvirtgconfig;
function gvir_config_domain_cpu_get_mode(cpu: PGVirConfigDomainCpu): TGVirConfigDomainCpuMode; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:59:35 ===

function GVIR_CONFIG_TYPE_DOMAIN_CPU: TGType;
function GVIR_CONFIG_DOMAIN_CPU(obj: Pointer): PGVirConfigDomainCpu;
function GVIR_CONFIG_DOMAIN_CPU_CLASS(klass: Pointer): PGVirConfigDomainCpuClass;
function GVIR_CONFIG_IS_DOMAIN_CPU(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CPU_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_CPU_GET_CLASS(obj: Pointer): PGVirConfigDomainCpuClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_CPU: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CPU := gvir_config_domain_cpu_get_type;
end;

function GVIR_CONFIG_DOMAIN_CPU(obj: Pointer): PGVirConfigDomainCpu;
begin
  Result := PGVirConfigDomainCpu(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CPU));
end;

function GVIR_CONFIG_DOMAIN_CPU_CLASS(klass: Pointer): PGVirConfigDomainCpuClass;
begin
  Result := PGVirConfigDomainCpuClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CPU));
end;

function GVIR_CONFIG_IS_DOMAIN_CPU(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_CPU);
end;

function GVIR_CONFIG_IS_DOMAIN_CPU_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_CPU);
end;

function GVIR_CONFIG_DOMAIN_CPU_GET_CLASS(obj: Pointer): PGVirConfigDomainCpuClass;
begin
  Result := PGVirConfigDomainCpuClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
