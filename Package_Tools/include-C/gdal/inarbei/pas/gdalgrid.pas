unit gdalgrid;

interface

uses
  fp_gdal, cpl_port, cpl_error, gdal_alg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGDALGridFunction = function(para1: pointer; para2: TGUInt32; para3: Pdouble; para4: Pdouble; para5: Pdouble;
    para6: double; para7: double; para8: Pdouble; para9: pointer): TCPLErr; cdecl;

function GDALGridInverseDistanceToAPower(para1: pointer; para2: TGUInt32; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: double; para7: double; para8: Pdouble; para9: pointer): TCPLErr; cdecl; external libgdal;
function GDALGridInverseDistanceToAPowerNearestNeighbor(para1: pointer; para2: TGUInt32; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: double; para7: double; para8: Pdouble; para9: pointer): TCPLErr; cdecl; external libgdal;
function GDALGridInverseDistanceToAPowerNoSearch(para1: pointer; para2: TGUInt32; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: double; para7: double; para8: Pdouble; para9: pointer): TCPLErr; cdecl; external libgdal;
function GDALGridMovingAverage(para1: pointer; para2: TGUInt32; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: double; para7: double; para8: Pdouble; para9: pointer): TCPLErr; cdecl; external libgdal;
function GDALGridNearestNeighbor(para1: pointer; para2: TGUInt32; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: double; para7: double; para8: Pdouble; para9: pointer): TCPLErr; cdecl; external libgdal;
function GDALGridDataMetricMinimum(para1: pointer; para2: TGUInt32; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: double; para7: double; para8: Pdouble; para9: pointer): TCPLErr; cdecl; external libgdal;
function GDALGridDataMetricMaximum(para1: pointer; para2: TGUInt32; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: double; para7: double; para8: Pdouble; para9: pointer): TCPLErr; cdecl; external libgdal;
function GDALGridDataMetricRange(para1: pointer; para2: TGUInt32; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: double; para7: double; para8: Pdouble; para9: pointer): TCPLErr; cdecl; external libgdal;
function GDALGridDataMetricCount(para1: pointer; para2: TGUInt32; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: double; para7: double; para8: Pdouble; para9: pointer): TCPLErr; cdecl; external libgdal;
function GDALGridDataMetricAverageDistance(para1: pointer; para2: TGUInt32; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: double; para7: double; para8: Pdouble; para9: pointer): TCPLErr; cdecl; external libgdal;
function GDALGridDataMetricAverageDistancePts(para1: pointer; para2: TGUInt32; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: double; para7: double; para8: Pdouble; para9: pointer): TCPLErr; cdecl; external libgdal;
function GDALGridLinear(para1: pointer; para2: TGUInt32; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: double; para7: double; para8: Pdouble; para9: pointer): TCPLErr; cdecl; external libgdal;

function GDALGridParseAlgorithmAndOptions(para1: pchar; para2: PGDALGridAlgorithm; para3: Ppointer): TCPLErr; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:37:48 ===


implementation



end.
