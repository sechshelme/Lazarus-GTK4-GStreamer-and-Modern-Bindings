{$IFDEF read_interface}


type
  PGVirConfigDomainChardevSourceUnixPrivate = type Pointer;

  PGVirConfigDomainChardevSourceUnix = ^TGVirConfigDomainChardevSourceUnix;
  TGVirConfigDomainChardevSourceUnix = record
    parent: TGVirConfigDomainChardevSource;
    priv: PGVirConfigDomainChardevSourceUnixPrivate;
  end;

  PGVirConfigDomainChardevSourceUnixClass = ^TGVirConfigDomainChardevSourceUnixClass;
  TGVirConfigDomainChardevSourceUnixClass = record
    parent_class: TGVirConfigDomainChardevSourceClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_chardev_source_unix_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_chardev_source_unix_new: PGVirConfigDomainChardevSourceUnix; cdecl; external libvirtgconfig;
function gvir_config_domain_chardev_source_unix_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainChardevSourceUnix; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:59:55 ===

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX: TGType;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX(obj: Pointer): PGVirConfigDomainChardevSourceUnix;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX_CLASS(klass: Pointer): PGVirConfigDomainChardevSourceUnixClass;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_UNIX(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_UNIX_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX_GET_CLASS(obj: Pointer): PGVirConfigDomainChardevSourceUnixClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX := gvir_config_domain_chardev_source_unix_get_type;
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX(obj: Pointer): PGVirConfigDomainChardevSourceUnix;
begin
  Result := PGVirConfigDomainChardevSourceUnix(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX));
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX_CLASS(klass: Pointer): PGVirConfigDomainChardevSourceUnixClass;
begin
  Result := PGVirConfigDomainChardevSourceUnixClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX));
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_UNIX(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX);
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_UNIX_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_UNIX);
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_UNIX_GET_CLASS(obj: Pointer): PGVirConfigDomainChardevSourceUnixClass;
begin
  Result := PGVirConfigDomainChardevSourceUnixClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
