{$IFDEF read_interface}


type
  PGVirConfigCapabilitiesHostPrivate = type Pointer;

  PGVirConfigCapabilitiesHost = ^TGVirConfigCapabilitiesHost;
  TGVirConfigCapabilitiesHost = record
    parent: TGVirConfigObject;
    priv: PGVirConfigCapabilitiesHostPrivate;
  end;

  PGVirConfigCapabilitiesHostClass = ^TGVirConfigCapabilitiesHostClass;
  TGVirConfigCapabilitiesHostClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_capabilities_host_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_capabilities_host_get_uuid(host: PGVirConfigCapabilitiesHost): Pgchar; cdecl; external libvirtgconfig;
function gvir_config_capabilities_host_get_cpu(host: PGVirConfigCapabilitiesHost): PGVirConfigCapabilitiesCpu; cdecl; external libvirtgconfig;
function gvir_config_capabilities_host_get_secmodels(host: PGVirConfigCapabilitiesHost): PGList; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:52:12 ===

function GVIR_CONFIG_TYPE_CAPABILITIES_HOST: TGType;
function GVIR_CONFIG_CAPABILITIES_HOST(obj: Pointer): PGVirConfigCapabilitiesHost;
function GVIR_CONFIG_CAPABILITIES_HOST_CLASS(klass: Pointer): PGVirConfigCapabilitiesHostClass;
function GVIR_CONFIG_IS_CAPABILITIES_HOST(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_CAPABILITIES_HOST_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_CAPABILITIES_HOST_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesHostClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_CAPABILITIES_HOST: TGType;
begin
  GVIR_CONFIG_TYPE_CAPABILITIES_HOST := gvir_config_capabilities_host_get_type;
end;

function GVIR_CONFIG_CAPABILITIES_HOST(obj: Pointer): PGVirConfigCapabilitiesHost;
begin
  Result := PGVirConfigCapabilitiesHost(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_CAPABILITIES_HOST));
end;

function GVIR_CONFIG_CAPABILITIES_HOST_CLASS(klass: Pointer): PGVirConfigCapabilitiesHostClass;
begin
  Result := PGVirConfigCapabilitiesHostClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_CAPABILITIES_HOST));
end;

function GVIR_CONFIG_IS_CAPABILITIES_HOST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_CAPABILITIES_HOST);
end;

function GVIR_CONFIG_IS_CAPABILITIES_HOST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_CAPABILITIES_HOST);
end;

function GVIR_CONFIG_CAPABILITIES_HOST_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesHostClass;
begin
  Result := PGVirConfigCapabilitiesHostClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
