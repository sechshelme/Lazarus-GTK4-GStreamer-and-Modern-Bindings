{$IFDEF read_interface}


type
  PCPLErr = ^TCPLErr;
  TCPLErr = longint;
const
  CE_None = 0;
  CE_Debug = 1;
  CE_Warning = 2;
  CE_Failure = 3;
  CE_Fatal = 4;

type
  PCPLErrorNum = ^TCPLErrorNum;
  TCPLErrorNum = longint;
const
  CPLE_None = 0;
  CPLE_AppDefined = 1;
  CPLE_OutOfMemory = 2;
  CPLE_FileIO = 3;
  CPLE_OpenFailed = 4;
  CPLE_IllegalArg = 5;
  CPLE_NotSupported = 6;
  CPLE_AssertionFailed = 7;
  CPLE_NoWriteAccess = 8;
  CPLE_UserInterrupt = 9;
  CPLE_ObjectNull = 10;
  CPLE_HttpResponse = 11;
  CPLE_AWSBucketNotFound = 12;
  CPLE_AWSObjectNotFound = 13;
  CPLE_AWSAccessDenied = 14;
  CPLE_AWSInvalidCredentials = 15;
  CPLE_AWSSignatureDoesNotMatch = 16;
  CPLE_AWSError = 17;

procedure CPLError(eErrClass: TCPLErr; err_no: TCPLErrorNum; fmt: pchar); cdecl; varargs; external libgdal;
procedure CPLErrorV(para1: TCPLErr; para2: TCPLErrorNum; para3: pchar; para4: Tva_list); cdecl; external libgdal;
procedure CPLEmergencyError(para1: pchar); cdecl; external libgdal;
procedure CPLErrorReset; cdecl; external libgdal;
function CPLGetLastErrorNo: TCPLErrorNum; cdecl; external libgdal;
function CPLGetLastErrorType: TCPLErr; cdecl; external libgdal;
function CPLGetLastErrorMsg: pchar; cdecl; external libgdal;
function CPLGetErrorCounter: TGUInt32; cdecl; external libgdal;
function CPLGetErrorHandlerUserData: pointer; cdecl; external libgdal;
procedure CPLErrorSetState(eErrClass: TCPLErr; err_no: TCPLErrorNum; pszMsg: pchar); cdecl; external libgdal;
procedure CPLCallPreviousHandler(eErrClass: TCPLErr; err_no: TCPLErrorNum; pszMsg: pchar); cdecl; external libgdal;
procedure CPLCleanupErrorMutex; cdecl; external libgdal;

type
  TCPLErrorHandler = procedure(para1: TCPLErr; para2: TCPLErrorNum; para3: pchar); cdecl;

procedure CPLLoggingErrorHandler(para1: TCPLErr; para2: TCPLErrorNum; para3: pchar); cdecl; external libgdal;
procedure CPLDefaultErrorHandler(para1: TCPLErr; para2: TCPLErrorNum; para3: pchar); cdecl; external libgdal;
procedure CPLQuietErrorHandler(para1: TCPLErr; para2: TCPLErrorNum; para3: pchar); cdecl; external libgdal;
procedure CPLTurnFailureIntoWarning(bOn: longint); cdecl; external libgdal;
function CPLGetErrorHandler(ppUserData: Ppointer): TCPLErrorHandler; cdecl; external libgdal;
function CPLSetErrorHandler(para1: TCPLErrorHandler): TCPLErrorHandler; cdecl; external libgdal;
function CPLSetErrorHandlerEx(para1: TCPLErrorHandler; para2: pointer): TCPLErrorHandler; cdecl; external libgdal;
procedure CPLPushErrorHandler(para1: TCPLErrorHandler); cdecl; external libgdal;
procedure CPLPushErrorHandlerEx(para1: TCPLErrorHandler; para2: pointer); cdecl; external libgdal;
procedure CPLSetCurrentErrorHandlerCatchDebug(bCatchDebug: longint); cdecl; external libgdal;
procedure CPLPopErrorHandler; cdecl; external libgdal;
procedure CPLDebug(para1: pchar; para2: pchar); cdecl; varargs; external libgdal;

procedure _CPLAssert(para1: pchar; para2: pchar; para3: longint); cdecl; external libgdal;
function CPLIsDefaultErrorHandlerAndCatchDebug: Boolean; cdecl; external libgdal;

// === Konventiert am: 2-10-26 15:57:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
