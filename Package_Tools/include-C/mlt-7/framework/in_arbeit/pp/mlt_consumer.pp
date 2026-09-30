
unit mlt_consumer;
interface

{
  Automatically converted by H2Pas 1.0.0 from mlt_consumer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mlt_consumer.h
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
Pmlt_consumer_s  = ^mlt_consumer_s;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_consumer.h
 * \brief abstraction for all consumer services
 * \see mlt_consumer_s
 *
 * Copyright (C) 2003-2022 Meltytech, LLC
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
{$ifndef MLT_CONSUMER_H}
{$define MLT_CONSUMER_H}
{$include "mlt_events.h"}
{$include "mlt_service.h"}
{$include <pthread.h>}
{* \brief Consumer abstract service class
 *
 * A consumer is a service that pulls audio and video from the connected
 * producers, filters, and transitions. Typically a consumer is used to
 * output audio and/or video to a device, file, or socket.
 *
 * \extends mlt_service_s
 * \properties \em rescale the scaling algorithm to pass on to all scaling
 * filters, defaults to "bilinear"
 * \properties \em buffer the number of frames to use in the asynchronous
 * render thread, defaults to 25
 * \properties \em prefill the number of frames to render before commencing
 * output when real_time <> 0, defaults to the size of buffer
 * \properties \em drop_max the maximum number of consecutively dropped frames, defaults to 5
 * \properties \em frequency the audio sample rate to use in Hertz, defaults to 48000
 * \properties \em channels the number of audio channels to use, defaults to 2
 * \properties \em channel_layout the layout of the audio channels, defaults to auto.
 * other options include: mono, stereo, 5.1, 7.1, etc.
 * \properties \em real_time the asynchronous behavior: 1 (default) for asynchronous
 * with frame dropping, -1 for asynchronous without frame dropping, 0 to disable (synchronous)
 * \properties \em test_card the name of a resource to use as the test card, defaults to
 * environment variable MLT_TEST_CARD. If undefined, the hard-coded default test card is
 * white silence. A test card is what appears when nothing is produced.
 * \event \em consumer-frame-show Subclass implementations fire this immediately after showing a frame
 *   or when a frame should be shown (if audio-only consumer). The event data is a frame.
 * \event \em consumer-frame-render The base class fires this immediately before rendering a frame;
 *   the event data is a frame.
 * \event \em consumer-thread-create Override the implementation of creating and
 *   starting a thread by listening and responding to this (real_time 1 or -1 only).
 *   The event data is a pointer to mlt_event_data_thread.
 * \event \em consumer-thread-join Override the implementation of waiting and
 *   joining a terminated thread  by listening and responding to this (real_time 1 or -1 only).
 *   The event data is a pointer to mlt_event_data_thread.
 * \event \em consumer-thread-started The base class fires when beginning execution of a rendering thread.
 * \event \em consumer-thread-stopped The base class fires when a rendering thread has ended.
 * \event \em consumer-stopping This is fired when stop was requested, but before render threads are joined.
 * \event \em consumer-stopped This is fired when the subclass implementation calls mlt_consumer_stopped().
 * \properties \em fps video frames per second as floating point (read only)
 * \properties \em frame_rate_num the numerator of the video frame rate, overrides \p mlt_profile_s
 * \properties \em frame_rate_den the denominator of the video frame rate, overrides \p mlt_profile_s
 * \properties \em width the horizontal video resolution, overrides \p mlt_profile_s
 * \properties \em height the vertical video resolution, overrides \p mlt_profile_s
 * \properties \em progressive a flag that indicates if the video is interlaced
 * or progressive, overrides \p mlt_profile_s
 * \properties \em aspect_ratio the video sample (pixel) aspect ratio as floating point (read only)
 * \properties \em sample_aspect_num the numerator of the sample aspect ratio, overrides \p mlt_profile_s
 * \properties \em sample_aspect_den the denominator of the sample aspect ratio, overrides \p mlt_profile_s
 * \properties \em display_ratio the video frame aspect ratio as floating point (read only)
 * \properties \em display_aspect_num the numerator of the video frame aspect ratio, overrides \p mlt_profile_s
 * \properties \em display_aspect_den the denominator of the video frame aspect ratio, overrides \p mlt_profile_s
 * \properties \em priority the OS scheduling priority for the render threads when real_time is not 0.
 * \properties \em top_field_first when not progressive, whether interlace field order is top-field-first, defaults to 0.
 *   Set this to -1 if the consumer does not care about the field order.
 * \properties \em mlt_image_format the image format to request in rendering threads, defaults to yuv422
 * \properties \em mlt_audio_format the audio format to request in rendering threads, defaults to S16
 * \properties \em audio_off set non-zero to disable audio processing
 * \properties \em video_off set non-zero to disable video processing
 * \properties \em drop_count the number of video frames not rendered since starting consumer
 * \properties \em color_range the color range as tv/mpeg (limited) or pc/jpeg (full); default is unset, which implies tv/mpeg
 * \properties \em color_trc the color transfer characteristic (gamma), default is unset
 * \properties \em deinterlacer the deinterlace algorithm to pass to deinterlace filters, defaults to "yadif"
  }
{* A consumer is a service.  }
{* Start the consumer to pull frames (virtual function).
	 *
	 * \param mlt_consumer a consumer
	 * \return true if there was an error
	  }
{* Stop the consumer (virtual function).
	 *
	 * \param mlt_consumer a consumer
	 * \return true if there was an error
	  }
{* Get whether the consumer is running or stopped (virtual function).
	 *
	 * \param mlt_consumer a consumer
	 * \return true if the consumer is stopped
	  }
{* Purge the consumer of buffered data (virtual function).
	 *
	 * \param mlt_consumer a consumer
	  }
{* The destructor virtual function
	 *
	 * \param mlt_consumer a consumer
	  }
{*< \private instance object  }
{*< \private the object of a subclass  }
type
  Pmlt_consumer_s = ^Tmlt_consumer_s;
  Tmlt_consumer_s = record
      parent : Tmlt_service_s;
      start : function (para1:Tmlt_consumer):longint;cdecl;
      stop : function (para1:Tmlt_consumer):longint;cdecl;
      is_stopped : function (para1:Tmlt_consumer):longint;cdecl;
      purge : procedure (para1:Tmlt_consumer);cdecl;
      close : procedure (para1:Tmlt_consumer);cdecl;
      local : pointer;
      child : pointer;
    end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MLT_CONSUMER_SERVICE(consumer : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_CONSUMER_PROPERTIES(consumer : longint) : longint;

function mlt_consumer_init(self:Tmlt_consumer; child:pointer; profile:Tmlt_profile):longint;cdecl;external;
function mlt_consumer_new(profile:Tmlt_profile):Tmlt_consumer;cdecl;external;
function mlt_consumer_service(self:Tmlt_consumer):Tmlt_service;cdecl;external;
function mlt_consumer_properties(self:Tmlt_consumer):Tmlt_properties;cdecl;external;
function mlt_consumer_connect(self:Tmlt_consumer; producer:Tmlt_service):longint;cdecl;external;
function mlt_consumer_start(self:Tmlt_consumer):longint;cdecl;external;
procedure mlt_consumer_purge(self:Tmlt_consumer);cdecl;external;
function mlt_consumer_put_frame(self:Tmlt_consumer; frame:Tmlt_frame):longint;cdecl;external;
function mlt_consumer_get_frame(self:Tmlt_consumer):Tmlt_frame;cdecl;external;
function mlt_consumer_rt_frame(self:Tmlt_consumer):Tmlt_frame;cdecl;external;
function mlt_consumer_stop(self:Tmlt_consumer):longint;cdecl;external;
function mlt_consumer_is_stopped(self:Tmlt_consumer):longint;cdecl;external;
procedure mlt_consumer_stopped(self:Tmlt_consumer);cdecl;external;
procedure mlt_consumer_close(para1:Tmlt_consumer);cdecl;external;
function mlt_consumer_position(para1:Tmlt_consumer):Tmlt_position;cdecl;external;
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_CONSUMER_SERVICE(consumer : longint) : longint;
begin
  MLT_CONSUMER_SERVICE:=@(consumer^.parent);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_CONSUMER_PROPERTIES(consumer : longint) : longint;
begin
  MLT_CONSUMER_PROPERTIES:=MLT_SERVICE_PROPERTIES(MLT_CONSUMER_SERVICE(consumer));
end;


end.
