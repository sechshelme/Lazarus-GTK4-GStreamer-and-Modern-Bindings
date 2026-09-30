
unit mlt_link;
interface

{
  Automatically converted by H2Pas 1.0.0 from mlt_link.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mlt_link.h
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
Pmlt_link_s  = ^mlt_link_s;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_link.h
 * \brief link service class
 * \see mlt_link_s
 *
 * Copyright (C) 2020 Meltytech, LLC
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
{$ifndef MLT_LINK_H}
{$define MLT_LINK_H}
{$include "mlt_producer.h"}
{* \brief Link class
 *
 * The link is a producer class that that can be connected to other link producers in a Chain.
 *
 * \extends mlt_producer_s
 * \properties \em next holds a reference to the next producer in the chain
  }
{* \publicsection  }
{* \protectedsection  }
{* Get a frame of data (virtual function).
	 *
	 * \param mlt_link a link
	 * \param mlt_frame_ptr a frame pointer by reference
	 * \param int an index
	 * \return true if there was an error
	  }
{* Configure the link (virtual function).
	 *
	 * \param mlt_link a link
	 * \param mlt_profile a default profile to use
	  }
{* Virtual close function  }
{* \privatesection  }
{* the object of a subclass  }
type
  Pmlt_link_s = ^Tmlt_link_s;
  Tmlt_link_s = record
      parent : Tmlt_producer_s;
      get_frame : function (para1:Tmlt_link; para2:Tmlt_frame_ptr; para3:longint):longint;cdecl;
      configure : procedure (para1:Tmlt_link; para2:Tmlt_profile);cdecl;
      close : procedure (para1:Tmlt_link);cdecl;
      next : Tmlt_producer;
      child : pointer;
    end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MLT_LINK_PRODUCER(link : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_LINK_SERVICE(link : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_LINK_PROPERTIES(link : longint) : longint;

function mlt_link_init:Tmlt_link;cdecl;external;
function mlt_link_connect_next(self:Tmlt_link; next:Tmlt_producer; chain_profile:Tmlt_profile):longint;cdecl;external;
procedure mlt_link_close(self:Tmlt_link);cdecl;external;
{ Link filter wrapper functions }
(* Const before type ignored *)
function mlt_link_filter_init(profile:Tmlt_profile; _type:Tmlt_service_type; id:Pchar; arg:Pchar):Tmlt_link;cdecl;external;
(* Const before type ignored *)
function mlt_link_filter_metadata(_type:Tmlt_service_type; id:Pchar; data:pointer):Tmlt_properties;cdecl;external;
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_LINK_PRODUCER(link : longint) : longint;
begin
  MLT_LINK_PRODUCER:=@(link^.parent);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_LINK_SERVICE(link : longint) : longint;
begin
  MLT_LINK_SERVICE:=MLT_PRODUCER_SERVICE(MLT_LINK_PRODUCER(link));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_LINK_PROPERTIES(link : longint) : longint;
begin
  MLT_LINK_PROPERTIES:=MLT_SERVICE_PROPERTIES(MLT_LINK_SERVICE(link));
end;


end.
