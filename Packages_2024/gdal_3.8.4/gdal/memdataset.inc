{$IFDEF read_interface}


function MEMCreateRasterBand(para1: PGDALDatasetH; para2: longint; para3: PGByte; para4: TGDALDataType; para5: longint;
  para6: longint; para7: longint): TGDALRasterBandH; cdecl; external libgdal;
function MEMCreateRasterBandEx(para1: PGDALDatasetH; para2: longint; para3: PGByte; para4: TGDALDataType; para5: TGSpacing;
  para6: TGSpacing; para7: longint): TGDALRasterBandH; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:54:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
