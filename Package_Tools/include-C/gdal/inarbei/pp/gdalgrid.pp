
unit gdalgrid;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdalgrid.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdalgrid
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
PGDALGridAlgorithm  = ^GDALGridAlgorithm;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  GDAL Gridding API.
 * Purpose:  Prototypes, and definitions for of GDAL scattered data gridder.
 * Author:   Andrey Kiselev, dron@ak4719.spb.edu
 *
 ******************************************************************************
 * Copyright (c) 2007, Andrey Kiselev <dron@ak4719.spb.edu>
 * Copyright (c) 2012, Even Rouault <even dot rouault at spatialys.com>
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
{$ifndef GDALGRID_H_INCLUDED}
{$define GDALGRID_H_INCLUDED}
{*
 * \file gdalgrid.h
 *
 * GDAL gridder related entry points and definitions.
  }
{$include "gdal_alg.h"}
{
 *  GridCreate Algorithm names
xxxxxxxxxxxxxx
static const char szAlgNameInvDist[] = "invdist";
static const char szAlgNameInvDistNearestNeighbor[] = "invdistnn";
static const char szAlgNameAverage[] = "average";
static const char szAlgNameNearest[] = "nearest";
static const char szAlgNameMinimum[] = "minimum";
static const char szAlgNameMaximum[] = "maximum";
static const char szAlgNameRange[] = "range";
static const char szAlgNameCount[] = "count";
static const char szAlgNameAverageDistance[] = "average_distance";
static const char szAlgNameAverageDistancePts[] = "average_distance_pts";
static const char szAlgNameLinear[] = "linear";
  }
{! @cond Doxygen_Suppress  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type

  TGDALGridFunction = function (para1:pointer; para2:TGUInt32; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
               para6:Tdouble; para7:Tdouble; para8:Pdouble; para9:pointer):TCPLErr;cdecl;
{! @endcond  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function GDALGridInverseDistanceToAPower(para1:pointer; para2:TGUInt32; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
           para6:Tdouble; para7:Tdouble; para8:Pdouble; para9:pointer):TCPLErr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALGridInverseDistanceToAPowerNearestNeighbor(para1:pointer; para2:TGUInt32; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
           para6:Tdouble; para7:Tdouble; para8:Pdouble; para9:pointer):TCPLErr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALGridInverseDistanceToAPowerNoSearch(para1:pointer; para2:TGUInt32; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
           para6:Tdouble; para7:Tdouble; para8:Pdouble; para9:pointer):TCPLErr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALGridMovingAverage(para1:pointer; para2:TGUInt32; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
           para6:Tdouble; para7:Tdouble; para8:Pdouble; para9:pointer):TCPLErr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALGridNearestNeighbor(para1:pointer; para2:TGUInt32; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
           para6:Tdouble; para7:Tdouble; para8:Pdouble; para9:pointer):TCPLErr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALGridDataMetricMinimum(para1:pointer; para2:TGUInt32; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
           para6:Tdouble; para7:Tdouble; para8:Pdouble; para9:pointer):TCPLErr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALGridDataMetricMaximum(para1:pointer; para2:TGUInt32; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
           para6:Tdouble; para7:Tdouble; para8:Pdouble; para9:pointer):TCPLErr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALGridDataMetricRange(para1:pointer; para2:TGUInt32; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
           para6:Tdouble; para7:Tdouble; para8:Pdouble; para9:pointer):TCPLErr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALGridDataMetricCount(para1:pointer; para2:TGUInt32; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
           para6:Tdouble; para7:Tdouble; para8:Pdouble; para9:pointer):TCPLErr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALGridDataMetricAverageDistance(para1:pointer; para2:TGUInt32; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
           para6:Tdouble; para7:Tdouble; para8:Pdouble; para9:pointer):TCPLErr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALGridDataMetricAverageDistancePts(para1:pointer; para2:TGUInt32; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
           para6:Tdouble; para7:Tdouble; para8:Pdouble; para9:pointer):TCPLErr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GDALGridLinear(para1:pointer; para2:TGUInt32; para3:Pdouble; para4:Pdouble; para5:Pdouble; 
           para6:Tdouble; para7:Tdouble; para8:Pdouble; para9:pointer):TCPLErr;cdecl;external;
{$ifndef GDAL_COMPILATION}
{ ParseAlgorithmAndOptions() is used by PostGIS Raster, hence this alias  }
{* Compatibility deprecated alias for GDALGridParseAlgorithmAndOptions()  }

const
  ParseAlgorithmAndOptions = GDALGridParseAlgorithmAndOptions;  
{$endif}
(* Const before type ignored *)

function GDALGridParseAlgorithmAndOptions(para1:Pchar; para2:PGDALGridAlgorithm; para3:Ppointer):TCPLErr;cdecl;external;
{$endif}
{ GDALGRID_H_INCLUDED  }

implementation


end.
