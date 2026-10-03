unit gdal_vrt;

interface

uses
  fp_gdal, cpl_error, cpl_minixml, gdal;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  VRT_NODATA_UNSET = -(1234.56);

type
  TVRTImageReadFunc = function(hCBData: pointer; nXOff: longint; nYOff: longint; nXSize: longint; nYSize: longint; pData: pointer): TCPLErr; cdecl;

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

  PVRTDatasetH = ^TVRTDatasetH;
  TVRTDatasetH = pointer;

  PVRTSourcedRasterBandH = ^TVRTSourcedRasterBandH;
  TVRTSourcedRasterBandH = pointer;

function VRTCreate(para1: longint; para2: longint): TVRTDatasetH; cdecl; external libgdal;
procedure VRTFlushCache(para1: TVRTDatasetH); cdecl; external libgdal;
function VRTSerializeToXML(para1: TVRTDatasetH; para2: pchar): PCPLXMLNode; cdecl; external libgdal;
function VRTAddBand(para1: TVRTDatasetH; para2: TGDALDataType; para3: PPchar): longint; cdecl; external libgdal;

function VRTAddSource(para1: TVRTSourcedRasterBandH; para2: TVRTSourceH): TCPLErr; cdecl; external libgdal;
function VRTAddSimpleSource(para1: TVRTSourcedRasterBandH; para2: TGDALRasterBandH; para3: longint; para4: longint; para5: longint;
  para6: longint; para7: longint; para8: longint; para9: longint; para10: longint;
  para11: pchar; para12: double): TCPLErr; cdecl; external libgdal;
function VRTAddComplexSource(para1: TVRTSourcedRasterBandH; para2: TGDALRasterBandH; para3: longint; para4: longint; para5: longint;
  para6: longint; para7: longint; para8: longint; para9: longint; para10: longint;
  para11: double; para12: double; para13: double): TCPLErr; cdecl; external libgdal;
function VRTAddFuncSource(para1: TVRTSourcedRasterBandH; para2: TVRTImageReadFunc; para3: pointer; para4: double): TCPLErr; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:54:33 ===


implementation



end.
