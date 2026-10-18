{$IFDEF read_interface}


type
  PGVirConfigStorageVolPrivate = type Pointer;

  PGVirConfigStorageVol = ^TGVirConfigStorageVol;
  TGVirConfigStorageVol = record
    parent: TGVirConfigObject;
    priv: PGVirConfigStorageVolPrivate;
  end;

  PGVirConfigStorageVolClass = ^TGVirConfigStorageVolClass;
  TGVirConfigStorageVolClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_storage_vol_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_storage_vol_new: PGVirConfigStorageVol; cdecl; external libvirtgconfig;
function gvir_config_storage_vol_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigStorageVol; cdecl; external libvirtgconfig;
procedure gvir_config_storage_vol_set_allocation(vol: PGVirConfigStorageVol; allocation: Tguint64); cdecl; external libvirtgconfig;
procedure gvir_config_storage_vol_set_backing_store(vol: PGVirConfigStorageVol; backing_store: PGVirConfigStorageVolBackingStore); cdecl; external libvirtgconfig;
procedure gvir_config_storage_vol_set_capacity(vol: PGVirConfigStorageVol; capacity: Tguint64); cdecl; external libvirtgconfig;
procedure gvir_config_storage_vol_set_name(vol: PGVirConfigStorageVol; name: pchar); cdecl; external libvirtgconfig;
procedure gvir_config_storage_vol_set_target(vol: PGVirConfigStorageVol; target: PGVirConfigStorageVolTarget); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:52:48 ===

function GVIR_CONFIG_TYPE_STORAGE_VOL: TGType;
function GVIR_CONFIG_STORAGE_VOL(obj: Pointer): PGVirConfigStorageVol;
function GVIR_CONFIG_STORAGE_VOL_CLASS(klass: Pointer): PGVirConfigStorageVolClass;
function GVIR_CONFIG_IS_STORAGE_VOL(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_STORAGE_VOL_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_STORAGE_VOL_GET_CLASS(obj: Pointer): PGVirConfigStorageVolClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_STORAGE_VOL: TGType;
begin
  GVIR_CONFIG_TYPE_STORAGE_VOL := gvir_config_storage_vol_get_type;
end;

function GVIR_CONFIG_STORAGE_VOL(obj: Pointer): PGVirConfigStorageVol;
begin
  Result := PGVirConfigStorageVol(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_STORAGE_VOL));
end;

function GVIR_CONFIG_STORAGE_VOL_CLASS(klass: Pointer): PGVirConfigStorageVolClass;
begin
  Result := PGVirConfigStorageVolClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_STORAGE_VOL));
end;

function GVIR_CONFIG_IS_STORAGE_VOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_STORAGE_VOL);
end;

function GVIR_CONFIG_IS_STORAGE_VOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_STORAGE_VOL);
end;

function GVIR_CONFIG_STORAGE_VOL_GET_CLASS(obj: Pointer): PGVirConfigStorageVolClass;
begin
  Result := PGVirConfigStorageVolClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
