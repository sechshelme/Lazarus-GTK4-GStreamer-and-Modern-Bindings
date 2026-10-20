unit vncaudioformat;

interface

uses
  fp_glib2, fp_gvnc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PVncAudioFormat = ^TVncAudioFormat;
  TVncAudioFormat = record
    format: Tguint8;
    nchannels: Tguint8;
    frequency: Tguint32;
  end;

type
  PVncAudioFormatType = ^TVncAudioFormatType;
  TVncAudioFormatType = longint;

const
  VNC_AUDIO_FORMAT_RAW_U8 = 0;
  VNC_AUDIO_FORMAT_RAW_S8 = 1;
  VNC_AUDIO_FORMAT_RAW_U16 = 2;
  VNC_AUDIO_FORMAT_RAW_S16 = 3;
  VNC_AUDIO_FORMAT_RAW_U32 = 4;
  VNC_AUDIO_FORMAT_RAW_S32 = 5;

function vnc_audio_format_get_type: TGType; cdecl; external libgvnc;
function vnc_audio_format_new: PVncAudioFormat; cdecl; external libgvnc;
function vnc_audio_format_copy(format: PVncAudioFormat): PVncAudioFormat; cdecl; external libgvnc;
procedure vnc_audio_format_free(format: PVncAudioFormat); cdecl; external libgvnc;

// === Konventiert am: 20-10-26 19:51:25 ===

function VNC_TYPE_AUDIO_FORMAT: TGType;

implementation

function VNC_TYPE_AUDIO_FORMAT: TGType;
begin
  VNC_TYPE_AUDIO_FORMAT := vnc_audio_format_get_type;
end;



end.
