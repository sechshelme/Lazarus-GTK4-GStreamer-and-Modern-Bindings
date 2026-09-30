unit mlt_frame;

interface

uses
  fp_mlt;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_frame.h
 * \brief interface for all frame classes
 * \see mlt_frame_s
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
{$ifndef MLT_FRAME_H}
{$define MLT_FRAME_H}
{$include "mlt_audio.h"}
{$include "mlt_deque.h"}
{$include "mlt_image.h"}
{$include "mlt_properties.h"}
{$include "mlt_service.h"}
{* Callback function to get video data.
 *
  }
type

  Tmlt_get_image = function (self:Tmlt_frame; buffer:PPuint8_t; format:Pmlt_image_format; width:Plongint; height:Plongint; 
               writable:longint):longint;cdecl;
{* Callback function to get audio data.
 *
  }

  Tmlt_get_audio = function (self:Tmlt_frame; buffer:Ppointer; format:Pmlt_audio_format; frequency:Plongint; channels:Plongint; 
               samples:Plongint):longint;cdecl;
{* \brief Frame class
 *
 * The frame is the primary data object that gets passed around to and through services.
 *
 * \extends mlt_properties
 * \properties \em test_image set if the frame holds a "test card" image
 * \properties \em test_audio set if the frame holds "test card" audio
 * \properties \em _producer holds a reference to the frame's end producer
 * \properties \em _speed the current speed of the producer that generated the frame
 * \properties \em _position the position of the frame
 * \properties \em meta.* holds metadata
 * \properties \em hide set to 1 to hide the video, 2 to mute the audio
 * \properties \em last_track a flag to indicate an end-of-tracks frame
 * \properties \em previous \em frame a reference to the unfiltered preceding frame
 * (no speed factor applied, only available when \em _need_previous_next is set on the producer)
 * \properties \em next \em frame a reference to the unfiltered following frame
 * (no speed factor applied, only available when \em _need_previous_next is set on the producer)
 * \properties \em colorspace the standard for the YUV coefficients
 * \properties \em force_full_luma luma range handling: 1 for full range, 0 for scaling (DEPRECATED)
 * \properties \em color_trc the color transfer characteristic (gamma)
 * \properties \em audio_frequency the sample rate of the audio
 * \properties \em audio_channels the number of audio channels
 * \properties \em audio_samples the number of audio samples
 * \properties \em audio_format the mlt_audio_format for the audio on this frame
 * \properties \em format the mlt_image_format of the image on this frame
 * \properties \em width the horizontal resolution of the image
 * \properties \em height the vertical resolution of the image
 * \properties \em aspect_ratio the sample aspect ratio of the image
 * \properties \em full_range set if the video is full range - only applies to Y'CbCr
 * \properties \em meta.playlist.clip_position mlt_playlist sets this property
 * to the time position of this frame's clip in the playlist
 * \properties \em meta.playlist.clip_length mlt_playlist sets this property to
 * the playlist index of this frame's clip in the playlist
  }
{*< \private A frame extends properties.  }
{* Convert the image format (callback function).
	 * \param self a frame
	 * \param[in,out] image a buffer of image data
	 * \param[in,out] input the image format of supplied image data
	 * \param output the image format to which to convert
	 * \return true if error
	  }
{* Convert the audio format (callback function).
	 * \param self a frame
	 * \param[in,out] audio a buffer of audio data
	 * \param[in,out] input the audio format of supplied data
	 * \param output the audio format to which to convert
	 * \return true if error
	  }
{*< \private the image processing stack of operations and data  }
{*< \private the audio processing stack of operations and data  }
{*< \private a general purpose data stack  }
{*< \private indicates if a frame is or was processed by the parallel consumer  }
  Pmlt_frame_s = ^Tmlt_frame_s;
  Tmlt_frame_s = record
      parent : Tmlt_properties_s;cdecl;
      convert_image : function (self:Tmlt_frame; image:PPuint8_t; input:Pmlt_image_format; output:Tmlt_image_format):longint;cdecl;
      convert_audio : function (self:Tmlt_frame; audio:Ppointer; input:Pmlt_audio_format; output:Tmlt_audio_format):longint;cdecl;
      stack_image : Tmlt_deque;
      stack_audio : Tmlt_deque;
      stack_service : Tmlt_deque;
      is_processing : longint;
    end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MLT_FRAME_PROPERTIES(frame : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_FRAME_SERVICE_STACK(frame : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_FRAME_IMAGE_STACK(frame : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_FRAME_AUDIO_STACK(frame : longint) : longint;

function mlt_frame_init(service:Tmlt_service):Tmlt_frame;cdecl;external libmlt;
function mlt_frame_properties(self:Tmlt_frame):Tmlt_properties;cdecl;external libmlt;
function mlt_frame_is_test_card(self:Tmlt_frame):longint;cdecl;external libmlt;
function mlt_frame_is_test_audio(self:Tmlt_frame):longint;cdecl;external libmlt;
function mlt_frame_get_aspect_ratio(self:Tmlt_frame):Tdouble;cdecl;external libmlt;
function mlt_frame_set_aspect_ratio(self:Tmlt_frame; value:Tdouble):longint;cdecl;external libmlt;
function mlt_frame_get_position(self:Tmlt_frame):Tmlt_position;cdecl;external libmlt;
function mlt_frame_original_position(self:Tmlt_frame):Tmlt_position;cdecl;external libmlt;
function mlt_frame_set_position(self:Tmlt_frame; value:Tmlt_position):longint;cdecl;external libmlt;
function mlt_frame_set_image(self:Tmlt_frame; image:Puint8_t; size:longint; destroy:Tmlt_destructor):longint;cdecl;external libmlt;
function mlt_frame_set_alpha(self:Tmlt_frame; alpha:Puint8_t; size:longint; destroy:Tmlt_destructor):longint;cdecl;external libmlt;
procedure mlt_frame_replace_image(self:Tmlt_frame; image:Puint8_t; format:Tmlt_image_format; width:longint; height:longint);cdecl;external libmlt;
function mlt_frame_get_image(self:Tmlt_frame; buffer:PPuint8_t; format:Pmlt_image_format; width:Plongint; height:Plongint; 
           writable:longint):longint;cdecl;external libmlt;
function mlt_frame_get_alpha(self:Tmlt_frame):Puint8_t;cdecl;external libmlt;
function mlt_frame_get_alpha_size(self:Tmlt_frame; size:Plongint):Puint8_t;cdecl;external libmlt;
function mlt_frame_get_audio(self:Tmlt_frame; buffer:Ppointer; format:Pmlt_audio_format; frequency:Plongint; channels:Plongint; 
           samples:Plongint):longint;cdecl;external libmlt;
function mlt_frame_set_audio(self:Tmlt_frame; buffer:pointer; para3:Tmlt_audio_format; size:longint; para5:Tmlt_destructor):longint;cdecl;external libmlt;
function mlt_frame_get_waveform(self:Tmlt_frame; w:longint; h:longint):Pbyte;cdecl;external libmlt;
function mlt_frame_push_get_image(self:Tmlt_frame; get_image:Tmlt_get_image):longint;cdecl;external libmlt;
function mlt_frame_pop_get_image(self:Tmlt_frame):Tmlt_get_image;cdecl;external libmlt;
function mlt_frame_push_frame(self:Tmlt_frame; that:Tmlt_frame):longint;cdecl;external libmlt;
function mlt_frame_pop_frame(self:Tmlt_frame):Tmlt_frame;cdecl;external libmlt;
function mlt_frame_push_service(self:Tmlt_frame; that:pointer):longint;cdecl;external libmlt;
function mlt_frame_pop_service(self:Tmlt_frame):pointer;cdecl;external libmlt;
function mlt_frame_push_service_int(self:Tmlt_frame; that:longint):longint;cdecl;external libmlt;
function mlt_frame_pop_service_int(self:Tmlt_frame):longint;cdecl;external libmlt;
function mlt_frame_push_audio(self:Tmlt_frame; that:pointer):longint;cdecl;external libmlt;
function mlt_frame_pop_audio(self:Tmlt_frame):pointer;cdecl;external libmlt;
function mlt_frame_service_stack(self:Tmlt_frame):Tmlt_deque;cdecl;external libmlt;
function mlt_frame_get_original_producer(self:Tmlt_frame):Tmlt_producer;cdecl;external libmlt;
procedure mlt_frame_close(self:Tmlt_frame);cdecl;external libmlt;
function mlt_frame_unique_properties(self:Tmlt_frame; service:Tmlt_service):Tmlt_properties;cdecl;external libmlt;
function mlt_frame_get_unique_properties(self:Tmlt_frame; service:Tmlt_service):Tmlt_properties;cdecl;external libmlt;
function mlt_frame_clone(self:Tmlt_frame; is_deep:longint):Tmlt_frame;cdecl;external libmlt;
function mlt_frame_clone_audio(self:Tmlt_frame; is_deep:longint):Tmlt_frame;cdecl;external libmlt;
function mlt_frame_clone_image(self:Tmlt_frame; is_deep:longint):Tmlt_frame;cdecl;external libmlt;
{ convenience functions  }
procedure mlt_frame_write_ppm(frame:Tmlt_frame);cdecl;external libmlt;
{xxxxx
#define RGB2YUV_601_SCALED(r, g, b, y, u, v) \
    y = ((263 * r + 516 * g + 100 * b) >> 10) + 16; \
    u = ((-152 * r - 300 * g + 450 * b) >> 10) + 128; \
    v = ((450 * r - 377 * g - 73 * b) >> 10) + 128;


#define RGB2UV_601_SCALED(r, g, b, u, v) \
    u = ((-152 * r - 300 * g + 450 * b) >> 10) + 128; \
    v = ((450 * r - 377 * g - 73 * b) >> 10) + 128;


#define YUV2RGB_601_SCALED(y, u, v, r, g, b) \
    r = ((1192 * (y - 16) + 1634 * (v - 128)) >> 10); \
    g = ((1192 * (y - 16) - 832 * (v - 128) - 401 * (u - 128)) >> 10); \
    b = ((1192 * (y - 16) + 2066 * (u - 128)) >> 10); \
    r = r < 0 ? 0 : r > 255 ? 255 : r; \
    g = g < 0 ? 0 : g > 255 ? 255 : g; \
    b = b < 0 ? 0 : b > 255 ? 255 : b;
 }
{$endif}

// === Konventiert am: 30-9-26 19:36:26 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_FRAME_PROPERTIES(frame : longint) : longint;
begin
  MLT_FRAME_PROPERTIES:=@(frame^.parent);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_FRAME_SERVICE_STACK(frame : longint) : longint;
begin
  MLT_FRAME_SERVICE_STACK:=frame^.stack_service;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_FRAME_IMAGE_STACK(frame : longint) : longint;
begin
  MLT_FRAME_IMAGE_STACK:=frame^.stack_image;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_FRAME_AUDIO_STACK(frame : longint) : longint;
begin
  MLT_FRAME_AUDIO_STACK:=frame^.stack_audio;
end;


end.
