{$IFDEF read_interface}

type
  TGDALIncludePixelFunc = function(para1: longint; para2: longint; para3: pointer): longint; cdecl;

function GDALComputeMedianCutPCT(hRed: TGDALRasterBandH; hGreen: TGDALRasterBandH; hBlue: TGDALRasterBandH; pfnIncludePixel: TGDALIncludePixelFunc; nColors: longint;
  hColorTable: TGDALColorTableH; pfnProgress: TGDALProgressFunc; pProgressArg: pointer): longint; cdecl; external libgdal;
function GDALDitherRGB2PCT(hRed: TGDALRasterBandH; hGreen: TGDALRasterBandH; hBlue: TGDALRasterBandH; hTarget: TGDALRasterBandH; hColorTable: TGDALColorTableH;
  pfnProgress: TGDALProgressFunc; pProgressArg: pointer): longint; cdecl; external libgdal;
function GDALChecksumImage(hBand: TGDALRasterBandH; nXOff: longint; nYOff: longint; nXSize: longint; nYSize: longint): longint; cdecl; external libgdal;
function GDALComputeProximity(hSrcBand: TGDALRasterBandH; hProximityBand: TGDALRasterBandH; papszOptions: PPchar; pfnProgress: TGDALProgressFunc; pProgressArg: pointer): TCPLErr; cdecl; external libgdal;
function GDALFillNodata(hTargetBand: TGDALRasterBandH; hMaskBand: TGDALRasterBandH; dfMaxSearchDist: double; bDeprecatedOption: longint; nSmoothingIterations: longint;
  papszOptions: PPchar; pfnProgress: TGDALProgressFunc; pProgressArg: pointer): TCPLErr; cdecl; external libgdal;
function GDALPolygonize(hSrcBand: TGDALRasterBandH; hMaskBand: TGDALRasterBandH; hOutLayer: TOGRLayerH; iPixValField: longint; papszOptions: PPchar;
  pfnProgress: TGDALProgressFunc; pProgressArg: pointer): TCPLErr; cdecl; external libgdal;
function GDALFPolygonize(hSrcBand: TGDALRasterBandH; hMaskBand: TGDALRasterBandH; hOutLayer: TOGRLayerH; iPixValField: longint; papszOptions: PPchar;
  pfnProgress: TGDALProgressFunc; pProgressArg: pointer): TCPLErr; cdecl; external libgdal;
function GDALSieveFilter(hSrcBand: TGDALRasterBandH; hMaskBand: TGDALRasterBandH; hDstBand: TGDALRasterBandH; nSizeThreshold: longint; nConnectedness: longint;
  papszOptions: PPchar; pfnProgress: TGDALProgressFunc; pProgressArg: pointer): TCPLErr; cdecl; external libgdal;
type
  PGDALTransformerFunc = ^TGDALTransformerFunc;
  TGDALTransformerFunc = function(pTransformerArg: pointer; bDstToSrc: longint; nPointCount: longint; x: Pdouble; y: Pdouble; z: Pdouble; panSuccess: Plongint): longint; cdecl;

const
  GDAL_GTI2_SIGNATURE = 'GTI2';

type
  PGDALTransformerInfo = ^TGDALTransformerInfo;
  TGDALTransformerInfo = record
    abySignature: array[0..3] of TGByte;
    pszClassName: pchar;
    pfnTransform: TGDALTransformerFunc;
    pfnCleanup: procedure(pTransformerArg: pointer); cdecl;
    pfnSerialize: function(pTransformerArg: pointer): PCPLXMLNode; cdecl;
    pfnCreateSimilar: function(pTransformerArg: pointer; dfSrcRatioX: double; dfSrcRatioY: double): pointer; cdecl;
  end;

procedure GDALDestroyTransformer(pTransformerArg: pointer); cdecl; external libgdal;
function GDALUseTransformer(pTransformerArg: pointer; bDstToSrc: longint; nPointCount: longint; x: Pdouble; y: Pdouble;
  z: Pdouble; panSuccess: Plongint): longint; cdecl; external libgdal;
function GDALCreateSimilarTransformer(psTransformerArg: pointer; dfSrcRatioX: double; dfSrcRatioY: double): pointer; cdecl; external libgdal;

function GDALCreateGenImgProjTransformer(hSrcDS: TGDALDatasetH; pszSrcWKT: pchar; hDstDS: TGDALDatasetH; pszDstWKT: pchar; bGCPUseOK: longint;
  dfGCPErrorThreshold: double; nOrder: longint): pointer; cdecl; external libgdal;
function GDALCreateGenImgProjTransformer2(hSrcDS: TGDALDatasetH; hDstDS: TGDALDatasetH; papszOptions: PPchar): pointer; cdecl; external libgdal;
function GDALCreateGenImgProjTransformer3(pszSrcWKT: pchar; padfSrcGeoTransform: Pdouble; pszDstWKT: pchar; padfDstGeoTransform: Pdouble): pointer; cdecl; external libgdal;
function GDALCreateGenImgProjTransformer4(hSrcSRS: TOGRSpatialReferenceH; padfSrcGeoTransform: Pdouble; hDstSRS: TOGRSpatialReferenceH; padfDstGeoTransform: Pdouble; papszOptions: PPchar): pointer; cdecl; external libgdal;
procedure GDALSetGenImgProjTransformerDstGeoTransform(para1: pointer; para2: Pdouble); cdecl; external libgdal;
procedure GDALDestroyGenImgProjTransformer(para1: pointer); cdecl; external libgdal;
function GDALGenImgProjTransform(pTransformArg: pointer; bDstToSrc: longint; nPointCount: longint; x: Pdouble; y: Pdouble;
  z: Pdouble; panSuccess: Plongint): longint; cdecl; external libgdal;
procedure GDALSetTransformerDstGeoTransform(para1: pointer; para2: Pdouble); cdecl; external libgdal;
procedure GDALGetTransformerDstGeoTransform(para1: pointer; para2: Pdouble); cdecl; external libgdal;
function GDALCreateReprojectionTransformer(pszSrcWKT: pchar; pszDstWKT: pchar): pointer; cdecl; external libgdal;
function GDALCreateReprojectionTransformerEx(hSrcSRS: TOGRSpatialReferenceH; hDstSRS: TOGRSpatialReferenceH; papszOptions: PPchar): pointer; cdecl; external libgdal;
procedure GDALDestroyReprojectionTransformer(para1: pointer); cdecl; external libgdal;
function GDALReprojectionTransform(pTransformArg: pointer; bDstToSrc: longint; nPointCount: longint; x: Pdouble; y: Pdouble;
  z: Pdouble; panSuccess: Plongint): longint; cdecl; external libgdal;
function GDALCreateGCPTransformer(nGCPCount: longint; pasGCPList: PGDAL_GCP; nReqOrder: longint; bReversed: longint): pointer; cdecl; external libgdal;
function GDALCreateGCPRefineTransformer(nGCPCount: longint; pasGCPList: PGDAL_GCP; nReqOrder: longint; bReversed: longint; tolerance: double;
  minimumGcps: longint): pointer; cdecl; external libgdal;
procedure GDALDestroyGCPTransformer(pTransformArg: pointer); cdecl; external libgdal;
function GDALGCPTransform(pTransformArg: pointer; bDstToSrc: longint; nPointCount: longint; x: Pdouble; y: Pdouble;
  z: Pdouble; panSuccess: Plongint): longint; cdecl; external libgdal;
function GDALCreateTPSTransformer(nGCPCount: longint; pasGCPList: PGDAL_GCP; bReversed: longint): pointer; cdecl; external libgdal;
procedure GDALDestroyTPSTransformer(pTransformArg: pointer); cdecl; external libgdal;
function GDALTPSTransform(pTransformArg: pointer; bDstToSrc: longint; nPointCount: longint; x: Pdouble; y: Pdouble;
  z: Pdouble; panSuccess: Plongint): longint; cdecl; external libgdal;

function RPCInfoV1ToMD(psRPCInfo: PGDALRPCInfoV1): PPchar; cdecl; external libgdal;
function RPCInfoV2ToMD(psRPCInfo: PGDALRPCInfoV2): PPchar; cdecl; external libgdal;

function GDALCreateRPCTransformerV1(psRPC: PGDALRPCInfoV1; bReversed: longint; dfPixErrThreshold: double; papszOptions: PPchar): pointer; cdecl; external libgdal;
function GDALCreateRPCTransformerV2(psRPC: PGDALRPCInfoV2; bReversed: longint; dfPixErrThreshold: double; papszOptions: PPchar): pointer; cdecl; external libgdal;
procedure GDALDestroyRPCTransformer(pTransformArg: pointer); cdecl; external libgdal;
function GDALRPCTransform(pTransformArg: pointer; bDstToSrc: longint; nPointCount: longint; x: Pdouble; y: Pdouble;
  z: Pdouble; panSuccess: Plongint): longint; cdecl; external libgdal;
function GDALCreateGeoLocTransformer(hBaseDS: TGDALDatasetH; papszGeolocationInfo: PPchar; bReversed: longint): pointer; cdecl; external libgdal;
procedure GDALDestroyGeoLocTransformer(pTransformArg: pointer); cdecl; external libgdal;
function GDALGeoLocTransform(pTransformArg: pointer; bDstToSrc: longint; nPointCount: longint; x: Pdouble; y: Pdouble;
  z: Pdouble; panSuccess: Plongint): longint; cdecl; external libgdal;
function GDALCreateApproxTransformer(pfnRawTransformer: TGDALTransformerFunc; pRawTransformerArg: pointer; dfMaxError: double): pointer; cdecl; external libgdal;
procedure GDALApproxTransformerOwnsSubtransformer(pCBData: pointer; bOwnFlag: longint); cdecl; external libgdal;
procedure GDALDestroyApproxTransformer(pApproxArg: pointer); cdecl; external libgdal;
function GDALApproxTransform(pTransformArg: pointer; bDstToSrc: longint; nPointCount: longint; x: Pdouble; y: Pdouble;
  z: Pdouble; panSuccess: Plongint): longint; cdecl; external libgdal;
function GDALSimpleImageWarp(hSrcDS: TGDALDatasetH; hDstDS: TGDALDatasetH; nBandCount: longint; panBandList: Plongint; pfnTransform: TGDALTransformerFunc;
  pTransformArg: pointer; pfnProgress: TGDALProgressFunc; pProgressArg: pointer; papszWarpOptions: PPchar): longint; cdecl; external libgdal;
function GDALSuggestedWarpOutput(hSrcDS: TGDALDatasetH; pfnTransformer: TGDALTransformerFunc; pTransformArg: pointer; padfGeoTransformOut: Pdouble; pnPixels: Plongint;
  pnLines: Plongint): TCPLErr; cdecl; external libgdal;

const
  GDAL_SWO_ROUND_UP_SIZE = $1;

function GDALSuggestedWarpOutput2(hSrcDS: TGDALDatasetH; pfnTransformer: TGDALTransformerFunc; pTransformArg: pointer; padfGeoTransformOut: Pdouble; pnPixels: Plongint;
  pnLines: Plongint; padfExtent: Pdouble; nOptions: longint): TCPLErr; cdecl; external libgdal;
function GDALSerializeTransformer(pfnFunc: TGDALTransformerFunc; pTransformArg: pointer): PCPLXMLNode; cdecl; external libgdal;
function GDALDeserializeTransformer(psTree: PCPLXMLNode; ppfnFunc: PGDALTransformerFunc; ppTransformArg: Ppointer): TCPLErr; cdecl; external libgdal;
function GDALTransformGeolocations(hXBand: TGDALRasterBandH; hYBand: TGDALRasterBandH; hZBand: TGDALRasterBandH; pfnTransformer: TGDALTransformerFunc; pTransformArg: pointer;
  pfnProgress: TGDALProgressFunc; pProgressArg: pointer; papszOptions: PPchar): TCPLErr; cdecl; external libgdal;

type
  TGDALContourWriter = function(dfLevel: double; nPoints: longint; padfX: Pdouble; padfY: Pdouble; para5: pointer): TCPLErr; cdecl;

  PGDALContourGeneratorH = ^TGDALContourGeneratorH;
  TGDALContourGeneratorH = pointer;

function GDAL_CG_Create(nWidth: longint; nHeight: longint; bNoDataSet: longint; dfNoDataValue: double; dfContourInterval: double;
  dfContourBase: double; pfnWriter: TGDALContourWriter; pCBData: pointer): TGDALContourGeneratorH; cdecl; external libgdal;
function GDAL_CG_FeedLine(hCG: TGDALContourGeneratorH; padfScanline: Pdouble): TCPLErr; cdecl; external libgdal;
procedure GDAL_CG_Destroy(hCG: TGDALContourGeneratorH); cdecl; external libgdal;

type
  POGRContourWriterInfo = ^TOGRContourWriterInfo;
  TOGRContourWriterInfo = record
    hLayer: pointer;
    adfGeoTransform: array[0..5] of double;
    nElevField: longint;
    nElevFieldMin: longint;
    nElevFieldMax: longint;
    nIDField: longint;
    nNextID: longint;
  end;

function OGRContourWriter(para1: double; para2: longint; para3: Pdouble; para4: Pdouble; pInfo: pointer): TCPLErr; cdecl; external libgdal;
function GDALContourGenerate(hBand: TGDALRasterBandH; dfContourInterval: double; dfContourBase: double; nFixedLevelCount: longint; padfFixedLevels: Pdouble;
  bUseNoData: longint; dfNoDataValue: double; hLayer: pointer; iIDField: longint; iElevField: longint;
  pfnProgress: TGDALProgressFunc; pProgressArg: pointer): TCPLErr; cdecl; external libgdal;
function GDALContourGenerateEx(hBand: TGDALRasterBandH; hLayer: pointer; options: TCSLConstList; pfnProgress: TGDALProgressFunc; pProgressArg: pointer): TCPLErr; cdecl; external libgdal;

type
  PGDALViewshedMode = ^TGDALViewshedMode;
  TGDALViewshedMode = longint;
const
  GVM_Diagonal = 1;
  GVM_Edge = 2;
  GVM_Max = 3;
  GVM_Min = 4;

type
  PGDALViewshedOutputType = ^TGDALViewshedOutputType;
  TGDALViewshedOutputType = longint;
const
  GVOT_NORMAL = 1;
  GVOT_MIN_TARGET_HEIGHT_FROM_DEM = 2;
  GVOT_MIN_TARGET_HEIGHT_FROM_GROUND = 3;

function GDALViewshedGenerate(hBand: TGDALRasterBandH; pszDriverName: pchar; pszTargetRasterName: pchar; papszCreationOptions: TCSLConstList; dfObserverX: double;
  dfObserverY: double; dfObserverHeight: double; dfTargetHeight: double; dfVisibleVal: double; dfInvisibleVal: double;
  dfOutOfRangeVal: double; dfNoDataVal: double; dfCurvCoeff: double; eMode: TGDALViewshedMode; dfMaxDistance: double;
  pfnProgress: TGDALProgressFunc; pProgressArg: pointer; heightMode: TGDALViewshedOutputType; papszExtraOptions: TCSLConstList): TGDALDatasetH; cdecl; external libgdal;

function GDALRasterizeGeometries(hDS: TGDALDatasetH; nBandCount: longint; panBandList: Plongint; nGeomCount: longint; pahGeometries: POGRGeometryH;
  pfnTransformer: TGDALTransformerFunc; pTransformArg: pointer; padfGeomBurnValues: Pdouble; papszOptions: TCSLConstList; pfnProgress: TGDALProgressFunc;
  pProgressArg: pointer): TCPLErr; cdecl; external libgdal;
function GDALRasterizeGeometriesInt64(hDS: TGDALDatasetH; nBandCount: longint; panBandList: Plongint; nGeomCount: longint; pahGeometries: POGRGeometryH;
  pfnTransformer: TGDALTransformerFunc; pTransformArg: pointer; panGeomBurnValues: Pint64_t; papszOptions: TCSLConstList; pfnProgress: TGDALProgressFunc;
  pProgressArg: pointer): TCPLErr; cdecl; external libgdal;
function GDALRasterizeLayers(hDS: TGDALDatasetH; nBandCount: longint; panBandList: Plongint; nLayerCount: longint; pahLayers: POGRLayerH;
  pfnTransformer: TGDALTransformerFunc; pTransformArg: pointer; padfLayerBurnValues: Pdouble; papszOptions: PPchar; pfnProgress: TGDALProgressFunc;
  pProgressArg: pointer): TCPLErr; cdecl; external libgdal;
function GDALRasterizeLayersBuf(pData: pointer; nBufXSize: longint; nBufYSize: longint; eBufType: TGDALDataType; nPixelSpace: longint;
  nLineSpace: longint; nLayerCount: longint; pahLayers: POGRLayerH; pszDstProjection: pchar; padfDstGeoTransform: Pdouble;
  pfnTransformer: TGDALTransformerFunc; pTransformArg: pointer; dfBurnValue: double; papszOptions: PPchar; pfnProgress: TGDALProgressFunc;
  pProgressArg: pointer): TCPLErr; cdecl; external libgdal;

type
  PGDALGridAlgorithm = ^TGDALGridAlgorithm;
  TGDALGridAlgorithm = longint;
const
  GGA_InverseDistanceToAPower = 1;
  GGA_MovingAverage = 2;
  GGA_NearestNeighbor = 3;
  GGA_MetricMinimum = 4;
  GGA_MetricMaximum = 5;
  GGA_MetricRange = 6;
  GGA_MetricCount = 7;
  GGA_MetricAverageDistance = 8;
  GGA_MetricAverageDistancePts = 9;
  GGA_Linear = 10;
  GGA_InverseDistanceToAPowerNearestNeighbor = 11;

type
  PGDALGridInverseDistanceToAPowerOptions = ^TGDALGridInverseDistanceToAPowerOptions;
  TGDALGridInverseDistanceToAPowerOptions = record
    nSizeOfStructure: Tsize_t;
    dfPower: double;
    dfSmoothing: double;
    dfAnisotropyRatio: double;
    dfAnisotropyAngle: double;
    dfRadius1: double;
    dfRadius2: double;
    dfAngle: double;
    nMaxPoints: TGUInt32;
    nMinPoints: TGUInt32;
    dfNoDataValue: double;
  end;

  PGDALGridInverseDistanceToAPowerNearestNeighborOptions = ^TGDALGridInverseDistanceToAPowerNearestNeighborOptions;
  TGDALGridInverseDistanceToAPowerNearestNeighborOptions = record
    nSizeOfStructure: Tsize_t;
    dfPower: double;
    dfRadius: double;
    dfSmoothing: double;
    nMaxPoints: TGUInt32;
    nMinPoints: TGUInt32;
    dfNoDataValue: double;
    nMaxPointsPerQuadrant: TGUInt32;
    nMinPointsPerQuadrant: TGUInt32;
  end;

  PGDALGridMovingAverageOptions = ^TGDALGridMovingAverageOptions;
  TGDALGridMovingAverageOptions = record
    nSizeOfStructure: Tsize_t;
    dfRadius1: double;
    dfRadius2: double;
    dfAngle: double;
    nMaxPoints: TGUInt32;
    nMinPoints: TGUInt32;
    dfNoDataValue: double;
    nMaxPointsPerQuadrant: TGUInt32;
    nMinPointsPerQuadrant: TGUInt32;
  end;

  PGDALGridNearestNeighborOptions = ^TGDALGridNearestNeighborOptions;
  TGDALGridNearestNeighborOptions = record
    nSizeOfStructure: Tsize_t;
    dfRadius1: double;
    dfRadius2: double;
    dfAngle: double;
    dfNoDataValue: double;
  end;

  PGDALGridDataMetricsOptions = ^TGDALGridDataMetricsOptions;
  TGDALGridDataMetricsOptions = record
    nSizeOfStructure: Tsize_t;
    dfRadius1: double;
    dfRadius2: double;
    dfAngle: double;
    nMinPoints: TGUInt32;
    dfNoDataValue: double;
    nMaxPointsPerQuadrant: TGUInt32;
    nMinPointsPerQuadrant: TGUInt32;
  end;

  PGDALGridLinearOptions = ^TGDALGridLinearOptions;
  TGDALGridLinearOptions = record
    nSizeOfStructure: Tsize_t;
    dfRadius: double;
    dfNoDataValue: double;
  end;

function GDALGridCreate(para1: TGDALGridAlgorithm; para2: pointer; para3: TGUInt32; para4: Pdouble; para5: Pdouble;
  para6: Pdouble; para7: double; para8: double; para9: double; para10: double;
  para11: TGUInt32; para12: TGUInt32; para13: TGDALDataType; para14: pointer; para15: TGDALProgressFunc;
  para16: pointer): TCPLErr; cdecl; external libgdal;
type
  PGDALGridContext = type Pointer;

function GDALGridContextCreate(eAlgorithm: TGDALGridAlgorithm; poOptions: pointer; nPoints: TGUInt32; padfX: Pdouble; padfY: Pdouble;
  padfZ: Pdouble; bCallerWillKeepPointArraysAlive: longint): PGDALGridContext; cdecl; external libgdal;
procedure GDALGridContextFree(psContext: PGDALGridContext); cdecl; external libgdal;
function GDALGridContextProcess(psContext: PGDALGridContext; dfXMin: double; dfXMax: double; dfYMin: double; dfYMax: double;
  nXSize: TGUInt32; nYSize: TGUInt32; eType: TGDALDataType; pData: pointer; pfnProgress: TGDALProgressFunc;
  pProgressArg: pointer): TCPLErr; cdecl; external libgdal;
function GDALComputeMatchingPoints(hFirstImage: TGDALDatasetH; hSecondImage: TGDALDatasetH; papszOptions: PPchar; pnGCPCount: Plongint): PGDAL_GCP; cdecl; external libgdal;

type
  PGDALTriFacet = ^TGDALTriFacet;
  TGDALTriFacet = record
    anVertexIdx: array[0..2] of longint;
    anNeighborIdx: array[0..2] of longint;
  end;

  PGDALTriBarycentricCoefficients = ^TGDALTriBarycentricCoefficients;
  TGDALTriBarycentricCoefficients = record
    dfMul1X: double;
    dfMul1Y: double;
    dfMul2X: double;
    dfMul2Y: double;
    dfCstX: double;
    dfCstY: double;
  end;

  PGDALTriangulation = ^TGDALTriangulation;
  TGDALTriangulation = record
    nFacets: longint;
    pasFacets: PGDALTriFacet;
    pasFacetCoefficients: PGDALTriBarycentricCoefficients;
  end;

function GDALHasTriangulation: longint; cdecl; external libgdal;
function GDALTriangulationCreateDelaunay(nPoints: longint; padfX: Pdouble; padfY: Pdouble): PGDALTriangulation; cdecl; external libgdal;
function GDALTriangulationComputeBarycentricCoefficients(psDT: PGDALTriangulation; padfX: Pdouble; padfY: Pdouble): longint; cdecl; external libgdal;
function GDALTriangulationComputeBarycentricCoordinates(psDT: PGDALTriangulation; nFacetIdx: longint; dfX: double; dfY: double; pdfL1: Pdouble;
  pdfL2: Pdouble; pdfL3: Pdouble): longint; cdecl; external libgdal;
function GDALTriangulationFindFacetBruteForce(psDT: PGDALTriangulation; dfX: double; dfY: double; panOutputFacetIdx: Plongint): longint; cdecl; external libgdal;
function GDALTriangulationFindFacetDirected(psDT: PGDALTriangulation; nFacetIdx: longint; dfX: double; dfY: double; panOutputFacetIdx: Plongint): longint; cdecl; external libgdal;
procedure GDALTriangulationFree(psDT: PGDALTriangulation); cdecl; external libgdal;

function GDALOpenVerticalShiftGrid(pszProj4Geoidgrids: pchar; pbError: Plongint): TGDALDatasetH; cdecl; external libgdal;

function GDALApplyVerticalShiftGrid(hSrcDataset: TGDALDatasetH; hGridDataset: TGDALDatasetH; bInverse: longint; dfSrcUnitToMeter: double; dfDstUnitToMeter: double;
  papszOptions: PPchar): TGDALDatasetH; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:37:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
