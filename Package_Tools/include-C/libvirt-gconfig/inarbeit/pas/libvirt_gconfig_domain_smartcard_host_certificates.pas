unit libvirt_gconfig_domain_smartcard_host_certificates;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_domain_smartcard;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainSmartcardHostCertificatesPrivate = type Pointer;

  PGVirConfigDomainSmartcardHostCertificates = ^TGVirConfigDomainSmartcardHostCertificates;
  TGVirConfigDomainSmartcardHostCertificates = record
    parent: TGVirConfigDomainSmartcard;
    priv: PGVirConfigDomainSmartcardHostCertificatesPrivate;
  end;

  PGVirConfigDomainSmartcardHostCertificatesClass = ^TGVirConfigDomainSmartcardHostCertificatesClass;
  TGVirConfigDomainSmartcardHostCertificatesClass = record
    parent_class: TGVirConfigDomainSmartcardClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_smartcard_host_certificates_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_smartcard_host_certificates_new: PGVirConfigDomainSmartcardHostCertificates; cdecl; external libvirtgconfig;
function gvir_config_domain_smartcard_host_certificates_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainSmartcardHostCertificates; cdecl; external libvirtgconfig;
procedure gvir_config_domain_smartcard_host_certificates_set_database(smartcard: PGVirConfigDomainSmartcardHostCertificates; path: pchar); cdecl; external libvirtgconfig;
procedure gvir_config_domain_smartcard_host_certificates_set_certificates(smartcard: PGVirConfigDomainSmartcardHostCertificates; cert1: pchar; cert2: pchar; cert3: pchar); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:45:37 ===

function GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST_CERTIFICATES: TGType;
function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_CERTIFICATES(obj: Pointer): PGVirConfigDomainSmartcardHostCertificates;
function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_CERTIFICATES_CLASS(klass: Pointer): PGVirConfigDomainSmartcardHostCertificatesClass;
function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_HOST_CERTIFICATES(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_HOST_CERTIFICATES_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_CERTIFICATES_GET_CLASS(obj: Pointer): PGVirConfigDomainSmartcardHostCertificatesClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST_CERTIFICATES: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST_CERTIFICATES := gvir_config_domain_smartcard_host_certificates_get_type;
end;

function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_CERTIFICATES(obj: Pointer): PGVirConfigDomainSmartcardHostCertificates;
begin
  Result := PGVirConfigDomainSmartcardHostCertificates(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST_CERTIFICATES));
end;

function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_CERTIFICATES_CLASS(klass: Pointer): PGVirConfigDomainSmartcardHostCertificatesClass;
begin
  Result := PGVirConfigDomainSmartcardHostCertificatesClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST_CERTIFICATES));
end;

function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_HOST_CERTIFICATES(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST_CERTIFICATES);
end;

function GVIR_CONFIG_IS_DOMAIN_SMARTCARD_HOST_CERTIFICATES_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_SMARTCARD_HOST_CERTIFICATES);
end;

function GVIR_CONFIG_DOMAIN_SMARTCARD_HOST_CERTIFICATES_GET_CLASS(obj: Pointer): PGVirConfigDomainSmartcardHostCertificatesClass;
begin
  Result := PGVirConfigDomainSmartcardHostCertificatesClass(PGTypeInstance(obj)^.g_class);
end;



end.
