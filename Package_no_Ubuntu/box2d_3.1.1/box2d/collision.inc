{$IFDEF read_interface}


const
  B2_MAX_POLYGON_VERTICES = 8;

type
  Tb2RayCastInput = record
    origin: Tb2Vec2;
    translation: Tb2Vec2;
    maxFraction: single;
  end;
  Pb2RayCastInput = ^Tb2RayCastInput;

  Tb2ShapeProxy = record
    points: array[0..(B2_MAX_POLYGON_VERTICES) - 1] of Tb2Vec2;
    count: longint;
    radius: single;
  end;
  Pb2ShapeProxy = ^Tb2ShapeProxy;

  Tb2ShapeCastInput = record
    proxy: Tb2ShapeProxy;
    translation: Tb2Vec2;
    maxFraction: single;
    canEncroach: Tbool;
  end;
  Pb2ShapeCastInput = ^Tb2ShapeCastInput;

  Tb2CastOutput = record
    normal: Tb2Vec2;
    point: Tb2Vec2;
    fraction: single;
    iterations: longint;
    hit: Tbool;
  end;
  Pb2CastOutput = ^Tb2CastOutput;

  Tb2MassData = record
    mass: single;
    center: Tb2Vec2;
    rotationalInertia: single;
  end;
  Pb2MassData = ^Tb2MassData;

  Tb2Circle = record
    center: Tb2Vec2;
    radius: single;
  end;
  Pb2Circle = ^Tb2Circle;

  Tb2Capsule = record
    center1: Tb2Vec2;
    center2: Tb2Vec2;
    radius: single;
  end;
  Pb2Capsule = ^Tb2Capsule;

  Tb2Polygon = record
    vertices: array[0..(B2_MAX_POLYGON_VERTICES) - 1] of Tb2Vec2;
    normals: array[0..(B2_MAX_POLYGON_VERTICES) - 1] of Tb2Vec2;
    centroid: Tb2Vec2;
    radius: single;
    count: longint;
  end;
  Pb2Polygon = ^Tb2Polygon;

  Tb2Segment = record
    point1: Tb2Vec2;
    point2: Tb2Vec2;
  end;
  Pb2Segment = ^Tb2Segment;

  Tb2ChainSegment = record
    ghost1: Tb2Vec2;
    segment: Tb2Segment;
    ghost2: Tb2Vec2;
    chainId: longint;
  end;
  Pb2ChainSegment = ^Tb2ChainSegment;

type
  Tb2Hull = record
    points: array[0..(B2_MAX_POLYGON_VERTICES) - 1] of Tb2Vec2;
    count: longint;
  end;
  Pb2Hull = ^Tb2Hull;

function b2IsValidRay(input: Pb2RayCastInput): Tbool; cdecl; external libbox2d;
function b2MakePolygon(hull: Pb2Hull; radius: single): Tb2Polygon; cdecl; external libbox2d;
function b2MakeOffsetPolygon(hull: Pb2Hull; position: Tb2Vec2; rotation: Tb2Rot): Tb2Polygon; cdecl; external libbox2d;
function b2MakeOffsetRoundedPolygon(hull: Pb2Hull; position: Tb2Vec2; rotation: Tb2Rot; radius: single): Tb2Polygon; cdecl; external libbox2d;
function b2MakeSquare(halfWidth: single): Tb2Polygon; cdecl; external libbox2d;
function b2MakeBox(halfWidth: single; halfHeight: single): Tb2Polygon; cdecl; external libbox2d;
function b2MakeRoundedBox(halfWidth: single; halfHeight: single; radius: single): Tb2Polygon; cdecl; external libbox2d;
function b2MakeOffsetBox(halfWidth: single; halfHeight: single; center: Tb2Vec2; rotation: Tb2Rot): Tb2Polygon; cdecl; external libbox2d;
function b2MakeOffsetRoundedBox(halfWidth: single; halfHeight: single; center: Tb2Vec2; rotation: Tb2Rot; radius: single): Tb2Polygon; cdecl; external libbox2d;
function b2TransformPolygon(transform: Tb2Transform; polygon: Pb2Polygon): Tb2Polygon; cdecl; external libbox2d;
function b2ComputeCircleMass(shape: Pb2Circle; density: single): Tb2MassData; cdecl; external libbox2d;
function b2ComputeCapsuleMass(shape: Pb2Capsule; density: single): Tb2MassData; cdecl; external libbox2d;
function b2ComputePolygonMass(shape: Pb2Polygon; density: single): Tb2MassData; cdecl; external libbox2d;
function b2ComputeCircleAABB(shape: Pb2Circle; transform: Tb2Transform): Tb2AABB; cdecl; external libbox2d;
function b2ComputeCapsuleAABB(shape: Pb2Capsule; transform: Tb2Transform): Tb2AABB; cdecl; external libbox2d;
function b2ComputePolygonAABB(shape: Pb2Polygon; transform: Tb2Transform): Tb2AABB; cdecl; external libbox2d;
function b2ComputeSegmentAABB(shape: Pb2Segment; transform: Tb2Transform): Tb2AABB; cdecl; external libbox2d;
function b2PointInCircle(shape: Pb2Circle; point: Tb2Vec2): Tbool; cdecl; external libbox2d;
function b2PointInCapsule(shape: Pb2Capsule; point: Tb2Vec2): Tbool; cdecl; external libbox2d;
function b2PointInPolygon(shape: Pb2Polygon; point: Tb2Vec2): Tbool; cdecl; external libbox2d;
function b2RayCastCircle(shape: Pb2Circle; input: Pb2RayCastInput): Tb2CastOutput; cdecl; external libbox2d;
function b2RayCastCapsule(shape: Pb2Capsule; input: Pb2RayCastInput): Tb2CastOutput; cdecl; external libbox2d;
function b2RayCastSegment(shape: Pb2Segment; input: Pb2RayCastInput; oneSided: Tbool): Tb2CastOutput; cdecl; external libbox2d;
function b2RayCastPolygon(shape: Pb2Polygon; input: Pb2RayCastInput): Tb2CastOutput; cdecl; external libbox2d;
function b2ShapeCastCircle(shape: Pb2Circle; input: Pb2ShapeCastInput): Tb2CastOutput; cdecl; external libbox2d;
function b2ShapeCastCapsule(shape: Pb2Capsule; input: Pb2ShapeCastInput): Tb2CastOutput; cdecl; external libbox2d;
function b2ShapeCastSegment(shape: Pb2Segment; input: Pb2ShapeCastInput): Tb2CastOutput; cdecl; external libbox2d;
function b2ShapeCastPolygon(shape: Pb2Polygon; input: Pb2ShapeCastInput): Tb2CastOutput; cdecl; external libbox2d;
function b2ComputeHull(points: Pb2Vec2; count: longint): Tb2Hull; cdecl; external libbox2d;
function b2ValidateHull(hull: Pb2Hull): Tbool; cdecl; external libbox2d;

type
  Tb2SegmentDistanceResult = record
    closest1: Tb2Vec2;
    closest2: Tb2Vec2;
    fraction1: single;
    fraction2: single;
    distanceSquared: single;
  end;
  Pb2SegmentDistanceResult = ^Tb2SegmentDistanceResult;

function b2SegmentDistance(p1: Tb2Vec2; q1: Tb2Vec2; p2: Tb2Vec2; q2: Tb2Vec2): Tb2SegmentDistanceResult; cdecl; external libbox2d;

type
  Tb2SimplexCache = record
    count: Tuint16_t;
    indexA: array[0..2] of Tuint8_t;
    indexB: array[0..2] of Tuint8_t;
  end;
  Pb2SimplexCache = ^Tb2SimplexCache;

const
  b2_emptySimplexCache: Tb2SimplexCache = (count: 0; indexA: (0, 0, 0); indexB: (0, 0, 0));

type
  Tb2DistanceInput = record
    proxyA: Tb2ShapeProxy;
    proxyB: Tb2ShapeProxy;
    transformA: Tb2Transform;
    transformB: Tb2Transform;
    useRadii: Tbool;
  end;
  Pb2DistanceInput = ^Tb2DistanceInput;

  Tb2DistanceOutput = record
    pointA: Tb2Vec2;
    pointB: Tb2Vec2;
    normal: Tb2Vec2;
    distance: single;
    iterations: longint;
    simplexCount: longint;
  end;
  Pb2DistanceOutput = ^Tb2DistanceOutput;

  Tb2SimplexVertex = record
    wA: Tb2Vec2;
    wB: Tb2Vec2;
    w: Tb2Vec2;
    a: single;
    indexA: longint;
    indexB: longint;
  end;
  Pb2SimplexVertex = ^Tb2SimplexVertex;

  Tb2Simplex = record
    v1: Tb2SimplexVertex;
    v2: Tb2SimplexVertex;
    v3: Tb2SimplexVertex;
    count: longint;
  end;
  Pb2Simplex = ^Tb2Simplex;

function b2ShapeDistance(input: Pb2DistanceInput; cache: Pb2SimplexCache; simplexes: Pb2Simplex; simplexCapacity: longint): Tb2DistanceOutput; cdecl; external libbox2d;

type
  Tb2ShapeCastPairInput = record
    proxyA: Tb2ShapeProxy;
    proxyB: Tb2ShapeProxy;
    transformA: Tb2Transform;
    transformB: Tb2Transform;
    translationB: Tb2Vec2;
    maxFraction: single;
    canEncroach: Tbool;
  end;
  Pb2ShapeCastPairInput = ^Tb2ShapeCastPairInput;

function b2ShapeCast(input: Pb2ShapeCastPairInput): Tb2CastOutput; cdecl; external libbox2d;
function b2MakeProxy(points: Pb2Vec2; count: longint; radius: single): Tb2ShapeProxy; cdecl; external libbox2d;
function b2MakeOffsetProxy(points: Pb2Vec2; count: longint; radius: single; position: Tb2Vec2; rotation: Tb2Rot): Tb2ShapeProxy; cdecl; external libbox2d;

type
  Tb2Sweep = record
    localCenter: Tb2Vec2;
    c1: Tb2Vec2;
    c2: Tb2Vec2;
    q1: Tb2Rot;
    q2: Tb2Rot;
  end;
  Pb2Sweep = ^Tb2Sweep;

function b2GetSweepTransform(sweep: Pb2Sweep; time: single): Tb2Transform; cdecl; external libbox2d;

type
  Tb2TOIInput = record
    proxyA: Tb2ShapeProxy;
    proxyB: Tb2ShapeProxy;
    sweepA: Tb2Sweep;
    sweepB: Tb2Sweep;
    maxFraction: single;
  end;
  Pb2TOIInput = ^Tb2TOIInput;

type
  Pb2TOIState = ^Tb2TOIState;
  Tb2TOIState = longint;

const
  b2_toiStateUnknown = 0;
  b2_toiStateFailed = 1;
  b2_toiStateOverlapped = 2;
  b2_toiStateHit = 3;
  b2_toiStateSeparated = 4;

type
  Tb2TOIOutput = record
    state: Tb2TOIState;
    point: Tb2Vec2;
    normal: Tb2Vec2;
    fraction: single;
  end;
  Pb2TOIOutput = ^Tb2TOIOutput;

function b2TimeOfImpact(input: Pb2TOIInput): Tb2TOIOutput; cdecl; external libbox2d;

type
  Tb2ManifoldPoint = record
    point: Tb2Vec2;
    anchorA: Tb2Vec2;
    anchorB: Tb2Vec2;
    separation: single;
    normalImpulse: single;
    tangentImpulse: single;
    totalNormalImpulse: single;
    normalVelocity: single;
    id: Tuint16_t;
    persisted: Tbool;
  end;
  Pb2ManifoldPoint = ^Tb2ManifoldPoint;

  Tb2Manifold = record
    normal: Tb2Vec2;
    rollingImpulse: single;
    points: array[0..1] of Tb2ManifoldPoint;
    pointCount: longint;
  end;
  Pb2Manifold = ^Tb2Manifold;

function b2CollideCircles(circleA: Pb2Circle; xfA: Tb2Transform; circleB: Pb2Circle; xfB: Tb2Transform): Tb2Manifold; cdecl; external libbox2d;
function b2CollideCapsuleAndCircle(capsuleA: Pb2Capsule; xfA: Tb2Transform; circleB: Pb2Circle; xfB: Tb2Transform): Tb2Manifold; cdecl; external libbox2d;
function b2CollideSegmentAndCircle(segmentA: Pb2Segment; xfA: Tb2Transform; circleB: Pb2Circle; xfB: Tb2Transform): Tb2Manifold; cdecl; external libbox2d;
function b2CollidePolygonAndCircle(polygonA: Pb2Polygon; xfA: Tb2Transform; circleB: Pb2Circle; xfB: Tb2Transform): Tb2Manifold; cdecl; external libbox2d;
function b2CollideCapsules(capsuleA: Pb2Capsule; xfA: Tb2Transform; capsuleB: Pb2Capsule; xfB: Tb2Transform): Tb2Manifold; cdecl; external libbox2d;
function b2CollideSegmentAndCapsule(segmentA: Pb2Segment; xfA: Tb2Transform; capsuleB: Pb2Capsule; xfB: Tb2Transform): Tb2Manifold; cdecl; external libbox2d;
function b2CollidePolygonAndCapsule(polygonA: Pb2Polygon; xfA: Tb2Transform; capsuleB: Pb2Capsule; xfB: Tb2Transform): Tb2Manifold; cdecl; external libbox2d;
function b2CollidePolygons(polygonA: Pb2Polygon; xfA: Tb2Transform; polygonB: Pb2Polygon; xfB: Tb2Transform): Tb2Manifold; cdecl; external libbox2d;
function b2CollideSegmentAndPolygon(segmentA: Pb2Segment; xfA: Tb2Transform; polygonB: Pb2Polygon; xfB: Tb2Transform): Tb2Manifold; cdecl; external libbox2d;
function b2CollideChainSegmentAndCircle(segmentA: Pb2ChainSegment; xfA: Tb2Transform; circleB: Pb2Circle; xfB: Tb2Transform): Tb2Manifold; cdecl; external libbox2d;
function b2CollideChainSegmentAndCapsule(segmentA: Pb2ChainSegment; xfA: Tb2Transform; capsuleB: Pb2Capsule; xfB: Tb2Transform; cache: Pb2SimplexCache): Tb2Manifold; cdecl; external libbox2d;
function b2CollideChainSegmentAndPolygon(segmentA: Pb2ChainSegment; xfA: Tb2Transform; polygonB: Pb2Polygon; xfB: Tb2Transform; cache: Pb2SimplexCache): Tb2Manifold; cdecl; external libbox2d;

type
  Tb2DynamicTree = record
    nodes: Pb2TreeNode;
    root: Tint32_t;
    nodeCount: Tint32_t;
    nodeCapacity: Tint32_t;
    freeList: Tint32_t;
    proxyCount: Tint32_t;
    leafIndices: Pint32_t;
    leafBoxes: Pb2AABB;
    leafCenters: Pb2Vec2;
    binIndices: Pint32_t;
    rebuildCapacity: Tint32_t;
  end;
  Pb2DynamicTree = ^Tb2DynamicTree;

  Tb2TreeStats = record
    nodeVisits: longint;
    leafVisits: longint;
  end;
  Pb2TreeStats = ^Tb2TreeStats;

function b2DynamicTree_Create: Tb2DynamicTree; cdecl; external libbox2d;
procedure b2DynamicTree_Destroy(tree: Pb2DynamicTree); cdecl; external libbox2d;
function b2DynamicTree_CreateProxy(tree: Pb2DynamicTree; aabb: Tb2AABB; categoryBits: Tuint64_t; userData: Tuint64_t): longint; cdecl; external libbox2d;
procedure b2DynamicTree_DestroyProxy(tree: Pb2DynamicTree; proxyId: longint); cdecl; external libbox2d;
procedure b2DynamicTree_MoveProxy(tree: Pb2DynamicTree; proxyId: longint; aabb: Tb2AABB); cdecl; external libbox2d;
procedure b2DynamicTree_EnlargeProxy(tree: Pb2DynamicTree; proxyId: longint; aabb: Tb2AABB); cdecl; external libbox2d;
procedure b2DynamicTree_SetCategoryBits(tree: Pb2DynamicTree; proxyId: longint; categoryBits: Tuint64_t); cdecl; external libbox2d;
function b2DynamicTree_GetCategoryBits(tree: Pb2DynamicTree; proxyId: longint): Tuint64_t; cdecl; external libbox2d;

type
  Tb2TreeQueryCallbackFcn = function(proxyId: longint; userData: Tuint64_t; context: pointer): Tbool; cdecl;

function b2DynamicTree_Query(tree: Pb2DynamicTree; aabb: Tb2AABB; maskBits: Tuint64_t; callback: Tb2TreeQueryCallbackFcn; context: pointer): Tb2TreeStats; cdecl; external libbox2d;
function b2DynamicTree_QueryAll(tree: Pb2DynamicTree; aabb: Tb2AABB; callback: Tb2TreeQueryCallbackFcn; context: pointer): Tb2TreeStats; cdecl; external libbox2d;

type
  Tb2TreeRayCastCallbackFcn = function(input: Pb2RayCastInput; proxyId: longint; userData: Tuint64_t; context: pointer): single; cdecl;

function b2DynamicTree_RayCast(tree: Pb2DynamicTree; input: Pb2RayCastInput; maskBits: Tuint64_t; callback: Tb2TreeRayCastCallbackFcn; context: pointer): Tb2TreeStats; cdecl; external libbox2d;

type
  Tb2TreeShapeCastCallbackFcn = function(input: Pb2ShapeCastInput; proxyId: longint; userData: Tuint64_t; context: pointer): single; cdecl;

function b2DynamicTree_ShapeCast(tree: Pb2DynamicTree; input: Pb2ShapeCastInput; maskBits: Tuint64_t; callback: Tb2TreeShapeCastCallbackFcn; context: pointer): Tb2TreeStats; cdecl; external libbox2d;
function b2DynamicTree_GetHeight(tree: Pb2DynamicTree): longint; cdecl; external libbox2d;
function b2DynamicTree_GetAreaRatio(tree: Pb2DynamicTree): single; cdecl; external libbox2d;
function b2DynamicTree_GetRootBounds(tree: Pb2DynamicTree): Tb2AABB; cdecl; external libbox2d;
function b2DynamicTree_GetProxyCount(tree: Pb2DynamicTree): longint; cdecl; external libbox2d;
function b2DynamicTree_Rebuild(tree: Pb2DynamicTree; fullBuild: Tbool): longint; cdecl; external libbox2d;
function b2DynamicTree_GetByteCount(tree: Pb2DynamicTree): longint; cdecl; external libbox2d;
function b2DynamicTree_GetUserData(tree: Pb2DynamicTree; proxyId: longint): Tuint64_t; cdecl; external libbox2d;
function b2DynamicTree_GetAABB(tree: Pb2DynamicTree; proxyId: longint): Tb2AABB; cdecl; external libbox2d;
procedure b2DynamicTree_Validate(tree: Pb2DynamicTree); cdecl; external libbox2d;
procedure b2DynamicTree_ValidateNoEnlarged(tree: Pb2DynamicTree); cdecl; external libbox2d;

type
  Tb2PlaneResult = record
    plane: Tb2Plane;
    point: Tb2Vec2;
    hit: Tbool;
  end;
  Pb2PlaneResult = ^Tb2PlaneResult;

  Tb2CollisionPlane = record
    plane: Tb2Plane;
    pushLimit: single;
    push: single;
    clipVelocity: Tbool;
  end;
  Pb2CollisionPlane = ^Tb2CollisionPlane;

  Tb2PlaneSolverResult = record
    translation: Tb2Vec2;
    iterationCount: longint;
  end;
  Pb2PlaneSolverResult = ^Tb2PlaneSolverResult;

function b2SolvePlanes(targetDelta: Tb2Vec2; planes: Pb2CollisionPlane; count: longint): Tb2PlaneSolverResult; cdecl; external libbox2d;
function b2ClipVector(vector: Tb2Vec2; planes: Pb2CollisionPlane; count: longint): Tb2Vec2; cdecl; external libbox2d;

// === Konventiert am: 7-3-26 16:28:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
