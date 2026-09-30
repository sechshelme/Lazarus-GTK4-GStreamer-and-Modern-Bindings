
unit mlt_chain;
interface

{
  Automatically converted by H2Pas 1.0.0 from mlt_chain.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mlt_chain.h
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
Pmlt_chain_s  = ^mlt_chain_s;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_chain.h
 * \brief chain service class
 * \see mlt_chain_s
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
{$ifndef MLT_CHAIN_H}
{$define MLT_CHAIN_H}
{$include "mlt_link.h"}
{$include "mlt_producer.h"}
{* \brief Chain class
 *
 * The chain is a producer class that that can connect multiple link producers in a sequence.
 *
 * \extends mlt_producer_s
  }
{*< \private instance object  }
type
  Pmlt_chain_s = ^Tmlt_chain_s;
  Tmlt_chain_s = record
      parent : Tmlt_producer_s;
      local : pointer;
    end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MLT_CHAIN_PRODUCER(chain : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_CHAIN_SERVICE(chain : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_CHAIN_PROPERTIES(chain : longint) : longint;

function mlt_chain_init(para1:Tmlt_profile):Tmlt_chain;cdecl;external;
procedure mlt_chain_set_source(self:Tmlt_chain; source:Tmlt_producer);cdecl;external;
function mlt_chain_get_source(self:Tmlt_chain):Tmlt_producer;cdecl;external;
function mlt_chain_attach(self:Tmlt_chain; link:Tmlt_link):longint;cdecl;external;
function mlt_chain_detach(self:Tmlt_chain; link:Tmlt_link):longint;cdecl;external;
function mlt_chain_link_count(self:Tmlt_chain):longint;cdecl;external;
function mlt_chain_move_link(self:Tmlt_chain; from:longint; to:longint):longint;cdecl;external;
function mlt_chain_link(self:Tmlt_chain; index:longint):Tmlt_link;cdecl;external;
procedure mlt_chain_close(self:Tmlt_chain);cdecl;external;
procedure mlt_chain_attach_normalizers(self:Tmlt_chain);cdecl;external;
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_CHAIN_PRODUCER(chain : longint) : longint;
begin
  MLT_CHAIN_PRODUCER:=@(chain^.parent);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_CHAIN_SERVICE(chain : longint) : longint;
begin
  MLT_CHAIN_SERVICE:=MLT_PRODUCER_SERVICE(MLT_CHAIN_PRODUCER(chain));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MLT_CHAIN_PROPERTIES(chain : longint) : longint;
begin
  MLT_CHAIN_PROPERTIES:=MLT_SERVICE_PROPERTIES(MLT_CHAIN_SERVICE(chain));
end;


end.
