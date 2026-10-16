{$IFDEF read_interface}


type
  PvirStreamFlags = ^TvirStreamFlags;
  TvirStreamFlags = longint;
const
  VIR_STREAM_NONBLOCK = 1 shl 0;

function virStreamNew(conn: TvirConnectPtr; flags: dword): TvirStreamPtr; cdecl; external libvirt;
function virStreamRef(st: TvirStreamPtr): longint; cdecl; external libvirt;
function virStreamSend(st: TvirStreamPtr; data: pchar; nbytes: Tsize_t): longint; cdecl; external libvirt;
function virStreamRecv(st: TvirStreamPtr; data: pchar; nbytes: Tsize_t): longint; cdecl; external libvirt;

type
  PvirStreamRecvFlagsValues = ^TvirStreamRecvFlagsValues;
  TvirStreamRecvFlagsValues = longint;
const
  VIR_STREAM_RECV_STOP_AT_HOLE = 1 shl 0;

function virStreamRecvFlags(st: TvirStreamPtr; data: pchar; nbytes: Tsize_t; flags: dword): longint; cdecl; external libvirt;
function virStreamSendHole(st: TvirStreamPtr; length: int64; flags: dword): longint; cdecl; external libvirt;
function virStreamRecvHole(para1: TvirStreamPtr; length: Pint64; flags: dword): longint; cdecl; external libvirt;

type
  TvirStreamSourceFunc = function(st: TvirStreamPtr; data: pchar; nbytes: Tsize_t; opaque: pointer): longint; cdecl;

function virStreamSendAll(st: TvirStreamPtr; handler: TvirStreamSourceFunc; opaque: pointer): longint; cdecl; external libvirt;

type
  TvirStreamSourceHoleFunc = function(st: TvirStreamPtr; inData: Plongint; length: Pint64; opaque: pointer): longint; cdecl;
  TvirStreamSourceSkipFunc = function(st: TvirStreamPtr; length: int64; opaque: pointer): longint; cdecl;

function virStreamSparseSendAll(st: TvirStreamPtr; handler: TvirStreamSourceFunc; holeHandler: TvirStreamSourceHoleFunc; skipHandler: TvirStreamSourceSkipFunc; opaque: pointer): longint; cdecl; external libvirt;

type
  TvirStreamSinkFunc = function(st: TvirStreamPtr; data: pchar; nbytes: Tsize_t; opaque: pointer): longint; cdecl;

function virStreamRecvAll(st: TvirStreamPtr; handler: TvirStreamSinkFunc; opaque: pointer): longint; cdecl; external libvirt;

type
  TvirStreamSinkHoleFunc = function(st: TvirStreamPtr; length: int64; opaque: pointer): longint; cdecl;

function virStreamSparseRecvAll(stream: TvirStreamPtr; handler: TvirStreamSinkFunc; holeHandler: TvirStreamSinkHoleFunc; opaque: pointer): longint; cdecl; external libvirt;

type
  PvirStreamEventType = ^TvirStreamEventType;
  TvirStreamEventType = longint;
const
  VIR_STREAM_EVENT_READABLE = 1 shl 0;
  VIR_STREAM_EVENT_WRITABLE = 1 shl 1;
  VIR_STREAM_EVENT_ERROR = 1 shl 2;
  VIR_STREAM_EVENT_HANGUP = 1 shl 3;

type
  TvirStreamEventCallback = procedure(stream: TvirStreamPtr; events: longint; opaque: pointer); cdecl;

function virStreamEventAddCallback(stream: TvirStreamPtr; events: longint; cb: TvirStreamEventCallback; opaque: pointer; ff: TvirFreeCallback): longint; cdecl; external libvirt;
function virStreamEventUpdateCallback(stream: TvirStreamPtr; events: longint): longint; cdecl; external libvirt;
function virStreamEventRemoveCallback(stream: TvirStreamPtr): longint; cdecl; external libvirt;
function virStreamFinish(st: TvirStreamPtr): longint; cdecl; external libvirt;
function virStreamAbort(st: TvirStreamPtr): longint; cdecl; external libvirt;
function virStreamFree(st: TvirStreamPtr): longint; cdecl; external libvirt;

// === Konventiert am: 14-10-26 19:34:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
