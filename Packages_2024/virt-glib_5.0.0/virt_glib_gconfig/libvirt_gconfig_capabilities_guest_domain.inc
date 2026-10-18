{$IFDEF read_interface}


type
  PGVirConfigCapabilitiesGuestDomainPrivate = type Pointer;

  PGVirConfigCapabilitiesGuestDomain = ^TGVirConfigCapabilitiesGuestDomain;
  TGVirConfigCapabilitiesGuestDomain = record
    parent: TGVirConfigObject;
    priv: PGVirConfigCapabilitiesGuestDomainPrivate;
  end;

  PGVirConfigCapabilitiesGuestDomainClass = ^TGVirConfigCapabilitiesGuestDomainClass;
  TGVirConfigCapabilitiesGuestDomainClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_capabilities_guest_domain_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_capabilities_guest_domain_get_emulator(domain: PGVirConfigCapabilitiesGuestDomain): Pgchar; cdecl; external libvirtgconfig;
function gvir_config_capabilities_guest_domain_get_virt_type(domain: PGVirConfigCapabilitiesGuestDomain): TGVirConfigDomainVirtType; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:52:19 ===

function GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_DOMAIN: TGType;
function GVIR_CONFIG_CAPABILITIES_GUEST_DOMAIN(obj: Pointer): PGVirConfigCapabilitiesGuestDomain;
function GVIR_CONFIG_CAPABILITIES_GUEST_DOMAIN_CLASS(klass: Pointer): PGVirConfigCapabilitiesGuestDomainClass;
function GVIR_CONFIG_IS_CAPABILITIES_GUEST_DOMAIN(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_CAPABILITIES_GUEST_DOMAIN_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_CAPABILITIES_GUEST_DOMAIN_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesGuestDomainClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_DOMAIN: TGType;
begin
  GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_DOMAIN := gvir_config_capabilities_guest_domain_get_type;
end;

function GVIR_CONFIG_CAPABILITIES_GUEST_DOMAIN(obj: Pointer): PGVirConfigCapabilitiesGuestDomain;
begin
  Result := PGVirConfigCapabilitiesGuestDomain(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_DOMAIN));
end;

function GVIR_CONFIG_CAPABILITIES_GUEST_DOMAIN_CLASS(klass: Pointer): PGVirConfigCapabilitiesGuestDomainClass;
begin
  Result := PGVirConfigCapabilitiesGuestDomainClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_DOMAIN));
end;

function GVIR_CONFIG_IS_CAPABILITIES_GUEST_DOMAIN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_DOMAIN);
end;

function GVIR_CONFIG_IS_CAPABILITIES_GUEST_DOMAIN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_CAPABILITIES_GUEST_DOMAIN);
end;

function GVIR_CONFIG_CAPABILITIES_GUEST_DOMAIN_GET_CLASS(obj: Pointer): PGVirConfigCapabilitiesGuestDomainClass;
begin
  Result := PGVirConfigCapabilitiesGuestDomainClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
