unit mlt_profile;

interface

uses
  fp_mlt, mlt_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pmlt_profile_s = ^Tmlt_profile_s;
  Tmlt_profile_s = record
    description: pchar;
    frame_rate_num: longint;
    frame_rate_den: longint;
    width: longint;
    height: longint;
    progressive: longint;
    sample_aspect_num: longint;
    sample_aspect_den: longint;
    display_aspect_num: longint;
    display_aspect_den: longint;
    colorspace: longint;
    is_explicit: longint;
  end;

function mlt_profile_init(name: pchar): Tmlt_profile; cdecl; external libmlt;
function mlt_profile_load_file(file_: pchar): Tmlt_profile; cdecl; external libmlt;
function mlt_profile_load_properties(properties: Tmlt_properties): Tmlt_profile; cdecl; external libmlt;
function mlt_profile_load_string(_string: pchar): Tmlt_profile; cdecl; external libmlt;
function mlt_profile_fps(profile: Tmlt_profile): double; cdecl; external libmlt;
function mlt_profile_sar(profile: Tmlt_profile): double; cdecl; external libmlt;
function mlt_profile_dar(profile: Tmlt_profile): double; cdecl; external libmlt;
procedure mlt_profile_close(profile: Tmlt_profile); cdecl; external libmlt;
function mlt_profile_clone(profile: Tmlt_profile): Tmlt_profile; cdecl; external libmlt;
function mlt_profile_list: Tmlt_properties; cdecl; external libmlt;
procedure mlt_profile_from_producer(profile: Tmlt_profile; producer: Tmlt_producer); cdecl; external libmlt;
function mlt_profile_lumas_dir(profile: Tmlt_profile): pchar; cdecl; external libmlt;
function mlt_profile_scale_width(profile: Tmlt_profile; width: longint): double; cdecl; external libmlt;
function mlt_profile_scale_height(profile: Tmlt_profile; height: longint): double; cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:35:55 ===


implementation



end.
