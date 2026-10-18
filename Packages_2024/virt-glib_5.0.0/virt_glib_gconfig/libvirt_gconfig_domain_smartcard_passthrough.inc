{$IFDEF read_interface}


type
  PGVirConfigDomainSmartcardPassthroughPrivate = type Pointer;

  PGVirConfigDomainSmartcardPassthrough = ^TGVirConfigDomainSmartcardPassthrough;
  TGVirConfigDomainSmartcardPassthrough = record
    parent: TGVirConfigDomainSmartcard;
    priv: PGVirConfigDomainSmartcardPassthroughPrivate;
  end;

  PGVirConfigDomainSmartcardPassthroughClass = ^TGVirConfigDomainSmartcardPassthroughClass;
  TGVirConfigDomainSmartcardPassthroughClass = record
    parent_class: TGVirConfigDomainSmartcardClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_smartcard_passthrough_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_smartcard_passthrough_new: PGVirConfigDomainSmartcardPassthrough; cdecl; external libvirtgconfig;
function gvir_config_domain_smartcard_passthrough_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainSmartcardPassthrough; cdecl; external libvirtgconfig;
procedure gvir_config_domain_smartcard_passthrough_set_source(smartcard: PGVirConfigDomainSmartcardPassthrough; source: PGVirConfigDomainChardevSource); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:49:51 ===

function GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_PASSTHROUGH: TGType;
function GVIR_CONFIG_DOMAIN_SMARTCARD_PASSTHROUGH(obj: Pointer): PGVirConfigDomainSmartcardPassthrough;
function GVIR_CONFIG_DOMAIN_SMARTCARD_PASSTHROUGH_CLASS(klass: Pointer): PGVirConfigDomainSmartcardPassthroughClass;
function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_PASSTHROUGH(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_PASSTHROUGH_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_SMARTCARD_PASSTHROUGH_GET_CLASS(obj: Pointer): PGVirConfigDomainSmartcardPassthroughClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_PASSTHROUGH: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_PASSTHROUGH := gvir_config_domain_smartcard_passthrough_get_type;
end;

function GVIR_CONFIG_DOMAIN_SMARTCARD_PASSTHROUGH(obj: Pointer): PGVirConfigDomainSmartcardPassthrough;
begin
  Result := PGVirConfigDomainSmartcardPassthrough(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_PASSTHROUGH));
end;

function GVIR_CONFIG_DOMAIN_SMARTCARD_PASSTHROUGH_CLASS(klass: Pointer): PGVirConfigDomainSmartcardPassthroughClass;
begin
  Result := PGVirConfigDomainSmartcardPassthroughClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_PASSTHROUGH));
end;

function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_PASSTHROUGH(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_PASSTHROUGH);
end;

function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_PASSTHROUGH_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_PASSTHROUGH);
end;

function GVIR_CONFIG_DOMAIN_SMARTCARD_PASSTHROUGH_GET_CLASS(obj: Pointer): PGVirConfigDomainSmartcardPassthroughClass;
begin
  Result := PGVirConfigDomainSmartcardPassthroughClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
