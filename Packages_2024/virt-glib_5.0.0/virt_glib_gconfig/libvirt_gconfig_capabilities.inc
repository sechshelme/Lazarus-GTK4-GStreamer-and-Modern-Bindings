{$IFDEF read_interface}


type
  PGVirConfigCapabilitiesPrivate = type Pointer;

  PGVirConfigCapabilities = ^TGVirConfigCapabilities;
  TGVirConfigCapabilities = record
    parent: TGVirConfigObject;
    priv: PGVirConfigCapabilitiesPrivate;
  end;

  PGVirConfigCapabilitiesClass = ^TGVirConfigCapabilitiesClass;
  TGVirConfigCapabilitiesClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_capabilities_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_capabilities_new: PGVirConfigCapabilities; cdecl; external libvirtgconfig;
function gvir_config_capabilities_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigCapabilities; cdecl; external libvirtgconfig;
function gvir_config_capabilities_get_host(caps: PGVirConfigCapabilities): PGVirConfigCapabilitiesHost; cdecl; external libvirtgconfig;
function gvir_config_capabilities_get_guests(caps: PGVirConfigCapabilities): PGList; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:53:13 ===

function GVIR_CONFIG_TYPE_CAPABILITIES: TGType;
function GVIR_CONFIG_CAPABILITIES(obj: Pointer): PGVirConfigCapabilities;
function GVIR_CONFIG_CAPABILITIES_CLASS(klass: Pointer): PGVirConfigCapabilitiesClass;
function GVIR_CONFIG_IS_CAPABILITIES(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_CAPABILITIES_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_CAPABILITIES_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_CAPABILITIES: TGType;
begin
  GVIR_CONFIG_TYPE_CAPABILITIES := gvir_config_capabilities_get_type;
end;

function GVIR_CONFIG_CAPABILITIES(obj: Pointer): PGVirConfigCapabilities;
begin
  Result := PGVirConfigCapabilities(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_CAPABILITIES));
end;

function GVIR_CONFIG_CAPABILITIES_CLASS(klass: Pointer): PGVirConfigCapabilitiesClass;
begin
  Result := PGVirConfigCapabilitiesClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_CAPABILITIES));
end;

function GVIR_CONFIG_IS_CAPABILITIES(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_CAPABILITIES);
end;

function GVIR_CONFIG_IS_CAPABILITIES_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_CAPABILITIES);
end;

function GVIR_CONFIG_CAPABILITIES_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesClass;
begin
  Result := PGVirConfigCapabilitiesClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
