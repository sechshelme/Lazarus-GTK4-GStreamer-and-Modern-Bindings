unit libvirt_gconfig_domain_smartcard;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_domain_device, libvirt_gconfig_domain_redirdev, libvirt_gconfig_domain_address;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainSmartcardPrivate = type Pointer;

  PGVirConfigDomainSmartcard = ^TGVirConfigDomainSmartcard;
  TGVirConfigDomainSmartcard = record
    parent: TGVirConfigDomainDevice;
    priv: PGVirConfigDomainSmartcardPrivate;
  end;

  PGVirConfigDomainSmartcardClass = ^TGVirConfigDomainSmartcardClass;
  TGVirConfigDomainSmartcardClass = record
    parent_class: TGVirConfigDomainDeviceClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_smartcard_get_type: TGType; cdecl; external libvirtgconfig;
procedure gvir_config_domain_smartcard_set_address(redirdev: PGVirConfigDomainRedirdev; address: PGVirConfigDomainAddress); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:47:04 ===

function GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD: TGType;
function GVIR_CONFIG_DOMAIN_SMARTCARD(obj: Pointer): PGVirConfigDomainSmartcard;
function GVIR_CONFIG_DOMAIN_SMARTCARD_CLASS(klass: Pointer): PGVirConfigDomainSmartcardClass;
function GVIR_CONFIG_IS_DOMAIN_SMARTCARD(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_SMARTCARD_GET_CLASS(obj: Pointer): PGVirConfigDomainSmartcardClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD := gvir_config_domain_smartcard_get_type;
end;

function GVIR_CONFIG_DOMAIN_SMARTCARD(obj: Pointer): PGVirConfigDomainSmartcard;
begin
  Result := PGVirConfigDomainSmartcard(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD));
end;

function GVIR_CONFIG_DOMAIN_SMARTCARD_CLASS(klass: Pointer): PGVirConfigDomainSmartcardClass;
begin
  Result := PGVirConfigDomainSmartcardClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD));
end;

function GVIR_CONFIG_IS_DOMAIN_SMARTCARD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD);
end;

function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD);
end;

function GVIR_CONFIG_DOMAIN_SMARTCARD_GET_CLASS(obj: Pointer): PGVirConfigDomainSmartcardClass;
begin
  Result := PGVirConfigDomainSmartcardClass(PGTypeInstance(obj)^.g_class);
end;



end.
