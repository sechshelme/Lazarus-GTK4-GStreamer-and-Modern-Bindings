{$IFDEF read_interface}


type
  PGVirConfigDomainGraphicsPrivate = type Pointer;

  PGVirConfigDomainGraphics = ^TGVirConfigDomainGraphics;
  TGVirConfigDomainGraphics = record
    parent: TGVirConfigDomainDevice;
    priv: PGVirConfigDomainGraphicsPrivate;
  end;

  PGVirConfigDomainGraphicsClass = ^TGVirConfigDomainGraphicsClass;
  TGVirConfigDomainGraphicsClass = record
    parent_class: TGVirConfigDomainDeviceClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_graphics_get_type: TGType; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 20:08:57 ===

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS: TGType;
function GVIR_CONFIG_DOMAIN_GRAPHICS(obj: Pointer): PGVirConfigDomainGraphics;
function GVIR_CONFIG_DOMAIN_GRAPHICS_CLASS(klass: Pointer): PGVirConfigDomainGraphicsClass;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_GRAPHICS_GET_CLASS(obj: Pointer): PGVirConfigDomainGraphicsClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS := gvir_config_domain_graphics_get_type;
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS(obj: Pointer): PGVirConfigDomainGraphics;
begin
  Result := PGVirConfigDomainGraphics(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS));
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_CLASS(klass: Pointer): PGVirConfigDomainGraphicsClass;
begin
  Result := PGVirConfigDomainGraphicsClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS));
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS);
end;

function GVIR_CONFIG_IS_DOMAIN_GRAPHICS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS);
end;

function GVIR_CONFIG_DOMAIN_GRAPHICS_GET_CLASS(obj: Pointer): PGVirConfigDomainGraphicsClass;
begin
  Result := PGVirConfigDomainGraphicsClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
