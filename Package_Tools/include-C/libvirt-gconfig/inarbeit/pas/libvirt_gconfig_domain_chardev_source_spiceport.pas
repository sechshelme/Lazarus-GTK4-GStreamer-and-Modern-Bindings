unit libvirt_gconfig_domain_chardev_source_spiceport;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_domain_chardev_source;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainChardevSourceSpicePortPrivate = type Pointer;

  PGVirConfigDomainChardevSourceSpicePort = ^TGVirConfigDomainChardevSourceSpicePort;
  TGVirConfigDomainChardevSourceSpicePort = record
    parent: TGVirConfigDomainChardevSource;
    priv: PGVirConfigDomainChardevSourceSpicePortPrivate;
  end;

  PGVirConfigDomainChardevSourceSpicePortClass = ^TGVirConfigDomainChardevSourceSpicePortClass;
  TGVirConfigDomainChardevSourceSpicePortClass = record
    parent_class: TGVirConfigDomainChardevSourceClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_chardev_source_spiceport_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_chardev_source_spiceport_new: PGVirConfigDomainChardevSourceSpicePort; cdecl; external libvirtgconfig;
function gvir_config_domain_chardev_source_spiceport_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainChardevSourceSpicePort; cdecl; external libvirtgconfig;
procedure gvir_config_domain_chardev_source_spiceport_set_channel(port: PGVirConfigDomainChardevSourceSpicePort; channel: pchar); cdecl; external libvirtgconfig;
function gvir_config_domain_chardev_source_spiceport_get_channel(port: PGVirConfigDomainChardevSourceSpicePort): Pgchar; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 20:00:03 ===

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_PORT: TGType;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_PORT(obj: Pointer): PGVirConfigDomainChardevSourceSpicePort;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_PORT_CLASS(klass: Pointer): PGVirConfigDomainChardevSourceSpicePortClass;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_SPICE_PORT(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_SPICE_PORT_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_PORT_GET_CLASS(obj: Pointer): PGVirConfigDomainChardevSourceSpicePortClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_PORT: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_PORT := gvir_config_domain_chardev_source_spiceport_get_type;
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_PORT(obj: Pointer): PGVirConfigDomainChardevSourceSpicePort;
begin
  Result := PGVirConfigDomainChardevSourceSpicePort(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_PORT));
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_PORT_CLASS(klass: Pointer): PGVirConfigDomainChardevSourceSpicePortClass;
begin
  Result := PGVirConfigDomainChardevSourceSpicePortClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_PORT));
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_SPICE_PORT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_PORT);
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_SPICE_PORT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_SPICE_PORT);
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_SPICE_PORT_GET_CLASS(obj: Pointer): PGVirConfigDomainChardevSourceSpicePortClass;
begin
  Result := PGVirConfigDomainChardevSourceSpicePortClass(PGTypeInstance(obj)^.g_class);
end;



end.
