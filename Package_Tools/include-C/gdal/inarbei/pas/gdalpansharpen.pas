unit gdalpansharpen;

interface

uses
  fp_gdal;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  GDAL Pansharpening module
 * Purpose:  Prototypes, and definitions for pansharpening related work.
 * Author:   Even Rouault <even.rouault at spatialys.com>
 *
 ******************************************************************************
 * Copyright (c) 2015, Even Rouault <even.rouault at spatialys.com>
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
{$ifndef GDALPANSHARPEN_H_INCLUDED}
{$define GDALPANSHARPEN_H_INCLUDED}
{$include "gdal.h"}
{*
 * \file gdalpansharpen.h
 *
 * GDAL pansharpening related entry points and definitions.
 *
 * @since GDAL 2.1
  }
{* Pansharpening algorithms.
  }
{! Weighted Brovery.  }
type
  PGDALPansharpenAlg = ^TGDALPansharpenAlg;
  TGDALPansharpenAlg =  Longint;
  Const
    GDAL_PSH_WEIGHTED_BROVEY = 0;
;
{* Pansharpening options.
  }
{! Pan sharpening algorithm/method. Only weighed Brovey for now.  }
{! Resampling algorithm to upsample spectral bands to pan band resolution.
      }
{! Bit depth of the spectral bands. Can be let to 0 for default behavior.
      }
{! Number of weight coefficients in padfWeights.  }
{! Array of nWeightCount weights used by weighted Brovey.  }
{! Panchromatic band.  }
{! Number of input spectral bands.  }
{* Array of nInputSpectralBands input spectral bands. The spectral band
     * have generally a coarser resolution than the panchromatic band, but they
     *  are assumed to have the same spatial extent (and projection) at that
     * point. Necessary spatial adjustments must be done beforehand, for example
     * by wrapping inside a VRT dataset.
      }
{! Number of output pansharpened spectral bands.  }
{! Array of nOutPansharpendBands values such as panOutPansharpenedBands[k]
     * is a value in the range [0,nInputSpectralBands-1] .  }
{! Whether the panchromatic and spectral bands have a noData value.  }
{* NoData value of the panchromatic and spectral bands (only taken into
       account if bHasNoData = TRUE). This will also be use has the output
       nodata value.  }
{* Number of threads or -1 to mean ALL_CPUS. By default (0), single
     * threaded mode is enabled unless the GDAL_NUM_THREADS configuration option
     * is set to an integer or ALL_CPUS.  }
type
  PGDALPansharpenOptions = ^TGDALPansharpenOptions;
  TGDALPansharpenOptions = record
      ePansharpenAlg : TGDALPansharpenAlg;
      eResampleAlg : TGDALRIOResampleAlg;
      nBitDepth : longint;
      nWeightCount : longint;
      padfWeights : Pdouble;
      hPanchroBand : TGDALRasterBandH;
      nInputSpectralBands : longint;
      pahInputSpectralBands : PGDALRasterBandH;
      nOutPansharpenedBands : longint;
      panOutPansharpenedBands : Plongint;
      bHasNoData : longint;
      dfNoData : Tdouble;
      nThreads : longint;
    end;

function GDALCreatePansharpenOptions:PGDALPansharpenOptions;cdecl;external libgdal;
procedure GDALDestroyPansharpenOptions(para1:PGDALPansharpenOptions);cdecl;external libgdal;
function GDALClonePansharpenOptions(psOptions:PGDALPansharpenOptions):PGDALPansharpenOptions;cdecl;external libgdal;
{! Pansharpening operation handle.  }
type
  PGDALPansharpenOperationH = ^TGDALPansharpenOperationH;
  TGDALPansharpenOperationH = pointer;

function GDALCreatePansharpenOperation(para1:PGDALPansharpenOptions):TGDALPansharpenOperationH;cdecl;external libgdal;
procedure GDALDestroyPansharpenOperation(para1:TGDALPansharpenOperationH);cdecl;external libgdal;
function GDALPansharpenProcessRegion(hOperation:TGDALPansharpenOperationH; nXOff:longint; nYOff:longint; nXSize:longint; nYSize:longint; 
           pDataBuf:pointer; eBufDataType:TGDALDataType):TCPLErr;cdecl;external libgdal;
{ __cplusplus  }
{$endif}
{ GDALPANSHARPEN_H_INCLUDED  }

// === Konventiert am: 2-10-26 16:42:08 ===


implementation



end.
