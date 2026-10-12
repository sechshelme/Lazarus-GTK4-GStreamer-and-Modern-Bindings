{$IFDEF read_interface}


const
  B2_DEFAULT_CATEGORY_BITS = 1;
  B2_DEFAULT_MASK_BITS = UINT64_MAX;

type
  Tb2TaskCallback = procedure(startIndex: longint; endIndex: longint; workerIndex: Tuint32_t; taskContext: pointer); cdecl;
  Tb2EnqueueTaskCallback = function(task: Tb2TaskCallback; itemCount: longint; minRange: longint; taskContext: pointer; userContext: pointer): pointer; cdecl;
  Tb2FinishTaskCallback = procedure(userTask: pointer; userContext: pointer); cdecl;
  Tb2FrictionCallback = function(frictionA: single; userMaterialIdA: Tuint64_t; frictionB: single; userMaterialIdB: Tuint64_t): single; cdecl;
  Tb2RestitutionCallback = function(restitutionA: single; userMaterialIdA: Tuint64_t; restitutionB: single; userMaterialIdB: Tuint64_t): single; cdecl;

  Tb2RayResult = record
    shapeId: Tb2ShapeId;
    point: Tb2Vec2;
    normal: Tb2Vec2;
    fraction: single;
    nodeVisits: longint;
    leafVisits: longint;
    hit: Tbool;
  end;
  Pb2RayResult = ^Tb2RayResult;

  Tb2WorldDef = record
    gravity: Tb2Vec2;
    restitutionThreshold: single;
    hitEventThreshold: single;
    contactHertz: single;
    contactDampingRatio: single;
    contactSpeed: single;
    maximumLinearSpeed: single;
    frictionCallback: Tb2FrictionCallback;
    restitutionCallback: Tb2RestitutionCallback;
    enableSleep: Tbool;
    enableContinuous: Tbool;
    enableContactSoftening: Tbool;
    workerCount: longint;
    enqueueTask: Tb2EnqueueTaskCallback;
    finishTask: Tb2FinishTaskCallback;
    userTaskContext: pointer;
    userData: pointer;
    internalValue: longint;
  end;
  Pb2WorldDef = ^Tb2WorldDef;

function b2DefaultWorldDef: Tb2WorldDef; cdecl; external libbox2d;

type
  Pb2BodyType = ^Tb2BodyType;
  Tb2BodyType = longint;

const
  b2_staticBody = 0;
  b2_kinematicBody = 1;
  b2_dynamicBody = 2;
  b2_bodyTypeCount = 3;

type
  Tb2MotionLocks = record
    linearX: Tbool;
    linearY: Tbool;
    angularZ: Tbool;
  end;
  Pb2MotionLocks = ^Tb2MotionLocks;

  Tb2BodyDef = record
    _type: Tb2BodyType;
    position: Tb2Vec2;
    rotation: Tb2Rot;
    linearVelocity: Tb2Vec2;
    angularVelocity: single;
    linearDamping: single;
    angularDamping: single;
    gravityScale: single;
    sleepThreshold: single;
    name: pchar;
    userData: pointer;
    motionLocks: Tb2MotionLocks;
    enableSleep: Tbool;
    isAwake: Tbool;
    isBullet: Tbool;
    isEnabled: Tbool;
    allowFastRotation: Tbool;
    internalValue: longint;
  end;
  Pb2BodyDef = ^Tb2BodyDef;

function b2DefaultBodyDef: Tb2BodyDef; cdecl; external libbox2d;

type
  Tb2Filter = record
    categoryBits: Tuint64_t;
    maskBits: Tuint64_t;
    groupIndex: longint;
  end;
  Pb2Filter = ^Tb2Filter;

function b2DefaultFilter: Tb2Filter; cdecl; external libbox2d;

type
  Tb2QueryFilter = record
    categoryBits: Tuint64_t;
    maskBits: Tuint64_t;
  end;
  Pb2QueryFilter = ^Tb2QueryFilter;

function b2DefaultQueryFilter: Tb2QueryFilter; cdecl; external libbox2d;

type
  Pb2ShapeType = ^Tb2ShapeType;
  Tb2ShapeType = longint;

const
  b2_circleShape = 0;
  b2_capsuleShape = 1;
  b2_segmentShape = 2;
  b2_polygonShape = 3;
  b2_chainSegmentShape = 4;
  b2_shapeTypeCount = 5;

type
  Tb2SurfaceMaterial = record
    friction: single;
    restitution: single;
    rollingResistance: single;
    tangentSpeed: single;
    userMaterialId: Tuint64_t;
    customColor: Tuint32_t;
  end;
  Pb2SurfaceMaterial = ^Tb2SurfaceMaterial;

function b2DefaultSurfaceMaterial: Tb2SurfaceMaterial; cdecl; external libbox2d;

type
  Tb2ShapeDef = record
    userData: pointer;
    material: Tb2SurfaceMaterial;
    density: single;
    filter: Tb2Filter;
    enableCustomFiltering: Tbool;
    isSensor: Tbool;
    enableSensorEvents: Tbool;
    enableContactEvents: Tbool;
    enableHitEvents: Tbool;
    enablePreSolveEvents: Tbool;
    invokeContactCreation: Tbool;
    updateBodyMass: Tbool;
    internalValue: longint;
  end;
  Pb2ShapeDef = ^Tb2ShapeDef;

function b2DefaultShapeDef: Tb2ShapeDef; cdecl; external libbox2d;

type
  Tb2ChainDef = record
    userData: pointer;
    points: Pb2Vec2;
    count: longint;
    materials: Pb2SurfaceMaterial;
    materialCount: longint;
    filter: Tb2Filter;
    isLoop: Tbool;
    enableSensorEvents: Tbool;
    internalValue: longint;
  end;
  Pb2ChainDef = ^Tb2ChainDef;

function b2DefaultChainDef: Tb2ChainDef; cdecl; external libbox2d;

type
  Tb2Profile = record
    step: single;
    pairs: single;
    collide: single;
    solve: single;
    prepareStages: single;
    solveConstraints: single;
    prepareConstraints: single;
    integrateVelocities: single;
    warmStart: single;
    solveImpulses: single;
    integratePositions: single;
    relaxImpulses: single;
    applyRestitution: single;
    storeImpulses: single;
    splitIslands: single;
    transforms: single;
    sensorHits: single;
    jointEvents: single;
    hitEvents: single;
    refit: single;
    bullets: single;
    sleepIslands: single;
    sensors: single;
  end;
  Pb2Profile = ^Tb2Profile;

  Tb2Counters = record
    bodyCount: longint;
    shapeCount: longint;
    contactCount: longint;
    jointCount: longint;
    islandCount: longint;
    stackUsed: longint;
    staticTreeHeight: longint;
    treeHeight: longint;
    byteCount: longint;
    taskCount: longint;
    colorCounts: array[0..23] of longint;
  end;
  Pb2Counters = ^Tb2Counters;

type
  Pb2JointType = ^Tb2JointType;
  Tb2JointType = longint;

const
  b2_distanceJoint = 0;
  b2_filterJoint = 1;
  b2_motorJoint = 2;
  b2_prismaticJoint = 3;
  b2_revoluteJoint = 4;
  b2_weldJoint = 5;
  b2_wheelJoint = 6;

type
  Tb2JointDef = record
    userData: pointer;
    bodyIdA: Tb2BodyId;
    bodyIdB: Tb2BodyId;
    localFrameA: Tb2Transform;
    localFrameB: Tb2Transform;
    forceThreshold: single;
    torqueThreshold: single;
    constraintHertz: single;
    constraintDampingRatio: single;
    drawScale: single;
    collideConnected: Tbool;
  end;
  Pb2JointDef = ^Tb2JointDef;

  Tb2DistanceJointDef = record
    base: Tb2JointDef;
    length: single;
    enableSpring: Tbool;
    lowerSpringForce: single;
    upperSpringForce: single;
    hertz: single;
    dampingRatio: single;
    enableLimit: Tbool;
    minLength: single;
    maxLength: single;
    enableMotor: Tbool;
    maxMotorForce: single;
    motorSpeed: single;
    internalValue: longint;
  end;
  Pb2DistanceJointDef = ^Tb2DistanceJointDef;

function b2DefaultDistanceJointDef: Tb2DistanceJointDef; cdecl; external libbox2d;

type
  Tb2MotorJointDef = record
    base: Tb2JointDef;
    linearVelocity: Tb2Vec2;
    maxVelocityForce: single;
    angularVelocity: single;
    maxVelocityTorque: single;
    linearHertz: single;
    linearDampingRatio: single;
    maxSpringForce: single;
    angularHertz: single;
    angularDampingRatio: single;
    maxSpringTorque: single;
    internalValue: longint;
  end;
  Pb2MotorJointDef = ^Tb2MotorJointDef;

function b2DefaultMotorJointDef: Tb2MotorJointDef; cdecl; external libbox2d;

type
  Tb2FilterJointDef = record
    base: Tb2JointDef;
    internalValue: longint;
  end;
  Pb2FilterJointDef = ^Tb2FilterJointDef;

function b2DefaultFilterJointDef: Tb2FilterJointDef; cdecl; external libbox2d;

type
  Tb2PrismaticJointDef = record
    base: Tb2JointDef;
    enableSpring: Tbool;
    hertz: single;
    dampingRatio: single;
    targetTranslation: single;
    enableLimit: Tbool;
    lowerTranslation: single;
    upperTranslation: single;
    enableMotor: Tbool;
    maxMotorForce: single;
    motorSpeed: single;
    internalValue: longint;
  end;
  Pb2PrismaticJointDef = ^Tb2PrismaticJointDef;

function b2DefaultPrismaticJointDef: Tb2PrismaticJointDef; cdecl; external libbox2d;

type
  Tb2RevoluteJointDef = record
    base: Tb2JointDef;
    targetAngle: single;
    enableSpring: Tbool;
    hertz: single;
    dampingRatio: single;
    enableLimit: Tbool;
    lowerAngle: single;
    upperAngle: single;
    enableMotor: Tbool;
    maxMotorTorque: single;
    motorSpeed: single;
    internalValue: longint;
  end;
  Pb2RevoluteJointDef = ^Tb2RevoluteJointDef;

function b2DefaultRevoluteJointDef: Tb2RevoluteJointDef; cdecl; external libbox2d;

type
  Tb2WeldJointDef = record
    base: Tb2JointDef;
    linearHertz: single;
    angularHertz: single;
    linearDampingRatio: single;
    angularDampingRatio: single;
    internalValue: longint;
  end;
  Pb2WeldJointDef = ^Tb2WeldJointDef;

function b2DefaultWeldJointDef: Tb2WeldJointDef; cdecl; external libbox2d;

type
  Tb2WheelJointDef = record
    base: Tb2JointDef;
    enableSpring: Tbool;
    hertz: single;
    dampingRatio: single;
    enableLimit: Tbool;
    lowerTranslation: single;
    upperTranslation: single;
    enableMotor: Tbool;
    maxMotorTorque: single;
    motorSpeed: single;
    internalValue: longint;
  end;
  Pb2WheelJointDef = ^Tb2WheelJointDef;

function b2DefaultWheelJointDef: Tb2WheelJointDef; cdecl; external libbox2d;

type
  Tb2ExplosionDef = record
    maskBits: Tuint64_t;
    position: Tb2Vec2;
    radius: single;
    falloff: single;
    impulsePerLength: single;
  end;
  Pb2ExplosionDef = ^Tb2ExplosionDef;

function b2DefaultExplosionDef: Tb2ExplosionDef; cdecl; external libbox2d;

type
  Tb2SensorBeginTouchEvent = record
    sensorShapeId: Tb2ShapeId;
    visitorShapeId: Tb2ShapeId;
  end;
  Pb2SensorBeginTouchEvent = ^Tb2SensorBeginTouchEvent;

  Tb2SensorEndTouchEvent = record
    sensorShapeId: Tb2ShapeId;
    visitorShapeId: Tb2ShapeId;
  end;
  Pb2SensorEndTouchEvent = ^Tb2SensorEndTouchEvent;

  Tb2SensorEvents = record
    beginEvents: Pb2SensorBeginTouchEvent;
    endEvents: Pb2SensorEndTouchEvent;
    beginCount: longint;
    endCount: longint;
  end;
  Pb2SensorEvents = ^Tb2SensorEvents;

  Tb2ContactBeginTouchEvent = record
    shapeIdA: Tb2ShapeId;
    shapeIdB: Tb2ShapeId;
    contactId: Tb2ContactId;
  end;
  Pb2ContactBeginTouchEvent = ^Tb2ContactBeginTouchEvent;

  Tb2ContactEndTouchEvent = record
    shapeIdA: Tb2ShapeId;
    shapeIdB: Tb2ShapeId;
    contactId: Tb2ContactId;
  end;
  Pb2ContactEndTouchEvent = ^Tb2ContactEndTouchEvent;

  Tb2ContactHitEvent = record
    shapeIdA: Tb2ShapeId;
    shapeIdB: Tb2ShapeId;
    contactId: Tb2ContactId;
    point: Tb2Vec2;
    normal: Tb2Vec2;
    approachSpeed: single;
  end;
  Pb2ContactHitEvent = ^Tb2ContactHitEvent;

  Tb2ContactEvents = record
    beginEvents: Pb2ContactBeginTouchEvent;
    endEvents: Pb2ContactEndTouchEvent;
    hitEvents: Pb2ContactHitEvent;
    beginCount: longint;
    endCount: longint;
    hitCount: longint;
  end;
  Pb2ContactEvents = ^Tb2ContactEvents;

  Tb2BodyMoveEvent = record
    userData: pointer;
    transform: Tb2Transform;
    bodyId: Tb2BodyId;
    fellAsleep: Tbool;
  end;
  Pb2BodyMoveEvent = ^Tb2BodyMoveEvent;

  Tb2BodyEvents = record
    moveEvents: Pb2BodyMoveEvent;
    moveCount: longint;
  end;
  Pb2BodyEvents = ^Tb2BodyEvents;

  Tb2JointEvent = record
    jointId: Tb2JointId;
    userData: pointer;
  end;
  Pb2JointEvent = ^Tb2JointEvent;

  Tb2JointEvents = record
    jointEvents: Pb2JointEvent;
    count: longint;
  end;
  Pb2JointEvents = ^Tb2JointEvents;

  Tb2ContactData = record
    contactId: Tb2ContactId;
    shapeIdA: Tb2ShapeId;
    shapeIdB: Tb2ShapeId;
    manifold: Tb2Manifold;
  end;
  Pb2ContactData = ^Tb2ContactData;

  Tb2CustomFilterFcn = function(shapeIdA: Tb2ShapeId; shapeIdB: Tb2ShapeId; context: pointer): Tbool; cdecl;
  Tb2PreSolveFcn = function(shapeIdA: Tb2ShapeId; shapeIdB: Tb2ShapeId; point: Tb2Vec2; normal: Tb2Vec2; context: pointer): Tbool; cdecl;
  Tb2OverlapResultFcn = function(shapeId: Tb2ShapeId; context: pointer): Tbool; cdecl;
  Tb2CastResultFcn = function(shapeId: Tb2ShapeId; point: Tb2Vec2; normal: Tb2Vec2; fraction: single; context: pointer): single; cdecl;
  Tb2PlaneResultFcn = function(shapeId: Tb2ShapeId; plane: Pb2PlaneResult; context: pointer): Tbool; cdecl;

type
  Pb2HexColor = ^Tb2HexColor;
  Tb2HexColor = longint;

const
  b2_colorAliceBlue = $F0F8FF;
  b2_colorAntiqueWhite = $FAEBD7;
  b2_colorAqua = $00FFFF;
  b2_colorAquamarine = $7FFFD4;
  b2_colorAzure = $F0FFFF;
  b2_colorBeige = $F5F5DC;
  b2_colorBisque = $FFE4C4;
  b2_colorBlack = $000000;
  b2_colorBlanchedAlmond = $FFEBCD;
  b2_colorBlue = $0000FF;
  b2_colorBlueViolet = $8A2BE2;
  b2_colorBrown = $A52A2A;
  b2_colorBurlywood = $DEB887;
  b2_colorCadetBlue = $5F9EA0;
  b2_colorChartreuse = $7FFF00;
  b2_colorChocolate = $D2691E;
  b2_colorCoral = $FF7F50;
  b2_colorCornflowerBlue = $6495ED;
  b2_colorCornsilk = $FFF8DC;
  b2_colorCrimson = $DC143C;
  b2_colorCyan = $00FFFF;
  b2_colorDarkBlue = $00008B;
  b2_colorDarkCyan = $008B8B;
  b2_colorDarkGoldenRod = $B8860B;
  b2_colorDarkGray = $A9A9A9;
  b2_colorDarkGreen = $006400;
  b2_colorDarkKhaki = $BDB76B;
  b2_colorDarkMagenta = $8B008B;
  b2_colorDarkOliveGreen = $556B2F;
  b2_colorDarkOrange = $FF8C00;
  b2_colorDarkOrchid = $9932CC;
  b2_colorDarkRed = $8B0000;
  b2_colorDarkSalmon = $E9967A;
  b2_colorDarkSeaGreen = $8FBC8F;
  b2_colorDarkSlateBlue = $483D8B;
  b2_colorDarkSlateGray = $2F4F4F;
  b2_colorDarkTurquoise = $00CED1;
  b2_colorDarkViolet = $9400D3;
  b2_colorDeepPink = $FF1493;
  b2_colorDeepSkyBlue = $00BFFF;
  b2_colorDimGray = $696969;
  b2_colorDodgerBlue = $1E90FF;
  b2_colorFireBrick = $B22222;
  b2_colorFloralWhite = $FFFAF0;
  b2_colorForestGreen = $228B22;
  b2_colorFuchsia = $FF00FF;
  b2_colorGainsboro = $DCDCDC;
  b2_colorGhostWhite = $F8F8FF;
  b2_colorGold = $FFD700;
  b2_colorGoldenRod = $DAA520;
  b2_colorGray = $808080;
  b2_colorGreen = $008000;
  b2_colorGreenYellow = $ADFF2F;
  b2_colorHoneyDew = $F0FFF0;
  b2_colorHotPink = $FF69B4;
  b2_colorIndianRed = $CD5C5C;
  b2_colorIndigo = $4B0082;
  b2_colorIvory = $FFFFF0;
  b2_colorKhaki = $F0E68C;
  b2_colorLavender = $E6E6FA;
  b2_colorLavenderBlush = $FFF0F5;
  b2_colorLawnGreen = $7CFC00;
  b2_colorLemonChiffon = $FFFACD;
  b2_colorLightBlue = $ADD8E6;
  b2_colorLightCoral = $F08080;
  b2_colorLightCyan = $E0FFFF;
  b2_colorLightGoldenRodYellow = $FAFAD2;
  b2_colorLightGray = $D3D3D3;
  b2_colorLightGreen = $90EE90;
  b2_colorLightPink = $FFB6C1;
  b2_colorLightSalmon = $FFA07A;
  b2_colorLightSeaGreen = $20B2AA;
  b2_colorLightSkyBlue = $87CEFA;
  b2_colorLightSlateGray = $778899;
  b2_colorLightSteelBlue = $B0C4DE;
  b2_colorLightYellow = $FFFFE0;
  b2_colorLime = $00FF00;
  b2_colorLimeGreen = $32CD32;
  b2_colorLinen = $FAF0E6;
  b2_colorMagenta = $FF00FF;
  b2_colorMaroon = $800000;
  b2_colorMediumAquaMarine = $66CDAA;
  b2_colorMediumBlue = $0000CD;
  b2_colorMediumOrchid = $BA55D3;
  b2_colorMediumPurple = $9370DB;
  b2_colorMediumSeaGreen = $3CB371;
  b2_colorMediumSlateBlue = $7B68EE;
  b2_colorMediumSpringGreen = $00FA9A;
  b2_colorMediumTurquoise = $48D1CC;
  b2_colorMediumVioletRed = $C71585;
  b2_colorMidnightBlue = $191970;
  b2_colorMintCream = $F5FFFA;
  b2_colorMistyRose = $FFE4E1;
  b2_colorMoccasin = $FFE4B5;
  b2_colorNavajoWhite = $FFDEAD;
  b2_colorNavy = $000080;
  b2_colorOldLace = $FDF5E6;
  b2_colorOlive = $808000;
  b2_colorOliveDrab = $6B8E23;
  b2_colorOrange = $FFA500;
  b2_colorOrangeRed = $FF4500;
  b2_colorOrchid = $DA70D6;
  b2_colorPaleGoldenRod = $EEE8AA;
  b2_colorPaleGreen = $98FB98;
  b2_colorPaleTurquoise = $AFEEEE;
  b2_colorPaleVioletRed = $DB7093;
  b2_colorPapayaWhip = $FFEFD5;
  b2_colorPeachPuff = $FFDAB9;
  b2_colorPeru = $CD853F;
  b2_colorPink = $FFC0CB;
  b2_colorPlum = $DDA0DD;
  b2_colorPowderBlue = $B0E0E6;
  b2_colorPurple = $800080;
  b2_colorRebeccaPurple = $663399;
  b2_colorRed = $FF0000;
  b2_colorRosyBrown = $BC8F8F;
  b2_colorRoyalBlue = $4169E1;
  b2_colorSaddleBrown = $8B4513;
  b2_colorSalmon = $FA8072;
  b2_colorSandyBrown = $F4A460;
  b2_colorSeaGreen = $2E8B57;
  b2_colorSeaShell = $FFF5EE;
  b2_colorSienna = $A0522D;
  b2_colorSilver = $C0C0C0;
  b2_colorSkyBlue = $87CEEB;
  b2_colorSlateBlue = $6A5ACD;
  b2_colorSlateGray = $708090;
  b2_colorSnow = $FFFAFA;
  b2_colorSpringGreen = $00FF7F;
  b2_colorSteelBlue = $4682B4;
  b2_colorTan = $D2B48C;
  b2_colorTeal = $008080;
  b2_colorThistle = $D8BFD8;
  b2_colorTomato = $FF6347;
  b2_colorTurquoise = $40E0D0;
  b2_colorViolet = $EE82EE;
  b2_colorWheat = $F5DEB3;
  b2_colorWhite = $FFFFFF;
  b2_colorWhiteSmoke = $F5F5F5;
  b2_colorYellow = $FFFF00;
  b2_colorYellowGreen = $9ACD32;
  b2_colorBox2DRed = $DC3132;
  b2_colorBox2DBlue = $30AEBF;
  b2_colorBox2DGreen = $8CC924;
  b2_colorBox2DYellow = $FFEE8C;

type
  Tb2DebugDraw = record
    DrawPolygonFcn: procedure(vertices: Pb2Vec2; vertexCount: longint; color: Tb2HexColor; context: pointer); cdecl;
    DrawSolidPolygonFcn: procedure(transform: Tb2Transform; vertices: Pb2Vec2; vertexCount: longint; radius: single; color: Tb2HexColor;
      context: pointer); cdecl;
    DrawCircleFcn: procedure(center: Tb2Vec2; radius: single; color: Tb2HexColor; context: pointer); cdecl;
    DrawSolidCircleFcn: procedure(transform: Tb2Transform; radius: single; color: Tb2HexColor; context: pointer); cdecl;
    DrawSolidCapsuleFcn: procedure(p1: Tb2Vec2; p2: Tb2Vec2; radius: single; color: Tb2HexColor; context: pointer); cdecl;
    DrawLineFcn: procedure(p1: Tb2Vec2; p2: Tb2Vec2; color: Tb2HexColor; context: pointer); cdecl;
    DrawTransformFcn: procedure(transform: Tb2Transform; context: pointer); cdecl;
    DrawPointFcn: procedure(p: Tb2Vec2; size: single; color: Tb2HexColor; context: pointer); cdecl;
    DrawStringFcn: procedure(p: Tb2Vec2; s: pchar; color: Tb2HexColor; context: pointer); cdecl;
    drawingBounds: Tb2AABB;
    forceScale: single;
    jointScale: single;
    drawShapes: Tbool;
    drawJoints: Tbool;
    drawJointExtras: Tbool;
    drawBounds: Tbool;
    drawMass: Tbool;
    drawBodyNames: Tbool;
    drawContactPoints: Tbool;
    drawGraphColors: Tbool;
    drawContactFeatures: Tbool;
    drawContactNormals: Tbool;
    drawContactForces: Tbool;
    drawFrictionForces: Tbool;
    drawIslands: Tbool;
    context: pointer;
  end;
  Pb2DebugDraw = ^Tb2DebugDraw;

function b2DefaultDebugDraw: Tb2DebugDraw; cdecl; external libbox2d;

// === Konventiert am: 7-3-26 16:28:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
