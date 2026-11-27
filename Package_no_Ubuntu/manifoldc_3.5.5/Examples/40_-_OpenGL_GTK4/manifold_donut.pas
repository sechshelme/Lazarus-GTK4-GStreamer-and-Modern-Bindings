unit Manifold_Donut;

interface

uses
  fp_glib2,
  fp_manifoldc, fp_manifold_obj,
  Manifold_Mesh;

type

  { TManifold_Donut }

  TManifold_Donut = class(TManifold_Mesh)
  public
    function CreateMesh: TManifoldClass; override;
  end;

implementation

{ TManifold_Donut }

function TManifold_Donut.CreateMesh: TManifoldClass;
const
  Sektor = 64;
  RingRadius = 7.5;
  RohrRadius = 2.5;
  BolzenRadius = 1.2;
var
  HoleCount: integer;
var
  i: integer;
  profilCS: TCrossSectionClass;
  profilPolys: TPolygonsClass;
  hole, hole2: TManifoldClass;
begin
  HoleCount := g_random_int_range(4, 16);

  profilCS := TCrossSectionClass.cross_section_circle(RohrRadius, Sektor);
  profilCS := TCrossSectionClass.cross_section_translate(profilCS, RingRadius, 0.0, True);
  profilPolys := TPolygonsClass.cross_section_to_polygons(profilCS, True);

  Result := TManifoldClass.revolve(profilPolys, Sektor, 360.0, True);

  hole := TManifoldClass.cylinder(RingRadius + RohrRadius * 2.0, BolzenRadius, BolzenRadius, 24, 0);
  hole := TManifoldClass.rotate(hole, 0.0, 90.0, 0.0, True);

  for i := 0 to HoleCount - 1 do begin
    hole2 := TManifoldClass.rotate(hole, 0.0, 0.0, 360.0 / HoleCount * i, False);
    Result := TManifoldClass.difference(Result, hole2, True, True);
  end;

  hole.Free;
end;

end.
