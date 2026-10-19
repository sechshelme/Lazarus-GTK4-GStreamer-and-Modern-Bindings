{$IFDEF read_interface}


type
  PGVirDomainPrivate = type Pointer;

  PGVirDomain = ^TGVirDomain;
  TGVirDomain = record
    parent: TGObject;
    priv: PGVirDomainPrivate;
  end;

  PGVirDomainClass = ^TGVirDomainClass;
  TGVirDomainClass = record
    parent_class: TGObjectClass;
    started: procedure(dom: PGVirDomain); cdecl;
    stopped: procedure(dom: PGVirDomain); cdecl;
    resumed: procedure(dom: PGVirDomain); cdecl;
    updated: procedure(dom: PGVirDomain); cdecl;
    suspended: procedure(dom: PGVirDomain); cdecl;
    pmsuspended: procedure(dom: PGVirDomain); cdecl;
    padding: array[0..18] of Tgpointer;
  end;

type
  PGVirDomainState = ^TGVirDomainState;
  TGVirDomainState = longint;
const
  GVIR_DOMAIN_STATE_NONE = 0;
  GVIR_DOMAIN_STATE_RUNNING = 1;
  GVIR_DOMAIN_STATE_BLOCKED = 2;
  GVIR_DOMAIN_STATE_PAUSED = 3;
  GVIR_DOMAIN_STATE_SHUTDOWN = 4;
  GVIR_DOMAIN_STATE_SHUTOFF = 5;
  GVIR_DOMAIN_STATE_CRASHED = 6;
  GVIR_DOMAIN_STATE_PMSUSPENDED = 7;

type
  PGVirDomainStartFlags = ^TGVirDomainStartFlags;
  TGVirDomainStartFlags = longint;
const
  GVIR_DOMAIN_START_NONE = 0;
  GVIR_DOMAIN_START_PAUSED = 1 shl 0;
  GVIR_DOMAIN_START_AUTODESTROY = 1 shl 1;
  GVIR_DOMAIN_START_BYPASS_CACHE = 1 shl 2;
  GVIR_DOMAIN_START_FORCE_BOOT = 1 shl 3;

type
  PGVirDomainDeleteFlags = ^TGVirDomainDeleteFlags;
  TGVirDomainDeleteFlags = longint;
const
  GVIR_DOMAIN_DELETE_NONE = 0;
  GVIR_DOMAIN_DELETE_SAVED_STATE = VIR_DOMAIN_UNDEFINE_MANAGED_SAVE;
  GVIR_DOMAIN_DELETE_SNAPSHOTS_METADATA = VIR_DOMAIN_UNDEFINE_SNAPSHOTS_METADATA;
  GVIR_DOMAIN_DELETE_REMOVE_NVRAM = VIR_DOMAIN_UNDEFINE_NVRAM;
  GVIR_DOMAIN_DELETE_KEEP_NVRAM = VIR_DOMAIN_UNDEFINE_KEEP_NVRAM;

type
  PGVirDomainXMLFlags = ^TGVirDomainXMLFlags;
  TGVirDomainXMLFlags = longint;
const
  GVIR_DOMAIN_XML_NONE = 0;
  GVIR_DOMAIN_XML_SECURE = VIR_DOMAIN_XML_SECURE;
  GVIR_DOMAIN_XML_INACTIVE = VIR_DOMAIN_XML_INACTIVE;
  GVIR_DOMAIN_XML_UPDATE_CPU = VIR_DOMAIN_XML_UPDATE_CPU;

type
  PGVirDomainShutdownFlags = ^TGVirDomainShutdownFlags;
  TGVirDomainShutdownFlags = longint;
const
  GVIR_DOMAIN_SHUTDOWN_NONE = 0;
  GVIR_DOMAIN_SHUTDOWN_ACPI_POWER_BTN = VIR_DOMAIN_SHUTDOWN_ACPI_POWER_BTN;
  GVIR_DOMAIN_SHUTDOWN_GUEST_AGENT = VIR_DOMAIN_SHUTDOWN_GUEST_AGENT;

type
  PGVirDomainSnapshotCreateFlags = ^TGVirDomainSnapshotCreateFlags;
  TGVirDomainSnapshotCreateFlags = longint;
const
  GVIR_DOMAIN_SNAPSHOT_NONE = 0;
  GVIR_DOMAIN_SNAPSHOT_REDEFINE = VIR_DOMAIN_SNAPSHOT_CREATE_REDEFINE;
  GVIR_DOMAIN_SNAPSHOT_CURRENT = VIR_DOMAIN_SNAPSHOT_CREATE_CURRENT;
  GVIR_DOMAIN_SNAPSHOT_NO_METADATA = VIR_DOMAIN_SNAPSHOT_CREATE_NO_METADATA;
  GVIR_DOMAIN_SNAPSHOT_HALT = VIR_DOMAIN_SNAPSHOT_CREATE_HALT;
  GVIR_DOMAIN_SNAPSHOT_DISK_ONLY = VIR_DOMAIN_SNAPSHOT_CREATE_DISK_ONLY;
  GVIR_DOMAIN_SNAPSHOT_REUSE_EXT = VIR_DOMAIN_SNAPSHOT_CREATE_REUSE_EXT;
  GVIR_DOMAIN_SNAPSHOT_QUIESCE = VIR_DOMAIN_SNAPSHOT_CREATE_QUIESCE;
  GVIR_DOMAIN_SNAPSHOT_ATOMIC = VIR_DOMAIN_SNAPSHOT_CREATE_ATOMIC;

type
  PGVirDomainUpdateDeviceFlags = ^TGVirDomainUpdateDeviceFlags;
  TGVirDomainUpdateDeviceFlags = longint;
const
  GVIR_DOMAIN_UPDATE_DEVICE_CURRENT = VIR_DOMAIN_AFFECT_CURRENT;
  GVIR_DOMAIN_UPDATE_DEVICE_LIVE = VIR_DOMAIN_AFFECT_LIVE;
  GVIR_DOMAIN_UPDATE_DEVICE_CONFIG = VIR_DOMAIN_AFFECT_CONFIG;

type
  PGVirDomainRebootFlags = ^TGVirDomainRebootFlags;
  TGVirDomainRebootFlags = longint;
const
  GVIR_DOMAIN_REBOOT_NONE = 0;
  GVIR_DOMAIN_REBOOT_ACPI_POWER_BTN = VIR_DOMAIN_REBOOT_ACPI_POWER_BTN;
  GVIR_DOMAIN_REBOOT_GUEST_AGENT = VIR_DOMAIN_REBOOT_GUEST_AGENT;

type
  PGVirDomainSnapshotListFlags = ^TGVirDomainSnapshotListFlags;
  TGVirDomainSnapshotListFlags = longint;
const
  GVIR_DOMAIN_SNAPSHOT_LIST_ALL = 0;
  GVIR_DOMAIN_SNAPSHOT_LIST_DESCENDANTS = VIR_DOMAIN_SNAPSHOT_LIST_DESCENDANTS;
  GVIR_DOMAIN_SNAPSHOT_LIST_ROOTS = VIR_DOMAIN_SNAPSHOT_LIST_ROOTS;
  GVIR_DOMAIN_SNAPSHOT_LIST_METADATA = VIR_DOMAIN_SNAPSHOT_LIST_METADATA;
  GVIR_DOMAIN_SNAPSHOT_LIST_LEAVES = VIR_DOMAIN_SNAPSHOT_LIST_LEAVES;
  GVIR_DOMAIN_SNAPSHOT_LIST_NO_LEAVES = VIR_DOMAIN_SNAPSHOT_LIST_NO_LEAVES;
  GVIR_DOMAIN_SNAPSHOT_LIST_NO_METADATA = VIR_DOMAIN_SNAPSHOT_LIST_NO_METADATA;
  GVIR_DOMAIN_SNAPSHOT_LIST_INACTIVE = VIR_DOMAIN_SNAPSHOT_LIST_INACTIVE;
  GVIR_DOMAIN_SNAPSHOT_LIST_ACTIVE = VIR_DOMAIN_SNAPSHOT_LIST_ACTIVE;
  GVIR_DOMAIN_SNAPSHOT_LIST_DISK_ONLY = VIR_DOMAIN_SNAPSHOT_LIST_DISK_ONLY;
  GVIR_DOMAIN_SNAPSHOT_LIST_INTERNAL = VIR_DOMAIN_SNAPSHOT_LIST_INTERNAL;
  GVIR_DOMAIN_SNAPSHOT_LIST_EXTERNAL = VIR_DOMAIN_SNAPSHOT_LIST_EXTERNAL;

type
  PGVirDomainInfo = ^TGVirDomainInfo;
  TGVirDomainInfo = record
    state: TGVirDomainState;
    maxMem: Tguint64;
    memory: Tguint64;
    nrVirtCpu: Tguint16;
    cpuTime: Tguint64;
  end;

function gvir_domain_get_type: TGType; cdecl; external libvirtgobject;
function gvir_domain_info_get_type: TGType; cdecl; external libvirtgobject;
function gvir_domain_handle_get_type: TGType; cdecl; external libvirtgobject;
function gvir_domain_get_name(dom: PGVirDomain): Pgchar; cdecl; external libvirtgobject;
function gvir_domain_get_uuid(dom: PGVirDomain): Pgchar; cdecl; external libvirtgobject;
function gvir_domain_get_id(dom: PGVirDomain; err: PPGError): Tgint; cdecl; external libvirtgobject;
function gvir_domain_start(dom: PGVirDomain; flags: Tguint; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_domain_start_async(dom: PGVirDomain; flags: Tguint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_domain_start_finish(dom: PGVirDomain; result: PGAsyncResult; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_resume(dom: PGVirDomain; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_domain_resume_async(dom: PGVirDomain; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_domain_resume_finish(dom: PGVirDomain; result: PGAsyncResult; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_wakeup(dom: PGVirDomain; flags: Tguint; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_domain_wakeup_async(dom: PGVirDomain; flags: Tguint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_domain_wakeup_finish(dom: PGVirDomain; result: PGAsyncResult; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_stop(dom: PGVirDomain; flags: Tguint; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_delete(dom: PGVirDomain; flags: Tguint; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_shutdown(dom: PGVirDomain; flags: Tguint; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_reboot(dom: PGVirDomain; flags: Tguint; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_save_to_file(dom: PGVirDomain; filename: Pgchar; custom_conf: PGVirConfigDomain; flags: Tguint; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_domain_save_to_file_async(dom: PGVirDomain; filename: Pgchar; custom_conf: PGVirConfigDomain; flags: Tguint; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_domain_save_to_file_finish(dom: PGVirDomain; result: PGAsyncResult; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_get_info(dom: PGVirDomain; err: PPGError): PGVirDomainInfo; cdecl; external libvirtgobject;
procedure gvir_domain_get_info_async(dom: PGVirDomain; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_domain_get_info_finish(dom: PGVirDomain; result: PGAsyncResult; err: PPGError): PGVirDomainInfo; cdecl; external libvirtgobject;
function gvir_domain_get_config(dom: PGVirDomain; flags: Tguint; err: PPGError): PGVirConfigDomain; cdecl; external libvirtgobject;
function gvir_domain_set_config(domain: PGVirDomain; conf: PGVirConfigDomain; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_screenshot(dom: PGVirDomain; stream: PGVirStream; monitor_id: Tguint; flags: Tguint; err: PPGError): Pgchar; cdecl; external libvirtgobject;
function gvir_domain_open_console(dom: PGVirDomain; stream: PGVirStream; devname: Pgchar; flags: Tguint; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_open_graphics(dom: PGVirDomain; idx: Tguint; fd: longint; flags: dword; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_open_graphics_fd(dom: PGVirDomain; idx: Tguint; flags: dword; err: PPGError): longint; cdecl; external libvirtgobject;
function gvir_domain_suspend(dom: PGVirDomain; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_save(dom: PGVirDomain; flags: dword; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_domain_save_async(dom: PGVirDomain; flags: dword; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_domain_save_finish(dom: PGVirDomain; result: PGAsyncResult; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_get_persistent(dom: PGVirDomain): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_get_saved(dom: PGVirDomain): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_get_devices(domain: PGVirDomain; err: PPGError): PGList; cdecl; external libvirtgobject;
function gvir_domain_update_device(dom: PGVirDomain; device: PGVirConfigDomainDevice; flags: Tguint; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_create_snapshot(dom: PGVirDomain; custom_conf: PGVirConfigDomainSnapshot; flags: Tguint; err: PPGError): PGVirDomainSnapshot; cdecl; external libvirtgobject;
procedure gvir_domain_create_snapshot_async(dom: PGVirDomain; custom_conf: PGVirConfigDomainSnapshot; flags: Tguint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_domain_create_snapshot_finish(domain: PGVirDomain; result: PGAsyncResult; error: PPGError): PGVirDomainSnapshot; cdecl; external libvirtgobject;
function gvir_domain_fetch_snapshots(dom: PGVirDomain; list_flags: Tguint; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_get_snapshots(dom: PGVirDomain): PGList; cdecl; external libvirtgobject;
procedure gvir_domain_fetch_snapshots_async(dom: PGVirDomain; list_flags: Tguint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_domain_fetch_snapshots_finish(dom: PGVirDomain; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_get_has_current_snapshot(dom: PGVirDomain; flags: Tguint; has_current_snapshot: Pgboolean; error: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_set_time(dom: PGVirDomain; date_time: PGDateTime; flags: Tguint; err: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_domain_set_time_async(dom: PGVirDomain; date_time: PGDateTime; flags: Tguint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_domain_set_time_finish(dom: PGVirDomain; result: PGAsyncResult; err: PPGError): Tgboolean; cdecl; external libvirtgobject;

// === Konventiert am: 18-10-26 19:32:40 ===

function GVIR_TYPE_DOMAIN: TGType;
function GVIR_DOMAIN(obj: Pointer): PGVirDomain;
function GVIR_DOMAIN_CLASS(klass: Pointer): PGVirDomainClass;
function GVIR_IS_DOMAIN(obj: Pointer): Tgboolean;
function GVIR_IS_DOMAIN_CLASS(klass: Pointer): Tgboolean;
function GVIR_DOMAIN_GET_CLASS(obj: Pointer): PGVirDomainClass;

function GVIR_TYPE_DOMAIN_INFO: TGType;
function GVIR_TYPE_DOMAIN_HANDLE: TGType;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_TYPE_DOMAIN: TGType;
begin
  GVIR_TYPE_DOMAIN := gvir_domain_get_type;
end;

function GVIR_DOMAIN(obj: Pointer): PGVirDomain;
begin
  Result := PGVirDomain(g_type_check_instance_cast(obj, GVIR_TYPE_DOMAIN));
end;

function GVIR_DOMAIN_CLASS(klass: Pointer): PGVirDomainClass;
begin
  Result := PGVirDomainClass(g_type_check_class_cast(klass, GVIR_TYPE_DOMAIN));
end;

function GVIR_IS_DOMAIN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_TYPE_DOMAIN);
end;

function GVIR_IS_DOMAIN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_TYPE_DOMAIN);
end;

function GVIR_DOMAIN_GET_CLASS(obj: Pointer): PGVirDomainClass;
begin
  Result := PGVirDomainClass(PGTypeInstance(obj)^.g_class);
end;


function GVIR_TYPE_DOMAIN_INFO: TGType;
begin
  GVIR_TYPE_DOMAIN_INFO := gvir_domain_info_get_type;
end;

function GVIR_TYPE_DOMAIN_HANDLE: TGType;
begin
  GVIR_TYPE_DOMAIN_HANDLE := gvir_domain_handle_get_type;
end;


{$ENDIF read_implementation}
