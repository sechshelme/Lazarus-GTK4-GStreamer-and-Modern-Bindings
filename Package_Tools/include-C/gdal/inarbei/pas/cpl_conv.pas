unit cpl_conv;

interface

uses
  fp_gdal;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


procedure CPLVerifyConfiguration;cdecl;external libgdal;
function CPLGetConfigOption(para1:Pchar; para2:Pchar):Pchar;cdecl;external libgdal;
function CPLGetThreadLocalConfigOption(para1:Pchar; para2:Pchar):Pchar;cdecl;external libgdal;
function CPLGetGlobalConfigOption(para1:Pchar; para2:Pchar):Pchar;cdecl;external libgdal;
procedure CPLSetConfigOption(para1:Pchar; para2:Pchar);cdecl;external libgdal;
procedure CPLSetThreadLocalConfigOption(pszKey:Pchar; pszValue:Pchar);cdecl;external libgdal;

type
  TCPLSetConfigOptionSubscriber = procedure (pszKey:Pchar; pszValue:Pchar; bThreadLocal:Boolean; pUserData:pointer);cdecl;

function CPLSubscribeToSetConfigOption(pfnCallback:TCPLSetConfigOptionSubscriber; pUserData:pointer):longint;cdecl;external libgdal;
procedure CPLUnsubscribeToSetConfigOption(nSubscriberId:longint);cdecl;external libgdal;
procedure CPLFreeConfig;cdecl;external libgdal;
function CPLGetConfigOptions:PPchar;cdecl;external libgdal;
procedure CPLSetConfigOptions(papszConfigOptions:PPchar);cdecl;external libgdal;
function CPLGetThreadLocalConfigOptions:PPchar;cdecl;external libgdal;
procedure CPLSetThreadLocalConfigOptions(papszConfigOptions:PPchar);cdecl;external libgdal;
procedure CPLLoadConfigOptionsFromFile(pszFilename:Pchar; bOverrideEnvVars:longint);cdecl;external libgdal;
procedure CPLLoadConfigOptionsFromPredefinedFiles;cdecl;external libgdal;

function CPLMalloc(para1:Tsize_t):pointer;cdecl;external libgdal;
function CPLCalloc(para1:Tsize_t; para2:Tsize_t):pointer;cdecl;external libgdal;
function CPLRealloc(para1:pointer; para2:Tsize_t):pointer;cdecl;external libgdal;
function CPLStrdup(para1:Pchar):Pchar;cdecl;external libgdal;
function CPLStrlwr(para1:Pchar):Pchar;cdecl;external libgdal;

const
  CPLFree = VSIFree;  

function CPLFGets(para1:Pchar; para2:longint; para3:PFILE):Pchar;cdecl;external libgdal;
function CPLReadLine(para1:PFILE):Pchar;cdecl;external libgdal;
function CPLReadLineL(para1:PVSILFILE):Pchar;cdecl;external libgdal;
function CPLReadLine2L(para1:PVSILFILE; para2:longint; para3:TCSLConstList):Pchar;cdecl;external libgdal;
function CPLReadLine3L(para1:PVSILFILE; para2:longint; para3:Plongint; para4:TCSLConstList):Pchar;cdecl;external libgdal;

function CPLAtof(para1:Pchar):Tdouble;cdecl;external libgdal;
function CPLAtofDelim(para1:Pchar; para2:char):Tdouble;cdecl;external libgdal;
function CPLStrtod(para1:Pchar; para2:PPchar):Tdouble;cdecl;external libgdal;
function CPLStrtodDelim(para1:Pchar; para2:PPchar; para3:char):Tdouble;cdecl;external libgdal;
function CPLStrtof(para1:Pchar; para2:PPchar):single;cdecl;external libgdal;
function CPLStrtofDelim(para1:Pchar; para2:PPchar; para3:char):single;cdecl;external libgdal;

function CPLAtofM(para1:Pchar):Tdouble;cdecl;external libgdal;

function CPLScanString(para1:Pchar; para2:longint; para3:longint; para4:longint):Pchar;cdecl;external libgdal;
function CPLScanDouble(para1:Pchar; para2:longint):Tdouble;cdecl;external libgdal;
function CPLScanLong(para1:Pchar; para2:longint):longint;cdecl;external libgdal;
function CPLScanULong(para1:Pchar; para2:longint):dword;cdecl;external libgdal;
function CPLScanUIntBig(para1:Pchar; para2:longint):TGUIntBig;cdecl;external libgdal;
function CPLAtoGIntBig(pszString:Pchar):TGIntBig;cdecl;external libgdal;
function CPLAtoGIntBigEx(pszString:Pchar; bWarn:longint; pbOverflow:Plongint):TGIntBig;cdecl;external libgdal;
function CPLScanPointer(para1:Pchar; para2:longint):pointer;cdecl;external libgdal;

function CPLPrintString(para1:Pchar; para2:Pchar; para3:longint):longint;cdecl;external libgdal;
function CPLPrintStringFill(para1:Pchar; para2:Pchar; para3:longint):longint;cdecl;external libgdal;
function CPLPrintInt32(para1:Pchar; para2:TGInt32; para3:longint):longint;cdecl;external libgdal;
function CPLPrintUIntBig(para1:Pchar; para2:TGUIntBig; para3:longint):longint;cdecl;external libgdal;
function CPLPrintDouble(para1:Pchar; para2:Pchar; para3:Tdouble; para4:Pchar):longint;cdecl;external libgdal;
function CPLPrintTime(para1:Pchar; para2:longint; para3:Pchar; para4:Ptm; para5:Pchar):longint;cdecl;external libgdal;
function CPLPrintPointer(para1:Pchar; para2:pointer; para3:longint):longint;cdecl;external libgdal;

function CPLGetSymbol(para1:Pchar; para2:Pchar):pointer;cdecl;external libgdal;

function CPLGetExecPath(pszPathBuf:Pchar; nMaxLength:longint):longint;cdecl;external libgdal;

function CPLGetPath(para1:Pchar):Pchar;cdecl;external libgdal;
function CPLGetDirname(para1:Pchar):Pchar;cdecl;external libgdal;
function CPLGetFilename(para1:Pchar):Pchar;cdecl;external libgdal;
function CPLGetBasename(para1:Pchar):Pchar;cdecl;external libgdal;
function CPLGetExtension(para1:Pchar):Pchar;cdecl;external libgdal;
function CPLGetCurrentDir:Pchar;cdecl;external libgdal;
function CPLFormFilename(pszPath:Pchar; pszBasename:Pchar; pszExtension:Pchar):Pchar;cdecl;external libgdal;
function CPLFormCIFilename(pszPath:Pchar; pszBasename:Pchar; pszExtension:Pchar):Pchar;cdecl;external libgdal;
function CPLResetExtension(para1:Pchar; para2:Pchar):Pchar;cdecl;external libgdal;
function CPLProjectRelativeFilename(pszProjectDir:Pchar; pszSecondaryFilename:Pchar):Pchar;cdecl;external libgdal;
function CPLIsFilenameRelative(pszFilename:Pchar):longint;cdecl;external libgdal;
function CPLExtractRelativePath(para1:Pchar; para2:Pchar; para3:Plongint):Pchar;cdecl;external libgdal;
function CPLCleanTrailingSlash(para1:Pchar):Pchar;cdecl;external libgdal;
function CPLCorrespondingPaths(pszOldFilename:Pchar; pszNewFilename:Pchar; papszFileList:PPchar):^Pchar;cdecl;external libgdal;
function CPLCheckForFile(pszFilename:Pchar; papszSiblingList:PPchar):longint;cdecl;external libgdal;
function CPLGenerateTempFilename(pszStem:Pchar):Pchar;cdecl;external libgdal;
function CPLExpandTilde(pszFilename:Pchar):Pchar;cdecl;external libgdal;
function CPLGetHomeDir:Pchar;cdecl;external libgdal;
function CPLLaunderForFilename(pszName:Pchar; pszOutputPath:Pchar):Pchar;cdecl;external libgdal;

type
  TCPLFileFinder = function (para1:Pchar; para2:Pchar):Pchar;cdecl;

function CPLFindFile(pszClass:Pchar; pszBasename:Pchar):Pchar;cdecl;external libgdal;
function CPLDefaultFindFile(pszClass:Pchar; pszBasename:Pchar):Pchar;cdecl;external libgdal;
procedure CPLPushFileFinder(pfnFinder:TCPLFileFinder);cdecl;external libgdal;
function CPLPopFileFinder:TCPLFileFinder;cdecl;external libgdal;
procedure CPLPushFinderLocation(para1:Pchar);cdecl;external libgdal;
procedure CPLPopFinderLocation;cdecl;external libgdal;
procedure CPLFinderClean;cdecl;external libgdal;

function CPLStat(para1:Pchar; para2:PVSIStatBuf):longint;cdecl;external libgdal;

type
  PCPLSharedFileInfo = ^TCPLSharedFileInfo;
  TCPLSharedFileInfo = record
      fp : PFILE;
      nRefCount : longint;
      bLarge : longint;
      pszFilename : Pchar;
      pszAccess : Pchar;
    end;

function CPLOpenShared(para1:Pchar; para2:Pchar; para3:longint):PFILE;cdecl;external libgdal;
procedure CPLCloseShared(para1:PFILE);cdecl;external libgdal;
function CPLGetSharedList(para1:Plongint):PCPLSharedFileInfo;cdecl;external libgdal;
procedure CPLDumpSharedList(para1:PFILE);cdecl;external libgdal;
procedure CPLCleanupSharedFileMutex;cdecl;external libgdal;

function CPLDMSToDec(is:Pchar):Tdouble;cdecl;external libgdal;
function CPLDecToDMS(dfAngle:Tdouble; pszAxis:Pchar; nPrecision:longint):Pchar;cdecl;external libgdal;
function CPLPackedDMSToDec(para1:Tdouble):Tdouble;cdecl;external libgdal;
function CPLDecToPackedDMS(dfDec:Tdouble):Tdouble;cdecl;external libgdal;
procedure CPLStringToComplex(pszString:Pchar; pdfReal:Pdouble; pdfImag:Pdouble);cdecl;external libgdal;

function CPLUnlinkTree(para1:Pchar):longint;cdecl;external libgdal;
function CPLCopyFile(pszNewPath:Pchar; pszOldPath:Pchar):longint;cdecl;external libgdal;
function CPLCopyTree(pszNewPath:Pchar; pszOldPath:Pchar):longint;cdecl;external libgdal;
function CPLMoveFile(pszNewPath:Pchar; pszOldPath:Pchar):longint;cdecl;external libgdal;
function CPLSymlink(pszOldPath:Pchar; pszNewPath:Pchar; papszOptions:TCSLConstList):longint;cdecl;external libgdal;

function CPLCreateZip(pszZipFilename:Pchar; papszOptions:PPchar):pointer;cdecl;external libgdal;
function CPLCreateFileInZip(hZip:pointer; pszFilename:Pchar; papszOptions:PPchar):TCPLErr;cdecl;external libgdal;
function CPLWriteFileInZip(hZip:pointer; pBuffer:pointer; nBufferSize:longint):TCPLErr;cdecl;external libgdal;
function CPLCloseFileInZip(hZip:pointer):TCPLErr;cdecl;external libgdal;
function CPLAddFileInZip(hZip:pointer; pszArchiveFilename:Pchar; pszInputFilename:Pchar; fpInput:PVSILFILE; papszOptions:TCSLConstList; 
           pProgressFunc:TGDALProgressFunc; pProgressData:pointer):TCPLErr;cdecl;external libgdal;
function CPLCloseZip(hZip:pointer):TCPLErr;cdecl;external libgdal;

function CPLZLibDeflate(ptr:pointer; nBytes:Tsize_t; nLevel:longint; outptr:pointer; nOutAvailableBytes:Tsize_t;
           pnOutBytes:Psize_t):pointer;cdecl;external libgdal;
function CPLZLibInflate(ptr:pointer; nBytes:Tsize_t; outptr:pointer; nOutAvailableBytes:Tsize_t; pnOutBytes:Psize_t):pointer;cdecl;external libgdal;

function CPLValidateXML(pszXMLFilename:Pchar; pszXSDFilename:Pchar; papszOptions:TCSLConstList):longint;cdecl;external libgdal;

function CPLsetlocale(category:longint; locale:Pchar):Pchar;cdecl;external libgdal;
procedure CPLCleanupSetlocaleMutex;cdecl;external libgdal;
function CPLIsPowerOfTwo(i:dword):longint;cdecl;external libgdal;

// === Konventiert am: 2-10-26 15:57:20 ===


implementation



end.
