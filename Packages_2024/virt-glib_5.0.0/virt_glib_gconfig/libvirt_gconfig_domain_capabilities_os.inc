{$IFDEF read_interface}


type
  PGVirConfigDomainCapabilitiesOsPrivate = type Pointer;

  PGVirConfigDomainCapabilitiesOs = ^TGVirConfigDomainCapabilitiesOs;
  TGVirConfigDomainCapabilitiesOs = record
    parent: TGVirConfigObject;
    priv: PGVirConfigDomainCapabilitiesOsPrivate;
  end;

  PGVirConfigDomainCapabilitiesOsClass = ^TGVirConfigDomainCapabilitiesOsClass;
  TGVirConfigDomainCapabilitiesOsClass = record
    parent_class: TGVirConfigObjectClass;
    get_firmwares: function(os: PGVirConfigDomainCapabilitiesOs): PGList; cdecl;
    padding: array[0..18] of Tgpointer;
  end;

function gvir_config_domain_capabilities_os_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_capabilities_os_get_firmwares(os: PGVirConfigDomainCapabilitiesOs): PGList; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:56:06 ===

function GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES_OS: TGType;
function GVIR_CONFIG_DOMAIN_CAPABILITIES_OS(obj: Pointer): PGVirConfigDomainCapabilitiesOs;
function GVIR_CONFIG_DOMAIN_CAPABILITIES_OS_CLASS(klass: Pointer): PGVirConfigDomainCapabilitiesOsClass;
function GVIR_CONFIG_IS_DOMAIN_CAPABILITIES_OS(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CAPABILITIES_OS_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_CAPABILITIES_OS_GET_CLASS(obj: Pointer): PGVirConfigDomainCapabilitiesOsClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES_OS: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES_OS := gvir_config_domain_capabilities_os_get_type;
end;

function GVIR_CONFIG_DOMAIN_CAPABILITIES_OS(obj: Pointer): PGVirConfigDomainCapabilitiesOs;
begin
  Result := PGVirConfigDomainCapabilitiesOs(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES_OS));
end;

function GVIR_CONFIG_DOMAIN_CAPABILITIES_OS_CLASS(klass: Pointer): PGVirConfigDomainCapabilitiesOsClass;
begin
  Result := PGVirConfigDomainCapabilitiesOsClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES_OS));
end;

function GVIR_CONFIG_IS_DOMAIN_CAPABILITIES_OS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES_OS);
end;

function GVIR_CONFIG_IS_DOMAIN_CAPABILITIES_OS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES_OS);
end;

function GVIR_CONFIG_DOMAIN_CAPABILITIES_OS_GET_CLASS(obj: Pointer): PGVirConfigDomainCapabilitiesOsClass;
begin
  Result := PGVirConfigDomainCapabilitiesOsClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
