unit cpl_multiproc;

interface

uses
  fp_gdal;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*********************************************************************
 * $Id$
 *
 * Project:  CPL - Common Portability Library
 * Purpose:  CPL Multi-Threading, and process handling portability functions.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 **********************************************************************
 * Copyright (c) 2002, Frank Warmerdam
 * Copyright (c) 2008-2013, Even Rouault <even dot rouault at spatialys.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *************************************************************************** }
{$ifndef CPL_MULTIPROC_H_INCLUDED_}
{$define CPL_MULTIPROC_H_INCLUDED_}
{$include "cpl_port.h"}
{
** There are three primary implementations of the multi-process support
** controlled by one of CPL_MULTIPROC_WIN32, CPL_MULTIPROC_PTHREAD or
** CPL_MULTIPROC_STUB being defined.  If none are defined, the stub
** implementation will be used.
 }
{$if defined(WIN32) && !defined(CPL_MULTIPROC_STUB)}
{$define CPL_MULTIPROC_WIN32}
{ MinGW can have pthread support, so disable it to avoid issues  }
{ in cpl_multiproc.cpp  }
{$undef CPL_MULTIPROC_PTHREAD}
{$endif}
type

  TCPLThreadFunc = procedure (para1:pointer);cdecl;

function CPLLockFile(pszPath:Pchar; dfWaitInSeconds:Tdouble):pointer;cdecl;external libgdal;
procedure CPLUnlockFile(hLock:pointer);cdecl;external libgdal;
{$ifdef DEBUG}
type
{ Options for CPLCreateMutexEx() and CPLCreateOrAcquireMutexEx()  }

const
  CPL_MUTEX_RECURSIVE = 0;  
  CPL_MUTEX_ADAPTIVE = 1;  
  CPL_MUTEX_REGULAR = 2;  

function CPLCreateMutex:PCPLMutex;cdecl;external libgdal;
{ returned acquired  }
function CPLCreateMutexEx(nOptions:longint):PCPLMutex;cdecl;external libgdal;
{ returned acquired  }
function CPLCreateOrAcquireMutex(para1:PPCPLMutex; dfWaitInSeconds:Tdouble):longint;cdecl;external libgdal;
function CPLCreateOrAcquireMutexEx(para1:PPCPLMutex; dfWaitInSeconds:Tdouble; nOptions:longint):longint;cdecl;external libgdal;
function CPLAcquireMutex(hMutex:PCPLMutex; dfWaitInSeconds:Tdouble):longint;cdecl;external libgdal;
procedure CPLReleaseMutex(hMutex:PCPLMutex);cdecl;external libgdal;
procedure CPLDestroyMutex(hMutex:PCPLMutex);cdecl;external libgdal;
procedure CPLCleanupMasterMutex;cdecl;external libgdal;
function CPLCreateCond:PCPLCond;cdecl;external libgdal;
procedure CPLCondWait(hCond:PCPLCond; hMutex:PCPLMutex);cdecl;external libgdal;
type
  PCPLCondTimedWaitReason = ^TCPLCondTimedWaitReason;
  TCPLCondTimedWaitReason =  Longint;
  Const
    COND_TIMED_WAIT_COND = 0;
    COND_TIMED_WAIT_TIME_OUT = 1;
    COND_TIMED_WAIT_OTHER = 2;
;

function CPLCondTimedWait(hCond:PCPLCond; hMutex:PCPLMutex; dfWaitInSeconds:Tdouble):TCPLCondTimedWaitReason;cdecl;external libgdal;
procedure CPLCondSignal(hCond:PCPLCond);cdecl;external libgdal;
procedure CPLCondBroadcast(hCond:PCPLCond);cdecl;external libgdal;
procedure CPLDestroyCond(hCond:PCPLCond);cdecl;external libgdal;
{* Contrary to what its name suggests, CPLGetPID() actually returns the thread
 * id  }
function CPLGetPID:TGIntBig;cdecl;external libgdal;
function CPLGetCurrentProcessID:longint;cdecl;external libgdal;
function CPLCreateThread(pfnMain:TCPLThreadFunc; pArg:pointer):longint;cdecl;external libgdal;
function CPLCreateJoinableThread(pfnMain:TCPLThreadFunc; pArg:pointer):PCPLJoinableThread;cdecl;external libgdal;
procedure CPLJoinThread(hJoinableThread:PCPLJoinableThread);cdecl;external libgdal;
procedure CPLSleep(dfWaitInSeconds:Tdouble);cdecl;external libgdal;
function CPLGetThreadingModel:Pchar;cdecl;external libgdal;
function CPLGetNumCPUs:longint;cdecl;external libgdal;
type
{ Currently LOCK_ADAPTIVE_MUTEX is Linux-only and LOCK_SPIN only available  }
{ on systems with pthread_spinlock API (so not MacOsX). If a requested type  }
{ isn't available, it fallbacks to LOCK_RECURSIVE_MUTEX  }

  PCPLLockType = ^TCPLLockType;
  TCPLLockType =  Longint;
  Const
    LOCK_RECURSIVE_MUTEX = 0;
    LOCK_ADAPTIVE_MUTEX = 1;
    LOCK_SPIN = 2;
;

function CPLCreateLock(eType:TCPLLockType):PCPLLock;cdecl;external libgdal;
{ returned NON acquired  }
function CPLCreateOrAcquireLock(para1:PPCPLLock; eType:TCPLLockType):longint;cdecl;external libgdal;
function CPLAcquireLock(para1:PCPLLock):longint;cdecl;external libgdal;
procedure CPLReleaseLock(para1:PCPLLock);cdecl;external libgdal;
procedure CPLDestroyLock(para1:PCPLLock);cdecl;external libgdal;
procedure CPLLockSetDebugPerf(para1:PCPLLock; bEnableIn:longint);cdecl;external libgdal;
{ only available on x86/x86_64 with GCC for now  }
{ --------------------------------------------------------------------  }
{      Thread local storage.                                            }
{ --------------------------------------------------------------------  }
{ cpl_conv.cpp  }
const
  CTLS_RLBUFFERINFO = 1;  
{ cpl_multiproc.cpp  }
  CTLS_WIN32_COND = 2;  
{ cpl_csv.cpp  }
  CTLS_CSVTABLEPTR = 3;  
{ cpl_csv.cpp  }
  CTLS_CSVDEFAULTFILENAME = 4;  
{ cpl_error.cpp  }
  CTLS_ERRORCONTEXT = 5;  
{ cpl_vsil_curl.cpp  }
  CTLS_VSICURL_CACHEDCONNECTION = 6;  
{ cpl_path.cpp  }
  CTLS_PATHBUF = 7;  
{ cpl_vsil_abstract_archive.cpp  }
  CTLS_ABSTRACTARCHIVE_SPLIT = 8;  
{ gdaldataset.cpp  }
  CTLS_GDALOPEN_ANTIRECURSION = 9;  
{ cpl_string.h  }
  CTLS_CPLSPRINTF = 10;  
{ gdaldataset.cpp  }
  CTLS_RESPONSIBLEPID = 11;  
{ gdal_misc.cpp  }
  CTLS_VERSIONINFO = 12;  
{ gdal_misc.cpp  }
  CTLS_VERSIONINFO_LICENCE = 13;  
{ cpl_conv.cpp  }
  CTLS_CONFIGOPTIONS = 14;  
{ cpl_findfile.cpp  }
  CTLS_FINDFILE = 15;  
{ cpl_vsi_error.cpp  }
  CTLS_VSIERRORCONTEXT = 16;  
{ 17: unused  }
{ ogr_proj_p.cpp  }
  CTLS_PROJCONTEXTHOLDER = 18;  
{ gdaldefaultoverviews.cpp  }
  CTLS_GDALDEFAULTOVR_ANTIREC = 19;  
{ cpl_http.cpp  }
  CTLS_HTTPFETCHCALLBACK = 20;  
  CTLS_MAX = 32;  

function CPLGetTLS(nIndex:longint):pointer;cdecl;external libgdal;
function CPLGetTLSEx(nIndex:longint; pbMemoryErrorOccurred:Plongint):pointer;cdecl;external libgdal;
procedure CPLSetTLS(nIndex:longint; pData:pointer; bFreeOnExit:longint);cdecl;external libgdal;
{ Warning : the CPLTLSFreeFunc must not in any case directly or indirectly  }
{ use or fetch any TLS data, or a terminating thread will hang !  }
type

  TCPLTLSFreeFunc = procedure (pData:pointer);cdecl;

procedure CPLSetTLSWithFreeFunc(nIndex:longint; pData:pointer; pfnFree:TCPLTLSFreeFunc);cdecl;external libgdal;
procedure CPLSetTLSWithFreeFuncEx(nIndex:longint; pData:pointer; pfnFree:TCPLTLSFreeFunc; pbMemoryErrorOccurred:Plongint);cdecl;external libgdal;
procedure CPLCleanupTLS;cdecl;external libgdal;
{$endif}
{ CPL_MULTIPROC_H_INCLUDED_  }

// === Konventiert am: 2-10-26 16:20:03 ===


implementation



end.
