unit cpl_progress;

interface

uses
  fp_gdal;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  CPL - Common Portability Library
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 * Purpose:  Prototypes and definitions for progress functions.
 *
 ******************************************************************************
 * Copyright (c) 2013, Frank Warmerdam
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
{$ifndef CPL_PROGRESS_H_INCLUDED}
{$define CPL_PROGRESS_H_INCLUDED}
{$include "cpl_port.h"}
type

  TGDALProgressFunc = function (dfComplete:Tdouble; pszMessage:Pchar; pProgressArg:pointer):longint;cdecl;

function GDALDummyProgress(para1:Tdouble; para2:Pchar; para3:pointer):longint;cdecl;external libgdal;
function GDALTermProgress(para1:Tdouble; para2:Pchar; para3:pointer):longint;cdecl;external libgdal;
function GDALScaledProgress(para1:Tdouble; para2:Pchar; para3:pointer):longint;cdecl;external libgdal;
function GDALCreateScaledProgress(para1:Tdouble; para2:Tdouble; para3:TGDALProgressFunc; para4:pointer):pointer;cdecl;external libgdal;
procedure GDALDestroyScaledProgress(para1:pointer);cdecl;external libgdal;
{$endif}
{ ndef CPL_PROGRESS_H_INCLUDED  }

// === Konventiert am: 2-10-26 16:33:03 ===


implementation



end.
