{$IFDEF read_interface}


type
  PGVirConfigDomainGraphicsRdpPrivate = type Pointer;

  PGVirConfigDomainGraphicsRdp = ^TGVirConfigDomainGraphicsRdp;
  TGVirConfigDomainGraphicsRdp = record
    parent: TGVirConfigDomainGraphics;
    priv: PGVirConfigDomainGraphicsRdpPrivate;
  end;

  PGVirConfigDomainGraphicsRdpClass = ^TGVirConfigDomainGraphicsRdpClass;
  TGVirConfigDomainGraphicsRdpClass = record
    parent_class: TGVirConfigDomainGraphicsClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_graphics_rdp_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_graphics_rdp_new: PGVirConfigDomainGraphicsRdp; cdecl; external libvirtgconfig;
function gvir_config_domain_graphics_rdp_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainGraphicsRdp; cdecl; external libvirtgconfig;
procedure gvir_config_domain_graphics_rdp_set_autoport(graphics: PGVirConfigDomainGraphicsRdp; autoport: Tgboolean); cdecl; external libvirtgconfig;
function gvir_config_domain_graphics_rdp_get_port(graphics: PGVirConfigDomainGraphicsRdp): longint; cdecl; external libvirtgconfig;
procedure gvir_config_domain_graphics_rdp_set_port(graphics: PGVirConfigDomainGraphicsRdp; port: longint); cdecl; external libvirtgconfig;
function gvir_config_domain_graphics_rdp_get_multi_user(graphics: PGVirConfigDomainGraphicsRdp): Tgboolean; cdecl; external libvirtgconfig;
procedure gvir_config_domain_graphics_rdp_set_multi_user(graphics: PGVirConfigDomainGraphicsRdp; multi_user: Tgboolean); cdecl; external libvirtgconfig;
function gvir_config_domain_graphics_rdp_get_replace_user(graphics: PGVirConfigDomainGraphicsRdp): Tgboolean; cdecl; external libvirtgconfig;
procedure gvir_config_domain_graphics_rdp_set_replace_user(graphics: PGVirConfigDomainGraphicsRdp; replace_user: Tgboolean); cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 20:08:43 ===

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_RDP: TGType;
function GVIR_CONFIG_DOMAIN_GRAPHICS_RDP(obj: Pointer): PGVirConfigDomainGraphicsRdp;
function GVIR_CONFIG_DOMAIN_GRAPHICS_RDP_CLASS(klass: Pointer): PGVirConfigDomainGraphicsRdpClass;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_RDP(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_RDP_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_GRAPHICS_RDP_GET_CLASS(obj: Pointer): PGVirConfigDomainGraphicsRdpClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_RDP: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_RDP := gvir_config_domain_graphics_rdp_get_type;
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_RDP(obj: Pointer): PGVirConfigDomainGraphicsRdp;
begin
  Result := PGVirConfigDomainGraphicsRdp(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_RDP));
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_RDP_CLASS(klass: Pointer): PGVirConfigDomainGraphicsRdpClass;
begin
  Result := PGVirConfigDomainGraphicsRdpClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_RDP));
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_RDP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_RDP);
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_RDP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_RDP);
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_RDP_GET_CLASS(obj: Pointer): PGVirConfigDomainGraphicsRdpClass;
begin
  Result := PGVirConfigDomainGraphicsRdpClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
