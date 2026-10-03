{$IFDEF read_interface}


type
  PGDALPansharpenAlg = ^TGDALPansharpenAlg;
  TGDALPansharpenAlg = longint;
const
  GDAL_PSH_WEIGHTED_BROVEY = 0;

type
  PGDALPansharpenOptions = ^TGDALPansharpenOptions;
  TGDALPansharpenOptions = record
    ePansharpenAlg: TGDALPansharpenAlg;
    eResampleAlg: TGDALRIOResampleAlg;
    nBitDepth: longint;
    nWeightCount: longint;
    padfWeights: Pdouble;
    hPanchroBand: TGDALRasterBandH;
    nInputSpectralBands: longint;
    pahInputSpectralBands: PGDALRasterBandH;
    nOutPansharpenedBands: longint;
    panOutPansharpenedBands: Plongint;
    bHasNoData: longint;
    dfNoData: double;
    nThreads: longint;
  end;

function GDALCreatePansharpenOptions: PGDALPansharpenOptions; cdecl; external libgdal;
procedure GDALDestroyPansharpenOptions(para1: PGDALPansharpenOptions); cdecl; external libgdal;
function GDALClonePansharpenOptions(psOptions: PGDALPansharpenOptions): PGDALPansharpenOptions; cdecl; external libgdal;

type
  PGDALPansharpenOperationH = ^TGDALPansharpenOperationH;
  TGDALPansharpenOperationH = pointer;

function GDALCreatePansharpenOperation(para1: PGDALPansharpenOptions): TGDALPansharpenOperationH; cdecl; external libgdal;
procedure GDALDestroyPansharpenOperation(para1: TGDALPansharpenOperationH); cdecl; external libgdal;
function GDALPansharpenProcessRegion(hOperation: TGDALPansharpenOperationH; nXOff: longint; nYOff: longint; nXSize: longint; nYSize: longint;
  pDataBuf: pointer; eBufDataType: TGDALDataType): TCPLErr; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:42:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
