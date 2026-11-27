unit Manifold_Cube;

interface

uses
  fp_glib2,
  fp_manifoldc, fp_manifold_obj,
  Manifold_Mesh;

type
  TManifold_Cube = class(TManifold_Mesh)
  public
    function CreateMesh: TManifoldClass; override;
  end;

implementation

function TManifold_Cube.CreateMesh: TManifoldClass;
const
  Sektor = 32;
var
  i: integer;
  er: TManifoldError;
  hole, hole2: TManifoldClass;
  HoleCount: integer;
begin
  HoleCount := g_random_int_range(4, 16);

  Result := TManifoldClass.cube(10.0, 10.0, 10.0, 15);

  hole := TManifoldClass.cube(20.0, 6.0, 6.0, 1);
  hole := TManifoldClass.rotate(hole, 20.0, 0.0, 0.0, True);
  Result := TManifoldClass.difference(Result, hole, True, True);

  hole := TManifoldClass.cylinder(20.0, 3.5, 3.5, Sektor, 1);
  hole := TManifoldClass.rotate(hole, 90.0, 0.0, 0.0, True);
  Result := TManifoldClass.difference(Result, hole, True, True);

  hole := TManifoldClass.cylinder(20.0, 3.5, 3.5, Sektor + 5, 1);
  Result := TManifoldClass.difference(Result, hole, True, True);

  hole := TManifoldClass.cylinder(20.0, 0.5, 0.5, Sektor + 5, 1);
  hole := TManifoldClass.translate(hole, 4.25, 0.0, 0.0, True);
  for i := 0 to HoleCount - 1 do begin
    hole2 := TManifoldClass.rotate(hole, 0.0, 0.0, 360 / HoleCount * i, False);
    Result := TManifoldClass.difference(Result, hole2, True, True);
  end;
  hole.Free;
end;

end.
