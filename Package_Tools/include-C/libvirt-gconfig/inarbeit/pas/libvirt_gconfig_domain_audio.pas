unit libvirt_gconfig_domain_audio;

interface

uses
  fp_glib2, fp_virtgconfig, libvirt_gconfig_domain_device;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGVirConfigDomainAudioPrivate = type Pointer;

  PGVirConfigDomainAudio = ^TGVirConfigDomainAudio;
  TGVirConfigDomainAudio = record
    parent: TGVirConfigDomainDevice;
    priv: PGVirConfigDomainAudioPrivate;
  end;

  PGVirConfigDomainAudioClass = ^TGVirConfigDomainAudioClass;
  TGVirConfigDomainAudioClass = record
    parent_class: TGVirConfigDomainDeviceClass;
    padding: array[0..19] of Tgpointer;
  end;

type
  PGVirConfigDomainAudioBackend = ^TGVirConfigDomainAudioBackend;
  TGVirConfigDomainAudioBackend = longint;
const
  GVIR_CONFIG_DOMAIN_AUDIO_BACKEND_NONE = 0;
  GVIR_CONFIG_DOMAIN_AUDIO_BACKEND_ALSA = 1;
  GVIR_CONFIG_DOMAIN_AUDIO_BACKEND_COREAUDIO = 2;
  GVIR_CONFIG_DOMAIN_AUDIO_BACKEND_JACK = 3;
  GVIR_CONFIG_DOMAIN_AUDIO_BACKEND_OSS = 4;
  GVIR_CONFIG_DOMAIN_AUDIO_BACKEND_PULSEAUDIO = 5;
  GVIR_CONFIG_DOMAIN_AUDIO_BACKEND_SDL = 6;
  GVIR_CONFIG_DOMAIN_AUDIO_BACKEND_SPICE = 7;
  GVIR_CONFIG_DOMAIN_AUDIO_BACKEND_FILE = 8;

function gvir_config_domain_audio_get_type: TGType; cdecl; external libvirtgconfig;
function gvir_config_domain_audio_new: PGVirConfigDomainAudio; cdecl; external libvirtgconfig;
function gvir_config_domain_audio_new_from_xml(xml: Pgchar; error: PPGError): PGVirConfigDomainAudio; cdecl; external libvirtgconfig;
procedure gvir_config_domain_audio_set_backend(audio: PGVirConfigDomainAudio; backend: TGVirConfigDomainAudioBackend); cdecl; external libvirtgconfig;
procedure gvir_config_domain_audio_set_server_name(audio: PGVirConfigDomainAudio; server_name: Pgchar); cdecl; external libvirtgconfig;

// === Konventiert am: 17-10-26 19:56:11 ===

function GVIR_CONFIG_TYPE_DOMAIN_AUDIO: TGType;
function GVIR_CONFIG_DOMAIN_AUDIO(obj: Pointer): PGVirConfigDomainAudio;
function GVIR_CONFIG_DOMAIN_AUDIO_CLASS(klass: Pointer): PGVirConfigDomainAudioClass;
function GVIR_CONFIG_IS_DOMAIN_AUDIO(obj: Pointer): Tgboolean;
function GVIR_CONFIG_IS_DOMAIN_AUDIO_CLASS(klass: Pointer): Tgboolean;
function GVIR_CONFIG_DOMAIN_AUDIO_GET_CLASS(obj: Pointer): PGVirConfigDomainAudioClass;

implementation

function GVIR_CONFIG_TYPE_DOMAIN_AUDIO: TGType;
begin
  GVIR_CONFIG_TYPE_DOMAIN_AUDIO := gvir_config_domain_audio_get_type;
end;

function GVIR_CONFIG_DOMAIN_AUDIO(obj: Pointer): PGVirConfigDomainAudio;
begin
  Result := PGVirConfigDomainAudio(g_type_check_instance_cast(obj, GVIR_CONFIG_TYPE_DOMAIN_AUDIO));
end;

function GVIR_CONFIG_DOMAIN_AUDIO_CLASS(klass: Pointer): PGVirConfigDomainAudioClass;
begin
  Result := PGVirConfigDomainAudioClass(g_type_check_class_cast(klass, GVIR_CONFIG_TYPE_DOMAIN_AUDIO));
end;

function GVIR_CONFIG_IS_DOMAIN_AUDIO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GVIR_CONFIG_TYPE_DOMAIN_AUDIO);
end;

function GVIR_CONFIG_IS_DOMAIN_AUDIO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GVIR_CONFIG_TYPE_DOMAIN_AUDIO);
end;

function GVIR_CONFIG_DOMAIN_AUDIO_GET_CLASS(obj: Pointer): PGVirConfigDomainAudioClass;
begin
  Result := PGVirConfigDomainAudioClass(PGTypeInstance(obj)^.g_class);
end;



end.
