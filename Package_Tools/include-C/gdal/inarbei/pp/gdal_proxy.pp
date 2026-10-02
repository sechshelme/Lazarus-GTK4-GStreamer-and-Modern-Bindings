
unit gdal_proxy;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdal_proxy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdal_proxy.h
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
Pdouble  = ^double;
PGDALProxyPoolDatasetH  = ^GDALProxyPoolDatasetH;
PGDALProxyPoolDatasetHS  = ^GDALProxyPoolDatasetHS;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  GDAL Core
 * Purpose:  GDAL Core C++/Private declarations
 * Author:   Even Rouault <even dot rouault at spatialys.com>
 *
 ******************************************************************************
 * Copyright (c) 2008-2014, Even Rouault <even dot rouault at spatialys.com>
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
{$ifndef GDAL_PROXY_H_INCLUDED}
{$define GDAL_PROXY_H_INCLUDED}
{$ifndef DOXYGEN_SKIP}
{$include "gdal.h"}
{ ********************************************************************  }
{            C types and methods declarations                           }
{ ********************************************************************  }
type
  PGDALProxyPoolDatasetH = ^TGDALProxyPoolDatasetH;
  TGDALProxyPoolDatasetH = PGDALProxyPoolDatasetHS;
(* Const before type ignored *)
(* Const before type ignored *)

function GDALProxyPoolDatasetCreate(pszSourceDatasetDescription:Pchar; nRasterXSize:longint; nRasterYSize:longint; eAccess:TGDALAccess; bShared:longint; 
           pszProjectionRef:Pchar; padfGeoTransform:Pdouble):TGDALProxyPoolDatasetH;cdecl;external;
procedure GDALProxyPoolDatasetDelete(hProxyPoolDataset:TGDALProxyPoolDatasetH);cdecl;external;
procedure GDALProxyPoolDatasetAddSrcBandDescription(hProxyPoolDataset:TGDALProxyPoolDatasetH; eDataType:TGDALDataType; nBlockXSize:longint; nBlockYSize:longint);cdecl;external;
{$endif}
{ #ifndef DOXYGEN_SKIP  }
{$endif}
{ GDAL_PROXY_H_INCLUDED  }

implementation


end.
