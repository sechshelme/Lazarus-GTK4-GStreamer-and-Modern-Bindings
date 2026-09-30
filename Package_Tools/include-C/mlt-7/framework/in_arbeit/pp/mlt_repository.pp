
unit mlt_repository;
interface

{
  Automatically converted by H2Pas 1.0.0 from mlt_repository.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mlt_repository.h
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
    Pmlt_register_callback  = ^mlt_register_callback;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_repository.h
 * \brief provides a map between service and shared objects
 * \see mlt_repository_s
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
{$ifndef MLT_REPOSITORY_H}
{$define MLT_REPOSITORY_H}
{$include "mlt_profile.h"}
{$include "mlt_types.h"}
{* This callback is the main entry point into a module, which must be exported
 *  with the symbol "mlt_register".
 *
 *  Inside the callback, the module registers the additional callbacks below.
  }
type

  Tmlt_repository_callback = procedure (para1:Tmlt_repository);cdecl;
{* The callback function that modules implement to construct a service.
  }
(* Const before type ignored *)
{ service name  }(* Const before type ignored *)
{ arg  }
  Pmlt_register_callback = ^Tmlt_register_callback;
  Tmlt_register_callback = function (para1:Tmlt_profile; para2:Tmlt_service_type; para3:Pchar; para4:pointer):pointer;cdecl;
{* The callback function that modules implement to supply metadata as a properties list.
  }
(* Const before type ignored *)
{ service name  }{ callback_data  }
  Tmlt_metadata_callback = function (para1:Tmlt_service_type; para2:Pchar; para3:pointer):Tmlt_properties;cdecl;
{* A convenience macro to create an entry point for service registration.  }
(* error 
#define MLT_REPOSITORY void mlt_register(mlt_repository repository)
in define line 53 *)
    {* A convenience macro to a register service in a more declarative manner.  }
    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   

    function MLT_REGISTER(_type,service,symbol : longint) : longint;    

    {* A convenience macro to a register metadata in a more declarative manner.  }
    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function MLT_REGISTER_METADATA(_type,service,callback,data : longint) : longint;    

(* Const before type ignored *)
function mlt_repository_init(directory:Pchar):Tmlt_repository;cdecl;external;
(* Const before type ignored *)
procedure mlt_repository_register(self:Tmlt_repository; service_type:Tmlt_service_type; service:Pchar; para4:Tmlt_register_callback);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mlt_repository_create(self:Tmlt_repository; profile:Tmlt_profile; _type:Tmlt_service_type; service:Pchar; arg:pointer):pointer;cdecl;external;
procedure mlt_repository_close(self:Tmlt_repository);cdecl;external;
function mlt_repository_consumers(self:Tmlt_repository):Tmlt_properties;cdecl;external;
function mlt_repository_filters(self:Tmlt_repository):Tmlt_properties;cdecl;external;
function mlt_repository_links(self:Tmlt_repository):Tmlt_properties;cdecl;external;
function mlt_repository_producers(self:Tmlt_repository):Tmlt_properties;cdecl;external;
function mlt_repository_transitions(self:Tmlt_repository):Tmlt_properties;cdecl;external;
(* Const before type ignored *)
procedure mlt_repository_register_metadata(self:Tmlt_repository; _type:Tmlt_service_type; service:Pchar; para4:Tmlt_metadata_callback; callback_data:pointer);cdecl;external;
(* Const before type ignored *)
function mlt_repository_metadata(self:Tmlt_repository; _type:Tmlt_service_type; service:Pchar):Tmlt_properties;cdecl;external;
function mlt_repository_languages(self:Tmlt_repository):Tmlt_properties;cdecl;external;
function mlt_repository_presets:Tmlt_properties;cdecl;external;
{$endif}

implementation

    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function MLT_REGISTER(_type,service,symbol : longint) : longint;
    begin
      MLT_REGISTER:=mlt_repository_register(repository,_type,service,Tmlt_register_callback(symbol));
    end;

    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function MLT_REGISTER_METADATA(_type,service,callback,data : longint) : longint;
    begin
      MLT_REGISTER_METADATA:=mlt_repository_register_metadata(repository,_type,service,Tmlt_metadata_callback(callback),data);
    end;


end.
