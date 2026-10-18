unit libvirt_gconfig_storage_vol_target;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object, libvirt_gconfig_storage_permissions;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigStorageVolTargetPrivate = type Pointer;

  PGVirConfigStorageVolTarget = ^TGVirConfigStorageVolTarget;
  TGVirConfigStorageVolTarget = record
    parent: TGVirConfigObject;
    priv: PGVirConfigStorageVolTargetPrivate;
  end;

  PGVirConfigStorageVolTargetClass = ^TGVirConfigStorageVolTargetClass;
  TGVirConfigStorageVolTargetClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_storage_vol_target_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_storage_vol_target_new: PGVirConfigStorageVolTarget; cdecl; external libvirtgconfig;
function gvir_config_storage_vol_target_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigStorageVolTarget; cdecl; external libvirtgconfig;
procedure gvir_config_storage_vol_target_set_compat(target: PGVirConfigStorageVolTarget; compat: pchar); cdecl; external libvirtgconfig;
procedure gvir_config_storage_vol_target_set_format(target: PGVirConfigStorageVolTarget; format: pchar); cdecl; external libvirtgconfig;
procedure gvir_config_storage_vol_target_set_permissions(target: PGVirConfigStorageVolTarget; perms: PGVirConfigStoragePermissions); cdecl; external libvirtgconfig;

type
  PGVirConfigStorageVolTargetFeatures = ^TGVirConfigStorageVolTargetFeatures;
  TGVirConfigStorageVolTargetFeatures = longint;
const
  GVIR_CONFIG_STORAGE_VOL_TARGET_FEATURE_LAZY_REFCOUNT = 1 shl 0;

procedure gvir_config_storage_vol_target_set_features(target: PGVirConfigStorageVolTarget; features: Tguint64); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:52:40 ===

function GVIR_CONFIG_TYPE_STORAGE_VOL_TARGET: TGType;
function GVIR_CONFIG_STORAGE_VOL_TARGET(obj: Pointer): PGVirConfigStorageVolTarget;
function GVIR_CONFIG_STORAGE_VOL_TARGET_CLASS(klass: Pointer): PGVirConfigStorageVolTargetClass;
function GVIR_CONFIG_IS_STORAGE_VOL_TARGET(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_STORAGE_VOL_TARGET_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_STORAGE_VOL_TARGET_GET_CLASS(obj: Pointer): PGVirConfigStorageVolTargetClass;

implementation

function GVIR_CONFIG_TYPE_STORAGE_VOL_TARGET: TGType;
begin
  GVIR_CONFIG_TYPE_STORAGE_VOL_TARGET := gvir_config_storage_vol_target_get_type;
end;

function GVIR_CONFIG_STORAGE_VOL_TARGET(obj: Pointer): PGVirConfigStorageVolTarget;
begin
  Result := PGVirConfigStorageVolTarget(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_STORAGE_VOL_TARGET));
end;

function GVIR_CONFIG_STORAGE_VOL_TARGET_CLASS(klass: Pointer): PGVirConfigStorageVolTargetClass;
begin
  Result := PGVirConfigStorageVolTargetClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_STORAGE_VOL_TARGET));
end;

function GVIR_CONFIG_IS_STORAGE_VOL_TARGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_STORAGE_VOL_TARGET);
end;

function GVIR_CONFIG_IS_STORAGE_VOL_TARGET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_STORAGE_VOL_TARGET);
end;

function GVIR_CONFIG_STORAGE_VOL_TARGET_GET_CLASS(obj: Pointer): PGVirConfigStorageVolTargetClass;
begin
  Result := PGVirConfigStorageVolTargetClass(PGTypeInstance(obj)^.g_class);
end;



end.
