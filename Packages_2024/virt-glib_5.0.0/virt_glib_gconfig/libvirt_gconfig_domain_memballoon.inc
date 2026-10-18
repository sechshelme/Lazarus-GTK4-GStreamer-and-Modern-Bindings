{$IFDEF read_interface}


type
  PGVirConfigDomainMemballoonPrivate = type Pointer;

  PGVirConfigDomainMemballoon = ^TGVirConfigDomainMemballoon;
  TGVirConfigDomainMemballoon = record
    parent: TGVirConfigDomainDevice;
    priv: PGVirConfigDomainMemballoonPrivate;
  end;

  PGVirConfigDomainMemballoonClass = ^TGVirConfigDomainMemballoonClass;
  TGVirConfigDomainMemballoonClass = record
    parent_class: TGVirConfigDomainDeviceClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirConfigDomainMemballoonModel = ^TGVirConfigDomainMemballoonModel;
  TGVirConfigDomainMemballoonModel = longint;
const
  GVIR_CONFIG_DOMAIN_MEMBALLOON_MODEL_NONE = 0;
  GVIR_CONFIG_DOMAIN_MEMBALLOON_MODEL_VIRTIO = 1;

function gvir_config_domain_memballoon_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_memballoon_new: PGVirConfigDomainMemballoon; cdecl; external libvirtgconfig;
function gvir_config_domain_memballoon_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainMemballoon; cdecl; external libvirtgconfig;
procedure gvir_config_domain_memballoon_set_model(memballoon: PGVirConfigDomainMemballoon; model: TGVirConfigDomainMemballoonModel); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:47:22 ===

function GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON: TGType;
function GVIR_CONFIG_DOMAIN_MEMBALLOON(obj: Pointer): PGVirConfigDomainMemballoon;
function GVIR_CONFIG_DOMAIN_MEMBALLOON_CLASS(klass: Pointer): PGVirConfigDomainMemballoonClass;
function GVIR_CONFIG_IS_DOMAIN_MEMBALLOON(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_MEMBALLOON_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_MEMBALLOON_GET_CLASS(obj: Pointer): PGVirConfigDomainMemballoonClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON := gvir_config_domain_memballoon_get_type;
end;

function GVIR_CONFIG_DOMAIN_MEMBALLOON(obj: Pointer): PGVirConfigDomainMemballoon;
begin
  Result := PGVirConfigDomainMemballoon(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON));
end;

function GVIR_CONFIG_DOMAIN_MEMBALLOON_CLASS(klass: Pointer): PGVirConfigDomainMemballoonClass;
begin
  Result := PGVirConfigDomainMemballoonClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON));
end;

function GVIR_CONFIG_IS_DOMAIN_MEMBALLOON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON);
end;

function GVIR_CONFIG_IS_DOMAIN_MEMBALLOON_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON);
end;

function GVIR_CONFIG_DOMAIN_MEMBALLOON_GET_CLASS(obj: Pointer): PGVirConfigDomainMemballoonClass;
begin
  Result := PGVirConfigDomainMemballoonClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
