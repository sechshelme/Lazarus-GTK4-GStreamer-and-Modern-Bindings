unit vncaudiosample;

interface

uses
  fp_glib2, fp_gvnc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PVncAudioSample = ^TVncAudioSample;
  TVncAudioSample = record
    data: Pguint8;
    length: Tguint32;
    capacity: Tguint32;
  end;

function vnc_audio_sample_get_type: TGType; cdecl; external libgvnc;
function vnc_audio_sample_new(capacity: Tguint32): PVncAudioSample; cdecl; external libgvnc;
function vnc_audio_sample_copy(sample: PVncAudioSample): PVncAudioSample; cdecl; external libgvnc;
procedure vnc_audio_sample_free(sample: PVncAudioSample); cdecl; external libgvnc;

// === Konventiert am: 20-10-26 19:51:20 ===

function VNC_TYPE_AUDIO_SAMPLE: TGType;

implementation

function VNC_TYPE_AUDIO_SAMPLE: TGType;
begin
  VNC_TYPE_AUDIO_SAMPLE := vnc_audio_sample_get_type;
end;



end.
