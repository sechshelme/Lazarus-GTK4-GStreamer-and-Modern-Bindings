unit gdal_vrt;

interface

uses
  fp_gdal;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  Virtual GDAL Datasets
 * Purpose:  C/Public declarations of virtual GDAL dataset objects.
 * Author:   Andrey Kiselev, dron@ak4719.spb.edu
 *
 ******************************************************************************
 * Copyright (c) 2007, Andrey Kiselev <dron@ak4719.spb.edu>
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
{$ifndef GDAL_VRT_H_INCLUDED}
{$define GDAL_VRT_H_INCLUDED}
{*
 * \file gdal_vrt.h
 *
 * Public (C callable) entry points for virtual GDAL dataset objects.
  }
{$include "cpl_error.h"}
{$include "cpl_minixml.h"}
{$include "cpl_port.h"}
{$include "gdal.h"}
{* Special value to indicate that nodata is not set  }

const
  VRT_NODATA_UNSET = -(1234.56);  
{* Type for a function that returns the pixel data in a provided window  }
type

  TVRTImageReadFunc = function (hCBData:pointer; nXOff:longint; nYOff:longint; nXSize:longint; nYSize:longint; 
               pData:pointer):TCPLErr;cdecl;
{ --------------------------------------------------------------------  }
{      Define handle types related to various VRT dataset classes.      }
{ --------------------------------------------------------------------  }
{! @cond Doxygen_Suppress  }

  PVRTAveragedSourceH = ^TVRTAveragedSourceH;
  TVRTAveragedSourceH = pointer;

  PVRTAverageFilteredSourceH = ^TVRTAverageFilteredSourceH;
  TVRTAverageFilteredSourceH = pointer;

  PVRTComplexSourceH = ^TVRTComplexSourceH;
  TVRTComplexSourceH = pointer;

  PVRTDerivedRasterBandH = ^TVRTDerivedRasterBandH;
  TVRTDerivedRasterBandH = pointer;

  PVRTDriverH = ^TVRTDriverH;
  TVRTDriverH = pointer;

  PVRTFilteredSourceH = ^TVRTFilteredSourceH;
  TVRTFilteredSourceH = pointer;

  PVRTFuncSourceH = ^TVRTFuncSourceH;
  TVRTFuncSourceH = pointer;

  PVRTKernelFilteredSourceH = ^TVRTKernelFilteredSourceH;
  TVRTKernelFilteredSourceH = pointer;

  PVRTRasterBandH = ^TVRTRasterBandH;
  TVRTRasterBandH = pointer;

  PVRTRawRasterBandH = ^TVRTRawRasterBandH;
  TVRTRawRasterBandH = pointer;

  PVRTSimpleSourceH = ^TVRTSimpleSourceH;
  TVRTSimpleSourceH = pointer;

  PVRTSourceH = ^TVRTSourceH;
  TVRTSourceH = pointer;

  PVRTWarpedDatasetH = ^TVRTWarpedDatasetH;
  TVRTWarpedDatasetH = pointer;

  PVRTWarpedRasterBandH = ^TVRTWarpedRasterBandH;
  TVRTWarpedRasterBandH = pointer;
{! @endcond  }
{* Opaque type for a VRT dataset  }

  PVRTDatasetH = ^TVRTDatasetH;
  TVRTDatasetH = pointer;
{* Opaque type for a VRT sourced raster band  }

  PVRTSourcedRasterBandH = ^TVRTSourcedRasterBandH;
  TVRTSourcedRasterBandH = pointer;
{ ====================================================================  }
{      VRTDataset class.                                                }
{ ====================================================================  }

function VRTCreate(para1:longint; para2:longint):TVRTDatasetH;cdecl;external libgdal;
procedure VRTFlushCache(para1:TVRTDatasetH);cdecl;external libgdal;
function VRTSerializeToXML(para1:TVRTDatasetH; para2:Pchar):PCPLXMLNode;cdecl;external libgdal;
function VRTAddBand(para1:TVRTDatasetH; para2:TGDALDataType; para3:PPchar):longint;cdecl;external libgdal;
{ ====================================================================  }
{      VRTSourcedRasterBand class.                                      }
{ ====================================================================  }
function VRTAddSource(para1:TVRTSourcedRasterBandH; para2:TVRTSourceH):TCPLErr;cdecl;external libgdal;
function VRTAddSimpleSource(para1:TVRTSourcedRasterBandH; para2:TGDALRasterBandH; para3:longint; para4:longint; para5:longint; 
           para6:longint; para7:longint; para8:longint; para9:longint; para10:longint; 
           para11:Pchar; para12:Tdouble):TCPLErr;cdecl;external libgdal;
function VRTAddComplexSource(para1:TVRTSourcedRasterBandH; para2:TGDALRasterBandH; para3:longint; para4:longint; para5:longint; 
           para6:longint; para7:longint; para8:longint; para9:longint; para10:longint; 
           para11:Tdouble; para12:Tdouble; para13:Tdouble):TCPLErr;cdecl;external libgdal;
function VRTAddFuncSource(para1:TVRTSourcedRasterBandH; para2:TVRTImageReadFunc; para3:pointer; para4:Tdouble):TCPLErr;cdecl;external libgdal;
{$endif}
{ GDAL_VRT_H_INCLUDED  }

// === Konventiert am: 2-10-26 16:54:33 ===


implementation



end.
