{$IFDEF read_interface}


type
  PGVirConfigStoragePoolPrivate = type Pointer;

  PGVirConfigStoragePool = ^TGVirConfigStoragePool;
  TGVirConfigStoragePool = record
    parent: TGVirConfigObject;
    priv: PGVirConfigStoragePoolPrivate;
  end;

  PGVirConfigStoragePoolClass = ^TGVirConfigStoragePoolClass;
  TGVirConfigStoragePoolClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirConfigStoragePoolType = ^TGVirConfigStoragePoolType;
  TGVirConfigStoragePoolType = longint;
const
  GVIR_CONFIG_STORAGE_POOL_TYPE_DIR = 0;
  GVIR_CONFIG_STORAGE_POOL_TYPE_FS = 1;
  GVIR_CONFIG_STORAGE_POOL_TYPE_NETFS = 2;
  GVIR_CONFIG_STORAGE_POOL_TYPE_LOGICAL = 3;
  GVIR_CONFIG_STORAGE_POOL_TYPE_DISK = 4;
  GVIR_CONFIG_STORAGE_POOL_TYPE_ISCSI = 5;
  GVIR_CONFIG_STORAGE_POOL_TYPE_SCSI = 6;
  GVIR_CONFIG_STORAGE_POOL_TYPE_MPATH = 7;

function gvir_config_storage_pool_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_storage_pool_new: PGVirConfigStoragePool; cdecl; external libvirtgconfig;
function gvir_config_storage_pool_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigStoragePool; cdecl; external libvirtgconfig;
function gvir_config_storage_pool_get_allocation(pool: PGVirConfigStoragePool): Tguint64; cdecl; external libvirtgconfig;
procedure gvir_config_storage_pool_set_allocation(pool: PGVirConfigStoragePool; allocation: Tguint64); cdecl; external libvirtgconfig;
function gvir_config_storage_pool_get_available(pool: PGVirConfigStoragePool): Tguint64; cdecl; external libvirtgconfig;
procedure gvir_config_storage_pool_set_available(pool: PGVirConfigStoragePool; available: Tguint64); cdecl; external libvirtgconfig;
function gvir_config_storage_pool_get_capacity(pool: PGVirConfigStoragePool): Tguint64; cdecl; external libvirtgconfig;
procedure gvir_config_storage_pool_set_capacity(pool: PGVirConfigStoragePool; capacity: Tguint64); cdecl; external libvirtgconfig;
function gvir_config_storage_pool_get_name(pool: PGVirConfigStoragePool): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_storage_pool_set_name(pool: PGVirConfigStoragePool; name: pchar); cdecl; external libvirtgconfig;
function gvir_config_storage_pool_get_pool_type(pool: PGVirConfigStoragePool): TGVirConfigStoragePoolType; cdecl; external libvirtgconfig;
procedure gvir_config_storage_pool_set_pool_type(pool: PGVirConfigStoragePool; _type: TGVirConfigStoragePoolType); cdecl; external libvirtgconfig;
function gvir_config_storage_pool_get_source(pool: PGVirConfigStoragePool): PGVirConfigStoragePoolSource; cdecl; external libvirtgconfig;
procedure gvir_config_storage_pool_set_source(pool: PGVirConfigStoragePool; source: PGVirConfigStoragePoolSource); cdecl; external libvirtgconfig;
function gvir_config_storage_pool_get_target(pool: PGVirConfigStoragePool): PGVirConfigStoragePoolTarget; cdecl; external libvirtgconfig;
procedure gvir_config_storage_pool_set_target(pool: PGVirConfigStoragePool; target: PGVirConfigStoragePoolTarget); cdecl; external libvirtgconfig;
function gvir_config_storage_pool_get_uuid(pool: PGVirConfigStoragePool): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_storage_pool_set_uuid(pool: PGVirConfigStoragePool; uuid: pchar); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:52:57 ===

function GVIR_CONFIG_TYPE_STORAGE_POOL: TGType;
function GVIR_CONFIG_STORAGE_POOL(obj: Pointer): PGVirConfigStoragePool;
function GVIR_CONFIG_STORAGE_POOL_CLASS(klass: Pointer): PGVirConfigStoragePoolClass;
function GVIR_CONFIG_IS_STORAGE_POOL(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_STORAGE_POOL_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_STORAGE_POOL_GET_CLASS(obj: Pointer): PGVirConfigStoragePoolClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_STORAGE_POOL: TGType;
begin
  GVIR_CONFIG_TYPE_STORAGE_POOL := gvir_config_storage_pool_get_type;
end;

function GVIR_CONFIG_STORAGE_POOL(obj: Pointer): PGVirConfigStoragePool;
begin
  Result := PGVirConfigStoragePool(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_STORAGE_POOL));
end;

function GVIR_CONFIG_STORAGE_POOL_CLASS(klass: Pointer): PGVirConfigStoragePoolClass;
begin
  Result := PGVirConfigStoragePoolClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_STORAGE_POOL));
end;

function GVIR_CONFIG_IS_STORAGE_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_STORAGE_POOL);
end;

function GVIR_CONFIG_IS_STORAGE_POOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_STORAGE_POOL);
end;

function GVIR_CONFIG_STORAGE_POOL_GET_CLASS(obj: Pointer): PGVirConfigStoragePoolClass;
begin
  Result := PGVirConfigStoragePoolClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
