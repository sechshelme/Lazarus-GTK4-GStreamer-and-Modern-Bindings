unit manifold;

interface

uses
  fp_manifoldc, fp_manifold_obj;

type

  { TMyManifold }

  TMyManifold=class (TObject)
    public
    mesh: TMeshGLClass;
    n_verts, n_tris, n_props: Tsize_t;
    verts_data: Psingle;
    tris_data: Puint32_t;
    er: TManifoldError;
    cube, hole, hole2: TManifoldClass;
    public
    constructor Create;
    destructor Destroy; override;

  end;

implementation

{ TMyManifold }

constructor TMyManifold.Create;
const
  Sektor = 32;
  HoleCount = 13;
var
  i: Integer;
begin
  inherited Create;

  verts_data:= nil;
  tris_data:= nil;

  cube := TManifoldClass.cube(10.0, 10.0, 10.0, 15);

  hole := TManifoldClass.cube(20.0, 6.0, 6.0, 1);
  hole := TManifoldClass.rotate(hole, 20.0, 0.0, 0.0, True);
  cube := TManifoldClass.difference(cube, hole, True, True);

  hole := TManifoldClass.cylinder(20.0, 3.5, 3.5, Sektor, 1);
  hole := TManifoldClass.rotate(hole, 90.0, 0.0, 0.0, True);
  cube := TManifoldClass.difference(cube, hole, True, True);

  hole := TManifoldClass.cylinder(20.0, 3.5, 3.5, Sektor + 5, 1);
  cube := TManifoldClass.difference(cube, hole, True, True);

  hole := TManifoldClass.cylinder(20.0, 0.5, 0.5, Sektor + 5, 1);
  hole := TManifoldClass.translate(hole, 4.25, 0.0, 0.0, True);
  for i := 0 to HoleCount - 1 do begin
    hole2 := TManifoldClass.rotate(hole, 0.0, 0.0, 360 / HoleCount * i, False);
    cube := TManifoldClass.difference(cube, hole2, True, True);
  end;
  hole.Free;

  cube := TManifoldClass.calculate_normals(cube, 3, 30.0, True);
  er := manifold_status(cube.obj);
  if er <> MANIFOLD_NO_ERROR then begin
    WriteLn('Fehler in Manifold Geometrie!  (', er, ')');
  end;

  mesh := TMeshGLClass.get_meshgl(cube, True);
  n_verts := mesh.meshgl_num_vert;
  n_tris := mesh.meshgl_num_tri;
  n_props := mesh.meshgl_num_prop;

  WriteLn('--- MANIFOLD CSG ERGEBNIS ---');
  WriteLn('n_verts: ', n_verts, ' | n_tris: ', n_tris, ' | n_props: ', n_props);

  tris_data := mesh.meshgl_tri_verts;
  verts_data := mesh.meshgl_vert_properties;
end;

destructor TMyManifold.Destroy;
begin
  inherited Destroy;
end;

end.

