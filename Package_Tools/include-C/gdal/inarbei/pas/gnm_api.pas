unit gnm_api;

interface

uses
  fp_gdal, cpl_error, cpl_port, gnm, gdal, ogr_api;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGNMGFID = TGIntBig;
  PGNMGFID = ^TGNMGFID;

  PGNMNetworkH = ^TGNMNetworkH;
  TGNMNetworkH = pointer;

  PGNMGenericNetworkH = ^TGNMGenericNetworkH;
  TGNMGenericNetworkH = pointer;

function GNMGetName(hNet: TGNMNetworkH): pchar; cdecl; external libgdal;
function GNMGetVersion(hNet: TGNMNetworkH): longint; cdecl; external libgdal;
function GNMDisconnectAll(hNet: TGNMNetworkH): TCPLErr; cdecl; external libgdal;
function GNMGetFeatureByGlobalFID(hNet: TGNMNetworkH; nGFID: TGNMGFID): TOGRFeatureH; cdecl; external libgdal;
function GNMGetPath(hNet: TGNMNetworkH; nStartFID: TGNMGFID; nEndFID: TGNMGFID; eAlgorithm: TGNMGraphAlgorithmType; papszOptions: PPchar): TOGRLayerH; cdecl; external libgdal;
function GNMConnectFeatures(hNet: TGNMGenericNetworkH; nSrcFID: TGNMGFID; nTgtFID: TGNMGFID; nConFID: TGNMGFID; dfCost: double;
  dfInvCost: double; eDir: TGNMDirection): TCPLErr; cdecl; external libgdal;
function GNMDisconnectFeatures(hNet: TGNMGenericNetworkH; nSrcFID: TGNMGFID; nTgtFID: TGNMGFID; nConFID: TGNMGFID): TCPLErr; cdecl; external libgdal;
function GNMDisconnectFeaturesWithId(hNet: TGNMGenericNetworkH; nFID: TGNMGFID): TCPLErr; cdecl; external libgdal;
function GNMReconnectFeatures(hNet: TGNMGenericNetworkH; nSrcFID: TGNMGFID; nTgtFID: TGNMGFID; nConFID: TGNMGFID; dfCost: double;
  dfInvCost: double; eDir: TGNMDirection): TCPLErr; cdecl; external libgdal;
function GNMCreateRule(hNet: TGNMGenericNetworkH; pszRuleStr: pchar): TCPLErr; cdecl; external libgdal;
function GNMDeleteAllRules(hNet: TGNMGenericNetworkH): TCPLErr; cdecl; external libgdal;
function GNMDeleteRule(hNet: TGNMGenericNetworkH; pszRuleStr: pchar): TCPLErr; cdecl; external libgdal;
function GNMGetRules(hNet: TGNMGenericNetworkH): PPchar; cdecl; external libgdal;
function GNMConnectPointsByLines(hNet: TGNMGenericNetworkH; papszLayerList: PPchar; dfTolerance: double; dfCost: double; dfInvCost: double;
  eDir: TGNMDirection): TCPLErr; cdecl; external libgdal;
function GNMChangeBlockState(hNet: TGNMGenericNetworkH; nFID: TGNMGFID; bIsBlock: boolean): TCPLErr; cdecl; external libgdal;
function GNMChangeAllBlockState(hNet: TGNMGenericNetworkH; bIsBlock: longint): TCPLErr; cdecl; external libgdal;
function GNMCastToNetwork(hBase: TGDALMajorObjectH): TGNMNetworkH; cdecl; external libgdal;
function GNMCastToGenericNetwork(hBase: TGDALMajorObjectH): TGNMGenericNetworkH; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:54:25 ===


implementation



end.
