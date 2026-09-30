
unit mlt_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from mlt_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mlt_types.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PFILE  = ^FILE;
Pmlt_animation  = ^mlt_animation;
Pmlt_animation_s  = ^mlt_animation_s;
Pmlt_audio  = ^mlt_audio;
Pmlt_audio_format  = ^mlt_audio_format;
Pmlt_audio_s  = ^mlt_audio_s;
Pmlt_cache  = ^mlt_cache;
Pmlt_cache_item  = ^mlt_cache_item;
Pmlt_cache_item_s  = ^mlt_cache_item_s;
Pmlt_cache_s  = ^mlt_cache_s;
Pmlt_chain  = ^mlt_chain;
Pmlt_chain_s  = ^mlt_chain_s;
Pmlt_channel_layout  = ^mlt_channel_layout;
Pmlt_color  = ^mlt_color;
Pmlt_colorspace  = ^mlt_colorspace;
Pmlt_consumer  = ^mlt_consumer;
Pmlt_consumer_s  = ^mlt_consumer_s;
Pmlt_deinterlacer  = ^mlt_deinterlacer;
Pmlt_deque  = ^mlt_deque;
Pmlt_deque_s  = ^mlt_deque_s;
Pmlt_event  = ^mlt_event;
Pmlt_event_struct  = ^mlt_event_struct;
Pmlt_field  = ^mlt_field;
Pmlt_field_s  = ^mlt_field_s;
Pmlt_filter  = ^mlt_filter;
Pmlt_filter_s  = ^mlt_filter_s;
Pmlt_frame  = ^mlt_frame;
Pmlt_frame_ptr  = ^mlt_frame_ptr;
Pmlt_frame_s  = ^mlt_frame_s;
Pmlt_geometry  = ^mlt_geometry;
Pmlt_geometry_item  = ^mlt_geometry_item;
Pmlt_geometry_item_s  = ^mlt_geometry_item_s;
Pmlt_geometry_s  = ^mlt_geometry_s;
Pmlt_image  = ^mlt_image;
Pmlt_image_format  = ^mlt_image_format;
Pmlt_image_s  = ^mlt_image_s;
Pmlt_keyframe_type  = ^mlt_keyframe_type;
Pmlt_link  = ^mlt_link;
Pmlt_link_s  = ^mlt_link_s;
Pmlt_multitrack  = ^mlt_multitrack;
Pmlt_multitrack_s  = ^mlt_multitrack_s;
Pmlt_parser  = ^mlt_parser;
Pmlt_parser_s  = ^mlt_parser_s;
Pmlt_playlist  = ^mlt_playlist;
Pmlt_playlist_s  = ^mlt_playlist_s;
Pmlt_position  = ^mlt_position;
Pmlt_producer  = ^mlt_producer;
Pmlt_producer_s  = ^mlt_producer_s;
Pmlt_profile  = ^mlt_profile;
Pmlt_profile_s  = ^mlt_profile_s;
Pmlt_properties  = ^mlt_properties;
Pmlt_properties_s  = ^mlt_properties_s;
Pmlt_property  = ^mlt_property;
Pmlt_property_s  = ^mlt_property_s;
Pmlt_rect  = ^mlt_rect;
Pmlt_repository  = ^mlt_repository;
Pmlt_repository_s  = ^mlt_repository_s;
Pmlt_serialiser  = ^mlt_serialiser;
Pmlt_service  = ^mlt_service;
Pmlt_service_s  = ^mlt_service_s;
Pmlt_service_type  = ^mlt_service_type;
Pmlt_slices  = ^mlt_slices;
Pmlt_slices_s  = ^mlt_slices_s;
Pmlt_thread_function_t  = ^mlt_thread_function_t;
Pmlt_time_format  = ^mlt_time_format;
Pmlt_tractor  = ^mlt_tractor;
Pmlt_tractor_s  = ^mlt_tractor_s;
Pmlt_transition  = ^mlt_transition;
Pmlt_transition_s  = ^mlt_transition_s;
Pmlt_whence  = ^mlt_whence;
Ptimespec  = ^timespec;
Ptm  = ^tm;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_types.h
 * \brief Provides forward definitions of all public types
 *
 * Copyright (C) 2003-2023 Meltytech, LLC
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
  }
{$ifndef MLT_TYPES_H}
{$define MLT_TYPES_H}
{ C++ extern C conditionnal removed }
{$include "mlt_pool.h"}
{$include <inttypes.h>}
{$include <limits.h>}
{$include <stdio.h>}
{$ifndef PATH_MAX}

const
  PATH_MAX = 4096;  
{$endif}
{* The set of supported image formats  }
{*< image not available  }
{*< 8-bit RGB  }
{*< 8-bit RGB with alpha channel  }
{*< 8-bit YUV 4:2:2 packed  }
{*< 8-bit YUV 4:2:0 planar  }
{*< for movit module internal use only  }
{*< an OpenGL texture name  }
{*< planar YUV 4:2:2, 32bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian  }
{*< planar YUV 4:2:0, 15bpp, (1 Cr & Cb sample per 2x2 Y samples), little-endian  }
{*< planar YUV 4:4:4, 30bpp, (1 Cr & Cb sample per 1x1 Y samples), little-endian  }
type
  Pmlt_image_format = ^Tmlt_image_format;
  Tmlt_image_format =  Longint;
  Const
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
;
{* The set of supported audio formats  }
{*< audio not available  }
{*< signed 16-bit interleaved PCM  }
{*< signed 32-bit non-interleaved PCM  }
{*< 32-bit non-interleaved floating point  }
{*< signed 32-bit interleaved PCM  }
{*< 32-bit interleaved floating point  }
{*< unsigned 8-bit interleaved PCM  }
type
  Pmlt_audio_format = ^Tmlt_audio_format;
  Tmlt_audio_format =  Longint;
  Const
    mlt_audio_none = 0;
    mlt_audio_s16 = 1;
    mlt_audio_s32 = 2;
    mlt_audio_float = 3;
    mlt_audio_s32le = 4;
    mlt_audio_f32le = 5;
    mlt_audio_u8 = 6;
;
{*< MLT will determine the default configuration based on channel number  }
{*< channels are not related  }
type
  Pmlt_channel_layout = ^Tmlt_channel_layout;
  Tmlt_channel_layout =  Longint;
  Const
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
;
{* Colorspace definitions  }
{/< order of coefficients is actually GBR, also IEC 61966-2-1 (sRGB) }
{/< also ITU-R BT1361 / IEC 61966-2-4 xvYCC709 / SMPTE RP177 Annex B }
{/< FCC Title 47 Code of Federal Regulations 73.682 (a)(20) }
{/< also ITU-R BT601-6 625 / ITU-R BT1358 625 / ITU-R BT1700 625 PAL & SECAM / IEC 61966-2-4 xvYCC601 }
{/< also ITU-R BT601-6 525 / ITU-R BT1358 525 / ITU-R BT1700 NTSC }
{/< functionally identical to above }
{/< Used by Dirac / VC-2 and H.264 FRext, see ITU-T SG16 }
{/< ITU-R BT2020 non-constant luminance system }
{/< ITU-R BT2020 constant luminance system }
{/< SMPTE 2085, Y'D'zD'x }
type
  Pmlt_colorspace = ^Tmlt_colorspace;
  Tmlt_colorspace =  Longint;
  Const
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
;
type
  Pmlt_deinterlacer = ^Tmlt_deinterlacer;
  Tmlt_deinterlacer =  Longint;
  Const
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
;
{* The time string formats  }
{*< frame count  }
{*< SMIL clock-value as [[hh:]mm:]ss[.fraction]  }
{*< SMPTE timecode as [[[hh:]mm:]ss:|;]frames  }
{*< SMPTE NDF timecode as [[[hh:]mm:]ss:]frames  }
type
  Pmlt_time_format = ^Tmlt_time_format;
  Tmlt_time_format =  Longint;
  Const
    mlt_time_frames = 0;
    mlt_time_clock = 1;
    mlt_time_smpte_df = 2;
    mlt_time_smpte_ndf = 3;
;
{* Interpolation methods for animation keyframes  }
{*< non-interpolated; value changes instantaneously at the key frame  }
{*< simple, constant pace from this key frame to the next  }
{*< deprecated use mlt_keyframe_smooth_loose  }
{*< Unity Catmull-Rom spline interpolation. May have cusps or overshoots }
{*< Centripetal Catmull-Rom spline interpolation with natural slope at each keyframe. Will not have cusps or overshoots }
{*< Centripetal Catmull-Rom spline interpolation with 0 slope at each keyframe. Will not have cusps or overshoots }
type
  Pmlt_keyframe_type = ^Tmlt_keyframe_type;
  Tmlt_keyframe_type =  Longint;
  Const
    mlt_keyframe_discrete = 0;
    mlt_keyframe_linear = 1;
    mlt_keyframe_smooth = 2;
    mlt_keyframe_smooth_loose = mlt_keyframe_smooth;
    mlt_keyframe_smooth_natural = (mlt_keyframe_smooth)+1;
    mlt_keyframe_smooth_tight = (mlt_keyframe_smooth)+2;
    mlt_keyframe_sinusoidal_in = (mlt_keyframe_smooth)+3;
    mlt_keyframe_sinusoidal_out = (mlt_keyframe_smooth)+4;
    mlt_keyframe_sinusoidal_in_out = (mlt_keyframe_smooth)+5;
    mlt_keyframe_quadratic_in = (mlt_keyframe_smooth)+6;
    mlt_keyframe_quadratic_out = (mlt_keyframe_smooth)+7;
    mlt_keyframe_quadratic_in_out = (mlt_keyframe_smooth)+8;
    mlt_keyframe_cubic_in = (mlt_keyframe_smooth)+9;
    mlt_keyframe_cubic_out = (mlt_keyframe_smooth)+10;
    mlt_keyframe_cubic_in_out = (mlt_keyframe_smooth)+11;
    mlt_keyframe_quartic_in = (mlt_keyframe_smooth)+12;
    mlt_keyframe_quartic_out = (mlt_keyframe_smooth)+13;
    mlt_keyframe_quartic_in_out = (mlt_keyframe_smooth)+14;
    mlt_keyframe_quintic_in = (mlt_keyframe_smooth)+15;
    mlt_keyframe_quintic_out = (mlt_keyframe_smooth)+16;
    mlt_keyframe_quintic_in_out = (mlt_keyframe_smooth)+17;
    mlt_keyframe_exponential_in = (mlt_keyframe_smooth)+18;
    mlt_keyframe_exponential_out = (mlt_keyframe_smooth)+19;
    mlt_keyframe_exponential_in_out = (mlt_keyframe_smooth)+20;
    mlt_keyframe_circular_in = (mlt_keyframe_smooth)+21;
    mlt_keyframe_circular_out = (mlt_keyframe_smooth)+22;
    mlt_keyframe_circular_in_out = (mlt_keyframe_smooth)+23;
    mlt_keyframe_back_in = (mlt_keyframe_smooth)+24;
    mlt_keyframe_back_out = (mlt_keyframe_smooth)+25;
    mlt_keyframe_back_in_out = (mlt_keyframe_smooth)+26;
    mlt_keyframe_elastic_in = (mlt_keyframe_smooth)+27;
    mlt_keyframe_elastic_out = (mlt_keyframe_smooth)+28;
    mlt_keyframe_elastic_in_out = (mlt_keyframe_smooth)+29;
    mlt_keyframe_bounce_in = (mlt_keyframe_smooth)+30;
    mlt_keyframe_bounce_out = (mlt_keyframe_smooth)+31;
    mlt_keyframe_bounce_in_out = (mlt_keyframe_smooth)+32;
;
{* The relative time qualifiers  }
{*< relative to the beginning  }
{*< relative to the current position  }
{*< relative to the end  }
type
  Pmlt_whence = ^Tmlt_whence;
  Tmlt_whence =  Longint;
  Const
    mlt_whence_relative_start = 0;
    mlt_whence_relative_current = 1;
    mlt_whence_relative_end = 2;
;
{* The recognized subclasses of mlt_service  }
{*< invalid service  }
{*< unknown class  }
{*< Producer class  }
{*< Tractor class  }
{*< Playlist class  }
{*< Multitrack class  }
{*< Filter class  }
{*< Transition class  }
{*< Consumer class  }
{*< Field class  }
{*< Link class  }
{*< Chain class  }
type
  Pmlt_service_type = ^Tmlt_service_type;
  Tmlt_service_type =  Longint;
  Const
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
;
type
  Pmlt_position = ^Tmlt_position;
  Tmlt_position = Tint32_t;
{* A rectangle type with coordinates, size, and opacity  }
{*< X coordinate  }
{*< Y coordinate  }
{*< width  }
{*< height  }
{*< opacity / mix-level  }

  Pmlt_rect = ^Tmlt_rect;
  Tmlt_rect = record
      x : Tdouble;
      y : Tdouble;
      w : Tdouble;
      h : Tdouble;
      o : Tdouble;
    end;
{* A tuple of color components  }
{*< red  }
{*< green  }
{*< blue  }
{*< alpha  }

  Pmlt_color = ^Tmlt_color;
  Tmlt_color = record
      r : Tuint8_t;
      g : Tuint8_t;
      b : Tuint8_t;
      a : Tuint8_t;
    end;

  Pmlt_audio = ^Tmlt_audio;
  Tmlt_audio = Pmlt_audio_s;
{*< pointer to Audio object  }

  Pmlt_image = ^Tmlt_image;
  Tmlt_image = Pmlt_image_s;
{*< pointer to Image object  }

  Pmlt_frame = ^Tmlt_frame;
  Tmlt_frame = Pmlt_frame_s;
  Tmlt_frame_ptr = ^Pmlt_frame;
  Pmlt_frame_ptr = ^Tmlt_frame_ptr;
{*< pointer to Frame object  }

  Pmlt_property = ^Tmlt_property;
  Tmlt_property = Pmlt_property_s;
{*< pointer to Property object  }

  Pmlt_properties = ^Tmlt_properties;
  Tmlt_properties = Pmlt_properties_s;
{*< pointer to Properties object  }

  Pmlt_event = ^Tmlt_event;
  Tmlt_event = Pmlt_event_struct;
{*< pointer to Event object  }

  Pmlt_service = ^Tmlt_service;
  Tmlt_service = Pmlt_service_s;
{*< pointer to Service object  }

  Pmlt_producer = ^Tmlt_producer;
  Tmlt_producer = Pmlt_producer_s;
{*< pointer to Producer object  }

  Pmlt_playlist = ^Tmlt_playlist;
  Tmlt_playlist = Pmlt_playlist_s;
{*< pointer to Playlist object  }

  Pmlt_multitrack = ^Tmlt_multitrack;
  Tmlt_multitrack = Pmlt_multitrack_s;
{*< pointer to Multitrack object  }

  Pmlt_filter = ^Tmlt_filter;
  Tmlt_filter = Pmlt_filter_s;
{*< pointer to Filter object  }

  Pmlt_transition = ^Tmlt_transition;
  Tmlt_transition = Pmlt_transition_s;
{*< pointer to Transition object  }

  Pmlt_tractor = ^Tmlt_tractor;
  Tmlt_tractor = Pmlt_tractor_s;
{*< pointer to Tractor object  }

  Pmlt_field = ^Tmlt_field;
  Tmlt_field = Pmlt_field_s;
{*< pointer to Field object  }

  Pmlt_consumer = ^Tmlt_consumer;
  Tmlt_consumer = Pmlt_consumer_s;
{*< pointer to Consumer object  }

  Pmlt_parser = ^Tmlt_parser;
  Tmlt_parser = Pmlt_parser_s;
{*< pointer to Properties object  }

  Pmlt_deque = ^Tmlt_deque;
  Tmlt_deque = Pmlt_deque_s;
{*< pointer to Deque object  }

  Pmlt_geometry = ^Tmlt_geometry;
  Tmlt_geometry = Pmlt_geometry_s;
{*< pointer to Geometry object  }

  Pmlt_geometry_item = ^Tmlt_geometry_item;
  Tmlt_geometry_item = Pmlt_geometry_item_s;
{*< pointer to Geometry Item object  }

  Pmlt_profile = ^Tmlt_profile;
  Tmlt_profile = Pmlt_profile_s;
{*< pointer to Profile object  }

  Pmlt_repository = ^Tmlt_repository;
  Tmlt_repository = Pmlt_repository_s;
{*< pointer to Repository object  }

  Pmlt_cache = ^Tmlt_cache;
  Tmlt_cache = Pmlt_cache_s;
{*< pointer to Cache object  }

  Pmlt_cache_item = ^Tmlt_cache_item;
  Tmlt_cache_item = Pmlt_cache_item_s;
{*< pointer to CacheItem object  }

  Pmlt_animation = ^Tmlt_animation;
  Tmlt_animation = Pmlt_animation_s;
{*< pointer to Property Animation object  }

  Pmlt_slices = ^Tmlt_slices;
  Tmlt_slices = Pmlt_slices_s;
{*< pointer to Sliced processing context object  }

  Pmlt_link = ^Tmlt_link;
  Tmlt_link = Pmlt_link_s;
{*< pointer to Link object  }

  Pmlt_chain = ^Tmlt_chain;
  Tmlt_chain = Pmlt_chain_s;
{*< pointer to Chain object  }

  Tmlt_destructor = procedure (para1:pointer);cdecl;
{*< pointer to destructor function  }

  Pmlt_serialiser = ^Tmlt_serialiser;
  Tmlt_serialiser = function (para1:pointer; length:longint):Pchar;cdecl;
{*< pointer to serialization function  }

  Pmlt_thread_function_t = ^Tmlt_thread_function_t;
  Tmlt_thread_function_t = function (para1:pointer):pointer;cdecl;
{*< generic thread function pointer  }
{*< Cast to a Service pointer  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function MLT_SERVICE(x : longint) : Tmlt_service;

{*< Cast to a Producer pointer  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_PRODUCER(x : longint) : Tmlt_producer;

{*< Cast to a Multitrack pointer  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_MULTITRACK(x : longint) : Tmlt_multitrack;

{*< Cast to a Playlist pointer  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_PLAYLIST(x : longint) : Tmlt_playlist;

{*< Cast to a Tractor pointer  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_TRACTOR(x : longint) : Tmlt_tractor;

{*< Cast to a Filter pointer  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_FILTER(x : longint) : Tmlt_filter;

{*< Cast to a Transition pointer  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_TRANSITION(x : longint) : Tmlt_transition;

{*< Cast to a Consumer pointer  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_CONSUMER(x : longint) : Tmlt_consumer;

{*< Cast to a Frame pointer  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_FRAME(x : longint) : Tmlt_frame;

{*< Cast to a Link pointer  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_LINK(x : longint) : Tmlt_link;

{*< Cast to a Chain pointer  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_CHAIN(x : longint) : Tmlt_chain;

{$ifndef MIN}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MIN(x,y : longint) : longint;

{$endif}
{$ifndef MAX}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MAX(x,y : longint) : longint;

{$endif}
{$ifndef CLAMP}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function CLAMP(x,min,max : longint) : longint;

{$endif}
{$ifdef _WIN32}
{$include <pthread.h>}
{ Win32 compatibility function declarations  }
{$if !defined(__MINGW32__)}

function usleep(useconds:dword):longint;cdecl;external;
{$endif}
{$ifndef WIN_PTHREADS_TIME_H}
(* Const before type ignored *)

function nanosleep(rqtp:Ptimespec; rmtp:Ptimespec):longint;cdecl;external;
{$endif}
(* Const before type ignored *)
(* Const before type ignored *)

function setenv(name:Pchar; value:Pchar; overwrite:longint):longint;cdecl;external;
function getlocale:Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function win32_fopen(filename_utf8:Pchar; mode_utf8:Pchar):PFILE;cdecl;external;
{$include <time.h>}
(* Const before type ignored *)
(* Const before type ignored *)

function strptime(buf:Pchar; fmt:Pchar; tm:Ptm):Pchar;cdecl;external;
const
  mlt_fopen = win32_fopen;  
  MLT_DIRLIST_DELIMITER = ';';  
{$else}

const
  mlt_fopen = fopen;  
  MLT_DIRLIST_DELIMITER = ':';  
{$endif}
{ ifdef _WIN32  }
(* Const before type ignored *)

function mlt_deinterlacer_name(method:Tmlt_deinterlacer):Pchar;cdecl;external;
(* Const before type ignored *)
function mlt_deinterlacer_id(name:Pchar):Tmlt_deinterlacer;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_SERVICE(x : longint) : Tmlt_service;
begin
  MLT_SERVICE:=Tmlt_service(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_PRODUCER(x : longint) : Tmlt_producer;
begin
  MLT_PRODUCER:=Tmlt_producer(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_MULTITRACK(x : longint) : Tmlt_multitrack;
begin
  MLT_MULTITRACK:=Tmlt_multitrack(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_PLAYLIST(x : longint) : Tmlt_playlist;
begin
  MLT_PLAYLIST:=Tmlt_playlist(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_TRACTOR(x : longint) : Tmlt_tractor;
begin
  MLT_TRACTOR:=Tmlt_tractor(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_FILTER(x : longint) : Tmlt_filter;
begin
  MLT_FILTER:=Tmlt_filter(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_TRANSITION(x : longint) : Tmlt_transition;
begin
  MLT_TRANSITION:=Tmlt_transition(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_CONSUMER(x : longint) : Tmlt_consumer;
begin
  MLT_CONSUMER:=Tmlt_consumer(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_FRAME(x : longint) : Tmlt_frame;
begin
  MLT_FRAME:=Tmlt_frame(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_LINK(x : longint) : Tmlt_link;
begin
  MLT_LINK:=Tmlt_link(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function MLT_CHAIN(x : longint) : Tmlt_chain;
begin
  MLT_CHAIN:=Tmlt_chain(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MIN(x,y : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if y then
    if_local1:=x
  else
    if_local1:=y;
  MIN:=x<(if_local1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MAX(x,y : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if y then
    if_local1:=x
  else
    if_local1:=y;
  MAX:=x>(if_local1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CLAMP(x,min,max : longint) : longint;
var
   if_local1, if_local2 : longint;
(* result types are not known *)
begin
  if min then
    if_local1:=min
  else
    if_local1:=x;
  if max then
    if_local2:=max
  else
    if_local2:=x;
  CLAMP:=(x<(if_local1))>(if_local2);
end;


end.
