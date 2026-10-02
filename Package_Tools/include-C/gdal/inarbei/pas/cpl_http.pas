unit cpl_http;

interface

uses
  fp_gdal, cpl_port, cpl_progress;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  CPL_HTTP_MAX_RETRY = 0;
  CPL_HTTP_RETRY_DELAY = 30.0;

type
  PCPLMimePart = ^TCPLMimePart;
  TCPLMimePart = record
    papszHeaders: ^pchar;
    pabyData: PGByte;
    nDataLen: longint;
  end;

  PPCPLHTTPResult = ^PCPLHTTPResult;
  PCPLHTTPResult = ^TCPLHTTPResult;
  TCPLHTTPResult = record
    nStatus: longint;
    pszContentType: pchar;
    pszErrBuf: pchar;
    nDataLen: longint;
    nDataAlloc: longint;
    pabyData: PGByte;
    papszHeaders: ^pchar;
    nMimePartCount: longint;
    pasMimePart: PCPLMimePart;
  end;

  TCPLHTTPFetchWriteFunc = function(pBuffer: pointer; nSize: Tsize_t; nMemb: Tsize_t; pWriteArg: pointer): Tsize_t; cdecl;

function CPLHTTPEnabled: longint; cdecl; external libgdal;
function CPLHTTPFetch(pszURL: pchar; papszOptions: TCSLConstList): PCPLHTTPResult; cdecl; external libgdal;
function CPLHTTPFetchEx(pszURL: pchar; papszOptions: TCSLConstList; pfnProgress: TGDALProgressFunc; pProgressArg: pointer; pfnWrite: TCPLHTTPFetchWriteFunc;
  pWriteArg: pointer): PCPLHTTPResult; cdecl; external libgdal;
function CPLHTTPMultiFetch(papszURL: PPchar; nURLCount: longint; nMaxSimultaneous: longint; papszOptions: TCSLConstList): PPCPLHTTPResult; cdecl; external libgdal;
procedure CPLHTTPCleanup; cdecl; external libgdal;
procedure CPLHTTPDestroyResult(psResult: PCPLHTTPResult); cdecl; external libgdal;
procedure CPLHTTPDestroyMultiResult(papsResults: PPCPLHTTPResult; nCount: longint); cdecl; external libgdal;
function CPLHTTPParseMultipartMime(psResult: PCPLHTTPResult): longint; cdecl; external libgdal;
procedure CPLHTTPSetDefaultUserAgent(pszUserAgent: pchar); cdecl; external libgdal;

type
  TCPLHTTPFetchCallbackFunc = function(pszURL: pchar; papszOptions: TCSLConstList; pfnProgress: TGDALProgressFunc; pProgressArg: pointer; pfnWrite: TCPLHTTPFetchWriteFunc; pWriteArg: pointer; pUserData: pointer): PCPLHTTPResult; cdecl;

procedure CPLHTTPSetFetchCallback(pFunc: TCPLHTTPFetchCallbackFunc; pUserData: pointer); cdecl; external libgdal;
function CPLHTTPPushFetchCallback(pFunc: TCPLHTTPFetchCallbackFunc; pUserData: pointer): longint; cdecl; external libgdal;
function CPLHTTPPopFetchCallback: longint; cdecl; external libgdal;

function GOA2GetAuthorizationURL(pszScope: pchar): pchar; cdecl; external libgdal;
function GOA2GetRefreshToken(pszAuthToken: pchar; pszScope: pchar): pchar; cdecl; external libgdal;
function GOA2GetAccessToken(pszRefreshToken: pchar; pszScope: pchar): pchar; cdecl; external libgdal;
function GOA2GetAccessTokenFromServiceAccount(pszPrivateKey: pchar; pszClientEmail: pchar; pszScope: pchar; papszAdditionalClaims: TCSLConstList; papszOptions: TCSLConstList): Ppchar; cdecl; external libgdal;
function GOA2GetAccessTokenFromCloudEngineVM(papszOptions: TCSLConstList): Ppchar; cdecl; external libgdal;

// === Konventiert am: 2-10-26 15:57:06 ===


implementation



end.
