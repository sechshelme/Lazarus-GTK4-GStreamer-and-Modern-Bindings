/**********************************************************************
 * $Id$
 *
 * Name:     cpl_error.h
 * Project:  CPL - Common Portability Library
 * Purpose:  CPL Error handling
 * Author:   Daniel Morissette, danmo@videotron.ca
 *
 **********************************************************************
 * Copyright (c) 1998, Daniel Morissette
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

#ifndef CPL_ERROR_H_INCLUDED
#define CPL_ERROR_H_INCLUDED

#include "cpl_port.h"

#include <stdarg.h>
#include <stddef.h>

/*=====================================================================
                   Error handling functions (cpl_error.c)
 =====================================================================*/

/**
 * \file cpl_error.h
 *
 * CPL error handling services.
 */



/** Error category */
typedef enum
{
    CE_None = 0,
    CE_Debug = 1,
    CE_Warning = 2,
    CE_Failure = 3,
    CE_Fatal = 4
} CPLErr;

/* ==================================================================== */
/*      Well known error codes.                                         */
/* ==================================================================== */

#ifdef STRICT_CPLERRORNUM_TYPE

/* This is not appropriate for the general case, as there are parts */
/* of GDAL which use custom error codes, but this can help diagnose confusions
 */
/* between CPLErr and CPLErrorNum */
typedef enum
{
    CPLE_None,
    CPLE_AppDefined,
    CPLE_OutOfMemory,
    CPLE_FileIO,
    CPLE_OpenFailed,
    CPLE_IllegalArg,
    CPLE_NotSupported,
    CPLE_AssertionFailed,
    CPLE_NoWriteAccess,
    CPLE_UserInterrupt,
    CPLE_ObjectNull,
    CPLE_HttpResponse,
    CPLE_AWSBucketNotFound,
    CPLE_AWSObjectNotFound,
    CPLE_AWSAccessDenied,
    CPLE_AWSInvalidCredentials,
    CPLE_AWSSignatureDoesNotMatch,
} CPLErrorNum;

#else

/** Error number */
typedef int CPLErrorNum;

/** No error */
#define CPLE_None 0
/** Application defined error */
#define CPLE_AppDefined 1
/** Out of memory error */
#define CPLE_OutOfMemory 2
/** File I/O error */
#define CPLE_FileIO 3
/** Open failed */
#define CPLE_OpenFailed 4
/** Illegal argument */
#define CPLE_IllegalArg 5
/** Not supported */
#define CPLE_NotSupported 6
/** Assertion failed */
#define CPLE_AssertionFailed 7
/** No write access */
#define CPLE_NoWriteAccess 8
/** User interrupted */
#define CPLE_UserInterrupt 9
/** NULL object */
#define CPLE_ObjectNull 10

/*
 * Filesystem-specific errors
 */
/** HTTP response */
#define CPLE_HttpResponse 11
/** AWSBucketNotFound */
#define CPLE_AWSBucketNotFound 12
/** AWSObjectNotFound */
#define CPLE_AWSObjectNotFound 13
/** AWSAccessDenied */
#define CPLE_AWSAccessDenied 14
/** AWSInvalidCredentials */
#define CPLE_AWSInvalidCredentials 15
/** AWSSignatureDoesNotMatch */
#define CPLE_AWSSignatureDoesNotMatch 16
/** VSIE_AWSError */
#define CPLE_AWSError 17

/* 100 - 299 reserved for GDAL */

#endif

void  CPLError(CPLErr eErrClass, CPLErrorNum err_no,
                     const char *fmt, ...)
  ;
void  CPLErrorV(CPLErr, CPLErrorNum, const char *, va_list);
void  CPLEmergencyError(const char *) ;
void   CPLErrorReset(void);
CPLErrorNum   CPLGetLastErrorNo(void);
CPLErr   CPLGetLastErrorType(void);
const char  * CPLGetLastErrorMsg(void);
GUInt32   CPLGetErrorCounter(void);
void  * CPLGetErrorHandlerUserData(void);
void  CPLErrorSetState(CPLErr eErrClass, CPLErrorNum err_no,
                              const char *pszMsg);
void  CPLCallPreviousHandler(CPLErr eErrClass, CPLErrorNum err_no,
                                    const char *pszMsg);
/*! @cond Doxygen_Suppress */
void  CPLCleanupErrorMutex(void);
/*! @endcond */

/** Callback for a custom error handler */
typedef void( *CPLErrorHandler)(CPLErr, CPLErrorNum, const char *);

void   CPLLoggingErrorHandler(CPLErr, CPLErrorNum,
                                                const char *);
void   CPLDefaultErrorHandler(CPLErr, CPLErrorNum,
                                                const char *);
void   CPLQuietErrorHandler(CPLErr, CPLErrorNum,
                                              const char *);
void CPLTurnFailureIntoWarning(int bOn);

CPLErrorHandler  CPLGetErrorHandler(void **ppUserData);

CPLErrorHandler   CPLSetErrorHandler(CPLErrorHandler);
CPLErrorHandler   CPLSetErrorHandlerEx(CPLErrorHandler,
                                                         void *);
void   CPLPushErrorHandler(CPLErrorHandler);
void   CPLPushErrorHandlerEx(CPLErrorHandler, void *);
void   CPLSetCurrentErrorHandlerCatchDebug(int bCatchDebug);
void   CPLPopErrorHandler(void);

void  CPLDebug(const char *, const char *, ...)
 ;
#endif


void   _CPLAssert(const char *, const char *,
                                    int) ;




bool CPLIsDefaultErrorHandlerAndCatchDebug();

#endif

/*! @endcond */


