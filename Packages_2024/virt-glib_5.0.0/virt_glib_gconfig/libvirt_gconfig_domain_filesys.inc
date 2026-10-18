{$IFDEF read_interface}


type
  PGVirConfigDomainFilesysPrivate = type Pointer;

  PGVirConfigDomainFilesys = ^TGVirConfigDomainFilesys;
  TGVirConfigDomainFilesys = record
    parent: TGVirConfigDomainDevice;
    priv: PGVirConfigDomainFilesysPrivate;
  end;

  PGVirConfigDomainFilesysClass = ^TGVirConfigDomainFilesysClass;
  TGVirConfigDomainFilesysClass = record
    parent_class: TGVirConfigDomainDeviceClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirConfigDomainFilesysType = ^TGVirConfigDomainFilesysType;
  TGVirConfigDomainFilesysType = longint;
const
  GVIR_CONFIG_DOMAIN_FILESYS_MOUNT = 0;
  GVIR_CONFIG_DOMAIN_FILESYS_BLOCK = 1;
  GVIR_CONFIG_DOMAIN_FILESYS_FILE = 2;
  GVIR_CONFIG_DOMAIN_FILESYS_TEMPLATE = 3;
  GVIR_CONFIG_DOMAIN_FILESYS_RAM = 4;
  GVIR_CONFIG_DOMAIN_FILESYS_BIND = 5;

type
  PGVirConfigDomainFilesysAccessType = ^TGVirConfigDomainFilesysAccessType;
  TGVirConfigDomainFilesysAccessType = longint;
const
  GVIR_CONFIG_DOMAIN_FILESYS_ACCESS_PASSTHROUGH = 0;
  GVIR_CONFIG_DOMAIN_FILESYS_ACCESS_MAPPED = 1;
  GVIR_CONFIG_DOMAIN_FILESYS_ACCESS_SQUASH = 2;

type
  PGVirConfigDomainFilesysDriverType = ^TGVirConfigDomainFilesysDriverType;
  TGVirConfigDomainFilesysDriverType = longint;
const
  GVIR_CONFIG_DOMAIN_FILESYS_DRIVER_DEFAULT = 0;
  GVIR_CONFIG_DOMAIN_FILESYS_DRIVER_PATH = 1;
  GVIR_CONFIG_DOMAIN_FILESYS_DRIVER_HANDLE = 2;
  GVIR_CONFIG_DOMAIN_FILESYS_DRIVER_LOOP = 3;
  GVIR_CONFIG_DOMAIN_FILESYS_DRIVER_NBD = 4;
  GVIR_CONFIG_DOMAIN_FILESYS_DRIVER_PLOOP = 5;

function gvir_config_domain_filesys_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_filesys_new: PGVirConfigDomainFilesys; cdecl; external libvirtgconfig;
function gvir_config_domain_filesys_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainFilesys; cdecl; external libvirtgconfig;
procedure gvir_config_domain_filesys_set_type(filesys: PGVirConfigDomainFilesys; _type: TGVirConfigDomainFilesysType); cdecl; external libvirtgconfig;
procedure gvir_config_domain_filesys_set_access_type(filesys: PGVirConfigDomainFilesys; _type: TGVirConfigDomainFilesysAccessType); cdecl; external libvirtgconfig;
procedure gvir_config_domain_filesys_set_driver_type(filesys: PGVirConfigDomainFilesys; _type: TGVirConfigDomainFilesysDriverType); cdecl; external libvirtgconfig;
procedure gvir_config_domain_filesys_set_driver_format(filesys: PGVirConfigDomainFilesys; format: TGVirConfigDomainDiskFormat); cdecl; external libvirtgconfig;
procedure gvir_config_domain_filesys_set_source(filesys: PGVirConfigDomainFilesys; source: pchar); cdecl; external libvirtgconfig;
procedure gvir_config_domain_filesys_set_ram_usage(filesys: PGVirConfigDomainFilesys; bytes: Tguint64); cdecl; external libvirtgconfig;
procedure gvir_config_domain_filesys_set_target(filesys: PGVirConfigDomainFilesys; target: pchar); cdecl; external libvirtgconfig;
procedure gvir_config_domain_filesys_set_readonly(filesys: PGVirConfigDomainFilesys; readonly: Tgboolean); cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 20:09:00 ===

function GVIR_CONFIG_TYPE_DOMAIN_FILESYS: TGType;
function GVIR_CONFIG_DOMAIN_FILESYS(obj: Pointer): PGVirConfigDomainFilesys;
function GVIR_CONFIG_DOMAIN_FILESYS_CLASS(klass: Pointer): PGVirConfigDomainFilesysClass;
function GVIR_CONFIG_IS_DOMAIN_FILESYS(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_FILESYS_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_FILESYS_GET_CLASS(obj: Pointer): PGVirConfigDomainFilesysClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_CONFIG_TYPE_DOMAIN_FILESYS: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_FILESYS := gvir_config_domain_filesys_get_type;
end;

function GVIR_CONFIG_DOMAIN_FILESYS(obj: Pointer): PGVirConfigDomainFilesys;
begin
  Result := PGVirConfigDomainFilesys(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_FILESYS));
end;

function GVIR_CONFIG_DOMAIN_FILESYS_CLASS(klass: Pointer): PGVirConfigDomainFilesysClass;
begin
  Result := PGVirConfigDomainFilesysClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_FILESYS));
end;

function GVIR_CONFIG_IS_DOMAIN_FILESYS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_FILESYS);
end;

function GVIR_CONFIG_IS_DOMAIN_FILESYS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_FILESYS);
end;

function GVIR_CONFIG_DOMAIN_FILESYS_GET_CLASS(obj: Pointer): PGVirConfigDomainFilesysClass;
begin
  Result := PGVirConfigDomainFilesysClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
