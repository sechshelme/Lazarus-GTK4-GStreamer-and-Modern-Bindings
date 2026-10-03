{$IFDEF read_interface}


type
  PGDALProxyPoolDatasetH = ^TGDALProxyPoolDatasetH;
  TGDALProxyPoolDatasetH = type Pointer;

function GDALProxyPoolDatasetCreate(pszSourceDatasetDescription: pchar; nRasterXSize: longint; nRasterYSize: longint; eAccess: TGDALAccess; bShared: longint;
  pszProjectionRef: pchar; padfGeoTransform: Pdouble): TGDALProxyPoolDatasetH; cdecl; external libgdal;
procedure GDALProxyPoolDatasetDelete(hProxyPoolDataset: TGDALProxyPoolDatasetH); cdecl; external libgdal;
procedure GDALProxyPoolDatasetAddSrcBandDescription(hProxyPoolDataset: TGDALProxyPoolDatasetH; eDataType: TGDALDataType; nBlockXSize: longint; nBlockYSize: longint); cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:42:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
