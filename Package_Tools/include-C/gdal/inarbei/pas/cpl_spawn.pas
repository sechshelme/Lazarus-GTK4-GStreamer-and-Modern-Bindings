unit cpl_spawn;

interface

uses
  fp_gdal, cpl_vsi;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function CPLSpawn(papszArgv: PPchar; fin: PVSILFILE; fout: PVSILFILE; bDisplayErr: longint): longint; cdecl; external libgdal;

type
  PCPL_FILE_HANDLE = ^TCPL_FILE_HANDLE;
  TCPL_FILE_HANDLE = longint;

const
  CPL_FILE_INVALID_HANDLE = -(1);
type
  PCPL_PID = ^TCPL_PID;
  TCPL_PID = integer;

  PCPLSpawnedProcess = type Pointer;

function CPLSpawnAsync(pfnMain: Pointer; papszArgv: PPchar; bCreateInputPipe: longint; bCreateOutputPipe: longint; bCreateErrorPipe: longint;
  papszOptions: PPchar): PCPLSpawnedProcess; cdecl; external libgdal;
function CPLSpawnAsyncGetChildProcessId(p: PCPLSpawnedProcess): TCPL_PID; cdecl; external libgdal;
function CPLSpawnAsyncFinish(p: PCPLSpawnedProcess; bWait: longint; bKill: longint): longint; cdecl; external libgdal;
function CPLSpawnAsyncGetInputFileHandle(p: PCPLSpawnedProcess): TCPL_FILE_HANDLE; cdecl; external libgdal;
function CPLSpawnAsyncGetOutputFileHandle(p: PCPLSpawnedProcess): TCPL_FILE_HANDLE; cdecl; external libgdal;
function CPLSpawnAsyncGetErrorFileHandle(p: PCPLSpawnedProcess): TCPL_FILE_HANDLE; cdecl; external libgdal;
procedure CPLSpawnAsyncCloseInputFileHandle(p: PCPLSpawnedProcess); cdecl; external libgdal;
procedure CPLSpawnAsyncCloseOutputFileHandle(p: PCPLSpawnedProcess); cdecl; external libgdal;
procedure CPLSpawnAsyncCloseErrorFileHandle(p: PCPLSpawnedProcess); cdecl; external libgdal;
function CPLPipeRead(fin: TCPL_FILE_HANDLE; data: pointer; length: longint): longint; cdecl; external libgdal;
function CPLPipeWrite(fout: TCPL_FILE_HANDLE; data: pointer; length: longint): longint; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:32:58 ===


implementation



end.
