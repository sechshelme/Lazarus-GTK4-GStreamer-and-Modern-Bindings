{$IFDEF read_interface}


const
  REMARKS_API_VERSION = 1;

type
  TLLVMRemarkType = longint;
const
  LLVMRemarkTypeUnknown = 0;
  LLVMRemarkTypePassed = 1;
  LLVMRemarkTypeMissed = 2;
  LLVMRemarkTypeAnalysis = 3;
  LLVMRemarkTypeAnalysisFPCommute = 4;
  LLVMRemarkTypeAnalysisAliasing = 5;
  LLVMRemarkTypeFailure = 6;

type
  PLLVMRemarkStringRef = ^TLLVMRemarkStringRef;
  TLLVMRemarkStringRef = type Pointer;

function LLVMRemarkStringGetData(_String: TLLVMRemarkStringRef): pchar; cdecl; external libllvm;
function LLVMRemarkStringGetLen(_String: TLLVMRemarkStringRef): Tuint32_t; cdecl; external libllvm;

type
  PLLVMRemarkDebugLocRef = ^TLLVMRemarkDebugLocRef;
  TLLVMRemarkDebugLocRef = type Pointer;

function LLVMRemarkDebugLocGetSourceFilePath(DL: TLLVMRemarkDebugLocRef): TLLVMRemarkStringRef; cdecl; external libllvm;
function LLVMRemarkDebugLocGetSourceLine(DL: TLLVMRemarkDebugLocRef): Tuint32_t; cdecl; external libllvm;
function LLVMRemarkDebugLocGetSourceColumn(DL: TLLVMRemarkDebugLocRef): Tuint32_t; cdecl; external libllvm;

type
  PLLVMRemarkArgRef = ^TLLVMRemarkArgRef;
  TLLVMRemarkArgRef = type Pointer;

function LLVMRemarkArgGetKey(Arg: TLLVMRemarkArgRef): TLLVMRemarkStringRef; cdecl; external libllvm;
function LLVMRemarkArgGetValue(Arg: TLLVMRemarkArgRef): TLLVMRemarkStringRef; cdecl; external libllvm;
function LLVMRemarkArgGetDebugLoc(Arg: TLLVMRemarkArgRef): TLLVMRemarkDebugLocRef; cdecl; external libllvm;

type
  PLLVMRemarkEntryRef = ^TLLVMRemarkEntryRef;
  TLLVMRemarkEntryRef = type Pointer;

procedure LLVMRemarkEntryDispose(Remark: TLLVMRemarkEntryRef); cdecl; external libllvm;
function LLVMRemarkEntryGetType(Remark: TLLVMRemarkEntryRef): TLLVMRemarkType; cdecl; external libllvm;
function LLVMRemarkEntryGetPassName(Remark: TLLVMRemarkEntryRef): TLLVMRemarkStringRef; cdecl; external libllvm;
function LLVMRemarkEntryGetRemarkName(Remark: TLLVMRemarkEntryRef): TLLVMRemarkStringRef; cdecl; external libllvm;
function LLVMRemarkEntryGetFunctionName(Remark: TLLVMRemarkEntryRef): TLLVMRemarkStringRef; cdecl; external libllvm;
function LLVMRemarkEntryGetDebugLoc(Remark: TLLVMRemarkEntryRef): TLLVMRemarkDebugLocRef; cdecl; external libllvm;
function LLVMRemarkEntryGetHotness(Remark: TLLVMRemarkEntryRef): Tuint64_t; cdecl; external libllvm;
function LLVMRemarkEntryGetNumArgs(Remark: TLLVMRemarkEntryRef): Tuint32_t; cdecl; external libllvm;
function LLVMRemarkEntryGetFirstArg(Remark: TLLVMRemarkEntryRef): TLLVMRemarkArgRef; cdecl; external libllvm;
function LLVMRemarkEntryGetNextArg(It: TLLVMRemarkArgRef; Remark: TLLVMRemarkEntryRef): TLLVMRemarkArgRef; cdecl; external libllvm;

type
  PLLVMRemarkParserRef = ^TLLVMRemarkParserRef;
  TLLVMRemarkParserRef = type Pointer;

function LLVMRemarkParserCreateYAML(Buf: pointer; Size: Tuint64_t): TLLVMRemarkParserRef; cdecl; external libllvm;
function LLVMRemarkParserCreateBitstream(Buf: pointer; Size: Tuint64_t): TLLVMRemarkParserRef; cdecl; external libllvm;
function LLVMRemarkParserGetNext(Parser: TLLVMRemarkParserRef): TLLVMRemarkEntryRef; cdecl; external libllvm;
function LLVMRemarkParserHasError(Parser: TLLVMRemarkParserRef): TLLVMBool; cdecl; external libllvm;
function LLVMRemarkParserGetErrorMessage(Parser: TLLVMRemarkParserRef): pchar; cdecl; external libllvm;
procedure LLVMRemarkParserDispose(Parser: TLLVMRemarkParserRef); cdecl; external libllvm;
function LLVMRemarkVersion: Tuint32_t; cdecl; external libllvm;

// === Konventiert am: 20-9-26 17:11:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
