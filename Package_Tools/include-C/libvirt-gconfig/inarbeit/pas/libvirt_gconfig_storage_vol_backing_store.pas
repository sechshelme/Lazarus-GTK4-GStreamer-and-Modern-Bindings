unit libvirt_gconfig_storage_vol_backing_store;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigStorageVolBackingStorePrivate = type Pointer;

  PGVirConfigStorageVolBackingStore = ^TGVirConfigStorageVolBackingStore;
  TGVirConfigStorageVolBackingStore = record
    parent: TGVirConfigObject;
    priv: PGVirConfigStorageVolBackingStorePrivate;
  end;

  PGVirConfigStorageVolBackingStoreClass = ^TGVirConfigStorageVolBackingStoreClass;
  TGVirConfigStorageVolBackingStoreClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_storage_vol_backing_store_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_storage_vol_backing_store_new: PGVirConfigStorageVolBackingStore; cdecl; external libvirtgconfig;
function gvir_config_storage_vol_backing_store_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigStorageVolBackingStore; cdecl; external libvirtgconfig;
procedure gvir_config_storage_vol_backing_store_set_format(backing_store: PGVirConfigStorageVolBackingStore; format: pchar); cdecl; external libvirtgconfig;
procedure gvir_config_storage_vol_backing_store_set_path(backing_store: PGVirConfigStorageVolBackingStore; path: pchar); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:52:45 ===

function GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE: TGType;
function GVIR_CONFIG_STORAGE_VOL_BACKING_STORE(obj: Pointer): PGVirConfigStorageVolBackingStore;
function GVIR_CONFIG_STORAGE_VOL_BACKING_STORE_CLASS(klass: Pointer): PGVirConfigStorageVolBackingStoreClass;
function GVIR_CONFIG_IS_STORAGE_VOL_BACKING_STORE(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_STORAGE_VOL_BACKING_STORE_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_STORAGE_VOL_BACKING_STORE_GET_CLASS(obj: Pointer): PGVirConfigStorageVolBackingStoreClass;

implementation

function GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE: TGType;
begin
  GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE := gvir_config_storage_vol_backing_store_get_type;
end;

function GVIR_CONFIG_STORAGE_VOL_BACKING_STORE(obj: Pointer): PGVirConfigStorageVolBackingStore;
begin
  Result := PGVirConfigStorageVolBackingStore(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE));
end;

function GVIR_CONFIG_STORAGE_VOL_BACKING_STORE_CLASS(klass: Pointer): PGVirConfigStorageVolBackingStoreClass;
begin
  Result := PGVirConfigStorageVolBackingStoreClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE));
end;

function GVIR_CONFIG_IS_STORAGE_VOL_BACKING_STORE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE);
end;

function GVIR_CONFIG_IS_STORAGE_VOL_BACKING_STORE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_STORAGE_VOL_BACKING_STORE);
end;

function GVIR_CONFIG_STORAGE_VOL_BACKING_STORE_GET_CLASS(obj: Pointer): PGVirConfigStorageVolBackingStoreClass;
begin
  Result := PGVirConfigStorageVolBackingStoreClass(PGTypeInstance(obj)^.g_class);
end;



end.
