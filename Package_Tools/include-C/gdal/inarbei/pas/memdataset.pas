unit memdataset;

interface

uses
  fp_gdal;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  Memory Array Translator
 * Purpose:  Declaration of MEMDataset, and MEMRasterBand.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 ******************************************************************************
 * Copyright (c) 2000, Frank Warmerdam
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
{$ifndef MEMDATASET_H_INCLUDED}
{$define MEMDATASET_H_INCLUDED}
{$include "gdal_pam.h"}
{$include "gdal_priv.h"}
{$include "gdal_rat.h"}
{$include <memory>}
{ Caution: if changing this prototype, also change in
   swig/include/gdal_python.i where it is redefined  }

function MEMCreateRasterBand(para1:PGDALDataset; para2:longint; para3:PGByte; para4:TGDALDataType; para5:longint; 
           para6:longint; para7:longint):TGDALRasterBandH;cdecl;external libgdal;
function MEMCreateRasterBandEx(para1:PGDALDataset; para2:longint; para3:PGByte; para4:TGDALDataType; para5:TGSpacing; 
           para6:TGSpacing; para7:longint):TGDALRasterBandH;cdecl;external libgdal;
{********************************************************************** }
{                            MEMDataset                                 }
{********************************************************************** }

// === Konventiert am: 2-10-26 16:54:23 ===


implementation



end.
