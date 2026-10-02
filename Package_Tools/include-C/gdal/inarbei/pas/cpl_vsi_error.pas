unit cpl_vsi_error;

interface

uses
  fp_gdal;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  VSI Virtual File System
 * Purpose:  Implement an error system for reporting file system errors.
 *           Filesystem errors need to be handled separately from the
 *           CPLError architecture because they are potentially ignored.
 * Author:   Rob Emanuele, rdemanuele at gmail.com
 *
 ******************************************************************************
 * Copyright (c) 2016, Rob Emanuele <rdemanuele at gmail.com>
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
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *************************************************************************** }
{$ifndef CPL_VSI_ERROR_H_INCLUDED}
{$define CPL_VSI_ERROR_H_INCLUDED}
{$include "cpl_port.h"}
{$include "cpl_error.h"}
{ ====================================================================
        Filesystem error codes.
   ====================================================================  }
type
  PVSIErrorNum = ^TVSIErrorNum;
  TVSIErrorNum = longint;

const
  VSIE_None = 0;  
  VSIE_FileError = 1;  
  VSIE_HttpError = 2;  
  VSIE_AWSError = 5;  
  VSIE_AWSAccessDenied = 6;  
  VSIE_AWSBucketNotFound = 7;  
  VSIE_AWSObjectNotFound = 8;  
  VSIE_AWSInvalidCredentials = 9;  
  VSIE_AWSSignatureDoesNotMatch = 10;  

procedure VSIError(err_no:TVSIErrorNum; fmt:Pchar; args:array of const);cdecl;external libgdal;
procedure VSIError(err_no:TVSIErrorNum; fmt:Pchar);cdecl;external libgdal;
procedure VSIErrorReset;cdecl;external libgdal;
function VSIGetLastErrorNo:TVSIErrorNum;cdecl;external libgdal;
function VSIGetLastErrorMsg:Pchar;cdecl;external libgdal;
function VSIToCPLError(eErrClass:TCPLErr; eDefaultErrorNo:TCPLErrorNum):longint;cdecl;external libgdal;
{$endif}
{ CPL_VSI_ERROR_H_INCLUDED  }

// === Konventiert am: 2-10-26 16:32:48 ===


implementation



end.
