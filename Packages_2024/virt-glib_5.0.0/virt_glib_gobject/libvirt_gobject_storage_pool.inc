{$IFDEF read_interface}


type
  PGVirStoragePoolPrivate = type Pointer;

  PGVirStoragePool = ^TGVirStoragePool;
  TGVirStoragePool = record
    parent: TGObject;
    priv: PGVirStoragePoolPrivate;
  end;

  PGVirStoragePoolClass = ^TGVirStoragePoolClass;
  TGVirStoragePoolClass = record
    parent_class: TGObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirStoragePoolState = ^TGVirStoragePoolState;
  TGVirStoragePoolState = longint;
const
  GVIR_STORAGE_POOL_STATE_INACTIVE = 0;
  GVIR_STORAGE_POOL_STATE_BUILDING = 1;
  GVIR_STORAGE_POOL_STATE_RUNNING = 2;
  GVIR_STORAGE_POOL_STATE_DEGRADED = 3;
  GVIR_STORAGE_POOL_STATE_INACCESSIBLE = 4;

type
  PGVirStoragePoolInfo = ^TGVirStoragePoolInfo;
  TGVirStoragePoolInfo = record
    state: TGVirStoragePoolState;
    capacity: Tguint64;
    allocation: Tguint64;
    available: Tguint64;
  end;

function gvir_storage_pool_get_type: TGType; cdecl; external libvirtgobject;
function gvir_storage_pool_info_get_type: TGType; cdecl; external libvirtgobject;
function gvir_storage_pool_handle_get_type: TGType; cdecl; external libvirtgobject;
function gvir_storage_pool_get_name(pool: PGVirStoragePool): Pgchar; cdecl; external libvirtgobject;
function gvir_storage_pool_get_uuid(pool: PGVirStoragePool): Pgchar; cdecl; external libvirtgobject;
function gvir_storage_pool_get_active(pool: PGVirStoragePool): Tgboolean; cdecl; external libvirtgobject;
function gvir_storage_pool_get_persistent(pool: PGVirStoragePool): Tgboolean; cdecl; external libvirtgobject;
function gvir_storage_pool_get_config(pool: PGVirStoragePool; flags: Tguint; err: PPGError): PGVirConfigStoragePool; cdecl; external libvirtgobject;
function gvir_storage_pool_get_info(pool: PGVirStoragePool; err: PPGError): PGVirStoragePoolInfo; cdecl; external libvirtgobject;
function gvir_storage_pool_refresh(pool: PGVirStoragePool; cancellable: PGCancellable; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_storage_pool_refresh_async(pool: PGVirStoragePool; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_storage_pool_refresh_finish(pool: PGVirStoragePool; result: PGAsyncResult; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_storage_pool_get_volumes(pool: PGVirStoragePool): PGList; cdecl; external libvirtgobject;
function gvir_storage_pool_get_volume(pool: PGVirStoragePool; name: Pgchar): PGVirStorageVol; cdecl; external libvirtgobject;
function gvir_storage_pool_create_volume(pool: PGVirStoragePool; conf: PGVirConfigStorageVol; err: PPGError): PGVirStorageVol; cdecl; external libvirtgobject;
function gvir_storage_pool_build(pool: PGVirStoragePool; flags: Tguint; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_storage_pool_build_async(pool: PGVirStoragePool; flags: Tguint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_storage_pool_build_finish(pool: PGVirStoragePool; result: PGAsyncResult; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_storage_pool_undefine(pool: PGVirStoragePool; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_storage_pool_undefine_async(pool: PGVirStoragePool; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_storage_pool_undefine_finish(pool: PGVirStoragePool; result: PGAsyncResult; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_storage_pool_start(pool: PGVirStoragePool; flags: Tguint; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_storage_pool_start_async(pool: PGVirStoragePool; flags: Tguint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_storage_pool_start_finish(pool: PGVirStoragePool; result: PGAsyncResult; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_storage_pool_stop(pool: PGVirStoragePool; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_storage_pool_stop_async(pool: PGVirStoragePool; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_storage_pool_stop_finish(pool: PGVirStoragePool; result: PGAsyncResult; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_storage_pool_delete(pool: PGVirStoragePool; flags: Tguint; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_storage_pool_delete_async(pool: PGVirStoragePool; flags: Tguint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_storage_pool_delete_finish(pool: PGVirStoragePool; result: PGAsyncResult; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_storage_pool_get_autostart(pool: PGVirStoragePool; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_storage_pool_set_autostart(pool: PGVirStoragePool; autostart: Tgboolean; err: PPGError): Tgboolean; cdecl; external libvirtgobject;

// === Konventiert am: 18-10-26 19:31:44 ===

function GVIR_TYPE_STORAGE_POOL: TGType;
function GVIR_STORAGE_POOL(obj: Pointer): PGVirStoragePool;
function GVIR_STORAGE_POOL_CLASS(klass: Pointer): PGVirStoragePoolClass;
function GVIR_IS_STORAGE_POOL(obj: Pointer): Tgboolean;
function GVIR_IS_STORAGE_POOL_CLASS(klass: Pointer): Tgboolean;
function GVIR_STORAGE_POOL_GET_CLASS(obj: Pointer): PGVirStoragePoolClass;

function GVIR_TYPE_STORAGE_POOL_INFO: TGType;
function GVIR_TYPE_STORAGE_POOL_HANDLE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_TYPE_STORAGE_POOL: TGType;
begin
  GVIR_TYPE_STORAGE_POOL := gvir_storage_pool_get_type;
end;

function GVIR_STORAGE_POOL(obj: Pointer): PGVirStoragePool;
begin
  Result := PGVirStoragePool(g_type_check_instance_cast(obj, GVIR_TYPE_STORAGE_POOL));
end;

function GVIR_STORAGE_POOL_CLASS(klass: Pointer): PGVirStoragePoolClass;
begin
  Result := PGVirStoragePoolClass(g_type_check_class_cast(klass, GVIR_TYPE_STORAGE_POOL));
end;

function GVIR_IS_STORAGE_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_TYPE_STORAGE_POOL);
end;

function GVIR_IS_STORAGE_POOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_TYPE_STORAGE_POOL);
end;

function GVIR_STORAGE_POOL_GET_CLASS(obj: Pointer): PGVirStoragePoolClass;
begin
  Result := PGVirStoragePoolClass(PGTypeInstance(obj)^.g_class);
end;


function GVIR_TYPE_STORAGE_POOL_INFO: TGType;
begin
  GVIR_TYPE_STORAGE_POOL_INFO := gvir_storage_pool_info_get_type;
end;

function GVIR_TYPE_STORAGE_POOL_HANDLE: TGType;
begin
  GVIR_TYPE_STORAGE_POOL_HANDLE := gvir_storage_pool_handle_get_type;
end;


{$ENDIF read_implementation}
