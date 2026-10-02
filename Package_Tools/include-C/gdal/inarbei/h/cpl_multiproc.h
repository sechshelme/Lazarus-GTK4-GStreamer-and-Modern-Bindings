/**********************************************************************
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
 ****************************************************************************/

#ifndef CPL_MULTIPROC_H_INCLUDED_
#define CPL_MULTIPROC_H_INCLUDED_

#include "cpl_port.h"

/*
** There are three primary implementations of the multi-process support
** controlled by one of CPL_MULTIPROC_WIN32, CPL_MULTIPROC_PTHREAD or
** CPL_MULTIPROC_STUB being defined.  If none are defined, the stub
** implementation will be used.
*/

#if defined(WIN32) && !defined(CPL_MULTIPROC_STUB)
#define CPL_MULTIPROC_WIN32
/* MinGW can have pthread support, so disable it to avoid issues */
/* in cpl_multiproc.cpp */
#undef CPL_MULTIPROC_PTHREAD
#endif



typedef void (*CPLThreadFunc)(void *);

void  *CPLLockFile(const char *pszPath, double dfWaitInSeconds);
void  CPLUnlockFile(void *hLock);

#ifdef DEBUG
typedef struct _CPLMutex CPLMutex;
typedef struct _CPLCond CPLCond;
typedef struct _CPLJoinableThread CPLJoinableThread;

/* Options for CPLCreateMutexEx() and CPLCreateOrAcquireMutexEx() */
#define CPL_MUTEX_RECURSIVE 0
#define CPL_MUTEX_ADAPTIVE 1
#define CPL_MUTEX_REGULAR 2

CPLMutex  *CPLCreateMutex(void);           /* returned acquired */
CPLMutex  *CPLCreateMutexEx(int nOptions); /* returned acquired */
int  CPLCreateOrAcquireMutex(CPLMutex **, double dfWaitInSeconds);
int  CPLCreateOrAcquireMutexEx(CPLMutex **, double dfWaitInSeconds,
                                      int nOptions);
int  CPLAcquireMutex(CPLMutex *hMutex, double dfWaitInSeconds);
void  CPLReleaseMutex(CPLMutex *hMutex);
void  CPLDestroyMutex(CPLMutex *hMutex);
void  CPLCleanupMasterMutex(void);

CPLCond  *CPLCreateCond(void);
void  CPLCondWait(CPLCond *hCond, CPLMutex *hMutex);
typedef enum
{
    COND_TIMED_WAIT_COND,
    COND_TIMED_WAIT_TIME_OUT,
    COND_TIMED_WAIT_OTHER
} CPLCondTimedWaitReason;
CPLCondTimedWaitReason  CPLCondTimedWait(CPLCond *hCond,
                                                CPLMutex *hMutex,
                                                double dfWaitInSeconds);
void  CPLCondSignal(CPLCond *hCond);
void  CPLCondBroadcast(CPLCond *hCond);
void  CPLDestroyCond(CPLCond *hCond);

/** Contrary to what its name suggests, CPLGetPID() actually returns the thread
 * id */
GIntBig  CPLGetPID(void);
int  CPLGetCurrentProcessID(void);
int  CPLCreateThread(CPLThreadFunc pfnMain, void *pArg);
CPLJoinableThread  *CPLCreateJoinableThread(CPLThreadFunc pfnMain,
                                                   void *pArg);
void  CPLJoinThread(CPLJoinableThread *hJoinableThread);
void  CPLSleep(double dfWaitInSeconds);

const char  *CPLGetThreadingModel(void);

int  CPLGetNumCPUs(void);

typedef struct _CPLLock CPLLock;

/* Currently LOCK_ADAPTIVE_MUTEX is Linux-only and LOCK_SPIN only available */
/* on systems with pthread_spinlock API (so not MacOsX). If a requested type */
/* isn't available, it fallbacks to LOCK_RECURSIVE_MUTEX */
typedef enum
{
    LOCK_RECURSIVE_MUTEX,
    LOCK_ADAPTIVE_MUTEX,
    LOCK_SPIN
} CPLLockType;

CPLLock  *CPLCreateLock(CPLLockType eType); /* returned NON acquired */
int  CPLCreateOrAcquireLock(CPLLock **, CPLLockType eType);
int  CPLAcquireLock(CPLLock *);
void  CPLReleaseLock(CPLLock *);
void  CPLDestroyLock(CPLLock *);
void  CPLLockSetDebugPerf(
    CPLLock *,
    int bEnableIn); /* only available on x86/x86_64 with GCC for now */





/* -------------------------------------------------------------------- */
/*      Thread local storage.                                           */
/* -------------------------------------------------------------------- */

#define CTLS_RLBUFFERINFO 1             /* cpl_conv.cpp */
#define CTLS_WIN32_COND 2               /* cpl_multiproc.cpp */
#define CTLS_CSVTABLEPTR 3              /* cpl_csv.cpp */
#define CTLS_CSVDEFAULTFILENAME 4       /* cpl_csv.cpp */
#define CTLS_ERRORCONTEXT 5             /* cpl_error.cpp */
#define CTLS_VSICURL_CACHEDCONNECTION 6 /* cpl_vsil_curl.cpp */
#define CTLS_PATHBUF 7                  /* cpl_path.cpp */
#define CTLS_ABSTRACTARCHIVE_SPLIT 8    /* cpl_vsil_abstract_archive.cpp */
#define CTLS_GDALOPEN_ANTIRECURSION 9   /* gdaldataset.cpp */
#define CTLS_CPLSPRINTF 10              /* cpl_string.h */
#define CTLS_RESPONSIBLEPID 11          /* gdaldataset.cpp */
#define CTLS_VERSIONINFO 12             /* gdal_misc.cpp */
#define CTLS_VERSIONINFO_LICENCE 13     /* gdal_misc.cpp */
#define CTLS_CONFIGOPTIONS 14           /* cpl_conv.cpp */
#define CTLS_FINDFILE 15                /* cpl_findfile.cpp */
#define CTLS_VSIERRORCONTEXT 16         /* cpl_vsi_error.cpp */
/* 17: unused */
#define CTLS_PROJCONTEXTHOLDER 18      /* ogr_proj_p.cpp */
#define CTLS_GDALDEFAULTOVR_ANTIREC 19 /* gdaldefaultoverviews.cpp */
#define CTLS_HTTPFETCHCALLBACK 20      /* cpl_http.cpp */

#define CTLS_MAX 32


void  *CPLGetTLS(int nIndex);
void  *CPLGetTLSEx(int nIndex, int *pbMemoryErrorOccurred);
void  CPLSetTLS(int nIndex, void *pData, int bFreeOnExit);

/* Warning : the CPLTLSFreeFunc must not in any case directly or indirectly */
/* use or fetch any TLS data, or a terminating thread will hang ! */
typedef void (*CPLTLSFreeFunc)(void *pData);
void  CPLSetTLSWithFreeFunc(int nIndex, void *pData,
                                   CPLTLSFreeFunc pfnFree);
void  CPLSetTLSWithFreeFuncEx(int nIndex, void *pData,
                                     CPLTLSFreeFunc pfnFree,
                                     int *pbMemoryErrorOccurred);

void  CPLCleanupTLS(void);


#endif /* CPL_MULTIPROC_H_INCLUDED_ */
