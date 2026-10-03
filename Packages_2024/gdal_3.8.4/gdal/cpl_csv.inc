{$IFDEF read_interface}


type
  PCSVCompareCriteria = ^TCSVCompareCriteria;
  TCSVCompareCriteria = longint;
const
  CC_ExactString = 0;
  CC_ApproxString = 1;
  CC_Integer = 2;

function CSVFilename(para1: pchar): pchar; cdecl; external libgdal;
function CSVDetectSeperator(pszLine: pchar): char; cdecl; external libgdal;
function CSVReadParseLine(fp: PFILE): PPchar; cdecl; external libgdal;
function CSVReadParseLine2(fp: PFILE; chDelimiter: char): PPchar; cdecl; external libgdal;
function CSVReadParseLineL(fp: PVSILFILE): PPchar; cdecl; external libgdal;
function CSVReadParseLine2L(fp: PVSILFILE; chDelimiter: char): PPchar; cdecl; external libgdal;
function CSVReadParseLine3L(fp: PVSILFILE; nMaxLineSize: Tsize_t; pszDelimiter: pchar; bHonourStrings: boolean; bKeepLeadingAndClosingQuotes: boolean;
  bMergeDelimiter: boolean; bSkipBOM: boolean): PPchar; cdecl; external libgdal;
function CSVScanLines(para1: PFILE; para2: longint; para3: pchar; para4: TCSVCompareCriteria): PPchar; cdecl; external libgdal;
function CSVScanLinesL(para1: PVSILFILE; para2: longint; para3: pchar; para4: TCSVCompareCriteria): PPchar; cdecl; external libgdal;
function CSVScanFile(para1: pchar; para2: longint; para3: pchar; para4: TCSVCompareCriteria): PPchar; cdecl; external libgdal;
function CSVScanFileByName(para1: pchar; para2: pchar; para3: pchar; para4: TCSVCompareCriteria): PPchar; cdecl; external libgdal;
procedure CSVRewind(para1: pchar); cdecl; external libgdal;
function CSVGetNextLine(para1: pchar): PPchar; cdecl; external libgdal;
function CSVGetFieldId(para1: PFILE; para2: pchar): longint; cdecl; external libgdal;
function CSVGetFieldIdL(para1: PVSILFILE; para2: pchar): longint; cdecl; external libgdal;
function CSVGetFileFieldId(para1: pchar; para2: pchar): longint; cdecl; external libgdal;
procedure CSVDeaccess(para1: pchar); cdecl; external libgdal;
function CSVGetField(para1: pchar; para2: pchar; para3: pchar; para4: TCSVCompareCriteria; para5: pchar): pchar; cdecl; external libgdal;

type
  TCSVFilenameHookFunc = function(pszFilename: pchar): pchar; cdecl;

procedure SetCSVFilenameHook(pfnHook: TCSVFilenameHookFunc); cdecl; external libgdal;

// === Konventiert am: 2-10-26 15:57:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
