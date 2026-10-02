
unit cpl_progress;
interface

{
  Automatically converted by H2Pas 1.0.0 from cpl_progress.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cpl_progress.h
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
(* Const before type ignored *)
type

  TGDALProgressFunc = function (dfComplete:Tdouble; pszMessage:Pchar; pProgressArg:pointer):longint;cdecl;
(* Const before type ignored *)

function GDALDummyProgress(para1:Tdouble; para2:Pchar; para3:pointer):longint;cdecl;external;
(* Const before type ignored *)
function GDALTermProgress(para1:Tdouble; para2:Pchar; para3:pointer):longint;cdecl;external;
(* Const before type ignored *)
function GDALScaledProgress(para1:Tdouble; para2:Pchar; para3:pointer):longint;cdecl;external;
function GDALCreateScaledProgress(para1:Tdouble; para2:Tdouble; para3:TGDALProgressFunc; para4:pointer):pointer;cdecl;external;
procedure GDALDestroyScaledProgress(para1:pointer);cdecl;external;
{$endif}
{ ndef CPL_PROGRESS_H_INCLUDED  }

implementation


end.
