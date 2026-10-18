{$IFDEF read_interface}


type
  PGVirConfigStoragePermissionsPrivate = type Pointer;

  PGVirConfigStoragePermissions = ^TGVirConfigStoragePermissions;
  TGVirConfigStoragePermissions = record
    parent: TGVirConfigObject;
    priv: PGVirConfigStoragePermissionsPrivate;
  end;

  PGVirConfigStoragePermissionsClass = ^TGVirConfigStoragePermissionsClass;
  TGVirConfigStoragePermissionsClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_storage_permissions_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_storage_permissions_new: PGVirConfigStoragePermissions; cdecl; external libvirtgconfig;
function gvir_config_storage_permissions_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigStoragePermissions; cdecl; external libvirtgconfig;
function gvir_config_storage_permissions_get_group(perms: PGVirConfigStoragePermissions): Tguint; cdecl; external libvirtgconfig;
procedure gvir_config_storage_permissions_set_group(perms: PGVirConfigStoragePermissions; group: Tguint); cdecl; external libvirtgconfig;
function gvir_config_storage_permissions_get_label(perms: PGVirConfigStoragePermissions): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_storage_permissions_set_label(perms: PGVirConfigStoragePermissions; _label: pchar); cdecl; external libvirtgconfig;
function gvir_config_storage_permissions_get_mode(perms: PGVirConfigStoragePermissions): Tguint; cdecl; external libvirtgconfig;
procedure gvir_config_storage_permissions_set_mode(perms: PGVirConfigStoragePermissions; mode: Tguint); cdecl; external libvirtgconfig;
function gvir_config_storage_permissions_get_owner(perms: PGVirConfigStoragePermissions): Tguint; cdecl; external libvirtgconfig;
procedure gvir_config_storage_permissions_set_owner(perms: PGVirConfigStoragePermissions; owner: Tguint); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:52:59 ===

function GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS: TGType;
function GVIR_CONFIG_STORAGE_PERMISSIONS(obj: Pointer): PGVirConfigStoragePermissions;
function GVIR_CONFIG_STORAGE_PERMISSIONS_CLASS(klass: Pointer): PGVirConfigStoragePermissionsClass;
function GVIR_CONFIG_IS_STORAGE_PERMISSIONS(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_STORAGE_PERMISSIONS_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_STORAGE_PERMISSIONS_GET_CLASS(obj: Pointer): PGVirConfigStoragePermissionsClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS: TGType;
begin
  GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS := gvir_config_storage_permissions_get_type;
end;

function GVIR_CONFIG_STORAGE_PERMISSIONS(obj: Pointer): PGVirConfigStoragePermissions;
begin
  Result := PGVirConfigStoragePermissions(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS));
end;

function GVIR_CONFIG_STORAGE_PERMISSIONS_CLASS(klass: Pointer): PGVirConfigStoragePermissionsClass;
begin
  Result := PGVirConfigStoragePermissionsClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS));
end;

function GVIR_CONFIG_IS_STORAGE_PERMISSIONS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS);
end;

function GVIR_CONFIG_IS_STORAGE_PERMISSIONS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_STORAGE_PERMISSIONS);
end;

function GVIR_CONFIG_STORAGE_PERMISSIONS_GET_CLASS(obj: Pointer): PGVirConfigStoragePermissionsClass;
begin
  Result := PGVirConfigStoragePermissionsClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
