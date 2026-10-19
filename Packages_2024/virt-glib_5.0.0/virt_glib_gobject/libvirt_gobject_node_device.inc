{$IFDEF read_interface}


type
  PGVirNodeDevicePrivate = type Pointer;

  PGVirNodeDevice = ^TGVirNodeDevice;
  TGVirNodeDevice = record
    parent: TGObject;
    priv: PGVirNodeDevicePrivate;
  end;

  PGVirNodeDeviceClass = ^TGVirNodeDeviceClass;
  TGVirNodeDeviceClass = record
    parent_class: TGObjectClass;
    padding: array[0..19] of Tgpointer;
  end;


function gvir_node_device_get_type: TGType; cdecl; external libvirtgobject;
function gvir_node_device_handle_get_type: TGType; cdecl; external libvirtgobject;
function gvir_node_device_get_name(device: PGVirNodeDevice): Pgchar; cdecl; external libvirtgobject;
function gvir_node_device_get_config(device: PGVirNodeDevice; flags: Tguint; err: PPGError): PGVirConfigNodeDevice; cdecl; external libvirtgobject;

// === Konventiert am: 18-10-26 19:31:53 ===

function GVIR_TYPE_NODE_DEVICE: TGType;
function GVIR_NODE_DEVICE(obj: Pointer): PGVirNodeDevice;
function GVIR_NODE_DEVICE_CLASS(klass: Pointer): PGVirNodeDeviceClass;
function GVIR_IS_NODE_DEVICE(obj: Pointer): Tgboolean;
function GVIR_IS_NODE_DEVICE_CLASS(klass: Pointer): Tgboolean;
function GVIR_NODE_DEVICE_GET_CLASS(obj: Pointer): PGVirNodeDeviceClass;

function GVIR_TYPE_NODE_DEVICE_HANDLE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GVIR_TYPE_NODE_DEVICE: TGType;
begin
  GVIR_TYPE_NODE_DEVICE := gvir_node_device_get_type;
end;

function GVIR_NODE_DEVICE(obj: Pointer): PGVirNodeDevice;
begin
  Result := PGVirNodeDevice(g_type_check_instance_cast(obj, GVIR_TYPE_NODE_DEVICE));
end;

function GVIR_NODE_DEVICE_CLASS(klass: Pointer): PGVirNodeDeviceClass;
begin
  Result := PGVirNodeDeviceClass(g_type_check_class_cast(klass, GVIR_TYPE_NODE_DEVICE));
end;

function GVIR_IS_NODE_DEVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_TYPE_NODE_DEVICE);
end;

function GVIR_IS_NODE_DEVICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_TYPE_NODE_DEVICE);
end;

function GVIR_NODE_DEVICE_GET_CLASS(obj: Pointer): PGVirNodeDeviceClass;
begin
  Result := PGVirNodeDeviceClass(PGTypeInstance(obj)^.g_class);
end;


function GVIR_TYPE_NODE_DEVICE_HANDLE: TGType;
begin
  GVIR_TYPE_NODE_DEVICE_HANDLE := gvir_node_device_handle_get_type;
end;


{$ENDIF read_implementation}
