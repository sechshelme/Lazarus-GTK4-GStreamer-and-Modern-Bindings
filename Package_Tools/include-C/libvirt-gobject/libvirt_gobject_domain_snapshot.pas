unit libvirt_gobject_domain_snapshot;

interface

uses
  fp_glib2, fp_virt_glib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirDomainSnapshotPrivate = type Pointer;

  PGVirDomainSnapshot = ^TGVirDomainSnapshot;
  TGVirDomainSnapshot = record
    parent: TGObject;
    priv: PGVirDomainSnapshotPrivate;
  end;

  PGVirDomainSnapshotClass = ^TGVirDomainSnapshotClass;
  TGVirDomainSnapshotClass = record
    parent_class: TGObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirDomainSnapshotDeleteFlags = ^TGVirDomainSnapshotDeleteFlags;
  TGVirDomainSnapshotDeleteFlags = longint;
const
  GVIR_DOMAIN_SNAPSHOT_DELETE_CHILDREN = 1;
  GVIR_DOMAIN_SNAPSHOT_DELETE_METADATA_ONLY = 2;
  GVIR_DOMAIN_SNAPSHOT_DELETE_CHILDREN_ONLY = 4;

type
  PGVirDomainSnapshotRevertFlags = ^TGVirDomainSnapshotRevertFlags;
  TGVirDomainSnapshotRevertFlags = longint;
const
  GVIR_DOMAIN_SNAPSHOT_REVERT_RUNNING = 1;
  GVIR_DOMAIN_SNAPSHOT_REVERT_PAUSED = 2;
  GVIR_DOMAIN_SNAPSHOT_REVERT_FORCE = 4;

function gvir_domain_snapshot_get_type: TGType; cdecl; external libvirtgobject;
function gvir_domain_snapshot_handle_get_type: TGType; cdecl; external libvirtgobject;
function gvir_domain_snapshot_get_name(snapshot: PGVirDomainSnapshot): Pgchar; cdecl; external libvirtgobject;
function gvir_domain_snapshot_get_config(snapshot: PGVirDomainSnapshot; flags: Tguint; err: PPGError): PGVirConfigDomainSnapshot; cdecl; external libvirtgobject;
function gvir_domain_snapshot_delete(snapshot: PGVirDomainSnapshot; flags: Tguint; error: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_domain_snapshot_delete_async(snapshot: PGVirDomainSnapshot; flags: Tguint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_domain_snapshot_delete_finish(snapshot: PGVirDomainSnapshot; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_snapshot_get_is_current(snapshot: PGVirDomainSnapshot; flags: Tguint; is_current: Pgboolean; error: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_snapshot_revert_to(snapshot: PGVirDomainSnapshot; flags: Tguint; error: PPGError): Tgboolean; cdecl; external libvirtgobject;
procedure gvir_domain_snapshot_revert_to_async(snapshot: PGVirDomainSnapshot; flags: Tguint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvirtgobject;
function gvir_domain_snapshot_revert_to_finish(snapshot: PGVirDomainSnapshot; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libvirtgobject;
function gvir_domain_snapshot_set_config(snapshot: PGVirDomainSnapshot; conf: PGVirConfigDomainSnapshot; error: PPGError): Tgboolean; cdecl; external libvirtgobject;

// === Konventiert am: 18-10-26 19:32:26 ===

function GVIR_TYPE_DOMAIN_SNAPSHOT: TGType;
function GVIR_DOMAIN_SNAPSHOT(obj: Pointer): PGVirDomainSnapshot;
function GVIR_DOMAIN_SNAPSHOT_CLASS(klass: Pointer): PGVirDomainSnapshotClass;
function GVIR_IS_DOMAIN_SNAPSHOT(obj: Pointer): Tgboolean;
function GVIR_IS_DOMAIN_SNAPSHOT_CLASS(klass: Pointer): Tgboolean;
function GVIR_DOMAIN_SNAPSHOT_GET_CLASS(obj: Pointer): PGVirDomainSnapshotClass;

function GVIR_TYPE_DOMAIN_SNAPSHOT_HANDLE: TGType;



implementation

function GVIR_TYPE_DOMAIN_SNAPSHOT: TGType;
begin
  GVIR_TYPE_DOMAIN_SNAPSHOT := gvir_domain_snapshot_get_type;
end;

function GVIR_DOMAIN_SNAPSHOT(obj: Pointer): PGVirDomainSnapshot;
begin
  Result := PGVirDomainSnapshot(g_type_check_instance_cast(obj, GVIR_TYPE_DOMAIN_SNAPSHOT));
end;

function GVIR_DOMAIN_SNAPSHOT_CLASS(klass: Pointer): PGVirDomainSnapshotClass;
begin
  Result := PGVirDomainSnapshotClass(g_type_check_class_cast(klass, GVIR_TYPE_DOMAIN_SNAPSHOT));
end;

function GVIR_IS_DOMAIN_SNAPSHOT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_TYPE_DOMAIN_SNAPSHOT);
end;

function GVIR_IS_DOMAIN_SNAPSHOT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_TYPE_DOMAIN_SNAPSHOT);
end;

function GVIR_DOMAIN_SNAPSHOT_GET_CLASS(obj: Pointer): PGVirDomainSnapshotClass;
begin
  Result := PGVirDomainSnapshotClass(PGTypeInstance(obj)^.g_class);
end;


function GVIR_TYPE_DOMAIN_SNAPSHOT_HANDLE: TGType;
begin
  GVIR_TYPE_DOMAIN_SNAPSHOT_HANDLE := gvir_domain_snapshot_handle_get_type;
end;


end.
