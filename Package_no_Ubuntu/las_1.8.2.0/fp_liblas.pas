unit fp_liblas;

interface

const
  {$ifdef linux}
  liblas_c = 'las_c';
  {$endif}

  {$ifdef windows}
  liblas_c = 'liblas_c.dll';
  {$endif}

type
  {$IFDEF unix}
  Tclong = int64;
  {$ENDIF}

  {$IFDEF mswindows}
  Tclong = int32;
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  LIBLAS_VERSION_MAJOR = 1;
  LIBLAS_VERSION_MINOR = 8;
  LIBLAS_VERSION_REV = 2;
  LIBLAS_VERSION_BUILD = 0;
  LIBLAS_VERSION_NUM = LIBLAS_VERSION_MAJOR * 1000 + LIBLAS_VERSION_MINOR * 100 + LIBLAS_VERSION_REV * 10 + LIBLAS_VERSION_BUILD;
  LIBLAS_RELEASE_DATE = 20200505;

const
  LIBLAS_RELEASE_NAME = '1.8.2';

  // =====


const
  LIBLAS_C_API = 1;

type
  TLASWriterH = type Pointer;
  TLASReaderH = type Pointer;
  TLASPointH = type Pointer;
  TLASHeaderH = type Pointer;
  TLASGuidH = type Pointer;
  TLASVLRH = type Pointer;
  TLASColorH = type Pointer;
  TLASSRSH = type Pointer;
  TLASSchemaH = type Pointer;

const
  LAS_MODE_READ = 0;
  LAS_MODE_WRITE = 1;
  LAS_MODE_APPEND = 2;

type
  PLASError = ^TLASError;
  TLASError = longint;

const
  LE_None = 0;
  LE_Debug = 1;
  LE_Warning = 2;
  LE_Failure = 3;
  LE_Fatal = 4;

function LAS_GetVersion: pchar; cdecl; external liblas_c;
function LAS_GetFullVersion: pchar; cdecl; external liblas_c;
function LAS_IsLibGeoTIFFEnabled: longint; cdecl; external liblas_c;
function LAS_IsGDALEnabled: longint; cdecl; external liblas_c;
function LAS_IsLibSpatialIndexEnabled: longint; cdecl; external liblas_c;

procedure LASError_Reset; cdecl; external liblas_c;
procedure LASError_Pop; cdecl; external liblas_c;
function LASError_GetLastErrorNum: TLASError; cdecl; external liblas_c;
function LASError_GetLastErrorMsg: pchar; cdecl; external liblas_c;
function LASError_GetLastErrorMethod: pchar; cdecl; external liblas_c;
function LASError_GetErrorCount: longint; cdecl; external liblas_c;
procedure LASError_Print(message: pchar); cdecl; external liblas_c;

function LASReader_Create(filename: pchar): TLASReaderH; cdecl; external liblas_c;
function LASReader_CreateWithHeader(filename: pchar; hHeader: TLASHeaderH): TLASReaderH; cdecl; external liblas_c;
function LASReader_GetNextPoint(hReader: TLASReaderH): TLASPointH; cdecl; external liblas_c;
function LASReader_GetPointAt(hReader: TLASReaderH; position: dword): TLASPointH; cdecl; external liblas_c;
procedure LASReader_Destroy(hReader: TLASReaderH); cdecl; external liblas_c;
function LASReader_GetHeader(hReader: TLASReaderH): TLASHeaderH; cdecl; external liblas_c;
procedure LASReader_SetHeader(hReader: TLASReaderH; hHeader: TLASHeaderH); cdecl; external liblas_c;
function LASReader_SetSRS(hReader: TLASReaderH; hSRS: TLASSRSH): TLASError; cdecl; external liblas_c;
function LASReader_SetInputSRS(hReader: TLASReaderH; hSRS: TLASSRSH): TLASError; cdecl; external liblas_c;
function LASReader_SetOutputSRS(hReader: TLASReaderH; hSRS: TLASSRSH): TLASError; cdecl; external liblas_c;
function LASReader_Seek(hReader: TLASReaderH; position: dword): TLASError; cdecl; external liblas_c;
function LASReader_GetSummaryXML(hReader: TLASReaderH): pchar; cdecl; external liblas_c;

function LASPoint_GetX(hPoint: TLASPointH): double; cdecl; external liblas_c;
function LASPoint_SetX(hPoint: TLASPointH; value: double): TLASError; cdecl; external liblas_c;
function LASPoint_GetRawX(hPoint: TLASPointH): Tclong; cdecl; external liblas_c;
function LASPoint_SetRawX(hPoint: TLASPointH; value: Tclong): TLASError; cdecl; external liblas_c;
function LASPoint_GetY(hPoint: TLASPointH): double; cdecl; external liblas_c;
function LASPoint_SetY(hPoint: TLASPointH; value: double): TLASError; cdecl; external liblas_c;
function LASPoint_GetRawY(hPoint: TLASPointH): Tclong; cdecl; external liblas_c;
function LASPoint_SetRawY(hPoint: TLASPointH; value: Tclong): TLASError; cdecl; external liblas_c;
function LASPoint_GetZ(hPoint: TLASPointH): double; cdecl; external liblas_c;
function LASPoint_SetZ(hPoint: TLASPointH; value: double): TLASError; cdecl; external liblas_c;
function LASPoint_GetRawZ(hPoint: TLASPointH): Tclong; cdecl; external liblas_c;
function LASPoint_SetRawZ(hPoint: TLASPointH; value: Tclong): TLASError; cdecl; external liblas_c;
function LASPoint_GetIntensity(hPoint: TLASPointH): word; cdecl; external liblas_c;
function LASPoint_SetIntensity(hPoint: TLASPointH; value: word): TLASError; cdecl; external liblas_c;
function LASPoint_GetReturnNumber(hPoint: TLASPointH): word; cdecl; external liblas_c;
function LASPoint_SetReturnNumber(hPoint: TLASPointH; value: word): TLASError; cdecl; external liblas_c;
function LASPoint_GetNumberOfReturns(hPoint: TLASPointH): word; cdecl; external liblas_c;
function LASPoint_SetNumberOfReturns(hPoint: TLASPointH; value: word): TLASError; cdecl; external liblas_c;
function LASPoint_GetScanDirection(hPoint: TLASPointH): word; cdecl; external liblas_c;
function LASPoint_SetScanDirection(hPoint: TLASPointH; value: word): TLASError; cdecl; external liblas_c;
function LASPoint_GetFlightLineEdge(hPoint: TLASPointH): word; cdecl; external liblas_c;
function LASPoint_SetFlightLineEdge(hPoint: TLASPointH; value: word): TLASError; cdecl; external liblas_c;
function LASPoint_GetScanFlags(hPoint: TLASPointH): byte; cdecl; external liblas_c;
function LASPoint_SetScanFlags(hPoint: TLASPointH; value: byte): TLASError; cdecl; external liblas_c;
function LASPoint_GetClassification(hPoint: TLASPointH): byte; cdecl; external liblas_c;
function LASPoint_SetClassification(hPoint: TLASPointH; value: byte): TLASError; cdecl; external liblas_c;
function LASPoint_GetTime(hPoint: TLASPointH): double; cdecl; external liblas_c;
function LASPoint_SetTime(hPoint: TLASPointH; value: double): TLASError; cdecl; external liblas_c;
function LASPoint_GetScanAngleRank(hPoint: TLASPointH): char; cdecl; external liblas_c;
function LASPoint_SetScanAngleRank(hPoint: TLASPointH; value: char): TLASError; cdecl; external liblas_c;
function LASPoint_SetPointSourceId(hPoint: TLASPointH; value: word): TLASError; cdecl; external liblas_c;
function LASPoint_GetPointSourceId(hPoint: TLASPointH): word; cdecl; external liblas_c;
function LASPoint_GetUserData(hPoint: TLASPointH): byte; cdecl; external liblas_c;
function LASPoint_SetUserData(hPoint: TLASPointH; value: byte): TLASError; cdecl; external liblas_c;
function LASPoint_Validate(hPoint: TLASPointH): longint; cdecl; external liblas_c;
function LASPoint_IsValid(hPoint: TLASPointH): longint; cdecl; external liblas_c;
function LASPoint_Create: TLASPointH; cdecl; external liblas_c;
function LASPoint_Copy(hPoint: TLASPointH): TLASPointH; cdecl; external liblas_c;
procedure LASPoint_Destroy(hPoint: TLASPointH); cdecl; external liblas_c;
function LASPoint_GetHeader(hPoint: TLASPointH): TLASHeaderH; cdecl; external liblas_c;
procedure LASPoint_SetHeader(hPoint: TLASPointH; hHeader: TLASHeaderH); cdecl; external liblas_c;
function LASPoint_GetData(hPoint: TLASPointH; data: pbyte): TLASError; cdecl; external liblas_c;
function LASPoint_SetData(hPoint: TLASPointH; data: pbyte): TLASError; cdecl; external liblas_c;
function LASPoint_GetXML(hPoint: TLASPointH): pchar; cdecl; external liblas_c;

function LASHeader_Copy(hHeader: TLASHeaderH): TLASHeaderH; cdecl; external liblas_c;
function LASHeader_Create: TLASHeaderH; cdecl; external liblas_c;
procedure LASHeader_Destroy(hHeader: TLASHeaderH); cdecl; external liblas_c;
function LASHeader_GetFileSignature(hHeader: TLASHeaderH): pchar; cdecl; external liblas_c;
function LASHeader_GetFileSourceId(hHeader: TLASHeaderH): word; cdecl; external liblas_c;
function LASHeader_SetFileSourceId(hHeader: TLASHeaderH; value: word): TLASError; cdecl; external liblas_c;
function LASHeader_GetProjectId(hHeader: TLASHeaderH): pchar; cdecl; external liblas_c;
function LASHeader_SetProjectId(hHeader: TLASHeaderH; value: pchar): TLASError; cdecl; external liblas_c;
function LASHeader_SetGUID(hHeader: TLASHeaderH; hId: TLASGuidH): TLASError; cdecl; external liblas_c;
function LASHeader_GetVersionMajor(hHeader: TLASHeaderH): byte; cdecl; external liblas_c;
function LASHeader_SetVersionMajor(hHeader: TLASHeaderH; value: byte): TLASError; cdecl; external liblas_c;
function LASHeader_GetVersionMinor(hHeader: TLASHeaderH): byte; cdecl; external liblas_c;
function LASHeader_SetVersionMinor(hHeader: TLASHeaderH; value: byte): TLASError; cdecl; external liblas_c;
function LASHeader_GetSystemId(hHeader: TLASHeaderH): pchar; cdecl; external liblas_c;
function LASHeader_SetSystemId(hHeader: TLASHeaderH; value: pchar): TLASError; cdecl; external liblas_c;
function LASHeader_GetSoftwareId(hHeader: TLASHeaderH): pchar; cdecl; external liblas_c;
function LASHeader_SetSoftwareId(hHeader: TLASHeaderH; value: pchar): TLASError; cdecl; external liblas_c;
function LASHeader_GetReserved(hHeader: TLASHeaderH): word; cdecl; external liblas_c;
function LASHeader_SetReserved(hHeader: TLASHeaderH; value: word): TLASError; cdecl; external liblas_c;
function LASHeader_GetCreationDOY(hHeader: TLASHeaderH): word; cdecl; external liblas_c;
function LASHeader_SetCreationDOY(hHeader: TLASHeaderH; value: word): TLASError; cdecl; external liblas_c;
function LASHeader_GetCreationYear(hHeader: TLASHeaderH): word; cdecl; external liblas_c;
function LASHeader_SetCreationYear(hHeader: TLASHeaderH; value: word): TLASError; cdecl; external liblas_c;
function LASHeader_GetHeaderSize(hHeader: TLASHeaderH): word; cdecl; external liblas_c;
function LASHeader_GetDataOffset(hHeader: TLASHeaderH): dword; cdecl; external liblas_c;
function LASHeader_SetDataOffset(hHeader: TLASHeaderH; value: dword): TLASError; cdecl; external liblas_c;
function LASHeader_GetHeaderPadding(hHeader: TLASHeaderH): dword; cdecl; external liblas_c;
function LASHeader_SetHeaderPadding(hHeader: TLASHeaderH; value: dword): TLASError; cdecl; external liblas_c;
function LASHeader_GetRecordsCount(hHeader: TLASHeaderH): dword; cdecl; external liblas_c;
function LASHeader_GetDataRecordLength(hHeader: TLASHeaderH): word; cdecl; external liblas_c;
function LASHeader_SetDataRecordLength(hHeader: TLASHeaderH; value: word): TLASError; cdecl; external liblas_c;
function LASHeader_GetDataFormatId(hHeader: TLASHeaderH): byte; cdecl; external liblas_c;
function LASHeader_SetDataFormatId(hHeader: TLASHeaderH; value: byte): TLASError; cdecl; external liblas_c;
function LASHeader_GetPointRecordsCount(hHeader: TLASHeaderH): dword; cdecl; external liblas_c;
function LASHeader_SetPointRecordsCount(hHeader: TLASHeaderH; value: dword): TLASError; cdecl; external liblas_c;
function LASHeader_GetPointRecordsByReturnCount(hHeader: TLASHeaderH; index: longint): dword; cdecl; external liblas_c;
function LASHeader_SetPointRecordsByReturnCount(hHeader: TLASHeaderH; index: longint; value: dword): TLASError; cdecl; external liblas_c;
function LASHeader_GetScaleX(hHeader: TLASHeaderH): double; cdecl; external liblas_c;
function LASHeader_GetScaleY(hHeader: TLASHeaderH): double; cdecl; external liblas_c;
function LASHeader_GetScaleZ(hHeader: TLASHeaderH): double; cdecl; external liblas_c;
function LASHeader_SetScale(hHeader: TLASHeaderH; x: double; y: double; z: double): TLASError; cdecl; external liblas_c;
function LASHeader_GetOffsetX(hHeader: TLASHeaderH): double; cdecl; external liblas_c;
function LASHeader_GetOffsetY(hHeader: TLASHeaderH): double; cdecl; external liblas_c;
function LASHeader_GetOffsetZ(hHeader: TLASHeaderH): double; cdecl; external liblas_c;
function LASHeader_SetOffset(hHeader: TLASHeaderH; x: double; y: double; z: double): TLASError; cdecl; external liblas_c;
function LASHeader_GetMinX(hHeader: TLASHeaderH): double; cdecl; external liblas_c;
function LASHeader_GetMinY(hHeader: TLASHeaderH): double; cdecl; external liblas_c;
function LASHeader_GetMinZ(hHeader: TLASHeaderH): double; cdecl; external liblas_c;
function LASHeader_SetMin(hHeader: TLASHeaderH; x: double; y: double; z: double): TLASError; cdecl; external liblas_c;
function LASHeader_GetMaxX(hHeader: TLASHeaderH): double; cdecl; external liblas_c;
function LASHeader_GetMaxY(hHeader: TLASHeaderH): double; cdecl; external liblas_c;
function LASHeader_GetMaxZ(hHeader: TLASHeaderH): double; cdecl; external liblas_c;
function LASHeader_SetMax(hHeader: TLASHeaderH; x: double; y: double; z: double): TLASError; cdecl; external liblas_c;
function LASHeader_GetVLR(hHeader: TLASHeaderH; i: dword): TLASVLRH; cdecl; external liblas_c;
function LASHeader_DeleteVLR(hHeader: TLASHeaderH; index: dword): TLASError; cdecl; external liblas_c;
function LASHeader_AddVLR(hHeader: TLASHeaderH; hVLR: TLASVLRH): TLASError; cdecl; external liblas_c;
function LASHeader_GetXML(hHeader: TLASHeaderH): pchar; cdecl; external liblas_c;

function LASWriter_Create(filename: pchar; hHeader: TLASHeaderH; mode: longint): TLASWriterH; cdecl; external liblas_c;
function LASWriter_WritePoint(hWriter: TLASWriterH; hPoint: TLASPointH): TLASError; cdecl; external liblas_c;
function LASWriter_WriteHeader(hWriter: TLASWriterH; hHeader: TLASHeaderH): TLASError; cdecl; external liblas_c;
function LASWriter_WriteOwnedHeader(hWriter: TLASWriterH): TLASError; cdecl; external liblas_c;
procedure LASWriter_Destroy(hWriter: TLASWriterH); cdecl; external liblas_c;
function LASWriter_GetHeader(hWriter: TLASWriterH): TLASHeaderH; cdecl; external liblas_c;
procedure LASWriter_SetHeader(hWriter: TLASWriterH; hHeader: TLASHeaderH); cdecl; external liblas_c;
function LASWriter_SetSRS(hWriter: TLASWriterH; hSRS: TLASSRSH): TLASError; cdecl; external liblas_c;
function LASWriter_SetInputSRS(hWriter: TLASWriterH; hSRS: TLASSRSH): TLASError; cdecl; external liblas_c;
function LASWriter_SetOutputSRS(hWriter: TLASWriterH; hSRS: TLASSRSH): TLASError; cdecl; external liblas_c;

function LASHeader_GetGUID(hHeader: TLASHeaderH): TLASGuidH; cdecl; external liblas_c;
function LASGuid_Create: TLASGuidH; cdecl; external liblas_c;
function LASGuid_CreateFromString(_string: pchar): TLASGuidH; cdecl; external liblas_c;
procedure LASGuid_Destroy(hId: TLASGuidH); cdecl; external liblas_c;
function LASGuid_Equals(hId1: TLASGuidH; hId2: TLASGuidH): longint; cdecl; external liblas_c;
function LASGuid_AsString(hId: TLASGuidH): pchar; cdecl; external liblas_c;

function LASVLR_Create: TLASVLRH; cdecl; external liblas_c;
procedure LASVLR_Destroy(hVLR: TLASVLRH); cdecl; external liblas_c;
function LASVLR_GetUserId(hVLR: TLASVLRH): pchar; cdecl; external liblas_c;
function LASVLR_SetUserId(hVLR: TLASVLRH; value: pchar): TLASError; cdecl; external liblas_c;
function LASVLR_GetDescription(hVLR: TLASVLRH): pchar; cdecl; external liblas_c;
function LASVLR_SetDescription(hVLR: TLASVLRH; value: pchar): TLASError; cdecl; external liblas_c;
function LASVLR_GetRecordLength(hVLR: TLASVLRH): word; cdecl; external liblas_c;
function LASVLR_SetRecordLength(hVLR: TLASVLRH; value: word): TLASError; cdecl; external liblas_c;
function LASVLR_GetRecordId(hVLR: TLASVLRH): word; cdecl; external liblas_c;
function LASVLR_SetRecordId(hVLR: TLASVLRH; value: word): TLASError; cdecl; external liblas_c;
function LASVLR_GetReserved(hVLR: TLASVLRH): word; cdecl; external liblas_c;
function LASVLR_SetReserved(hVLR: TLASVLRH; value: word): TLASError; cdecl; external liblas_c;
function LASVLR_GetData(hVLR: TLASVLRH; data: pbyte): TLASError; cdecl; external liblas_c;
function LASVLR_SetData(hVLR: TLASVLRH; data: pbyte; length: word): TLASError; cdecl; external liblas_c;

function LASColor_Create: TLASColorH; cdecl; external liblas_c;
procedure LASColor_Destroy(hColor: TLASColorH); cdecl; external liblas_c;
function LASColor_GetRed(hColor: TLASColorH): word; cdecl; external liblas_c;
function LASColor_SetRed(hColor: TLASColorH; value: word): TLASError; cdecl; external liblas_c;
function LASColor_GetGreen(hColor: TLASColorH): word; cdecl; external liblas_c;
function LASColor_SetGreen(hColor: TLASColorH; value: word): TLASError; cdecl; external liblas_c;
function LASColor_GetBlue(hColor: TLASColorH): word; cdecl; external liblas_c;
function LASColor_SetBlue(hColor: TLASColorH; value: word): TLASError; cdecl; external liblas_c;
function LASPoint_GetColor(hPoint: TLASPointH): TLASColorH; cdecl; external liblas_c;
function LASPoint_SetColor(hPoint: TLASPointH; hColor: TLASColorH): TLASError; cdecl; external liblas_c;

function LASSRS_Create: TLASSRSH; cdecl; external liblas_c;
function LASSRS_GetGTIF(hSRS: TLASSRSH): pointer; cdecl; external liblas_c;
function LASSRS_SetGTIF(hSRS: TLASSRSH; pgtiff: pointer; ptiff: pointer): TLASError; cdecl; external liblas_c;
function LASSRS_GetWKT(hSRS: TLASSRSH): pchar; cdecl; external liblas_c;
function LASSRS_GetWKT_CompoundOK(hSRS: TLASSRSH): pchar; cdecl; external liblas_c;
function LASSRS_SetWKT(hSRS: TLASSRSH; value: pchar): TLASError; cdecl; external liblas_c;
function LASSRS_SetFromUserInput(hSRS: TLASSRSH; value: pchar): TLASError; cdecl; external liblas_c;
function LASSRS_GetProj4(hSRS: TLASSRSH): pchar; cdecl; external liblas_c;
function LASSRS_SetProj4(hSRS: TLASSRSH; value: pchar): TLASError; cdecl; external liblas_c;
function LASSRS_SetVerticalCS(hSRS: TLASSRSH; verticalCSType: longint; citation: pchar; verticalDatum: longint; verticalUnits: longint): TLASError; cdecl; external liblas_c;
function LASHeader_GetSRS(hHeader: TLASHeaderH): TLASSRSH; cdecl; external liblas_c;
function LASHeader_SetSRS(hHeader: TLASHeaderH; hSRS: TLASSRSH): TLASError; cdecl; external liblas_c;
procedure LASSRS_Destroy(hSRS: TLASSRSH); cdecl; external liblas_c;
function LASSRS_GetVLR(hSRS: TLASSRSH; i: dword): TLASVLRH; cdecl; external liblas_c;
function LASSRS_GetVLRCount(hSRS: TLASSRSH): dword; cdecl; external liblas_c;
procedure LASString_Free(_string: pchar); cdecl; external liblas_c;
function LASSchema_GetByteSize(hFormat: TLASSchemaH): dword; cdecl; external liblas_c;
function LASSchema_GetBaseByteSize(hFormat: TLASSchemaH): dword; cdecl; external liblas_c;
function LASHeader_GetSchema(hHeader: TLASHeaderH): TLASSchemaH; cdecl; external liblas_c;
function LASHeader_SetSchema(hHeader: TLASHeaderH; hFormat: TLASSchemaH): TLASError; cdecl; external liblas_c;
procedure LASSchema_Destroy(hFormat: TLASSchemaH); cdecl; external liblas_c;
function LASHeader_Compressed(hHeader: TLASHeaderH): longint; cdecl; external liblas_c;
function LASHeader_SetCompressed(hHeader: TLASHeaderH; b: longint): TLASError; cdecl; external liblas_c;

// === Konventiert am: 28-2-26 15:21:24 ===


implementation



end.
