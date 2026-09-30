unit mlt_filter;

interface

uses
  fp_mlt;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_filter.h
 * \brief abstraction for all filter services
 * \see mlt_filter_s
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
{$ifndef MLT_FILTER_H}
{$define MLT_FILTER_H}
{$include "mlt_service.h"}
{* \brief Filter abstract service class
 *
 * A filter is a service that may modify the output of a single producer.
 *
 * \extends mlt_service_s
 * \properties \em track the index of the track of a multitrack on which the filter is applied
 * \properties \em service a reference to the service to which this filter is attached.
 * \properties \em disable Set this to disable the filter while keeping it in the object model.
 * Currently this is not cleared when the filter is detached.
  }
{* We're implementing service here  }
{* public virtual  }
{* protected filter method  }
{* Protected  }
type
  Pmlt_filter_s = ^Tmlt_filter_s;
  Tmlt_filter_s = record
      parent : Tmlt_service_s;
      close : procedure (para1:Tmlt_filter);cdecl;
      process : function (para1:Tmlt_filter; para2:Tmlt_frame):Tmlt_frame;cdecl;
      child : pointer;
    end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MLT_FILTER_SERVICE(filter : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_FILTER_PROPERTIES(filter : longint) : longint;

function mlt_filter_init(self:Tmlt_filter; child:pointer):longint;cdecl;external libmlt;
function mlt_filter_new:Tmlt_filter;cdecl;external libmlt;
function mlt_filter_service(self:Tmlt_filter):Tmlt_service;cdecl;external libmlt;
function mlt_filter_properties(self:Tmlt_filter):Tmlt_properties;cdecl;external libmlt;
function mlt_filter_process(self:Tmlt_filter; that:Tmlt_frame):Tmlt_frame;cdecl;external libmlt;
function mlt_filter_connect(self:Tmlt_filter; producer:Tmlt_service; index:longint):longint;cdecl;external libmlt;
procedure mlt_filter_set_in_and_out(self:Tmlt_filter; in:Tmlt_position; out:Tmlt_position);cdecl;external libmlt;
function mlt_filter_get_track(self:Tmlt_filter):longint;cdecl;external libmlt;
function mlt_filter_get_in(self:Tmlt_filter):Tmlt_position;cdecl;external libmlt;
function mlt_filter_get_out(self:Tmlt_filter):Tmlt_position;cdecl;external libmlt;
function mlt_filter_get_length(self:Tmlt_filter):Tmlt_position;cdecl;external libmlt;
function mlt_filter_get_length2(self:Tmlt_filter; frame:Tmlt_frame):Tmlt_position;cdecl;external libmlt;
function mlt_filter_get_position(self:Tmlt_filter; frame:Tmlt_frame):Tmlt_position;cdecl;external libmlt;
function mlt_filter_get_progress(self:Tmlt_filter; frame:Tmlt_frame):Tdouble;cdecl;external libmlt;
procedure mlt_filter_close(para1:Tmlt_filter);cdecl;external libmlt;
{$endif}

// === Konventiert am: 30-9-26 19:26:58 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_FILTER_SERVICE(filter : longint) : longint;
begin
  MLT_FILTER_SERVICE:=@(filter^.parent);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_FILTER_PROPERTIES(filter : longint) : longint;
begin
  MLT_FILTER_PROPERTIES:=MLT_SERVICE_PROPERTIES(MLT_FILTER_SERVICE(filter));
end;


end.
