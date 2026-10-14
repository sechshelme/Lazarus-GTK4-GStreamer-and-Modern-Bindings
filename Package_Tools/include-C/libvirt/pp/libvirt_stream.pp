
unit libvirt_stream;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvirt_stream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvirt_stream.h
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
Pint64  = ^int64;
Plongint  = ^longint;
PvirStreamEventType  = ^virStreamEventType;
PvirStreamFlags  = ^virStreamFlags;
PvirStreamRecvFlagsValues  = ^virStreamRecvFlagsValues;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libvirt-stream.h
 * Summary: APIs for management of streams
 * Description: Provides APIs for the management of streams
 *
 * Copyright (C) 2006-2014 Red Hat, Inc.
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
 * License along with this library.  If not, see
 * <http://www.gnu.org/licenses/>.
  }
{$ifndef LIBVIRT_STREAM_H}
{$define LIBVIRT_STREAM_H}
{$ifndef __VIR_LIBVIRT_H_INCLUDES__}
{$error "Don't include this file directly, only use libvirt/libvirt.h"}
{$endif}
{*
 * virStreamFlags:
 *
 * Since: 0.7.2
  }
{ (Since: 0.7.2)  }
type
  PvirStreamFlags = ^TvirStreamFlags;
  TvirStreamFlags =  Longint;
  Const
    VIR_STREAM_NONBLOCK = 1 shl 0;
;

function virStreamNew(conn:TvirConnectPtr; flags:dword):TvirStreamPtr;cdecl;external;
function virStreamRef(st:TvirStreamPtr):longint;cdecl;external;
(* Const before type ignored *)
function virStreamSend(st:TvirStreamPtr; data:Pchar; nbytes:Tsize_t):longint;cdecl;external;
function virStreamRecv(st:TvirStreamPtr; data:Pchar; nbytes:Tsize_t):longint;cdecl;external;
{*
 * virStreamRecvFlagsValues:
 *
 * Since: 3.4.0
  }
{ (Since: 3.4.0)  }
type
  PvirStreamRecvFlagsValues = ^TvirStreamRecvFlagsValues;
  TvirStreamRecvFlagsValues =  Longint;
  Const
    VIR_STREAM_RECV_STOP_AT_HOLE = 1 shl 0;
;

function virStreamRecvFlags(st:TvirStreamPtr; data:Pchar; nbytes:Tsize_t; flags:dword):longint;cdecl;external;
function virStreamSendHole(st:TvirStreamPtr; length:int64; flags:dword):longint;cdecl;external;
function virStreamRecvHole(para1:TvirStreamPtr; length:Pint64; flags:dword):longint;cdecl;external;
{*
 * virStreamSourceFunc:
 *
 * @st: the stream object
 * @data: preallocated array to be filled with data
 * @nbytes: size of the data array
 * @opaque: optional application provided data
 *
 * The virStreamSourceFunc callback is used together with
 * the virStreamSendAll and virStreamSparseSendAll functions
 * for libvirt to obtain the data that is to be sent.
 *
 * The callback will be invoked multiple times,
 * fetching data in small chunks. The application
 * should fill the 'data' array with up to 'nbytes'
 * of data and then return the number actual number
 * of bytes. The callback will continue to be
 * invoked until it indicates the end of the source
 * has been reached by returning 0. A return value
 * of -1 at any time will abort the send operation.
 *
 * Please note that for more accurate error reporting the
 * callback should set appropriate errno on failure.
 *
 * Returns the number of bytes filled, 0 upon end
 * of file, or -1 upon error
 *
 * Since: 0.7.2
  }
type

  TvirStreamSourceFunc = function (st:TvirStreamPtr; data:Pchar; nbytes:Tsize_t; opaque:pointer):longint;cdecl;

function virStreamSendAll(st:TvirStreamPtr; handler:TvirStreamSourceFunc; opaque:pointer):longint;cdecl;external;
{*
 * virStreamSourceHoleFunc:
 * @st: the stream object
 * @inData: are we in data section
 * @length: how long is the section we are currently in
 * @opaque: optional application provided data
 *
 * The virStreamSourceHoleFunc callback is used together with the
 * virStreamSparseSendAll function for libvirt to obtain the
 * length of section stream is currently in.
 *
 * Moreover, upon successful return, @length should be updated
 * with how many bytes are left until the current section ends
 * (either data section or hole section). Also the stream is
 * currently in data section, @inData should be set to a non-zero
 * value and vice versa.
 *
 * NB: there's an implicit hole at the end of each file. If
 * that's the case, @inData and @length should be both set to 0.
 *
 * This function should not adjust the current position within
 * the file.
 *
 * Please note that for more accurate error reporting the
 * callback should set appropriate errno on failure.
 *
 * Returns 0 on success,
 *        -1 upon error
 *
 * Since: 3.4.0
  }
type

  TvirStreamSourceHoleFunc = function (st:TvirStreamPtr; inData:Plongint; length:Pint64; opaque:pointer):longint;cdecl;
{*
 * virStreamSourceSkipFunc:
 * @st: the stream object
 * @length: stream hole size
 * @opaque: optional application provided data
 *
 * This callback is used together with the virStreamSparseSendAll
 * to skip holes in the underlying file as reported by
 * virStreamSourceHoleFunc.
 *
 * The callback may be invoked multiple times as holes are found
 * during processing a stream. The application should skip
 * processing the hole in the stream source and then return.
 * A return value of -1 at any time will abort the send operation.
 *
 * Please note that for more accurate error reporting the
 * callback should set appropriate errno on failure.
 *
 * Returns 0 on success,
 *        -1 upon error.
 *
 * Since: 3.4.0
  }

  TvirStreamSourceSkipFunc = function (st:TvirStreamPtr; length:int64; opaque:pointer):longint;cdecl;

function virStreamSparseSendAll(st:TvirStreamPtr; handler:TvirStreamSourceFunc; holeHandler:TvirStreamSourceHoleFunc; skipHandler:TvirStreamSourceSkipFunc; opaque:pointer):longint;cdecl;external;
{*
 * virStreamSinkFunc:
 *
 * @st: the stream object
 * @data: preallocated array to be filled with data
 * @nbytes: size of the data array
 * @opaque: optional application provided data
 *
 * The virStreamSinkFunc callback is used together with the
 * virStreamRecvAll or virStreamSparseRecvAll functions for
 * libvirt to provide the data that has been received.
 *
 * The callback will be invoked multiple times,
 * providing data in small chunks. The application
 * should consume up 'nbytes' from the 'data' array
 * of data and then return the number actual number
 * of bytes consumed. The callback will continue to be
 * invoked until it indicates the end of the stream
 * has been reached. A return value of -1 at any time
 * will abort the receive operation
 *
 * Please note that for more accurate error reporting the
 * callback should set appropriate errno on failure.
 *
 * Returns the number of bytes consumed or -1 upon
 * error
 *
 * Since: 0.7.2
  }
(* Const before type ignored *)
type

  TvirStreamSinkFunc = function (st:TvirStreamPtr; data:Pchar; nbytes:Tsize_t; opaque:pointer):longint;cdecl;

function virStreamRecvAll(st:TvirStreamPtr; handler:TvirStreamSinkFunc; opaque:pointer):longint;cdecl;external;
{*
 * virStreamSinkHoleFunc:
 * @st: the stream object
 * @length: stream hole size
 * @opaque: optional application provided data
 *
 * This callback is used together with the virStreamSparseRecvAll
 * function for libvirt to provide the size of a hole that
 * occurred in the stream.
 *
 * The callback may be invoked multiple times as holes are found
 * during processing a stream. The application should create the
 * hole in the stream target and then return. A return value of
 * -1 at any time will abort the receive operation.
 *
 * Please note that for more accurate error reporting the
 * callback should set appropriate errno on failure.
 *
 * Returns 0 on success,
 *        -1 upon error
 *
 * Since: 3.4.0
  }
type

  TvirStreamSinkHoleFunc = function (st:TvirStreamPtr; length:int64; opaque:pointer):longint;cdecl;

function virStreamSparseRecvAll(stream:TvirStreamPtr; handler:TvirStreamSinkFunc; holeHandler:TvirStreamSinkHoleFunc; opaque:pointer):longint;cdecl;external;
{*
 * virStreamEventType:
 *
 * Since: 0.7.2
  }
{ (Since: 0.7.2)  }
{ (Since: 0.7.2)  }
{ (Since: 0.7.2)  }
{ (Since: 0.7.2)  }
type
  PvirStreamEventType = ^TvirStreamEventType;
  TvirStreamEventType =  Longint;
  Const
    VIR_STREAM_EVENT_READABLE = 1 shl 0;
    VIR_STREAM_EVENT_WRITABLE = 1 shl 1;
    VIR_STREAM_EVENT_ERROR = 1 shl 2;
    VIR_STREAM_EVENT_HANGUP = 1 shl 3;
;
{*
 * virStreamEventCallback:
 *
 * @stream: stream on which the event occurred
 * @events: bitset of events from virEventHandleType constants
 * @opaque: user data registered with handle
 *
 * Callback for receiving stream events. The callback will
 * be invoked once for each event which is pending.
 *
 * Since: 0.7.2
  }
type

  TvirStreamEventCallback = procedure (stream:TvirStreamPtr; events:longint; opaque:pointer);cdecl;

function virStreamEventAddCallback(stream:TvirStreamPtr; events:longint; cb:TvirStreamEventCallback; opaque:pointer; ff:TvirFreeCallback):longint;cdecl;external;
function virStreamEventUpdateCallback(stream:TvirStreamPtr; events:longint):longint;cdecl;external;
function virStreamEventRemoveCallback(stream:TvirStreamPtr):longint;cdecl;external;
function virStreamFinish(st:TvirStreamPtr):longint;cdecl;external;
function virStreamAbort(st:TvirStreamPtr):longint;cdecl;external;
function virStreamFree(st:TvirStreamPtr):longint;cdecl;external;
{$endif}
{ LIBVIRT_STREAM_H  }

implementation


end.
