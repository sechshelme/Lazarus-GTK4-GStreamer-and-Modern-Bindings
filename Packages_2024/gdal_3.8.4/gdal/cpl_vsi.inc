{$IFDEF read_interface}


function VSIFOpen(para1: pchar; para2: pchar): PFILE; cdecl; external libgdal;
function VSIFClose(para1: PFILE): longint; cdecl; external libgdal;
function VSIFSeek(para1: PFILE; para2: longint; para3: longint): longint; cdecl; external libgdal;
function VSIFTell(para1: PFILE): longint; cdecl; external libgdal;
procedure VSIRewind(para1: PFILE); cdecl; external libgdal;
procedure VSIFFlush(para1: PFILE); cdecl; external libgdal;
function VSIFRead(para1: pointer; para2: Tsize_t; para3: Tsize_t; para4: PFILE): Tsize_t; cdecl; external libgdal;
function VSIFWrite(para1: pointer; para2: Tsize_t; para3: Tsize_t; para4: PFILE): Tsize_t; cdecl; external libgdal;
function VSIFGets(para1: pchar; para2: longint; para3: PFILE): pchar; cdecl; external libgdal;
function VSIFPuts(para1: pchar; para2: PFILE): longint; cdecl; external libgdal;
function VSIFPrintf(para1: PFILE; para2: pchar; args: array of const): longint; cdecl; external libgdal;
function VSIFPrintf(para1: PFILE; para2: pchar): longint; cdecl; external libgdal;
function VSIFGetc(para1: PFILE): longint; cdecl; external libgdal;
function VSIFPutc(para1: longint; para2: PFILE): longint; cdecl; external libgdal;
function VSIUngetc(para1: longint; para2: PFILE): longint; cdecl; external libgdal;
function VSIFEof(para1: PFILE): longint; cdecl; external libgdal;

type
  PVSIStatBuf = type Pointer;

function VSIStat(para1: pchar; para2: PVSIStatBuf): longint; cdecl; external libgdal;

type
  Pvsi_l_offset = ^Tvsi_l_offset;
  Tvsi_l_offset = TGUIntBig;

type
  PVSILFILE = PVSIVirtualHandle;

function VSIFOpenL(para1: pchar; para2: pchar): PVSILFILE; cdecl; external libgdal;
function VSIFOpenExL(para1: pchar; para2: pchar; para3: longint): PVSILFILE; cdecl; external libgdal;
function VSIFOpenEx2L(para1: pchar; para2: pchar; para3: longint; para4: TCSLConstList): PVSILFILE; cdecl; external libgdal;
function VSIFCloseL(para1: PVSILFILE): longint; cdecl; external libgdal;
function VSIFSeekL(para1: PVSILFILE; para2: Tvsi_l_offset; para3: longint): longint; cdecl; external libgdal;
function VSIFTellL(para1: PVSILFILE): Tvsi_l_offset; cdecl; external libgdal;
procedure VSIRewindL(para1: PVSILFILE); cdecl; external libgdal;
function VSIFReadL(para1: pointer; para2: Tsize_t; para3: Tsize_t; para4: PVSILFILE): Tsize_t; cdecl; external libgdal;
function VSIFReadMultiRangeL(nRanges: longint; ppData: Ppointer; panOffsets: Pvsi_l_offset; panSizes: Psize_t; para5: PVSILFILE): longint; cdecl; external libgdal;
function VSIFWriteL(para1: pointer; para2: Tsize_t; para3: Tsize_t; para4: PVSILFILE): Tsize_t; cdecl; external libgdal;
function VSIFEofL(para1: PVSILFILE): longint; cdecl; external libgdal;
function VSIFTruncateL(para1: PVSILFILE; para2: Tvsi_l_offset): longint; cdecl; external libgdal;
function VSIFFlushL(para1: PVSILFILE): longint; cdecl; external libgdal;
function VSIFPrintfL(para1: PVSILFILE; para2: pchar; args: array of const): longint; cdecl; external libgdal;
function VSIFPrintfL(para1: PVSILFILE; para2: pchar): longint; cdecl; external libgdal;
function VSIFPutcL(para1: longint; para2: PVSILFILE): longint; cdecl; external libgdal;

type
  PVSIRangeStatus = ^TVSIRangeStatus;
  TVSIRangeStatus = longint;
const
  VSI_RANGE_STATUS_UNKNOWN = 0;
  VSI_RANGE_STATUS_DATA = 1;
  VSI_RANGE_STATUS_HOLE = 2;

function VSIFGetRangeStatusL(fp: PVSILFILE; nStart: Tvsi_l_offset; nLength: Tvsi_l_offset): TVSIRangeStatus; cdecl; external libgdal;
function VSIIngestFile(fp: PVSILFILE; pszFilename: pchar; ppabyRet: PPGByte; pnSize: Pvsi_l_offset; nMaxSize: TGIntBig): longint; cdecl; external libgdal;
function VSIOverwriteFile(fpTarget: PVSILFILE; pszSourceFilename: pchar): longint; cdecl; external libgdal;

type
  PVSIStatBufL = PVSIStatBuf;

function VSIStatL(para1: pchar; para2: PVSIStatBufL): longint; cdecl; external libgdal;

const
  VSI_STAT_EXISTS_FLAG = $1;
  VSI_STAT_NATURE_FLAG = $2;
  VSI_STAT_SIZE_FLAG = $4;
  VSI_STAT_SET_ERROR_FLAG = $8;
  VSI_STAT_CACHE_ONLY = $10;

function VSIStatExL(pszFilename: pchar; psStatBuf: PVSIStatBufL; nFlags: longint): longint; cdecl; external libgdal;
function VSIIsCaseSensitiveFS(pszFilename: pchar): longint; cdecl; external libgdal;
function VSISupportsSparseFiles(pszPath: pchar): longint; cdecl; external libgdal;
function VSIIsLocal(pszPath: pchar): boolean; cdecl; external libgdal;
function VSIGetCanonicalFilename(pszPath: pchar): pchar; cdecl; external libgdal;
function VSISupportsSequentialWrite(pszPath: pchar; bAllowLocalTempFile: boolean): boolean; cdecl; external libgdal;
function VSISupportsRandomWrite(pszPath: pchar; bAllowLocalTempFile: boolean): boolean; cdecl; external libgdal;
function VSIHasOptimizedReadMultiRange(pszPath: pchar): longint; cdecl; external libgdal;
function VSIGetActualURL(pszFilename: pchar): pchar; cdecl; external libgdal;
function VSIGetSignedURL(pszFilename: pchar; papszOptions: TCSLConstList): pchar; cdecl; external libgdal;
function VSIGetFileSystemOptions(pszFilename: pchar): pchar; cdecl; external libgdal;
function VSIGetFileSystemsPrefixes: PPchar; cdecl; external libgdal;
function VSIFGetNativeFileDescriptorL(para1: PVSILFILE): pointer; cdecl; external libgdal;
function VSIGetFileMetadata(pszFilename: pchar; pszDomain: pchar; papszOptions: TCSLConstList): PPchar; cdecl; external libgdal;
function VSISetFileMetadata(pszFilename: pchar; papszMetadata: TCSLConstList; pszDomain: pchar; papszOptions: TCSLConstList): longint; cdecl; external libgdal;
procedure VSISetPathSpecificOption(pszPathPrefix: pchar; pszKey: pchar; pszValue: pchar); cdecl; external libgdal;
procedure VSIClearPathSpecificOptions(pszPathPrefix: pchar); cdecl; external libgdal;
function VSIGetPathSpecificOption(pszPath: pchar; pszKey: pchar; pszDefault: pchar): pchar; cdecl; external libgdal;
procedure VSISetCredential(pszPathPrefix: pchar; pszKey: pchar; pszValue: pchar); cdecl; external libgdal; deprecated;
procedure VSIClearCredentials(pszPathPrefix: pchar); cdecl; external libgdal; deprecated;
function VSIGetCredential(pszPath: pchar; pszKey: pchar; pszDefault: pchar): pchar; cdecl; external libgdal; deprecated;

function VSICalloc(para1: Tsize_t; para2: Tsize_t): pointer; cdecl; external libgdal;
function VSIMalloc(para1: Tsize_t): pointer; cdecl; external libgdal;
procedure VSIFree(para1: pointer); cdecl; external libgdal;
function VSIRealloc(para1: pointer; para2: Tsize_t): pointer; cdecl; external libgdal;
function VSIStrdup(para1: pchar): pchar; cdecl; external libgdal;
function VSIMallocAligned(nAlignment: Tsize_t; nSize: Tsize_t): pointer; cdecl; external libgdal;
function VSIMallocAlignedAuto(nSize: Tsize_t): pointer; cdecl; external libgdal;
procedure VSIFreeAligned(ptr: pointer); cdecl; external libgdal;
function VSIMallocAlignedAutoVerbose(nSize: Tsize_t; pszFile: pchar; nLine: longint): pointer; cdecl; external libgdal;

function VSIMalloc2(nSize1: Tsize_t; nSize2: Tsize_t): pointer; cdecl; external libgdal;
function VSIMalloc3(nSize1: Tsize_t; nSize2: Tsize_t; nSize3: Tsize_t): pointer; cdecl; external libgdal;
function VSIMallocVerbose(nSize: Tsize_t; pszFile: pchar; nLine: longint): pointer; cdecl; external libgdal;
function VSIMalloc2Verbose(nSize1: Tsize_t; nSize2: Tsize_t; pszFile: pchar; nLine: longint): pointer; cdecl; external libgdal;
function VSIMalloc3Verbose(nSize1: Tsize_t; nSize2: Tsize_t; nSize3: Tsize_t; pszFile: pchar; nLine: longint): pointer; cdecl; external libgdal;

function VSICallocVerbose(nCount: Tsize_t; nSize: Tsize_t; pszFile: pchar; nLine: longint): pointer; cdecl; external libgdal;
function VSIReallocVerbose(pOldPtr: pointer; nNewSize: Tsize_t; pszFile: pchar; nLine: longint): pointer; cdecl; external libgdal;
function VSIStrdupVerbose(pszStr: pchar; pszFile: pchar; nLine: longint): pchar; cdecl; external libgdal;
function CPLGetPhysicalRAM: TGIntBig; cdecl; external libgdal;
function CPLGetUsablePhysicalRAM: TGIntBig; cdecl; external libgdal;

function VSIReadDir(para1: pchar): PPchar; cdecl; external libgdal;
function VSIReadDirRecursive(pszPath: pchar): PPchar; cdecl; external libgdal;
function VSIReadDirEx(pszPath: pchar; nMaxFiles: longint): PPchar; cdecl; external libgdal;
function VSISiblingFiles(pszPath: pchar): PPchar; cdecl; external libgdal;

type
  PVSIDIR = type Pointer;

function VSIOpenDir(pszPath: pchar; nRecurseDepth: longint; papszOptions: PPchar): PVSIDIR; cdecl; external libgdal;

type
  PVSIDIREntry = ^TVSIDIREntry;
  TVSIDIREntry = record
    pszName: pchar;
    nMode: longint;
    nSize: Tvsi_l_offset;
    nMTime: TGIntBig;
    bModeKnown: char;
    bSizeKnown: char;
    bMTimeKnown: char;
    papszExtra: ^pchar;
  end;

function VSIGetNextDirEntry(dir: PVSIDIR): PVSIDIREntry; cdecl; external libgdal;
procedure VSICloseDir(dir: PVSIDIR); cdecl; external libgdal;
function VSIMkdir(pszPathname: pchar; mode: longint): longint; cdecl; external libgdal;
function VSIMkdirRecursive(pszPathname: pchar; mode: longint): longint; cdecl; external libgdal;
function VSIRmdir(pszDirname: pchar): longint; cdecl; external libgdal;
function VSIRmdirRecursive(pszDirname: pchar): longint; cdecl; external libgdal;
function VSIUnlink(pszFilename: pchar): longint; cdecl; external libgdal;
function VSIUnlinkBatch(papszFiles: TCSLConstList): Plongint; cdecl; external libgdal;
function VSIRename(oldpath: pchar; newpath: pchar): longint; cdecl; external libgdal;
function VSICopyFile(pszSource: pchar; pszTarget: pchar; fpSource: PVSILFILE; nSourceSize: Tvsi_l_offset; papszOptions: PPchar;
  pProgressFunc: TGDALProgressFunc; pProgressData: pointer): longint; cdecl; external libgdal;
function VSISync(pszSource: pchar; pszTarget: pchar; papszOptions: PPchar; pProgressFunc: TGDALProgressFunc; pProgressData: pointer;
  ppapszOutputs: PPPchar): longint; cdecl; external libgdal;
function VSIAbortPendingUploads(pszFilename: pchar): longint; cdecl; external libgdal;
function VSIStrerror(para1: longint): pchar; cdecl; external libgdal;
function VSIGetDiskFreeSpace(pszDirname: pchar): TGIntBig; cdecl; external libgdal;
procedure VSINetworkStatsReset; cdecl; external libgdal;
function VSINetworkStatsGetAsSerializedJSON(papszOptions: PPchar): pchar; cdecl; external libgdal;

procedure VSIInstallMemFileHandler; cdecl; external libgdal;
procedure VSIInstallLargeFileHandler; cdecl; external libgdal;
procedure VSIInstallSubFileHandler; cdecl; external libgdal;
procedure VSIInstallCurlFileHandler; cdecl; external libgdal;
procedure VSICurlClearCache; cdecl; external libgdal;
procedure VSICurlPartialClearCache(pszFilenamePrefix: pchar); cdecl; external libgdal;
procedure VSIInstallCurlStreamingFileHandler; cdecl; external libgdal;
procedure VSIInstallS3FileHandler; cdecl; external libgdal;
procedure VSIInstallS3StreamingFileHandler; cdecl; external libgdal;
procedure VSIInstallGSFileHandler; cdecl; external libgdal;
procedure VSIInstallGSStreamingFileHandler; cdecl; external libgdal;
procedure VSIInstallAzureFileHandler; cdecl; external libgdal;
procedure VSIInstallAzureStreamingFileHandler; cdecl; external libgdal;
procedure VSIInstallADLSFileHandler; cdecl; external libgdal;
procedure VSIInstallOSSFileHandler; cdecl; external libgdal;
procedure VSIInstallOSSStreamingFileHandler; cdecl; external libgdal;
procedure VSIInstallSwiftFileHandler; cdecl; external libgdal;
procedure VSIInstallSwiftStreamingFileHandler; cdecl; external libgdal;
procedure VSIInstall7zFileHandler; cdecl; external libgdal;
procedure VSIInstallRarFileHandler; cdecl; external libgdal;
procedure VSIInstallGZipFileHandler; cdecl; external libgdal;
procedure VSIInstallZipFileHandler; cdecl; external libgdal;
procedure VSIInstallStdinHandler; cdecl; external libgdal;
procedure VSIInstallHdfsHandler; cdecl; external libgdal;
procedure VSIInstallWebHdfsHandler; cdecl; external libgdal;
procedure VSIInstallStdoutHandler; cdecl; external libgdal;
procedure VSIInstallSparseFileHandler; cdecl; external libgdal;
procedure VSIInstallTarFileHandler; cdecl; external libgdal;
procedure VSIInstallCachedFileHandler; cdecl; external libgdal;
procedure VSIInstallCryptFileHandler; cdecl; external libgdal;
procedure VSISetCryptKey(pabyKey: PGByte; nKeySize: longint); cdecl; external libgdal;
procedure VSICleanupFileManager; cdecl; external libgdal;
function VSIDuplicateFileSystemHandler(pszSourceFSName: pchar; pszNewFSName: pchar): Boolean; cdecl; external libgdal;
function VSIFileFromMemBuffer(pszFilename: pchar; pabyData: PGByte; nDataLength: Tvsi_l_offset; bTakeOwnership: longint): PVSILFILE; cdecl; external libgdal;
function VSIGetMemFileBuffer(pszFilename: pchar; pnDataLength: Pvsi_l_offset; bUnlinkAndSeize: longint): PGByte; cdecl; external libgdal;

type
  TVSIWriteFunction = function(ptr: pointer; size: Tsize_t; nmemb: Tsize_t; stream: PFILE): Tsize_t; cdecl;

procedure VSIStdoutSetRedirection(pFct: TVSIWriteFunction; stream: PFILE); cdecl; external libgdal;

type
  TVSIFilesystemPluginStatCallback = function(pUserData: pointer; pszFilename: pchar; pStatBuf: PVSIStatBufL; nFlags: longint): longint; cdecl;
  TVSIFilesystemPluginUnlinkCallback = function(pUserData: pointer; pszFilename: pchar): longint; cdecl;
  TVSIFilesystemPluginRenameCallback = function(pUserData: pointer; oldpath: pchar; newpath: pchar): longint; cdecl;
  TVSIFilesystemPluginMkdirCallback = function(pUserData: pointer; pszDirname: pchar; nMode: longint): longint; cdecl;
  TVSIFilesystemPluginRmdirCallback = function(pUserData: pointer; pszDirname: pchar): longint; cdecl;
  TVSIFilesystemPluginReadDirCallback = function(pUserData: pointer; pszDirname: pchar; nMaxFiles: longint): PPchar; cdecl;
  TVSIFilesystemPluginSiblingFilesCallback = function(pUserData: pointer; pszDirname: pchar): PPchar; cdecl;
  TVSIFilesystemPluginOpenCallback = function(pUserData: pointer; pszFilename: pchar; pszAccess: pchar): pointer; cdecl;
  TVSIFilesystemPluginTellCallback = function(pFile: pointer): Tvsi_l_offset; cdecl;
  TVSIFilesystemPluginSeekCallback = function(pFile: pointer; nOffset: Tvsi_l_offset; nWhence: longint): longint; cdecl;
  TVSIFilesystemPluginReadCallback = function(pFile: pointer; pBuffer: pointer; nSize: Tsize_t; nCount: Tsize_t): Tsize_t; cdecl;
  TVSIFilesystemPluginReadMultiRangeCallback = function(pFile: pointer; nRanges: longint; ppData: Ppointer; panOffsets: Pvsi_l_offset; panSizes: Psize_t): longint; cdecl;
  TVSIFilesystemPluginGetRangeStatusCallback = function(pFile: pointer; nOffset: Tvsi_l_offset; nLength: Tvsi_l_offset): TVSIRangeStatus; cdecl;
  TVSIFilesystemPluginEofCallback = function(pFile: pointer): longint; cdecl;
  TVSIFilesystemPluginWriteCallback = function(pFile: pointer; pBuffer: pointer; nSize: Tsize_t; nCount: Tsize_t): Tsize_t; cdecl;
  TVSIFilesystemPluginFlushCallback = function(pFile: pointer): longint; cdecl;
  TVSIFilesystemPluginTruncateCallback = function(pFile: pointer; nNewSize: Tvsi_l_offset): longint; cdecl;
  TVSIFilesystemPluginCloseCallback = function(pFile: pointer): longint; cdecl;
  TVSIFilesystemPluginAdviseReadCallback = procedure(pFile: pointer; nRanges: longint; panOffsets: Pvsi_l_offset; panSizes: Psize_t); cdecl;

  PVSIFilesystemPluginCallbacksStruct = ^TVSIFilesystemPluginCallbacksStruct;
  TVSIFilesystemPluginCallbacksStruct = record
    pUserData: pointer;
    stat: TVSIFilesystemPluginStatCallback;
    unlink: TVSIFilesystemPluginUnlinkCallback;
    rename: TVSIFilesystemPluginRenameCallback;
    mkdir: TVSIFilesystemPluginMkdirCallback;
    rmdir: TVSIFilesystemPluginRmdirCallback;
    read_dir: TVSIFilesystemPluginReadDirCallback;
    open: TVSIFilesystemPluginOpenCallback;
    tell: TVSIFilesystemPluginTellCallback;
    seek: TVSIFilesystemPluginSeekCallback;
    read: TVSIFilesystemPluginReadCallback;
    read_multi_range: TVSIFilesystemPluginReadMultiRangeCallback;
    get_range_status: TVSIFilesystemPluginGetRangeStatusCallback;
    eof: TVSIFilesystemPluginEofCallback;
    write: TVSIFilesystemPluginWriteCallback;
    flush: TVSIFilesystemPluginFlushCallback;
    truncate: TVSIFilesystemPluginTruncateCallback;
    close: TVSIFilesystemPluginCloseCallback;
    nBufferSize: Tsize_t;
    nCacheSize: Tsize_t;
    sibling_files: TVSIFilesystemPluginSiblingFilesCallback;
    advise_read: TVSIFilesystemPluginAdviseReadCallback;
  end;

function VSIAllocFilesystemPluginCallbacksStruct: PVSIFilesystemPluginCallbacksStruct; cdecl; external libgdal;
procedure VSIFreeFilesystemPluginCallbacksStruct(poCb: PVSIFilesystemPluginCallbacksStruct); cdecl; external libgdal;
function VSIInstallPluginHandler(pszPrefix: pchar; poCb: PVSIFilesystemPluginCallbacksStruct): longint; cdecl; external libgdal;

function VSITime(para1: Pdword): dword; cdecl; external libgdal;
function VSICTime(para1: dword): pchar; cdecl; external libgdal;
function VSIGMTime(pnTime: Ptime_t; poBrokenTime: Ptm): Ptm; cdecl; external libgdal;
function VSILocalTime(pnTime: Ptime_t; poBrokenTime: Ptm): Ptm; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:32:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
