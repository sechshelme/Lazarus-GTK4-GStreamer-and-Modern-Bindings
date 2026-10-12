unit EngineCalc;

{$modeswitch arrayoperators on}
{$modeswitch typehelpers}

interface

uses
  fp_box2d;

const
  BALLCOUNT = 1000;

type
  TColor = record
    r, g, b, a: single;
  end;
  PColor = ^TColor;

  TuserData = record
    wantsEvents: boolean;
    color: TColor
  end;
  PuserData = ^TuserData;


  Tb2BodyIds = array of Tb2BodyId;

type

  { Tb2BodyIdsHelper }

  Tb2BodyIdsHelper = type helper for Tb2BodyIds
    procedure Add(body: Tb2BodyId);
    function Last: Tb2BodyId;
  end;

type

  { TEngine }

  TEngine = class(TObject)
  private
    worldId: Tb2WorldId;
    BodyIds: Tb2BodyIds;
    function GetSceneBodyIds: Tb2BodyIds;
  public
    property SceneBodyIds: Tb2BodyIds read GetSceneBodyIds;
    constructor Create;
    destructor Destroy; override;
    procedure NextScene;
  end;

implementation

const
  clRed: TColor = (r: 1.0; g: 0.0; b: 0.0; a: 1.0);
  clGreen: TColor = (r: 0.0; g: 1.0; b: 0.0; a: 1.0);
  clBlue: TColor = (r: 0.0; g: 0.0; b: 1.0; a: 1.0);

  clLightRed: TColor = (r: 1.0; g: 0.5; b: 0.5; a: 1.0);
  clLightGreen: TColor = (r: 0.5; g: 1.0; b: 0.5; a: 1.0);
  clLightBlue: TColor = (r: 0.5; g: 0.5; b: 1.0; a: 1.0);

  clLightYellow: TColor = (r: 1.0; g: 1.0; b: 0.5; a: 1.0);
  clLightMagenta: TColor = (r: 1.0; g: 0.5; b: 1.0; a: 1.0);
  clLightCyan: TColor = (r: 0.5; g: 1.0; b: 1.0; a: 1.0);

type
  TBoxData = record
    size, ofs: Tb2Vec2;
    angele: single;
  end;

  Tb2Circles = array of Tb2Circle;
  Tb2Capsules = array of Tb2Capsule;

const
  StaticBoxDatas: array of TBoxData = (
    (size: (x: 50.0; y: 2.5); ofs: (x: 0.0; y: 0.0); angele: 0.0),
    (size: (x: 50.0; y: 2.5); ofs: (x: 75.0; y: -10.0); angele: 0.3),
    (size: (x: 50.0; y: 2.5); ofs: (x: 20.0; y: -40.0); angele: -0.3),
    (size: (x: 50.0; y: 2.5); ofs: (x: 90.0; y: -80.0); angele: 0.3),
    (size: (x: 50.0; y: 2.5); ofs: (x: 0.0; y: -120.0); angele: 0.0),
    (size: (x: 50.0; y: 2.5); ofs: (x: -65.0; y: -100.0); angele: pi / 2),
    (size: (x: 50.0; y: 2.5); ofs: (x: 100.0; y: -150.0); angele: -0.2)
    );

  DynamicBoxDatas: array of TBoxData = (
    (size: (x: 20.0; y: 2.5); ofs: (x: 180.0; y: -10.0); angele: 0.0),
    (size: (x: 20.0; y: 2.5); ofs: (x: 220.0; y: -30.0); angele: 0.3)
    );

  StaticBallData: Tb2Circles = (
    (center: (x: 90.0; y: -40.0); radius: 15.0),
    (center: (x: 185.0; y: -80.0); radius: 20.0),
    (center: (x: 180.0; y: -170.0); radius: 20.0)
    );

  StaticCapsuleData: Tb2Capsules = (
    (center1: (x: -5.0; y: -170.0); center2: (x: 20.0; y: -150.0); radius: 5.0),
    (center1: (x: 35.0; y: -160.0); center2: (x: 45.0; y: -150.0); radius: 5.0)
    );



procedure NewUserData(body: Tb2BodyId; col: TColor; wantsEvents: boolean = False);
var
  ud: PuserData = nil;
begin
  ud := GetMem(SizeOf(TuserData));
  ud^.wantsEvents := wantsEvents;
  ud^.color := col;
  b2Body_SetUserData(body, ud);
end;

{ Tb2BodyIdsHelper }

procedure Tb2BodyIdsHelper.Add(body: Tb2BodyId);
var
  len: SizeInt;
begin
  len := Length(Self);
  SetLength(self, len + 1);
  Self[len] := body;
end;

function Tb2BodyIdsHelper.Last: Tb2BodyId;
begin
  Result := Self[Length(Self) - 1];
end;

constructor TEngine.Create;
var
  i: integer;
  worldDef: Tb2WorldDef;
  bodyDef: Tb2BodyDef;
  shapeDef: Tb2ShapeDef;
  circle: Tb2Circle;
  polygon: Tb2Polygon;
  shapeId: Tb2ShapeId;
  capsule: Tb2Capsule;
begin
  worldDef := b2DefaultWorldDef;
  worldDef.gravity.SetItems(0.0, -10.0);
  worldId := b2CreateWorld(@worldDef);

  // ===== Static polygon
  bodyDef := b2DefaultBodyDef;
  shapeDef := b2DefaultShapeDef;

  BodyIds.Add(b2CreateBody(worldId, @bodyDef));
  NewUserData(BodyIds.Last, clLightBlue);
  for i := 0 to Length(StaticBoxDatas) - 1 do begin
    with StaticBoxDatas[i] do begin
      polygon := b2MakeOffsetBox(size.x, size.y, ofs, b2MakeRot(angele));
      b2CreatePolygonShape(BodyIds.Last, @shapeDef, @polygon);
    end;
  end;

  // ===== Static Ball
  bodyDef := b2DefaultBodyDef;
  shapeDef := b2DefaultShapeDef;

  BodyIds.Add(b2CreateBody(worldId, @bodyDef));
  NewUserData(BodyIds.Last, clLightCyan);
  for i := 0 to Length(StaticBallData) - 1 do begin;
    circle := StaticBallData[i];
    b2CreateCircleShape(BodyIds.Last, @shapeDef, @circle);
  end;

  // ===== Capsule
  bodyDef := b2DefaultBodyDef;
  shapeDef := b2DefaultShapeDef;

  BodyIds.Add(b2CreateBody(worldId, @bodyDef));
  NewUserData(BodyIds.Last, clLightMagenta);

  for i := 0 to Length(StaticCapsuleData) - 1 do begin
    capsule := StaticCapsuleData[i];
    b2CreateCapsuleShape(BodyIds.Last, @shapeDef, @capsule);
  end;

  // ===== Dynamic polygon
  shapeDef := b2DefaultShapeDef;

  for i := 0 to Length(DynamicBoxDatas) - 1 do begin
    with DynamicBoxDatas[i] do begin
      bodyDef := b2DefaultBodyDef;
      bodyDef._type := b2_kinematicBody;
      bodyDef.position := ofs;
      bodyDef.angularVelocity := 0.5 * (i + 1);

      BodyIds.Add(b2CreateBody(worldId, @bodyDef));
      NewUserData(BodyIds.Last, clLightRed);
      polygon := b2MakeOffsetBox(size.x, size.y, b2Vec2_zero, b2MakeRot(angele));
      b2CreatePolygonShape(BodyIds.Last, @shapeDef, @polygon);
    end;
  end;

  // ===== Dynamic Ball
  shapeDef := b2DefaultShapeDef;
  shapeDef.density := 1.0;
  shapeDef.material.friction := 0.05;
  shapeDef.material.restitution := 0.2;
  shapeDef.enableContactEvents := True;

  for i := 0 to BALLCOUNT - 1 do begin
    bodyDef := b2DefaultBodyDef;
    bodyDef._type := b2_dynamicBody;
    bodyDef.position.SetItems(50.0, 50.0 + i * 10);
    bodyDef.linearVelocity.SetItems(5.0, 0.0);

    BodyIds.Add(b2CreateBody(worldId, @bodyDef));
    NewUserData(BodyIds.Last, clRed, True);
    circle.SetItems(0.0, 0.0, Random * 4);
    shapeId := b2CreateCircleShape(BodyIds.Last, @shapeDef, @circle);
    b2Shape_SetRestitution(shapeId, 0.7);
  end;

  // ===== Kinematische Hanteln
  shapeDef := b2DefaultShapeDef;

  for i := 0 to 2 do begin
    bodyDef := b2DefaultBodyDef;
    bodyDef._type := b2_kinematicBody;
    bodyDef.position.SetItems(80.0 + (i * 40.0), -120.0);
    bodyDef.angularVelocity := 10.8 * (i + 1);

    BodyIds.Add(b2CreateBody(worldId, @bodyDef));
    NewUserData(BodyIds.Last, clLightGreen);

    circle.SetItems(-7.0, 0.0, 4.5);
    b2CreateCircleShape(BodyIds.Last, @shapeDef, @circle);

    circle.SetItems(7.0, 0.0, 2.5);
    b2CreateCircleShape(BodyIds.Last, @shapeDef, @circle);

    polygon := b2MakeOffsetBox(7.0, 1.0, b2Vec2_zero, b2Rot_identity);
    b2CreatePolygonShape(BodyIds.Last, @shapeDef, @polygon);
  end;
end;

destructor TEngine.Destroy;
var
  ud: PuserData;
  i: integer;
begin
  for i := 0 to Length(BodyIds) - 1 do begin
    ud := b2Body_GetUserData(BodyIds[i]);
    if ud <> nil then  begin
      Freemem(ud);
    end;
  end;
  b2DestroyWorld(worldId);
  inherited Destroy;
end;

procedure TEngine.NextScene;
var
  event: Tb2ContactEvents;
  i: integer;

  procedure Contact(shape: Tb2ShapeId);
  var
    ud: PuserData;
    body: Tb2BodyId;
  begin
    body := b2Shape_GetBody(shape);
    ud := b2Body_GetUserData(body);
    if ud <> nil then begin
      if ud^.wantsEvents then  begin
        ud^.color := clLightRed;
      end;
    end;
  end;

begin
  b2World_Step(worldId, 1.0 / 60.0, 4);

  event := b2World_GetContactEvents(worldId);
  //  WriteLn('begin: ', event.beginCount: 5, '   end:   ', event.endCount: 5);

  for i := 0 to event.beginCount - 1 do begin
    Contact(event.beginEvents[i].shapeIdA);
    Contact(event.beginEvents[i].shapeIdB);
  end;
end;

function TEngine.GetSceneBodyIds: Tb2BodyIds;
var
  i: integer;
  p, v: Tb2Vec2;
begin
  Result := nil;
  for i := 0 to Length(Result) - 1 do begin
    p := b2Body_GetPosition(Result[i]);
    if p.y < -250.0 then begin
      v.SetItems(50.0, 50.0);
      b2Body_SetTransform(Result[i], v, b2Rot_identity);
      b2Body_SetLinearVelocity(Result[i], b2Vec2_zero);
      b2Body_SetAngularVelocity(Result[i], 0.0);
    end;
  end;

  Result := BodyIds;
end;

end.
