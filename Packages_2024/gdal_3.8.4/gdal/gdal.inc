{$IFDEF read_interface}


type
  PGDALDataType = ^TGDALDataType;
  TGDALDataType = longint;
const
  GDT_Unknown = 0;
  GDT_Byte = 1;
  GDT_Int8 = 14;
  GDT_UInt16 = 2;
  GDT_Int16 = 3;
  GDT_UInt32 = 4;
  GDT_Int32 = 5;
  GDT_UInt64 = 12;
  GDT_Int64 = 13;
  GDT_Float32 = 6;
  GDT_Float64 = 7;
  GDT_CInt16 = 8;
  GDT_CInt32 = 9;
  GDT_CFloat32 = 10;
  GDT_CFloat64 = 11;
  GDT_TypeCount = 15;

function GDALGetDataTypeSize(para1: TGDALDataType): longint; cdecl; external libgdal;
function GDALGetDataTypeSizeBits(eDataType: TGDALDataType): longint; cdecl; external libgdal;
function GDALGetDataTypeSizeBytes(para1: TGDALDataType): longint; cdecl; external libgdal;
function GDALDataTypeIsComplex(para1: TGDALDataType): longint; cdecl; external libgdal;
function GDALDataTypeIsInteger(para1: TGDALDataType): longint; cdecl; external libgdal;
function GDALDataTypeIsFloating(para1: TGDALDataType): longint; cdecl; external libgdal;
function GDALDataTypeIsSigned(para1: TGDALDataType): longint; cdecl; external libgdal;
function GDALGetDataTypeName(para1: TGDALDataType): pchar; cdecl; external libgdal;
function GDALGetDataTypeByName(para1: pchar): TGDALDataType; cdecl; external libgdal;
function GDALDataTypeUnion(para1: TGDALDataType; para2: TGDALDataType): TGDALDataType; cdecl; external libgdal;
function GDALDataTypeUnionWithValue(eDT: TGDALDataType; dValue: double; bComplex: longint): TGDALDataType; cdecl; external libgdal;
function GDALFindDataType(nBits: longint; bSigned: longint; bFloating: longint; bComplex: longint): TGDALDataType; cdecl; external libgdal;
function GDALFindDataTypeForValue(dValue: double; bComplex: longint): TGDALDataType; cdecl; external libgdal;
function GDALAdjustValueToDataType(eDT: TGDALDataType; dfValue: double; pbClamped: Plongint; pbRounded: Plongint): double; cdecl; external libgdal;
function GDALGetNonComplexDataType(para1: TGDALDataType): TGDALDataType; cdecl; external libgdal;
function GDALDataTypeIsConversionLossy(eTypeFrom: TGDALDataType; eTypeTo: TGDALDataType): longint; cdecl; external libgdal;

type
  PGDALAsyncStatusType = ^TGDALAsyncStatusType;
  TGDALAsyncStatusType = longint;
const
  GARIO_PENDING = 0;
  GARIO_UPDATE = 1;
  GARIO_ERROR = 2;
  GARIO_COMPLETE = 3;
  GARIO_TypeCount = 4;

function GDALGetAsyncStatusTypeName(para1: TGDALAsyncStatusType): pchar; cdecl; external libgdal;
function GDALGetAsyncStatusTypeByName(para1: pchar): TGDALAsyncStatusType; cdecl; external libgdal;

type
  PGDALAccess = ^TGDALAccess;
  TGDALAccess = longint;
const
  GA_ReadOnly = 0;
  GA_Update = 1;

type
  PGDALRWFlag = ^TGDALRWFlag;
  TGDALRWFlag = longint;
const
  GF_Read = 0;
  GF_Write = 1;

type
  PGDALRIOResampleAlg = ^TGDALRIOResampleAlg;
  TGDALRIOResampleAlg = longint;
const
  GRIORA_NearestNeighbour = 0;
  GRIORA_Bilinear = 1;
  GRIORA_Cubic = 2;
  GRIORA_CubicSpline = 3;
  GRIORA_Lanczos = 4;
  GRIORA_Average = 5;
  GRIORA_Mode = 6;
  GRIORA_Gauss = 7;
  GRIORA_RESERVED_START = 8;
  GRIORA_RESERVED_END = 13;
  GRIORA_RMS = 14;
  GRIORA_LAST = GRIORA_RMS;

type
  PGDALRasterIOExtraArg = ^TGDALRasterIOExtraArg;
  TGDALRasterIOExtraArg = record
    nVersion: longint;
    eResampleAlg: TGDALRIOResampleAlg;
    pfnProgress: TGDALProgressFunc;
    pProgressData: pointer;
    bFloatingPointWindowValidity: longint;
    dfXOff: double;
    dfYOff: double;
    dfXSize: double;
    dfYSize: double;
  end;

type
  PGDALColorInterp = ^TGDALColorInterp;
  TGDALColorInterp = longint;
const
  GCI_Undefined = 0;
  GCI_GrayIndex = 1;
  GCI_PaletteIndex = 2;
  GCI_RedBand = 3;
  GCI_GreenBand = 4;
  GCI_BlueBand = 5;
  GCI_AlphaBand = 6;
  GCI_HueBand = 7;
  GCI_SaturationBand = 8;
  GCI_LightnessBand = 9;
  GCI_CyanBand = 10;
  GCI_MagentaBand = 11;
  GCI_YellowBand = 12;
  GCI_BlackBand = 13;
  GCI_YCbCr_YBand = 14;
  GCI_YCbCr_CbBand = 15;
  GCI_YCbCr_CrBand = 16;
  GCI_Max = 16;

function GDALGetColorInterpretationName(para1: TGDALColorInterp): pchar; cdecl; external libgdal;
function GDALGetColorInterpretationByName(pszName: pchar): TGDALColorInterp; cdecl; external libgdal;

type
  PGDALPaletteInterp = ^TGDALPaletteInterp;
  TGDALPaletteInterp = longint;
const
  GPI_Gray = 0;
  GPI_RGB = 1;
  GPI_CMYK = 2;
  GPI_HLS = 3;

function GDALGetPaletteInterpretationName(para1: TGDALPaletteInterp): pchar; cdecl; external libgdal;

const
  GDALMD_AREA_OR_POINT = 'AREA_OR_POINT';
  GDALMD_AOP_AREA = 'Area';
  GDALMD_AOP_POINT = 'Point';

type
  PGDALMajorObjectH = ^TGDALMajorObjectH;
  TGDALMajorObjectH = pointer;

  PPGDALDatasetH = ^PGDALDatasetH;
  PGDALDatasetH = ^TGDALDatasetH;
  TGDALDatasetH = pointer;

  PGDALRasterBandH = ^TGDALRasterBandH;
  TGDALRasterBandH = pointer;

  PGDALDriverH = ^TGDALDriverH;
  TGDALDriverH = pointer;

  PGDALColorTableH = ^TGDALColorTableH;
  TGDALColorTableH = pointer;

  PGDALRasterAttributeTableH = ^TGDALRasterAttributeTableH;
  TGDALRasterAttributeTableH = pointer;

  PGDALAsyncReaderH = ^TGDALAsyncReaderH;
  TGDALAsyncReaderH = pointer;

  PGDALRelationshipH = ^TGDALRelationshipH;
  TGDALRelationshipH = pointer;

  PGSpacing = ^TGSpacing;
  TGSpacing = TGIntBig;

type
  PGDALExtendedDataTypeClass = ^TGDALExtendedDataTypeClass;
  TGDALExtendedDataTypeClass = longint;
const
  GEDTC_NUMERIC = 0;
  GEDTC_STRING = 1;
  GEDTC_COMPOUND = 2;

type
  PGDALExtendedDataTypeSubType = ^TGDALExtendedDataTypeSubType;
  TGDALExtendedDataTypeSubType = longint;
const
  GEDTST_NONE = 0;
  GEDTST_JSON = 1;

type
  PGDALExtendedDataTypeH = ^TGDALExtendedDataTypeH;
  TGDALExtendedDataTypeH = Pointer;

  PGDALEDTComponentH = ^TGDALEDTComponentH;
  TGDALEDTComponentH = Pointer;

  PGDALGroupH = ^TGDALGroupH;
  TGDALGroupH = Pointer;

  PGDALMDArrayH = ^TGDALMDArrayH;
  TGDALMDArrayH = Pointer;

  PGDALAttributeH = ^TGDALAttributeH;
  TGDALAttributeH = Pointer;

  PGDALDimensionH = ^TGDALDimensionH;
  TGDALDimensionH = Pointer;

const
  GDAL_DMD_LONGNAME = 'DMD_LONGNAME';
  GDAL_DMD_HELPTOPIC = 'DMD_HELPTOPIC';
  GDAL_DMD_MIMETYPE = 'DMD_MIMETYPE';
  GDAL_DMD_EXTENSION = 'DMD_EXTENSION';
  GDAL_DMD_CONNECTION_PREFIX = 'DMD_CONNECTION_PREFIX';
  GDAL_DMD_EXTENSIONS = 'DMD_EXTENSIONS';
  GDAL_DMD_CREATIONOPTIONLIST = 'DMD_CREATIONOPTIONLIST';
  GDAL_DMD_MULTIDIM_DATASET_CREATIONOPTIONLIST = 'DMD_MULTIDIM_DATASET_CREATIONOPTIONLIST';
  GDAL_DMD_MULTIDIM_GROUP_CREATIONOPTIONLIST = 'DMD_MULTIDIM_GROUP_CREATIONOPTIONLIST';
  GDAL_DMD_MULTIDIM_DIMENSION_CREATIONOPTIONLIST = 'DMD_MULTIDIM_DIMENSION_CREATIONOPTIONLIST';
  GDAL_DMD_MULTIDIM_ARRAY_CREATIONOPTIONLIST = 'DMD_MULTIDIM_ARRAY_CREATIONOPTIONLIST';
  GDAL_DMD_MULTIDIM_ARRAY_OPENOPTIONLIST = 'DMD_MULTIDIM_ARRAY_OPENOPTIONLIST';
  GDAL_DMD_MULTIDIM_ATTRIBUTE_CREATIONOPTIONLIST = 'DMD_MULTIDIM_ATTRIBUTE_CREATIONOPTIONLIST';
  GDAL_DMD_OPENOPTIONLIST = 'DMD_OPENOPTIONLIST';
  GDAL_DMD_CREATIONDATATYPES = 'DMD_CREATIONDATATYPES';
  GDAL_DMD_CREATIONFIELDDATATYPES = 'DMD_CREATIONFIELDDATATYPES';
  GDAL_DMD_CREATIONFIELDDATASUBTYPES = 'DMD_CREATIONFIELDDATASUBTYPES';
  GDAL_DMD_CREATION_FIELD_DEFN_FLAGS = 'DMD_CREATION_FIELD_DEFN_FLAGS';
  GDAL_DMD_SUBDATASETS = 'DMD_SUBDATASETS';
  GDAL_DMD_NUMERIC_FIELD_WIDTH_INCLUDES_DECIMAL_SEPARATOR = 'DMD_NUMERIC_FIELD_WIDTH_INCLUDES_DECIMAL_SEPARATOR';
  GDAL_DMD_NUMERIC_FIELD_WIDTH_INCLUDES_SIGN = 'DMD_NUMERIC_FIELD_WIDTH_INCLUDES_SIGN';
  GDAL_DCAP_OPEN = 'DCAP_OPEN';
  GDAL_DCAP_CREATE = 'DCAP_CREATE';
  GDAL_DCAP_CREATE_MULTIDIMENSIONAL = 'DCAP_CREATE_MULTIDIMENSIONAL';
  GDAL_DCAP_CREATECOPY = 'DCAP_CREATECOPY';
  GDAL_DCAP_VECTOR_TRANSLATE_FROM = 'DCAP_VECTOR_TRANSLATE_FROM';
  GDAL_DCAP_CREATECOPY_MULTIDIMENSIONAL = 'DCAP_CREATECOPY_MULTIDIMENSIONAL';
  GDAL_DCAP_MULTIDIM_RASTER = 'DCAP_MULTIDIM_RASTER';
  GDAL_DCAP_SUBCREATECOPY = 'DCAP_SUBCREATECOPY';
  GDAL_DCAP_VIRTUALIO = 'DCAP_VIRTUALIO';
  GDAL_DCAP_RASTER = 'DCAP_RASTER';
  GDAL_DCAP_VECTOR = 'DCAP_VECTOR';
  GDAL_DCAP_GNM = 'DCAP_GNM';
  GDAL_DCAP_CREATE_LAYER = 'DCAP_CREATE_LAYER';
  GDAL_DCAP_DELETE_LAYER = 'DCAP_DELETE_LAYER';
  GDAL_DCAP_CREATE_FIELD = 'DCAP_CREATE_FIELD';
  GDAL_DCAP_DELETE_FIELD = 'DCAP_DELETE_FIELD';
  GDAL_DCAP_REORDER_FIELDS = 'DCAP_REORDER_FIELDS';
  GDAL_DMD_ALTER_FIELD_DEFN_FLAGS = 'GDAL_DMD_ALTER_FIELD_DEFN_FLAGS';
  GDAL_DMD_ILLEGAL_FIELD_NAMES = 'GDAL_DMD_ILLEGAL_FIELD_NAMES';
  GDAL_DCAP_NOTNULL_FIELDS = 'DCAP_NOTNULL_FIELDS';
  GDAL_DCAP_UNIQUE_FIELDS = 'DCAP_UNIQUE_FIELDS';
  GDAL_DCAP_DEFAULT_FIELDS = 'DCAP_DEFAULT_FIELDS';
  GDAL_DCAP_NOTNULL_GEOMFIELDS = 'DCAP_NOTNULL_GEOMFIELDS';
  GDAL_DCAP_NONSPATIAL = 'DCAP_NONSPATIAL';
  GDAL_DCAP_CURVE_GEOMETRIES = 'DCAP_CURVE_GEOMETRIES';
  GDAL_DCAP_MEASURED_GEOMETRIES = 'DCAP_MEASURED_GEOMETRIES';
  GDAL_DCAP_Z_GEOMETRIES = 'DCAP_Z_GEOMETRIES';
  GDAL_DMD_GEOMETRY_FLAGS = 'GDAL_DMD_GEOMETRY_FLAGS';
  GDAL_DCAP_FEATURE_STYLES = 'DCAP_FEATURE_STYLES';
  GDAL_DCAP_FEATURE_STYLES_READ = 'DCAP_FEATURE_STYLES_READ';
  GDAL_DCAP_FEATURE_STYLES_WRITE = 'DCAP_FEATURE_STYLES_WRITE';
  GDAL_DCAP_COORDINATE_EPOCH = 'DCAP_COORDINATE_EPOCH';
  GDAL_DCAP_MULTIPLE_VECTOR_LAYERS = 'DCAP_MULTIPLE_VECTOR_LAYERS';
  GDAL_DCAP_FIELD_DOMAINS = 'DCAP_FIELD_DOMAINS';
  GDAL_DCAP_RELATIONSHIPS = 'DCAP_RELATIONSHIPS';
  GDAL_DCAP_CREATE_RELATIONSHIP = 'DCAP_CREATE_RELATIONSHIP';
  GDAL_DCAP_DELETE_RELATIONSHIP = 'DCAP_DELETE_RELATIONSHIP';
  GDAL_DCAP_UPDATE_RELATIONSHIP = 'DCAP_UPDATE_RELATIONSHIP';
  GDAL_DCAP_FLUSHCACHE_CONSISTENT_STATE = 'DCAP_FLUSHCACHE_CONSISTENT_STATE';
  GDAL_DMD_RELATIONSHIP_FLAGS = 'GDAL_DMD_RELATIONSHIP_FLAGS';
  GDAL_DMD_RELATIONSHIP_RELATED_TABLE_TYPES = 'GDAL_DMD_RELATIONSHIP_RELATED_TABLE_TYPES';
  GDAL_DCAP_RENAME_LAYERS = 'DCAP_RENAME_LAYERS';
  GDAL_DMD_CREATION_FIELD_DOMAIN_TYPES = 'DMD_CREATION_FIELD_DOMAIN_TYPES';
  GDAL_DMD_ALTER_GEOM_FIELD_DEFN_FLAGS = 'DMD_ALTER_GEOM_FIELD_DEFN_FLAGS';
  GDAL_DMD_SUPPORTED_SQL_DIALECTS = 'DMD_SUPPORTED_SQL_DIALECTS';
  GDAL_DIM_TYPE_HORIZONTAL_X = 'HORIZONTAL_X';
  GDAL_DIM_TYPE_HORIZONTAL_Y = 'HORIZONTAL_Y';
  GDAL_DIM_TYPE_VERTICAL = 'VERTICAL';
  GDAL_DIM_TYPE_TEMPORAL = 'TEMPORAL';
  GDAL_DIM_TYPE_PARAMETRIC = 'PARAMETRIC';
  GDsCAddRelationship = 'AddRelationship';
  GDsCDeleteRelationship = 'DeleteRelationship';
  GDsCUpdateRelationship = 'UpdateRelationship';

procedure GDALAllRegister; cdecl; external libgdal;
procedure GDALRegisterPlugins; cdecl; external libgdal;
function GDALRegisterPlugin(name: pchar): TCPLErr; cdecl; external libgdal;
function GDALCreate(hDriver: TGDALDriverH; para2: pchar; para3: longint; para4: longint; para5: longint;
  para6: TGDALDataType; para7: TCSLConstList): TGDALDatasetH; cdecl; external libgdal;
function GDALCreateCopy(para1: TGDALDriverH; para2: pchar; para3: TGDALDatasetH; para4: longint; para5: TCSLConstList;
  para6: TGDALProgressFunc; para7: pointer): TGDALDatasetH; cdecl; external libgdal;
function GDALIdentifyDriver(pszFilename: pchar; papszFileList: TCSLConstList): TGDALDriverH; cdecl; external libgdal;
function GDALIdentifyDriverEx(pszFilename: pchar; nIdentifyFlags: dword; papszAllowedDrivers: PPchar; papszFileList: PPchar): TGDALDriverH; cdecl; external libgdal;
function GDALOpen(pszFilename: pchar; eAccess: TGDALAccess): TGDALDatasetH; cdecl; external libgdal;
function GDALOpenShared(para1: pchar; para2: TGDALAccess): TGDALDatasetH; cdecl; external libgdal;

const
  GDAL_OF_READONLY = $00;
  GDAL_OF_UPDATE = $01;
  GDAL_OF_ALL = $00;
  GDAL_OF_RASTER = $02;
  GDAL_OF_VECTOR = $04;
  GDAL_OF_GNM = $08;
  GDAL_OF_MULTIDIM_RASTER = $10;
  GDAL_OF_KIND_MASK = $1E;
  GDAL_OF_SHARED = $20;
  GDAL_OF_VERBOSE_ERROR = $40;
  GDAL_OF_INTERNAL = $80;
  GDAL_OF_DEFAULT_BLOCK_ACCESS = 0;
  GDAL_OF_ARRAY_BLOCK_ACCESS = $100;
  GDAL_OF_HASHSET_BLOCK_ACCESS = $200;
  GDAL_OF_RESERVED_1 = $300;
  GDAL_OF_BLOCK_ACCESS_MASK = $300;

function GDALOpenEx(pszFilename: pchar; nOpenFlags: dword; papszAllowedDrivers: PPchar; papszOpenOptions: PPchar; papszSiblingFiles: PPchar): TGDALDatasetH; cdecl; external libgdal;
function GDALDumpOpenDatasets(para1: PFILE): longint; cdecl; external libgdal;
function GDALGetDriverByName(para1: pchar): TGDALDriverH; cdecl; external libgdal;
function GDALGetDriverCount: longint; cdecl; external libgdal;
function GDALGetDriver(para1: longint): TGDALDriverH; cdecl; external libgdal;
function GDALCreateDriver: TGDALDriverH; cdecl; external libgdal;
procedure GDALDestroyDriver(para1: TGDALDriverH); cdecl; external libgdal;
function GDALRegisterDriver(para1: TGDALDriverH): longint; cdecl; external libgdal;
procedure GDALDeregisterDriver(para1: TGDALDriverH); cdecl; external libgdal;
procedure GDALDestroyDriverManager; cdecl; external libgdal;

procedure GDALDestroy; cdecl; external libgdal;

function GDALDeleteDataset(para1: TGDALDriverH; para2: pchar): TCPLErr; cdecl; external libgdal;
function GDALRenameDataset(para1: TGDALDriverH; pszNewName: pchar; pszOldName: pchar): TCPLErr; cdecl; external libgdal;
function GDALCopyDatasetFiles(para1: TGDALDriverH; pszNewName: pchar; pszOldName: pchar): TCPLErr; cdecl; external libgdal;
function GDALValidateCreationOptions(para1: TGDALDriverH; papszCreationOptions: TCSLConstList): longint; cdecl; external libgdal;
function GDALGetDriverShortName(para1: TGDALDriverH): pchar; cdecl; external libgdal;
function GDALGetDriverLongName(para1: TGDALDriverH): pchar; cdecl; external libgdal;
function GDALGetDriverHelpTopic(para1: TGDALDriverH): pchar; cdecl; external libgdal;
function GDALGetDriverCreationOptionList(para1: TGDALDriverH): pchar; cdecl; external libgdal;

type
  PPGDAL_GCP = ^PGDAL_GCP;
  PGDAL_GCP = ^TGDAL_GCP;
  TGDAL_GCP = record
    pszId: pchar;
    pszInfo: pchar;
    dfGCPPixel: double;
    dfGCPLine: double;
    dfGCPX: double;
    dfGCPY: double;
    dfGCPZ: double;
  end;

procedure GDALInitGCPs(para1: longint; para2: PGDAL_GCP); cdecl; external libgdal;
procedure GDALDeinitGCPs(para1: longint; para2: PGDAL_GCP); cdecl; external libgdal;
function GDALDuplicateGCPs(para1: longint; para2: PGDAL_GCP): PGDAL_GCP; cdecl; external libgdal;
function GDALGCPsToGeoTransform(nGCPCount: longint; pasGCPs: PGDAL_GCP; padfGeoTransform: Pdouble; bApproxOK: longint): longint; cdecl; external libgdal;
function GDALInvGeoTransform(padfGeoTransformIn: Pdouble; padfInvGeoTransformOut: Pdouble): longint; cdecl; external libgdal;
procedure GDALApplyGeoTransform(para1: Pdouble; para2: double; para3: double; para4: Pdouble; para5: Pdouble); cdecl; external libgdal;
procedure GDALComposeGeoTransforms(padfGeoTransform1: Pdouble; padfGeoTransform2: Pdouble; padfGeoTransformOut: Pdouble); cdecl; external libgdal;

function GDALGetMetadataDomainList(hObject: TGDALMajorObjectH): PPchar; cdecl; external libgdal;
function GDALGetMetadata(para1: TGDALMajorObjectH; para2: pchar): PPchar; cdecl; external libgdal;
function GDALSetMetadata(para1: TGDALMajorObjectH; para2: TCSLConstList; para3: pchar): TCPLErr; cdecl; external libgdal;
function GDALGetMetadataItem(para1: TGDALMajorObjectH; para2: pchar; para3: pchar): pchar; cdecl; external libgdal;
function GDALSetMetadataItem(para1: TGDALMajorObjectH; para2: pchar; para3: pchar; para4: pchar): TCPLErr; cdecl; external libgdal;
function GDALGetDescription(para1: TGDALMajorObjectH): pchar; cdecl; external libgdal;
procedure GDALSetDescription(para1: TGDALMajorObjectH; para2: pchar); cdecl; external libgdal;

const
  GDAL_DS_LAYER_CREATIONOPTIONLIST = 'DS_LAYER_CREATIONOPTIONLIST';

function GDALGetDatasetDriver(para1: TGDALDatasetH): TGDALDriverH; cdecl; external libgdal;
function GDALGetFileList(para1: TGDALDatasetH): PPchar; cdecl; external libgdal;
function GDALClose(para1: TGDALDatasetH): TCPLErr; cdecl; external libgdal;
function GDALGetRasterXSize(para1: TGDALDatasetH): longint; cdecl; external libgdal;
function GDALGetRasterYSize(para1: TGDALDatasetH): longint; cdecl; external libgdal;
function GDALGetRasterCount(para1: TGDALDatasetH): longint; cdecl; external libgdal;
function GDALGetRasterBand(para1: TGDALDatasetH; para2: longint): TGDALRasterBandH; cdecl; external libgdal;
function GDALAddBand(hDS: TGDALDatasetH; eType: TGDALDataType; papszOptions: TCSLConstList): TCPLErr; cdecl; external libgdal;
function GDALBeginAsyncReader(hDS: TGDALDatasetH; nXOff: longint; nYOff: longint; nXSize: longint; nYSize: longint;
  pBuf: pointer; nBufXSize: longint; nBufYSize: longint; eBufType: TGDALDataType; nBandCount: longint;
  panBandMap: Plongint; nPixelSpace: longint; nLineSpace: longint; nBandSpace: longint; papszOptions: TCSLConstList): TGDALAsyncReaderH; cdecl; external libgdal;
procedure GDALEndAsyncReader(hDS: TGDALDatasetH; hAsynchReaderH: TGDALAsyncReaderH); cdecl; external libgdal;
function GDALDatasetRasterIO(hDS: TGDALDatasetH; eRWFlag: TGDALRWFlag; nDSXOff: longint; nDSYOff: longint; nDSXSize: longint;
  nDSYSize: longint; pBuffer: pointer; nBXSize: longint; nBYSize: longint; eBDataType: TGDALDataType;
  nBandCount: longint; panBandCount: Plongint; nPixelSpace: longint; nLineSpace: longint; nBandSpace: longint): TCPLErr; cdecl; external libgdal;
function GDALDatasetRasterIOEx(hDS: TGDALDatasetH; eRWFlag: TGDALRWFlag; nDSXOff: longint; nDSYOff: longint; nDSXSize: longint;
  nDSYSize: longint; pBuffer: pointer; nBXSize: longint; nBYSize: longint; eBDataType: TGDALDataType;
  nBandCount: longint; panBandCount: Plongint; nPixelSpace: TGSpacing; nLineSpace: TGSpacing; nBandSpace: TGSpacing;
  psExtraArg: PGDALRasterIOExtraArg): TCPLErr; cdecl; external libgdal;
function GDALDatasetAdviseRead(hDS: TGDALDatasetH; nDSXOff: longint; nDSYOff: longint; nDSXSize: longint; nDSYSize: longint;
  nBXSize: longint; nBYSize: longint; eBDataType: TGDALDataType; nBandCount: longint; panBandCount: Plongint;
  papszOptions: TCSLConstList): TCPLErr; cdecl; external libgdal;
function GDALDatasetGetCompressionFormats(hDS: TGDALDatasetH; nXOff: longint; nYOff: longint; nXSize: longint; nYSize: longint;
  nBandCount: longint; panBandList: Plongint): PPchar; cdecl; external libgdal;
function GDALDatasetReadCompressedData(hDS: TGDALDatasetH; pszFormat: pchar; nXOff: longint; nYOff: longint; nXSize: longint;
  nYSize: longint; nBandCount: longint; panBandList: Plongint; ppBuffer: Ppointer; pnBufferSize: Psize_t;
  ppszDetailedFormat: PPchar): TCPLErr; cdecl; external libgdal;
function GDALGetProjectionRef(para1: TGDALDatasetH): pchar; cdecl; external libgdal;
function GDALGetSpatialRef(para1: TGDALDatasetH): TOGRSpatialReferenceH; cdecl; external libgdal;
function GDALSetProjection(para1: TGDALDatasetH; para2: pchar): TCPLErr; cdecl; external libgdal;
function GDALSetSpatialRef(para1: TGDALDatasetH; para2: TOGRSpatialReferenceH): TCPLErr; cdecl; external libgdal;
function GDALGetGeoTransform(para1: TGDALDatasetH; para2: Pdouble): TCPLErr; cdecl; external libgdal;
function GDALSetGeoTransform(para1: TGDALDatasetH; para2: Pdouble): TCPLErr; cdecl; external libgdal;
function GDALGetGCPCount(para1: TGDALDatasetH): longint; cdecl; external libgdal;
function GDALGetGCPProjection(para1: TGDALDatasetH): pchar; cdecl; external libgdal;
function GDALGetGCPSpatialRef(para1: TGDALDatasetH): TOGRSpatialReferenceH; cdecl; external libgdal;
function GDALGetGCPs(para1: TGDALDatasetH): PGDAL_GCP; cdecl; external libgdal;
function GDALSetGCPs(para1: TGDALDatasetH; para2: longint; para3: PGDAL_GCP; para4: pchar): TCPLErr; cdecl; external libgdal;
function GDALSetGCPs2(para1: TGDALDatasetH; para2: longint; para3: PGDAL_GCP; para4: TOGRSpatialReferenceH): TCPLErr; cdecl; external libgdal;
function GDALGetInternalHandle(para1: TGDALDatasetH; para2: pchar): pointer; cdecl; external libgdal;
function GDALReferenceDataset(para1: TGDALDatasetH): longint; cdecl; external libgdal;
function GDALDereferenceDataset(para1: TGDALDatasetH): longint; cdecl; external libgdal;
function GDALReleaseDataset(para1: TGDALDatasetH): longint; cdecl; external libgdal;
function GDALBuildOverviews(para1: TGDALDatasetH; para2: pchar; para3: longint; para4: Plongint; para5: longint;
  para6: Plongint; para7: TGDALProgressFunc; para8: pointer): TCPLErr; cdecl; external libgdal;
function GDALBuildOverviewsEx(para1: TGDALDatasetH; para2: pchar; para3: longint; para4: Plongint; para5: longint;
  para6: Plongint; para7: TGDALProgressFunc; para8: pointer; papszOptions: TCSLConstList): TCPLErr; cdecl; external libgdal;
procedure GDALGetOpenDatasets(hDS: PPGDALDatasetH; pnCount: Plongint); cdecl; external libgdal;
function GDALGetAccess(hDS: TGDALDatasetH): longint; cdecl; external libgdal;
function GDALFlushCache(hDS: TGDALDatasetH): TCPLErr; cdecl; external libgdal;
function GDALCreateDatasetMaskBand(hDS: TGDALDatasetH; nFlags: longint): TCPLErr; cdecl; external libgdal;
function GDALDatasetCopyWholeRaster(hSrcDS: TGDALDatasetH; hDstDS: TGDALDatasetH; papszOptions: TCSLConstList; pfnProgress: TGDALProgressFunc; pProgressData: pointer): TCPLErr; cdecl; external libgdal;
function GDALRasterBandCopyWholeRaster(hSrcBand: TGDALRasterBandH; hDstBand: TGDALRasterBandH; constpapszOptions: PPchar; pfnProgress: TGDALProgressFunc; pProgressData: pointer): TCPLErr; cdecl; external libgdal;
function GDALRegenerateOverviews(hSrcBand: TGDALRasterBandH; nOverviewCount: longint; pahOverviewBands: PGDALRasterBandH; pszResampling: pchar; pfnProgress: TGDALProgressFunc;
  pProgressData: pointer): TCPLErr; cdecl; external libgdal;
function GDALRegenerateOverviewsEx(hSrcBand: TGDALRasterBandH; nOverviewCount: longint; pahOverviewBands: PGDALRasterBandH; pszResampling: pchar; pfnProgress: TGDALProgressFunc;
  pProgressData: pointer; papszOptions: TCSLConstList): TCPLErr; cdecl; external libgdal;
function GDALDatasetGetLayerCount(para1: TGDALDatasetH): longint; cdecl; external libgdal;
function GDALDatasetGetLayer(para1: TGDALDatasetH; para2: longint): TOGRLayerH; cdecl; external libgdal;
function GDALDatasetGetLayerByName(para1: TGDALDatasetH; para2: pchar): TOGRLayerH; cdecl; external libgdal;
function GDALDatasetIsLayerPrivate(para1: TGDALDatasetH; para2: longint): longint; cdecl; external libgdal;
function GDALDatasetDeleteLayer(para1: TGDALDatasetH; para2: longint): TOGRErr; cdecl; external libgdal;
function GDALDatasetCreateLayer(para1: TGDALDatasetH; para2: pchar; para3: TOGRSpatialReferenceH; para4: TOGRwkbGeometryType; para5: TCSLConstList): TOGRLayerH; cdecl; external libgdal;
function GDALDatasetCopyLayer(para1: TGDALDatasetH; para2: TOGRLayerH; para3: pchar; para4: TCSLConstList): TOGRLayerH; cdecl; external libgdal;
procedure GDALDatasetResetReading(para1: TGDALDatasetH); cdecl; external libgdal;
function GDALDatasetGetNextFeature(hDS: TGDALDatasetH; phBelongingLayer: POGRLayerH; pdfProgressPct: Pdouble; pfnProgress: TGDALProgressFunc; pProgressData: pointer): TOGRFeatureH; cdecl; external libgdal;
function GDALDatasetTestCapability(para1: TGDALDatasetH; para2: pchar): longint; cdecl; external libgdal;
function GDALDatasetExecuteSQL(para1: TGDALDatasetH; para2: pchar; para3: TOGRGeometryH; para4: pchar): TOGRLayerH; cdecl; external libgdal;
function GDALDatasetAbortSQL(para1: TGDALDatasetH): TOGRErr; cdecl; external libgdal;
procedure GDALDatasetReleaseResultSet(para1: TGDALDatasetH; para2: TOGRLayerH); cdecl; external libgdal;
function GDALDatasetGetStyleTable(para1: TGDALDatasetH): TOGRStyleTableH; cdecl; external libgdal;
procedure GDALDatasetSetStyleTableDirectly(para1: TGDALDatasetH; para2: TOGRStyleTableH); cdecl; external libgdal;
procedure GDALDatasetSetStyleTable(para1: TGDALDatasetH; para2: TOGRStyleTableH); cdecl; external libgdal;
function GDALDatasetStartTransaction(hDS: TGDALDatasetH; bForce: longint): TOGRErr; cdecl; external libgdal;
function GDALDatasetCommitTransaction(hDS: TGDALDatasetH): TOGRErr; cdecl; external libgdal;
function GDALDatasetRollbackTransaction(hDS: TGDALDatasetH): TOGRErr; cdecl; external libgdal;
procedure GDALDatasetClearStatistics(hDS: TGDALDatasetH); cdecl; external libgdal;
function GDALDatasetGetFieldDomainNames(para1: TGDALDatasetH; para2: TCSLConstList): PPchar; cdecl; external libgdal;
function GDALDatasetGetFieldDomain(hDS: TGDALDatasetH; pszName: pchar): TOGRFieldDomainH; cdecl; external libgdal;
function GDALDatasetAddFieldDomain(hDS: TGDALDatasetH; hFieldDomain: TOGRFieldDomainH; ppszFailureReason: PPchar): boolean; cdecl; external libgdal;
function GDALDatasetDeleteFieldDomain(hDS: TGDALDatasetH; pszName: pchar; ppszFailureReason: PPchar): boolean; cdecl; external libgdal;
function GDALDatasetUpdateFieldDomain(hDS: TGDALDatasetH; hFieldDomain: TOGRFieldDomainH; ppszFailureReason: PPchar): boolean; cdecl; external libgdal;
function GDALDatasetGetRelationshipNames(para1: TGDALDatasetH; para2: TCSLConstList): PPchar; cdecl; external libgdal;
function GDALDatasetGetRelationship(hDS: TGDALDatasetH; pszName: pchar): TGDALRelationshipH; cdecl; external libgdal;
function GDALDatasetAddRelationship(hDS: TGDALDatasetH; hRelationship: TGDALRelationshipH; ppszFailureReason: PPchar): boolean; cdecl; external libgdal;
function GDALDatasetDeleteRelationship(hDS: TGDALDatasetH; pszName: pchar; ppszFailureReason: PPchar): boolean; cdecl; external libgdal;
function GDALDatasetUpdateRelationship(hDS: TGDALDatasetH; hRelationship: TGDALRelationshipH; ppszFailureReason: PPchar): boolean; cdecl; external libgdal;

type
  TGDALQueryLoggerFunc = procedure(pszSQL: pchar; pszError: pchar; lNumRecords: Tint64_t; lExecutionTimeMilliseconds: Tint64_t; pQueryLoggerArg: pointer); cdecl;

function GDALDatasetSetQueryLoggerFunc(hDS: TGDALDatasetH; pfnQueryLoggerFunc: TGDALQueryLoggerFunc; poQueryLoggerArg: pointer): boolean; cdecl; external libgdal;

type
  PGDALSubdatasetInfoH = ^TGDALSubdatasetInfoH;
  TGDALSubdatasetInfoH = Pointer;

function GDALGetSubdatasetInfo(pszFileName: pchar): TGDALSubdatasetInfoH; cdecl; external libgdal;
function GDALSubdatasetInfoGetPathComponent(hInfo: TGDALSubdatasetInfoH): pchar; cdecl; external libgdal;
function GDALSubdatasetInfoGetSubdatasetComponent(hInfo: TGDALSubdatasetInfoH): pchar; cdecl; external libgdal;
function GDALSubdatasetInfoModifyPathComponent(hInfo: TGDALSubdatasetInfoH; pszNewPath: pchar): pchar; cdecl; external libgdal;
procedure GDALDestroySubdatasetInfo(hInfo: TGDALSubdatasetInfoH); cdecl; external libgdal;

type
  TGDALDerivedPixelFunc = function(papoSources: Ppointer; nSources: longint; pData: pointer; nBufXSize: longint; nBufYSize: longint; eSrcType: TGDALDataType; eBufType: TGDALDataType; nPixelSpace: longint; nLineSpace: longint): TCPLErr; cdecl;
  TGDALDerivedPixelFuncWithArgs = function(papoSources: Ppointer; nSources: longint; pData: pointer; nBufXSize: longint; nBufYSize: longint; eSrcType: TGDALDataType; eBufType: TGDALDataType; nPixelSpace: longint; nLineSpace: longint; papszFunctionArgs: TCSLConstList): TCPLErr; cdecl;

function GDALGetRasterDataType(para1: TGDALRasterBandH): TGDALDataType; cdecl; external libgdal;
procedure GDALGetBlockSize(para1: TGDALRasterBandH; pnXSize: Plongint; pnYSize: Plongint); cdecl; external libgdal;
function GDALGetActualBlockSize(para1: TGDALRasterBandH; nXBlockOff: longint; nYBlockOff: longint; pnXValid: Plongint; pnYValid: Plongint): TCPLErr; cdecl; external libgdal;
function GDALRasterAdviseRead(hRB: TGDALRasterBandH; nDSXOff: longint; nDSYOff: longint; nDSXSize: longint; nDSYSize: longint;
  nBXSize: longint; nBYSize: longint; eBDataType: TGDALDataType; papszOptions: TCSLConstList): TCPLErr; cdecl; external libgdal;
function GDALRasterIO(hRBand: TGDALRasterBandH; eRWFlag: TGDALRWFlag; nDSXOff: longint; nDSYOff: longint; nDSXSize: longint;
  nDSYSize: longint; pBuffer: pointer; nBXSize: longint; nBYSize: longint; eBDataType: TGDALDataType;
  nPixelSpace: longint; nLineSpace: longint): TCPLErr; cdecl; external libgdal;
function GDALRasterIOEx(hRBand: TGDALRasterBandH; eRWFlag: TGDALRWFlag; nDSXOff: longint; nDSYOff: longint; nDSXSize: longint;
  nDSYSize: longint; pBuffer: pointer; nBXSize: longint; nBYSize: longint; eBDataType: TGDALDataType;
  nPixelSpace: TGSpacing; nLineSpace: TGSpacing; psExtraArg: PGDALRasterIOExtraArg): TCPLErr; cdecl; external libgdal;
function GDALReadBlock(para1: TGDALRasterBandH; para2: longint; para3: longint; para4: pointer): TCPLErr; cdecl; external libgdal;
function GDALWriteBlock(para1: TGDALRasterBandH; para2: longint; para3: longint; para4: pointer): TCPLErr; cdecl; external libgdal;
function GDALGetRasterBandXSize(para1: TGDALRasterBandH): longint; cdecl; external libgdal;
function GDALGetRasterBandYSize(para1: TGDALRasterBandH): longint; cdecl; external libgdal;
function GDALGetRasterAccess(para1: TGDALRasterBandH): TGDALAccess; cdecl; external libgdal;
function GDALGetBandNumber(para1: TGDALRasterBandH): longint; cdecl; external libgdal;
function GDALGetBandDataset(para1: TGDALRasterBandH): TGDALDatasetH; cdecl; external libgdal;
function GDALGetRasterColorInterpretation(para1: TGDALRasterBandH): TGDALColorInterp; cdecl; external libgdal;
function GDALSetRasterColorInterpretation(para1: TGDALRasterBandH; para2: TGDALColorInterp): TCPLErr; cdecl; external libgdal;
function GDALGetRasterColorTable(para1: TGDALRasterBandH): TGDALColorTableH; cdecl; external libgdal;
function GDALSetRasterColorTable(para1: TGDALRasterBandH; para2: TGDALColorTableH): TCPLErr; cdecl; external libgdal;
function GDALHasArbitraryOverviews(para1: TGDALRasterBandH): longint; cdecl; external libgdal;
function GDALGetOverviewCount(para1: TGDALRasterBandH): longint; cdecl; external libgdal;
function GDALGetOverview(para1: TGDALRasterBandH; para2: longint): TGDALRasterBandH; cdecl; external libgdal;
function GDALGetRasterNoDataValue(para1: TGDALRasterBandH; para2: Plongint): double; cdecl; external libgdal;
function GDALGetRasterNoDataValueAsInt64(para1: TGDALRasterBandH; para2: Plongint): Tint64_t; cdecl; external libgdal;
function GDALGetRasterNoDataValueAsUInt64(para1: TGDALRasterBandH; para2: Plongint): Tuint64_t; cdecl; external libgdal;
function GDALSetRasterNoDataValue(para1: TGDALRasterBandH; para2: double): TCPLErr; cdecl; external libgdal;
function GDALSetRasterNoDataValueAsInt64(para1: TGDALRasterBandH; para2: Tint64_t): TCPLErr; cdecl; external libgdal;
function GDALSetRasterNoDataValueAsUInt64(para1: TGDALRasterBandH; para2: Tuint64_t): TCPLErr; cdecl; external libgdal;
function GDALDeleteRasterNoDataValue(para1: TGDALRasterBandH): TCPLErr; cdecl; external libgdal;
function GDALGetRasterCategoryNames(para1: TGDALRasterBandH): PPchar; cdecl; external libgdal;
function GDALSetRasterCategoryNames(para1: TGDALRasterBandH; para2: TCSLConstList): TCPLErr; cdecl; external libgdal;
function GDALGetRasterMinimum(para1: TGDALRasterBandH; pbSuccess: Plongint): double; cdecl; external libgdal;
function GDALGetRasterMaximum(para1: TGDALRasterBandH; pbSuccess: Plongint): double; cdecl; external libgdal;
function GDALGetRasterStatistics(para1: TGDALRasterBandH; bApproxOK: longint; bForce: longint; pdfMin: Pdouble; pdfMax: Pdouble;
  pdfMean: Pdouble; pdfStdDev: Pdouble): TCPLErr; cdecl; external libgdal;
function GDALComputeRasterStatistics(para1: TGDALRasterBandH; bApproxOK: longint; pdfMin: Pdouble; pdfMax: Pdouble; pdfMean: Pdouble;
  pdfStdDev: Pdouble; pfnProgress: TGDALProgressFunc; pProgressData: pointer): TCPLErr; cdecl; external libgdal;
function GDALSetRasterStatistics(hBand: TGDALRasterBandH; dfMin: double; dfMax: double; dfMean: double; dfStdDev: double): TCPLErr; cdecl; external libgdal;
function GDALRasterBandAsMDArray(para1: TGDALRasterBandH): TGDALMDArrayH; cdecl; external libgdal;
function GDALGetRasterUnitType(para1: TGDALRasterBandH): pchar; cdecl; external libgdal;
function GDALSetRasterUnitType(hBand: TGDALRasterBandH; pszNewValue: pchar): TCPLErr; cdecl; external libgdal;
function GDALGetRasterOffset(para1: TGDALRasterBandH; pbSuccess: Plongint): double; cdecl; external libgdal;
function GDALSetRasterOffset(hBand: TGDALRasterBandH; dfNewOffset: double): TCPLErr; cdecl; external libgdal;
function GDALGetRasterScale(para1: TGDALRasterBandH; pbSuccess: Plongint): double; cdecl; external libgdal;
function GDALSetRasterScale(hBand: TGDALRasterBandH; dfNewOffset: double): TCPLErr; cdecl; external libgdal;
function GDALComputeRasterMinMax(hBand: TGDALRasterBandH; bApproxOK: longint; adfMinMax: Pdouble): TCPLErr; cdecl; external libgdal;
function GDALFlushRasterCache(hBand: TGDALRasterBandH): TCPLErr; cdecl; external libgdal;
function GDALGetRasterHistogram(hBand: TGDALRasterBandH; dfMin: double; dfMax: double; nBuckets: longint; panHistogram: Plongint;
  bIncludeOutOfRange: longint; bApproxOK: longint; pfnProgress: TGDALProgressFunc; pProgressData: pointer): TCPLErr; cdecl; external libgdal; deprecated;
function GDALGetRasterHistogramEx(hBand: TGDALRasterBandH; dfMin: double; dfMax: double; nBuckets: longint; panHistogram: PGUIntBig;
  bIncludeOutOfRange: longint; bApproxOK: longint; pfnProgress: TGDALProgressFunc; pProgressData: pointer): TCPLErr; cdecl; external libgdal;
function GDALGetDefaultHistogram(hBand: TGDALRasterBandH; pdfMin: Pdouble; pdfMax: Pdouble; pnBuckets: Plongint; ppanHistogram: PPlongint;
  bForce: longint; pfnProgress: TGDALProgressFunc; pProgressData: pointer): TCPLErr; cdecl; external libgdal; deprecated;
function GDALGetDefaultHistogramEx(hBand: TGDALRasterBandH; pdfMin: Pdouble; pdfMax: Pdouble; pnBuckets: Plongint; ppanHistogram: PPGUIntBig;
  bForce: longint; pfnProgress: TGDALProgressFunc; pProgressData: pointer): TCPLErr; cdecl; external libgdal;
function GDALSetDefaultHistogram(hBand: TGDALRasterBandH; dfMin: double; dfMax: double; nBuckets: longint; panHistogram: Plongint): TCPLErr; cdecl; external libgdal; deprecated;
function GDALSetDefaultHistogramEx(hBand: TGDALRasterBandH; dfMin: double; dfMax: double; nBuckets: longint; panHistogram: PGUIntBig): TCPLErr; cdecl; external libgdal;
function GDALGetRandomRasterSample(para1: TGDALRasterBandH; para2: longint; para3: Psingle): longint; cdecl; external libgdal;
function GDALGetRasterSampleOverview(para1: TGDALRasterBandH; para2: longint): TGDALRasterBandH; cdecl; external libgdal;
function GDALGetRasterSampleOverviewEx(para1: TGDALRasterBandH; para2: TGUIntBig): TGDALRasterBandH; cdecl; external libgdal;
function GDALFillRaster(hBand: TGDALRasterBandH; dfRealValue: double; dfImaginaryValue: double): TCPLErr; cdecl; external libgdal;
function GDALComputeBandStats(hBand: TGDALRasterBandH; nSampleStep: longint; pdfMean: Pdouble; pdfStdDev: Pdouble; pfnProgress: TGDALProgressFunc;
  pProgressData: pointer): TCPLErr; cdecl; external libgdal;
function GDALOverviewMagnitudeCorrection(hBaseBand: TGDALRasterBandH; nOverviewCount: longint; pahOverviews: PGDALRasterBandH; pfnProgress: TGDALProgressFunc; pProgressData: pointer): TCPLErr; cdecl; external libgdal;
function GDALGetDefaultRAT(hBand: TGDALRasterBandH): TGDALRasterAttributeTableH; cdecl; external libgdal;
function GDALSetDefaultRAT(para1: TGDALRasterBandH; para2: TGDALRasterAttributeTableH): TCPLErr; cdecl; external libgdal;
function GDALAddDerivedBandPixelFunc(pszName: pchar; pfnPixelFunc: TGDALDerivedPixelFunc): TCPLErr; cdecl; external libgdal;
function GDALAddDerivedBandPixelFuncWithArgs(pszName: pchar; pfnPixelFunc: TGDALDerivedPixelFuncWithArgs; pszMetadata: pchar): TCPLErr; cdecl; external libgdal;
function GDALGetMaskBand(hBand: TGDALRasterBandH): TGDALRasterBandH; cdecl; external libgdal;
function GDALGetMaskFlags(hBand: TGDALRasterBandH): longint; cdecl; external libgdal;
function GDALCreateMaskBand(hBand: TGDALRasterBandH; nFlags: longint): TCPLErr; cdecl; external libgdal;
function GDALIsMaskBand(hBand: TGDALRasterBandH): boolean; cdecl; external libgdal;

const
  GMF_ALL_VALID = $01;
  GMF_PER_DATASET = $02;
  GMF_ALPHA = $04;
  GMF_NODATA = $08;
  GDAL_DATA_COVERAGE_STATUS_UNIMPLEMENTED = $01;
  GDAL_DATA_COVERAGE_STATUS_DATA = $02;
  GDAL_DATA_COVERAGE_STATUS_EMPTY = $04;

function GDALGetDataCoverageStatus(hBand: TGDALRasterBandH; nXOff: longint; nYOff: longint; nXSize: longint; nYSize: longint;
  nMaskFlagStop: longint; pdfDataPct: Pdouble): longint; cdecl; external libgdal;

function GDALARGetNextUpdatedRegion(hARIO: TGDALAsyncReaderH; dfTimeout: double; pnXBufOff: Plongint; pnYBufOff: Plongint; pnXBufSize: Plongint;
  pnYBufSize: Plongint): TGDALAsyncStatusType; cdecl; external libgdal;
function GDALARLockBuffer(hARIO: TGDALAsyncReaderH; dfTimeout: double): longint; cdecl; external libgdal;
procedure GDALARUnlockBuffer(hARIO: TGDALAsyncReaderH); cdecl; external libgdal;

function GDALGeneralCmdLineProcessor(nArgc: longint; ppapszArgv: PPPchar; nOptions: longint): longint; cdecl; external libgdal;
procedure GDALSwapWords(pData: pointer; nWordSize: longint; nWordCount: longint; nWordSkip: longint); cdecl; external libgdal;
procedure GDALSwapWordsEx(pData: pointer; nWordSize: longint; nWordCount: Tsize_t; nWordSkip: longint); cdecl; external libgdal;
procedure GDALCopyWords(pSrcData: pointer; eSrcType: TGDALDataType; nSrcPixelOffset: longint; pDstData: pointer; eDstType: TGDALDataType;
  nDstPixelOffset: longint; nWordCount: longint); cdecl; external libgdal;
procedure GDALCopyWords64(pSrcData: pointer; eSrcType: TGDALDataType; nSrcPixelOffset: longint; pDstData: pointer; eDstType: TGDALDataType;
  nDstPixelOffset: longint; nWordCount: TGPtrDiff_t); cdecl; external libgdal;
procedure GDALCopyBits(pabySrcData: PGByte; nSrcOffset: longint; nSrcStep: longint; pabyDstData: PGByte; nDstOffset: longint;
  nDstStep: longint; nBitCount: longint; nStepCount: longint); cdecl; external libgdal;
procedure GDALDeinterleave(pSourceBuffer: pointer; eSourceDT: TGDALDataType; nComponents: longint; ppDestBuffer: Ppointer; eDestDT: TGDALDataType;
  nIters: Tsize_t); cdecl; external libgdal;
function GDALLoadWorldFile(para1: pchar; para2: Pdouble): longint; cdecl; external libgdal;
function GDALReadWorldFile(para1: pchar; para2: pchar; para3: Pdouble): longint; cdecl; external libgdal;
function GDALWriteWorldFile(para1: pchar; para2: pchar; para3: Pdouble): longint; cdecl; external libgdal;
function GDALLoadTabFile(para1: pchar; para2: Pdouble; para3: PPchar; para4: Plongint; para5: PPGDAL_GCP): longint; cdecl; external libgdal;
function GDALReadTabFile(para1: pchar; para2: Pdouble; para3: PPchar; para4: Plongint; para5: PPGDAL_GCP): longint; cdecl; external libgdal;
function GDALLoadOziMapFile(para1: pchar; para2: Pdouble; para3: PPchar; para4: Plongint; para5: PPGDAL_GCP): longint; cdecl; external libgdal;
function GDALReadOziMapFile(para1: pchar; para2: Pdouble; para3: PPchar; para4: Plongint; para5: PPGDAL_GCP): longint; cdecl; external libgdal;
function GDALDecToDMS(para1: double; para2: pchar; para3: longint): pchar; cdecl; external libgdal;
function GDALPackedDMSToDec(para1: double): double; cdecl; external libgdal;
function GDALDecToPackedDMS(para1: double): double; cdecl; external libgdal;

type
  PGDALRPCInfoV1 = ^TGDALRPCInfoV1;
  TGDALRPCInfoV1 = record
    dfLINE_OFF: double;
    dfSAMP_OFF: double;
    dfLAT_OFF: double;
    dfLONG_OFF: double;
    dfHEIGHT_OFF: double;
    dfLINE_SCALE: double;
    dfSAMP_SCALE: double;
    dfLAT_SCALE: double;
    dfLONG_SCALE: double;
    dfHEIGHT_SCALE: double;
    adfLINE_NUM_COEFF: array[0..19] of double;
    adfLINE_DEN_COEFF: array[0..19] of double;
    adfSAMP_NUM_COEFF: array[0..19] of double;
    adfSAMP_DEN_COEFF: array[0..19] of double;
    dfMIN_LONG: double;
    dfMIN_LAT: double;
    dfMAX_LONG: double;
    dfMAX_LAT: double;
  end;

  PGDALRPCInfoV2 = ^TGDALRPCInfoV2;
  TGDALRPCInfoV2 = record
    dfLINE_OFF: double;
    dfSAMP_OFF: double;
    dfLAT_OFF: double;
    dfLONG_OFF: double;
    dfHEIGHT_OFF: double;
    dfLINE_SCALE: double;
    dfSAMP_SCALE: double;
    dfLAT_SCALE: double;
    dfLONG_SCALE: double;
    dfHEIGHT_SCALE: double;
    adfLINE_NUM_COEFF: array[0..19] of double;
    adfLINE_DEN_COEFF: array[0..19] of double;
    adfSAMP_NUM_COEFF: array[0..19] of double;
    adfSAMP_DEN_COEFF: array[0..19] of double;
    dfMIN_LONG: double;
    dfMIN_LAT: double;
    dfMAX_LONG: double;
    dfMAX_LAT: double;
    dfERR_BIAS: double;
    dfERR_RAND: double;
  end;

function GDALExtractRPCInfoV1(para1: TCSLConstList; para2: PGDALRPCInfoV1): longint; cdecl; external libgdal;
function GDALExtractRPCInfoV2(para1: TCSLConstList; para2: PGDALRPCInfoV2): longint; cdecl; external libgdal;

type
  PGDALColorEntry = ^TGDALColorEntry;
  TGDALColorEntry = record
    c1: smallint;
    c2: smallint;
    c3: smallint;
    c4: smallint;
  end;

function GDALCreateColorTable(para1: TGDALPaletteInterp): TGDALColorTableH; cdecl; external libgdal;
procedure GDALDestroyColorTable(para1: TGDALColorTableH); cdecl; external libgdal;
function GDALCloneColorTable(para1: TGDALColorTableH): TGDALColorTableH; cdecl; external libgdal;
function GDALGetPaletteInterpretation(para1: TGDALColorTableH): TGDALPaletteInterp; cdecl; external libgdal;
function GDALGetColorEntryCount(para1: TGDALColorTableH): longint; cdecl; external libgdal;
function GDALGetColorEntry(para1: TGDALColorTableH; para2: longint): PGDALColorEntry; cdecl; external libgdal;
function GDALGetColorEntryAsRGB(para1: TGDALColorTableH; para2: longint; para3: PGDALColorEntry): longint; cdecl; external libgdal;
procedure GDALSetColorEntry(para1: TGDALColorTableH; para2: longint; para3: PGDALColorEntry); cdecl; external libgdal;
procedure GDALCreateColorRamp(hTable: TGDALColorTableH; nStartIndex: longint; psStartColor: PGDALColorEntry; nEndIndex: longint; psEndColor: PGDALColorEntry); cdecl; external libgdal;

type
  PGDALRATFieldType = ^TGDALRATFieldType;
  TGDALRATFieldType = longint;
const
  GFT_Integer = 0;
  GFT_Real = 1;
  GFT_String = 2;

type
  PGDALRATFieldUsage = ^TGDALRATFieldUsage;
  TGDALRATFieldUsage = longint;
const
  GFU_Generic = 0;
  GFU_PixelCount = 1;
  GFU_Name = 2;
  GFU_Min = 3;
  GFU_Max = 4;
  GFU_MinMax = 5;
  GFU_Red = 6;
  GFU_Green = 7;
  GFU_Blue = 8;
  GFU_Alpha = 9;
  GFU_RedMin = 10;
  GFU_GreenMin = 11;
  GFU_BlueMin = 12;
  GFU_AlphaMin = 13;
  GFU_RedMax = 14;
  GFU_GreenMax = 15;
  GFU_BlueMax = 16;
  GFU_AlphaMax = 17;
  GFU_MaxCount = 18;

type
  PGDALRATTableType = ^TGDALRATTableType;
  TGDALRATTableType = longint;
const
  GRTT_THEMATIC = 0;
  GRTT_ATHEMATIC = 1;

function GDALCreateRasterAttributeTable: TGDALRasterAttributeTableH; cdecl; external libgdal;
procedure GDALDestroyRasterAttributeTable(para1: TGDALRasterAttributeTableH); cdecl; external libgdal;
function GDALRATGetColumnCount(para1: TGDALRasterAttributeTableH): longint; cdecl; external libgdal;
function GDALRATGetNameOfCol(para1: TGDALRasterAttributeTableH; para2: longint): pchar; cdecl; external libgdal;
function GDALRATGetUsageOfCol(para1: TGDALRasterAttributeTableH; para2: longint): TGDALRATFieldUsage; cdecl; external libgdal;
function GDALRATGetTypeOfCol(para1: TGDALRasterAttributeTableH; para2: longint): TGDALRATFieldType; cdecl; external libgdal;
function GDALRATGetColOfUsage(para1: TGDALRasterAttributeTableH; para2: TGDALRATFieldUsage): longint; cdecl; external libgdal;
function GDALRATGetRowCount(para1: TGDALRasterAttributeTableH): longint; cdecl; external libgdal;
function GDALRATGetValueAsString(para1: TGDALRasterAttributeTableH; para2: longint; para3: longint): pchar; cdecl; external libgdal;
function GDALRATGetValueAsInt(para1: TGDALRasterAttributeTableH; para2: longint; para3: longint): longint; cdecl; external libgdal;
function GDALRATGetValueAsDouble(para1: TGDALRasterAttributeTableH; para2: longint; para3: longint): double; cdecl; external libgdal;
procedure GDALRATSetValueAsString(para1: TGDALRasterAttributeTableH; para2: longint; para3: longint; para4: pchar); cdecl; external libgdal;
procedure GDALRATSetValueAsInt(para1: TGDALRasterAttributeTableH; para2: longint; para3: longint; para4: longint); cdecl; external libgdal;
procedure GDALRATSetValueAsDouble(para1: TGDALRasterAttributeTableH; para2: longint; para3: longint; para4: double); cdecl; external libgdal;
function GDALRATChangesAreWrittenToFile(hRAT: TGDALRasterAttributeTableH): longint; cdecl; external libgdal;
function GDALRATValuesIOAsDouble(hRAT: TGDALRasterAttributeTableH; eRWFlag: TGDALRWFlag; iField: longint; iStartRow: longint; iLength: longint;
  pdfData: Pdouble): TCPLErr; cdecl; external libgdal;
function GDALRATValuesIOAsInteger(hRAT: TGDALRasterAttributeTableH; eRWFlag: TGDALRWFlag; iField: longint; iStartRow: longint; iLength: longint;
  pnData: Plongint): TCPLErr; cdecl; external libgdal;
function GDALRATValuesIOAsString(hRAT: TGDALRasterAttributeTableH; eRWFlag: TGDALRWFlag; iField: longint; iStartRow: longint; iLength: longint;
  papszStrList: TCSLConstList): TCPLErr; cdecl; external libgdal;
procedure GDALRATSetRowCount(para1: TGDALRasterAttributeTableH; para2: longint); cdecl; external libgdal;
function GDALRATCreateColumn(para1: TGDALRasterAttributeTableH; para2: pchar; para3: TGDALRATFieldType; para4: TGDALRATFieldUsage): TCPLErr; cdecl; external libgdal;
function GDALRATSetLinearBinning(para1: TGDALRasterAttributeTableH; para2: double; para3: double): TCPLErr; cdecl; external libgdal;
function GDALRATGetLinearBinning(para1: TGDALRasterAttributeTableH; para2: Pdouble; para3: Pdouble): longint; cdecl; external libgdal;
function GDALRATSetTableType(hRAT: TGDALRasterAttributeTableH; eInTableType: TGDALRATTableType): TCPLErr; cdecl; external libgdal;
function GDALRATGetTableType(hRAT: TGDALRasterAttributeTableH): TGDALRATTableType; cdecl; external libgdal;
function GDALRATInitializeFromColorTable(para1: TGDALRasterAttributeTableH; para2: TGDALColorTableH): TCPLErr; cdecl; external libgdal;
function GDALRATTranslateToColorTable(para1: TGDALRasterAttributeTableH; nEntryCount: longint): TGDALColorTableH; cdecl; external libgdal;
procedure GDALRATDumpReadable(para1: TGDALRasterAttributeTableH; para2: PFILE); cdecl; external libgdal;
function GDALRATClone(para1: TGDALRasterAttributeTableH): TGDALRasterAttributeTableH; cdecl; external libgdal;
function GDALRATSerializeJSON(para1: TGDALRasterAttributeTableH): pointer; cdecl; external libgdal;
function GDALRATGetRowOfValue(para1: TGDALRasterAttributeTableH; para2: double): longint; cdecl; external libgdal;
procedure GDALRATRemoveStatistics(para1: TGDALRasterAttributeTableH); cdecl; external libgdal;

type
  PGDALRelationshipCardinality = ^TGDALRelationshipCardinality;
  TGDALRelationshipCardinality = longint;
const
  GRC_ONE_TO_ONE = 0;
  GRC_ONE_TO_MANY = 1;
  GRC_MANY_TO_ONE = 2;
  GRC_MANY_TO_MANY = 3;

type
  PGDALRelationshipType = ^TGDALRelationshipType;
  TGDALRelationshipType = longint;
const
  GRT_COMPOSITE = 0;
  GRT_ASSOCIATION = 1;
  GRT_AGGREGATION = 2;

function GDALRelationshipCreate(para1: pchar; para2: pchar; para3: pchar; para4: TGDALRelationshipCardinality): TGDALRelationshipH; cdecl; external libgdal;
procedure GDALDestroyRelationship(para1: TGDALRelationshipH); cdecl; external libgdal;
function GDALRelationshipGetName(para1: TGDALRelationshipH): pchar; cdecl; external libgdal;
function GDALRelationshipGetCardinality(para1: TGDALRelationshipH): TGDALRelationshipCardinality; cdecl; external libgdal;
function GDALRelationshipGetLeftTableName(para1: TGDALRelationshipH): pchar; cdecl; external libgdal;
function GDALRelationshipGetRightTableName(para1: TGDALRelationshipH): pchar; cdecl; external libgdal;
function GDALRelationshipGetMappingTableName(para1: TGDALRelationshipH): pchar; cdecl; external libgdal;
procedure GDALRelationshipSetMappingTableName(para1: TGDALRelationshipH; para2: pchar); cdecl; external libgdal;
function GDALRelationshipGetLeftTableFields(para1: TGDALRelationshipH): Ppchar; cdecl; external libgdal;
function GDALRelationshipGetRightTableFields(para1: TGDALRelationshipH): Ppchar; cdecl; external libgdal;
procedure GDALRelationshipSetLeftTableFields(para1: TGDALRelationshipH; para2: TCSLConstList); cdecl; external libgdal;
procedure GDALRelationshipSetRightTableFields(para1: TGDALRelationshipH; para2: TCSLConstList); cdecl; external libgdal;
function GDALRelationshipGetLeftMappingTableFields(para1: TGDALRelationshipH): Ppchar; cdecl; external libgdal;
function GDALRelationshipGetRightMappingTableFields(para1: TGDALRelationshipH): Ppchar; cdecl; external libgdal;
procedure GDALRelationshipSetLeftMappingTableFields(para1: TGDALRelationshipH; para2: TCSLConstList); cdecl; external libgdal;
procedure GDALRelationshipSetRightMappingTableFields(para1: TGDALRelationshipH; para2: TCSLConstList); cdecl; external libgdal;
function GDALRelationshipGetType(para1: TGDALRelationshipH): TGDALRelationshipType; cdecl; external libgdal;
procedure GDALRelationshipSetType(para1: TGDALRelationshipH; para2: TGDALRelationshipType); cdecl; external libgdal;
function GDALRelationshipGetForwardPathLabel(para1: TGDALRelationshipH): pchar; cdecl; external libgdal;
procedure GDALRelationshipSetForwardPathLabel(para1: TGDALRelationshipH; para2: pchar); cdecl; external libgdal;
function GDALRelationshipGetBackwardPathLabel(para1: TGDALRelationshipH): pchar; cdecl; external libgdal;
procedure GDALRelationshipSetBackwardPathLabel(para1: TGDALRelationshipH; para2: pchar); cdecl; external libgdal;
function GDALRelationshipGetRelatedTableType(para1: TGDALRelationshipH): pchar; cdecl; external libgdal;
procedure GDALRelationshipSetRelatedTableType(para1: TGDALRelationshipH; para2: pchar); cdecl; external libgdal;

procedure GDALSetCacheMax(nBytes: longint); cdecl; external libgdal;
function GDALGetCacheMax: longint; cdecl; external libgdal;
function GDALGetCacheUsed: longint; cdecl; external libgdal;
procedure GDALSetCacheMax64(nBytes: TGIntBig); cdecl; external libgdal;
function GDALGetCacheMax64: TGIntBig; cdecl; external libgdal;
function GDALGetCacheUsed64: TGIntBig; cdecl; external libgdal;
function GDALFlushCacheBlock: longint; cdecl; external libgdal;

function GDALDatasetGetVirtualMem(hDS: TGDALDatasetH; eRWFlag: TGDALRWFlag; nXOff: longint; nYOff: longint; nXSize: longint;
  nYSize: longint; nBufXSize: longint; nBufYSize: longint; eBufType: TGDALDataType; nBandCount: longint;
  panBandMap: Plongint; nPixelSpace: longint; nLineSpace: TGIntBig; nBandSpace: TGIntBig; nCacheSize: Tsize_t;
  nPageSizeHint: Tsize_t; bSingleThreadUsage: longint; papszOptions: TCSLConstList): PCPLVirtualMem; cdecl; external libgdal;
function GDALRasterBandGetVirtualMem(hBand: TGDALRasterBandH; eRWFlag: TGDALRWFlag; nXOff: longint; nYOff: longint; nXSize: longint;
  nYSize: longint; nBufXSize: longint; nBufYSize: longint; eBufType: TGDALDataType; nPixelSpace: longint;
  nLineSpace: TGIntBig; nCacheSize: Tsize_t; nPageSizeHint: Tsize_t; bSingleThreadUsage: longint; papszOptions: TCSLConstList): PCPLVirtualMem; cdecl; external libgdal;
function GDALGetVirtualMemAuto(hBand: TGDALRasterBandH; eRWFlag: TGDALRWFlag; pnPixelSpace: Plongint; pnLineSpace: PGIntBig; papszOptions: TCSLConstList): PCPLVirtualMem; cdecl; external libgdal;

type
  PGDALTileOrganization = ^TGDALTileOrganization;
  TGDALTileOrganization = longint;
const
  GTO_TIP = 0;
  GTO_BIT = 1;
  GTO_BSQ = 2;

function GDALDatasetGetTiledVirtualMem(hDS: TGDALDatasetH; eRWFlag: TGDALRWFlag; nXOff: longint; nYOff: longint; nXSize: longint;
  nYSize: longint; nTileXSize: longint; nTileYSize: longint; eBufType: TGDALDataType; nBandCount: longint;
  panBandMap: Plongint; eTileOrganization: TGDALTileOrganization; nCacheSize: Tsize_t; bSingleThreadUsage: longint; papszOptions: TCSLConstList): PCPLVirtualMem; cdecl; external libgdal;
function GDALRasterBandGetTiledVirtualMem(hBand: TGDALRasterBandH; eRWFlag: TGDALRWFlag; nXOff: longint; nYOff: longint; nXSize: longint;
  nYSize: longint; nTileXSize: longint; nTileYSize: longint; eBufType: TGDALDataType; nCacheSize: Tsize_t;
  bSingleThreadUsage: longint; papszOptions: TCSLConstList): PCPLVirtualMem; cdecl; external libgdal;

function GDALCreatePansharpenedVRT(pszXML: pchar; hPanchroBand: TGDALRasterBandH; nInputSpectralBands: longint; pahInputSpectralBands: PGDALRasterBandH): TGDALDatasetH; cdecl; external libgdal;

function GDALGetJPEG2000Structure(pszFilename: pchar; papszOptions: TCSLConstList): PCPLXMLNode; cdecl; external libgdal;

function GDALCreateMultiDimensional(hDriver: TGDALDriverH; pszName: pchar; papszRootGroupOptions: TCSLConstList; papszOptions: TCSLConstList): TGDALDatasetH; cdecl; external libgdal;
function GDALExtendedDataTypeCreate(eType: TGDALDataType): TGDALExtendedDataTypeH; cdecl; external libgdal;
function GDALExtendedDataTypeCreateString(nMaxStringLength: Tsize_t): TGDALExtendedDataTypeH; cdecl; external libgdal;
function GDALExtendedDataTypeCreateStringEx(nMaxStringLength: Tsize_t; eSubType: TGDALExtendedDataTypeSubType): TGDALExtendedDataTypeH; cdecl; external libgdal;
function GDALExtendedDataTypeCreateCompound(pszName: pchar; nTotalSize: Tsize_t; nComponents: Tsize_t; comps: PGDALEDTComponentH): TGDALExtendedDataTypeH; cdecl; external libgdal;
procedure GDALExtendedDataTypeRelease(hEDT: TGDALExtendedDataTypeH); cdecl; external libgdal;
function GDALExtendedDataTypeGetName(hEDT: TGDALExtendedDataTypeH): pchar; cdecl; external libgdal;
function GDALExtendedDataTypeGetClass(hEDT: TGDALExtendedDataTypeH): TGDALExtendedDataTypeClass; cdecl; external libgdal;
function GDALExtendedDataTypeGetNumericDataType(hEDT: TGDALExtendedDataTypeH): TGDALDataType; cdecl; external libgdal;
function GDALExtendedDataTypeGetSize(hEDT: TGDALExtendedDataTypeH): Tsize_t; cdecl; external libgdal;
function GDALExtendedDataTypeGetMaxStringLength(hEDT: TGDALExtendedDataTypeH): Tsize_t; cdecl; external libgdal;
function GDALExtendedDataTypeGetComponents(hEDT: TGDALExtendedDataTypeH; pnCount: Psize_t): PGDALEDTComponentH; cdecl; external libgdal;
procedure GDALExtendedDataTypeFreeComponents(components: PGDALEDTComponentH; nCount: Tsize_t); cdecl; external libgdal;
function GDALExtendedDataTypeCanConvertTo(hSourceEDT: TGDALExtendedDataTypeH; hTargetEDT: TGDALExtendedDataTypeH): longint; cdecl; external libgdal;
function GDALExtendedDataTypeEquals(hFirstEDT: TGDALExtendedDataTypeH; hSecondEDT: TGDALExtendedDataTypeH): longint; cdecl; external libgdal;
function GDALExtendedDataTypeGetSubType(hEDT: TGDALExtendedDataTypeH): TGDALExtendedDataTypeSubType; cdecl; external libgdal;
function GDALEDTComponentCreate(pszName: pchar; nOffset: Tsize_t; hType: TGDALExtendedDataTypeH): TGDALEDTComponentH; cdecl; external libgdal;
procedure GDALEDTComponentRelease(hComp: TGDALEDTComponentH); cdecl; external libgdal;
function GDALEDTComponentGetName(hComp: TGDALEDTComponentH): pchar; cdecl; external libgdal;
function GDALEDTComponentGetOffset(hComp: TGDALEDTComponentH): Tsize_t; cdecl; external libgdal;
function GDALEDTComponentGetType(hComp: TGDALEDTComponentH): TGDALExtendedDataTypeH; cdecl; external libgdal;
function GDALDatasetGetRootGroup(hDS: TGDALDatasetH): TGDALGroupH; cdecl; external libgdal;
procedure GDALGroupRelease(hGroup: TGDALGroupH); cdecl; external libgdal;
function GDALGroupGetName(hGroup: TGDALGroupH): pchar; cdecl; external libgdal;
function GDALGroupGetFullName(hGroup: TGDALGroupH): pchar; cdecl; external libgdal;
function GDALGroupGetMDArrayNames(hGroup: TGDALGroupH; papszOptions: TCSLConstList): Ppchar; cdecl; external libgdal;
function GDALGroupOpenMDArray(hGroup: TGDALGroupH; pszMDArrayName: pchar; papszOptions: TCSLConstList): TGDALMDArrayH; cdecl; external libgdal;
function GDALGroupOpenMDArrayFromFullname(hGroup: TGDALGroupH; pszMDArrayName: pchar; papszOptions: TCSLConstList): TGDALMDArrayH; cdecl; external libgdal;
function GDALGroupResolveMDArray(hGroup: TGDALGroupH; pszName: pchar; pszStartingPoint: pchar; papszOptions: TCSLConstList): TGDALMDArrayH; cdecl; external libgdal;
function GDALGroupGetGroupNames(hGroup: TGDALGroupH; papszOptions: TCSLConstList): Ppchar; cdecl; external libgdal;
function GDALGroupOpenGroup(hGroup: TGDALGroupH; pszSubGroupName: pchar; papszOptions: TCSLConstList): TGDALGroupH; cdecl; external libgdal;
function GDALGroupOpenGroupFromFullname(hGroup: TGDALGroupH; pszMDArrayName: pchar; papszOptions: TCSLConstList): TGDALGroupH; cdecl; external libgdal;
function GDALGroupGetVectorLayerNames(hGroup: TGDALGroupH; papszOptions: TCSLConstList): Ppchar; cdecl; external libgdal;
function GDALGroupOpenVectorLayer(hGroup: TGDALGroupH; pszVectorLayerName: pchar; papszOptions: TCSLConstList): TOGRLayerH; cdecl; external libgdal;
function GDALGroupGetDimensions(hGroup: TGDALGroupH; pnCount: Psize_t; papszOptions: TCSLConstList): PGDALDimensionH; cdecl; external libgdal;
function GDALGroupGetAttribute(hGroup: TGDALGroupH; pszName: pchar): TGDALAttributeH; cdecl; external libgdal;
function GDALGroupGetAttributes(hGroup: TGDALGroupH; pnCount: Psize_t; papszOptions: TCSLConstList): PGDALAttributeH; cdecl; external libgdal;
function GDALGroupGetStructuralInfo(hGroup: TGDALGroupH): TCSLConstList; cdecl; external libgdal;
function GDALGroupCreateGroup(hGroup: TGDALGroupH; pszSubGroupName: pchar; papszOptions: TCSLConstList): TGDALGroupH; cdecl; external libgdal;
function GDALGroupDeleteGroup(hGroup: TGDALGroupH; pszName: pchar; papszOptions: TCSLConstList): boolean; cdecl; external libgdal;
function GDALGroupCreateDimension(hGroup: TGDALGroupH; pszName: pchar; pszType: pchar; pszDirection: pchar; nSize: TGUInt64;
  papszOptions: TCSLConstList): TGDALDimensionH; cdecl; external libgdal;
function GDALGroupCreateMDArray(hGroup: TGDALGroupH; pszName: pchar; nDimensions: Tsize_t; pahDimensions: PGDALDimensionH; hEDT: TGDALExtendedDataTypeH;
  papszOptions: TCSLConstList): TGDALMDArrayH; cdecl; external libgdal;
function GDALGroupDeleteMDArray(hGroup: TGDALGroupH; pszName: pchar; papszOptions: TCSLConstList): boolean; cdecl; external libgdal;
function GDALGroupCreateAttribute(hGroup: TGDALGroupH; pszName: pchar; nDimensions: Tsize_t; panDimensions: PGUInt64; hEDT: TGDALExtendedDataTypeH;
  papszOptions: TCSLConstList): TGDALAttributeH; cdecl; external libgdal;
function GDALGroupDeleteAttribute(hGroup: TGDALGroupH; pszName: pchar; papszOptions: TCSLConstList): boolean; cdecl; external libgdal;
function GDALGroupRename(hGroup: TGDALGroupH; pszNewName: pchar): boolean; cdecl; external libgdal;
function GDALGroupSubsetDimensionFromSelection(hGroup: TGDALGroupH; pszSelection: pchar; papszOptions: TCSLConstList): TGDALGroupH; cdecl; external libgdal;
procedure GDALMDArrayRelease(hMDArray: TGDALMDArrayH); cdecl; external libgdal;
function GDALMDArrayGetName(hArray: TGDALMDArrayH): pchar; cdecl; external libgdal;
function GDALMDArrayGetFullName(hArray: TGDALMDArrayH): pchar; cdecl; external libgdal;
function GDALMDArrayGetTotalElementsCount(hArray: TGDALMDArrayH): TGUInt64; cdecl; external libgdal;
function GDALMDArrayGetDimensionCount(hArray: TGDALMDArrayH): Tsize_t; cdecl; external libgdal;
function GDALMDArrayGetDimensions(hArray: TGDALMDArrayH; pnCount: Psize_t): PGDALDimensionH; cdecl; external libgdal;
function GDALMDArrayGetDataType(hArray: TGDALMDArrayH): TGDALExtendedDataTypeH; cdecl; external libgdal;
function GDALMDArrayRead(hArray: TGDALMDArrayH; arrayStartIdx: PGUInt64; count: Psize_t; arrayStep: PGInt64; bufferStride: PGPtrDiff_t;
  bufferDatatype: TGDALExtendedDataTypeH; pDstBuffer: pointer; pDstBufferAllocStart: pointer; nDstBufferllocSize: Tsize_t): longint; cdecl; external libgdal;
function GDALMDArrayWrite(hArray: TGDALMDArrayH; arrayStartIdx: PGUInt64; count: Psize_t; arrayStep: PGInt64; bufferStride: PGPtrDiff_t;
  bufferDatatype: TGDALExtendedDataTypeH; pSrcBuffer: pointer; psrcBufferAllocStart: pointer; nSrcBufferllocSize: Tsize_t): longint; cdecl; external libgdal;
function GDALMDArrayAdviseRead(hArray: TGDALMDArrayH; arrayStartIdx: PGUInt64; count: Psize_t): longint; cdecl; external libgdal;
function GDALMDArrayAdviseReadEx(hArray: TGDALMDArrayH; arrayStartIdx: PGUInt64; count: Psize_t; papszOptions: TCSLConstList): longint; cdecl; external libgdal;
function GDALMDArrayGetAttribute(hArray: TGDALMDArrayH; pszName: pchar): TGDALAttributeH; cdecl; external libgdal;
function GDALMDArrayGetAttributes(hArray: TGDALMDArrayH; pnCount: Psize_t; papszOptions: TCSLConstList): PGDALAttributeH; cdecl; external libgdal;
function GDALMDArrayCreateAttribute(hArray: TGDALMDArrayH; pszName: pchar; nDimensions: Tsize_t; panDimensions: PGUInt64; hEDT: TGDALExtendedDataTypeH;
  papszOptions: TCSLConstList): TGDALAttributeH; cdecl; external libgdal;
function GDALMDArrayDeleteAttribute(hArray: TGDALMDArrayH; pszName: pchar; papszOptions: TCSLConstList): boolean; cdecl; external libgdal;
function GDALMDArrayResize(hArray: TGDALMDArrayH; panNewDimSizes: PGUInt64; papszOptions: TCSLConstList): boolean; cdecl; external libgdal;
function GDALMDArrayGetRawNoDataValue(hArray: TGDALMDArrayH): pointer; cdecl; external libgdal;
function GDALMDArrayGetNoDataValueAsDouble(hArray: TGDALMDArrayH; pbHasNoDataValue: Plongint): double; cdecl; external libgdal;
function GDALMDArrayGetNoDataValueAsInt64(hArray: TGDALMDArrayH; pbHasNoDataValue: Plongint): Tint64_t; cdecl; external libgdal;
function GDALMDArrayGetNoDataValueAsUInt64(hArray: TGDALMDArrayH; pbHasNoDataValue: Plongint): Tuint64_t; cdecl; external libgdal;
function GDALMDArraySetRawNoDataValue(hArray: TGDALMDArrayH; para2: pointer): longint; cdecl; external libgdal;
function GDALMDArraySetNoDataValueAsDouble(hArray: TGDALMDArrayH; dfNoDataValue: double): longint; cdecl; external libgdal;
function GDALMDArraySetNoDataValueAsInt64(hArray: TGDALMDArrayH; nNoDataValue: Tint64_t): longint; cdecl; external libgdal;
function GDALMDArraySetNoDataValueAsUInt64(hArray: TGDALMDArrayH; nNoDataValue: Tuint64_t): longint; cdecl; external libgdal;
function GDALMDArraySetScale(hArray: TGDALMDArrayH; dfScale: double): longint; cdecl; external libgdal;
function GDALMDArraySetScaleEx(hArray: TGDALMDArrayH; dfScale: double; eStorageType: TGDALDataType): longint; cdecl; external libgdal;
function GDALMDArrayGetScale(hArray: TGDALMDArrayH; pbHasValue: Plongint): double; cdecl; external libgdal;
function GDALMDArrayGetScaleEx(hArray: TGDALMDArrayH; pbHasValue: Plongint; peStorageType: PGDALDataType): double; cdecl; external libgdal;
function GDALMDArraySetOffset(hArray: TGDALMDArrayH; dfOffset: double): longint; cdecl; external libgdal;
function GDALMDArraySetOffsetEx(hArray: TGDALMDArrayH; dfOffset: double; eStorageType: TGDALDataType): longint; cdecl; external libgdal;
function GDALMDArrayGetOffset(hArray: TGDALMDArrayH; pbHasValue: Plongint): double; cdecl; external libgdal;
function GDALMDArrayGetOffsetEx(hArray: TGDALMDArrayH; pbHasValue: Plongint; peStorageType: PGDALDataType): double; cdecl; external libgdal;
function GDALMDArrayGetBlockSize(hArray: TGDALMDArrayH; pnCount: Psize_t): PGUInt64; cdecl; external libgdal;
function GDALMDArraySetUnit(hArray: TGDALMDArrayH; para2: pchar): longint; cdecl; external libgdal;
function GDALMDArrayGetUnit(hArray: TGDALMDArrayH): pchar; cdecl; external libgdal;
function GDALMDArraySetSpatialRef(para1: TGDALMDArrayH; para2: TOGRSpatialReferenceH): longint; cdecl; external libgdal;
function GDALMDArrayGetSpatialRef(hArray: TGDALMDArrayH): TOGRSpatialReferenceH; cdecl; external libgdal;
function GDALMDArrayGetProcessingChunkSize(hArray: TGDALMDArrayH; pnCount: Psize_t; nMaxChunkMemory: Tsize_t): Psize_t; cdecl; external libgdal;
function GDALMDArrayGetStructuralInfo(hArray: TGDALMDArrayH): TCSLConstList; cdecl; external libgdal;
function GDALMDArrayGetView(hArray: TGDALMDArrayH; pszViewExpr: pchar): TGDALMDArrayH; cdecl; external libgdal;
function GDALMDArrayTranspose(hArray: TGDALMDArrayH; nNewAxisCount: Tsize_t; panMapNewAxisToOldAxis: Plongint): TGDALMDArrayH; cdecl; external libgdal;
function GDALMDArrayGetUnscaled(hArray: TGDALMDArrayH): TGDALMDArrayH; cdecl; external libgdal;
function GDALMDArrayGetMask(hArray: TGDALMDArrayH; papszOptions: TCSLConstList): TGDALMDArrayH; cdecl; external libgdal;
function GDALMDArrayAsClassicDataset(hArray: TGDALMDArrayH; iXDim: Tsize_t; iYDim: Tsize_t): TGDALDatasetH; cdecl; external libgdal;
function GDALMDArrayAsClassicDatasetEx(hArray: TGDALMDArrayH; iXDim: Tsize_t; iYDim: Tsize_t; hRootGroup: TGDALGroupH; papszOptions: TCSLConstList): TGDALDatasetH; cdecl; external libgdal;
function GDALMDArrayGetStatistics(hArray: TGDALMDArrayH; para2: TGDALDatasetH; bApproxOK: longint; bForce: longint; pdfMin: Pdouble;
  pdfMax: Pdouble; pdfMean: Pdouble; pdfStdDev: Pdouble; pnValidCount: PGUInt64; pfnProgress: TGDALProgressFunc;
  pProgressData: pointer): TCPLErr; cdecl; external libgdal;
function GDALMDArrayComputeStatistics(hArray: TGDALMDArrayH; para2: TGDALDatasetH; bApproxOK: longint; pdfMin: Pdouble; pdfMax: Pdouble;
  pdfMean: Pdouble; pdfStdDev: Pdouble; pnValidCount: PGUInt64; para9: TGDALProgressFunc; pProgressData: pointer): longint; cdecl; external libgdal;
function GDALMDArrayComputeStatisticsEx(hArray: TGDALMDArrayH; para2: TGDALDatasetH; bApproxOK: longint; pdfMin: Pdouble; pdfMax: Pdouble;
  pdfMean: Pdouble; pdfStdDev: Pdouble; pnValidCount: PGUInt64; para9: TGDALProgressFunc; pProgressData: pointer;
  papszOptions: TCSLConstList): longint; cdecl; external libgdal;
function GDALMDArrayGetResampled(hArray: TGDALMDArrayH; nNewDimCount: Tsize_t; pahNewDims: PGDALDimensionH; resampleAlg: TGDALRIOResampleAlg; hTargetSRS: TOGRSpatialReferenceH;
  papszOptions: TCSLConstList): TGDALMDArrayH; cdecl; external libgdal;
function GDALMDArrayGetGridded(hArray: TGDALMDArrayH; pszGridOptions: pchar; hXArray: TGDALMDArrayH; hYArray: TGDALMDArrayH; papszOptions: TCSLConstList): TGDALMDArrayH; cdecl; external libgdal;
function GDALMDArrayGetCoordinateVariables(hArray: TGDALMDArrayH; pnCount: Psize_t): PGDALMDArrayH; cdecl; external libgdal;
procedure GDALReleaseArrays(arrays: PGDALMDArrayH; nCount: Tsize_t); cdecl; external libgdal;
function GDALMDArrayCache(hArray: TGDALMDArrayH; papszOptions: TCSLConstList): longint; cdecl; external libgdal;
function GDALMDArrayRename(hArray: TGDALMDArrayH; pszNewName: pchar): boolean; cdecl; external libgdal;
procedure GDALAttributeRelease(hAttr: TGDALAttributeH); cdecl; external libgdal;
procedure GDALReleaseAttributes(attributes: PGDALAttributeH; nCount: Tsize_t); cdecl; external libgdal;
function GDALAttributeGetName(hAttr: TGDALAttributeH): pchar; cdecl; external libgdal;
function GDALAttributeGetFullName(hAttr: TGDALAttributeH): pchar; cdecl; external libgdal;
function GDALAttributeGetTotalElementsCount(hAttr: TGDALAttributeH): TGUInt64; cdecl; external libgdal;
function GDALAttributeGetDimensionCount(hAttr: TGDALAttributeH): Tsize_t; cdecl; external libgdal;
function GDALAttributeGetDimensionsSize(hAttr: TGDALAttributeH; pnCount: Psize_t): PGUInt64; cdecl; external libgdal;
function GDALAttributeGetDataType(hAttr: TGDALAttributeH): TGDALExtendedDataTypeH; cdecl; external libgdal;
function GDALAttributeReadAsRaw(hAttr: TGDALAttributeH; pnSize: Psize_t): PGByte; cdecl; external libgdal;
procedure GDALAttributeFreeRawResult(hAttr: TGDALAttributeH; raw: PGByte; nSize: Tsize_t); cdecl; external libgdal;
function GDALAttributeReadAsString(hAttr: TGDALAttributeH): pchar; cdecl; external libgdal;
function GDALAttributeReadAsInt(hAttr: TGDALAttributeH): longint; cdecl; external libgdal;
function GDALAttributeReadAsDouble(hAttr: TGDALAttributeH): double; cdecl; external libgdal;
function GDALAttributeReadAsStringArray(hAttr: TGDALAttributeH): Ppchar; cdecl; external libgdal;
function GDALAttributeReadAsIntArray(hAttr: TGDALAttributeH; pnCount: Psize_t): Plongint; cdecl; external libgdal;
function GDALAttributeReadAsDoubleArray(hAttr: TGDALAttributeH; pnCount: Psize_t): Pdouble; cdecl; external libgdal;
function GDALAttributeWriteRaw(hAttr: TGDALAttributeH; para2: pointer; para3: Tsize_t): longint; cdecl; external libgdal;
function GDALAttributeWriteString(hAttr: TGDALAttributeH; para2: pchar): longint; cdecl; external libgdal;
function GDALAttributeWriteStringArray(hAttr: TGDALAttributeH; para2: TCSLConstList): longint; cdecl; external libgdal;
function GDALAttributeWriteInt(hAttr: TGDALAttributeH; para2: longint): longint; cdecl; external libgdal;
function GDALAttributeWriteDouble(hAttr: TGDALAttributeH; para2: double): longint; cdecl; external libgdal;
function GDALAttributeWriteDoubleArray(hAttr: TGDALAttributeH; para2: Pdouble; para3: Tsize_t): longint; cdecl; external libgdal;
function GDALAttributeRename(hAttr: TGDALAttributeH; pszNewName: pchar): boolean; cdecl; external libgdal;
procedure GDALDimensionRelease(hDim: TGDALDimensionH); cdecl; external libgdal;
procedure GDALReleaseDimensions(dims: PGDALDimensionH; nCount: Tsize_t); cdecl; external libgdal;
function GDALDimensionGetName(hDim: TGDALDimensionH): pchar; cdecl; external libgdal;
function GDALDimensionGetFullName(hDim: TGDALDimensionH): pchar; cdecl; external libgdal;
function GDALDimensionGetType(hDim: TGDALDimensionH): pchar; cdecl; external libgdal;
function GDALDimensionGetDirection(hDim: TGDALDimensionH): pchar; cdecl; external libgdal;
function GDALDimensionGetSize(hDim: TGDALDimensionH): TGUInt64; cdecl; external libgdal;
function GDALDimensionGetIndexingVariable(hDim: TGDALDimensionH): TGDALMDArrayH; cdecl; external libgdal;
function GDALDimensionSetIndexingVariable(hDim: TGDALDimensionH; hArray: TGDALMDArrayH): longint; cdecl; external libgdal;
function GDALDimensionRename(hDim: TGDALDimensionH; pszNewName: pchar): boolean; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:32:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
