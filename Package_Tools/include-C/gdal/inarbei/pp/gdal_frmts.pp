
unit gdal_frmts;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdal_frmts.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdal_frmts.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*****************************************************************************
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
 *************************************************************************** }
{$ifndef GDAL_FRMTS_H_INCLUDED}
{$define GDAL_FRMTS_H_INCLUDED}
{$include "cpl_port.h"}

procedure GDALRegister_GTiff;cdecl;external;
procedure GDALRegister_GXF;cdecl;external;
procedure GDALRegister_HFA;cdecl;external;
procedure GDALRegister_AAIGrid;cdecl;external;
procedure GDALRegister_GRASSASCIIGrid;cdecl;external;
procedure GDALRegister_ISG;cdecl;external;
procedure GDALRegister_AIGrid;cdecl;external;
{ void  GDALRegister_AIGrid2(void); }
procedure GDALRegister_CEOS;cdecl;external;
procedure GDALRegister_SAR_CEOS;cdecl;external;
procedure GDALRegister_SDTS;cdecl;external;
procedure GDALRegister_ELAS;cdecl;external;
procedure GDALRegister_EHdr;cdecl;external;
procedure GDALRegister_GenBin;cdecl;external;
procedure GDALRegister_PAux;cdecl;external;
procedure GDALRegister_ENVI;cdecl;external;
procedure GDALRegister_DOQ1;cdecl;external;
procedure GDALRegister_DOQ2;cdecl;external;
procedure GDALRegister_DTED;cdecl;external;
procedure GDALRegister_MFF;cdecl;external;
procedure GDALRegister_HKV;cdecl;external;
procedure GDALRegister_PNG;cdecl;external;
procedure GDALRegister_DDS;cdecl;external;
procedure GDALRegister_GTA;cdecl;external;
procedure GDALRegister_JPEG;cdecl;external;
procedure GDALRegister_JP2KAK;cdecl;external;
procedure GDALRegister_JPIPKAK;cdecl;external;
procedure GDALRegister_MEM;cdecl;external;
procedure GDALRegister_JDEM;cdecl;external;
procedure GDALRegister_RASDAMAN;cdecl;external;
procedure GDALRegister_PNM;cdecl;external;
procedure GDALRegister_GIF;cdecl;external;
procedure GDALRegister_BIGGIF;cdecl;external;
procedure GDALRegister_Envisat;cdecl;external;
procedure GDALRegister_FITS;cdecl;external;
procedure GDALRegister_ECW;cdecl;external;
procedure GDALRegister_JP2ECW;cdecl;external;
procedure GDALRegister_ECW_JP2ECW;cdecl;external;
procedure GDALRegister_FujiBAS;cdecl;external;
procedure GDALRegister_FIT;cdecl;external;
procedure GDALRegister_VRT;cdecl;external;
procedure GDALRegister_USGSDEM;cdecl;external;
procedure GDALRegister_FAST;cdecl;external;
procedure GDALRegister_HDF4;cdecl;external;
procedure GDALRegister_HDF4Image;cdecl;external;
procedure GDALRegister_L1B;cdecl;external;
procedure GDALRegister_LDF;cdecl;external;
procedure GDALRegister_BSB;cdecl;external;
procedure GDALRegister_XPM;cdecl;external;
procedure GDALRegister_BMP;cdecl;external;
procedure GDALRegister_GSC;cdecl;external;
procedure GDALRegister_NITF;cdecl;external;
procedure GDALRegister_RPFTOC;cdecl;external;
procedure GDALRegister_ECRGTOC;cdecl;external;
procedure GDALRegister_MrSID;cdecl;external;
procedure GDALRegister_MG4Lidar;cdecl;external;
procedure GDALRegister_PCIDSK;cdecl;external;
procedure GDALRegister_BT;cdecl;external;
procedure GDALRegister_netCDF;cdecl;external;
procedure GDALRegister_LAN;cdecl;external;
procedure GDALRegister_CPG;cdecl;external;
procedure GDALRegister_AirSAR;cdecl;external;
procedure GDALRegister_RS2;cdecl;external;
procedure GDALRegister_ILWIS;cdecl;external;
procedure GDALRegister_PCRaster;cdecl;external;
procedure GDALRegister_IDA;cdecl;external;
procedure GDALRegister_NDF;cdecl;external;
procedure GDALRegister_RMF;cdecl;external;
procedure GDALRegister_BAG;cdecl;external;
procedure GDALRegister_S102;cdecl;external;
procedure GDALRegister_HDF5;cdecl;external;
procedure GDALRegister_HDF5Image;cdecl;external;
procedure GDALRegister_MSGN;cdecl;external;
procedure GDALRegister_MSG;cdecl;external;
procedure GDALRegister_RIK;cdecl;external;
procedure GDALRegister_Leveller;cdecl;external;
procedure GDALRegister_SGI;cdecl;external;
procedure GDALRegister_SRTMHGT;cdecl;external;
procedure GDALRegister_DIPEx;cdecl;external;
procedure GDALRegister_ISIS3;cdecl;external;
procedure GDALRegister_ISIS2;cdecl;external;
procedure GDALRegister_PDS;cdecl;external;
procedure GDALRegister_PDS4;cdecl;external;
procedure GDALRegister_VICAR;cdecl;external;
procedure GDALRegister_IDRISI;cdecl;external;
procedure GDALRegister_Terragen;cdecl;external;
procedure GDALRegister_WCS;cdecl;external;
procedure GDALRegister_WMS;cdecl;external;
procedure GDALRegister_HTTP;cdecl;external;
procedure GDALRegister_GSAG;cdecl;external;
procedure GDALRegister_GSBG;cdecl;external;
procedure GDALRegister_GS7BG;cdecl;external;
procedure GDALRegister_GRIB;cdecl;external;
procedure GDALRegister_INGR;cdecl;external;
procedure GDALRegister_ERS;cdecl;external;
procedure GDALRegister_PALSARJaxa;cdecl;external;
procedure GDALRegister_DIMAP;cdecl;external;
procedure GDALRegister_GFF;cdecl;external;
procedure GDALRegister_COSAR;cdecl;external;
procedure GDALRegister_TSX;cdecl;external;
procedure GDALRegister_ADRG;cdecl;external;
procedure GDALRegister_SRP;cdecl;external;
procedure GDALRegister_COASP;cdecl;external;
procedure GDALRegister_BLX;cdecl;external;
procedure GDALRegister_LCP;cdecl;external;
procedure GDALRegister_EIR;cdecl;external;
procedure GDALRegister_ESRIC;cdecl;external;
procedure GDALRegister_GEOR;cdecl;external;
procedure GDALRegister_TIL;cdecl;external;
procedure GDALRegister_R;cdecl;external;
procedure GDALRegister_Rasterlite;cdecl;external;
procedure GDALRegister_PostGISRaster;cdecl;external;
procedure GDALRegister_NWT_GRD;cdecl;external;
procedure GDALRegister_NWT_GRC;cdecl;external;
procedure GDALRegister_SAGA;cdecl;external;
procedure GDALRegister_KMLSUPEROVERLAY;cdecl;external;
procedure GDALRegister_GTX;cdecl;external;
procedure GDALRegister_LOSLAS;cdecl;external;
procedure GDALRegister_Istar;cdecl;external;
procedure GDALRegister_NTv2;cdecl;external;
procedure GDALRegister_CTable2;cdecl;external;
procedure GDALRegister_JP2OpenJPEG;cdecl;external;
procedure GDALRegister_XYZ;cdecl;external;
procedure GDALRegister_HF2;cdecl;external;
procedure GDALRegister_PDF;cdecl;external;
procedure GDALRegister_JPEGLS;cdecl;external;
procedure GDALRegister_MAP;cdecl;external;
procedure GDALRegister_OZI;cdecl;external;
procedure GDALRegister_ACE2;cdecl;external;
procedure GDALRegister_CTG;cdecl;external;
procedure GDALRegister_SNODAS;cdecl;external;
procedure GDALRegister_WEBP;cdecl;external;
procedure GDALRegister_ZMap;cdecl;external;
procedure GDALRegister_NGSGEOID;cdecl;external;
procedure GDALRegister_MBTiles;cdecl;external;
procedure GDALRegister_ARG;cdecl;external;
procedure GDALRegister_IRIS;cdecl;external;
procedure GDALRegister_KRO;cdecl;external;
procedure GDALRegister_KEA;cdecl;external;
procedure GDALRegister_ROIPAC;cdecl;external;
procedure GDALRegister_PLMOSAIC;cdecl;external;
procedure GDALRegister_CALS;cdecl;external;
procedure GDALRegister_ISCE;cdecl;external;
procedure GDALRegister_WMTS;cdecl;external;
procedure GDALRegister_SAFE;cdecl;external;
procedure GDALRegister_SENTINEL2;cdecl;external;
procedure GDALRegister_mrf;cdecl;external;
procedure GDALRegister_RRASTER;cdecl;external;
procedure GDALRegister_Derived;cdecl;external;
procedure GDALRegister_JP2Lura;cdecl;external;
procedure GDALRegister_PRF;cdecl;external;
procedure GDALRegister_NULL;cdecl;external;
procedure GDALRegister_EEDAI;cdecl;external;
procedure GDALRegister_EEDA;cdecl;external;
procedure GDALRegister_SIGDEM;cdecl;external;
procedure GDALRegister_BYN;cdecl;external;
procedure GDALRegister_TileDB;cdecl;external;
procedure GDALRegister_DAAS;cdecl;external;
procedure GDALRegister_COG;cdecl;external;
procedure GDALRegister_RDB;cdecl;external;
procedure GDALRegister_EXR;cdecl;external;
procedure GDALRegister_HEIF;cdecl;external;
procedure GDALRegister_TGA;cdecl;external;
procedure GDALRegister_OGCAPI;cdecl;external;
procedure GDALRegister_STACTA;cdecl;external;
procedure GDALRegister_Zarr;cdecl;external;
procedure GDALRegister_STACIT;cdecl;external;
procedure GDALRegister_JPEGXL;cdecl;external;
procedure GDALRegister_BASISU;cdecl;external;
procedure GDALRegister_KTX2;cdecl;external;
procedure GDALRegister_BASISU_KTX2;cdecl;external;
procedure GDALRegister_NOAA_B;cdecl;external;
procedure GDALRegister_NSIDCbin;cdecl;external;
{$endif}
{ ndef GDAL_FRMTS_H_INCLUDED  }

implementation


end.
