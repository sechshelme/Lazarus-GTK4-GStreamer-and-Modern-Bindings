unit libvirt_gconfig_domain_chardev_source_spicevmc;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_domain_chardev_source;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainChardevSourceSpiceVmcPrivate = type Pointer;

  PGVirConfigDomainChardevSourceSpiceVmc = ^TGVirConfigDomainChardevSourceSpiceVmc;
  TGVirConfigDomainChardevSourceSpiceVmc = record
    parent: TGVirConfigDomainChardevSource;
    priv: PGVirConfigDomainChardevSourceSpiceVmcPrivate;
  end;

  PGVirConfigDomainChardevSourceSpiceVmcClass = ^TGVirConfigDomainChardevSourceSpiceVmcClass;
  TGVirConfigDomainChardevSourceSpiceVmcClass = record
    parent_class: TGVirConfigDomainChardevSourceClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_chardev_source_spicevmc_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_chardev_source_spicevmc_new: PGVirConfigDomainChardevSourceSpiceVmc; cdecl; external libvirtgconfig;
function gvir_config_domain_chardev_source_spicevmc_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainChardevSourceSpiceVmc; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:59:59 ===

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_VMC: TGType;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_VMC(obj: Pointer): PGVirConfigDomainChardevSourceSpiceVmc;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_VMC_CLASS(klass: Pointer): PGVirConfigDomainChardevSourceSpiceVmcClass;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_SPICE_VMC(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_SPICE_VMC_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_VMC_GET_CLASS(obj: Pointer): PGVirConfigDomainChardevSourceSpiceVmcClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_VMC: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_VMC := gvir_config_domain_chardev_source_spicevmc_get_type;
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_VMC(obj: Pointer): PGVirConfigDomainChardevSourceSpiceVmc;
begin
  Result := PGVirConfigDomainChardevSourceSpiceVmc(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_VMC));
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_VMC_CLASS(klass: Pointer): PGVirConfigDomainChardevSourceSpiceVmcClass;
begin
  Result := PGVirConfigDomainChardevSourceSpiceVmcClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_VMC));
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_SPICE_VMC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_VMC);
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_SPICE_VMC_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_VMC);
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_VMC_GET_CLASS(obj: Pointer): PGVirConfigDomainChardevSourceSpiceVmcClass;
begin
  Result := PGVirConfigDomainChardevSourceSpiceVmcClass(PGTypeInstance(obj)^.g_class);
end;



end.
