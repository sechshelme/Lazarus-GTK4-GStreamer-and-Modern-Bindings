unit mlt_tractor;

interface

uses
  fp_mlt;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_tractor.h
 * \brief tractor service class
 * \see mlt_tractor_s
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
{$ifndef MLT_TRACTOR_H}
{$define MLT_TRACTOR_H}
{$include "mlt_producer.h"}
{* \brief Tractor class
 *
 * The tractor is a convenience class that works with the field class
 * to manage a multitrack, track filters, and transitions.
 *
 * \extends mlt_producer_s
 * \properties \em multitrack holds a reference to the mulitrack object that a tractor manages
 * \properties \em field holds a reference to the field object that a tractor manages
 * \properties \em producer holds a reference to an encapsulated producer
  }
type
  Pmlt_tractor_s = ^Tmlt_tractor_s;
  Tmlt_tractor_s = record
      parent : Tmlt_producer_s;
      producer : Tmlt_service;
    end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MLT_TRACTOR_PRODUCER(tractor : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_TRACTOR_SERVICE(tractor : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_TRACTOR_PROPERTIES(tractor : longint) : longint;

function mlt_tractor_init:Tmlt_tractor;cdecl;external libmlt;
function mlt_tractor_new:Tmlt_tractor;cdecl;external libmlt;
function mlt_tractor_service(self:Tmlt_tractor):Tmlt_service;cdecl;external libmlt;
function mlt_tractor_producer(self:Tmlt_tractor):Tmlt_producer;cdecl;external libmlt;
function mlt_tractor_properties(self:Tmlt_tractor):Tmlt_properties;cdecl;external libmlt;
function mlt_tractor_field(self:Tmlt_tractor):Tmlt_field;cdecl;external libmlt;
function mlt_tractor_multitrack(self:Tmlt_tractor):Tmlt_multitrack;cdecl;external libmlt;
function mlt_tractor_connect(self:Tmlt_tractor; service:Tmlt_service):longint;cdecl;external libmlt;
procedure mlt_tractor_refresh(self:Tmlt_tractor);cdecl;external libmlt;
function mlt_tractor_set_track(self:Tmlt_tractor; producer:Tmlt_producer; index:longint):longint;cdecl;external libmlt;
function mlt_tractor_insert_track(self:Tmlt_tractor; producer:Tmlt_producer; index:longint):longint;cdecl;external libmlt;
function mlt_tractor_remove_track(self:Tmlt_tractor; index:longint):longint;cdecl;external libmlt;
function mlt_tractor_get_track(self:Tmlt_tractor; index:longint):Tmlt_producer;cdecl;external libmlt;
procedure mlt_tractor_close(self:Tmlt_tractor);cdecl;external libmlt;
{$endif}

// === Konventiert am: 30-9-26 19:44:43 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_TRACTOR_PRODUCER(tractor : longint) : longint;
begin
  MLT_TRACTOR_PRODUCER:=@(tractor^.parent);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_TRACTOR_SERVICE(tractor : longint) : longint;
begin
  MLT_TRACTOR_SERVICE:=MLT_PRODUCER_SERVICE(MLT_TRACTOR_PRODUCER(tractor));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_TRACTOR_PROPERTIES(tractor : longint) : longint;
begin
  MLT_TRACTOR_PROPERTIES:=MLT_SERVICE_PROPERTIES(MLT_TRACTOR_SERVICE(tractor));
end;


end.
