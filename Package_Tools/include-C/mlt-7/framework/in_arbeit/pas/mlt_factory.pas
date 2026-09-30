unit mlt_factory;

interface

uses
  fp_mlt;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_factory.h
 * \brief the factory method interfaces
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
{$ifndef MLT_FACTORY_H}
{$define MLT_FACTORY_H}
{$include "mlt_profile.h"}
{$include "mlt_repository.h"}
{$include "mlt_types.h"}
{*
 * \envvar \em MLT_PRODUCER the name of a default producer often used by other services, defaults to "loader"
 * \envvar \em MLT_CONSUMER the name of a default consumer, defaults to "sdl2" followed by "sdl"
 * \envvar \em MLT_TEST_CARD the name of a producer or file to be played when nothing is available (all tracks blank)
 * \envvar \em MLT_DATA overrides the default full path to the MLT and module supplemental data files, defaults to \p PREFIX_DATA
 * \envvar \em MLT_PROFILE selects the default mlt_profile_s, defaults to "dv_pal"
 * \envvar \em MLT_REPOSITORY overrides the default location of the plugin modules, defaults to \p PREFIX_LIB.
 * MLT_REPOSITORY is ignored on Windows and OS X relocatable builds.
 * \envvar \em MLT_PRESETS_PATH overrides the default full path to the properties preset files, defaults to \p MLT_DATA/presets
 * \envvar \em MLT_REPOSITORY_DENY colon separated list of modules to skip. Example: libmltplus:libmltavformat:libmltfrei0r
 * In case both qt5 and qt6 modules are found and none of both is blocked by MLT_REPOSITORY_DENY, qt6 will be blocked
 * \event \em producer-create-request fired when mlt_factory_producer is called;
 *   the event data is a pointer to mlt_factory_event_data
 * \event \em producer-create-done fired when a producer registers itself;
 *	 the event data is a pointer to mlt_factory_event_data
 * \event \em filter-create-request fired when mlt_factory_filter is called;
 *   the event data is a pointer to mlt_factory_event_data
 * \event \em filter-create-done fired when a filter registers itself;
 *   the event data is a pointer to mlt_factory_event_data
 * \event \em transition-create-request fired when mlt_factory_transition is called;
 *   the event data is a pointer to mlt_factory_event_data
 * \event \em transition-create-done fired when a transition registers itself;
 *   the event data is a pointer to mlt_factory_event_data
 * \event \em consumer-create-request fired when mlt_factory_consumer is called;
 *   the event data is a pointer to mlt_factory_event_data
 * \event \em consumer-create-done fired when a consumer registers itself;
 *   the event data is a pointer to mlt_factory_event_data
 * \event \em link-create-request fired when mlt_factory_link is called;
 *   the event data is a pointer to mlt_factory_event_data
 * \event \em link-create-done fired when a link registers itself;
 *   the event data is a pointer to mlt_factory_event_data
  }

function mlt_factory_init(directory:Pchar):Tmlt_repository;cdecl;external libmlt;
function mlt_factory_repository:Tmlt_repository;cdecl;external libmlt;
function mlt_factory_directory:Pchar;cdecl;external libmlt;
function mlt_environment(name:Pchar):Pchar;cdecl;external libmlt;
function mlt_environment_set(name:Pchar; value:Pchar):longint;cdecl;external libmlt;
function mlt_factory_event_object:Tmlt_properties;cdecl;external libmlt;
function mlt_factory_producer(profile:Tmlt_profile; service:Pchar; resource:pointer):Tmlt_producer;cdecl;external libmlt;
function mlt_factory_filter(profile:Tmlt_profile; service:Pchar; input:pointer):Tmlt_filter;cdecl;external libmlt;
function mlt_factory_link(service:Pchar; input:pointer):Tmlt_link;cdecl;external libmlt;
function mlt_factory_transition(profile:Tmlt_profile; service:Pchar; input:pointer):Tmlt_transition;cdecl;external libmlt;
function mlt_factory_consumer(profile:Tmlt_profile; service:Pchar; input:pointer):Tmlt_consumer;cdecl;external libmlt;
procedure mlt_factory_register_for_clean_up(ptr:pointer; destructor:Tmlt_destructor);cdecl;external libmlt;
procedure mlt_factory_close;cdecl;external libmlt;
function mlt_global_properties:Tmlt_properties;cdecl;external libmlt;
{* The event data for all factory-related events  }
{*< the name of the service requested  }
{*< an argument supplied to initialize the service, typically a string  }
{*< the service being created  }
type
  Pmlt_factory_event_data = ^Tmlt_factory_event_data;
  Tmlt_factory_event_data = record
      name : Pchar;
      input : pointer;
      service : pointer;
    end;
{$endif}

// === Konventiert am: 30-9-26 19:27:07 ===


implementation



end.
