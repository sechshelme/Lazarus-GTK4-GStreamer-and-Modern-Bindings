/******************************************************************************
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
 ****************************************************************************/

#ifndef GDAL_PAM_H_INCLUDED
#define GDAL_PAM_H_INCLUDED

//! @cond Doxygen_Suppress

#include "cpl_minixml.h"
#include "gdal_priv.h"
#include <limits>
#include <map>
#include <vector>

class GDALPamRasterBand;

/* Clone Info Flags */

#define GCIF_GEOTRANSFORM 0x01
#define GCIF_PROJECTION 0x02
#define GCIF_METADATA 0x04
#define GCIF_GCPS 0x08

#define GCIF_NODATA 0x001000
#define GCIF_CATEGORYNAMES 0x002000
#define GCIF_MINMAX 0x004000
#define GCIF_SCALEOFFSET 0x008000
#define GCIF_UNITTYPE 0x010000
#define GCIF_COLORTABLE 0x020000
#define GCIF_COLORINTERP 0x020000
#define GCIF_BAND_METADATA 0x040000
#define GCIF_RAT 0x080000
#define GCIF_MASK 0x100000
#define GCIF_BAND_DESCRIPTION 0x200000

#define GCIF_ONLY_IF_MISSING 0x10000000
#define GCIF_PROCESS_BANDS 0x20000000

#define GCIF_PAM_DEFAULT                                                       \
    (GCIF_GEOTRANSFORM | GCIF_PROJECTION | GCIF_METADATA | GCIF_GCPS |         \
     GCIF_NODATA | GCIF_CATEGORYNAMES | GCIF_MINMAX | GCIF_SCALEOFFSET |       \
     GCIF_UNITTYPE | GCIF_COLORTABLE | GCIF_COLORINTERP | GCIF_BAND_METADATA | \
     GCIF_RAT | GCIF_MASK | GCIF_ONLY_IF_MISSING | GCIF_PROCESS_BANDS |        \
     GCIF_BAND_DESCRIPTION)

/* GDAL PAM Flags */
/* ERO 2011/04/13 : GPF_AUXMODE seems to be unimplemented */
#define GPF_DIRTY 0x01              // .pam file needs to be written on close
#define GPF_TRIED_READ_FAILED 0x02  // no need to keep trying to read .pam.
#define GPF_DISABLED 0x04           // do not try any PAM stuff.
#define GPF_AUXMODE 0x08            // store info in .aux (HFA) file.
#define GPF_NOSAVE 0x10             // do not try to save pam info.


const char  *PamGetProxy(const char *);
const char  *PamAllocateProxy(const char *);
const char  *PamDeallocateProxy(const char *);
void  PamCleanProxyDB(void);

//! @endcond

#endif /* ndef GDAL_PAM_H_INCLUDED */
