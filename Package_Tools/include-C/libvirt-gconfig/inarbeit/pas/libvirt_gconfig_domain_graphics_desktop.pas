unit libvirt_gconfig_domain_graphics_desktop;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_domain_graphics;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainGraphicsDesktopPrivate = type Pointer;

  PGVirConfigDomainGraphicsDesktop = ^TGVirConfigDomainGraphicsDesktop;
  TGVirConfigDomainGraphicsDesktop = record
    parent: TGVirConfigDomainGraphics;
    priv: PGVirConfigDomainGraphicsDesktopPrivate;
  end;

  PGVirConfigDomainGraphicsDesktopClass = ^TGVirConfigDomainGraphicsDesktopClass;
  TGVirConfigDomainGraphicsDesktopClass = record
    parent_class: TGVirConfigDomainGraphicsClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_graphics_desktop_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_graphics_desktop_new: PGVirConfigDomainGraphicsDesktop; cdecl; external libvirtgconfig;
function gvir_config_domain_graphics_desktop_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainGraphicsDesktop; cdecl; external libvirtgconfig;
function gvir_config_domain_graphics_desktop_get_display(graphics: PGVirConfigDomainGraphicsDesktop): Pgchar; cdecl; external libvirtgconfig;
procedure gvir_config_domain_graphics_desktop_set_display(graphics: PGVirConfigDomainGraphicsDesktop; disp: Pgchar); cdecl; external libvirtgconfig;
function gvir_config_domain_graphics_desktop_get_fullscreen(graphics: PGVirConfigDomainGraphicsDesktop): Tgboolean; cdecl; external libvirtgconfig;
procedure gvir_config_domain_graphics_desktop_set_fullscreen(graphics: PGVirConfigDomainGraphicsDesktop; fullscreen: Tgboolean); cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 20:08:47 ===

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DESKTOP: TGType;
function GVIR_CONFIG_DOMAIN_GRAPHICS_DESKTOP(obj: Pointer): PGVirConfigDomainGraphicsDesktop;
function GVIR_CONFIG_DOMAIN_GRAPHICS_DESKTOP_CLASS(klass: Pointer): PGVirConfigDomainGraphicsDesktopClass;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_DESKTOP(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_DESKTOP_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_GRAPHICS_DESKTOP_GET_CLASS(obj: Pointer): PGVirConfigDomainGraphicsDesktopClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DESKTOP: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DESKTOP := gvir_config_domain_graphics_desktop_get_type;
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_DESKTOP(obj: Pointer): PGVirConfigDomainGraphicsDesktop;
begin
  Result := PGVirConfigDomainGraphicsDesktop(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DESKTOP));
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_DESKTOP_CLASS(klass: Pointer): PGVirConfigDomainGraphicsDesktopClass;
begin
  Result := PGVirConfigDomainGraphicsDesktopClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DESKTOP));
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_DESKTOP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DESKTOP);
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_DESKTOP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_DESKTOP);
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_DESKTOP_GET_CLASS(obj: Pointer): PGVirConfigDomainGraphicsDesktopClass;
begin
  Result := PGVirConfigDomainGraphicsDesktopClass(PGTypeInstance(obj)^.g_class);
end;



end.
