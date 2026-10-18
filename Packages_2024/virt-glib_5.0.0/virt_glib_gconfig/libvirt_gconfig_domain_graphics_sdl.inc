{$IFDEF read_interface}


type
  PGVirConfigDomainGraphicsSdlPrivate = type Pointer;

  PGVirConfigDomainGraphicsSdl = ^TGVirConfigDomainGraphicsSdl;
  TGVirConfigDomainGraphicsSdl = record
    parent: TGVirConfigDomainGraphics;
    priv: PGVirConfigDomainGraphicsSdlPrivate;
  end;

  PGVirConfigDomainGraphicsSdlClass = ^TGVirConfigDomainGraphicsSdlClass;
  TGVirConfigDomainGraphicsSdlClass = record
    parent_class: TGVirConfigDomainGraphicsClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_graphics_sdl_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_graphics_sdl_new: PGVirConfigDomainGraphicsSdl; cdecl; external libvirtgconfig;
function gvir_config_domain_graphics_sdl_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainGraphicsSdl; cdecl; external libvirtgconfig;
procedure gvir_config_domain_graphics_sdl_set_xauthority(graphics: PGVirConfigDomainGraphicsSdl; path: Pgchar); cdecl; external libvirtgconfig;
procedure gvir_config_domain_graphics_sdl_set_display(graphics: PGVirConfigDomainGraphicsSdl; disp: Pgchar); cdecl; external libvirtgconfig;
procedure gvir_config_domain_graphics_sdl_set_fullscreen(graphics: PGVirConfigDomainGraphicsSdl; fullscreen: Tgboolean); cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 20:08:36 ===

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SDL: TGType;
function GVIR_CONFIG_DOMAIN_GRAPHICS_SDL(obj: Pointer): PGVirConfigDomainGraphicsSdl;
function GVIR_CONFIG_DOMAIN_GRAPHICS_SDL_CLASS(klass: Pointer): PGVirConfigDomainGraphicsSdlClass;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SDL(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SDL_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_GRAPHICS_SDL_GET_CLASS(obj: Pointer): PGVirConfigDomainGraphicsSdlClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SDL: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SDL := gvir_config_domain_graphics_sdl_get_type;
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_SDL(obj: Pointer): PGVirConfigDomainGraphicsSdl;
begin
  Result := PGVirConfigDomainGraphicsSdl(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SDL));
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_SDL_CLASS(klass: Pointer): PGVirConfigDomainGraphicsSdlClass;
begin
  Result := PGVirConfigDomainGraphicsSdlClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SDL));
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SDL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SDL);
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_SDL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SDL);
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_SDL_GET_CLASS(obj: Pointer): PGVirConfigDomainGraphicsSdlClass;
begin
  Result := PGVirConfigDomainGraphicsSdlClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
