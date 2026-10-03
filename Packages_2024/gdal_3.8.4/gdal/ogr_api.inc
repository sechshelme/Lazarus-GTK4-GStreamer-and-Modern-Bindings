{$IFDEF read_interface}


function OGRGetGEOSVersion(pnMajor: Plongint; pnMinor: Plongint; pnPatch: Plongint): boolean; cdecl; external libgdal;

type
  POGRGeometryH = ^TOGRGeometryH;
  TOGRGeometryH = pointer;

function OGR_G_CreateFromWkb(para1: pointer; para2: TOGRSpatialReferenceH; para3: POGRGeometryH; para4: longint): TOGRErr; cdecl; external libgdal;
function OGR_G_CreateFromWkbEx(para1: pointer; para2: TOGRSpatialReferenceH; para3: POGRGeometryH; para4: Tsize_t): TOGRErr; cdecl; external libgdal;
function OGR_G_CreateFromWkt(para1: PPchar; para2: TOGRSpatialReferenceH; para3: POGRGeometryH): TOGRErr; cdecl; external libgdal;
function OGR_G_CreateFromFgf(para1: pointer; para2: TOGRSpatialReferenceH; para3: POGRGeometryH; para4: longint; para5: Plongint): TOGRErr; cdecl; external libgdal;
procedure OGR_G_DestroyGeometry(para1: TOGRGeometryH); cdecl; external libgdal;
function OGR_G_CreateGeometry(para1: TOGRwkbGeometryType): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_ApproximateArcAngles(dfCenterX: double; dfCenterY: double; dfZ: double; dfPrimaryRadius: double; dfSecondaryAxis: double;
  dfRotation: double; dfStartAngle: double; dfEndAngle: double; dfMaxAngleStepSizeDegrees: double): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_ForceToPolygon(para1: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_ForceToLineString(para1: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_ForceToMultiPolygon(para1: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_ForceToMultiPoint(para1: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_ForceToMultiLineString(para1: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_ForceTo(hGeom: TOGRGeometryH; eTargetType: TOGRwkbGeometryType; papszOptions: PPchar): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_RemoveLowerDimensionSubGeoms(hGeom: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_GetDimension(para1: TOGRGeometryH): longint; cdecl; external libgdal;
function OGR_G_GetCoordinateDimension(para1: TOGRGeometryH): longint; cdecl; external libgdal;
function OGR_G_CoordinateDimension(para1: TOGRGeometryH): longint; cdecl; external libgdal;
procedure OGR_G_SetCoordinateDimension(para1: TOGRGeometryH; para2: longint); cdecl; external libgdal;
function OGR_G_Is3D(para1: TOGRGeometryH): longint; cdecl; external libgdal;
function OGR_G_IsMeasured(para1: TOGRGeometryH): longint; cdecl; external libgdal;
procedure OGR_G_Set3D(para1: TOGRGeometryH; para2: longint); cdecl; external libgdal;
procedure OGR_G_SetMeasured(para1: TOGRGeometryH; para2: longint); cdecl; external libgdal;
function OGR_G_Clone(para1: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
procedure OGR_G_GetEnvelope(para1: TOGRGeometryH; para2: POGREnvelope); cdecl; external libgdal;
procedure OGR_G_GetEnvelope3D(para1: TOGRGeometryH; para2: POGREnvelope3D); cdecl; external libgdal;
function OGR_G_ImportFromWkb(para1: TOGRGeometryH; para2: pointer; para3: longint): TOGRErr; cdecl; external libgdal;
function OGR_G_ExportToWkb(para1: TOGRGeometryH; para2: TOGRwkbByteOrder; para3: pbyte): TOGRErr; cdecl; external libgdal;
function OGR_G_ExportToIsoWkb(para1: TOGRGeometryH; para2: TOGRwkbByteOrder; para3: pbyte): TOGRErr; cdecl; external libgdal;
function OGR_G_WkbSize(hGeom: TOGRGeometryH): longint; cdecl; external libgdal;
function OGR_G_WkbSizeEx(hGeom: TOGRGeometryH): Tsize_t; cdecl; external libgdal;
function OGR_G_ImportFromWkt(para1: TOGRGeometryH; para2: PPchar): TOGRErr; cdecl; external libgdal;
function OGR_G_ExportToWkt(para1: TOGRGeometryH; para2: PPchar): TOGRErr; cdecl; external libgdal;
function OGR_G_ExportToIsoWkt(para1: TOGRGeometryH; para2: PPchar): TOGRErr; cdecl; external libgdal;
function OGR_G_GetGeometryType(para1: TOGRGeometryH): TOGRwkbGeometryType; cdecl; external libgdal;
function OGR_G_GetGeometryName(para1: TOGRGeometryH): pchar; cdecl; external libgdal;
procedure OGR_G_DumpReadable(para1: TOGRGeometryH; para2: PFILE; para3: pchar); cdecl; external libgdal;
procedure OGR_G_FlattenTo2D(para1: TOGRGeometryH); cdecl; external libgdal;
procedure OGR_G_CloseRings(para1: TOGRGeometryH); cdecl; external libgdal;
function OGR_G_CreateFromGML(para1: pchar): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_ExportToGML(para1: TOGRGeometryH): pchar; cdecl; external libgdal;
function OGR_G_ExportToGMLEx(para1: TOGRGeometryH; papszOptions: PPchar): pchar; cdecl; external libgdal;
function OGR_G_CreateFromGMLTree(para1: PCPLXMLNode): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_ExportToGMLTree(para1: TOGRGeometryH): PCPLXMLNode; cdecl; external libgdal;
function OGR_G_ExportEnvelopeToGMLTree(para1: TOGRGeometryH): PCPLXMLNode; cdecl; external libgdal;
function OGR_G_ExportToKML(para1: TOGRGeometryH; pszAltitudeMode: pchar): pchar; cdecl; external libgdal;
function OGR_G_ExportToJson(para1: TOGRGeometryH): pchar; cdecl; external libgdal;
function OGR_G_ExportToJsonEx(para1: TOGRGeometryH; papszOptions: PPchar): pchar; cdecl; external libgdal;
function OGR_G_CreateGeometryFromJson(para1: pchar): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_CreateGeometryFromEsriJson(para1: pchar): TOGRGeometryH; cdecl; external libgdal;
procedure OGR_G_AssignSpatialReference(para1: TOGRGeometryH; para2: TOGRSpatialReferenceH); cdecl; external libgdal;
function OGR_G_GetSpatialReference(para1: TOGRGeometryH): TOGRSpatialReferenceH; cdecl; external libgdal;
function OGR_G_Transform(para1: TOGRGeometryH; para2: TOGRCoordinateTransformationH): TOGRErr; cdecl; external libgdal;
function OGR_G_TransformTo(para1: TOGRGeometryH; para2: TOGRSpatialReferenceH): TOGRErr; cdecl; external libgdal;

type
  POGRGeomTransformerH = ^TOGRGeomTransformerH;
  TOGRGeomTransformerH = type Pointer;

function OGR_GeomTransformer_Create(para1: TOGRCoordinateTransformationH; papszOptions: TCSLConstList): TOGRGeomTransformerH; cdecl; external libgdal;
function OGR_GeomTransformer_Transform(hTransformer: TOGRGeomTransformerH; hGeom: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
procedure OGR_GeomTransformer_Destroy(hTransformer: TOGRGeomTransformerH); cdecl; external libgdal;
function OGR_G_Simplify(hThis: TOGRGeometryH; tolerance: double): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_SimplifyPreserveTopology(hThis: TOGRGeometryH; tolerance: double): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_DelaunayTriangulation(hThis: TOGRGeometryH; dfTolerance: double; bOnlyEdges: longint): TOGRGeometryH; cdecl; external libgdal;
procedure OGR_G_Segmentize(hGeom: TOGRGeometryH; dfMaxLength: double); cdecl; external libgdal;
function OGR_G_Intersects(para1: TOGRGeometryH; para2: TOGRGeometryH): longint; cdecl; external libgdal;
function OGR_G_Equals(para1: TOGRGeometryH; para2: TOGRGeometryH): longint; cdecl; external libgdal;
function OGR_G_Disjoint(para1: TOGRGeometryH; para2: TOGRGeometryH): longint; cdecl; external libgdal;
function OGR_G_Touches(para1: TOGRGeometryH; para2: TOGRGeometryH): longint; cdecl; external libgdal;
function OGR_G_Crosses(para1: TOGRGeometryH; para2: TOGRGeometryH): longint; cdecl; external libgdal;
function OGR_G_Within(para1: TOGRGeometryH; para2: TOGRGeometryH): longint; cdecl; external libgdal;
function OGR_G_Contains(para1: TOGRGeometryH; para2: TOGRGeometryH): longint; cdecl; external libgdal;
function OGR_G_Overlaps(para1: TOGRGeometryH; para2: TOGRGeometryH): longint; cdecl; external libgdal;
function OGR_G_Boundary(para1: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_ConvexHull(para1: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_ConcaveHull(para1: TOGRGeometryH; dfRatio: double; bAllowHoles: boolean): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_Buffer(para1: TOGRGeometryH; para2: double; para3: longint): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_Intersection(para1: TOGRGeometryH; para2: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_Union(para1: TOGRGeometryH; para2: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_UnionCascaded(para1: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_UnaryUnion(para1: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_PointOnSurface(para1: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_Difference(para1: TOGRGeometryH; para2: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_SymDifference(para1: TOGRGeometryH; para2: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_Distance(para1: TOGRGeometryH; para2: TOGRGeometryH): double; cdecl; external libgdal;
function OGR_G_Distance3D(para1: TOGRGeometryH; para2: TOGRGeometryH): double; cdecl; external libgdal;
function OGR_G_Length(para1: TOGRGeometryH): double; cdecl; external libgdal;
function OGR_G_Area(para1: TOGRGeometryH): double; cdecl; external libgdal;
function OGR_G_IsClockwise(hGeom: TOGRGeometryH): boolean; cdecl; external libgdal;
function OGR_G_Centroid(para1: TOGRGeometryH; para2: TOGRGeometryH): longint; cdecl; external libgdal;
function OGR_G_Value(para1: TOGRGeometryH; dfDistance: double): TOGRGeometryH; cdecl; external libgdal;
procedure OGR_G_Empty(para1: TOGRGeometryH); cdecl; external libgdal;
function OGR_G_IsEmpty(para1: TOGRGeometryH): longint; cdecl; external libgdal;
function OGR_G_IsValid(para1: TOGRGeometryH): longint; cdecl; external libgdal;
function OGR_G_MakeValid(para1: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_MakeValidEx(para1: TOGRGeometryH; para2: TCSLConstList): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_Normalize(para1: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_IsSimple(para1: TOGRGeometryH): longint; cdecl; external libgdal;
function OGR_G_IsRing(para1: TOGRGeometryH): longint; cdecl; external libgdal;
function OGR_G_Polygonize(para1: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_Intersect(para1: TOGRGeometryH; para2: TOGRGeometryH): longint; cdecl; external libgdal; deprecated;
function OGR_G_Equal(para1: TOGRGeometryH; para2: TOGRGeometryH): longint; cdecl; external libgdal; deprecated;
function OGR_G_SymmetricDifference(para1: TOGRGeometryH; para2: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal; deprecated;
function OGR_G_GetArea(para1: TOGRGeometryH): double; cdecl; external libgdal; deprecated;
function OGR_G_GetBoundary(para1: TOGRGeometryH): TOGRGeometryH; cdecl; external libgdal; deprecated;
function OGR_G_GetPointCount(para1: TOGRGeometryH): longint; cdecl; external libgdal;
function OGR_G_GetPoints(hGeom: TOGRGeometryH; pabyX: pointer; nXStride: longint; pabyY: pointer; nYStride: longint;
  pabyZ: pointer; nZStride: longint): longint; cdecl; external libgdal;
function OGR_G_GetPointsZM(hGeom: TOGRGeometryH; pabyX: pointer; nXStride: longint; pabyY: pointer; nYStride: longint;
  pabyZ: pointer; nZStride: longint; pabyM: pointer; nMStride: longint): longint; cdecl; external libgdal;
function OGR_G_GetX(para1: TOGRGeometryH; para2: longint): double; cdecl; external libgdal;
function OGR_G_GetY(para1: TOGRGeometryH; para2: longint): double; cdecl; external libgdal;
function OGR_G_GetZ(para1: TOGRGeometryH; para2: longint): double; cdecl; external libgdal;
function OGR_G_GetM(para1: TOGRGeometryH; para2: longint): double; cdecl; external libgdal;
procedure OGR_G_GetPoint(para1: TOGRGeometryH; iPoint: longint; para3: Pdouble; para4: Pdouble; para5: Pdouble); cdecl; external libgdal;
procedure OGR_G_GetPointZM(para1: TOGRGeometryH; iPoint: longint; para3: Pdouble; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libgdal;
procedure OGR_G_SetPointCount(hGeom: TOGRGeometryH; nNewPointCount: longint); cdecl; external libgdal;
procedure OGR_G_SetPoint(para1: TOGRGeometryH; iPoint: longint; para3: double; para4: double; para5: double); cdecl; external libgdal;
procedure OGR_G_SetPoint_2D(para1: TOGRGeometryH; iPoint: longint; para3: double; para4: double); cdecl; external libgdal;
procedure OGR_G_SetPointM(para1: TOGRGeometryH; iPoint: longint; para3: double; para4: double; para5: double); cdecl; external libgdal;
procedure OGR_G_SetPointZM(para1: TOGRGeometryH; iPoint: longint; para3: double; para4: double; para5: double;
  para6: double); cdecl; external libgdal;
procedure OGR_G_AddPoint(para1: TOGRGeometryH; para2: double; para3: double; para4: double); cdecl; external libgdal;
procedure OGR_G_AddPoint_2D(para1: TOGRGeometryH; para2: double; para3: double); cdecl; external libgdal;
procedure OGR_G_AddPointM(para1: TOGRGeometryH; para2: double; para3: double; para4: double); cdecl; external libgdal;
procedure OGR_G_AddPointZM(para1: TOGRGeometryH; para2: double; para3: double; para4: double; para5: double); cdecl; external libgdal;
procedure OGR_G_SetPoints(hGeom: TOGRGeometryH; nPointsIn: longint; pabyX: pointer; nXStride: longint; pabyY: pointer;
  nYStride: longint; pabyZ: pointer; nZStride: longint); cdecl; external libgdal;
procedure OGR_G_SetPointsZM(hGeom: TOGRGeometryH; nPointsIn: longint; pabyX: pointer; nXStride: longint; pabyY: pointer;
  nYStride: longint; pabyZ: pointer; nZStride: longint; pabyM: pointer; nMStride: longint); cdecl; external libgdal;
procedure OGR_G_SwapXY(hGeom: TOGRGeometryH); cdecl; external libgdal;
function OGR_G_GetGeometryCount(para1: TOGRGeometryH): longint; cdecl; external libgdal;
function OGR_G_GetGeometryRef(para1: TOGRGeometryH; para2: longint): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_AddGeometry(para1: TOGRGeometryH; para2: TOGRGeometryH): TOGRErr; cdecl; external libgdal;
function OGR_G_AddGeometryDirectly(para1: TOGRGeometryH; para2: TOGRGeometryH): TOGRErr; cdecl; external libgdal;
function OGR_G_RemoveGeometry(para1: TOGRGeometryH; para2: longint; para3: longint): TOGRErr; cdecl; external libgdal;
function OGR_G_HasCurveGeometry(para1: TOGRGeometryH; bLookForNonLinear: longint): longint; cdecl; external libgdal;
function OGR_G_GetLinearGeometry(hGeom: TOGRGeometryH; dfMaxAngleStepSizeDegrees: double; papszOptions: PPchar): TOGRGeometryH; cdecl; external libgdal;
function OGR_G_GetCurveGeometry(hGeom: TOGRGeometryH; papszOptions: PPchar): TOGRGeometryH; cdecl; external libgdal;
function OGRBuildPolygonFromEdges(hLinesAsCollection: TOGRGeometryH; bBestEffort: longint; bAutoClose: longint; dfTolerance: double; peErr: POGRErr): TOGRGeometryH; cdecl; external libgdal;
function OGRSetGenerate_DB2_V72_BYTE_ORDER(bGenerate_DB2_V72_BYTE_ORDER: longint): TOGRErr; cdecl; external libgdal;
function OGRGetGenerate_DB2_V72_BYTE_ORDER: longint; cdecl; external libgdal;
procedure OGRSetNonLinearGeometriesEnabledFlag(bFlag: longint); cdecl; external libgdal;
function OGRGetNonLinearGeometriesEnabledFlag: longint; cdecl; external libgdal;

type
  POGRPreparedGeometryH = ^TOGRPreparedGeometryH;
  TOGRPreparedGeometryH = type Pointer;

function OGRHasPreparedGeometrySupport: longint; cdecl; external libgdal;
function OGRCreatePreparedGeometry(hGeom: TOGRGeometryH): TOGRPreparedGeometryH; cdecl; external libgdal;
procedure OGRDestroyPreparedGeometry(hPreparedGeom: TOGRPreparedGeometryH); cdecl; external libgdal;
function OGRPreparedGeometryIntersects(hPreparedGeom: TOGRPreparedGeometryH; hOtherGeom: TOGRGeometryH): longint; cdecl; external libgdal;
function OGRPreparedGeometryContains(hPreparedGeom: TOGRPreparedGeometryH; hOtherGeom: TOGRGeometryH): longint; cdecl; external libgdal;

type
  POGRFieldDefnH = ^TOGRFieldDefnH;
  TOGRFieldDefnH = pointer;

  POGRFeatureDefnH = ^TOGRFeatureDefnH;
  TOGRFeatureDefnH = pointer;

  POGRFeatureH = ^TOGRFeatureH;
  TOGRFeatureH = pointer;

  POGRStyleTableH = ^TOGRStyleTableH;
  TOGRStyleTableH = pointer;

type
  POGRGeomFieldDefnH = ^TOGRGeomFieldDefnH;
  TOGRGeomFieldDefnH = type Pointer;

  POGRFieldDomainH = ^TOGRFieldDomainH;
  TOGRFieldDomainH = type Pointer;

function OGR_Fld_Create(para1: pchar; para2: TOGRFieldType): TOGRFieldDefnH; cdecl; external libgdal;
procedure OGR_Fld_Destroy(para1: TOGRFieldDefnH); cdecl; external libgdal;
procedure OGR_Fld_SetName(para1: TOGRFieldDefnH; para2: pchar); cdecl; external libgdal;
function OGR_Fld_GetNameRef(para1: TOGRFieldDefnH): pchar; cdecl; external libgdal;
procedure OGR_Fld_SetAlternativeName(para1: TOGRFieldDefnH; para2: pchar); cdecl; external libgdal;
function OGR_Fld_GetAlternativeNameRef(para1: TOGRFieldDefnH): pchar; cdecl; external libgdal;
function OGR_Fld_GetType(para1: TOGRFieldDefnH): TOGRFieldType; cdecl; external libgdal;
procedure OGR_Fld_SetType(para1: TOGRFieldDefnH; para2: TOGRFieldType); cdecl; external libgdal;
function OGR_Fld_GetSubType(para1: TOGRFieldDefnH): TOGRFieldSubType; cdecl; external libgdal;
procedure OGR_Fld_SetSubType(para1: TOGRFieldDefnH; para2: TOGRFieldSubType); cdecl; external libgdal;
function OGR_Fld_GetJustify(para1: TOGRFieldDefnH): TOGRJustification; cdecl; external libgdal;
procedure OGR_Fld_SetJustify(para1: TOGRFieldDefnH; para2: TOGRJustification); cdecl; external libgdal;
function OGR_Fld_GetWidth(para1: TOGRFieldDefnH): longint; cdecl; external libgdal;
procedure OGR_Fld_SetWidth(para1: TOGRFieldDefnH; para2: longint); cdecl; external libgdal;
function OGR_Fld_GetPrecision(para1: TOGRFieldDefnH): longint; cdecl; external libgdal;
procedure OGR_Fld_SetPrecision(para1: TOGRFieldDefnH; para2: longint); cdecl; external libgdal;
function OGR_Fld_GetTZFlag(para1: TOGRFieldDefnH): longint; cdecl; external libgdal;
procedure OGR_Fld_SetTZFlag(para1: TOGRFieldDefnH; para2: longint); cdecl; external libgdal;
procedure OGR_Fld_Set(para1: TOGRFieldDefnH; para2: pchar; para3: TOGRFieldType; para4: longint; para5: longint;
  para6: TOGRJustification); cdecl; external libgdal;
function OGR_Fld_IsIgnored(hDefn: TOGRFieldDefnH): longint; cdecl; external libgdal;
procedure OGR_Fld_SetIgnored(hDefn: TOGRFieldDefnH; para2: longint); cdecl; external libgdal;
function OGR_Fld_IsNullable(hDefn: TOGRFieldDefnH): longint; cdecl; external libgdal;
procedure OGR_Fld_SetNullable(hDefn: TOGRFieldDefnH; para2: longint); cdecl; external libgdal;
function OGR_Fld_IsUnique(hDefn: TOGRFieldDefnH): longint; cdecl; external libgdal;
procedure OGR_Fld_SetUnique(hDefn: TOGRFieldDefnH; para2: longint); cdecl; external libgdal;
function OGR_Fld_GetDefault(hDefn: TOGRFieldDefnH): pchar; cdecl; external libgdal;
procedure OGR_Fld_SetDefault(hDefn: TOGRFieldDefnH; para2: pchar); cdecl; external libgdal;
function OGR_Fld_IsDefaultDriverSpecific(hDefn: TOGRFieldDefnH): longint; cdecl; external libgdal;
function OGR_Fld_GetDomainName(hDefn: TOGRFieldDefnH): pchar; cdecl; external libgdal;
procedure OGR_Fld_SetDomainName(hDefn: TOGRFieldDefnH; para2: pchar); cdecl; external libgdal;
function OGR_Fld_GetComment(hDefn: TOGRFieldDefnH): pchar; cdecl; external libgdal;
procedure OGR_Fld_SetComment(hDefn: TOGRFieldDefnH; para2: pchar); cdecl; external libgdal;
function OGR_GetFieldTypeName(para1: TOGRFieldType): pchar; cdecl; external libgdal;
function OGR_GetFieldSubTypeName(para1: TOGRFieldSubType): pchar; cdecl; external libgdal;
function OGR_AreTypeSubTypeCompatible(eType: TOGRFieldType; eSubType: TOGRFieldSubType): longint; cdecl; external libgdal;

function OGR_GFld_Create(para1: pchar; para2: TOGRwkbGeometryType): TOGRGeomFieldDefnH; cdecl; external libgdal;
procedure OGR_GFld_Destroy(para1: TOGRGeomFieldDefnH); cdecl; external libgdal;
procedure OGR_GFld_SetName(para1: TOGRGeomFieldDefnH; para2: pchar); cdecl; external libgdal;
function OGR_GFld_GetNameRef(para1: TOGRGeomFieldDefnH): pchar; cdecl; external libgdal;
function OGR_GFld_GetType(para1: TOGRGeomFieldDefnH): TOGRwkbGeometryType; cdecl; external libgdal;
procedure OGR_GFld_SetType(para1: TOGRGeomFieldDefnH; para2: TOGRwkbGeometryType); cdecl; external libgdal;
function OGR_GFld_GetSpatialRef(para1: TOGRGeomFieldDefnH): TOGRSpatialReferenceH; cdecl; external libgdal;
procedure OGR_GFld_SetSpatialRef(para1: TOGRGeomFieldDefnH; hSRS: TOGRSpatialReferenceH); cdecl; external libgdal;
function OGR_GFld_IsNullable(hDefn: TOGRGeomFieldDefnH): longint; cdecl; external libgdal;
procedure OGR_GFld_SetNullable(hDefn: TOGRGeomFieldDefnH; para2: longint); cdecl; external libgdal;
function OGR_GFld_IsIgnored(hDefn: TOGRGeomFieldDefnH): longint; cdecl; external libgdal;
procedure OGR_GFld_SetIgnored(hDefn: TOGRGeomFieldDefnH; para2: longint); cdecl; external libgdal;

function OGR_FD_Create(para1: pchar): TOGRFeatureDefnH; cdecl; external libgdal;
procedure OGR_FD_Destroy(para1: TOGRFeatureDefnH); cdecl; external libgdal;
procedure OGR_FD_Release(para1: TOGRFeatureDefnH); cdecl; external libgdal;
function OGR_FD_GetName(para1: TOGRFeatureDefnH): pchar; cdecl; external libgdal;
function OGR_FD_GetFieldCount(para1: TOGRFeatureDefnH): longint; cdecl; external libgdal;
function OGR_FD_GetFieldDefn(para1: TOGRFeatureDefnH; para2: longint): TOGRFieldDefnH; cdecl; external libgdal;
function OGR_FD_GetFieldIndex(para1: TOGRFeatureDefnH; para2: pchar): longint; cdecl; external libgdal;
procedure OGR_FD_AddFieldDefn(para1: TOGRFeatureDefnH; para2: TOGRFieldDefnH); cdecl; external libgdal;
function OGR_FD_DeleteFieldDefn(hDefn: TOGRFeatureDefnH; iField: longint): TOGRErr; cdecl; external libgdal;
function OGR_FD_ReorderFieldDefns(hDefn: TOGRFeatureDefnH; panMap: Plongint): TOGRErr; cdecl; external libgdal;
function OGR_FD_GetGeomType(para1: TOGRFeatureDefnH): TOGRwkbGeometryType; cdecl; external libgdal;
procedure OGR_FD_SetGeomType(para1: TOGRFeatureDefnH; para2: TOGRwkbGeometryType); cdecl; external libgdal;
function OGR_FD_IsGeometryIgnored(para1: TOGRFeatureDefnH): longint; cdecl; external libgdal;
procedure OGR_FD_SetGeometryIgnored(para1: TOGRFeatureDefnH; para2: longint); cdecl; external libgdal;
function OGR_FD_IsStyleIgnored(para1: TOGRFeatureDefnH): longint; cdecl; external libgdal;
procedure OGR_FD_SetStyleIgnored(para1: TOGRFeatureDefnH; para2: longint); cdecl; external libgdal;
function OGR_FD_Reference(para1: TOGRFeatureDefnH): longint; cdecl; external libgdal;
function OGR_FD_Dereference(para1: TOGRFeatureDefnH): longint; cdecl; external libgdal;
function OGR_FD_GetReferenceCount(para1: TOGRFeatureDefnH): longint; cdecl; external libgdal;
function OGR_FD_GetGeomFieldCount(hFDefn: TOGRFeatureDefnH): longint; cdecl; external libgdal;
function OGR_FD_GetGeomFieldDefn(hFDefn: TOGRFeatureDefnH; i: longint): TOGRGeomFieldDefnH; cdecl; external libgdal;
function OGR_FD_GetGeomFieldIndex(hFDefn: TOGRFeatureDefnH; pszName: pchar): longint; cdecl; external libgdal;
procedure OGR_FD_AddGeomFieldDefn(hFDefn: TOGRFeatureDefnH; hGFldDefn: TOGRGeomFieldDefnH); cdecl; external libgdal;
function OGR_FD_DeleteGeomFieldDefn(hFDefn: TOGRFeatureDefnH; iGeomField: longint): TOGRErr; cdecl; external libgdal;
function OGR_FD_IsSame(hFDefn: TOGRFeatureDefnH; hOtherFDefn: TOGRFeatureDefnH): longint; cdecl; external libgdal;

function OGR_F_Create(para1: TOGRFeatureDefnH): TOGRFeatureH; cdecl; external libgdal;
procedure OGR_F_Destroy(para1: TOGRFeatureH); cdecl; external libgdal;
function OGR_F_GetDefnRef(para1: TOGRFeatureH): TOGRFeatureDefnH; cdecl; external libgdal;
function OGR_F_SetGeometryDirectly(para1: TOGRFeatureH; para2: TOGRGeometryH): TOGRErr; cdecl; external libgdal;
function OGR_F_SetGeometry(para1: TOGRFeatureH; para2: TOGRGeometryH): TOGRErr; cdecl; external libgdal;
function OGR_F_GetGeometryRef(para1: TOGRFeatureH): TOGRGeometryH; cdecl; external libgdal;
function OGR_F_StealGeometry(para1: TOGRFeatureH): TOGRGeometryH; cdecl; external libgdal;
function OGR_F_StealGeometryEx(para1: TOGRFeatureH; iGeomField: longint): TOGRGeometryH; cdecl; external libgdal;
function OGR_F_Clone(para1: TOGRFeatureH): TOGRFeatureH; cdecl; external libgdal;
function OGR_F_Equal(para1: TOGRFeatureH; para2: TOGRFeatureH): longint; cdecl; external libgdal;
function OGR_F_GetFieldCount(para1: TOGRFeatureH): longint; cdecl; external libgdal;
function OGR_F_GetFieldDefnRef(para1: TOGRFeatureH; para2: longint): TOGRFieldDefnH; cdecl; external libgdal;
function OGR_F_GetFieldIndex(para1: TOGRFeatureH; para2: pchar): longint; cdecl; external libgdal;
function OGR_F_IsFieldSet(para1: TOGRFeatureH; para2: longint): longint; cdecl; external libgdal;
procedure OGR_F_UnsetField(para1: TOGRFeatureH; para2: longint); cdecl; external libgdal;
function OGR_F_IsFieldNull(para1: TOGRFeatureH; para2: longint): longint; cdecl; external libgdal;
function OGR_F_IsFieldSetAndNotNull(para1: TOGRFeatureH; para2: longint): longint; cdecl; external libgdal;
procedure OGR_F_SetFieldNull(para1: TOGRFeatureH; para2: longint); cdecl; external libgdal;
function OGR_F_GetRawFieldRef(para1: TOGRFeatureH; para2: longint): POGRField; cdecl; external libgdal;
function OGR_RawField_IsUnset(para1: POGRField): longint; cdecl; external libgdal;
function OGR_RawField_IsNull(para1: POGRField): longint; cdecl; external libgdal;
procedure OGR_RawField_SetUnset(para1: POGRField); cdecl; external libgdal;
procedure OGR_RawField_SetNull(para1: POGRField); cdecl; external libgdal;
function OGR_F_GetFieldAsInteger(para1: TOGRFeatureH; para2: longint): longint; cdecl; external libgdal;
function OGR_F_GetFieldAsInteger64(para1: TOGRFeatureH; para2: longint): TGIntBig; cdecl; external libgdal;
function OGR_F_GetFieldAsDouble(para1: TOGRFeatureH; para2: longint): double; cdecl; external libgdal;
function OGR_F_GetFieldAsString(para1: TOGRFeatureH; para2: longint): pchar; cdecl; external libgdal;
function OGR_F_GetFieldAsISO8601DateTime(para1: TOGRFeatureH; para2: longint; para3: TCSLConstList): pchar; cdecl; external libgdal;
function OGR_F_GetFieldAsIntegerList(para1: TOGRFeatureH; para2: longint; para3: Plongint): Plongint; cdecl; external libgdal;
function OGR_F_GetFieldAsInteger64List(para1: TOGRFeatureH; para2: longint; para3: Plongint): PGIntBig; cdecl; external libgdal;
function OGR_F_GetFieldAsDoubleList(para1: TOGRFeatureH; para2: longint; para3: Plongint): Pdouble; cdecl; external libgdal;
function OGR_F_GetFieldAsStringList(para1: TOGRFeatureH; para2: longint): PPchar; cdecl; external libgdal;
function OGR_F_GetFieldAsBinary(para1: TOGRFeatureH; para2: longint; para3: Plongint): PGByte; cdecl; external libgdal;
function OGR_F_GetFieldAsDateTime(para1: TOGRFeatureH; para2: longint; para3: Plongint; para4: Plongint; para5: Plongint;
  para6: Plongint; para7: Plongint; para8: Plongint; para9: Plongint): longint; cdecl; external libgdal;
function OGR_F_GetFieldAsDateTimeEx(hFeat: TOGRFeatureH; iField: longint; pnYear: Plongint; pnMonth: Plongint; pnDay: Plongint;
  pnHour: Plongint; pnMinute: Plongint; pfSecond: Psingle; pnTZFlag: Plongint): longint; cdecl; external libgdal;
procedure OGR_F_SetFieldInteger(para1: TOGRFeatureH; para2: longint; para3: longint); cdecl; external libgdal;
procedure OGR_F_SetFieldInteger64(para1: TOGRFeatureH; para2: longint; para3: TGIntBig); cdecl; external libgdal;
procedure OGR_F_SetFieldDouble(para1: TOGRFeatureH; para2: longint; para3: double); cdecl; external libgdal;
procedure OGR_F_SetFieldString(para1: TOGRFeatureH; para2: longint; para3: pchar); cdecl; external libgdal;
procedure OGR_F_SetFieldIntegerList(para1: TOGRFeatureH; para2: longint; para3: longint; para4: Plongint); cdecl; external libgdal;
procedure OGR_F_SetFieldInteger64List(para1: TOGRFeatureH; para2: longint; para3: longint; para4: PGIntBig); cdecl; external libgdal;
procedure OGR_F_SetFieldDoubleList(para1: TOGRFeatureH; para2: longint; para3: longint; para4: Pdouble); cdecl; external libgdal;
procedure OGR_F_SetFieldStringList(para1: TOGRFeatureH; para2: longint; para3: TCSLConstList); cdecl; external libgdal;
procedure OGR_F_SetFieldRaw(para1: TOGRFeatureH; para2: longint; para3: POGRField); cdecl; external libgdal;
procedure OGR_F_SetFieldBinary(para1: TOGRFeatureH; para2: longint; para3: longint; para4: pointer); cdecl; external libgdal;
procedure OGR_F_SetFieldDateTime(para1: TOGRFeatureH; para2: longint; para3: longint; para4: longint; para5: longint;
  para6: longint; para7: longint; para8: longint; para9: longint); cdecl; external libgdal;
procedure OGR_F_SetFieldDateTimeEx(para1: TOGRFeatureH; para2: longint; para3: longint; para4: longint; para5: longint;
  para6: longint; para7: longint; para8: single; para9: longint); cdecl; external libgdal;
function OGR_F_GetGeomFieldCount(hFeat: TOGRFeatureH): longint; cdecl; external libgdal;
function OGR_F_GetGeomFieldDefnRef(hFeat: TOGRFeatureH; iField: longint): TOGRGeomFieldDefnH; cdecl; external libgdal;
function OGR_F_GetGeomFieldIndex(hFeat: TOGRFeatureH; pszName: pchar): longint; cdecl; external libgdal;
function OGR_F_GetGeomFieldRef(hFeat: TOGRFeatureH; iField: longint): TOGRGeometryH; cdecl; external libgdal;
function OGR_F_SetGeomFieldDirectly(hFeat: TOGRFeatureH; iField: longint; hGeom: TOGRGeometryH): TOGRErr; cdecl; external libgdal;
function OGR_F_SetGeomField(hFeat: TOGRFeatureH; iField: longint; hGeom: TOGRGeometryH): TOGRErr; cdecl; external libgdal;
function OGR_F_GetFID(para1: TOGRFeatureH): TGIntBig; cdecl; external libgdal;
function OGR_F_SetFID(para1: TOGRFeatureH; para2: TGIntBig): TOGRErr; cdecl; external libgdal;
procedure OGR_F_DumpReadable(para1: TOGRFeatureH; para2: PFILE); cdecl; external libgdal;
function OGR_F_DumpReadableAsString(para1: TOGRFeatureH; para2: TCSLConstList): pchar; cdecl; external libgdal;
function OGR_F_SetFrom(para1: TOGRFeatureH; para2: TOGRFeatureH; para3: longint): TOGRErr; cdecl; external libgdal;
function OGR_F_SetFromWithMap(para1: TOGRFeatureH; para2: TOGRFeatureH; para3: longint; para4: Plongint): TOGRErr; cdecl; external libgdal;
function OGR_F_GetStyleString(para1: TOGRFeatureH): pchar; cdecl; external libgdal;
procedure OGR_F_SetStyleString(para1: TOGRFeatureH; para2: pchar); cdecl; external libgdal;
procedure OGR_F_SetStyleStringDirectly(para1: TOGRFeatureH; para2: pchar); cdecl; external libgdal;
function OGR_F_GetStyleTable(para1: TOGRFeatureH): TOGRStyleTableH; cdecl; external libgdal;
procedure OGR_F_SetStyleTableDirectly(para1: TOGRFeatureH; para2: TOGRStyleTableH); cdecl; external libgdal;
procedure OGR_F_SetStyleTable(para1: TOGRFeatureH; para2: TOGRStyleTableH); cdecl; external libgdal;
function OGR_F_GetNativeData(para1: TOGRFeatureH): pchar; cdecl; external libgdal;
procedure OGR_F_SetNativeData(para1: TOGRFeatureH; para2: pchar); cdecl; external libgdal;
function OGR_F_GetNativeMediaType(para1: TOGRFeatureH): pchar; cdecl; external libgdal;
procedure OGR_F_SetNativeMediaType(para1: TOGRFeatureH; para2: pchar); cdecl; external libgdal;
procedure OGR_F_FillUnsetWithDefault(hFeat: TOGRFeatureH; bNotNullableOnly: longint; papszOptions: PPchar); cdecl; external libgdal;
function OGR_F_Validate(para1: TOGRFeatureH; nValidateFlags: longint; bEmitError: longint): longint; cdecl; external libgdal;

procedure OGR_FldDomain_Destroy(para1: TOGRFieldDomainH); cdecl; external libgdal;
function OGR_FldDomain_GetName(para1: TOGRFieldDomainH): pchar; cdecl; external libgdal;
function OGR_FldDomain_GetDescription(para1: TOGRFieldDomainH): pchar; cdecl; external libgdal;
function OGR_FldDomain_GetDomainType(para1: TOGRFieldDomainH): TOGRFieldDomainType; cdecl; external libgdal;
function OGR_FldDomain_GetFieldType(para1: TOGRFieldDomainH): TOGRFieldType; cdecl; external libgdal;
function OGR_FldDomain_GetFieldSubType(para1: TOGRFieldDomainH): TOGRFieldSubType; cdecl; external libgdal;
function OGR_FldDomain_GetSplitPolicy(para1: TOGRFieldDomainH): TOGRFieldDomainSplitPolicy; cdecl; external libgdal;
procedure OGR_FldDomain_SetSplitPolicy(para1: TOGRFieldDomainH; para2: TOGRFieldDomainSplitPolicy); cdecl; external libgdal;
function OGR_FldDomain_GetMergePolicy(para1: TOGRFieldDomainH): TOGRFieldDomainMergePolicy; cdecl; external libgdal;
procedure OGR_FldDomain_SetMergePolicy(para1: TOGRFieldDomainH; para2: TOGRFieldDomainMergePolicy); cdecl; external libgdal;
function OGR_CodedFldDomain_Create(pszName: pchar; pszDescription: pchar; eFieldType: TOGRFieldType; eFieldSubType: TOGRFieldSubType; enumeration: POGRCodedValue): TOGRFieldDomainH; cdecl; external libgdal;
function OGR_CodedFldDomain_GetEnumeration(para1: TOGRFieldDomainH): POGRCodedValue; cdecl; external libgdal;
function OGR_RangeFldDomain_Create(pszName: pchar; pszDescription: pchar; eFieldType: TOGRFieldType; eFieldSubType: TOGRFieldSubType; psMin: POGRField;
  bMinIsInclusive: boolean; psMax: POGRField; bMaxIsInclusive: boolean): TOGRFieldDomainH; cdecl; external libgdal;
function OGR_RangeFldDomain_GetMin(para1: TOGRFieldDomainH; pbIsInclusiveOut: PBoolean): POGRField; cdecl; external libgdal;
function OGR_RangeFldDomain_GetMax(para1: TOGRFieldDomainH; pbIsInclusiveOut: PBoolean): POGRField; cdecl; external libgdal;
function OGR_GlobFldDomain_Create(pszName: pchar; pszDescription: pchar; eFieldType: TOGRFieldType; eFieldSubType: TOGRFieldSubType; pszGlob: pchar): TOGRFieldDomainH; cdecl; external libgdal;
function OGR_GlobFldDomain_GetGlob(para1: TOGRFieldDomainH): pchar; cdecl; external libgdal;

type
  POGRLayerH = ^TOGRLayerH;
  TOGRLayerH = pointer;

  POGRDataSourceH = ^TOGRDataSourceH;
  TOGRDataSourceH = pointer;

  POGRSFDriverH = ^TOGRSFDriverH;
  TOGRSFDriverH = pointer;

function OGR_L_GetName(para1: TOGRLayerH): pchar; cdecl; external libgdal;
function OGR_L_GetGeomType(para1: TOGRLayerH): TOGRwkbGeometryType; cdecl; external libgdal;

type
  POGRGeometryTypeCounter = ^TOGRGeometryTypeCounter;
  TOGRGeometryTypeCounter = record
    eGeomType: TOGRwkbGeometryType;
    nCount: Tint64_t;
  end;

const
  OGR_GGT_COUNT_NOT_NEEDED = $1;
  OGR_GGT_STOP_IF_MIXED = $2;
  OGR_GGT_GEOMCOLLECTIONZ_TINZ = $4;

function OGR_L_GetGeometryTypes(hLayer: TOGRLayerH; iGeomField: longint; nFlags: longint; pnEntryCount: Plongint; pfnProgress: TGDALProgressFunc;
  pProgressData: pointer): POGRGeometryTypeCounter; cdecl; external libgdal;
function OGR_L_GetSpatialFilter(para1: TOGRLayerH): TOGRGeometryH; cdecl; external libgdal;
procedure OGR_L_SetSpatialFilter(para1: TOGRLayerH; para2: TOGRGeometryH); cdecl; external libgdal;
procedure OGR_L_SetSpatialFilterRect(para1: TOGRLayerH; para2: double; para3: double; para4: double; para5: double); cdecl; external libgdal;
procedure OGR_L_SetSpatialFilterEx(para1: TOGRLayerH; iGeomField: longint; hGeom: TOGRGeometryH); cdecl; external libgdal;
procedure OGR_L_SetSpatialFilterRectEx(para1: TOGRLayerH; iGeomField: longint; dfMinX: double; dfMinY: double; dfMaxX: double;
  dfMaxY: double); cdecl; external libgdal;
function OGR_L_SetAttributeFilter(para1: TOGRLayerH; para2: pchar): TOGRErr; cdecl; external libgdal;
procedure OGR_L_ResetReading(para1: TOGRLayerH); cdecl; external libgdal;
function OGR_L_GetNextFeature(para1: TOGRLayerH): TOGRFeatureH; cdecl; external libgdal;

function OGR_L_GetArrowStream(hLayer: TOGRLayerH; out_stream: PArrowArrayStream; papszOptions: PPchar): boolean; cdecl; external libgdal;
function OGR_L_IsArrowSchemaSupported(hLayer: TOGRLayerH; schema: PArrowSchema; papszOptions: PPchar; ppszErrorMsg: PPchar): boolean; cdecl; external libgdal;
function OGR_L_CreateFieldFromArrowSchema(hLayer: TOGRLayerH; schema: PArrowSchema; papszOptions: PPchar): boolean; cdecl; external libgdal;

function OGR_L_WriteArrowBatch(hLayer: TOGRLayerH; schema: PArrowSchema; arr: PArrowArray; papszOptions: PPchar): boolean; cdecl; external libgdal;
function OGR_L_SetNextByIndex(para1: TOGRLayerH; para2: TGIntBig): TOGRErr; cdecl; external libgdal;
function OGR_L_GetFeature(para1: TOGRLayerH; para2: TGIntBig): TOGRFeatureH; cdecl; external libgdal;
function OGR_L_SetFeature(para1: TOGRLayerH; para2: TOGRFeatureH): TOGRErr; cdecl; external libgdal;
function OGR_L_CreateFeature(para1: TOGRLayerH; para2: TOGRFeatureH): TOGRErr; cdecl; external libgdal;
function OGR_L_DeleteFeature(para1: TOGRLayerH; para2: TGIntBig): TOGRErr; cdecl; external libgdal;
function OGR_L_UpsertFeature(para1: TOGRLayerH; para2: TOGRFeatureH): TOGRErr; cdecl; external libgdal;
function OGR_L_UpdateFeature(para1: TOGRLayerH; para2: TOGRFeatureH; nUpdatedFieldsCount: longint; panUpdatedFieldsIdx: Plongint; nUpdatedGeomFieldsCount: longint;
  panUpdatedGeomFieldsIdx: Plongint; bUpdateStyleString: boolean): TOGRErr; cdecl; external libgdal;
function OGR_L_GetLayerDefn(para1: TOGRLayerH): TOGRFeatureDefnH; cdecl; external libgdal;
function OGR_L_GetSpatialRef(para1: TOGRLayerH): TOGRSpatialReferenceH; cdecl; external libgdal;
function OGR_L_GetSupportedSRSList(hLayer: TOGRLayerH; iGeomField: longint; pnCount: Plongint): POGRSpatialReferenceH; cdecl; external libgdal;
function OGR_L_SetActiveSRS(hLayer: TOGRLayerH; iGeomField: longint; hSRS: TOGRSpatialReferenceH): TOGRErr; cdecl; external libgdal;
function OGR_L_FindFieldIndex(para1: TOGRLayerH; para2: pchar; bExactMatch: longint): longint; cdecl; external libgdal;
function OGR_L_GetFeatureCount(para1: TOGRLayerH; para2: longint): TGIntBig; cdecl; external libgdal;
function OGR_L_GetExtent(para1: TOGRLayerH; para2: POGREnvelope; para3: longint): TOGRErr; cdecl; external libgdal;
function OGR_L_GetExtentEx(para1: TOGRLayerH; iGeomField: longint; psExtent: POGREnvelope; bForce: longint): TOGRErr; cdecl; external libgdal;
function OGR_L_TestCapability(para1: TOGRLayerH; para2: pchar): longint; cdecl; external libgdal;
function OGR_L_CreateField(para1: TOGRLayerH; para2: TOGRFieldDefnH; para3: longint): TOGRErr; cdecl; external libgdal;
function OGR_L_CreateGeomField(hLayer: TOGRLayerH; hFieldDefn: TOGRGeomFieldDefnH; bForce: longint): TOGRErr; cdecl; external libgdal;
function OGR_L_DeleteField(para1: TOGRLayerH; iField: longint): TOGRErr; cdecl; external libgdal;
function OGR_L_ReorderFields(para1: TOGRLayerH; panMap: Plongint): TOGRErr; cdecl; external libgdal;
function OGR_L_ReorderField(para1: TOGRLayerH; iOldFieldPos: longint; iNewFieldPos: longint): TOGRErr; cdecl; external libgdal;
function OGR_L_AlterFieldDefn(para1: TOGRLayerH; iField: longint; hNewFieldDefn: TOGRFieldDefnH; nFlags: longint): TOGRErr; cdecl; external libgdal;
function OGR_L_AlterGeomFieldDefn(para1: TOGRLayerH; iField: longint; hNewGeomFieldDefn: TOGRGeomFieldDefnH; nFlags: longint): TOGRErr; cdecl; external libgdal;
function OGR_L_StartTransaction(para1: TOGRLayerH): TOGRErr; cdecl; external libgdal;
function OGR_L_CommitTransaction(para1: TOGRLayerH): TOGRErr; cdecl; external libgdal;
function OGR_L_RollbackTransaction(para1: TOGRLayerH): TOGRErr; cdecl; external libgdal;
function OGR_L_Rename(hLayer: TOGRLayerH; pszNewName: pchar): TOGRErr; cdecl; external libgdal;
function OGR_L_Reference(para1: TOGRLayerH): longint; cdecl; external libgdal;
function OGR_L_Dereference(para1: TOGRLayerH): longint; cdecl; external libgdal;
function OGR_L_GetRefCount(para1: TOGRLayerH): longint; cdecl; external libgdal;
function OGR_L_SyncToDisk(para1: TOGRLayerH): TOGRErr; cdecl; external libgdal;
function OGR_L_GetFeaturesRead(para1: TOGRLayerH): TGIntBig; cdecl; external libgdal;
function OGR_L_GetFIDColumn(para1: TOGRLayerH): pchar; cdecl; external libgdal;
function OGR_L_GetGeometryColumn(para1: TOGRLayerH): pchar; cdecl; external libgdal;
function OGR_L_GetStyleTable(para1: TOGRLayerH): TOGRStyleTableH; cdecl; external libgdal;
procedure OGR_L_SetStyleTableDirectly(para1: TOGRLayerH; para2: TOGRStyleTableH); cdecl; external libgdal;
procedure OGR_L_SetStyleTable(para1: TOGRLayerH; para2: TOGRStyleTableH); cdecl; external libgdal;
function OGR_L_SetIgnoredFields(para1: TOGRLayerH; para2: PPchar): TOGRErr; cdecl; external libgdal;
function OGR_L_Intersection(para1: TOGRLayerH; para2: TOGRLayerH; para3: TOGRLayerH; para4: PPchar; para5: TGDALProgressFunc;
  para6: pointer): TOGRErr; cdecl; external libgdal;
function OGR_L_Union(para1: TOGRLayerH; para2: TOGRLayerH; para3: TOGRLayerH; para4: PPchar; para5: TGDALProgressFunc;
  para6: pointer): TOGRErr; cdecl; external libgdal;
function OGR_L_SymDifference(para1: TOGRLayerH; para2: TOGRLayerH; para3: TOGRLayerH; para4: PPchar; para5: TGDALProgressFunc;
  para6: pointer): TOGRErr; cdecl; external libgdal;
function OGR_L_Identity(para1: TOGRLayerH; para2: TOGRLayerH; para3: TOGRLayerH; para4: PPchar; para5: TGDALProgressFunc;
  para6: pointer): TOGRErr; cdecl; external libgdal;
function OGR_L_Update(para1: TOGRLayerH; para2: TOGRLayerH; para3: TOGRLayerH; para4: PPchar; para5: TGDALProgressFunc;
  para6: pointer): TOGRErr; cdecl; external libgdal;
function OGR_L_Clip(para1: TOGRLayerH; para2: TOGRLayerH; para3: TOGRLayerH; para4: PPchar; para5: TGDALProgressFunc;
  para6: pointer): TOGRErr; cdecl; external libgdal;
function OGR_L_Erase(para1: TOGRLayerH; para2: TOGRLayerH; para3: TOGRLayerH; para4: PPchar; para5: TGDALProgressFunc;
  para6: pointer): TOGRErr; cdecl; external libgdal;
procedure OGR_DS_Destroy(para1: TOGRDataSourceH); cdecl; external libgdal;
function OGR_DS_GetName(para1: TOGRDataSourceH): pchar; cdecl; external libgdal;
function OGR_DS_GetLayerCount(para1: TOGRDataSourceH): longint; cdecl; external libgdal;
function OGR_DS_GetLayer(para1: TOGRDataSourceH; para2: longint): TOGRLayerH; cdecl; external libgdal;
function OGR_DS_GetLayerByName(para1: TOGRDataSourceH; para2: pchar): TOGRLayerH; cdecl; external libgdal;
function OGR_DS_DeleteLayer(para1: TOGRDataSourceH; para2: longint): TOGRErr; cdecl; external libgdal;
function OGR_DS_GetDriver(para1: TOGRDataSourceH): TOGRSFDriverH; cdecl; external libgdal;
function OGR_DS_CreateLayer(para1: TOGRDataSourceH; para2: pchar; para3: TOGRSpatialReferenceH; para4: TOGRwkbGeometryType; para5: PPchar): TOGRLayerH; cdecl; external libgdal;
function OGR_DS_CopyLayer(para1: TOGRDataSourceH; para2: TOGRLayerH; para3: pchar; para4: PPchar): TOGRLayerH; cdecl; external libgdal;
function OGR_DS_TestCapability(para1: TOGRDataSourceH; para2: pchar): longint; cdecl; external libgdal;
function OGR_DS_ExecuteSQL(para1: TOGRDataSourceH; para2: pchar; para3: TOGRGeometryH; para4: pchar): TOGRLayerH; cdecl; external libgdal;
procedure OGR_DS_ReleaseResultSet(para1: TOGRDataSourceH; para2: TOGRLayerH); cdecl; external libgdal;
function OGR_DS_Reference(para1: TOGRDataSourceH): longint; cdecl; external libgdal;
function OGR_DS_Dereference(para1: TOGRDataSourceH): longint; cdecl; external libgdal;
function OGR_DS_GetRefCount(para1: TOGRDataSourceH): longint; cdecl; external libgdal;
function OGR_DS_GetSummaryRefCount(para1: TOGRDataSourceH): longint; cdecl; external libgdal;
function OGR_DS_SyncToDisk(para1: TOGRDataSourceH): TOGRErr; cdecl; external libgdal;
function OGR_DS_GetStyleTable(para1: TOGRDataSourceH): TOGRStyleTableH; cdecl; external libgdal;
procedure OGR_DS_SetStyleTableDirectly(para1: TOGRDataSourceH; para2: TOGRStyleTableH); cdecl; external libgdal;
procedure OGR_DS_SetStyleTable(para1: TOGRDataSourceH; para2: TOGRStyleTableH); cdecl; external libgdal;
function OGR_Dr_GetName(para1: TOGRSFDriverH): pchar; cdecl; external libgdal;
function OGR_Dr_Open(para1: TOGRSFDriverH; para2: pchar; para3: longint): TOGRDataSourceH; cdecl; external libgdal;
function OGR_Dr_TestCapability(para1: TOGRSFDriverH; para2: pchar): longint; cdecl; external libgdal;
function OGR_Dr_CreateDataSource(para1: TOGRSFDriverH; para2: pchar; para3: PPchar): TOGRDataSourceH; cdecl; external libgdal;
function OGR_Dr_CopyDataSource(para1: TOGRSFDriverH; para2: TOGRDataSourceH; para3: pchar; para4: PPchar): TOGRDataSourceH; cdecl; external libgdal;
function OGR_Dr_DeleteDataSource(para1: TOGRSFDriverH; para2: pchar): TOGRErr; cdecl; external libgdal;
function OGROpen(para1: pchar; para2: longint; para3: POGRSFDriverH): TOGRDataSourceH; cdecl; external libgdal;
function OGROpenShared(para1: pchar; para2: longint; para3: POGRSFDriverH): TOGRDataSourceH; cdecl; external libgdal;
function OGRReleaseDataSource(para1: TOGRDataSourceH): TOGRErr; cdecl; external libgdal;
procedure OGRRegisterDriver(para1: TOGRSFDriverH); cdecl; external libgdal;
procedure OGRDeregisterDriver(para1: TOGRSFDriverH); cdecl; external libgdal;
function OGRGetDriverCount: longint; cdecl; external libgdal;
function OGRGetDriver(para1: longint): TOGRSFDriverH; cdecl; external libgdal;
function OGRGetDriverByName(para1: pchar): TOGRSFDriverH; cdecl; external libgdal;
function OGRGetOpenDSCount: longint; cdecl; external libgdal;
function OGRGetOpenDS(iDS: longint): TOGRDataSourceH; cdecl; external libgdal;
procedure OGRRegisterAll; cdecl; external libgdal;
procedure OGRCleanupAll; cdecl; external libgdal;

type
  POGRStyleMgrH = ^TOGRStyleMgrH;
  TOGRStyleMgrH = pointer;

  POGRStyleToolH = ^TOGRStyleToolH;
  TOGRStyleToolH = pointer;

function OGR_SM_Create(hStyleTable: TOGRStyleTableH): TOGRStyleMgrH; cdecl; external libgdal;
procedure OGR_SM_Destroy(hSM: TOGRStyleMgrH); cdecl; external libgdal;
function OGR_SM_InitFromFeature(hSM: TOGRStyleMgrH; hFeat: TOGRFeatureH): pchar; cdecl; external libgdal;
function OGR_SM_InitStyleString(hSM: TOGRStyleMgrH; pszStyleString: pchar): longint; cdecl; external libgdal;
function OGR_SM_GetPartCount(hSM: TOGRStyleMgrH; pszStyleString: pchar): longint; cdecl; external libgdal;
function OGR_SM_GetPart(hSM: TOGRStyleMgrH; nPartId: longint; pszStyleString: pchar): TOGRStyleToolH; cdecl; external libgdal;
function OGR_SM_AddPart(hSM: TOGRStyleMgrH; hST: TOGRStyleToolH): longint; cdecl; external libgdal;
function OGR_SM_AddStyle(hSM: TOGRStyleMgrH; pszStyleName: pchar; pszStyleString: pchar): longint; cdecl; external libgdal;

function OGR_ST_Create(eClassId: TOGRSTClassId): TOGRStyleToolH; cdecl; external libgdal;
procedure OGR_ST_Destroy(hST: TOGRStyleToolH); cdecl; external libgdal;
function OGR_ST_GetType(hST: TOGRStyleToolH): TOGRSTClassId; cdecl; external libgdal;
function OGR_ST_GetUnit(hST: TOGRStyleToolH): TOGRSTUnitId; cdecl; external libgdal;
procedure OGR_ST_SetUnit(hST: TOGRStyleToolH; eUnit: TOGRSTUnitId; dfGroundPaperScale: double); cdecl; external libgdal;
function OGR_ST_GetParamStr(hST: TOGRStyleToolH; eParam: longint; bValueIsNull: Plongint): pchar; cdecl; external libgdal;
function OGR_ST_GetParamNum(hST: TOGRStyleToolH; eParam: longint; bValueIsNull: Plongint): longint; cdecl; external libgdal;
function OGR_ST_GetParamDbl(hST: TOGRStyleToolH; eParam: longint; bValueIsNull: Plongint): double; cdecl; external libgdal;
procedure OGR_ST_SetParamStr(hST: TOGRStyleToolH; eParam: longint; pszValue: pchar); cdecl; external libgdal;
procedure OGR_ST_SetParamNum(hST: TOGRStyleToolH; eParam: longint; nValue: longint); cdecl; external libgdal;
procedure OGR_ST_SetParamDbl(hST: TOGRStyleToolH; eParam: longint; dfValue: double); cdecl; external libgdal;
function OGR_ST_GetStyleString(hST: TOGRStyleToolH): pchar; cdecl; external libgdal;
function OGR_ST_GetRGBFromString(hST: TOGRStyleToolH; pszColor: pchar; pnRed: Plongint; pnGreen: Plongint; pnBlue: Plongint;
  pnAlpha: Plongint): longint; cdecl; external libgdal;

function OGR_STBL_Create: TOGRStyleTableH; cdecl; external libgdal;
procedure OGR_STBL_Destroy(hSTBL: TOGRStyleTableH); cdecl; external libgdal;
function OGR_STBL_AddStyle(hStyleTable: TOGRStyleTableH; pszName: pchar; pszStyleString: pchar): longint; cdecl; external libgdal;
function OGR_STBL_SaveStyleTable(hStyleTable: TOGRStyleTableH; pszFilename: pchar): longint; cdecl; external libgdal;
function OGR_STBL_LoadStyleTable(hStyleTable: TOGRStyleTableH; pszFilename: pchar): longint; cdecl; external libgdal;
function OGR_STBL_Find(hStyleTable: TOGRStyleTableH; pszName: pchar): pchar; cdecl; external libgdal;
procedure OGR_STBL_ResetStyleStringReading(hStyleTable: TOGRStyleTableH); cdecl; external libgdal;
function OGR_STBL_GetNextStyle(hStyleTable: TOGRStyleTableH): pchar; cdecl; external libgdal;
function OGR_STBL_GetLastStyleName(hStyleTable: TOGRStyleTableH): pchar; cdecl; external libgdal;

// === Konventiert am: 2-10-26 16:54:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
