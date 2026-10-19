unit libvirt_gobject_network_filter;

interface

uses
  fp_glib2, fp_virt_glib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirNetworkFilterPrivate = type Pointer;

  PGVirNetworkFilter = ^TGVirNetworkFilter;
  TGVirNetworkFilter = record
    parent: TGObject;
    priv: PGVirNetworkFilterPrivate;
  end;

  PGVirNetworkFilterClass = ^TGVirNetworkFilterClass;
  TGVirNetworkFilterClass = record
    parent_class: TGObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_network_filter_get_type: TGType; cdecl; external libvirtgobject;
function gvir_network_filter_handle_get_type: TGType; cdecl; external libvirtgobject;
function gvir_network_filter_get_name(filter: PGVirNetworkFilter): Pgchar; cdecl; external libvirtgobject;
function gvir_network_filter_get_uuid(filter: PGVirNetworkFilter): Pgchar; cdecl; external libvirtgobject;
function gvir_network_filter_get_config(filter: PGVirNetworkFilter; flags: Tguint; err: PPGError): PGVirConfigNetworkFilter; cdecl; external libvirtgobject;

// === Konventiert am: 18-10-26 19:31:59 ===

function GVIR_TYPE_NETWORK_FILTER: TGType;
function GVIR_NETWORK_FILTER(obj: Pointer): PGVirNetworkFilter;
function GVIR_NETWORK_FILTER_CLASS(klass: Pointer): PGVirNetworkFilterClass;
function GVIR_IS_NETWORK_FILTER(obj: Pointer): Tgboolean;
function GVIR_IS_NETWORK_FILTER_CLASS(klass: Pointer): Tgboolean;
function GVIR_NETWORK_FILTER_GET_CLASS(obj: Pointer): PGVirNetworkFilterClass;

function GVIR_TYPE_NETWORK_FILTER_HANDLE: TGType;

implementation

function GVIR_TYPE_NETWORK_FILTER: TGType;
begin
  GVIR_TYPE_NETWORK_FILTER := gvir_network_filter_get_type;
end;

function GVIR_NETWORK_FILTER(obj: Pointer): PGVirNetworkFilter;
begin
  Result := PGVirNetworkFilter(g_type_check_instance_cast(obj, GVIR_TYPE_NETWORK_FILTER));
end;

function GVIR_NETWORK_FILTER_CLASS(klass: Pointer): PGVirNetworkFilterClass;
begin
  Result := PGVirNetworkFilterClass(g_type_check_class_cast(klass, GVIR_TYPE_NETWORK_FILTER));
end;

function GVIR_IS_NETWORK_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_TYPE_NETWORK_FILTER);
end;

function GVIR_IS_NETWORK_FILTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_TYPE_NETWORK_FILTER);
end;

function GVIR_NETWORK_FILTER_GET_CLASS(obj: Pointer): PGVirNetworkFilterClass;
begin
  Result := PGVirNetworkFilterClass(PGTypeInstance(obj)^.g_class);
end;


function GVIR_TYPE_NETWORK_FILTER_HANDLE: TGType;
begin
  GVIR_TYPE_NETWORK_FILTER_HANDLE := gvir_network_filter_handle_get_type;
end;


end.
