{$IFDEF read_interface}


type
  POGREnvelope = ^TOGREnvelope;
  TOGREnvelope = record
    MinX: double;
    MaxX: double;
    MinY: double;
    MaxY: double;
  end;

  POGREnvelope3D = ^TOGREnvelope3D;
  TOGREnvelope3D = record
    MinX: double;
    MaxX: double;
    MinY: double;
    MaxY: double;
    MinZ: double;
    MaxZ: double;
  end;

function OGRMalloc(para1: Tsize_t): pointer; cdecl; external libgdal; deprecated;
function OGRCalloc(para1: Tsize_t; para2: Tsize_t): pointer; cdecl; external libgdal; deprecated;
function OGRRealloc(para1: pointer; para2: Tsize_t): pointer; cdecl; external libgdal; deprecated;
function OGRStrdup(para1: pchar): pchar; cdecl; external libgdal; deprecated;
procedure OGRFree(para1: pointer); cdecl; external libgdal; deprecated;

type
  POGRErr = ^TOGRErr;
  TOGRErr = longint;
const
  OGRERR_NONE = 0;
  OGRERR_NOT_ENOUGH_DATA = 1;
  OGRERR_NOT_ENOUGH_MEMORY = 2;
  OGRERR_UNSUPPORTED_GEOMETRY_TYPE = 3;
  OGRERR_UNSUPPORTED_OPERATION = 4;
  OGRERR_CORRUPT_DATA = 5;
  OGRERR_FAILURE = 6;
  OGRERR_UNSUPPORTED_SRS = 7;
  OGRERR_INVALID_HANDLE = 8;
  OGRERR_NON_EXISTING_FEATURE = 9;

type
  POGRBoolean = ^TOGRBoolean;
  TOGRBoolean = longint;

type
  POGRwkbGeometryType = ^TOGRwkbGeometryType;
  TOGRwkbGeometryType = longint;
const
  wkbUnknown = 0;
  wkbPoint = 1;
  wkbLineString = 2;
  wkbPolygon = 3;
  wkbMultiPoint = 4;
  wkbMultiLineString = 5;
  wkbMultiPolygon = 6;
  wkbGeometryCollection = 7;
  wkbCircularString = 8;
  wkbCompoundCurve = 9;
  wkbCurvePolygon = 10;
  wkbMultiCurve = 11;
  wkbMultiSurface = 12;
  wkbCurve = 13;
  wkbSurface = 14;
  wkbPolyhedralSurface = 15;
  wkbTIN = 16;
  wkbTriangle = 17;
  wkbNone = 100;
  wkbLinearRing = 101;
  wkbCircularStringZ = 1008;
  wkbCompoundCurveZ = 1009;
  wkbCurvePolygonZ = 1010;
  wkbMultiCurveZ = 1011;
  wkbMultiSurfaceZ = 1012;
  wkbCurveZ = 1013;
  wkbSurfaceZ = 1014;
  wkbPolyhedralSurfaceZ = 1015;
  wkbTINZ = 1016;
  wkbTriangleZ = 1017;
  wkbPointM = 2001;
  wkbLineStringM = 2002;
  wkbPolygonM = 2003;
  wkbMultiPointM = 2004;
  wkbMultiLineStringM = 2005;
  wkbMultiPolygonM = 2006;
  wkbGeometryCollectionM = 2007;
  wkbCircularStringM = 2008;
  wkbCompoundCurveM = 2009;
  wkbCurvePolygonM = 2010;
  wkbMultiCurveM = 2011;
  wkbMultiSurfaceM = 2012;
  wkbCurveM = 2013;
  wkbSurfaceM = 2014;
  wkbPolyhedralSurfaceM = 2015;
  wkbTINM = 2016;
  wkbTriangleM = 2017;
  wkbPointZM = 3001;
  wkbLineStringZM = 3002;
  wkbPolygonZM = 3003;
  wkbMultiPointZM = 3004;
  wkbMultiLineStringZM = 3005;
  wkbMultiPolygonZM = 3006;
  wkbGeometryCollectionZM = 3007;
  wkbCircularStringZM = 3008;
  wkbCompoundCurveZM = 3009;
  wkbCurvePolygonZM = 3010;
  wkbMultiCurveZM = 3011;
  wkbMultiSurfaceZM = 3012;
  wkbCurveZM = 3013;
  wkbSurfaceZM = 3014;
  wkbPolyhedralSurfaceZM = 3015;
  wkbTINZM = 3016;
  wkbTriangleZM = 3017;
  wkbPoint25D = $80000001;
  wkbLineString25D = $80000002;
  wkbPolygon25D = $80000003;
  wkbMultiPoint25D = $80000004;
  wkbMultiLineString25D = $80000005;
  wkbMultiPolygon25D = $80000006;
  wkbGeometryCollection25D = $80000007;

type
  POGRwkbVariant = ^TOGRwkbVariant;
  TOGRwkbVariant = longint;
const
  wkbVariantOldOgc = 0;
  wkbVariantIso = 1;
  wkbVariantPostGIS1 = 2;

const
  wkb25DBit = $80000000;

const
  ogrZMarker = $21125711;

function OGRGeometryTypeToName(eType: TOGRwkbGeometryType): pchar; cdecl; external libgdal;
function OGRMergeGeometryTypes(eMain: TOGRwkbGeometryType; eExtra: TOGRwkbGeometryType): TOGRwkbGeometryType; cdecl; external libgdal;
function OGRMergeGeometryTypesEx(eMain: TOGRwkbGeometryType; eExtra: TOGRwkbGeometryType; bAllowPromotingToCurves: longint): TOGRwkbGeometryType; cdecl; external libgdal;
function OGR_GT_Flatten(eType: TOGRwkbGeometryType): TOGRwkbGeometryType; cdecl; external libgdal;
function OGR_GT_SetZ(eType: TOGRwkbGeometryType): TOGRwkbGeometryType; cdecl; external libgdal;
function OGR_GT_SetM(eType: TOGRwkbGeometryType): TOGRwkbGeometryType; cdecl; external libgdal;
function OGR_GT_SetModifier(eType: TOGRwkbGeometryType; bSetZ: longint; bSetM: longint): TOGRwkbGeometryType; cdecl; external libgdal;
function OGR_GT_HasZ(eType: TOGRwkbGeometryType): longint; cdecl; external libgdal;
function OGR_GT_HasM(eType: TOGRwkbGeometryType): longint; cdecl; external libgdal;
function OGR_GT_IsSubClassOf(eType: TOGRwkbGeometryType; eSuperType: TOGRwkbGeometryType): longint; cdecl; external libgdal;
function OGR_GT_IsCurve(para1: TOGRwkbGeometryType): longint; cdecl; external libgdal;
function OGR_GT_IsSurface(para1: TOGRwkbGeometryType): longint; cdecl; external libgdal;
function OGR_GT_IsNonLinear(para1: TOGRwkbGeometryType): longint; cdecl; external libgdal;
function OGR_GT_GetCollection(eType: TOGRwkbGeometryType): TOGRwkbGeometryType; cdecl; external libgdal;
function OGR_GT_GetCurve(eType: TOGRwkbGeometryType): TOGRwkbGeometryType; cdecl; external libgdal;
function OGR_GT_GetLinear(eType: TOGRwkbGeometryType): TOGRwkbGeometryType; cdecl; external libgdal;

type
  POGRwkbByteOrder = ^TOGRwkbByteOrder;
  TOGRwkbByteOrder = longint;
const
  wkbXDR = 0;
  wkbNDR = 1;

const
  ALTER_NAME_FLAG = $1;
  ALTER_TYPE_FLAG = $2;
  ALTER_WIDTH_PRECISION_FLAG = $4;
  ALTER_NULLABLE_FLAG = $8;
  ALTER_DEFAULT_FLAG = $10;
  ALTER_UNIQUE_FLAG = $20;
  ALTER_DOMAIN_FLAG = $40;
  ALTER_ALTERNATIVE_NAME_FLAG = $80;
  ALTER_COMMENT_FLAG = $100;
  ALTER_ALL_FLAG = (((((((ALTER_NAME_FLAG or ALTER_TYPE_FLAG) or ALTER_WIDTH_PRECISION_FLAG) or ALTER_NULLABLE_FLAG) or ALTER_DEFAULT_FLAG) or ALTER_UNIQUE_FLAG) or ALTER_DOMAIN_FLAG) or ALTER_ALTERNATIVE_NAME_FLAG) or ALTER_COMMENT_FLAG;
  ALTER_GEOM_FIELD_DEFN_NAME_FLAG = $1000;
  ALTER_GEOM_FIELD_DEFN_TYPE_FLAG = $2000;
  ALTER_GEOM_FIELD_DEFN_NULLABLE_FLAG = $4000;
  ALTER_GEOM_FIELD_DEFN_SRS_FLAG = $8000;
  ALTER_GEOM_FIELD_DEFN_SRS_COORD_EPOCH_FLAG = $10000;
  ALTER_GEOM_FIELD_DEFN_ALL_FLAG = (((ALTER_GEOM_FIELD_DEFN_NAME_FLAG or ALTER_GEOM_FIELD_DEFN_TYPE_FLAG) or ALTER_GEOM_FIELD_DEFN_NULLABLE_FLAG) or ALTER_GEOM_FIELD_DEFN_SRS_FLAG) or ALTER_GEOM_FIELD_DEFN_SRS_COORD_EPOCH_FLAG;
  OGR_F_VAL_NULL = $00000001;
  OGR_F_VAL_GEOM_TYPE = $00000002;
  OGR_F_VAL_WIDTH = $00000004;
  OGR_F_VAL_ALLOW_NULL_WHEN_DEFAULT = $00000008;
  OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM = $00000010;
  OGR_F_VAL_ALL = $7FFFFFFF and (not (OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM));

type
  POGRFieldType = ^TOGRFieldType;
  TOGRFieldType = longint;
const
  OFTInteger = 0;
  OFTIntegerList = 1;
  OFTReal = 2;
  OFTRealList = 3;
  OFTString = 4;
  OFTStringList = 5;
  OFTWideString = 6;
  OFTWideStringList = 7;
  OFTBinary = 8;
  OFTDate = 9;
  OFTTime = 10;
  OFTDateTime = 11;
  OFTInteger64 = 12;
  OFTInteger64List = 13;
  OFTMaxType = 13;

type
  POGRFieldSubType = ^TOGRFieldSubType;
  TOGRFieldSubType = longint;
const
  OFSTNone = 0;
  OFSTBoolean = 1;
  OFSTInt16 = 2;
  OFSTFloat32 = 3;
  OFSTJSON = 4;
  OFSTUUID = 5;
  OFSTMaxSubType = 5;

type
  POGRJustification = ^TOGRJustification;
  TOGRJustification = longint;
const
  OJUndefined = 0;
  OJLeft = 1;
  OJRight = 2;

const
  OGRNullFID = -(1);
  OGRUnsetMarker = -(21121);
  OGRNullMarker = -(21122);
  OGR_TZFLAG_UNKNOWN = 0;
  OGR_TZFLAG_LOCALTIME = 1;
  OGR_TZFLAG_MIXED_TZ = 2;
  OGR_TZFLAG_UTC = 100;

type
  POGRField = ^TOGRField;
  TOGRField = record
    case longint of
      0: (integer: longint);
      1: (Integer64: TGIntBig);
      2: (real: double);
      3: (_String: pchar);
      4: (IntegerList: record
          nCount: longint;
          paList: Plongint;
          end);
      5: (Integer64List: record
          nCount: longint;
          paList: PGIntBig;
          end);
      6: (RealList: record
          nCount: longint;
          paList: Pdouble;
          end);
      7: (StringList: record
          nCount: longint;
          paList: ^pchar;
          end);
      8: (Binary: record
          nCount: longint;
          paData: PGByte;
          end);
      9: (Set_: record
          nMarker1: longint;
          nMarker2: longint;
          nMarker3: longint;
          end);
      10: (Date: record
          Year: TGInt16;
          Month: TGByte;
          Day: TGByte;
          Hour: TGByte;
          Minute: TGByte;
          TZFlag: TGByte;
          Reserved: TGByte;
          Second: single;
          end);
  end;

const
  OGRPARSEDATE_OPTION_LAX = 1;

function OGRParseDate(pszInput: pchar; psOutput: POGRField; nOptions: longint): longint; cdecl; external libgdal;

const
  OLCRandomRead = 'RandomRead';
  OLCSequentialWrite = 'SequentialWrite';
  OLCRandomWrite = 'RandomWrite';
  OLCFastSpatialFilter = 'FastSpatialFilter';
  OLCFastFeatureCount = 'FastFeatureCount';
  OLCFastGetExtent = 'FastGetExtent';
  OLCCreateField = 'CreateField';
  OLCDeleteField = 'DeleteField';
  OLCReorderFields = 'ReorderFields';
  OLCAlterFieldDefn = 'AlterFieldDefn';
  OLCAlterGeomFieldDefn = 'AlterGeomFieldDefn';
  OLCTransactions = 'Transactions';
  OLCDeleteFeature = 'DeleteFeature';
  OLCUpsertFeature = 'UpsertFeature';
  OLCUpdateFeature = 'UpdateFeature';
  OLCFastSetNextByIndex = 'FastSetNextByIndex';
  OLCStringsAsUTF8 = 'StringsAsUTF8';
  OLCIgnoreFields = 'IgnoreFields';
  OLCCreateGeomField = 'CreateGeomField';
  OLCCurveGeometries = 'CurveGeometries';
  OLCMeasuredGeometries = 'MeasuredGeometries';
  OLCZGeometries = 'ZGeometries';
  OLCRename = 'Rename';
  OLCFastGetArrowStream = 'FastGetArrowStream';
  OLCFastWriteArrowBatch = 'FastWriteArrowBatch';
  ODsCCreateLayer = 'CreateLayer';
  ODsCDeleteLayer = 'DeleteLayer';
  ODsCCreateGeomFieldAfterCreateLayer = 'CreateGeomFieldAfterCreateLayer';
  ODsCCurveGeometries = 'CurveGeometries';
  ODsCTransactions = 'Transactions';
  ODsCEmulatedTransactions = 'EmulatedTransactions';
  ODsCMeasuredGeometries = 'MeasuredGeometries';
  ODsCZGeometries = 'ZGeometries';
  ODsCRandomLayerRead = 'RandomLayerRead';
  ODsCRandomLayerWrite = 'RandomLayerWrite ';
  ODsCAddFieldDomain = 'AddFieldDomain';
  ODsCDeleteFieldDomain = 'DeleteFieldDomain';
  ODsCUpdateFieldDomain = 'UpdateFieldDomain';
  ODrCCreateDataSource = 'CreateDataSource';
  ODrCDeleteDataSource = 'DeleteDataSource';

  OLMD_FID64 = 'OLMD_FID64';

type
  Pogr_style_tool_class_id = ^Togr_style_tool_class_id;
  Togr_style_tool_class_id = longint;
const
  OGRSTCNone = 0;
  OGRSTCPen = 1;
  OGRSTCBrush = 2;
  OGRSTCSymbol = 3;
  OGRSTCLabel = 4;
  OGRSTCVector = 5;

type
  TOGRSTClassId = Togr_style_tool_class_id;
  POGRSTClassId = ^TOGRSTClassId;

type
  Pogr_style_tool_units_id = ^Togr_style_tool_units_id;
  Togr_style_tool_units_id = longint;
const
  OGRSTUGround = 0;
  OGRSTUPixel = 1;
  OGRSTUPoints = 2;
  OGRSTUMM = 3;
  OGRSTUCM = 4;
  OGRSTUInches = 5;

type
  TOGRSTUnitId = Togr_style_tool_units_id;
  POGRSTUnitId = ^TOGRSTUnitId;

type
  Pogr_style_tool_param_pen_id = ^Togr_style_tool_param_pen_id;
  Togr_style_tool_param_pen_id = longint;
const
  OGRSTPenColor = 0;
  OGRSTPenWidth = 1;
  OGRSTPenPattern = 2;
  OGRSTPenId = 3;
  OGRSTPenPerOffset = 4;
  OGRSTPenCap = 5;
  OGRSTPenJoin = 6;
  OGRSTPenPriority = 7;
  OGRSTPenLast = 8;

type
  TOGRSTPenParam = Togr_style_tool_param_pen_id;
  POGRSTPenParam = ^TOGRSTPenParam;

type
  Pogr_style_tool_param_brush_id = ^Togr_style_tool_param_brush_id;
  Togr_style_tool_param_brush_id = longint;
const
  OGRSTBrushFColor = 0;
  OGRSTBrushBColor = 1;
  OGRSTBrushId = 2;
  OGRSTBrushAngle = 3;
  OGRSTBrushSize = 4;
  OGRSTBrushDx = 5;
  OGRSTBrushDy = 6;
  OGRSTBrushPriority = 7;
  OGRSTBrushLast = 8;

type
  TOGRSTBrushParam = Togr_style_tool_param_brush_id;
  POGRSTBrushParam = ^TOGRSTBrushParam;

type
  Pogr_style_tool_param_symbol_id = ^Togr_style_tool_param_symbol_id;
  Togr_style_tool_param_symbol_id = longint;
const
  OGRSTSymbolId = 0;
  OGRSTSymbolAngle = 1;
  OGRSTSymbolColor = 2;
  OGRSTSymbolSize = 3;
  OGRSTSymbolDx = 4;
  OGRSTSymbolDy = 5;
  OGRSTSymbolStep = 6;
  OGRSTSymbolPerp = 7;
  OGRSTSymbolOffset = 8;
  OGRSTSymbolPriority = 9;
  OGRSTSymbolFontName = 10;
  OGRSTSymbolOColor = 11;
  OGRSTSymbolLast = 12;

type
  TOGRSTSymbolParam = Togr_style_tool_param_symbol_id;
  POGRSTSymbolParam = ^TOGRSTSymbolParam;

type
  Pogr_style_tool_param_label_id = ^Togr_style_tool_param_label_id;
  Togr_style_tool_param_label_id = longint;
const
  OGRSTLabelFontName = 0;
  OGRSTLabelSize = 1;
  OGRSTLabelTextString = 2;
  OGRSTLabelAngle = 3;
  OGRSTLabelFColor = 4;
  OGRSTLabelBColor = 5;
  OGRSTLabelPlacement = 6;
  OGRSTLabelAnchor = 7;
  OGRSTLabelDx = 8;
  OGRSTLabelDy = 9;
  OGRSTLabelPerp = 10;
  OGRSTLabelBold = 11;
  OGRSTLabelItalic = 12;
  OGRSTLabelUnderline = 13;
  OGRSTLabelPriority = 14;
  OGRSTLabelStrikeout = 15;
  OGRSTLabelStretch = 16;
  OGRSTLabelAdjHor = 17;
  OGRSTLabelAdjVert = 18;
  OGRSTLabelHColor = 19;
  OGRSTLabelOColor = 20;
  OGRSTLabelLast = 21;

type
  TOGRSTLabelParam = Togr_style_tool_param_label_id;
  POGRSTLabelParam = ^TOGRSTLabelParam;

type
  POGRCodedValue = ^TOGRCodedValue;
  TOGRCodedValue = record
    pszCode: pchar;
    pszValue: pchar;
  end;

type
  POGRFieldDomainType = ^TOGRFieldDomainType;
  TOGRFieldDomainType = longint;
const
  OFDT_CODED = 0;
  OFDT_RANGE = 1;
  OFDT_GLOB = 2;

type
  POGRFieldDomainSplitPolicy = ^TOGRFieldDomainSplitPolicy;
  TOGRFieldDomainSplitPolicy = longint;
const
  OFDSP_DEFAULT_VALUE = 0;
  OFDSP_DUPLICATE = 1;
  OFDSP_GEOMETRY_RATIO = 2;

type
  POGRFieldDomainMergePolicy = ^TOGRFieldDomainMergePolicy;
  TOGRFieldDomainMergePolicy = longint;
const
  OFDMP_DEFAULT_VALUE = 0;
  OFDMP_SUM = 1;
  OFDMP_GEOMETRY_WEIGHTED = 2;

function GDALVersionInfo(para1: pchar): pchar; cdecl; external libgdal;
function GDALCheckVersion(nVersionMajor: longint; nVersionMinor: longint; pszCallingComponentName: pchar): longint; cdecl; external libgdal;


// === Konventiert am: 2-10-26 16:54:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
