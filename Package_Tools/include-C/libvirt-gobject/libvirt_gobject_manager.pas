unit libvirt_gobject_manager;

interface

uses
  fp_glib2, fp_virt_glib, libvirt_gobject_connection;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirManagerPrivate = type Pointer;

  PGVirManager = ^TGVirManager;
  TGVirManager = record
    parent: TGObject;
    priv: PGVirManagerPrivate;
  end;

  PGVirManagerClass = ^TGVirManagerClass;
  TGVirManagerClass = record
    parent_class: TGObjectClass;
    connection_added: procedure(man: PGVirManager; conn: PGVirConnection); cdecl;
    connection_removed: procedure(man: PGVirManager; conn: PGVirConnection); cdecl;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_manager_get_type: TGType; cdecl; external libvirtgobject;
function gvir_manager_new: PGVirManager; cdecl; external libvirtgobject;
procedure gvir_manager_add_connection(man: PGVirManager; conn: PGVirConnection); cdecl; external libvirtgobject;
procedure gvir_manager_remove_connection(man: PGVirManager; conn: PGVirConnection); cdecl; external libvirtgobject;
function gvir_manager_get_connections(man: PGVirManager): PGList; cdecl; external libvirtgobject;
function gvir_manager_find_connection_by_uri(man: PGVirManager; uri: Pgchar): PGVirConnection; cdecl; external libvirtgobject;

// === Konventiert am: 18-10-26 19:32:12 ===

function GVIR_TYPE_MANAGER: TGType;
function GVIR_MANAGER(obj: Pointer): PGVirManager;
function GVIR_MANAGER_CLASS(klass: Pointer): PGVirManagerClass;
function GVIR_IS_MANAGER(obj: Pointer): Tgboolean;
function GVIR_IS_MANAGER_CLASS(klass: Pointer): Tgboolean;
function GVIR_MANAGER_GET_CLASS(obj: Pointer): PGVirManagerClass;

implementation

function GVIR_TYPE_MANAGER: TGType;
begin
  GVIR_TYPE_MANAGER := gvir_manager_get_type;
end;

function GVIR_MANAGER(obj: Pointer): PGVirManager;
begin
  Result := PGVirManager(g_type_check_instance_cast(obj, GVIR_TYPE_MANAGER));
end;

function GVIR_MANAGER_CLASS(klass: Pointer): PGVirManagerClass;
begin
  Result := PGVirManagerClass(g_type_check_class_cast(klass, GVIR_TYPE_MANAGER));
end;

function GVIR_IS_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_TYPE_MANAGER);
end;

function GVIR_IS_MANAGER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_TYPE_MANAGER);
end;

function GVIR_MANAGER_GET_CLASS(obj: Pointer): PGVirManagerClass;
begin
  Result := PGVirManagerClass(PGTypeInstance(obj)^.g_class);
end;



end.
