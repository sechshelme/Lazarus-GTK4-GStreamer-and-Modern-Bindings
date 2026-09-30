
unit mlt_transition;
interface

{
  Automatically converted by H2Pas 1.0.0 from mlt_transition.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mlt_transition.h
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
Pmlt_frame  = ^mlt_frame;
Pmlt_transition_s  = ^mlt_transition_s;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_transition.h
 * \brief abstraction for all transition services
 * \see mlt_transition_s
 *
 * Copyright (C) 2003-2021 Meltytech, LLC
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
{$ifndef MLT_TRANSITION_H}
{$define MLT_TRANSITION_H}
{$include "mlt_service.h"}
{$include <pthread.h>}
{* \brief Transition abstract service class
 *
 * A transition may modify the output of a producer based on the output of a second producer.
 *
 * \extends mlt_service_s
 * \properties \em a_track the track index (0-based) of a multitrack of the first producer
 * \properties \em b_track the track index (0-based) of a multitrack of the second producer
 * \properties \em accepts_blanks a flag to indicate if the transition should accept blank frames
 * \properties \em always_active a flag to indicate that the in and out points do not apply
 * \properties \em _transition_type 1 for video, 2 for audio, 3 for both audio and video
 * \properties \em disable Set this to disable the transition while keeping it in the object model.
  }
{* We're implementing service here  }
{* public virtual  }
{* protected transition method  }
{* Protected  }
{* track and in/out points  }
{* Private  }
type
  Pmlt_transition_s = ^Tmlt_transition_s;
  Tmlt_transition_s = record
      parent : Tmlt_service_s;
      close : procedure (para1:Tmlt_transition);cdecl;
      process : function (para1:Tmlt_transition; para2:Tmlt_frame; para3:Tmlt_frame):Tmlt_frame;cdecl;
      child : pointer;
      producer : Tmlt_service;
      frames : Pmlt_frame;
      held : longint;
      mutex : Tpthread_mutex_t;
    end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MLT_TRANSITION_SERVICE(transition : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_TRANSITION_PROPERTIES(transition : longint) : longint;

function mlt_transition_init(self:Tmlt_transition; child:pointer):longint;cdecl;external;
function mlt_transition_new:Tmlt_transition;cdecl;external;
function mlt_transition_service(self:Tmlt_transition):Tmlt_service;cdecl;external;
function mlt_transition_properties(self:Tmlt_transition):Tmlt_properties;cdecl;external;
function mlt_transition_connect(self:Tmlt_transition; producer:Tmlt_service; a_track:longint; b_track:longint):longint;cdecl;external;
procedure mlt_transition_set_in_and_out(self:Tmlt_transition; in:Tmlt_position; out:Tmlt_position);cdecl;external;
procedure mlt_transition_set_tracks(self:Tmlt_transition; a_track:longint; b_track:longint);cdecl;external;
function mlt_transition_get_a_track(self:Tmlt_transition):longint;cdecl;external;
function mlt_transition_get_b_track(self:Tmlt_transition):longint;cdecl;external;
function mlt_transition_get_in(self:Tmlt_transition):Tmlt_position;cdecl;external;
function mlt_transition_get_out(self:Tmlt_transition):Tmlt_position;cdecl;external;
function mlt_transition_get_length(self:Tmlt_transition):Tmlt_position;cdecl;external;
function mlt_transition_get_position(self:Tmlt_transition; frame:Tmlt_frame):Tmlt_position;cdecl;external;
function mlt_transition_get_progress(self:Tmlt_transition; frame:Tmlt_frame):Tdouble;cdecl;external;
function mlt_transition_get_progress_delta(self:Tmlt_transition; frame:Tmlt_frame):Tdouble;cdecl;external;
function mlt_transition_process(self:Tmlt_transition; a_frame:Tmlt_frame; b_frame:Tmlt_frame):Tmlt_frame;cdecl;external;
procedure mlt_transition_close(self:Tmlt_transition);cdecl;external;
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_TRANSITION_SERVICE(transition : longint) : longint;
begin
  MLT_TRANSITION_SERVICE:=@(transition^.parent);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_TRANSITION_PROPERTIES(transition : longint) : longint;
begin
  MLT_TRANSITION_PROPERTIES:=MLT_SERVICE_PROPERTIES(MLT_TRANSITION_SERVICE(transition));
end;


end.
