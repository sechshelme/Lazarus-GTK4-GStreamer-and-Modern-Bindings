{$IFDEF read_interface}


type
  Tb2AllocFcn = function(size: dword; alignment: longint): pointer; cdecl;
  Tb2FreeFcn = procedure(mem: pointer; size: dword); cdecl;
  Tb2AssertFcn = function(condition: pchar; fileName: pchar; lineNumber: longint): longint; cdecl;
  Tb2LogFcn = procedure(message: pchar); cdecl;

procedure b2SetAllocator(allocFcn: Tb2AllocFcn; freeFcn: Tb2FreeFcn); cdecl; external libbox2d;
function b2GetByteCount: longint; cdecl; external libbox2d;
procedure b2SetAssertFcn(assertFcn: Tb2AssertFcn); cdecl; external libbox2d;
procedure b2SetLogFcn(logFcn: Tb2LogFcn); cdecl; external libbox2d;

type
  Tb2Version = record
    major: longint;
    minor: longint;
    revision: longint;
  end;
  Pb2Version = ^Tb2Version;

function b2GetVersion: Tb2Version; cdecl; external libbox2d;

function b2InternalAssertFcn(condition: pchar; fileName: pchar; lineNumber: longint): longint; cdecl; external libbox2d;
function b2GetTicks: Tuint64_t; cdecl; external libbox2d;
function b2GetMilliseconds(ticks: Tuint64_t): single; cdecl; external libbox2d;
function b2GetMillisecondsAndReset(ticks: Puint64_t): single; cdecl; external libbox2d;
procedure b2Yield; cdecl; external libbox2d;

const
  B2_HASH_INIT = 5381;

function b2Hash(hash: Tuint32_t; data: Puint8_t; count: longint): Tuint32_t; cdecl; external libbox2d;

// === Konventiert am: 7-3-26 16:28:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
