unit fp_exttextcat;

interface

const
  {$IFDEF Linux}
  libexttextcat = 'exttextcat';
  {$ENDIF}

  {$IFDEF msWindows}
  libexttextcat = 'libexttextcat-2.0-1.dll';
  {$ENDIF}

type
  PFILE = type Pointer;
  Tsize_t = SizeUInt;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // ==== exttextcat-version.h

const
  EXTTEXTCAT_VERSION = '3.4.7';
  EXTTEXTCAT_VERSION_MAJOR = 3;
  EXTTEXTCAT_VERSION_MINOR = 4;
  EXTTEXTCAT_VERSION_MICRO = 7;


  // ==== common.h

type
  Pint8_t = ^Tint8_t;
  Tint8_t = int8;

  Puint8_t = ^Tuint8_t;
  Tuint8_t = uint8;

  Pint16_t = ^Tint16_t;
  Tint16_t = int16;

  Puint16_t = ^Tuint16_t;
  Tuint16_t = uint16;

  Pint32_t = ^Tint32_t;
  Tint32_t = int32;

  Puint32_t = ^Tuint32_t;
  Tuint32_t = uint32;

  Pint64_t = ^Tint64_t;
  Tint64_t = int64;

  Puint64_t = ^Tuint64_t;
  Tuint64_t = uint64;

type
  Puint4 = ^Tuint4;
  Tuint4 = Tuint32_t;

  Puint2 = ^Tuint2;
  Tuint2 = Tuint16_t;

  Puchar = ^Tuchar;
  Tuchar = Tuint8_t;

  Psint4 = ^Tsint4;
  Tsint4 = Tint32_t;

  Psint2 = ^Tsint2;
  Tsint2 = Tint16_t;

  Pschar = ^Tschar;
  Tschar = Tint8_t;

  Pboole = ^Tboole;
  Tboole = Tint8_t;

function wg_getline(line: Pchar; size: longint; fp: PFILE): Pchar; cdecl; external libexttextcat;
function wg_split(result: PPchar; dest: Pchar; src: Pchar; maxsegments: longint): dword; cdecl; external libexttextcat;
function wg_strgmov(dest: Pchar; src: Pchar; destlimit: Pchar): Pchar; cdecl; external libexttextcat;
function wg_trim(dest: Pchar; src: Pchar): Pchar; cdecl; external libexttextcat;


// ==== constants.h

const
  THRESHOLDVALUE = 1.03;
  MAXCANDIDATES = 5;
  MAXOUTPUTSIZE = 1024;
  MAXNGRAMS = 400;
  MAXNGRAMSYMBOL = 5;
  MAXNGRAMSIZE = MAXNGRAMSYMBOL * 4;
  MINDOCSIZE = 1;
  MAXOUTOFPLACE = 400;
  TABLEPOW = 13;
  MAXSCORE = MaxInt;
  DEFAULT_FINGERPRINTS_PATH = '';


  // ==== textcat_properties.h

type
  Ttextcat_Property = longint;
const
  TCPROP_UTF8AWARE = 0;
  TCPROP_MINIMUM_DOCUMENT_SIZE = 1;
  TCPROP_LAST = 2;

type
  Ttextcat_Bool = longint;
const
  TC_FALSE = 0;
  TC_TRUE = 1;

type
  Ptextcat_Property = type Pointer;


  // ==== fingerprint.h

function fp_Init(name: Pchar): pointer; cdecl; external libexttextcat;
procedure fp_Done(handle: pointer); cdecl; external libexttextcat;
function fp_Create(handle: pointer; buffer: Pchar; bufsize: Tuint4; maxngrams: Tuint4): longint; cdecl; external libexttextcat;
function fp_SetProperty(handle: pointer; _property: Ttextcat_Property; value: Tsint4): longint; cdecl; external libexttextcat;
function fp_Read(handle: pointer; fname: Pchar; maxngrams: longint): longint; cdecl; external libexttextcat;
function fp_Compare(cat: pointer; unknown: pointer; cutoff: longint): Tsint4; cdecl; external libexttextcat;
procedure fp_Show(handle: pointer); cdecl; external libexttextcat;
function fp_Name(handle: pointer): Pchar; cdecl; external libexttextcat;
procedure fp_Print(handle: pointer; fp: PFILE); cdecl; external libexttextcat;


// ==== textcat.h

const
  TEXTCAT_RESULT_UNKNOWN_STR = 'UNKNOWN';
  TEXTCAT_RESULT_SHORT_STR = 'SHORT';
  TEXTCAT_RESULT_UNKNOWN = 0;
  TEXTCAT_RESULT_SHORT = -(2);
  _TEXTCAT_RESULT_UNKOWN = TEXTCAT_RESULT_UNKNOWN_STR;
  _TEXTCAT_RESULT_SHORT = TEXTCAT_RESULT_SHORT_STR;
  TEXTCAT_RESULT_UNKOWN = TEXTCAT_RESULT_UNKNOWN;

type
  Pcandidate_t = ^Tcandidate_t;
  Tcandidate_t = record
    score: longint;
    name: Pchar;
  end;

function textcat_Init(conffile: Pchar): pointer; cdecl; external libexttextcat;
function special_textcat_Init(conffile: Pchar; prefix: Pchar): pointer; cdecl; external libexttextcat;
function textcat_SetProperty(handle: pointer; _property: Ttextcat_Property; value: Tsint4): longint; cdecl; external libexttextcat;
procedure textcat_Done(handle: pointer); cdecl; external libexttextcat;
function textcat_Classify(handle: pointer; buffer: Pchar; size: Tsize_t): Pchar; cdecl; external libexttextcat;
function textcat_GetClassifyFullOutput(handle: pointer): Pcandidate_t; cdecl; external libexttextcat;
procedure textcat_ReleaseClassifyFullOutput(handle: pointer; candidates: Pcandidate_t); cdecl; external libexttextcat;
function textcat_ClassifyFull(handle: pointer; buffer: Pchar; size: Tsize_t; candidates: Pcandidate_t): longint; cdecl; external libexttextcat;
function textcat_Version: Pchar; cdecl; external libexttextcat;


// ==== utf8misc.h

function utf8_next_char(str: Pchar): Pchar; cdecl; external libexttextcat;
function utf8_charcopy(str: Pchar; dest: Pchar): longint; cdecl; external libexttextcat;
function utf8_issame(lex: Pchar; key: Pchar; len: longint): longint; cdecl; external libexttextcat;
function utf8_strlen(str: Pchar): longint; cdecl; external libexttextcat;

implementation

end.
