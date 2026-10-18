unit libvirt_gconfig_domain_redirdev;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_domain_chardev, libvirt_gconfig_domain_address;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainRedirdevPrivate = type Pointer;

  PGVirConfigDomainRedirdev = ^TGVirConfigDomainRedirdev;
  TGVirConfigDomainRedirdev = record
    parent: TGVirConfigDomainChardev;
    priv: PGVirConfigDomainRedirdevPrivate;
  end;

  PGVirConfigDomainRedirdevClass = ^TGVirConfigDomainRedirdevClass;
  TGVirConfigDomainRedirdevClass = record
    parent_class: TGVirConfigDomainChardevClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirConfigDomainRedirdevBus = ^TGVirConfigDomainRedirdevBus;
  TGVirConfigDomainRedirdevBus = longint;
const
  GVIR_CONFIG_DOMAIN_REDIRDEV_BUS_USB = 0;

function gvir_config_domain_redirdev_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_redirdev_new: PGVirConfigDomainRedirdev; cdecl; external libvirtgconfig;
function gvir_config_domain_redirdev_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainRedirdev; cdecl; external libvirtgconfig;
procedure gvir_config_domain_redirdev_set_bus(redirdev: PGVirConfigDomainRedirdev; bus: TGVirConfigDomainRedirdevBus); cdecl; external libvirtgconfig;
procedure gvir_config_domain_redirdev_set_address(redirdev: PGVirConfigDomainRedirdev; address: PGVirConfigDomainAddress); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:47:11 ===

function GVIR_CONFIG_TYPE_DOMAIN_REDIRDEV: TGType;
function GVIR_CONFIG_DOMAIN_REDIRDEV(obj: Pointer): PGVirConfigDomainRedirdev;
function GVIR_CONFIG_DOMAIN_REDIRDEV_CLASS(klass: Pointer): PGVirConfigDomainRedirdevClass;
function GVIR_CONFIG_IS_DOMAIN_REDIRDEV(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_REDIRDEV_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_REDIRDEV_GET_CLASS(obj: Pointer): PGVirConfigDomainRedirdevClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_REDIRDEV: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_REDIRDEV := gvir_config_domain_redirdev_get_type;
end;

function GVIR_CONFIG_DOMAIN_REDIRDEV(obj: Pointer): PGVirConfigDomainRedirdev;
begin
  Result := PGVirConfigDomainRedirdev(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_REDIRDEV));
end;

function GVIR_CONFIG_DOMAIN_REDIRDEV_CLASS(klass: Pointer): PGVirConfigDomainRedirdevClass;
begin
  Result := PGVirConfigDomainRedirdevClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_REDIRDEV));
end;

function GVIR_CONFIG_IS_DOMAIN_REDIRDEV(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_REDIRDEV);
end;

function GVIR_CONFIG_IS_DOMAIN_REDIRDEV_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_REDIRDEV);
end;

function GVIR_CONFIG_DOMAIN_REDIRDEV_GET_CLASS(obj: Pointer): PGVirConfigDomainRedirdevClass;
begin
  Result := PGVirConfigDomainRedirdevClass(PGTypeInstance(obj)^.g_class);
end;



end.
