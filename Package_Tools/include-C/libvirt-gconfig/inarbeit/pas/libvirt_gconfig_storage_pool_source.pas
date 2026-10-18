unit libvirt_gconfig_storage_pool_source;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigStoragePoolSourcePrivate = type Pointer;

  PGVirConfigStoragePoolSource = ^TGVirConfigStoragePoolSource;
  TGVirConfigStoragePoolSource = record
    parent: TGVirConfigObject;
    priv: PGVirConfigStoragePoolSourcePrivate;
  end;

  PGVirConfigStoragePoolSourceClass = ^TGVirConfigStoragePoolSourceClass;
  TGVirConfigStoragePoolSourceClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_storage_pool_source_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_storage_pool_source_new: PGVirConfigStoragePoolSource; cdecl; external libvirtgconfig;
function gvir_config_storage_pool_source_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigStoragePoolSource; cdecl; external libvirtgconfig;
function gvir_config_storage_pool_source_get_adapter(source: PGVirConfigStoragePoolSource): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_storage_pool_source_set_adapter(source: PGVirConfigStoragePoolSource; adapter: pchar); cdecl; external libvirtgconfig;
function gvir_config_storage_pool_source_get_device_path(source: PGVirConfigStoragePoolSource): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_storage_pool_source_set_device_path(source: PGVirConfigStoragePoolSource; device_path: pchar); cdecl; external libvirtgconfig;
function gvir_config_storage_pool_source_get_directory(source: PGVirConfigStoragePoolSource): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_storage_pool_source_set_directory(source: PGVirConfigStoragePoolSource; directory: pchar); cdecl; external libvirtgconfig;
function gvir_config_storage_pool_source_get_format(source: PGVirConfigStoragePoolSource): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_storage_pool_source_set_format(source: PGVirConfigStoragePoolSource; format: pchar); cdecl; external libvirtgconfig;
function gvir_config_storage_pool_source_get_host(source: PGVirConfigStoragePoolSource): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_storage_pool_source_set_host(source: PGVirConfigStoragePoolSource; host: pchar); cdecl; external libvirtgconfig;
function gvir_config_storage_pool_source_get_name(source: PGVirConfigStoragePoolSource): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_storage_pool_source_set_name(source: PGVirConfigStoragePoolSource; name: pchar); cdecl; external libvirtgconfig;
function gvir_config_storage_pool_source_get_product(source: PGVirConfigStoragePoolSource): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_storage_pool_source_set_product(source: PGVirConfigStoragePoolSource; product: pchar); cdecl; external libvirtgconfig;
function gvir_config_storage_pool_source_get_vendor(source: PGVirConfigStoragePoolSource): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_storage_pool_source_set_vendor(source: PGVirConfigStoragePoolSource; vendor: pchar); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:52:54 ===

function GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE: TGType;
function GVIR_CONFIG_STORAGE_POOL_SOURCE(obj: Pointer): PGVirConfigStoragePoolSource;
function GVIR_CONFIG_STORAGE_POOL_SOURCE_CLASS(klass: Pointer): PGVirConfigStoragePoolSourceClass;
function GVIR_CONFIG_IS_STORAGE_POOL_SOURCE(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_STORAGE_POOL_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_STORAGE_POOL_SOURCE_GET_CLASS(obj: Pointer): PGVirConfigStoragePoolSourceClass;

implementation

function GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE: TGType;
begin
  GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE := gvir_config_storage_pool_source_get_type;
end;

function GVIR_CONFIG_STORAGE_POOL_SOURCE(obj: Pointer): PGVirConfigStoragePoolSource;
begin
  Result := PGVirConfigStoragePoolSource(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE));
end;

function GVIR_CONFIG_STORAGE_POOL_SOURCE_CLASS(klass: Pointer): PGVirConfigStoragePoolSourceClass;
begin
  Result := PGVirConfigStoragePoolSourceClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE));
end;

function GVIR_CONFIG_IS_STORAGE_POOL_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE);
end;

function GVIR_CONFIG_IS_STORAGE_POOL_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_STORAGE_POOL_SOURCE);
end;

function GVIR_CONFIG_STORAGE_POOL_SOURCE_GET_CLASS(obj: Pointer): PGVirConfigStoragePoolSourceClass;
begin
  Result := PGVirConfigStoragePoolSourceClass(PGTypeInstance(obj)^.g_class);
end;



end.
