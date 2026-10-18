unit libvirt_gconfig_domain_chardev;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object, libvirt_gconfig_domain_device, libvirt_gconfig_domain_chardev_source;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainChardevPrivate = type Pointer;

  PGVirConfigDomainChardev = ^TGVirConfigDomainChardev;
  TGVirConfigDomainChardev = record
    parent: TGVirConfigDomainDevice;
    priv: PGVirConfigDomainChardevPrivate;
  end;

  PGVirConfigDomainChardevClass = ^TGVirConfigDomainChardevClass;
  TGVirConfigDomainChardevClass = record
    parent_class: TGVirConfigDomainDeviceClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_chardev_get_type: TGType; cdecl; external libvirtgconfig;
procedure gvir_config_domain_chardev_set_source(chardev: PGVirConfigDomainChardev; source: PGVirConfigDomainChardevSource); cdecl; external libvirtgconfig;
function gvir_config_domain_chardev_get_source(chardev: PGVirConfigDomainChardev): PGVirConfigDomainChardevSource; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:56:01 ===

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV: TGType;
function GVIR_CONFIG_DOMAIN_CHARDEV(obj: Pointer): PGVirConfigDomainChardev;
function GVIR_CONFIG_DOMAIN_CHARDEV_CLASS(klass: Pointer): PGVirConfigDomainChardevClass;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_CHARDEV_GET_CLASS(obj: Pointer): PGVirConfigDomainChardevClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CHARDEV := gvir_config_domain_chardev_get_type;
end;

function GVIR_CONFIG_DOMAIN_CHARDEV(obj: Pointer): PGVirConfigDomainChardev;
begin
  Result := PGVirConfigDomainChardev(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV));
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_CLASS(klass: Pointer): PGVirConfigDomainChardevClass;
begin
  Result := PGVirConfigDomainChardevClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV));
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV);
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV);
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_GET_CLASS(obj: Pointer): PGVirConfigDomainChardevClass;
begin
  Result := PGVirConfigDomainChardevClass(PGTypeInstance(obj)^.g_class);
end;



end.
