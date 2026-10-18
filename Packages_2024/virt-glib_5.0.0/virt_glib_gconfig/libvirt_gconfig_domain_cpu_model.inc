{$IFDEF read_interface}


type
  PGVirConfigDomainCpuModelPrivate = type Pointer;

  PGVirConfigDomainCpuModel = ^TGVirConfigDomainCpuModel;
  TGVirConfigDomainCpuModel = record
    parent: TGVirConfigCapabilitiesCpuModel;
    priv: PGVirConfigDomainCpuModelPrivate;
  end;

  PGVirConfigDomainCpuModelClass = ^TGVirConfigDomainCpuModelClass;
  TGVirConfigDomainCpuModelClass = record
    parent_class: TGVirConfigCapabilitiesCpuModelClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_cpu_model_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_cpu_model_new: PGVirConfigDomainCpuModel; cdecl; external libvirtgconfig;
function gvir_config_domain_cpu_model_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainCpuModel; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 20:09:15 ===

function GVIR_CONFIG_TYPE_DOMAIN_CPU_MODEL: TGType;
function GVIR_CONFIG_DOMAIN_CPU_MODEL(obj: Pointer): PGVirConfigDomainCpuModel;
function GVIR_CONFIG_DOMAIN_CPU_MODEL_CLASS(klass: Pointer): PGVirConfigDomainCpuModelClass;
function GVIR_CONFIG_IS_DOMAIN_CPU_MODEL(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CPU_MODEL_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_CPU_MODEL_GET_CLASS(obj: Pointer): PGVirConfigDomainCpuModelClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_CPU_MODEL: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CPU_MODEL := gvir_config_domain_cpu_model_get_type;
end;

function GVIR_CONFIG_DOMAIN_CPU_MODEL(obj: Pointer): PGVirConfigDomainCpuModel;
begin
  Result := PGVirConfigDomainCpuModel(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CPU_MODEL));
end;

function GVIR_CONFIG_DOMAIN_CPU_MODEL_CLASS(klass: Pointer): PGVirConfigDomainCpuModelClass;
begin
  Result := PGVirConfigDomainCpuModelClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CPU_MODEL));
end;

function GVIR_CONFIG_IS_DOMAIN_CPU_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_CPU_MODEL);
end;

function GVIR_CONFIG_IS_DOMAIN_CPU_MODEL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_CPU_MODEL);
end;

function GVIR_CONFIG_DOMAIN_CPU_MODEL_GET_CLASS(obj: Pointer): PGVirConfigDomainCpuModelClass;
begin
  Result := PGVirConfigDomainCpuModelClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
