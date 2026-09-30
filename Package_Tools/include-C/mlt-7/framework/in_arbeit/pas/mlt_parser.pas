unit mlt_parser;

interface

uses
  fp_mlt;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_parser.h
 * \brief service parsing functionality
 * \see mlt_parser_s
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
{$ifndef MLT_PARSER_H}
{$define MLT_PARSER_H}
{$include "mlt_types.h"}
{* \brief Parser class
 *
 * \extends mlt_properties_s
  }
type
  Pmlt_parser_s = ^Tmlt_parser_s;
  Tmlt_parser_s = record
      parent : Tmlt_properties_s;
      on_invalid : function (self:Tmlt_parser; object:Tmlt_service):longint;cdecl;
      on_unknown : function (self:Tmlt_parser; object:Tmlt_service):longint;cdecl;
      on_start_producer : function (self:Tmlt_parser; object:Tmlt_producer):longint;cdecl;
      on_end_producer : function (self:Tmlt_parser; object:Tmlt_producer):longint;cdecl;
      on_start_playlist : function (self:Tmlt_parser; object:Tmlt_playlist):longint;cdecl;
      on_end_playlist : function (self:Tmlt_parser; object:Tmlt_playlist):longint;cdecl;
      on_start_tractor : function (self:Tmlt_parser; object:Tmlt_tractor):longint;cdecl;
      on_end_tractor : function (self:Tmlt_parser; object:Tmlt_tractor):longint;cdecl;
      on_start_multitrack : function (self:Tmlt_parser; object:Tmlt_multitrack):longint;cdecl;
      on_end_multitrack : function (self:Tmlt_parser; object:Tmlt_multitrack):longint;cdecl;
      on_start_track : function (self:Tmlt_parser):longint;cdecl;
      on_end_track : function (self:Tmlt_parser):longint;cdecl;
      on_start_filter : function (self:Tmlt_parser; object:Tmlt_filter):longint;cdecl;
      on_end_filter : function (self:Tmlt_parser; object:Tmlt_filter):longint;cdecl;
      on_start_transition : function (self:Tmlt_parser; object:Tmlt_transition):longint;cdecl;
      on_end_transition : function (self:Tmlt_parser; object:Tmlt_transition):longint;cdecl;
      on_start_chain : function (self:Tmlt_parser; object:Tmlt_chain):longint;cdecl;
      on_end_chain : function (self:Tmlt_parser; object:Tmlt_chain):longint;cdecl;
      on_start_link : function (self:Tmlt_parser; object:Tmlt_link):longint;cdecl;
      on_end_link : function (self:Tmlt_parser; object:Tmlt_link):longint;cdecl;
    end;


function mlt_parser_new:Tmlt_parser;cdecl;external libmlt;
function mlt_parser_properties(self:Tmlt_parser):Tmlt_properties;cdecl;external libmlt;
function mlt_parser_start(self:Tmlt_parser; object:Tmlt_service):longint;cdecl;external libmlt;
procedure mlt_parser_close(self:Tmlt_parser);cdecl;external libmlt;
{$endif}

// === Konventiert am: 30-9-26 19:36:07 ===


implementation



end.
