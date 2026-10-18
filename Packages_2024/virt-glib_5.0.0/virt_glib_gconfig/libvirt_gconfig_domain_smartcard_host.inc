{$IFDEF read_interface}


type
  PGVirConfigDomainSmartcardHostPrivate = type Pointer;

  PGVirConfigDomainSmartcardHost = ^TGVirConfigDomainSmartcardHost;
  TGVirConfigDomainSmartcardHost = record
    parent: TGVirConfigDomainSmartcard;
    priv: PGVirConfigDomainSmartcardHostPrivate;
  end;

  PGVirConfigDomainSmartcardHostClass = ^TGVirConfigDomainSmartcardHostClass;
  TGVirConfigDomainSmartcardHostClass = record
    parent_class: TGVirConfigDomainSmartcardClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_smartcard_host_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_smartcard_host_new: PGVirConfigDomainSmartcardHost; cdecl; external libvirtgconfig;
function gvir_config_domain_smartcard_host_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainSmartcardHost; cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:46:59 ===

function GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST: TGType;
function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST(obj: Pointer): PGVirConfigDomainSmartcardHost;
function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_CLASS(klass: Pointer): PGVirConfigDomainSmartcardHostClass;
function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_HOST(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_HOST_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_GET_CLASS(obj: Pointer): PGVirConfigDomainSmartcardHostClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST := gvir_config_domain_smartcard_host_get_type;
end;

function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST(obj: Pointer): PGVirConfigDomainSmartcardHost;
begin
  Result := PGVirConfigDomainSmartcardHost(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST));
end;

function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_CLASS(klass: Pointer): PGVirConfigDomainSmartcardHostClass;
begin
  Result := PGVirConfigDomainSmartcardHostClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST));
end;

function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_HOST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST);
end;

function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_HOST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST);
end;

function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_GET_CLASS(obj: Pointer): PGVirConfigDomainSmartcardHostClass;
begin
  Result := PGVirConfigDomainSmartcardHostClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
