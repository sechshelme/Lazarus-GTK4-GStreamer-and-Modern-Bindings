unit libvirt_gconfig_enum_types;

interface

uses
  fp_glib2, fp_virtgconfig;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gvir_config_domain_audio_backend_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_AUDIO_BACKEND: TGType;

function gvir_config_domain_channel_target_type_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_CHANNEL_TARGET_TYPE: TGType;

function gvir_config_domain_clock_offset_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_CLOCK_OFFSET: TGType;

function gvir_config_domain_console_target_type_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_CONSOLE_TARGET_TYPE: TGType;

function gvir_config_domain_controller_usb_model_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER_USB_MODEL: TGType;

function gvir_config_domain_cpu_feature_policy_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_CPU_FEATURE_POLICY: TGType;

function gvir_config_domain_cpu_match_policy_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_CPU_MATCH_POLICY: TGType;

function gvir_config_domain_cpu_mode_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_CPU_MODE: TGType;

function gvir_config_domain_disk_cache_type_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_DISK_CACHE_TYPE: TGType;

function gvir_config_domain_disk_format_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_DISK_FORMAT: TGType;

function gvir_config_domain_disk_driver_error_policy_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER_ERROR_POLICY: TGType;

function gvir_config_domain_disk_driver_io_policy_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER_IO_POLICY: TGType;

function gvir_config_domain_disk_driver_discard_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER_DISCARD: TGType;

function gvir_config_domain_disk_type_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_DISK_TYPE: TGType;

function gvir_config_domain_disk_bus_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_DISK_BUS: TGType;

function gvir_config_domain_disk_guest_device_type_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_DISK_GUEST_DEVICE_TYPE: TGType;

function gvir_config_domain_disk_snapshot_type_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_DISK_SNAPSHOT_TYPE: TGType;

function gvir_config_domain_disk_startup_policy_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_DISK_STARTUP_POLICY: TGType;

function gvir_config_domain_filesys_type_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_FILESYS_TYPE: TGType;

function gvir_config_domain_filesys_access_type_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_FILESYS_ACCESS_TYPE: TGType;

function gvir_config_domain_filesys_driver_type_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_FILESYS_DRIVER_TYPE: TGType;

function gvir_config_domain_graphics_spice_image_compression_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION: TGType;

function gvir_config_domain_input_device_type_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_INPUT_DEVICE_TYPE: TGType;

function gvir_config_domain_input_bus_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_INPUT_BUS: TGType;

function gvir_config_domain_interface_link_state_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_LINK_STATE: TGType;

function gvir_config_domain_memballoon_model_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON_MODEL: TGType;

function gvir_config_domain_os_type_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_OS_TYPE: TGType;

function gvir_config_domain_os_sm_bios_mode_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_OS_SM_BIOS_MODE: TGType;

function gvir_config_domain_os_boot_device_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_OS_BOOT_DEVICE: TGType;

function gvir_config_domain_os_firmware_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_OS_FIRMWARE: TGType;

function gvir_config_domain_redirdev_bus_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_REDIRDEV_BUS: TGType;

function gvir_config_domain_seclabel_type_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_SECLABEL_TYPE: TGType;

function gvir_config_domain_snapshot_domain_state_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_DOMAIN_STATE: TGType;

function gvir_config_domain_snapshot_memory_state_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_MEMORY_STATE: TGType;

function gvir_config_domain_sound_model_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_SOUND_MODEL: TGType;

function gvir_config_domain_timer_tick_policy_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_TIMER_TICK_POLICY: TGType;

function gvir_config_domain_video_model_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_VIDEO_MODEL: TGType;

function gvir_config_domain_virt_type_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_VIRT_TYPE: TGType;

function gvir_config_domain_lifecycle_event_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_LIFECYCLE_EVENT: TGType;

function gvir_config_domain_lifecycle_action_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_DOMAIN_LIFECYCLE_ACTION: TGType;

function gvir_config_storage_pool_type_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_STORAGE_POOL_TYPE: TGType;

function gvir_config_storage_vol_target_features_get_type: TGType; cdecl; external libvirtgconfig;
function GVIR_CONFIG_TYPE_STORAGE_VOL_TARGET_FEATURES: TGType;


// === Konventiert am: 18-10-26 12:49:21 ===


implementation


function GVIR_CONFIG_TYPE_DOMAIN_AUDIO_BACKEND: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_AUDIO_BACKEND := gvir_config_domain_audio_backend_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_CHANNEL_TARGET_TYPE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CHANNEL_TARGET_TYPE := gvir_config_domain_channel_target_type_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_CLOCK_OFFSET: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CLOCK_OFFSET := gvir_config_domain_clock_offset_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_CONSOLE_TARGET_TYPE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CONSOLE_TARGET_TYPE := gvir_config_domain_console_target_type_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER_USB_MODEL: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CONTROLLER_USB_MODEL := gvir_config_domain_controller_usb_model_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_CPU_FEATURE_POLICY: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CPU_FEATURE_POLICY := gvir_config_domain_cpu_feature_policy_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_CPU_MATCH_POLICY: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CPU_MATCH_POLICY := gvir_config_domain_cpu_match_policy_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_CPU_MODE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_CPU_MODE := gvir_config_domain_cpu_mode_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_DISK_CACHE_TYPE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_DISK_CACHE_TYPE := gvir_config_domain_disk_cache_type_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_DISK_FORMAT: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_DISK_FORMAT := gvir_config_domain_disk_format_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER_ERROR_POLICY: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER_ERROR_POLICY := gvir_config_domain_disk_driver_error_policy_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER_IO_POLICY: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER_IO_POLICY := gvir_config_domain_disk_driver_io_policy_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER_DISCARD: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_DISK_DRIVER_DISCARD := gvir_config_domain_disk_driver_discard_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_DISK_TYPE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_DISK_TYPE := gvir_config_domain_disk_type_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_DISK_BUS: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_DISK_BUS := gvir_config_domain_disk_bus_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_DISK_GUEST_DEVICE_TYPE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_DISK_GUEST_DEVICE_TYPE := gvir_config_domain_disk_guest_device_type_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_DISK_SNAPSHOT_TYPE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_DISK_SNAPSHOT_TYPE := gvir_config_domain_disk_snapshot_type_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_DISK_STARTUP_POLICY: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_DISK_STARTUP_POLICY := gvir_config_domain_disk_startup_policy_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_FILESYS_TYPE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_FILESYS_TYPE := gvir_config_domain_filesys_type_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_FILESYS_ACCESS_TYPE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_FILESYS_ACCESS_TYPE := gvir_config_domain_filesys_access_type_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_FILESYS_DRIVER_TYPE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_FILESYS_DRIVER_TYPE := gvir_config_domain_filesys_driver_type_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_GRAPHICS_SPICE_IMAGE_COMPRESSION := gvir_config_domain_graphics_spice_image_compression_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_INPUT_DEVICE_TYPE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_INPUT_DEVICE_TYPE := gvir_config_domain_input_device_type_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_INPUT_BUS: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_INPUT_BUS := gvir_config_domain_input_bus_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_LINK_STATE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_INTERFACE_LINK_STATE := gvir_config_domain_interface_link_state_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON_MODEL: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_MEMBALLOON_MODEL := gvir_config_domain_memballoon_model_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_OS_TYPE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_OS_TYPE := gvir_config_domain_os_type_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_OS_SM_BIOS_MODE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_OS_SM_BIOS_MODE := gvir_config_domain_os_sm_bios_mode_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_OS_BOOT_DEVICE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_OS_BOOT_DEVICE := gvir_config_domain_os_boot_device_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_OS_FIRMWARE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_OS_FIRMWARE := gvir_config_domain_os_firmware_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_REDIRDEV_BUS: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_REDIRDEV_BUS := gvir_config_domain_redirdev_bus_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_SECLABEL_TYPE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_SECLABEL_TYPE := gvir_config_domain_seclabel_type_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_DOMAIN_STATE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_DOMAIN_STATE := gvir_config_domain_snapshot_domain_state_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_MEMORY_STATE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_SNAPSHOT_MEMORY_STATE := gvir_config_domain_snapshot_memory_state_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_SOUND_MODEL: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_SOUND_MODEL := gvir_config_domain_sound_model_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_TIMER_TICK_POLICY: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_TIMER_TICK_POLICY := gvir_config_domain_timer_tick_policy_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_VIDEO_MODEL: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_VIDEO_MODEL := gvir_config_domain_video_model_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_VIRT_TYPE: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_VIRT_TYPE := gvir_config_domain_virt_type_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_LIFECYCLE_EVENT: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_LIFECYCLE_EVENT := gvir_config_domain_lifecycle_event_get_type;
end;

function GVIR_CONFIG_TYPE_DOMAIN_LIFECYCLE_ACTION: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_LIFECYCLE_ACTION := gvir_config_domain_lifecycle_action_get_type;
end;

function GVIR_CONFIG_TYPE_STORAGE_POOL_TYPE: TGType;
begin
  GVIR_CONFIG_TYPE_STORAGE_POOL_TYPE := gvir_config_storage_pool_type_get_type;
end;

function GVIR_CONFIG_TYPE_STORAGE_VOL_TARGET_FEATURES: TGType;
begin
  GVIR_CONFIG_TYPE_STORAGE_VOL_TARGET_FEATURES := gvir_config_storage_vol_target_features_get_type;
end;


end.
