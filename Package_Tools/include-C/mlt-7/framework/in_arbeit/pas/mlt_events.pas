unit mlt_events;

interface

uses
  fp_mlt;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * \file mlt_events.h
 * \brief event handling
 * \see mlt_events_struct
 *
 * Copyright (C) 2004-2021 Meltytech, LLC
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
{$ifndef MLT_EVENTS_H}
{$define MLT_EVENTS_H}
{$include "mlt_types.h"}
{* A container for data that may be supplied with an event  }
type
  Pmlt_event_data = ^Tmlt_event_data;
  Tmlt_event_data = record
      u : record
          case longint of
            0 : ( i : longint );
            1 : ( p : pointer );
          end;
    end;
{* An event data structure to convey thread parameters  }
{*< a pointer to a thread object or handle as determined by you  }
{*< a priority level for the thread  }
{*< a pointer to the function that thread will run  }
{*< an opaque data pointer to pass along  }

  Pmlt_event_data_thread = ^Tmlt_event_data_thread;
  Tmlt_event_data_thread = record
      thread : ^pointer;
      priority : Plongint;
      _function : Tmlt_thread_function_t;
      data : pointer;
    end;
{* event handler when receiving an event message
 * \param the properties object on which the event was registered
 * \param an opaque pointer to the listener's data
 * \param an event data object
  }

  Tmlt_listener = procedure (para1:Tmlt_properties; para2:pointer; para3:Tmlt_event_data);cdecl;

procedure mlt_events_init(self:Tmlt_properties);cdecl;external libmlt;
function mlt_events_register(self:Tmlt_properties; id:Pchar):longint;cdecl;external libmlt;
function mlt_events_fire(self:Tmlt_properties; id:Pchar; para3:Tmlt_event_data):longint;cdecl;external libmlt;
function mlt_events_listen(self:Tmlt_properties; listener_data:pointer; id:Pchar; listener:Tmlt_listener):Tmlt_event;cdecl;external libmlt;
procedure mlt_events_block(self:Tmlt_properties; listener_data:pointer);cdecl;external libmlt;
procedure mlt_events_unblock(self:Tmlt_properties; listener_data:pointer);cdecl;external libmlt;
procedure mlt_events_disconnect(self:Tmlt_properties; listener_data:pointer);cdecl;external libmlt;
function mlt_events_setup_wait_for(self:Tmlt_properties; id:Pchar):Tmlt_event;cdecl;external libmlt;
procedure mlt_events_wait_for(self:Tmlt_properties; event:Tmlt_event);cdecl;external libmlt;
procedure mlt_events_close_wait_for(self:Tmlt_properties; event:Tmlt_event);cdecl;external libmlt;
procedure mlt_event_inc_ref(self:Tmlt_event);cdecl;external libmlt;
procedure mlt_event_block(self:Tmlt_event);cdecl;external libmlt;
procedure mlt_event_unblock(self:Tmlt_event);cdecl;external libmlt;
procedure mlt_event_close(self:Tmlt_event);cdecl;external libmlt;
function mlt_event_data_none:Tmlt_event_data;cdecl;external libmlt;
function mlt_event_data_from_int(value:longint):Tmlt_event_data;cdecl;external libmlt;
function mlt_event_data_to_int(para1:Tmlt_event_data):longint;cdecl;external libmlt;
function mlt_event_data_from_string(value:Pchar):Tmlt_event_data;cdecl;external libmlt;
function mlt_event_data_to_string(para1:Tmlt_event_data):Pchar;cdecl;external libmlt;
function mlt_event_data_from_frame(para1:Tmlt_frame):Tmlt_event_data;cdecl;external libmlt;
function mlt_event_data_to_frame(para1:Tmlt_event_data):Tmlt_frame;cdecl;external libmlt;
function mlt_event_data_from_object(para1:pointer):Tmlt_event_data;cdecl;external libmlt;
function mlt_event_data_to_object(para1:Tmlt_event_data):pointer;cdecl;external libmlt;
{$endif}

// === Konventiert am: 30-9-26 19:27:10 ===


implementation



end.
