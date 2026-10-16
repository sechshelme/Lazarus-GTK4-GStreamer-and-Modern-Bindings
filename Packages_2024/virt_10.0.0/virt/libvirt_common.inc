{$IFDEF read_interface}


const
  LIBVIR_VERSION_NUMBER = 10000000;

function LIBVIR_CHECK_VERSION(major, minor, micro: longint): Boolean;

type
  TvirFreeCallback = procedure(opaque: pointer); cdecl;

type
  PvirConnectCloseReason = ^TvirConnectCloseReason;
  TvirConnectCloseReason = longint;
const
  VIR_CONNECT_CLOSE_REASON_ERROR = 0;
  VIR_CONNECT_CLOSE_REASON_EOF = 1;
  VIR_CONNECT_CLOSE_REASON_KEEPALIVE = 2;
  VIR_CONNECT_CLOSE_REASON_CLIENT = 3;
  VIR_CONNECT_CLOSE_REASON_LAST = 4;

type
  PvirTypedParameterType = ^TvirTypedParameterType;
  TvirTypedParameterType = longint;
const
  VIR_TYPED_PARAM_INT = 1;
  VIR_TYPED_PARAM_UINT = 2;
  VIR_TYPED_PARAM_LLONG = 3;
  VIR_TYPED_PARAM_ULLONG = 4;
  VIR_TYPED_PARAM_DOUBLE = 5;
  VIR_TYPED_PARAM_BOOLEAN = 6;
  VIR_TYPED_PARAM_STRING = 7;
  VIR_TYPED_PARAM_LAST = 8;

type
  PvirTypedParameterFlags = ^TvirTypedParameterFlags;
  TvirTypedParameterFlags = longint;
const
  VIR_TYPED_PARAM_STRING_OKAY = 1 shl 2;

const
  VIR_TYPED_PARAM_FIELD_LENGTH = 80;

type
  PvirTypedParameter = ^TvirTypedParameter;
  TvirTypedParameter = record
    field: array[0..(VIR_TYPED_PARAM_FIELD_LENGTH) - 1] of char;
    _type: longint;
    value: record
      case longint of
        0: (i: longint);
        1: (ui: dword);
        2: (l: int64);
        3: (ul: qword);
        4: (d: double);
        5: (b: char);
        6: (s: pchar);
      end;
  end;

  PvirTypedParameterPtr = ^TvirTypedParameterPtr;
  TvirTypedParameterPtr = PvirTypedParameter;

function virTypedParamsGet(params: TvirTypedParameterPtr; nparams: longint; name: pchar): TvirTypedParameterPtr; cdecl; external libvirt;
function virTypedParamsGetInt(params: TvirTypedParameterPtr; nparams: longint; name: pchar; value: Plongint): longint; cdecl; external libvirt;
function virTypedParamsGetUInt(params: TvirTypedParameterPtr; nparams: longint; name: pchar; value: Pdword): longint; cdecl; external libvirt;
function virTypedParamsGetLLong(params: TvirTypedParameterPtr; nparams: longint; name: pchar; value: Pint64): longint; cdecl; external libvirt;
function virTypedParamsGetULLong(params: TvirTypedParameterPtr; nparams: longint; name: pchar; value: Pqword): longint; cdecl; external libvirt;
function virTypedParamsGetDouble(params: TvirTypedParameterPtr; nparams: longint; name: pchar; value: Pdouble): longint; cdecl; external libvirt;
function virTypedParamsGetBoolean(params: TvirTypedParameterPtr; nparams: longint; name: pchar; value: Plongint): longint; cdecl; external libvirt;
function virTypedParamsGetString(params: TvirTypedParameterPtr; nparams: longint; name: pchar; value: PPchar): longint; cdecl; external libvirt;
function virTypedParamsAddInt(params: PvirTypedParameterPtr; nparams: Plongint; maxparams: Plongint; name: pchar; value: longint): longint; cdecl; external libvirt;
function virTypedParamsAddUInt(params: PvirTypedParameterPtr; nparams: Plongint; maxparams: Plongint; name: pchar; value: dword): longint; cdecl; external libvirt;
function virTypedParamsAddLLong(params: PvirTypedParameterPtr; nparams: Plongint; maxparams: Plongint; name: pchar; value: int64): longint; cdecl; external libvirt;
function virTypedParamsAddULLong(params: PvirTypedParameterPtr; nparams: Plongint; maxparams: Plongint; name: pchar; value: qword): longint; cdecl; external libvirt;
function virTypedParamsAddDouble(params: PvirTypedParameterPtr; nparams: Plongint; maxparams: Plongint; name: pchar; value: double): longint; cdecl; external libvirt;
function virTypedParamsAddBoolean(params: PvirTypedParameterPtr; nparams: Plongint; maxparams: Plongint; name: pchar; value: longint): longint; cdecl; external libvirt;
function virTypedParamsAddString(params: PvirTypedParameterPtr; nparams: Plongint; maxparams: Plongint; name: pchar; value: pchar): longint; cdecl; external libvirt;
function virTypedParamsAddStringList(params: PvirTypedParameterPtr; nparams: Plongint; maxparams: Plongint; name: pchar; values: PPchar): longint; cdecl; external libvirt;
function virTypedParamsAddFromString(params: PvirTypedParameterPtr; nparams: Plongint; maxparams: Plongint; name: pchar; _type: longint;
  value: pchar): longint; cdecl; external libvirt;
procedure virTypedParamsClear(params: TvirTypedParameterPtr; nparams: longint); cdecl; external libvirt;
procedure virTypedParamsFree(params: TvirTypedParameterPtr; nparams: longint); cdecl; external libvirt;

// === Konventiert am: 14-10-26 19:34:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function LIBVIR_CHECK_VERSION(major, minor, micro: longint): Boolean;
begin
  LIBVIR_CHECK_VERSION := (((major * 1000000) + (minor * 1000)) + micro) <= LIBVIR_VERSION_NUMBER;
end;


{$ENDIF read_implementation}
