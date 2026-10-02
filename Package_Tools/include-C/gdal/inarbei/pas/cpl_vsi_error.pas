unit cpl_vsi_error;

interface

uses
  fp_gdal, cpl_error;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PVSIErrorNum = ^TVSIErrorNum;
  TVSIErrorNum = longint;

const
  VSIE_None = 0;
  VSIE_FileError = 1;
  VSIE_HttpError = 2;
  VSIE_AWSError = 5;
  VSIE_AWSAccessDenied = 6;
  VSIE_AWSBucketNotFound = 7;
  VSIE_AWSObjectNotFound = 8;
  VSIE_AWSInvalidCredentials = 9;
  VSIE_AWSSignatureDoesNotMatch = 10;

procedure VSIError(err_no: TVSIErrorNum; fmt: pchar); cdecl; varargs; external libgdal;
procedure VSIErrorReset; cdecl; external libgdal;
function VSIGetLastErrorNo: TVSIErrorNum; cdecl; external libgdal;
function VSIGetLastErrorMsg: pchar; cdecl; external libgdal;
function VSIToCPLError(eErrClass: TCPLErr; eDefaultErrorNo: TCPLErrorNum): longint; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:32:48 ===


implementation



end.
