
unit cpl_vsi_error;
interface

{
  Automatically converted by H2Pas 1.0.0 from cpl_vsi_error.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cpl_vsi_error.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PVSIErrorNum  = ^VSIErrorNum;
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
(* Const before type ignored *)

procedure VSIError(err_no:TVSIErrorNum; fmt:Pchar; args:array of const);cdecl;external;
procedure VSIError(err_no:TVSIErrorNum; fmt:Pchar);cdecl;external;
procedure VSIErrorReset;cdecl;external;
function VSIGetLastErrorNo:TVSIErrorNum;cdecl;external;
(* Const before type ignored *)
function VSIGetLastErrorMsg:Pchar;cdecl;external;
function VSIToCPLError(eErrClass:TCPLErr; eDefaultErrorNo:TCPLErrorNum):longint;cdecl;external;
{$endif}
{ CPL_VSI_ERROR_H_INCLUDED  }

implementation


end.
