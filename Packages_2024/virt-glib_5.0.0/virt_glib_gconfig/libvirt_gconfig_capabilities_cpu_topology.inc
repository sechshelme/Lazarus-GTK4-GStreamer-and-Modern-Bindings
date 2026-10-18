{$IFDEF read_interface}


type
  PGVirConfigCapabilitiesCpuTopologyPrivate = type Pointer;

  PGVirConfigCapabilitiesCpuTopology = ^TGVirConfigCapabilitiesCpuTopology;
  TGVirConfigCapabilitiesCpuTopology = record
    parent: TGVirConfigObject;
    priv: PGVirConfigCapabilitiesCpuTopologyPrivate;
  end;

  PGVirConfigCapabilitiesCpuTopologyClass = ^TGVirConfigCapabilitiesCpuTopologyClass;
  TGVirConfigCapabilitiesCpuTopologyClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_capabilities_cpu_topology_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_capabilities_cpu_topology_new: PGVirConfigCapabilitiesCpuTopology; cdecl; external libvirtgconfig;
function gvir_config_capabilities_cpu_topology_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigCapabilitiesCpuTopology; cdecl; external libvirtgconfig;
function gvir_config_capabilities_cpu_topology_get_sockets(topology: PGVirConfigCapabilitiesCpuTopology): Tguint64; cdecl; external libvirtgconfig;
procedure gvir_config_capabilities_cpu_topology_set_sockets(topology: PGVirConfigCapabilitiesCpuTopology; sockets: Tguint64); cdecl; external libvirtgconfig;
function gvir_config_capabilities_cpu_topology_get_cores(topology: PGVirConfigCapabilitiesCpuTopology): Tguint64; cdecl; external libvirtgconfig;
procedure gvir_config_capabilities_cpu_topology_set_cores(topology: PGVirConfigCapabilitiesCpuTopology; cores: Tguint64); cdecl; external libvirtgconfig;
function gvir_config_capabilities_cpu_topology_get_threads(topology: PGVirConfigCapabilitiesCpuTopology): Tguint64; cdecl; external libvirtgconfig;
procedure gvir_config_capabilities_cpu_topology_set_threads(topology: PGVirConfigCapabilitiesCpuTopology; threads: Tguint64); cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:52:32 ===

function GVIR_CONFIG_TYPE_CAPABILITIES_CPU_TOPOLOGY: TGType;
function GVIR_CONFIG_CAPABILITIES_CPU_TOPOLOGY(obj: Pointer): PGVirConfigCapabilitiesCpuTopology;
function GVIR_CONFIG_CAPABILITIES_CPU_TOPOLOGY_CLASS(klass: Pointer): PGVirConfigCapabilitiesCpuTopologyClass;
function GVIR_CONFIG_IS_CAPABILITIES_CPU_TOPOLOGY(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_CAPABILITIES_CPU_TOPOLOGY_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_CAPABILITIES_CPU_TOPOLOGY_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesCpuTopologyClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_CAPABILITIES_CPU_TOPOLOGY: TGType;
begin
  GVIR_CONFIG_TYPE_CAPABILITIES_CPU_TOPOLOGY := gvir_config_capabilities_cpu_topology_get_type;
end;

function GVIR_CONFIG_CAPABILITIES_CPU_TOPOLOGY(obj: Pointer): PGVirConfigCapabilitiesCpuTopology;
begin
  Result := PGVirConfigCapabilitiesCpuTopology(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_CAPABILITIES_CPU_TOPOLOGY));
end;

function GVIR_CONFIG_CAPABILITIES_CPU_TOPOLOGY_CLASS(klass: Pointer): PGVirConfigCapabilitiesCpuTopologyClass;
begin
  Result := PGVirConfigCapabilitiesCpuTopologyClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_CAPABILITIES_CPU_TOPOLOGY));
end;

function GVIR_CONFIG_IS_CAPABILITIES_CPU_TOPOLOGY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_CAPABILITIES_CPU_TOPOLOGY);
end;

function GVIR_CONFIG_IS_CAPABILITIES_CPU_TOPOLOGY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_CAPABILITIES_CPU_TOPOLOGY);
end;

function GVIR_CONFIG_CAPABILITIES_CPU_TOPOLOGY_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesCpuTopologyClass;
begin
  Result := PGVirConfigCapabilitiesCpuTopologyClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
