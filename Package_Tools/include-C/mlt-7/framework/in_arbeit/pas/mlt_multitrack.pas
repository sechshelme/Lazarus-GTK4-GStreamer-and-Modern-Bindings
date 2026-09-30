unit mlt_multitrack;

interface

uses
  fp_mlt;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_multitrack.h
 * \brief multitrack service class
 * \see mlt_multitrack_s
 *
 * Copyright (C) 2003-2015 Meltytech, LLC
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
{$ifndef MLT_MULITRACK_H}
{$define MLT_MULITRACK_H}
{$include "mlt_producer.h"}
{* \brief Track class used by mlt_multitrack_s
  }
type
  Pmlt_track_s = ^Tmlt_track_s;
  Tmlt_track_s = record
      producer : Tmlt_producer;
      event : Tmlt_event;
    end;


  Pmlt_track = ^Tmlt_track;
  Tmlt_track = Pmlt_track_s;
{* \brief Multitrack class
 *
 * A multitrack is a parallel container of producers that acts a single producer.
 *
 * \extends mlt_producer_s
 * \properties \em log_id not currently used, but sets it to "mulitrack"
  }
{* We're extending producer here  }
  Pmlt_multitrack_s = ^Tmlt_multitrack_s;
  Tmlt_multitrack_s = record
      parent : Tmlt_producer_s;
      list : Pmlt_track;
      size : longint;
      count : longint;
    end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MLT_MULTITRACK_PRODUCER(multitrack : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_MULTITRACK_SERVICE(multitrack : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_MULTITRACK_PROPERTIES(multitrack : longint) : longint;

function mlt_multitrack_init:Tmlt_multitrack;cdecl;external libmlt;
function mlt_multitrack_producer(self:Tmlt_multitrack):Tmlt_producer;cdecl;external libmlt;
function mlt_multitrack_service(self:Tmlt_multitrack):Tmlt_service;cdecl;external libmlt;
function mlt_multitrack_properties(self:Tmlt_multitrack):Tmlt_properties;cdecl;external libmlt;
function mlt_multitrack_connect(self:Tmlt_multitrack; producer:Tmlt_producer; track:longint):longint;cdecl;external libmlt;
function mlt_multitrack_insert(self:Tmlt_multitrack; producer:Tmlt_producer; track:longint):longint;cdecl;external libmlt;
function mlt_multitrack_disconnect(self:Tmlt_multitrack; track:longint):longint;cdecl;external libmlt;
function mlt_multitrack_clip(self:Tmlt_multitrack; whence:Tmlt_whence; index:longint):Tmlt_position;cdecl;external libmlt;
procedure mlt_multitrack_close(self:Tmlt_multitrack);cdecl;external libmlt;
function mlt_multitrack_count(self:Tmlt_multitrack):longint;cdecl;external libmlt;
procedure mlt_multitrack_refresh(self:Tmlt_multitrack);cdecl;external libmlt;
function mlt_multitrack_track(self:Tmlt_multitrack; track:longint):Tmlt_producer;cdecl;external libmlt;
{$endif}

// === Konventiert am: 30-9-26 19:36:11 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_MULTITRACK_PRODUCER(multitrack : longint) : longint;
begin
  MLT_MULTITRACK_PRODUCER:=@(multitrack^.parent);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_MULTITRACK_SERVICE(multitrack : longint) : longint;
begin
  MLT_MULTITRACK_SERVICE:=MLT_PRODUCER_SERVICE(MLT_MULTITRACK_PRODUCER(multitrack));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_MULTITRACK_PROPERTIES(multitrack : longint) : longint;
begin
  MLT_MULTITRACK_PROPERTIES:=MLT_SERVICE_PROPERTIES(MLT_MULTITRACK_SERVICE(multitrack));
end;


end.
