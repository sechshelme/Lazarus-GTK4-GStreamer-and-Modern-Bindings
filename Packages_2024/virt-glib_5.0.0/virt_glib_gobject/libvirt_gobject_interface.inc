{$IFDEF read_interface}



type
  PGVirInterfacePrivate = type Pointer;

  PGVirInterface = ^TGVirInterface;
  TGVirInterface = record
    parent: TGObject;
    priv: PGVirInterfacePrivate;
  end;

  PGVirInterfaceClass = ^TGVirInterfaceClass;
  TGVirInterfaceClass = record
    parent_class: TGObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_interface_get_type: TGType; cdecl; external libvirtgobject;
function gvir_interface_handle_get_type: TGType; cdecl; external libvirtgobject;
function gvir_interface_get_name(iface: PGVirInterface): Pgchar; cdecl; external libvirtgobject;
function gvir_interface_get_mac(iface: PGVirInterface): Pgchar; cdecl; external libvirtgobject;
function gvir_interface_get_config(iface: PGVirInterface; flags: Tguint; err: PPGError): PGVirConfigInterface; cdecl; external libvirtgobject;

// === Konventiert am: 18-10-26 19:32:20 ===

function GVIR_TYPE_INTERFACE: TGType;
function GVIR_INTERFACE(obj: Pointer): PGVirInterface;
function GVIR_INTERFACE_CLASS(klass: Pointer): PGVirInterfaceClass;
function GVIR_IS_INTERFACE(obj: Pointer): Tgboolean;
function GVIR_IS_INTERFACE_CLASS(klass: Pointer): Tgboolean;
function GVIR_INTERFACE_GET_CLASS(obj: Pointer): PGVirInterfaceClass;

function GVIR_TYPE_INTERFACE_HANDLE: TGType;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_TYPE_INTERFACE: TGType;
begin
  GVIR_TYPE_INTERFACE := gvir_interface_get_type;
end;

function GVIR_INTERFACE(obj: Pointer): PGVirInterface;
begin
  Result := PGVirInterface(g_type_check_instance_cast(obj, GVIR_TYPE_INTERFACE));
end;

function GVIR_INTERFACE_CLASS(klass: Pointer): PGVirInterfaceClass;
begin
  Result := PGVirInterfaceClass(g_type_check_class_cast(klass, GVIR_TYPE_INTERFACE));
end;

function GVIR_IS_INTERFACE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_TYPE_INTERFACE);
end;

function GVIR_IS_INTERFACE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_TYPE_INTERFACE);
end;

function GVIR_INTERFACE_GET_CLASS(obj: Pointer): PGVirInterfaceClass;
begin
  Result := PGVirInterfaceClass(PGTypeInstance(obj)^.g_class);
end;


function GVIR_TYPE_INTERFACE_HANDLE: TGType;
begin
  GVIR_TYPE_INTERFACE_HANDLE := gvir_interface_handle_get_type;
end;


{$ENDIF read_implementation}
