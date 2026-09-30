
unit mlt_producer;
interface

{
  Automatically converted by H2Pas 1.0.0 from mlt_producer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mlt_producer.h
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
Pmlt_producer_s  = ^mlt_producer_s;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_producer.h
 * \brief abstraction for all producer services
 * \see mlt_producer_s
 *
 * Copyright (C) 2003-2014 Meltytech, LLC
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
{$ifndef MLT_PRODUCER_H}
{$define MLT_PRODUCER_H}
{$include "mlt_filter.h"}
{$include "mlt_profile.h"}
{$include "mlt_service.h"}
{* \brief Producer abstract service class
 *
 * A producer is a service that generates audio, video, and metadata.
 * Some day it may also generate text (subtitles). This is not to say
 * a producer "synthesizes," rather that is an origin of data within the
 * service network - that could be through synthesis or reading a stream.
 *
 * \extends mlt_service
 * \event \em producer-changed either service-changed was fired or the timing of the producer changed
 * \properties \em mlt_type the name of the service subclass, e.g. mlt_producer
 * \properties \em mlt_service the name of a producer subclass
 * \properties \em _position the current position of the play head, relative to the in point
 * \properties \em _frame the current position of the play head, relative to the beginning of the resource
 * \properties \em _speed the current speed factor, where 1.0 is normal
 * \properties \em aspect_ratio sample aspect ratio
 * \properties \em length the duration of the cut in frames
 * \properties \em eof the end-of-file behavior, one of: pause, continue, loop
 * \properties \em resource the file name, stream address, or the class name in angle brackets
 * \properties \em _cut set if this producer is a "cut" producer
 * \properties \em mlt_mix stores the data for a "mix" producer
 * \properties \em _cut_parent holds a reference to the cut's parent producer
 * \properties \em ignore_points Set this to temporarily disable the in and out points.
 * \properties \em use_clone holds a reference to a clone's producer, as created by mlt_producer_optimise
 * \properties \em _clone is the index of the clone in the list of clones stored on the clone's producer
 * \properties \em _clones is the number of clones of the producer, as created by mlt_producer_optimise
 * \properties \em _clone.N holds a reference to the N'th clone of the producer, as created by mlt_producer_optimise
 * \properties \em meta.* holds metadata - there is a loose taxonomy to be defined
 * \properties \em set.* holds properties to set on a frame produced
 * \envvar \em MLT_DEFAULT_PRODUCER_LENGTH - the default duration of the producer in frames, defaults to 15000.
 * Most producers will set the producer length to something appropriate
 * like the real duration of an audio or video clip. However, some other things
 * like still images and generators do not have an intrinsic length besides one
 * or infinity. Those producers tend to not override the default length and one
 * expect the app or user to set the length. The default value of 15000 was chosen
 * to provide something useful - not too long or short and convenient to simply
 * set an out point without necessarily nedding to extend the length.
 * \todo define the media metadata taxonomy
  }
{* A producer is a service.  }
{* Get a frame of data (virtual function).
	 *
	 * \param mlt_producer a producer
	 * \param mlt_frame_ptr a frame pointer by reference
	 * \param int an index
	 * \return true if there was an error
	  }
{* Seek to a specified position (virtual function).
	 *
	 * \param mlt_producer a producer
	 * \param position set the "play head" position of the producer
	 * \return false
	  }
{* Set the in and out points.
	 *
	 * \param mlt_producer a producer
	 * \param mlt_position the relative starting time; a negative value is the same as 0
	 * \param mlt_position the relative ending time; a negative value is the same as length - 1
	 * \return false
	  }
{* the destructor virtual function  }
{*< the object supplied to the close virtual function  }
{*< \private instance object  }
{*< \private the object of a subclass  }
type
  Pmlt_producer_s = ^Tmlt_producer_s;
  Tmlt_producer_s = record
      parent : Tmlt_service_s;
      get_frame : function (para1:Tmlt_producer; para2:Tmlt_frame_ptr; para3:longint):longint;cdecl;
      seek : function (para1:Tmlt_producer; para2:Tmlt_position):longint;cdecl;
      set_in_and_out : function (para1:Tmlt_producer; para2:Tmlt_position; para3:Tmlt_position):longint;cdecl;
      close : Tmlt_destructor;
      close_object : pointer;
      local : pointer;
      child : pointer;
    end;

{
 *  Public final methods
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MLT_PRODUCER_SERVICE(producer : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_PRODUCER_PROPERTIES(producer : longint) : longint;

function mlt_producer_init(self:Tmlt_producer; child:pointer):longint;cdecl;external;
function mlt_producer_new(para1:Tmlt_profile):Tmlt_producer;cdecl;external;
function mlt_producer_service(self:Tmlt_producer):Tmlt_service;cdecl;external;
function mlt_producer_properties(self:Tmlt_producer):Tmlt_properties;cdecl;external;
function mlt_producer_seek(self:Tmlt_producer; position:Tmlt_position):longint;cdecl;external;
(* Const before type ignored *)
function mlt_producer_seek_time(self:Tmlt_producer; time:Pchar):longint;cdecl;external;
function mlt_producer_position(self:Tmlt_producer):Tmlt_position;cdecl;external;
function mlt_producer_frame(self:Tmlt_producer):Tmlt_position;cdecl;external;
function mlt_producer_frame_time(self:Tmlt_producer; para2:Tmlt_time_format):Pchar;cdecl;external;
function mlt_producer_set_speed(self:Tmlt_producer; speed:Tdouble):longint;cdecl;external;
function mlt_producer_get_speed(self:Tmlt_producer):Tdouble;cdecl;external;
function mlt_producer_get_fps(self:Tmlt_producer):Tdouble;cdecl;external;
function mlt_producer_set_in_and_out(self:Tmlt_producer; in:Tmlt_position; out:Tmlt_position):longint;cdecl;external;
function mlt_producer_clear(self:Tmlt_producer):longint;cdecl;external;
function mlt_producer_get_in(self:Tmlt_producer):Tmlt_position;cdecl;external;
function mlt_producer_get_out(self:Tmlt_producer):Tmlt_position;cdecl;external;
function mlt_producer_get_playtime(self:Tmlt_producer):Tmlt_position;cdecl;external;
function mlt_producer_get_length(self:Tmlt_producer):Tmlt_position;cdecl;external;
function mlt_producer_get_length_time(self:Tmlt_producer; para2:Tmlt_time_format):Pchar;cdecl;external;
procedure mlt_producer_prepare_next(self:Tmlt_producer);cdecl;external;
function mlt_producer_attach(self:Tmlt_producer; filter:Tmlt_filter):longint;cdecl;external;
function mlt_producer_detach(self:Tmlt_producer; filter:Tmlt_filter):longint;cdecl;external;
function mlt_producer_filter(self:Tmlt_producer; index:longint):Tmlt_filter;cdecl;external;
function mlt_producer_cut(self:Tmlt_producer; in:longint; out:longint):Tmlt_producer;cdecl;external;
function mlt_producer_is_cut(self:Tmlt_producer):longint;cdecl;external;
function mlt_producer_is_mix(self:Tmlt_producer):longint;cdecl;external;
function mlt_producer_is_blank(self:Tmlt_producer):longint;cdecl;external;
function mlt_producer_cut_parent(self:Tmlt_producer):Tmlt_producer;cdecl;external;
function mlt_producer_optimise(self:Tmlt_producer):longint;cdecl;external;
procedure mlt_producer_close(self:Tmlt_producer);cdecl;external;
function mlt_producer_get_creation_time(self:Tmlt_producer):Tint64_t;cdecl;external;
procedure mlt_producer_set_creation_time(self:Tmlt_producer; creation_time:Tint64_t);cdecl;external;
function mlt_producer_probe(self:Tmlt_producer):longint;cdecl;external;
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_PRODUCER_SERVICE(producer : longint) : longint;
begin
  MLT_PRODUCER_SERVICE:=@(producer^.parent);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_PRODUCER_PROPERTIES(producer : longint) : longint;
begin
  MLT_PRODUCER_PROPERTIES:=MLT_SERVICE_PROPERTIES(MLT_PRODUCER_SERVICE(producer));
end;


end.
