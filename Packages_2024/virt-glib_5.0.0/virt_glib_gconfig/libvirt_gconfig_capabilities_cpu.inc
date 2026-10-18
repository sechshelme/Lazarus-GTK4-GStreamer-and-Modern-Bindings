{$IFDEF read_interface}


type
  PGVirConfigCapabilitiesCpuPrivate = type Pointer;

  PGVirConfigCapabilitiesCpu = ^TGVirConfigCapabilitiesCpu;
  TGVirConfigCapabilitiesCpu = record
    parent: TGVirConfigObject;
    priv: PGVirConfigCapabilitiesCpuPrivate;
  end;

  PGVirConfigCapabilitiesCpuClass = ^TGVirConfigCapabilitiesCpuClass;
  TGVirConfigCapabilitiesCpuClass = record
    parent_class: TGVirConfigObjectClass;
    get_features: function(cpu: PGVirConfigCapabilitiesCpu): PGList; cdecl;
    padding: array[0..18] of Tgpointer;
  end;

function gvir_config_capabilities_cpu_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_capabilities_cpu_get_arch(cpu: PGVirConfigCapabilitiesCpu): Pgchar; cdecl; external libvirtgconfig;
procedure gvir_config_capabilities_cpu_add_feature(cpu: PGVirConfigCapabilitiesCpu; feature: PGVirConfigCapabilitiesCpuFeature); cdecl; external libvirtgconfig;
function gvir_config_capabilities_cpu_get_features(cpu: PGVirConfigCapabilitiesCpu): PGList; cdecl; external libvirtgconfig;
function gvir_config_capabilities_cpu_get_topology(cpu: PGVirConfigCapabilitiesCpu): PGVirConfigCapabilitiesCpuTopology; cdecl; external libvirtgconfig;
procedure gvir_config_capabilities_cpu_set_topology(cpu: PGVirConfigCapabilitiesCpu; topology: PGVirConfigCapabilitiesCpuTopology); cdecl; external libvirtgconfig;
function gvir_config_capabilities_cpu_get_model(cpu: PGVirConfigCapabilitiesCpu): PGVirConfigCapabilitiesCpuModel; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:52:48 ===

function GVIR_CONFIG_TYPE_CAPABILITIES_CPU: TGType;
function GVIR_CONFIG_CAPABILITIES_CPU(obj: Pointer): PGVirConfigCapabilitiesCpu;
function GVIR_CONFIG_CAPABILITIES_CPU_CLASS(klass: Pointer): PGVirConfigCapabilitiesCpuClass;
function GVIR_CONFIG_IS_CAPABILITIES_CPU(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_CAPABILITIES_CPU_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_CAPABILITIES_CPU_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesCpuClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_CAPABILITIES_CPU: TGType;
begin
  GVIR_CONFIG_TYPE_CAPABILITIES_CPU := gvir_config_capabilities_cpu_get_type;
end;

function GVIR_CONFIG_CAPABILITIES_CPU(obj: Pointer): PGVirConfigCapabilitiesCpu;
begin
  Result := PGVirConfigCapabilitiesCpu(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_CAPABILITIES_CPU));
end;

function GVIR_CONFIG_CAPABILITIES_CPU_CLASS(klass: Pointer): PGVirConfigCapabilitiesCpuClass;
begin
  Result := PGVirConfigCapabilitiesCpuClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_CAPABILITIES_CPU));
end;

function GVIR_CONFIG_IS_CAPABILITIES_CPU(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_CAPABILITIES_CPU);
end;

function GVIR_CONFIG_IS_CAPABILITIES_CPU_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_CAPABILITIES_CPU);
end;

function GVIR_CONFIG_CAPABILITIES_CPU_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesCpuClass;
begin
  Result := PGVirConfigCapabilitiesCpuClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
