unit libvirt_gconfig_domain_graphics_dbus;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_domain_graphics;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainGraphicsDBusPrivate = type Pointer;

  PGVirConfigDomainGraphicsDBus = ^TGVirConfigDomainGraphicsDBus;
  TGVirConfigDomainGraphicsDBus = record
    parent: TGVirConfigDomainGraphics;
    priv: PGVirConfigDomainGraphicsDBusPrivate;
  end;

  PGVirConfigDomainGraphicsDBusClass = ^TGVirConfigDomainGraphicsDBusClass;
  TGVirConfigDomainGraphicsDBusClass = record
    parent_class: TGVirConfigDomainGraphicsClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_graphics_dbus_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_graphics_dbus_new: PGVirConfigDomainGraphicsDBus; cdecl; external libvirtgconfig;
function gvir_config_domain_graphics_dbus_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainGraphicsDBus; cdecl; external libvirtgconfig;
function gvir_config_domain_graphics_dbus_get_address(graphics: PGVirConfigDomainGraphicsDBus): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_domain_graphics_dbus_set_address(graphics: PGVirConfigDomainGraphicsDBus; address: pchar); cdecl; external libvirtgconfig;
procedure gvir_config_domain_graphics_dbus_set_gl(graphics: PGVirConfigDomainGraphicsDBus; gl: Tgboolean); cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 20:08:52 ===

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS: TGType;
function GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS(obj: Pointer): PGVirConfigDomainGraphicsDBus;
function GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS_CLASS(klass: Pointer): PGVirConfigDomainGraphicsDBusClass;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_DBUS(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_DBUS_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS_GET_CLASS(obj: Pointer): PGVirConfigDomainGraphicsDBusClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS := gvir_config_domain_graphics_dbus_get_type;
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS(obj: Pointer): PGVirConfigDomainGraphicsDBus;
begin
  Result := PGVirConfigDomainGraphicsDBus(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS));
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS_CLASS(klass: Pointer): PGVirConfigDomainGraphicsDBusClass;
begin
  Result := PGVirConfigDomainGraphicsDBusClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS));
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_DBUS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS);
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_DBUS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DBUS);
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_DBUS_GET_CLASS(obj: Pointer): PGVirConfigDomainGraphicsDBusClass;
begin
  Result := PGVirConfigDomainGraphicsDBusClass(PGTypeInstance(obj)^.g_class);
end;



end.
