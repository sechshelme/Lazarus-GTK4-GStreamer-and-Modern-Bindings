unit libvirt_gobject_enums;

interface

uses
  fp_glib2, fp_virt_glib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gvir_domain_snapshot_delete_flags_get_type: TGType; cdecl; external libvirtgobject;
function GVIR_TYPE_DOMAIN_SNAPSHOT_DELETE_FLAGS: TGType;

function gvir_domain_snapshot_revert_flags_get_type: TGType; cdecl; external libvirtgobject;
function GVIR_TYPE_DOMAIN_SNAPSHOT_REVERT_FLAGS: TGType;

function gvir_domain_state_get_type: TGType; cdecl; external libvirtgobject;
function GVIR_TYPE_DOMAIN_STATE: TGType;

function gvir_domain_start_flags_get_type: TGType; cdecl; external libvirtgobject;
function GVIR_TYPE_DOMAIN_START_FLAGS: TGType;

function gvir_domain_delete_flags_get_type: TGType; cdecl; external libvirtgobject;
function GVIR_TYPE_DOMAIN_DELETE_FLAGS: TGType;

function gvir_domain_xml_flags_get_type: TGType; cdecl; external libvirtgobject;
function GVIR_TYPE_DOMAIN_XML_FLAGS: TGType;

function gvir_domain_shutdown_flags_get_type: TGType; cdecl; external libvirtgobject;
function GVIR_TYPE_DOMAIN_SHUTDOWN_FLAGS: TGType;

function gvir_domain_snapshot_create_flags_get_type: TGType; cdecl; external libvirtgobject;
function GVIR_TYPE_DOMAIN_SNAPSHOT_CREATE_FLAGS: TGType;

function gvir_domain_update_device_flags_get_type: TGType; cdecl; external libvirtgobject;
function GVIR_TYPE_DOMAIN_UPDATE_DEVICE_FLAGS: TGType;

function gvir_domain_reboot_flags_get_type: TGType; cdecl; external libvirtgobject;
function GVIR_TYPE_DOMAIN_REBOOT_FLAGS: TGType;

function gvir_domain_snapshot_list_flags_get_type: TGType; cdecl; external libvirtgobject;
function GVIR_TYPE_DOMAIN_SNAPSHOT_LIST_FLAGS: TGType;

function gvir_ip_addr_type_get_type: TGType; cdecl; external libvirtgobject;
function GVIR_TYPE_IP_ADDR_TYPE: TGType;

function gvir_storage_pool_state_get_type: TGType; cdecl; external libvirtgobject;
function GVIR_TYPE_STORAGE_POOL_STATE: TGType;

function gvir_storage_vol_type_get_type: TGType; cdecl; external libvirtgobject;
function GVIR_TYPE_STORAGE_VOL_TYPE: TGType;

function gvir_storage_vol_resize_flags_get_type: TGType; cdecl; external libvirtgobject;
function GVIR_TYPE_STORAGE_VOL_RESIZE_FLAGS: TGType;

function gvir_stream_io_condition_get_type: TGType; cdecl; external libvirtgobject;
function GVIR_TYPE_STREAM_IO_CONDITION: TGType;


// === Konventiert am: 18-10-26 19:32:59 ===


implementation


function GVIR_TYPE_DOMAIN_SNAPSHOT_DELETE_FLAGS: TGType;
begin
  GVIR_TYPE_DOMAIN_SNAPSHOT_DELETE_FLAGS := gvir_domain_snapshot_delete_flags_get_type;
end;

function GVIR_TYPE_DOMAIN_SNAPSHOT_REVERT_FLAGS: TGType;
begin
  GVIR_TYPE_DOMAIN_SNAPSHOT_REVERT_FLAGS := gvir_domain_snapshot_revert_flags_get_type;
end;

function GVIR_TYPE_DOMAIN_STATE: TGType;
begin
  GVIR_TYPE_DOMAIN_STATE := gvir_domain_state_get_type;
end;

function GVIR_TYPE_DOMAIN_START_FLAGS: TGType;
begin
  GVIR_TYPE_DOMAIN_START_FLAGS := gvir_domain_start_flags_get_type;
end;

function GVIR_TYPE_DOMAIN_DELETE_FLAGS: TGType;
begin
  GVIR_TYPE_DOMAIN_DELETE_FLAGS := gvir_domain_delete_flags_get_type;
end;

function GVIR_TYPE_DOMAIN_XML_FLAGS: TGType;
begin
  GVIR_TYPE_DOMAIN_XML_FLAGS := gvir_domain_xml_flags_get_type;
end;

function GVIR_TYPE_DOMAIN_SHUTDOWN_FLAGS: TGType;
begin
  GVIR_TYPE_DOMAIN_SHUTDOWN_FLAGS := gvir_domain_shutdown_flags_get_type;
end;

function GVIR_TYPE_DOMAIN_SNAPSHOT_CREATE_FLAGS: TGType;
begin
  GVIR_TYPE_DOMAIN_SNAPSHOT_CREATE_FLAGS := gvir_domain_snapshot_create_flags_get_type;
end;

function GVIR_TYPE_DOMAIN_UPDATE_DEVICE_FLAGS: TGType;
begin
  GVIR_TYPE_DOMAIN_UPDATE_DEVICE_FLAGS := gvir_domain_update_device_flags_get_type;
end;

function GVIR_TYPE_DOMAIN_REBOOT_FLAGS: TGType;
begin
  GVIR_TYPE_DOMAIN_REBOOT_FLAGS := gvir_domain_reboot_flags_get_type;
end;

function GVIR_TYPE_DOMAIN_SNAPSHOT_LIST_FLAGS: TGType;
begin
  GVIR_TYPE_DOMAIN_SNAPSHOT_LIST_FLAGS := gvir_domain_snapshot_list_flags_get_type;
end;

function GVIR_TYPE_IP_ADDR_TYPE: TGType;
begin
  GVIR_TYPE_IP_ADDR_TYPE := gvir_ip_addr_type_get_type;
end;

function GVIR_TYPE_STORAGE_POOL_STATE: TGType;
begin
  GVIR_TYPE_STORAGE_POOL_STATE := gvir_storage_pool_state_get_type;
end;

function GVIR_TYPE_STORAGE_VOL_TYPE: TGType;
begin
  GVIR_TYPE_STORAGE_VOL_TYPE := gvir_storage_vol_type_get_type;
end;

function GVIR_TYPE_STORAGE_VOL_RESIZE_FLAGS: TGType;
begin
  GVIR_TYPE_STORAGE_VOL_RESIZE_FLAGS := gvir_storage_vol_resize_flags_get_type;
end;

function GVIR_TYPE_STREAM_IO_CONDITION: TGType;
begin
  GVIR_TYPE_STREAM_IO_CONDITION := gvir_stream_io_condition_get_type;
end;


end.
