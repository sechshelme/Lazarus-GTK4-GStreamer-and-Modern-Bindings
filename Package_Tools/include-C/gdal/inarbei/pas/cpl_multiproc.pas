unit cpl_multiproc;

interface

uses
  fp_gdal, cpl_port;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TCPLThreadFunc = procedure(para1: pointer); cdecl;
  PPCPLMutex = ^PCPLMutex;
  PCPLMutex = type Pointer;
  PCPLCond = type Pointer;
  PCPLJoinableThread = type Pointer;
  PCPLLock = type Pointer;
  PPCPLLock = ^PCPLLock;

function CPLLockFile(pszPath: pchar; dfWaitInSeconds: double): pointer; cdecl; external libgdal;
procedure CPLUnlockFile(hLock: pointer); cdecl; external libgdal;
const
  CPL_MUTEX_RECURSIVE = 0;
  CPL_MUTEX_ADAPTIVE = 1;
  CPL_MUTEX_REGULAR = 2;

function CPLCreateMutex: PCPLMutex; cdecl; external libgdal;
function CPLCreateMutexEx(nOptions: longint): PCPLMutex; cdecl; external libgdal;
function CPLCreateOrAcquireMutex(para1: PPCPLMutex; dfWaitInSeconds: double): longint; cdecl; external libgdal;
function CPLCreateOrAcquireMutexEx(para1: PPCPLMutex; dfWaitInSeconds: double; nOptions: longint): longint; cdecl; external libgdal;
function CPLAcquireMutex(hMutex: PCPLMutex; dfWaitInSeconds: double): longint; cdecl; external libgdal;
procedure CPLReleaseMutex(hMutex: PCPLMutex); cdecl; external libgdal;
procedure CPLDestroyMutex(hMutex: PCPLMutex); cdecl; external libgdal;
procedure CPLCleanupMasterMutex; cdecl; external libgdal;
function CPLCreateCond: PCPLCond; cdecl; external libgdal;
procedure CPLCondWait(hCond: PCPLCond; hMutex: PCPLMutex); cdecl; external libgdal;

type
  PCPLCondTimedWaitReason = ^TCPLCondTimedWaitReason;
  TCPLCondTimedWaitReason = longint;
const
  COND_TIMED_WAIT_COND = 0;
  COND_TIMED_WAIT_TIME_OUT = 1;
  COND_TIMED_WAIT_OTHER = 2;

function CPLCondTimedWait(hCond: PCPLCond; hMutex: PCPLMutex; dfWaitInSeconds: double): TCPLCondTimedWaitReason; cdecl; external libgdal;
procedure CPLCondSignal(hCond: PCPLCond); cdecl; external libgdal;
procedure CPLCondBroadcast(hCond: PCPLCond); cdecl; external libgdal;
procedure CPLDestroyCond(hCond: PCPLCond); cdecl; external libgdal;

function CPLGetPID: TGIntBig; cdecl; external libgdal;
function CPLGetCurrentProcessID: longint; cdecl; external libgdal;
function CPLCreateThread(pfnMain: TCPLThreadFunc; pArg: pointer): longint; cdecl; external libgdal;
function CPLCreateJoinableThread(pfnMain: TCPLThreadFunc; pArg: pointer): PCPLJoinableThread; cdecl; external libgdal;
procedure CPLJoinThread(hJoinableThread: PCPLJoinableThread); cdecl; external libgdal;
procedure CPLSleep(dfWaitInSeconds: double); cdecl; external libgdal;
function CPLGetThreadingModel: pchar; cdecl; external libgdal;
function CPLGetNumCPUs: longint; cdecl; external libgdal;

type
  PCPLLockType = ^TCPLLockType;
  TCPLLockType = longint;
const
  LOCK_RECURSIVE_MUTEX = 0;
  LOCK_ADAPTIVE_MUTEX = 1;
  LOCK_SPIN = 2;

function CPLCreateLock(eType: TCPLLockType): PCPLLock; cdecl; external libgdal;
function CPLCreateOrAcquireLock(para1: PPCPLLock; eType: TCPLLockType): longint; cdecl; external libgdal;
function CPLAcquireLock(para1: PCPLLock): longint; cdecl; external libgdal;
procedure CPLReleaseLock(para1: PCPLLock); cdecl; external libgdal;
procedure CPLDestroyLock(para1: PCPLLock); cdecl; external libgdal;
procedure CPLLockSetDebugPerf(para1: PCPLLock; bEnableIn: longint); cdecl; external libgdal;

const
  CTLS_RLBUFFERINFO = 1;
  CTLS_WIN32_COND = 2;
  CTLS_CSVTABLEPTR = 3;
  CTLS_CSVDEFAULTFILENAME = 4;
  CTLS_ERRORCONTEXT = 5;
  CTLS_VSICURL_CACHEDCONNECTION = 6;
  CTLS_PATHBUF = 7;
  CTLS_ABSTRACTARCHIVE_SPLIT = 8;
  CTLS_GDALOPEN_ANTIRECURSION = 9;
  CTLS_CPLSPRINTF = 10;
  CTLS_RESPONSIBLEPID = 11;
  CTLS_VERSIONINFO = 12;
  CTLS_VERSIONINFO_LICENCE = 13;
  CTLS_CONFIGOPTIONS = 14;
  CTLS_FINDFILE = 15;
  CTLS_VSIERRORCONTEXT = 16;
  CTLS_PROJCONTEXTHOLDER = 18;
  CTLS_GDALDEFAULTOVR_ANTIREC = 19;
  CTLS_HTTPFETCHCALLBACK = 20;
  CTLS_MAX = 32;

function CPLGetTLS(nIndex: longint): pointer; cdecl; external libgdal;
function CPLGetTLSEx(nIndex: longint; pbMemoryErrorOccurred: Plongint): pointer; cdecl; external libgdal;
procedure CPLSetTLS(nIndex: longint; pData: pointer; bFreeOnExit: longint); cdecl; external libgdal;

type
  TCPLTLSFreeFunc = procedure(pData: pointer); cdecl;

procedure CPLSetTLSWithFreeFunc(nIndex: longint; pData: pointer; pfnFree: TCPLTLSFreeFunc); cdecl; external libgdal;
procedure CPLSetTLSWithFreeFuncEx(nIndex: longint; pData: pointer; pfnFree: TCPLTLSFreeFunc; pbMemoryErrorOccurred: Plongint); cdecl; external libgdal;
procedure CPLCleanupTLS; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:20:03 ===


implementation



end.
