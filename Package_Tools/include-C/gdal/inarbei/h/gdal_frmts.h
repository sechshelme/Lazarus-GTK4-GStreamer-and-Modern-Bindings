/******************************************************************************
 * $Id$
 *
 * Project:  GDAL
 * Purpose:  Prototypes for all format specific driver initialization.
 * Author:   Frank Warmerdam, warmerdam@pobox.com
 *
 ******************************************************************************
 * Copyright (c) 2001, Frank Warmerdam
 * Copyright (c) 2007-2014, Even Rouault <even dot rouault at spatialys.com>
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

#ifndef GDAL_FRMTS_H_INCLUDED
#define GDAL_FRMTS_H_INCLUDED

#include "cpl_port.h"


void  GDALRegister_GTiff(void);
void  GDALRegister_GXF(void);
void  GDALRegister_HFA(void);
void  GDALRegister_AAIGrid(void);
void  GDALRegister_GRASSASCIIGrid(void);
void  GDALRegister_ISG(void);
void  GDALRegister_AIGrid(void);
// void  GDALRegister_AIGrid2(void);
void  GDALRegister_CEOS(void);
void  GDALRegister_SAR_CEOS(void);
void  GDALRegister_SDTS(void);
void  GDALRegister_ELAS(void);
void  GDALRegister_EHdr(void);
void  GDALRegister_GenBin(void);
void  GDALRegister_PAux(void);
void  GDALRegister_ENVI(void);
void  GDALRegister_DOQ1(void);
void  GDALRegister_DOQ2(void);
void  GDALRegister_DTED(void);
void  GDALRegister_MFF(void);
void  GDALRegister_HKV(void);
void  GDALRegister_PNG(void);
void  GDALRegister_DDS(void);
void  GDALRegister_GTA(void);
void  GDALRegister_JPEG(void);
void  GDALRegister_JP2KAK(void);
void  GDALRegister_JPIPKAK(void);
void  GDALRegister_MEM(void);
void  GDALRegister_JDEM(void);
void  GDALRegister_RASDAMAN(void);
void  GDALRegister_PNM(void);
void  GDALRegister_GIF(void);
void  GDALRegister_BIGGIF(void);
void  GDALRegister_Envisat(void);
void  GDALRegister_FITS(void);
void  GDALRegister_ECW(void);
void  GDALRegister_JP2ECW(void);
void  GDALRegister_ECW_JP2ECW();
void  GDALRegister_FujiBAS(void);
void  GDALRegister_FIT(void);
void  GDALRegister_VRT(void);
void  GDALRegister_USGSDEM(void);
void  GDALRegister_FAST(void);
void  GDALRegister_HDF4(void);
void  GDALRegister_HDF4Image(void);
void  GDALRegister_L1B(void);
void  GDALRegister_LDF(void);
void  GDALRegister_BSB(void);
void  GDALRegister_XPM(void);
void  GDALRegister_BMP(void);
void  GDALRegister_GSC(void);
void  GDALRegister_NITF(void);
void  GDALRegister_RPFTOC(void);
void  GDALRegister_ECRGTOC(void);
void  GDALRegister_MrSID(void);
void  GDALRegister_MG4Lidar(void);
void  GDALRegister_PCIDSK(void);
void  GDALRegister_BT(void);
void  GDALRegister_netCDF(void);
void  GDALRegister_LAN(void);
void  GDALRegister_CPG(void);
void  GDALRegister_AirSAR(void);
void  GDALRegister_RS2(void);
void  GDALRegister_ILWIS(void);
void  GDALRegister_PCRaster(void);
void  GDALRegister_IDA(void);
void  GDALRegister_NDF(void);
void  GDALRegister_RMF(void);
void  GDALRegister_BAG(void);
void  GDALRegister_S102(void);
void  GDALRegister_HDF5(void);
void  GDALRegister_HDF5Image(void);
void  GDALRegister_MSGN(void);
void  GDALRegister_MSG(void);
void  GDALRegister_RIK(void);
void  GDALRegister_Leveller(void);
void  GDALRegister_SGI(void);
void  GDALRegister_SRTMHGT(void);
void  GDALRegister_DIPEx(void);
void  GDALRegister_ISIS3(void);
void  GDALRegister_ISIS2(void);
void  GDALRegister_PDS(void);
void  GDALRegister_PDS4(void);
void  GDALRegister_VICAR(void);
void  GDALRegister_IDRISI(void);
void  GDALRegister_Terragen(void);
void  GDALRegister_WCS(void);
void  GDALRegister_WMS(void);
void  GDALRegister_HTTP(void);
void  GDALRegister_GSAG(void);
void  GDALRegister_GSBG(void);
void  GDALRegister_GS7BG(void);
void  GDALRegister_GRIB(void);
void  GDALRegister_INGR(void);
void  GDALRegister_ERS(void);
void  GDALRegister_PALSARJaxa(void);
void  GDALRegister_DIMAP();
void  GDALRegister_GFF(void);
void  GDALRegister_COSAR(void);
void  GDALRegister_TSX(void);
void  GDALRegister_ADRG(void);
void  GDALRegister_SRP(void);
void  GDALRegister_COASP(void);
void  GDALRegister_BLX(void);
void  GDALRegister_LCP(void);
void  GDALRegister_EIR(void);
void  GDALRegister_ESRIC(void);
void  GDALRegister_GEOR(void);
void  GDALRegister_TIL(void);
void  GDALRegister_R(void);
void  GDALRegister_Rasterlite(void);
void  GDALRegister_PostGISRaster(void);
void  GDALRegister_NWT_GRD(void);
void  GDALRegister_NWT_GRC(void);
void  GDALRegister_SAGA(void);
void  GDALRegister_KMLSUPEROVERLAY(void);
void  GDALRegister_GTX(void);
void  GDALRegister_LOSLAS(void);
void  GDALRegister_Istar(void);
void  GDALRegister_NTv2(void);
void  GDALRegister_CTable2(void);
void  GDALRegister_JP2OpenJPEG(void);
void  GDALRegister_XYZ(void);
void  GDALRegister_HF2(void);
void  GDALRegister_PDF(void);
void  GDALRegister_JPEGLS(void);
void  GDALRegister_MAP(void);
void  GDALRegister_OZI(void);
void  GDALRegister_ACE2(void);
void  GDALRegister_CTG(void);
void  GDALRegister_SNODAS(void);
void  GDALRegister_WEBP(void);
void  GDALRegister_ZMap(void);
void  GDALRegister_NGSGEOID(void);
void  GDALRegister_MBTiles(void);
void  GDALRegister_ARG(void);
void  GDALRegister_IRIS(void);
void  GDALRegister_KRO(void);
void  GDALRegister_KEA(void);
void  GDALRegister_ROIPAC(void);
void  GDALRegister_PLMOSAIC(void);
void  GDALRegister_CALS(void);
void  GDALRegister_ISCE(void);
void  GDALRegister_WMTS(void);
void  GDALRegister_SAFE(void);
void  GDALRegister_SENTINEL2(void);
void  GDALRegister_mrf(void);
void  GDALRegister_RRASTER(void);
void  GDALRegister_Derived(void);
void  GDALRegister_JP2Lura(void);
void  GDALRegister_PRF(void);
void  GDALRegister_NULL(void);
void  GDALRegister_EEDAI(void);
void  GDALRegister_EEDA(void);
void  GDALRegister_SIGDEM(void);
void  GDALRegister_BYN(void);
void  GDALRegister_TileDB(void);
void  GDALRegister_DAAS(void);
void  GDALRegister_COG(void);
void  GDALRegister_RDB(void);
void  GDALRegister_EXR(void);
void  GDALRegister_HEIF(void);
void  GDALRegister_TGA(void);
void  GDALRegister_OGCAPI(void);
void  GDALRegister_STACTA(void);
void  GDALRegister_Zarr(void);
void  GDALRegister_STACIT(void);
void  GDALRegister_JPEGXL(void);
void  GDALRegister_BASISU(void);
void  GDALRegister_KTX2(void);
void  GDALRegister_BASISU_KTX2(void);
void  GDALRegister_NOAA_B(void);
void  GDALRegister_NSIDCbin(void);


#endif /* ndef GDAL_FRMTS_H_INCLUDED */
