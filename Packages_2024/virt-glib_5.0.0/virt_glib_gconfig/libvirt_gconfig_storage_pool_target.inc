{$IFDEF read_interface}


type
  PGVirConfigStoragePoolTargetPrivate = type Pointer;

  PGVirConfigStoragePoolTarget = ^TGVirConfigStoragePoolTarget;
  TGVirConfigStoragePoolTarget = record
    parent: TGVirConfigObject;
    priv: PGVirConfigStoragePoolTargetPrivate;
  end;

  PGVirConfigStoragePoolTargetClass = ^TGVirConfigStoragePoolTargetClass;
  TGVirConfigStoragePoolTargetClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_storage_pool_target_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_storage_pool_target_new: PGVirConfigStoragePoolTarget; cdecl; external libvirtgconfig;
function gvir_config_storage_pool_target_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigStoragePoolTarget; cdecl; external libvirtgconfig;
function gvir_config_storage_pool_target_get_path(target: PGVirConfigStoragePoolTarget): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_storage_pool_target_set_path(target: PGVirConfigStoragePoolTarget; path: pchar); cdecl; external libvirtgconfig;
function gvir_config_storage_pool_target_get_permissions(target: PGVirConfigStoragePoolTarget): PGVirConfigStoragePermissions; cdecl; external libvirtgconfig;
procedure gvir_config_storage_pool_target_set_permissions(target: PGVirConfigStoragePoolTarget; perms: PGVirConfigStoragePermissions); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:52:51 ===

function GVIR_CONFIG_TYPE_STORAGE_POOL_TARGET: TGType;
function GVIR_CONFIG_STORAGE_POOL_TARGET(obj: Pointer): PGVirConfigStoragePoolTarget;
function GVIR_CONFIG_STORAGE_POOL_TARGET_CLASS(klass: Pointer): PGVirConfigStoragePoolTargetClass;
function GVIR_CONFIG_IS_STORAGE_POOL_TARGET(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_STORAGE_POOL_TARGET_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_STORAGE_POOL_TARGET_GET_CLASS(obj: Pointer): PGVirConfigStoragePoolTargetClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_STORAGE_POOL_TARGET: TGType;
begin
  GVIR_CONFIG_TYPE_STORAGE_POOL_TARGET := gvir_config_storage_pool_target_get_type;
end;

function GVIR_CONFIG_STORAGE_POOL_TARGET(obj: Pointer): PGVirConfigStoragePoolTarget;
begin
  Result := PGVirConfigStoragePoolTarget(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_STORAGE_POOL_TARGET));
end;

function GVIR_CONFIG_STORAGE_POOL_TARGET_CLASS(klass: Pointer): PGVirConfigStoragePoolTargetClass;
begin
  Result := PGVirConfigStoragePoolTargetClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_STORAGE_POOL_TARGET));
end;

function GVIR_CONFIG_IS_STORAGE_POOL_TARGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_STORAGE_POOL_TARGET);
end;

function GVIR_CONFIG_IS_STORAGE_POOL_TARGET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_STORAGE_POOL_TARGET);
end;

function GVIR_CONFIG_STORAGE_POOL_TARGET_GET_CLASS(obj: Pointer): PGVirConfigStoragePoolTargetClass;
begin
  Result := PGVirConfigStoragePoolTargetClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
