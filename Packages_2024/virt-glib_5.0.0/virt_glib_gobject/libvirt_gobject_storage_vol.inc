{$IFDEF read_interface}


type
  PGVirStorageVolPrivate = type Pointer;

  PGVirStorageVol = ^TGVirStorageVol;
  TGVirStorageVol = record
    parent: TGObject;
    priv: PGVirStorageVolPrivate;
  end;

  PGVirStorageVolClass = ^TGVirStorageVolClass;
  TGVirStorageVolClass = record
    parent_class: TGObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirStorageVolType = ^TGVirStorageVolType;
  TGVirStorageVolType = longint;
const
  GVIR_STORAGE_VOL_STATE_FILE = 0;
  GVIR_STORAGE_VOL_STATE_BLOCK = 1;
  GVIR_STORAGE_VOL_STATE_DIR = 2;

type
  PGVirStorageVolResizeFlags = ^TGVirStorageVolResizeFlags;
  TGVirStorageVolResizeFlags = longint;
const
  GVIR_STORAGE_VOL_RESIZE_NONE = 0;
  GVIR_STORAGE_VOL_RESIZE_ALLOCATE = VIR_STORAGE_VOL_RESIZE_ALLOCATE;
  GVIR_STORAGE_VOL_RESIZE_DELTA = VIR_STORAGE_VOL_RESIZE_DELTA;
  GVIR_STORAGE_VOL_RESIZE_SHRINK = VIR_STORAGE_VOL_RESIZE_SHRINK;

type
  PGVirStorageVolInfo = ^TGVirStorageVolInfo;
  TGVirStorageVolInfo = record
    _type: TGVirStorageVolType;
    capacity: Tguint64;
    allocation: Tguint64;
  end;

function gvir_storage_vol_get_type: TGType; cdecl; external libvirtgobject;
function gvir_storage_vol_info_get_type: TGType; cdecl; external libvirtgobject;
function gvir_storage_vol_handle_get_type: TGType; cdecl; external libvirtgobject;
function gvir_storage_vol_get_name(vol: PGVirStorageVol): Pgchar; cdecl; external libvirtgobject;
function gvir_storage_vol_get_path(vol: PGVirStorageVol; error: PPGError): Pgchar; cdecl; external libvirtgobject;
function gvir_storage_vol_delete(vol: PGVirStorageVol; flags: Tguint; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_storage_vol_get_config(vol: PGVirStorageVol; flags: Tguint; err: PPGError): PGVirConfigStorageVol; cdecl; external libvirtgobject;
function gvir_storage_vol_get_info(vol: PGVirStorageVol; err: PPGError): PGVirStorageVolInfo; cdecl; external libvirtgobject;
function gvir_storage_vol_resize(vol: PGVirStorageVol; capacity: Tguint64; flags: Tguint; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_storage_vol_download(vol: PGVirStorageVol; stream: PGVirStream; offset: Tguint64; length: Tguint64; flags: Tguint;
  err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_storage_vol_upload(vol: PGVirStorageVol; stream: PGVirStream; offset: Tguint64; length: Tguint64; flags: Tguint;
  err: PPGError): Tgboolean; cdecl; external libvirtgobject;

// === Konventiert am: 18-10-26 19:31:34 ===

function GVIR_TYPE_STORAGE_VOL: TGType;
function GVIR_STORAGE_VOL(obj: Pointer): PGVirStorageVol;
function GVIR_STORAGE_VOL_CLASS(klass: Pointer): PGVirStorageVolClass;
function GVIR_IS_STORAGE_VOL(obj: Pointer): Tgboolean;
function GVIR_IS_STORAGE_VOL_CLASS(klass: Pointer): Tgboolean;
function GVIR_STORAGE_VOL_GET_CLASS(obj: Pointer): PGVirStorageVolClass;

function GVIR_TYPE_STORAGE_VOL_INFO: TGType;
function GVIR_TYPE_STORAGE_VOL_HANDLE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_TYPE_STORAGE_VOL: TGType;
begin
  GVIR_TYPE_STORAGE_VOL := gvir_storage_vol_get_type;
end;

function GVIR_STORAGE_VOL(obj: Pointer): PGVirStorageVol;
begin
  Result := PGVirStorageVol(g_type_check_instance_cast(obj, GVIR_TYPE_STORAGE_VOL));
end;

function GVIR_STORAGE_VOL_CLASS(klass: Pointer): PGVirStorageVolClass;
begin
  Result := PGVirStorageVolClass(g_type_check_class_cast(klass, GVIR_TYPE_STORAGE_VOL));
end;

function GVIR_IS_STORAGE_VOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_TYPE_STORAGE_VOL);
end;

function GVIR_IS_STORAGE_VOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_TYPE_STORAGE_VOL);
end;

function GVIR_STORAGE_VOL_GET_CLASS(obj: Pointer): PGVirStorageVolClass;
begin
  Result := PGVirStorageVolClass(PGTypeInstance(obj)^.g_class);
end;


function GVIR_TYPE_STORAGE_VOL_INFO: TGType;
begin
  GVIR_TYPE_STORAGE_VOL_INFO := gvir_storage_vol_info_get_type;
end;

function GVIR_TYPE_STORAGE_VOL_HANDLE: TGType;
begin
  GVIR_TYPE_STORAGE_VOL_HANDLE := gvir_storage_vol_handle_get_type;
end;


{$ENDIF read_implementation}
