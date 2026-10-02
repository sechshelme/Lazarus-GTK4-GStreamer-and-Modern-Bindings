unit cpl_error;

interface

uses
  fp_gdal;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*********************************************************************
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
 *************************************************************************** }
{$ifndef CPL_ERROR_H_INCLUDED}
{$define CPL_ERROR_H_INCLUDED}
{$include "cpl_port.h"}
{$include <stdarg.h>}
{$include <stddef.h>}
{=====================================================================
                   Error handling functions (cpl_error.c)
 ===================================================================== }
{*
 * \file cpl_error.h
 *
 * CPL error handling services.
  }
{* Error category  }
type
  PCPLErr = ^TCPLErr;
  TCPLErr =  Longint;
  Const
    CE_None = 0;
    CE_Debug = 1;
    CE_Warning = 2;
    CE_Failure = 3;
    CE_Fatal = 4;
;
{ ====================================================================  }
{      Well known error codes.                                          }
{ ====================================================================  }
{$ifdef STRICT_CPLERRORNUM_TYPE}
{ This is not appropriate for the general case, as there are parts  }
{ of GDAL which use custom error codes, but this can help diagnose confusions
  }
{ between CPLErr and CPLErrorNum  }
type
  PCPLErrorNum = ^TCPLErrorNum;
  TCPLErrorNum =  Longint;
  Const
    CPLE_None = 0;
    CPLE_AppDefined = 1;
    CPLE_OutOfMemory = 2;
    CPLE_FileIO = 3;
    CPLE_OpenFailed = 4;
    CPLE_IllegalArg = 5;
    CPLE_NotSupported = 6;
    CPLE_AssertionFailed = 7;
    CPLE_NoWriteAccess = 8;
    CPLE_UserInterrupt = 9;
    CPLE_ObjectNull = 10;
    CPLE_HttpResponse = 11;
    CPLE_AWSBucketNotFound = 12;
    CPLE_AWSObjectNotFound = 13;
    CPLE_AWSAccessDenied = 14;
    CPLE_AWSInvalidCredentials = 15;
    CPLE_AWSSignatureDoesNotMatch = 16;
;
{$else}
{* Error number  }
type
  PCPLErrorNum = ^TCPLErrorNum;
  TCPLErrorNum = longint;
{* No error  }

const
  CPLE_None = 0;  
{* Application defined error  }
  CPLE_AppDefined = 1;  
{* Out of memory error  }
  CPLE_OutOfMemory = 2;  
{* File I/O error  }
  CPLE_FileIO = 3;  
{* Open failed  }
  CPLE_OpenFailed = 4;  
{* Illegal argument  }
  CPLE_IllegalArg = 5;  
{* Not supported  }
  CPLE_NotSupported = 6;  
{* Assertion failed  }
  CPLE_AssertionFailed = 7;  
{* No write access  }
  CPLE_NoWriteAccess = 8;  
{* User interrupted  }
  CPLE_UserInterrupt = 9;  
{* NULL object  }
  CPLE_ObjectNull = 10;  
{
 * Filesystem-specific errors
  }
{* HTTP response  }
  CPLE_HttpResponse = 11;  
{* AWSBucketNotFound  }
  CPLE_AWSBucketNotFound = 12;  
{* AWSObjectNotFound  }
  CPLE_AWSObjectNotFound = 13;  
{* AWSAccessDenied  }
  CPLE_AWSAccessDenied = 14;  
{* AWSInvalidCredentials  }
  CPLE_AWSInvalidCredentials = 15;  
{* AWSSignatureDoesNotMatch  }
  CPLE_AWSSignatureDoesNotMatch = 16;  
{* VSIE_AWSError  }
  CPLE_AWSError = 17;  
{ 100 - 299 reserved for GDAL  }
{$endif}

procedure CPLError(eErrClass:TCPLErr; err_no:TCPLErrorNum; fmt:Pchar; args:array of const);cdecl;external libgdal;
procedure CPLError(eErrClass:TCPLErr; err_no:TCPLErrorNum; fmt:Pchar);cdecl;external libgdal;
procedure CPLErrorV(para1:TCPLErr; para2:TCPLErrorNum; para3:Pchar; para4:Tva_list);cdecl;external libgdal;
procedure CPLEmergencyError(para1:Pchar);cdecl;external libgdal;
procedure CPLErrorReset;cdecl;external libgdal;
function CPLGetLastErrorNo:TCPLErrorNum;cdecl;external libgdal;
function CPLGetLastErrorType:TCPLErr;cdecl;external libgdal;
function CPLGetLastErrorMsg:Pchar;cdecl;external libgdal;
function CPLGetErrorCounter:TGUInt32;cdecl;external libgdal;
function CPLGetErrorHandlerUserData:pointer;cdecl;external libgdal;
procedure CPLErrorSetState(eErrClass:TCPLErr; err_no:TCPLErrorNum; pszMsg:Pchar);cdecl;external libgdal;
procedure CPLCallPreviousHandler(eErrClass:TCPLErr; err_no:TCPLErrorNum; pszMsg:Pchar);cdecl;external libgdal;
{! @cond Doxygen_Suppress  }
procedure CPLCleanupErrorMutex;cdecl;external libgdal;
{! @endcond  }
{* Callback for a custom error handler  }
type

  TCPLErrorHandler = procedure (para1:TCPLErr; para2:TCPLErrorNum; para3:Pchar);cdecl;

procedure CPLLoggingErrorHandler(para1:TCPLErr; para2:TCPLErrorNum; para3:Pchar);cdecl;external libgdal;
procedure CPLDefaultErrorHandler(para1:TCPLErr; para2:TCPLErrorNum; para3:Pchar);cdecl;external libgdal;
procedure CPLQuietErrorHandler(para1:TCPLErr; para2:TCPLErrorNum; para3:Pchar);cdecl;external libgdal;
procedure CPLTurnFailureIntoWarning(bOn:longint);cdecl;external libgdal;
function CPLGetErrorHandler(ppUserData:Ppointer):TCPLErrorHandler;cdecl;external libgdal;
function CPLSetErrorHandler(para1:TCPLErrorHandler):TCPLErrorHandler;cdecl;external libgdal;
function CPLSetErrorHandlerEx(para1:TCPLErrorHandler; para2:pointer):TCPLErrorHandler;cdecl;external libgdal;
procedure CPLPushErrorHandler(para1:TCPLErrorHandler);cdecl;external libgdal;
procedure CPLPushErrorHandlerEx(para1:TCPLErrorHandler; para2:pointer);cdecl;external libgdal;
procedure CPLSetCurrentErrorHandlerCatchDebug(bCatchDebug:longint);cdecl;external libgdal;
procedure CPLPopErrorHandler;cdecl;external libgdal;
procedure CPLDebug(para1:Pchar; para2:Pchar; args:array of const);cdecl;external libgdal;
procedure CPLDebug(para1:Pchar; para2:Pchar);cdecl;external libgdal;
{$endif}

procedure _CPLAssert(para1:Pchar; para2:Pchar; para3:longint);cdecl;external libgdal;
function CPLIsDefaultErrorHandlerAndCatchDebug:Tbool;cdecl;external libgdal;
{$endif}
{! @endcond  }

// === Konventiert am: 2-10-26 15:57:16 ===


implementation



end.
