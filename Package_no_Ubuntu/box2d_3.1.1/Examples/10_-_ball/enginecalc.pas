unit EngineCalc;

interface

uses fp_box2d;

type
  TEngine = class(TObject)
  private
    worldDef: Tb2WorldDef;
    worldId: Tb2WorldId;
    groundBodyDef, bodyDef: Tb2BodyDef;
    groundId, bodyId: Tb2BodyId;
    groundBox: Tb2Polygon;
    groundShapeDef, shapeDef: Tb2ShapeDef;
    circle: Tb2Circle;
    shapeId: Tb2ShapeId;
    timeStep: single;
    subStepCount: integer;
  public
    constructor Create;
    function GetPos: Tb2Vec2;
    destructor Destroy; override;
  end;

implementation

const
  // ==========================================================
  // PHYSIK-EINSTELLUNGEN
  // ==========================================================

  // Erdähnliche Gravitation: -10 Meter pro Sekunde im Quadrat
  GRAVITY_Y = -10.0;

  // Zeit-Schritt: 1/60 Sekunde (entspricht 60 FPS)
  TIME_STEP = 1.0 / 60.0;

  // v3-spezifisch: Unterteilt jeden Zeitschritt in 4 Teile
  SUB_STEPS = 4;

  // ==========================================================
  // OBJEKT-EINSTELLUNGEN
  // ==========================================================

  // Startposition des Balls
  BALL_START_X = 0.0;
  BALL_START_Y = 10.0;

  // Horizontale Geschwindigkeit
  BALL_VELOCITY_X = 5.0;

  // Radius des Balls: 0.5 Meter
  BALL_RADIUS = 0.5;

  // Dichte: Bestimmt das Gewicht (kg/m²)
  BALL_DENSITY = 1.0;

  // Bounciness: 0.7 (70% Energieerhalt)
  BALL_RESTITUTION = 0.7;

  // Boden-Position
  GROUND_Y = -2.0;

  // Box2D nutzt "halbe Ausdehnung"
  GROUND_HALF_WIDTH = 50.0;
  GROUND_HALF_HEIGHT = 1.0;

constructor TEngine.Create;
begin
  // 1. Welt erstellen (Gravitation: 10m/s² nach unten)
  worldDef := b2DefaultWorldDef;
  worldDef.gravity.SetItems(0.0, GRAVITY_Y - 10.0);
  worldId := b2CreateWorld(@worldDef);

  // 2. Boden erstellen (Statisch)
  groundBodyDef := b2DefaultBodyDef();
  groundBodyDef.position.SetItems(0.0, GROUND_Y); // Boden liegt bei y = -2
  groundBodyDef.rotation.SetItems(Cos(0.05), Sin(-0.05)); // Boden liegt bei y = -2
  groundId := b2CreateBody(worldId, @groundBodyDef);

  groundBox := b2MakeBox(GROUND_HALF_WIDTH, GROUND_HALF_HEIGHT); // 100m breit, 2m hoch
  groundShapeDef := b2DefaultShapeDef;
  b2CreatePolygonShape(groundId, @groundShapeDef, @groundBox);

  // 3. Ball erstellen (Dynamisch)
  bodyDef := b2DefaultBodyDef;
  bodyDef._type := b2_dynamicBody;
  bodyDef.position.SetItems(BALL_START_X, BALL_START_Y); // Startet bei 10m Höhe

  // NEU: Dem Ball eine Seitwärtsgeschwindigkeit geben (5m/s nach rechts)
  bodyDef.linearVelocity.SetItems(BALL_VELOCITY_X, 0.0);

  bodyId := b2CreateBody(worldId, @bodyDef);

  circle.SetItems(0.0, 0.0, BALL_RADIUS);
  shapeDef := b2DefaultShapeDef();
  shapeDef.density := BALL_DENSITY;

  // Shape erstellen und ID speichern
  shapeId := b2CreateCircleShape(bodyId, @shapeDef, @circle);

  // Bounciness über die Setter-Funktion setzen (0.7 = 70% Energieerhalt)
  b2Shape_SetRestitution(shapeId, BALL_RESTITUTION);

  // 4. Simulation (160 Schritte ~ 2.6 Sekunden)
  timeStep := TIME_STEP;
  subStepCount := SUB_STEPS;
end;

function TEngine.GetPos: Tb2Vec2;
begin
  b2World_Step(worldId, timeStep, subStepCount);
  Result := b2Body_GetPosition(bodyId);
end;

destructor TEngine.Destroy;
begin
  b2DestroyWorld(worldId);
  inherited Destroy;
end;

end.
