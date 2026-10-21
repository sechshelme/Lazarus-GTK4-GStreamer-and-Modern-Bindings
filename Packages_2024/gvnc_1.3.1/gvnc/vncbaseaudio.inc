{$IFDEF read_interface}


type
  PVncBaseAudioPrivate = type Pointer;

  PVncBaseAudio = ^TVncBaseAudio;
  TVncBaseAudio = record
    parent: TGObject;
    priv: PVncBaseAudioPrivate;
  end;

  PVncBaseAudioClass = ^TVncBaseAudioClass;
  TVncBaseAudioClass = record
    parent_class: TGObjectClass;
    playback_start: function(audio: PVncBaseAudio; format: PVncAudioFormat): Tgboolean; cdecl;
    playback_stop: function(audio: PVncBaseAudio): Tgboolean; cdecl;
    playback_data: function(audio: PVncBaseAudio; sample: PVncAudioSample): Tgboolean; cdecl;
  end;

function vnc_base_audio_get_type: TGType; cdecl; external libgvnc;
function vnc_base_audio_new: PVncBaseAudio; cdecl; external libgvnc;

// === Konventiert am: 20-10-26 19:51:13 ===

function VNC_TYPE_BASE_AUDIO: TGType;
function VNC_BASE_AUDIO(obj: Pointer): PVncBaseAudio;
function VNC_BASE_AUDIO_CLASS(klass: Pointer): PVncBaseAudioClass;
function VNC_IS_BASE_AUDIO(obj: Pointer): Tgboolean;
function VNC_IS_BASE_AUDIO_CLASS(klass: Pointer): Tgboolean;
function VNC_BASE_AUDIO_GET_CLASS(obj: Pointer): PVncBaseAudioClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function VNC_TYPE_BASE_AUDIO: TGType;
begin
  VNC_TYPE_BASE_AUDIO := vnc_base_audio_get_type;
end;

function VNC_BASE_AUDIO(obj: Pointer): PVncBaseAudio;
begin
  Result := PVncBaseAudio(g_type_check_instance_cast(obj, VNC_TYPE_BASE_AUDIO));
end;

function VNC_BASE_AUDIO_CLASS(klass: Pointer): PVncBaseAudioClass;
begin
  Result := PVncBaseAudioClass(g_type_check_class_cast(klass, VNC_TYPE_BASE_AUDIO));
end;

function VNC_IS_BASE_AUDIO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VNC_TYPE_BASE_AUDIO);
end;

function VNC_IS_BASE_AUDIO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VNC_TYPE_BASE_AUDIO);
end;

function VNC_BASE_AUDIO_GET_CLASS(obj: Pointer): PVncBaseAudioClass;
begin
  Result := PVncBaseAudioClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
