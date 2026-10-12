unit EngineCalc;

{$modeswitch arrayoperators on}
{$modeswitch typehelpers}

interface

uses
  fp_box2d;

type
  TColor = record
    r, g, b: single;
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
  clRed: TColor = (r: 1.0; g: 0.0; b: 0.0);
  clGreen: TColor = (r: 0.0; g: 1.0; b: 0.0);
  clBlue: TColor = (r: 0.0; g: 0.0; b: 1.0);

  clLightRed: TColor = (r: 1.0; g: 0.5; b: 0.5);
  clLightGreen: TColor = (r: 0.5; g: 1.0; b: 0.5);
  clLightBlue: TColor = (r: 0.5; g: 0.5; b: 1.0);

  clLightYellow: TColor = (r: 1.0; g: 1.0; b: 0.5);
  clLightMagenta: TColor = (r: 1.0; g: 0.5; b: 1.0);
  clLightCyan: TColor = (r: 0.5; g: 1.0; b: 1.0);

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
  worldDef: Tb2WorldDef;
  pivotDef, bodyDef: Tb2BodyDef;
  shapeDef: Tb2ShapeDef;
  box: Tb2Polygon;
  circle: Tb2Circle;
  jointDef: Tb2RevoluteJointDef;

  pivotId, prevBodyId, currentBodyId: Tb2BodyId;
  i: integer;
const
  JOINT_COUNT = 5;
  LINK_HEIGHT = 0.8;
  LINK_WIDTH = 0.1;
begin
  worldDef := b2DefaultWorldDef;
  worldDef.gravity.SetItems(0.0, -9.81);
  worldId := b2CreateWorld(@worldDef);

  pivotDef := b2DefaultBodyDef;
  pivotDef.position.SetItems(0.0, 8.0);
  pivotId := b2CreateBody(worldId, @pivotDef);

  shapeDef := b2DefaultShapeDef;
  circle.center := b2Vec2_zero;
  circle.radius := 0.08;
  b2CreateCircleShape(pivotId, @shapeDef, @circle);

  BodyIds.Add(pivotId);
  NewUserData(pivotId, clLightRed);

  prevBodyId := pivotId;

  for i := 1 to JOINT_COUNT do begin
    bodyDef := b2DefaultBodyDef;
    bodyDef._type := b2_dynamicBody;
    bodyDef.enableSleep := False;
    bodyDef.angularDamping := 0.1;

    bodyDef.position.SetItems(i * 0.3, 8.0 - (i * LINK_HEIGHT));
    currentBodyId := b2CreateBody(worldId, @bodyDef);

    box := b2MakeBox(LINK_WIDTH / 2, LINK_HEIGHT / 2);
    b2CreatePolygonShape(currentBodyId, @shapeDef, @box);

    b2CreateCircleShape(currentBodyId, @shapeDef, @circle);


    jointDef := b2DefaultRevoluteJointDef();
    jointDef.base.bodyIdA := prevBodyId;
    jointDef.base.bodyIdB := currentBodyId;

    if i = 1 then begin
      jointDef.base.localFrameA.p := b2Vec2_zero;
    end else begin
      jointDef.base.localFrameA.p.SetItems(0.0, -LINK_HEIGHT / 2);
    end;

    jointDef.base.localFrameB.p.SetItems(0.0, LINK_HEIGHT / 2);

    jointDef.base.localFrameA.q.SetItems(1.0, 0.0);
    jointDef.base.localFrameB.q.SetItems(1.0, 0.0);

    b2CreateRevoluteJoint(worldId, @jointDef);

    BodyIds.Add(currentBodyId);
    NewUserData(currentBodyId, clLightCyan);

    prevBodyId := currentBodyId;
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
  v, a: single;
  v2: Tb2Vec2;
begin
  b2World_Step(worldId, 1.0 / 60.0, 4);

  //v := b2Body_GetAngularVelocity(bodyId);
  //a := b2Rot_GetAngle(b2Body_GetRotation(bodyId));
  //
  //if (Abs(v) < 0.01) and (Abs(a) < 0.01) then  begin
  //  v2.SetItems(1.0, 3.0);
  //  b2Body_SetTransform(bodyId, v2, b2Rot_identity);
  //
  //  b2Body_SetLinearVelocity(bodyId, b2Vec2_zero);
  //  b2Body_SetAngularVelocity(bodyId, 0.0);
  //end;
end;

function TEngine.GetSceneBodyIds: Tb2BodyIds;
begin
  Result := BodyIds;
end;

end.
