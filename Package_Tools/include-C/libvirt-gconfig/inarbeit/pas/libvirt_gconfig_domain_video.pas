unit libvirt_gconfig_domain_video;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_domain_device;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainVideoPrivate = type Pointer;

  PGVirConfigDomainVideo = ^TGVirConfigDomainVideo;
  TGVirConfigDomainVideo = record
    parent: TGVirConfigDomainDevice;
    priv: PGVirConfigDomainVideoPrivate;
  end;

  PGVirConfigDomainVideoClass = ^TGVirConfigDomainVideoClass;
  TGVirConfigDomainVideoClass = record
    parent_class: TGVirConfigDomainDeviceClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirConfigDomainVideoModel = ^TGVirConfigDomainVideoModel;
  TGVirConfigDomainVideoModel = longint;
const
  GVIR_CONFIG_DOMAIN_VIDEO_MODEL_VGA = 0;
  GVIR_CONFIG_DOMAIN_VIDEO_MODEL_CIRRUS = 1;
  GVIR_CONFIG_DOMAIN_VIDEO_MODEL_VMVGA = 2;
  GVIR_CONFIG_DOMAIN_VIDEO_MODEL_XEN = 3;
  GVIR_CONFIG_DOMAIN_VIDEO_MODEL_VBOX = 4;
  GVIR_CONFIG_DOMAIN_VIDEO_MODEL_QXL = 5;
  GVIR_CONFIG_DOMAIN_VIDEO_MODEL_VIRTIO = 6;
  GVIR_CONFIG_DOMAIN_VIDEO_MODEL_BOCHS = 7;

function gvir_config_domain_video_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_video_new: PGVirConfigDomainVideo; cdecl; external libvirtgconfig;
function gvir_config_domain_video_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainVideo; cdecl; external libvirtgconfig;
function gvir_config_domain_video_get_model(video: PGVirConfigDomainVideo): TGVirConfigDomainVideoModel; cdecl; external libvirtgconfig;
procedure gvir_config_domain_video_set_model(video: PGVirConfigDomainVideo; model: TGVirConfigDomainVideoModel); cdecl; external libvirtgconfig;
procedure gvir_config_domain_video_set_vram(video: PGVirConfigDomainVideo; kbytes: Tguint); cdecl; external libvirtgconfig;
procedure gvir_config_domain_video_set_ram(video: PGVirConfigDomainVideo; kbytes: Tguint); cdecl; external libvirtgconfig;
procedure gvir_config_domain_video_set_vgamem(video: PGVirConfigDomainVideo; kbytes: Tguint); cdecl; external libvirtgconfig;
procedure gvir_config_domain_video_set_heads(video: PGVirConfigDomainVideo; head_count: Tguint); cdecl; external libvirtgconfig;
procedure gvir_config_domain_video_set_accel3d(video: PGVirConfigDomainVideo; accel3d: Tgboolean); cdecl; external libvirtgconfig;

// === Konventiert am: 18-10-26 12:49:29 ===

function GVIR_CONFIG_TYPE_DOMAIN_VIDEO: TGType;
function GVIR_CONFIG_DOMAIN_VIDEO(obj: Pointer): PGVirConfigDomainVideo;
function GVIR_CONFIG_DOMAIN_VIDEO_CLASS(klass: Pointer): PGVirConfigDomainVideoClass;
function GVIR_CONFIG_IS_DOMAIN_VIDEO(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_VIDEO_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_VIDEO_GET_CLASS(obj: Pointer): PGVirConfigDomainVideoClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_VIDEO: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_VIDEO := gvir_config_domain_video_get_type;
end;

function GVIR_CONFIG_DOMAIN_VIDEO(obj: Pointer): PGVirConfigDomainVideo;
begin
  Result := PGVirConfigDomainVideo(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_VIDEO));
end;

function GVIR_CONFIG_DOMAIN_VIDEO_CLASS(klass: Pointer): PGVirConfigDomainVideoClass;
begin
  Result := PGVirConfigDomainVideoClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_VIDEO));
end;

function GVIR_CONFIG_IS_DOMAIN_VIDEO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_VIDEO);
end;

function GVIR_CONFIG_IS_DOMAIN_VIDEO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_VIDEO);
end;

function GVIR_CONFIG_DOMAIN_VIDEO_GET_CLASS(obj: Pointer): PGVirConfigDomainVideoClass;
begin
  Result := PGVirConfigDomainVideoClass(PGTypeInstance(obj)^.g_class);
end;



end.
