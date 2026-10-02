unit gdal_pam;

interface

uses
  fp_gdal;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
 * $Id$
 *
 * Project:  GDAL Core
 * Purpose:  Declaration for Peristable Auxiliary Metadata classes.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 ******************************************************************************
 * Copyright (c) 2005, Frank Warmerdam <warmerdam@pobox.com>
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
{$ifndef GDAL_PAM_H_INCLUDED}
{$define GDAL_PAM_H_INCLUDED}
{! @cond Doxygen_Suppress }
{$include "cpl_minixml.h"}
{$include "gdal_priv.h"}
{$include <limits>}
{$include <map>}
{$include <vector>}
  var
    GDALPamRasterBand : Tclass;cvar;public;
{ Clone Info Flags  }

const
  GCIF_GEOTRANSFORM = $01;  
  GCIF_PROJECTION = $02;  
  GCIF_METADATA = $04;  
  GCIF_GCPS = $08;  
  GCIF_NODATA = $001000;  
  GCIF_CATEGORYNAMES = $002000;  
  GCIF_MINMAX = $004000;  
  GCIF_SCALEOFFSET = $008000;  
  GCIF_UNITTYPE = $010000;  
  GCIF_COLORTABLE = $020000;  
  GCIF_COLORINTERP = $020000;  
  GCIF_BAND_METADATA = $040000;  
  GCIF_RAT = $080000;  
  GCIF_MASK = $100000;  
  GCIF_BAND_DESCRIPTION = $200000;  
  GCIF_ONLY_IF_MISSING = $10000000;  
  GCIF_PROCESS_BANDS = $20000000;  
  GCIF_PAM_DEFAULT = (((((((((((((((GCIF_GEOTRANSFORM or GCIF_PROJECTION) or GCIF_METADATA) or GCIF_GCPS) or GCIF_NODATA) or GCIF_CATEGORYNAMES) or GCIF_MINMAX) or GCIF_SCALEOFFSET) or GCIF_UNITTYPE) or GCIF_COLORTABLE) or GCIF_COLORINTERP) or GCIF_BAND_METADATA) or GCIF_RAT) or GCIF_MASK) or GCIF_ONLY_IF_MISSING) or GCIF_PROCESS_BANDS) or GCIF_BAND_DESCRIPTION;  
{ GDAL PAM Flags  }
{ ERO 2011/04/13 : GPF_AUXMODE seems to be unimplemented  }
  GPF_DIRTY = $01;  { .pam file needs to be written on close }
  GPF_TRIED_READ_FAILED = $02;  { no need to keep trying to read .pam. }
  GPF_DISABLED = $04;  { do not try any PAM stuff. }
  GPF_AUXMODE = $08;  { store info in .aux (HFA) file. }
  GPF_NOSAVE = $10;  { do not try to save pam info. }

function PamGetProxy(para1:Pchar):Pchar;cdecl;external libgdal;
function PamAllocateProxy(para1:Pchar):Pchar;cdecl;external libgdal;
function PamDeallocateProxy(para1:Pchar):Pchar;cdecl;external libgdal;
procedure PamCleanProxyDB;cdecl;external libgdal;
{! @endcond }
{$endif}
{ ndef GDAL_PAM_H_INCLUDED  }

// === Konventiert am: 2-10-26 16:42:11 ===


implementation



end.
