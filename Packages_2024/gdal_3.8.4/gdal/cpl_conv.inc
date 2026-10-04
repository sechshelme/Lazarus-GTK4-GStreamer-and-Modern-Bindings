{$IFDEF read_interface}


procedure CPLVerifyConfiguration; cdecl; external libgdal;
function CPLGetConfigOption(para1: pchar; para2: pchar): pchar; cdecl; external libgdal;
function CPLGetThreadLocalConfigOption(para1: pchar; para2: pchar): pchar; cdecl; external libgdal;
function CPLGetGlobalConfigOption(para1: pchar; para2: pchar): pchar; cdecl; external libgdal;
procedure CPLSetConfigOption(para1: pchar; para2: pchar); cdecl; external libgdal;
procedure CPLSetThreadLocalConfigOption(pszKey: pchar; pszValue: pchar); cdecl; external libgdal;

type
  TCPLSetConfigOptionSubscriber = procedure(pszKey: pchar; pszValue: pchar; bThreadLocal: boolean; pUserData: pointer); cdecl;

function CPLSubscribeToSetConfigOption(pfnCallback: TCPLSetConfigOptionSubscriber; pUserData: pointer): longint; cdecl; external libgdal;
procedure CPLUnsubscribeToSetConfigOption(nSubscriberId: longint); cdecl; external libgdal;
procedure CPLFreeConfig; cdecl; external libgdal;
function CPLGetConfigOptions: PPchar; cdecl; external libgdal;
procedure CPLSetConfigOptions(papszConfigOptions: PPchar); cdecl; external libgdal;
function CPLGetThreadLocalConfigOptions: PPchar; cdecl; external libgdal;
procedure CPLSetThreadLocalConfigOptions(papszConfigOptions: PPchar); cdecl; external libgdal;
procedure CPLLoadConfigOptionsFromFile(pszFilename: pchar; bOverrideEnvVars: longint); cdecl; external libgdal;
procedure CPLLoadConfigOptionsFromPredefinedFiles; cdecl; external libgdal;

function CPLMalloc(para1: Tsize_t): pointer; cdecl; external libgdal;
function CPLCalloc(para1: Tsize_t; para2: Tsize_t): pointer; cdecl; external libgdal;
function CPLRealloc(para1: pointer; para2: Tsize_t): pointer; cdecl; external libgdal;
function CPLStrdup(para1: pchar): pchar; cdecl; external libgdal;
function CPLStrlwr(para1: pchar): pchar; cdecl; external libgdal;

function CPLFGets(para1: pchar; para2: longint; para3: PFILE): pchar; cdecl; external libgdal;
function CPLReadLine(para1: PFILE): pchar; cdecl; external libgdal;
function CPLReadLineL(para1: PVSILFILE): pchar; cdecl; external libgdal;
function CPLReadLine2L(para1: PVSILFILE; para2: longint; para3: TCSLConstList): pchar; cdecl; external libgdal;
function CPLReadLine3L(para1: PVSILFILE; para2: longint; para3: Plongint; para4: TCSLConstList): pchar; cdecl; external libgdal;

function CPLAtof(para1: pchar): double; cdecl; external libgdal;
function CPLAtofDelim(para1: pchar; para2: char): double; cdecl; external libgdal;
function CPLStrtod(para1: pchar; para2: PPchar): double; cdecl; external libgdal;
function CPLStrtodDelim(para1: pchar; para2: PPchar; para3: char): double; cdecl; external libgdal;
function CPLStrtof(para1: pchar; para2: PPchar): single; cdecl; external libgdal;
function CPLStrtofDelim(para1: pchar; para2: PPchar; para3: char): single; cdecl; external libgdal;

function CPLAtofM(para1: pchar): double; cdecl; external libgdal;

function CPLScanString(para1: pchar; para2: longint; para3: longint; para4: longint): pchar; cdecl; external libgdal;
function CPLScanDouble(para1: pchar; para2: longint): double; cdecl; external libgdal;
function CPLScanLong(para1: pchar; para2: longint): Tclong; cdecl; external libgdal;
function CPLScanULong(para1: pchar; para2: longint): Tculong; cdecl; external libgdal;
function CPLScanUIntBig(para1: pchar; para2: longint): TGUIntBig; cdecl; external libgdal;
function CPLAtoGIntBig(pszString: pchar): TGIntBig; cdecl; external libgdal;
function CPLAtoGIntBigEx(pszString: pchar; bWarn: longint; pbOverflow: Plongint): TGIntBig; cdecl; external libgdal;
function CPLScanPointer(para1: pchar; para2: longint): pointer; cdecl; external libgdal;

function CPLPrintString(para1: pchar; para2: pchar; para3: longint): longint; cdecl; external libgdal;
function CPLPrintStringFill(para1: pchar; para2: pchar; para3: longint): longint; cdecl; external libgdal;
function CPLPrintInt32(para1: pchar; para2: TGInt32; para3: longint): longint; cdecl; external libgdal;
function CPLPrintUIntBig(para1: pchar; para2: TGUIntBig; para3: longint): longint; cdecl; external libgdal;
function CPLPrindouble(para1: pchar; para2: pchar; para3: double; para4: pchar): longint; cdecl; external libgdal;
function CPLPrintTime(para1: pchar; para2: longint; para3: pchar; para4: Ptm; para5: pchar): longint; cdecl; external libgdal;
function CPLPrintPointer(para1: pchar; para2: pointer; para3: longint): longint; cdecl; external libgdal;

function CPLGetSymbol(para1: pchar; para2: pchar): pointer; cdecl; external libgdal;

function CPLGetExecPath(pszPathBuf: pchar; nMaxLength: longint): longint; cdecl; external libgdal;

function CPLGetPath(para1: pchar): pchar; cdecl; external libgdal;
function CPLGetDirname(para1: pchar): pchar; cdecl; external libgdal;
function CPLGetFilename(para1: pchar): pchar; cdecl; external libgdal;
function CPLGetBasename(para1: pchar): pchar; cdecl; external libgdal;
function CPLGetExtension(para1: pchar): pchar; cdecl; external libgdal;
function CPLGetCurrentDir: pchar; cdecl; external libgdal;
function CPLFormFilename(pszPath: pchar; pszBasename: pchar; pszExtension: pchar): pchar; cdecl; external libgdal;
function CPLFormCIFilename(pszPath: pchar; pszBasename: pchar; pszExtension: pchar): pchar; cdecl; external libgdal;
function CPLResetExtension(para1: pchar; para2: pchar): pchar; cdecl; external libgdal;
function CPLProjectRelativeFilename(pszProjectDir: pchar; pszSecondaryFilename: pchar): pchar; cdecl; external libgdal;
function CPLIsFilenameRelative(pszFilename: pchar): longint; cdecl; external libgdal;
function CPLExtractRelativePath(para1: pchar; para2: pchar; para3: Plongint): pchar; cdecl; external libgdal;
function CPLCleanTrailingSlash(para1: pchar): pchar; cdecl; external libgdal;
function CPLCorrespondingPaths(pszOldFilename: pchar; pszNewFilename: pchar; papszFileList: PPchar): PPchar; cdecl; external libgdal;
function CPLCheckForFile(pszFilename: pchar; papszSiblingList: PPchar): longint; cdecl; external libgdal;
function CPLGenerateTempFilename(pszStem: pchar): pchar; cdecl; external libgdal;
function CPLExpandTilde(pszFilename: pchar): pchar; cdecl; external libgdal;
function CPLGetHomeDir: pchar; cdecl; external libgdal;
function CPLLaunderForFilename(pszName: pchar; pszOutputPath: pchar): pchar; cdecl; external libgdal;

type
  TCPLFileFinder = function(para1: pchar; para2: pchar): pchar; cdecl;

function CPLFindFile(pszClass: pchar; pszBasename: pchar): pchar; cdecl; external libgdal;
function CPLDefaultFindFile(pszClass: pchar; pszBasename: pchar): pchar; cdecl; external libgdal;
procedure CPLPushFileFinder(pfnFinder: TCPLFileFinder); cdecl; external libgdal;
function CPLPopFileFinder: TCPLFileFinder; cdecl; external libgdal;
procedure CPLPushFinderLocation(para1: pchar); cdecl; external libgdal;
procedure CPLPopFinderLocation; cdecl; external libgdal;
procedure CPLFinderClean; cdecl; external libgdal;

function CPLStat(para1: pchar; para2: PVSIStatBuf): longint; cdecl; external libgdal;

type
  PCPLSharedFileInfo = ^TCPLSharedFileInfo;
  TCPLSharedFileInfo = record
    fp: PFILE;
    nRefCount: longint;
    bLarge: longint;
    pszFilename: pchar;
    pszAccess: pchar;
  end;

function CPLOpenShared(para1: pchar; para2: pchar; para3: longint): PFILE; cdecl; external libgdal;
procedure CPLCloseShared(para1: PFILE); cdecl; external libgdal;
function CPLGetSharedList(para1: Plongint): PCPLSharedFileInfo; cdecl; external libgdal;
procedure CPLDumpSharedList(para1: PFILE); cdecl; external libgdal;
procedure CPLCleanupSharedFileMutex; cdecl; external libgdal;

function CPLDMSToDec(is_: pchar): double; cdecl; external libgdal;
function CPLDecToDMS(dfAngle: double; pszAxis: pchar; nPrecision: longint): pchar; cdecl; external libgdal;
function CPLPackedDMSToDec(para1: double): double; cdecl; external libgdal;
function CPLDecToPackedDMS(dfDec: double): double; cdecl; external libgdal;
procedure CPLStringToComplex(pszString: pchar; pdfReal: Pdouble; pdfImag: Pdouble); cdecl; external libgdal;

function CPLUnlinkTree(para1: pchar): longint; cdecl; external libgdal;
function CPLCopyFile(pszNewPath: pchar; pszOldPath: pchar): longint; cdecl; external libgdal;
function CPLCopyTree(pszNewPath: pchar; pszOldPath: pchar): longint; cdecl; external libgdal;
function CPLMoveFile(pszNewPath: pchar; pszOldPath: pchar): longint; cdecl; external libgdal;
function CPLSymlink(pszOldPath: pchar; pszNewPath: pchar; papszOptions: TCSLConstList): longint; cdecl; external libgdal;

function CPLCreateZip(pszZipFilename: pchar; papszOptions: PPchar): pointer; cdecl; external libgdal;
function CPLCreateFileInZip(hZip: pointer; pszFilename: pchar; papszOptions: PPchar): TCPLErr; cdecl; external libgdal;
function CPLWriteFileInZip(hZip: pointer; pBuffer: pointer; nBufferSize: longint): TCPLErr; cdecl; external libgdal;
function CPLCloseFileInZip(hZip: pointer): TCPLErr; cdecl; external libgdal;
function CPLAddFileInZip(hZip: pointer; pszArchiveFilename: pchar; pszInputFilename: pchar; fpInput: PVSILFILE; papszOptions: TCSLConstList;
  pProgressFunc: TGDALProgressFunc; pProgressData: pointer): TCPLErr; cdecl; external libgdal;
function CPLCloseZip(hZip: pointer): TCPLErr; cdecl; external libgdal;

function CPLZLibDeflate(ptr: pointer; nBytes: Tsize_t; nLevel: longint; outptr: pointer; nOutAvailableBytes: Tsize_t;
  pnOutBytes: Psize_t): pointer; cdecl; external libgdal;
function CPLZLibInflate(ptr: pointer; nBytes: Tsize_t; outptr: pointer; nOutAvailableBytes: Tsize_t; pnOutBytes: Psize_t): pointer; cdecl; external libgdal;

function CPLValidateXML(pszXMLFilename: pchar; pszXSDFilename: pchar; papszOptions: TCSLConstList): longint; cdecl; external libgdal;

function CPLsetlocale(category: longint; locale: pchar): pchar; cdecl; external libgdal;
procedure CPLCleanupSetlocaleMutex; cdecl; external libgdal;
function CPLIsPowerOfTwo(i: dword): longint; cdecl; external libgdal;

// === Konventiert am: 2-10-26 15:57:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
