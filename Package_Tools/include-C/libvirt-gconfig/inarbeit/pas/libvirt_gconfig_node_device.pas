unit libvirt_gconfig_node_device;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_object;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigNodeDevicePrivate = type Pointer;

  PGVirConfigNodeDevice = ^TGVirConfigNodeDevice;
  TGVirConfigNodeDevice = record
    parent: TGVirConfigObject;
    priv: PGVirConfigNodeDevicePrivate;
  end;

  PGVirConfigNodeDeviceClass = ^TGVirConfigNodeDeviceClass;
  TGVirConfigNodeDeviceClass = record
    parent_class: TGVirConfigObjectClass;
    padding: array[0..19] of Tgpointer;
  end;

function gvir_config_node_device_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_node_device_new: PGVirConfigNodeDevice; cdecl; external libvirtgconfig;
function gvir_config_node_device_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigNodeDevice; cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:53:07 ===

function GVIR_CONFIG_TYPE_NODE_DEVICE: TGType;
function GVIR_CONFIG_NODE_DEVICE(obj: Pointer): PGVirConfigNodeDevice;
function GVIR_CONFIG_NODE_DEVICE_CLASS(klass: Pointer): PGVirConfigNodeDeviceClass;
function GVIR_CONFIG_IS_NODE_DEVICE(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_NODE_DEVICE_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_NODE_DEVICE_GET_CLASS(obj: Pointer): PGVirConfigNodeDeviceClass;

implementation

function GVIR_CONFIG_TYPE_NODE_DEVICE: TGType;
begin
  GVIR_CONFIG_TYPE_NODE_DEVICE := gvir_config_node_device_get_type;
end;

function GVIR_CONFIG_NODE_DEVICE(obj: Pointer): PGVirConfigNodeDevice;
begin
  Result := PGVirConfigNodeDevice(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_NODE_DEVICE));
end;

function GVIR_CONFIG_NODE_DEVICE_CLASS(klass: Pointer): PGVirConfigNodeDeviceClass;
begin
  Result := PGVirConfigNodeDeviceClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_NODE_DEVICE));
end;

function GVIR_CONFIG_IS_NODE_DEVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_NODE_DEVICE);
end;

function GVIR_CONFIG_IS_NODE_DEVICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_NODE_DEVICE);
end;

function GVIR_CONFIG_NODE_DEVICE_GET_CLASS(obj: Pointer): PGVirConfigNodeDeviceClass;
begin
  Result := PGVirConfigNodeDeviceClass(PGTypeInstance(obj)^.g_class);
end;



end.
