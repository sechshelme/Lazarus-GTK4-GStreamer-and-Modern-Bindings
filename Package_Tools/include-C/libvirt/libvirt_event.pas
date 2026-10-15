unit libvirt_event;

interface

uses
  fp_virt, libvirt_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PvirEventHandleType = ^TvirEventHandleType;
  TvirEventHandleType = longint;
const
  VIR_EVENT_HANDLE_READABLE = 1 shl 0;
  VIR_EVENT_HANDLE_WRITABLE = 1 shl 1;
  VIR_EVENT_HANDLE_ERROR = 1 shl 2;
  VIR_EVENT_HANDLE_HANGUP = 1 shl 3;

type
  TvirEventHandleCallback = procedure(watch: longint; fd: longint; events: longint; opaque: pointer); cdecl;
  TvirEventAddHandleFunc = function(fd: longint; event: longint; cb: TvirEventHandleCallback; opaque: pointer; ff: TvirFreeCallback): longint; cdecl;
  TvirEventUpdateHandleFunc = procedure(watch: longint; event: longint); cdecl;
  TvirEventRemoveHandleFunc = function(watch: longint): longint; cdecl;
  TvirEventTimeoutCallback = procedure(timer: longint; opaque: pointer); cdecl;
  TvirEventAddTimeoutFunc = function(timeout: longint; cb: TvirEventTimeoutCallback; opaque: pointer; ff: TvirFreeCallback): longint; cdecl;
  TvirEventUpdateTimeoutFunc = procedure(timer: longint; timeout: longint); cdecl;
  TvirEventRemoveTimeoutFunc = function(timer: longint): longint; cdecl;

procedure virEventRegisterImpl(addHandle: TvirEventAddHandleFunc; updateHandle: TvirEventUpdateHandleFunc; removeHandle: TvirEventRemoveHandleFunc; addTimeout: TvirEventAddTimeoutFunc; updateTimeout: TvirEventUpdateTimeoutFunc;
  removeTimeout: TvirEventRemoveTimeoutFunc); cdecl; external libvirt;
function virEventRegisterDefaultImpl: longint; cdecl; external libvirt;
function virEventRunDefaultImpl: longint; cdecl; external libvirt;
function virEventAddHandle(fd: longint; events: longint; cb: TvirEventHandleCallback; opaque: pointer; ff: TvirFreeCallback): longint; cdecl; external libvirt;
procedure virEventUpdateHandle(watch: longint; events: longint); cdecl; external libvirt;
function virEventRemoveHandle(watch: longint): longint; cdecl; external libvirt;
function virEventAddTimeout(frequency: longint; cb: TvirEventTimeoutCallback; opaque: pointer; ff: TvirFreeCallback): longint; cdecl; external libvirt;
procedure virEventUpdateTimeout(timer: longint; frequency: longint); cdecl; external libvirt;
function virEventRemoveTimeout(timer: longint): longint; cdecl; external libvirt;

// === Konventiert am: 14-10-26 19:34:44 ===


implementation



end.
