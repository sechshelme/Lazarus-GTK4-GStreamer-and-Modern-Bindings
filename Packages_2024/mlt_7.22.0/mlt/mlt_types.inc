{$IFDEF read_interface}


const
  PATH_MAX = 4096;

type
  Pmlt_image_format = ^Tmlt_image_format;
  Tmlt_image_format = longint;
const
  mlt_image_none = 0;
  mlt_image_rgb = 1;
  mlt_image_rgba = 2;
  mlt_image_yuv422 = 3;
  mlt_image_yuv420p = 4;
  mlt_image_movit = 5;
  mlt_image_opengl_texture = 6;
  mlt_image_yuv422p16 = 7;
  mlt_image_yuv420p10 = 8;
  mlt_image_yuv444p10 = 9;
  mlt_image_invalid = 10;

type
  Pmlt_audio_format = ^Tmlt_audio_format;
  Tmlt_audio_format = longint;
const
  mlt_audio_none = 0;
  mlt_audio_s16 = 1;
  mlt_audio_s32 = 2;
  mlt_audio_float = 3;
  mlt_audio_s32le = 4;
  mlt_audio_f32le = 5;
  mlt_audio_u8 = 6;

type
  Pmlt_channel_layout = ^Tmlt_channel_layout;
  Tmlt_channel_layout = longint;
const
  mlt_channel_auto = 0;
  mlt_channel_independent = 1;
  mlt_channel_mono = 2;
  mlt_channel_stereo = 3;
  mlt_channel_2p1 = 4;
  mlt_channel_3p0 = 5;
  mlt_channel_3p0_back = 6;
  mlt_channel_4p0 = 7;
  mlt_channel_quad_back = 8;
  mlt_channel_quad_side = 9;
  mlt_channel_3p1 = 10;
  mlt_channel_5p0_back = 11;
  mlt_channel_5p0 = 12;
  mlt_channel_4p1 = 13;
  mlt_channel_5p1_back = 14;
  mlt_channel_5p1 = 15;
  mlt_channel_6p0 = 16;
  mlt_channel_6p0_front = 17;
  mlt_channel_hexagonal = 18;
  mlt_channel_6p1 = 19;
  mlt_channel_6p1_back = 20;
  mlt_channel_6p1_front = 21;
  mlt_channel_7p0 = 22;
  mlt_channel_7p0_front = 23;
  mlt_channel_7p1 = 24;
  mlt_channel_7p1_wide_side = 25;
  mlt_channel_7p1_wide_back = 26;

type
  Pmlt_colorspace = ^Tmlt_colorspace;
  Tmlt_colorspace = longint;
const
  mlt_colorspace_rgb = 0;
  mlt_colorspace_bt709 = 1;
  mlt_colorspace_unspecified = 2;
  mlt_colorspace_reserved = 3;
  mlt_colorspace_fcc = 4;
  mlt_colorspace_bt470bg = 5;
  mlt_colorspace_smpte170m = 6;
  mlt_colorspace_smpte240m = 7;
  mlt_colorspace_ycgco = 8;
  mlt_colorspace_bt2020_ncl = 9;
  mlt_colorspace_bt2020_cl = 10;
  mlt_colorspace_smpte2085 = 11;

type
  Pmlt_deinterlacer = ^Tmlt_deinterlacer;
  Tmlt_deinterlacer = longint;
const
  mlt_deinterlacer_none = 0;
  mlt_deinterlacer_onefield = 1;
  mlt_deinterlacer_linearblend = 2;
  mlt_deinterlacer_weave = 3;
  mlt_deinterlacer_bob = 4;
  mlt_deinterlacer_greedy = 5;
  mlt_deinterlacer_yadif_nospatial = 6;
  mlt_deinterlacer_yadif = 7;
  mlt_deinterlacer_bwdif = 8;
  mlt_deinterlacer_estdif = 9;
  mlt_deinterlacer_invalid = 10;

type
  Pmlt_time_format = ^Tmlt_time_format;
  Tmlt_time_format = longint;
const
  mlt_time_frames = 0;
  mlt_time_clock = 1;
  mlt_time_smpte_df = 2;
  mlt_time_smpte_ndf = 3;

type
  Pmlt_keyframe_type = ^Tmlt_keyframe_type;
  Tmlt_keyframe_type = longint;
const
  mlt_keyframe_discrete = 0;
  mlt_keyframe_linear = 1;
  mlt_keyframe_smooth = 2;
  mlt_keyframe_smooth_loose = mlt_keyframe_smooth;
  mlt_keyframe_smooth_natural = (mlt_keyframe_smooth) + 1;
  mlt_keyframe_smooth_tight = (mlt_keyframe_smooth) + 2;
  mlt_keyframe_sinusoidal_in = (mlt_keyframe_smooth) + 3;
  mlt_keyframe_sinusoidal_out = (mlt_keyframe_smooth) + 4;
  mlt_keyframe_sinusoidal_in_out = (mlt_keyframe_smooth) + 5;
  mlt_keyframe_quadratic_in = (mlt_keyframe_smooth) + 6;
  mlt_keyframe_quadratic_out = (mlt_keyframe_smooth) + 7;
  mlt_keyframe_quadratic_in_out = (mlt_keyframe_smooth) + 8;
  mlt_keyframe_cubic_in = (mlt_keyframe_smooth) + 9;
  mlt_keyframe_cubic_out = (mlt_keyframe_smooth) + 10;
  mlt_keyframe_cubic_in_out = (mlt_keyframe_smooth) + 11;
  mlt_keyframe_quartic_in = (mlt_keyframe_smooth) + 12;
  mlt_keyframe_quartic_out = (mlt_keyframe_smooth) + 13;
  mlt_keyframe_quartic_in_out = (mlt_keyframe_smooth) + 14;
  mlt_keyframe_quintic_in = (mlt_keyframe_smooth) + 15;
  mlt_keyframe_quintic_out = (mlt_keyframe_smooth) + 16;
  mlt_keyframe_quintic_in_out = (mlt_keyframe_smooth) + 17;
  mlt_keyframe_exponential_in = (mlt_keyframe_smooth) + 18;
  mlt_keyframe_exponential_out = (mlt_keyframe_smooth) + 19;
  mlt_keyframe_exponential_in_out = (mlt_keyframe_smooth) + 20;
  mlt_keyframe_circular_in = (mlt_keyframe_smooth) + 21;
  mlt_keyframe_circular_out = (mlt_keyframe_smooth) + 22;
  mlt_keyframe_circular_in_out = (mlt_keyframe_smooth) + 23;
  mlt_keyframe_back_in = (mlt_keyframe_smooth) + 24;
  mlt_keyframe_back_out = (mlt_keyframe_smooth) + 25;
  mlt_keyframe_back_in_out = (mlt_keyframe_smooth) + 26;
  mlt_keyframe_elastic_in = (mlt_keyframe_smooth) + 27;
  mlt_keyframe_elastic_out = (mlt_keyframe_smooth) + 28;
  mlt_keyframe_elastic_in_out = (mlt_keyframe_smooth) + 29;
  mlt_keyframe_bounce_in = (mlt_keyframe_smooth) + 30;
  mlt_keyframe_bounce_out = (mlt_keyframe_smooth) + 31;
  mlt_keyframe_bounce_in_out = (mlt_keyframe_smooth) + 32;

type
  Pmlt_whence = ^Tmlt_whence;
  Tmlt_whence = longint;
const
  mlt_whence_relative_start = 0;
  mlt_whence_relative_current = 1;
  mlt_whence_relative_end = 2;

type
  Pmlt_service_type = ^Tmlt_service_type;
  Tmlt_service_type = longint;
const
  mlt_service_invalid_type = 0;
  mlt_service_unknown_type = 1;
  mlt_service_producer_type = 2;
  mlt_service_tractor_type = 3;
  mlt_service_playlist_type = 4;
  mlt_service_multitrack_type = 5;
  mlt_service_filter_type = 6;
  mlt_service_transition_type = 7;
  mlt_service_consumer_type = 8;
  mlt_service_field_type = 9;
  mlt_service_link_type = 10;
  mlt_service_chain_type = 11;

type
  Pmlt_position = ^Tmlt_position;
  Tmlt_position = Tint32_t;

  Pmlt_rect = ^Tmlt_rect;
  Tmlt_rect = record
    x: double;
    y: double;
    w: double;
    h: double;
    o: double;
  end;

  Pmlt_color = ^Tmlt_color;
  Tmlt_color = record
    r: Tuint8_t;
    g: Tuint8_t;
    b: Tuint8_t;
    a: Tuint8_t;
  end;

  Pmlt_audio = ^Tmlt_audio;
  Tmlt_audio = type Pointer;

  Pmlt_image = ^Tmlt_image;
  Tmlt_image = type Pointer;

  Pmlt_frame = ^Tmlt_frame;
  Tmlt_frame = type Pointer;

  Tmlt_frame_ptr = ^Pmlt_frame;
  Pmlt_frame_ptr = Pmlt_frame;

  Pmlt_property = ^Tmlt_property;
  Tmlt_property = type Pointer;

  Pmlt_properties = ^Tmlt_properties;
  Tmlt_properties = type Pointer;

  Pmlt_event = ^Tmlt_event;
  Tmlt_event = type Pointer;

  Pmlt_service = ^Tmlt_service;
  Tmlt_service = type Pointer;

  Pmlt_producer = ^Tmlt_producer;
  Tmlt_producer = type Pointer;

  Pmlt_playlist = ^Tmlt_playlist;
  Tmlt_playlist = type Pointer;

  Pmlt_multitrack = ^Tmlt_multitrack;
  Tmlt_multitrack = type Pointer;

  Pmlt_filter = ^Tmlt_filter;
  Tmlt_filter = type Pointer;

  Pmlt_transition = ^Tmlt_transition;
  Tmlt_transition = type Pointer;

  Pmlt_tractor = ^Tmlt_tractor;
  Tmlt_tractor = type Pointer;

  Pmlt_field = ^Tmlt_field;
  Tmlt_field = type Pointer;

  Pmlt_consumer = ^Tmlt_consumer;
  Tmlt_consumer = type Pointer;

  Pmlt_parser = ^Tmlt_parser;
  Tmlt_parser = type Pointer;

  Pmlt_deque = ^Tmlt_deque;
  Tmlt_deque = type Pointer;

  Pmlt_geometry = ^Tmlt_geometry;
  Tmlt_geometry = type Pointer;

  Pmlt_geometry_item = ^Tmlt_geometry_item;
  Tmlt_geometry_item = type Pointer;

  Pmlt_profile = ^Tmlt_profile;
  Tmlt_profile = type Pointer;

  Pmlt_repository = ^Tmlt_repository;
  Tmlt_repository = type Pointer;

  Pmlt_cache = ^Tmlt_cache;
  Tmlt_cache = type Pointer;

  Pmlt_cache_item = ^Tmlt_cache_item;
  Tmlt_cache_item = type Pointer;

  Pmlt_animation = ^Tmlt_animation;
  Tmlt_animation = type Pointer;

  Pmlt_slices = ^Tmlt_slices;
  Tmlt_slices = type Pointer;

  Pmlt_link = ^Tmlt_link;
  Tmlt_link = type Pointer;

  Pmlt_chain = ^Tmlt_chain;
  Tmlt_chain = type Pointer;

  Tmlt_destructor = procedure(para1: pointer); cdecl;
  Tmlt_serialiser = function(para1: pointer; length: longint): pchar; cdecl;
  Tmlt_thread_function_t = function(para1: pointer): pointer; cdecl;

function MLT_SERVICE(x: Pointer): Pmlt_service;
function MLT_PRODUCER(x: Pointer): Pmlt_producer;
function MLT_MULTITRACK(x: Pointer): Pmlt_multitrack;
function MLT_PLAYLIST(x: Pointer): Pmlt_playlist;
function MLT_TRACTOR(x: Pointer): Pmlt_tractor;
function MLT_FILTER(x: Pointer): Pmlt_filter;
function MLT_TRANSITION(x: Pointer): Pmlt_transition;
function MLT_CONSUMER(x: Pointer): Pmlt_consumer;
function MLT_FRAME(x: Pointer): Pmlt_frame;
function MLT_LINK(x: Pointer): Pmlt_link;
function MLT_CHAIN(x: Pointer): Pmlt_chain;

{$ifdef windows}
function usleep(useconds: dword): longint; cdecl; external libmlt;
function nanosleep(rqtp: Ptimespec; rmtp: Ptimespec): longint; cdecl; external libmlt;

function setenv(name: pchar; value: pchar; overwrite: longint): longint; cdecl; external libmlt;
function getlocale: pchar; cdecl; external libmlt;
function win32_fopen(filename_utf8: pchar; mode_utf8: pchar): PFILE; cdecl; external libmlt;

function strptime(buf: pchar; fmt: pchar; tm: Ptm): pchar; cdecl; external libmlt;
{$endif}

function mlt_deinterlacer_name(method: Tmlt_deinterlacer): pchar; cdecl; external libmlt;
function mlt_deinterlacer_id(name: pchar): Tmlt_deinterlacer; cdecl; external libmlt;

// === Konventiert am: 30-9-26 19:44:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function MLT_SERVICE(x: Pointer): Pmlt_service;
begin
  MLT_SERVICE := Pmlt_service(x);
end;

function MLT_PRODUCER(x: Pointer): Pmlt_producer;
begin
  MLT_PRODUCER := Pmlt_producer(x);
end;

function MLT_MULTITRACK(x: Pointer): Pmlt_multitrack;
begin
  MLT_MULTITRACK := Pmlt_multitrack(x);
end;

function MLT_PLAYLIST(x: Pointer): Pmlt_playlist;
begin
  MLT_PLAYLIST := Pmlt_playlist(x);
end;

function MLT_TRACTOR(x: Pointer): Pmlt_tractor;
begin
  MLT_TRACTOR := Pmlt_tractor(x);
end;

function MLT_FILTER(x: Pointer): Pmlt_filter;
begin
  MLT_FILTER := Pmlt_filter(x);
end;

function MLT_TRANSITION(x: Pointer): Pmlt_transition;
begin
  MLT_TRANSITION := Pmlt_transition(x);
end;

function MLT_CONSUMER(x: Pointer): Pmlt_consumer;
begin
  MLT_CONSUMER := Pmlt_consumer(x);
end;

function MLT_FRAME(x: Pointer): Pmlt_frame;
begin
  MLT_FRAME := Pmlt_frame(x);
end;

function MLT_LINK(x: Pointer): Pmlt_link;
begin
  MLT_LINK := Pmlt_link(x);
end;

function MLT_CHAIN(x: Pointer): Pmlt_chain;
begin
  MLT_CHAIN := Pmlt_chain(x);
end;

{$ENDIF read_implementation}
