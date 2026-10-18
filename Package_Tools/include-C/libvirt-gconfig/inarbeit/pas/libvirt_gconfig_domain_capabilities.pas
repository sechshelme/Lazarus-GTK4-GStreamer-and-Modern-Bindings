unit libvirt_gconfig_domain_capabilities;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object, libvirt_gconfig_domain_capabilities_os;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainCapabilitiesPrivate = type Pointer;

  PGVirConfigDomainCapabilities = ^TGVirConfigDomainCapabilities;
  TGVirConfigDomainCapabilities = record
    parent: TGVirConfigObject;
    priv: PGVirConfigDomainCapabilitiesPrivate;
  end;

  PGVirConfigDomainCapabilitiesClass = ^TGVirConfigDomainCapabilitiesClass;
  TGVirConfigDomainCapabilitiesClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_capabilities_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_capabilities_new: PGVirConfigDomainCapabilities; cdecl; external libvirtgconfig;
function gvir_config_domain_capabilities_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainCapabilities; cdecl; external libvirtgconfig;
function gvir_config_domain_capabilities_get_os(domain_caps: PGVirConfigDomainCapabilities): PGVirConfigDomainCapabilitiesOs; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:56:08 ===

function GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES: TGType;
function GVIR_CONFIG_DOMAIN_CAPABILITIES(obj: Pointer): PGVirConfigDomainCapabilities;
function GVIR_CONFIG_DOMAIN_CAPABILITIES_CLASS(klass: Pointer): PGVirConfigDomainCapabilitiesClass;
function GVIR_CONFIG_IS_DOMAIN_CAPABILITIES(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CAPABILITIES_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_CAPABILITIES_GET_CLASS(obj: Pointer): PGVirConfigDomainCapabilitiesClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES := gvir_config_domain_capabilities_get_type;
end;

function GVIR_CONFIG_DOMAIN_CAPABILITIES(obj: Pointer): PGVirConfigDomainCapabilities;
begin
  Result := PGVirConfigDomainCapabilities(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES));
end;

function GVIR_CONFIG_DOMAIN_CAPABILITIES_CLASS(klass: Pointer): PGVirConfigDomainCapabilitiesClass;
begin
  Result := PGVirConfigDomainCapabilitiesClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES));
end;

function GVIR_CONFIG_IS_DOMAIN_CAPABILITIES(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES);
end;

function GVIR_CONFIG_IS_DOMAIN_CAPABILITIES_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_CAPABILITIES);
end;

function GVIR_CONFIG_DOMAIN_CAPABILITIES_GET_CLASS(obj: Pointer): PGVirConfigDomainCapabilitiesClass;
begin
  Result := PGVirConfigDomainCapabilitiesClass(PGTypeInstance(obj)^.g_class);
end;



end.
