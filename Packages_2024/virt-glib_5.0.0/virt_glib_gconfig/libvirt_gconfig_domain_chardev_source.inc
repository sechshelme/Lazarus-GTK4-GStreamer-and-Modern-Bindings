{$IFDEF read_interface}


type
  PGVirConfigDomainChardevSourcePrivate = type Pointer;

  PGVirConfigDomainChardevSource = ^TGVirConfigDomainChardevSource;
  TGVirConfigDomainChardevSource = record
    parent: TGVirConfigObject;
    priv: PGVirConfigDomainChardevSourcePrivate;
  end;

  PGVirConfigDomainChardevSourceClass = ^TGVirConfigDomainChardevSourceClass;
  TGVirConfigDomainChardevSourceClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_chardev_source_get_type: TGType; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:55:57 ===

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE: TGType;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE(obj: Pointer): PGVirConfigDomainChardevSource;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_CLASS(klass: Pointer): PGVirConfigDomainChardevSourceClass;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_GET_CLASS(obj: Pointer): PGVirConfigDomainChardevSourceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE := gvir_config_domain_chardev_source_get_type;
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE(obj: Pointer): PGVirConfigDomainChardevSource;
begin
  Result := PGVirConfigDomainChardevSource(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE));
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_CLASS(klass: Pointer): PGVirConfigDomainChardevSourceClass;
begin
  Result := PGVirConfigDomainChardevSourceClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE));
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE);
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE);
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_GET_CLASS(obj: Pointer): PGVirConfigDomainChardevSourceClass;
begin
  Result := PGVirConfigDomainChardevSourceClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
