unit fp_vncaudiopulse;

interface

uses
  fp_glib2, fp_gvnc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PVncAudioPulsePrivate = type Pointer;

  PVncAudioPulse = ^TVncAudioPulse;
  TVncAudioPulse = record
    parent: TVncBaseAudio;
    priv: PVncAudioPulsePrivate;
  end;

  PVncAudioPulseClass = ^TVncAudioPulseClass;
  TVncAudioPulseClass = record
    parent_class: TVncBaseAudioClass;
  end;

function vnc_audio_pulse_get_type: TGType; cdecl; external libgvncpulse;
function vnc_audio_pulse_new: PVncAudioPulse; cdecl; external libgvncpulse;

// === Konventiert am: 21-10-26 15:34:18 ===

function VNC_TYPE_AUDIO_PULSE: TGType;
function VNC_AUDIO_PULSE(obj: Pointer): PVncAudioPulse;
function VNC_AUDIO_PULSE_CLASS(klass: Pointer): PVncAudioPulseClass;
function VNC_IS_AUDIO_PULSE(obj: Pointer): Tgboolean;
function VNC_IS_AUDIO_PULSE_CLASS(klass: Pointer): Tgboolean;
function VNC_AUDIO_PULSE_GET_CLASS(obj: Pointer): PVncAudioPulseClass;

implementation

function VNC_TYPE_AUDIO_PULSE: TGType;
begin
  VNC_TYPE_AUDIO_PULSE := vnc_audio_pulse_get_type;
end;

function VNC_AUDIO_PULSE(obj: Pointer): PVncAudioPulse;
begin
  Result := PVncAudioPulse(g_type_check_instance_cast(obj, VNC_TYPE_AUDIO_PULSE));
end;

function VNC_AUDIO_PULSE_CLASS(klass: Pointer): PVncAudioPulseClass;
begin
  Result := PVncAudioPulseClass(g_type_check_class_cast(klass, VNC_TYPE_AUDIO_PULSE));
end;

function VNC_IS_AUDIO_PULSE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VNC_TYPE_AUDIO_PULSE);
end;

function VNC_IS_AUDIO_PULSE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VNC_TYPE_AUDIO_PULSE);
end;

function VNC_AUDIO_PULSE_GET_CLASS(obj: Pointer): PVncAudioPulseClass;
begin
  Result := PVncAudioPulseClass(PGTypeInstance(obj)^.g_class);
end;



end.
