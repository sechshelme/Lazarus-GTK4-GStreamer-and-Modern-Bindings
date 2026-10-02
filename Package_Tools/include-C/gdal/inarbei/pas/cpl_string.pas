unit cpl_string;

interface

uses
  fp_gdal, cpl_port;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function CSLAddString(papszStrList: PPchar; pszNewString: pchar): PPchar; cdecl; external libgdal;
function CSLAddStringMayFail(papszStrList: PPchar; pszNewString: pchar): PPchar; cdecl; external libgdal;
function CSLCount(papszStrList: TCSLConstList): longint; cdecl; external libgdal;
function CSLGetField(para1: TCSLConstList; para2: longint): pchar; cdecl; external libgdal;
procedure CSLDestroy(papszStrList: PPchar); cdecl; external libgdal;
function CSLDuplicate(papszStrList: TCSLConstList): PPchar; cdecl; external libgdal;
function CSLMerge(papszOrig: PPchar; papszOverride: TCSLConstList): PPchar; cdecl; external libgdal;
function CSLTokenizeString(pszString: pchar): PPchar; cdecl; external libgdal;
function CSLTokenizeStringComplex(pszString: pchar; pszDelimiter: pchar; bHonourStrings: longint; bAllowEmptyTokens: longint): PPchar; cdecl; external libgdal;
function CSLTokenizeString2(pszString: pchar; pszDelimiter: pchar; nCSLTFlags: longint): PPchar; cdecl; external libgdal;

const
  CSLT_HONOURSTRINGS = $0001;
  CSLT_ALLOWEMPTYTOKENS = $0002;
  CSLT_PRESERVEQUOTES = $0004;
  CSLT_PRESERVEESCAPES = $0008;
  CSLT_STRIPLEADSPACES = $0010;
  CSLT_STRIPENDSPACES = $0020;

function CSLPrint(papszStrList: TCSLConstList; fpOut: PFILE): longint; cdecl; external libgdal;
function CSLLoad(pszFname: pchar): PPchar; cdecl; external libgdal;
function CSLLoad2(pszFname: pchar; nMaxLines: longint; nMaxCols: longint; papszOptions: TCSLConstList): PPchar; cdecl; external libgdal;
function CSLSave(papszStrList: TCSLConstList; pszFname: pchar): longint; cdecl; external libgdal;
function CSLInsertStrings(papszStrList: PPchar; nInsertAtLineNo: longint; papszNewLines: TCSLConstList): PPchar; cdecl; external libgdal;
function CSLInsertString(papszStrList: PPchar; nInsertAtLineNo: longint; pszNewLine: pchar): PPchar; cdecl; external libgdal;
function CSLRemoveStrings(papszStrList: PPchar; nFirstLineToDelete: longint; nNumToRemove: longint; ppapszRetStrings: PPPchar): PPchar; cdecl; external libgdal;
function CSLFindString(papszList: TCSLConstList; pszTarget: pchar): longint; cdecl; external libgdal;
function CSLFindStringCaseSensitive(papszList: TCSLConstList; pszTarget: pchar): longint; cdecl; external libgdal;
function CSLPartialFindString(papszHaystack: TCSLConstList; pszNeedle: pchar): longint; cdecl; external libgdal;
function CSLFindName(papszStrList: TCSLConstList; pszName: pchar): longint; cdecl; external libgdal;
function CSLFetchBoolean(papszStrList: TCSLConstList; pszKey: pchar; bDefault: longint): longint; cdecl; external libgdal;
function CSLTestBoolean(pszValue: pchar): longint; cdecl; external libgdal;
function CPLTestBoolean(pszValue: pchar): longint; cdecl; external libgdal;
function CPLTestBool(pszValue: pchar): boolean; cdecl; external libgdal;
function CPLFetchBool(papszStrList: TCSLConstList; pszKey: pchar; bDefault: boolean): boolean; cdecl; external libgdal;
function CPLParseNameValue(pszNameValue: pchar; ppszKey: PPchar): pchar; cdecl; external libgdal;
function CSLFetchNameValue(papszStrList: TCSLConstList; pszName: pchar): pchar; cdecl; external libgdal;
function CSLFetchNameValueDef(papszStrList: TCSLConstList; pszName: pchar; pszDefault: pchar): pchar; cdecl; external libgdal;
function CSLFetchNameValueMultiple(papszStrList: TCSLConstList; pszName: pchar): PPchar; cdecl; external libgdal;
function CSLAddNameValue(papszStrList: PPchar; pszName: pchar; pszValue: pchar): PPchar; cdecl; external libgdal;
function CSLSetNameValue(papszStrList: PPchar; pszName: pchar; pszValue: pchar): PPchar; cdecl; external libgdal;
procedure CSLSetNameValueSeparator(papszStrList: PPchar; pszSeparator: pchar); cdecl; external libgdal;
function CSLParseCommandLine(pszCommandLine: pchar): PPchar; cdecl; external libgdal;

const
  CPLES_BackslashQuotable = 0;
  CPLES_XML = 1;
  CPLES_URL = 2;
  CPLES_SQL = 3;
  CPLES_CSV = 4;
  CPLES_XML_BUT_QUOTES = 5;
  CPLES_CSV_FORCE_QUOTING = 6;
  CPLES_SQLI = 7;

function CPLEscapeString(pszString: pchar; nLength: longint; nScheme: longint): pchar; cdecl; external libgdal;
function CPLUnescapeString(pszString: pchar; pnLength: Plongint; nScheme: longint): pchar; cdecl; external libgdal;
function CPLBinaryToHex(nBytes: longint; pabyData: PGByte): pchar; cdecl; external libgdal;
function CPLHexToBinary(pszHex: pchar; pnBytes: Plongint): PGByte; cdecl; external libgdal;
function CPLBase64Encode(nBytes: longint; pabyData: PGByte): pchar; cdecl; external libgdal;
function CPLBase64DecodeInPlace(pszBase64: PGByte): longint; cdecl; external libgdal;

type
  PCPLValueType = ^TCPLValueType;
  TCPLValueType = longint;
const
  CPL_VALUE_STRING = 0;
  CPL_VALUE_REAL = 1;
  CPL_VALUE_INTEGER = 2;

function CPLGetValueType(pszValue: pchar): TCPLValueType; cdecl; external libgdal;
function CPLStrlcpy(pszDest: pchar; pszSrc: pchar; nDestSize: Tsize_t): Tsize_t; cdecl; external libgdal;
function CPLStrlcat(pszDest: pchar; pszSrc: pchar; nDestSize: Tsize_t): Tsize_t; cdecl; external libgdal;
function CPLStrnlen(pszStr: pchar; nMaxLen: Tsize_t): Tsize_t; cdecl; external libgdal;

function CPLvsnprintf(str: pchar; size: Tsize_t; fmt: pchar; args: Tva_list): longint; cdecl; external libgdal;
function CPLsnprintf(str: pchar; size: Tsize_t; fmt: pchar; args: array of const): longint; cdecl; external libgdal;
function CPLsnprintf(str: pchar; size: Tsize_t; fmt: pchar): longint; cdecl; external libgdal;

function CPLsprintf(str: pchar; fmt: pchar): longint; cdecl; varargs; external libgdal;
function CPLprintf(fmt: pchar): longint; cdecl; varargs; external libgdal;

function CPLsscanf(str: pchar; fmt: pchar; args: array of const): longint; cdecl; external libgdal;
function CPLsscanf(str: pchar; fmt: pchar): longint; cdecl; external libgdal;

function CPLSPrintf(fmt: pchar): pchar; cdecl; varargs; external libgdal;
function CSLAppendPrintf(papszStrList: PPchar; fmt: pchar): PPchar; cdecl; varargs; external libgdal;
function CPLVASPrintf(buf: PPchar; fmt: pchar; args: Tva_list): longint; cdecl; external libgdal;

const
  CPL_ENC_LOCALE = '';
  CPL_ENC_UTF8 = 'UTF-8';
  CPL_ENC_UTF16 = 'UTF-16';
  CPL_ENC_UCS2 = 'UCS-2';
  CPL_ENC_UCS4 = 'UCS-4';
  CPL_ENC_ASCII = 'ASCII';
  CPL_ENC_ISO8859_1 = 'ISO-8859-1';

function CPLEncodingCharSize(pszEncoding: pchar): longint; cdecl; external libgdal;
procedure CPLClearRecodeWarningFlags; cdecl; external libgdal;
function CPLRecode(pszSource: pchar; pszSrcEncoding: pchar; pszDstEncoding: pchar): pchar; cdecl; external libgdal;
function CPLRecodeFromWChar(pwszSource: Pwchar_t; pszSrcEncoding: pchar; pszDstEncoding: pchar): pchar; cdecl; external libgdal;
function CPLRecodeToWChar(pszSource: pchar; pszSrcEncoding: pchar; pszDstEncoding: pchar): Pwchar_t; cdecl; external libgdal;
function CPLIsUTF8(pabyData: pchar; nLen: longint): longint; cdecl; external libgdal;
function CPLIsASCII(pabyData: pchar; nLen: Tsize_t): Boolean; cdecl; external libgdal;
function CPLForceToASCII(pabyData: pchar; nLen: longint; chReplacementChar: char): pchar; cdecl; external libgdal;
function CPLStrlenUTF8(pszUTF8Str: pchar): longint; cdecl; external libgdal;
function CPLCanRecode(pszTestStr: pchar; pszSrcEncoding: pchar; pszDstEncoding: pchar): longint; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:32:56 ===


implementation



end.
