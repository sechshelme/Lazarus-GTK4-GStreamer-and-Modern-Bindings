{$IFDEF read_interface}


type
  PGVirConfigDomainChardevSourcePtyPrivate = type Pointer;

  PGVirConfigDomainChardevSourcePty = ^TGVirConfigDomainChardevSourcePty;
  TGVirConfigDomainChardevSourcePty = record
    parent: TGVirConfigDomainChardevSource;
    priv: PGVirConfigDomainChardevSourcePtyPrivate;
  end;

  PGVirConfigDomainChardevSourcePtyClass = ^TGVirConfigDomainChardevSourcePtyClass;
  TGVirConfigDomainChardevSourcePtyClass = record
    parent_class: TGVirConfigDomainChardevSourceClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_domain_chardev_source_pty_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_chardev_source_pty_new: PGVirConfigDomainChardevSourcePty; cdecl; external libvirtgconfig;
function gvir_config_domain_chardev_source_pty_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainChardevSourcePty; cdecl; external libvirtgconfig;
procedure gvir_config_domain_chardev_source_pty_set_path(pty: PGVirConfigDomainChardevSourcePty; path: pchar); cdecl; external libvirtgconfig;
function gvir_config_domain_chardev_source_pty_get_path(pty: PGVirConfigDomainChardevSourcePty): Pgchar; cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 20:00:07 ===

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_PTY: TGType;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_PTY(obj: Pointer): PGVirConfigDomainChardevSourcePty;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_PTY_CLASS(klass: Pointer): PGVirConfigDomainChardevSourcePtyClass;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_PTY(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_PTY_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_PTY_GET_CLASS(obj: Pointer): PGVirConfigDomainChardevSourcePtyClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_PTY: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_PTY := gvir_config_domain_chardev_source_pty_get_type;
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_PTY(obj: Pointer): PGVirConfigDomainChardevSourcePty;
begin
  Result := PGVirConfigDomainChardevSourcePty(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_PTY));
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_PTY_CLASS(klass: Pointer): PGVirConfigDomainChardevSourcePtyClass;
begin
  Result := PGVirConfigDomainChardevSourcePtyClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_PTY));
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_PTY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_PTY);
end;

function GVIR_CONFIG_IS_DOMAIN_CHARDEV_SOURCE_PTY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_CHARDEV_SOURCE_PTY);
end;

function GVIR_CONFIG_DOMAIN_CHARDEV_SOURCE_PTY_GET_CLASS(obj: Pointer): PGVirConfigDomainChardevSourcePtyClass;
begin
  Result := PGVirConfigDomainChardevSourcePtyClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
