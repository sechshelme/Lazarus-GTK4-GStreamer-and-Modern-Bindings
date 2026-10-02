
unit cpl_csv;
interface

{
  Automatically converted by H2Pas 1.0.0 from cpl_csv.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cpl_csv.h
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
PCSVCompareCriteria  = ^CSVCompareCriteria;
PFILE  = ^FILE;
PVSILFILE  = ^VSILFILE;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  Common Portability Library
 * Purpose:  Functions for reading and scanning CSV (comma separated,
 *           variable length text files holding tables) files.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 ******************************************************************************
 * Copyright (c) 1999, Frank Warmerdam
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
{$ifndef CPL_CSV_H_INCLUDED}
{$define CPL_CSV_H_INCLUDED}
{$include <stdio.h>}
{$include "cpl_conv.h"}
{$include "cpl_string.h"}
{$include "cpl_vsi.h"}
{$include <stdbool.h>}
type
  PCSVCompareCriteria = ^TCSVCompareCriteria;
  TCSVCompareCriteria =  Longint;
  Const
    CC_ExactString = 0;
    CC_ApproxString = 1;
    CC_Integer = 2;
;
(* Const before type ignored *)
(* Const before type ignored *)

function CSVFilename(para1:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function CSVDetectSeperator(pszLine:Pchar):char;cdecl;external;
function CSVReadParseLine(fp:PFILE):^Pchar;cdecl;external;
function CSVReadParseLine2(fp:PFILE; chDelimiter:char):^Pchar;cdecl;external;
function CSVReadParseLineL(fp:PVSILFILE):^Pchar;cdecl;external;
function CSVReadParseLine2L(fp:PVSILFILE; chDelimiter:char):^Pchar;cdecl;external;
(* Const before type ignored *)
function CSVReadParseLine3L(fp:PVSILFILE; nMaxLineSize:Tsize_t; pszDelimiter:Pchar; bHonourStrings:Tbool; bKeepLeadingAndClosingQuotes:Tbool; 
           bMergeDelimiter:Tbool; bSkipBOM:Tbool):^Pchar;cdecl;external;
(* Const before type ignored *)
function CSVScanLines(para1:PFILE; para2:longint; para3:Pchar; para4:TCSVCompareCriteria):^Pchar;cdecl;external;
(* Const before type ignored *)
function CSVScanLinesL(para1:PVSILFILE; para2:longint; para3:Pchar; para4:TCSVCompareCriteria):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CSVScanFile(para1:Pchar; para2:longint; para3:Pchar; para4:TCSVCompareCriteria):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CSVScanFileByName(para1:Pchar; para2:Pchar; para3:Pchar; para4:TCSVCompareCriteria):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure CSVRewind(para1:Pchar);cdecl;external;
(* Const before type ignored *)
function CSVGetNextLine(para1:Pchar):^Pchar;cdecl;external;
(* Const before type ignored *)
function CSVGetFieldId(para1:PFILE; para2:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function CSVGetFieldIdL(para1:PVSILFILE; para2:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CSVGetFileFieldId(para1:Pchar; para2:Pchar):longint;cdecl;external;
(* Const before type ignored *)
procedure CSVDeaccess(para1:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CSVGetField(para1:Pchar; para2:Pchar; para3:Pchar; para4:TCSVCompareCriteria; para5:Pchar):Pchar;cdecl;external;
{$ifndef DOXYGEN_XML}
(* Const before type ignored *)
(* Const before type ignored *)

procedure SetCSVFilenameHook(para1:Pfunction (para1:Pchar):char);cdecl;external;
{$endif}
{$endif}
{ ndef CPL_CSV_H_INCLUDED  }

implementation


end.
