
unit mlt_service;
interface

{
  Automatically converted by H2Pas 1.0.0 from mlt_service.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mlt_service.h
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
Pmlt_service_s  = ^mlt_service_s;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_service.h
 * \brief interface declaration for all service classes
 * \see mlt_service_s
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
{$ifndef MLT_SERVICE_H}
{$define MLT_SERVICE_H}
{$include "mlt_properties.h"}
{$include "mlt_types.h"}
{* \brief Service abstract base class
 *
 * \extends mlt_properties
 * The service is the base class for all of the interesting classes and
 * plugins for MLT. A service can have multiple inputs connections to
 * other services called its "producers" but only a single output to another
 * service called its "consumer." A service that has both producer and
 * consumer connections is called a filter. Any service can have zero or more
 * filters "attached" to it. We call any collection of services and their
 * connections a "service network," which is similar to what DirectShow calls
 * a filter graph or what gstreamer calls an element pipeline.
 *
 * \event \em service-changed a filter was attached or detached or a transition was connected or disconnected
 * \event \em property-changed a property's value changed; the event data is a string for the name of the property
 * \properties \em mlt_type identifies the subclass
 * \properties \em _mlt_service_hidden a flag that indicates whether to hide the mlt_service
 * \properties \em mlt_service is the name of the implementation of the service
 * \properties \em resource is either the stream identifier or grandchild-class
 * \properties \em in when to start, what is started is service-specific
 * \properties \em out when to stop
 * \properties \em _filter_private Set this on a service to ensure that attached filters are handled privately.
 * See modules/core/filter_watermark.c for example.
 * \properties \em _profile stores the mlt_profile for a service
 * \properties \em _unique_id is a unique identifier
 * \properties \em _need_previous_next boolean that instructs producers to get
 * preceding and following frames inside of \p mlt_service_get_frame
  }
{*< \private A service extends properties.  }
{* Get a frame of data (virtual function).
	 *
	 * \param mlt_producer a producer
	 * \param mlt_frame_ptr a frame pointer by reference
	 * \param int an index
	 * \return true if there was an error
	  }
{* the destructor virtual function  }
{*< the object supplied to the close virtual function  }
{*< \private instance object  }
{*< \private the object of a subclass  }
type
  Pmlt_service_s = ^Tmlt_service_s;
  Tmlt_service_s = record
      parent : Tmlt_properties_s;
      get_frame : function (self:Tmlt_service; frame:Tmlt_frame_ptr; index:longint):longint;cdecl;
      close : Tmlt_destructor;
      close_object : pointer;
      local : pointer;
      child : pointer;
    end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MLT_SERVICE_PROPERTIES(service : longint) : longint;

function mlt_service_init(self:Tmlt_service; child:pointer):longint;cdecl;external;
procedure mlt_service_lock(self:Tmlt_service);cdecl;external;
procedure mlt_service_unlock(self:Tmlt_service);cdecl;external;
function mlt_service_identify(self:Tmlt_service):Tmlt_service_type;cdecl;external;
function mlt_service_connect_producer(self:Tmlt_service; producer:Tmlt_service; index:longint):longint;cdecl;external;
function mlt_service_insert_producer(self:Tmlt_service; producer:Tmlt_service; index:longint):longint;cdecl;external;
function mlt_service_disconnect_producer(self:Tmlt_service; index:longint):longint;cdecl;external;
function mlt_service_disconnect_all_producers(self:Tmlt_service):longint;cdecl;external;
function mlt_service_get_producer(self:Tmlt_service):Tmlt_service;cdecl;external;
function mlt_service_get_frame(self:Tmlt_service; frame:Tmlt_frame_ptr; index:longint):longint;cdecl;external;
function mlt_service_properties(self:Tmlt_service):Tmlt_properties;cdecl;external;
function mlt_service_consumer(self:Tmlt_service):Tmlt_service;cdecl;external;
function mlt_service_producer(self:Tmlt_service):Tmlt_service;cdecl;external;
function mlt_service_attach(self:Tmlt_service; filter:Tmlt_filter):longint;cdecl;external;
function mlt_service_detach(self:Tmlt_service; filter:Tmlt_filter):longint;cdecl;external;
procedure mlt_service_apply_filters(self:Tmlt_service; frame:Tmlt_frame; index:longint);cdecl;external;
function mlt_service_filter_count(self:Tmlt_service):longint;cdecl;external;
function mlt_service_move_filter(self:Tmlt_service; from:longint; to:longint):longint;cdecl;external;
function mlt_service_filter(self:Tmlt_service; index:longint):Tmlt_filter;cdecl;external;
function mlt_service_profile(self:Tmlt_service):Tmlt_profile;cdecl;external;
procedure mlt_service_set_profile(self:Tmlt_service; profile:Tmlt_profile);cdecl;external;
procedure mlt_service_close(self:Tmlt_service);cdecl;external;
(* Const before type ignored *)
procedure mlt_service_cache_put(self:Tmlt_service; name:Pchar; data:pointer; size:longint; destructor:Tmlt_destructor);cdecl;external;
(* Const before type ignored *)
function mlt_service_cache_get(self:Tmlt_service; name:Pchar):Tmlt_cache_item;cdecl;external;
(* Const before type ignored *)
procedure mlt_service_cache_set_size(self:Tmlt_service; name:Pchar; size:longint);cdecl;external;
(* Const before type ignored *)
function mlt_service_cache_get_size(self:Tmlt_service; name:Pchar):longint;cdecl;external;
procedure mlt_service_cache_purge(self:Tmlt_service);cdecl;external;
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_SERVICE_PROPERTIES(service : longint) : longint;
begin
  MLT_SERVICE_PROPERTIES:=@(service^.parent);
end;


end.
