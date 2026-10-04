unit CXErrorCode;

interface

uses
  fp_clang;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TCXErrorCode = longint;
const
  CXError_Success = 0;
  CXError_Failure = 1;
  CXError_Crashed = 2;
  CXError_InvalidArguments = 3;
  CXError_ASTReadError = 4;


  // === Konventiert am: 4-10-26 17:29:56 ===


implementation



end.
