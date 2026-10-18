unit libvirt_gconfig_domain_snapshot;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object, libvirt_gconfig_domain, libvirt_gconfig_domain_snapshot_disk;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainSnapshotPrivate = type Pointer;

  PGVirConfigDomainSnapshot = ^TGVirConfigDomainSnapshot;
  TGVirConfigDomainSnapshot = record
    parent: TGVirConfigObject;
    priv: PGVirConfigDomainSnapshotPrivate;
  end;

  PGVirConfigDomainSnapshotClass = ^TGVirConfigDomainSnapshotClass;
  TGVirConfigDomainSnapshotClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirConfigDomainSnapshotDomainState = ^TGVirConfigDomainSnapshotDomainState;
  TGVirConfigDomainSnapshotDomainState = longint;
const
  GVIR_CONFIG_DOMAIN_SNAPSHOT_DOMAIN_STATE_NOSTATE = 0;
  GVIR_CONFIG_DOMAIN_SNAPSHOT_DOMAIN_STATE_RUNNING = 1;
  GVIR_CONFIG_DOMAIN_SNAPSHOT_DOMAIN_STATE_BLOCKED = 2;
  GVIR_CONFIG_DOMAIN_SNAPSHOT_DOMAIN_STATE_PAUSED = 3;
  GVIR_CONFIG_DOMAIN_SNAPSHOT_DOMAIN_STATE_SHUTDOWN = 4;
  GVIR_CONFIG_DOMAIN_SNAPSHOT_DOMAIN_STATE_SHUTOFF = 5;
  GVIR_CONFIG_DOMAIN_SNAPSHOT_DOMAIN_STATE_CRASHED = 6;
  GVIR_CONFIG_DOMAIN_SNAPSHOT_DOMAIN_STATE_PMSUSPENDED = 7;
  GVIR_CONFIG_DOMAIN_SNAPSHOT_DOMAIN_STATE_DISK_SNAPSHOT = 100;

type
  PGVirConfigDomainSnapshotMemoryState = ^TGVirConfigDomainSnapshotMemoryState;
  TGVirConfigDomainSnapshotMemoryState = longint;
const
  GVIR_CONFIG_DOMAIN_SNAPSHOT_MEMORY_STATE_NONE = 0;
  GVIR_CONFIG_DOMAIN_SNAPSHOT_MEMORY_STATE_INTERNAL = 1;
  GVIR_CONFIG_DOMAIN_SNAPSHOT_MEMORY_STATE_EXTERNAL = 2;

function gvir_config_domain_snapshot_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_snapshot_new: PGVirConfigDomainSnapshot; cdecl; external libvirtgconfig;
function gvir_config_domain_snapshot_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainSnapshot; cdecl; external libvirtgconfig;
function gvir_config_domain_snapshot_get_name(snapshot: PGVirConfigDomainSnapshot): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_domain_snapshot_set_name(snapshot: PGVirConfigDomainSnapshot; name: pchar); cdecl; external libvirtgconfig;
function gvir_config_domain_snapshot_get_description(snapshot: PGVirConfigDomainSnapshot): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_domain_snapshot_set_description(snapshot: PGVirConfigDomainSnapshot; description: pchar); cdecl; external libvirtgconfig;
function gvir_config_domain_snapshot_get_memory_state(snapshot: PGVirConfigDomainSnapshot): TGVirConfigDomainSnapshotMemoryState; cdecl; external libvirtgconfig;
procedure gvir_config_domain_snapshot_set_memory_state(snapshot: PGVirConfigDomainSnapshot; state: TGVirConfigDomainSnapshotMemoryState); cdecl; external libvirtgconfig;
function gvir_config_domain_snapshot_get_memory_file(snapshot: PGVirConfigDomainSnapshot): pchar; cdecl; external libvirtgconfig;
procedure gvir_config_domain_snapshot_set_memory_file(snapshot: PGVirConfigDomainSnapshot; filename: pchar); cdecl; external libvirtgconfig;
function gvir_config_domain_snapshot_get_creation_time(snapshot: PGVirConfigDomainSnapshot): Ttime_t; cdecl; external libvirtgconfig;
function gvir_config_domain_snapshot_get_state(snapshot: PGVirConfigDomainSnapshot): TGVirConfigDomainSnapshotDomainState; cdecl; external libvirtgconfig;
function gvir_config_domain_snapshot_get_parent(snapshot: PGVirConfigDomainSnapshot): pchar; cdecl; external libvirtgconfig;
function gvir_config_domain_snapshot_get_domain(snapshot: PGVirConfigDomainSnapshot): PGVirConfigDomain; cdecl; external libvirtgconfig;
procedure gvir_config_domain_snapshot_set_disks(snapshot: PGVirConfigDomainSnapshot; disks: PGList); cdecl; external libvirtgconfig;
procedure gvir_config_domain_snapshot_add_disk(snapshot: PGVirConfigDomainSnapshot; disk: PGVirConfigDomainSnapshotDisk); cdecl; external libvirtgconfig;
function gvir_config_domain_snapshot_get_disks(snapshot: PGVirConfigDomainSnapshot): PGList; cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:49:48 ===

function GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT: TGType;
function GVIR_CONFIG_DOMAIN_SNAPSHOT(obj: Pointer): PGVirConfigDomainSnapshot;
function GVIR_CONFIG_DOMAIN_SNAPSHOT_CLASS(klass: Pointer): PGVirConfigDomainSnapshotClass;
function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_SNAPSHOT_GET_CLASS(obj: Pointer): PGVirConfigDomainSnapshotClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT := gvir_config_domain_snapshot_get_type;
end;

function GVIR_CONFIG_DOMAIN_SNAPSHOT(obj: Pointer): PGVirConfigDomainSnapshot;
begin
  Result := PGVirConfigDomainSnapshot(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT));
end;

function GVIR_CONFIG_DOMAIN_SNAPSHOT_CLASS(klass: Pointer): PGVirConfigDomainSnapshotClass;
begin
  Result := PGVirConfigDomainSnapshotClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT));
end;

function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT);
end;

function GVIR_CONFIG_IS_DOMAIN_SNAPSHOT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT);
end;

function GVIR_CONFIG_DOMAIN_SNAPSHOT_GET_CLASS(obj: Pointer): PGVirConfigDomainSnapshotClass;
begin
  Result := PGVirConfigDomainSnapshotClass(PGTypeInstance(obj)^.g_class);
end;



end.
