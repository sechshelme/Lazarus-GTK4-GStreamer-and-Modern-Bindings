unit libvirt_gconfig_domain_os;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainOsPrivate = type Pointer;

  PGVirConfigDomainOs = ^TGVirConfigDomainOs;
  TGVirConfigDomainOs = record
    parent: TGVirConfigObject;
    priv: PGVirConfigDomainOsPrivate;
  end;

  PGVirConfigDomainOsClass = ^TGVirConfigDomainOsClass;
  TGVirConfigDomainOsClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirConfigDomainOsType = ^TGVirConfigDomainOsType;
  TGVirConfigDomainOsType = longint;
const
  GVIR_CONFIG_DOMAIN_OS_TYPE_HVM = 0;
  GVIR_CONFIG_DOMAIN_OS_TYPE_LINUX = 1;
  GVIR_CONFIG_DOMAIN_OS_TYPE_EXE = 2;
  GVIR_CONFIG_DOMAIN_OS_TYPE_XEN = 3;
  GVIR_CONFIG_DOMAIN_OS_TYPE_UML = 4;

type
  PGVirConfigDomainOsSmBiosMode = ^TGVirConfigDomainOsSmBiosMode;
  TGVirConfigDomainOsSmBiosMode = longint;
const
  GVIR_CONFIG_DOMAIN_OS_SMBIOS_MODE_EMULATE = 0;
  GVIR_CONFIG_DOMAIN_OS_SMBIOS_MODE_HOST = 1;
  GVIR_CONFIG_DOMAIN_OS_SMBIOS_MODE_SYSINFO = 2;

type
  PGVirConfigDomainOsBootDevice = ^TGVirConfigDomainOsBootDevice;
  TGVirConfigDomainOsBootDevice = longint;
const
  GVIR_CONFIG_DOMAIN_OS_BOOT_DEVICE_FD = 0;
  GVIR_CONFIG_DOMAIN_OS_BOOT_DEVICE_HD = 1;
  GVIR_CONFIG_DOMAIN_OS_BOOT_DEVICE_CDROM = 2;
  GVIR_CONFIG_DOMAIN_OS_BOOT_DEVICE_NETWORK = 3;

type
  PGVirConfigDomainOsFirmware = ^TGVirConfigDomainOsFirmware;
  TGVirConfigDomainOsFirmware = longint;
const
  GVIR_CONFIG_DOMAIN_OS_FIRMWARE_BIOS = 0;
  GVIR_CONFIG_DOMAIN_OS_FIRMWARE_EFI = 1;

function gvir_config_domain_os_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_os_new: PGVirConfigDomainOs; cdecl; external libvirtgconfig;
function gvir_config_domain_os_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainOs; cdecl; external libvirtgconfig;
procedure gvir_config_domain_os_set_os_type(os: PGVirConfigDomainOs; _type: TGVirConfigDomainOsType); cdecl; external libvirtgconfig;
function gvir_config_domain_os_get_os_type(os: PGVirConfigDomainOs): TGVirConfigDomainOsType; cdecl; external libvirtgconfig;
function gvir_config_domain_os_get_arch(os: PGVirConfigDomainOs): pchar; cdecl; external libvirtgconfig;
function gvir_config_domain_os_get_machine(os: PGVirConfigDomainOs): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_domain_os_set_arch(os: PGVirConfigDomainOs; arch: pchar); cdecl; external libvirtgconfig;
function gvir_config_domain_os_get_boot_devices(os: PGVirConfigDomainOs): PGList; cdecl; external libvirtgconfig;
procedure gvir_config_domain_os_set_boot_devices(os: PGVirConfigDomainOs; boot_devices: PGList); cdecl; external libvirtgconfig;
procedure gvir_config_domain_os_set_kernel(os: PGVirConfigDomainOs; kernel: pchar); cdecl; external libvirtgconfig;
procedure gvir_config_domain_os_set_ramdisk(os: PGVirConfigDomainOs; ramdisk: pchar); cdecl; external libvirtgconfig;
procedure gvir_config_domain_os_set_cmdline(os: PGVirConfigDomainOs; cmdline: pchar); cdecl; external libvirtgconfig;
procedure gvir_config_domain_os_set_init(os: PGVirConfigDomainOs; init: pchar); cdecl; external libvirtgconfig;
procedure gvir_config_domain_os_set_loader(os: PGVirConfigDomainOs; loader: pchar); cdecl; external libvirtgconfig;
procedure gvir_config_domain_os_set_machine(os: PGVirConfigDomainOs; machine: pchar); cdecl; external libvirtgconfig;
procedure gvir_config_domain_os_set_smbios_mode(os: PGVirConfigDomainOs; mode: TGVirConfigDomainOsSmBiosMode); cdecl; external libvirtgconfig;
procedure gvir_config_domain_os_enable_boot_menu(os: PGVirConfigDomainOs; enable: Tgboolean); cdecl; external libvirtgconfig;
procedure gvir_config_domain_os_bios_enable_serial(os: PGVirConfigDomainOs; enable: Tgboolean); cdecl; external libvirtgconfig;
function gvir_config_domain_os_get_firmware(os: PGVirConfigDomainOs): TGVirConfigDomainOsFirmware; cdecl; external libvirtgconfig;
procedure gvir_config_domain_os_set_firmware(os: PGVirConfigDomainOs; firmware: TGVirConfigDomainOsFirmware); cdecl; external libvirtgconfig;
procedure gvir_config_domain_os_enable_firmware_feature(os: PGVirConfigDomainOs; name: pchar; enable: Tgboolean); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:47:19 ===

function GVIR_CONFIG_TYPE_DOMAIN_OS: TGType;
function GVIR_CONFIG_DOMAIN_OS(obj: Pointer): PGVirConfigDomainOs;
function GVIR_CONFIG_DOMAIN_OS_CLASS(klass: Pointer): PGVirConfigDomainOsClass;
function GVIR_CONFIG_IS_DOMAIN_OS(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_OS_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_OS_GET_CLASS(obj: Pointer): PGVirConfigDomainOsClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_OS: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_OS := gvir_config_domain_os_get_type;
end;

function GVIR_CONFIG_DOMAIN_OS(obj: Pointer): PGVirConfigDomainOs;
begin
  Result := PGVirConfigDomainOs(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_OS));
end;

function GVIR_CONFIG_DOMAIN_OS_CLASS(klass: Pointer): PGVirConfigDomainOsClass;
begin
  Result := PGVirConfigDomainOsClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_OS));
end;

function GVIR_CONFIG_IS_DOMAIN_OS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_OS);
end;

function GVIR_CONFIG_IS_DOMAIN_OS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_OS);
end;

function GVIR_CONFIG_DOMAIN_OS_GET_CLASS(obj: Pointer): PGVirConfigDomainOsClass;
begin
  Result := PGVirConfigDomainOsClass(PGTypeInstance(obj)^.g_class);
end;



end.
