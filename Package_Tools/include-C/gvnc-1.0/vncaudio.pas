unit vncaudio;

interface

uses
  fp_glib2, fp_gvnc, vncaudioformat, vncaudiosample;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PVncAudio = type Pointer;

  PVncAudioInterface = ^TVncAudioInterface;
  TVncAudioInterface = record
    parent: TGTypeInterface;
    playback_start: function(audio: PVncAudio; format: PVncAudioFormat): Tgboolean; cdecl;
    playback_stop: function(audio: PVncAudio): Tgboolean; cdecl;
    playback_data: function(audio: PVncAudio; sample: PVncAudioSample): Tgboolean; cdecl;
  end;

function vnc_audio_get_type: TGType; cdecl; external libgvnc;
procedure vnc_audio_playback_start(aud: PVncAudio; format: PVncAudioFormat); cdecl; external libgvnc;
procedure vnc_audio_playback_stop(aud: PVncAudio); cdecl; external libgvnc;
procedure vnc_audio_playback_data(aud: PVncAudio; sample: PVncAudioSample); cdecl; external libgvnc;

// === Konventiert am: 20-10-26 19:51:34 ===

function VNC_TYPE_AUDIO: TGType;
function VNC_AUDIO(obj: Pointer): PVncAudio;
function VNC_IS_AUDIO(obj: Pointer): Tgboolean;
function VNC_AUDIO_GET_INTERFACE(obj: Pointer): PVncAudioInterface;

implementation

function VNC_TYPE_AUDIO: TGType;
begin
  VNC_TYPE_AUDIO := vnc_audio_get_type;
end;

function VNC_AUDIO(obj: Pointer): PVncAudio;
begin
  Result := PVncAudio(g_type_check_instance_cast(obj, VNC_TYPE_AUDIO));
end;

function VNC_IS_AUDIO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VNC_TYPE_AUDIO);
end;

function VNC_AUDIO_GET_INTERFACE(obj: Pointer): PVncAudioInterface;
begin
  Result := g_type_interface_peek(obj, VNC_TYPE_AUDIO);
end;



end.
