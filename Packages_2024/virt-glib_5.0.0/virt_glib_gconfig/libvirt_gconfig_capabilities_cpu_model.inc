{$IFDEF read_interface}


type
  PGVirConfigCapabilitiesCpuModelPrivate = type Pointer;

  PGVirConfigCapabilitiesCpuModel = ^TGVirConfigCapabilitiesCpuModel;
  TGVirConfigCapabilitiesCpuModel = record
    parent: TGVirConfigObject;
    priv: PGVirConfigCapabilitiesCpuModelPrivate;
  end;

  PGVirConfigCapabilitiesCpuModelClass = ^TGVirConfigCapabilitiesCpuModelClass;
  TGVirConfigCapabilitiesCpuModelClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_capabilities_cpu_model_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_capabilities_cpu_model_new: PGVirConfigCapabilitiesCpuModel; cdecl; external libvirtgconfig;
function gvir_config_capabilities_cpu_model_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigCapabilitiesCpuModel; cdecl; external libvirtgconfig;
procedure gvir_config_capabilities_cpu_model_set_name(model: PGVirConfigCapabilitiesCpuModel; name: Pgchar); cdecl; external libvirtgconfig;
function gvir_config_capabilities_cpu_model_get_name(model: PGVirConfigCapabilitiesCpuModel): Pgchar; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:52:41 ===

function GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL: TGType;
function GVIR_CONFIG_CAPABILITIES_CPU_MODEL(obj: Pointer): PGVirConfigCapabilitiesCpuModel;
function GVIR_CONFIG_CAPABILITIES_CPU_MODEL_CLASS(klass: Pointer): PGVirConfigCapabilitiesCpuModelClass;
function GVIR_CONFIG_IS_CAPABILITIES_CPU_MODEL(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_CAPABILITIES_CPU_MODEL_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_CAPABILITIES_CPU_MODEL_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesCpuModelClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL: TGType;
begin
  GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL := gvir_config_capabilities_cpu_model_get_type;
end;

function GVIR_CONFIG_CAPABILITIES_CPU_MODEL(obj: Pointer): PGVirConfigCapabilitiesCpuModel;
begin
  Result := PGVirConfigCapabilitiesCpuModel(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL));
end;

function GVIR_CONFIG_CAPABILITIES_CPU_MODEL_CLASS(klass: Pointer): PGVirConfigCapabilitiesCpuModelClass;
begin
  Result := PGVirConfigCapabilitiesCpuModelClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL));
end;

function GVIR_CONFIG_IS_CAPABILITIES_CPU_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL);
end;

function GVIR_CONFIG_IS_CAPABILITIES_CPU_MODEL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_CAPABILITIES_CPU_MODEL);
end;

function GVIR_CONFIG_CAPABILITIES_CPU_MODEL_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesCpuModelClass;
begin
  Result := PGVirConfigCapabilitiesCpuModelClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
