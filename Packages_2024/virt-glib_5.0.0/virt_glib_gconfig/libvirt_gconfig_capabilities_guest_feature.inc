{$IFDEF read_interface}


type
  PGVirConfigCapabilitiesGuestFeaturePrivate = type Pointer;

  PGVirConfigCapabilitiesGuestFeature = ^TGVirConfigCapabilitiesGuestFeature;
  TGVirConfigCapabilitiesGuestFeature = record
    parent: TGVirConfigObject;
    priv: PGVirConfigCapabilitiesGuestFeaturePrivate;
  end;

  PGVirConfigCapabilitiesGuestFeatureClass = ^TGVirConfigCapabilitiesGuestFeatureClass;
  TGVirConfigCapabilitiesGuestFeatureClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_capabilities_guest_feature_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_capabilities_guest_feature_get_name(feature: PGVirConfigCapabilitiesGuestFeature): Pgchar; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:52:15 ===

function GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_FEATURE: TGType;
function GVIR_CONFIG_CAPABILITIES_GUEST_FEATURE(obj: Pointer): PGVirConfigCapabilitiesGuestFeature;
function GVIR_CONFIG_CAPABILITIES_GUEST_FEATURE_CLASS(klass: Pointer): PGVirConfigCapabilitiesGuestFeatureClass;
function GVIR_CONFIG_IS_CAPABILITIES_GUEST_FEATURE(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_CAPABILITIES_GUEST_FEATURE_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_CAPABILITIES_GUEST_FEATURE_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesGuestFeatureClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_FEATURE: TGType;
begin
  GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_FEATURE := gvir_config_capabilities_guest_feature_get_type;
end;

function GVIR_CONFIG_CAPABILITIES_GUEST_FEATURE(obj: Pointer): PGVirConfigCapabilitiesGuestFeature;
begin
  Result := PGVirConfigCapabilitiesGuestFeature(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_FEATURE));
end;

function GVIR_CONFIG_CAPABILITIES_GUEST_FEATURE_CLASS(klass: Pointer): PGVirConfigCapabilitiesGuestFeatureClass;
begin
  Result := PGVirConfigCapabilitiesGuestFeatureClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_FEATURE));
end;

function GVIR_CONFIG_IS_CAPABILITIES_GUEST_FEATURE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_FEATURE);
end;

function GVIR_CONFIG_IS_CAPABILITIES_GUEST_FEATURE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_FEATURE);
end;

function GVIR_CONFIG_CAPABILITIES_GUEST_FEATURE_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesGuestFeatureClass;
begin
  Result := PGVirConfigCapabilitiesGuestFeatureClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
