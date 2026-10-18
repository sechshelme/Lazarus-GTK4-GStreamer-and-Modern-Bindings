unit libvirt_gconfig_domain_graphics_spice;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_domain_graphics;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainGraphicsSpicePrivate = type Pointer;

  PGVirConfigDomainGraphicsSpice = ^TGVirConfigDomainGraphicsSpice;
  TGVirConfigDomainGraphicsSpice = record
    parent: TGVirConfigDomainGraphics;
    priv: PGVirConfigDomainGraphicsSpicePrivate;
  end;

  PGVirConfigDomainGraphicsSpiceClass = ^TGVirConfigDomainGraphicsSpiceClass;
  TGVirConfigDomainGraphicsSpiceClass = record
    parent_class: TGVirConfigDomainGraphicsClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirConfigDomainGraphicsSpiceImageCompression = ^TGVirConfigDomainGraphicsSpiceImageCompression;
  TGVirConfigDomainGraphicsSpiceImageCompression = longint;
const
  GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION_AUTO_GLZ = 0;
  GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION_AUTO_LZ = 1;
  GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION_QUIC = 2;
  GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION_GLZ = 3;
  GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION_LZ = 4;
  GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION_OFF = 5;


function gvir_config_domain_graphics_spice_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_graphics_spice_new: PGVirConfigDomainGraphicsSpice; cdecl; external libvirtgconfig;
function gvir_config_domain_graphics_spice_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainGraphicsSpice; cdecl; external libvirtgconfig;
procedure gvir_config_domain_graphics_spice_set_autoport(graphics: PGVirConfigDomainGraphicsSpice; autoport: Tgboolean); cdecl; external libvirtgconfig;
procedure gvir_config_domain_graphics_spice_set_password(graphics: PGVirConfigDomainGraphicsSpice; password: pchar); cdecl; external libvirtgconfig;
function gvir_config_domain_graphics_spice_get_port(graphics: PGVirConfigDomainGraphicsSpice): longint; cdecl; external libvirtgconfig;
procedure gvir_config_domain_graphics_spice_set_port(graphics: PGVirConfigDomainGraphicsSpice; port: longint); cdecl; external libvirtgconfig;
procedure gvir_config_domain_graphics_spice_set_tls_port(graphics: PGVirConfigDomainGraphicsSpice; port: longint); cdecl; external libvirtgconfig;
procedure gvir_config_domain_graphics_spice_set_image_compression(graphics: PGVirConfigDomainGraphicsSpice; compression: TGVirConfigDomainGraphicsSpiceImageCompression); cdecl; external libvirtgconfig;
function gvir_config_domain_graphics_spice_get_image_compression(graphics: PGVirConfigDomainGraphicsSpice): longint; cdecl; external libvirtgconfig;
procedure gvir_config_domain_graphics_spice_set_gl(graphics: PGVirConfigDomainGraphicsSpice; gl: Tgboolean); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:43:40 ===

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE: TGType;
function GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE(obj: Pointer): PGVirConfigDomainGraphicsSpice;
function GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_CLASS(klass: Pointer): PGVirConfigDomainGraphicsSpiceClass;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SPICE(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SPICE_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_GET_CLASS(obj: Pointer): PGVirConfigDomainGraphicsSpiceClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE := gvir_config_domain_graphics_spice_get_type;
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE(obj: Pointer): PGVirConfigDomainGraphicsSpice;
begin
  Result := PGVirConfigDomainGraphicsSpice(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE));
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_CLASS(klass: Pointer): PGVirConfigDomainGraphicsSpiceClass;
begin
  Result := PGVirConfigDomainGraphicsSpiceClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE));
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SPICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE);
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SPICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE);
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_SPICE_GET_CLASS(obj: Pointer): PGVirConfigDomainGraphicsSpiceClass;
begin
  Result := PGVirConfigDomainGraphicsSpiceClass(PGTypeInstance(obj)^.g_class);
end;



end.
