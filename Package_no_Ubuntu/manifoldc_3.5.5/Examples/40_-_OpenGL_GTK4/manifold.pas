unit manifold;

interface

uses
  fp_manifoldc, fp_manifold_obj;

type
  TMyManifold = class(TObject)
  private
    mesh: TMeshGLClass;
  public
    constructor Create;
    destructor Destroy; override;
    function get_n_verts: Tsize_t;
    function get_n_tris: Tsize_t;
    function get_n_props: Tsize_t;
    function get_verts_data: Psingle;
    function get_tris_data: Puint32_t;
  end;

implementation

constructor TMyManifold.Create;
const
  Sektor = 32;
  HoleCount = 13;
var
  i: integer;
  er: TManifoldError;
  cube, hole, hole2: TManifoldClass;
begin
  inherited Create;

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

  cube := TManifoldClass.calculate_normals(cube, 0, 30.0, True);
  er := manifold_status(cube.obj);
  if er <> MANIFOLD_NO_ERROR then begin
    WriteLn('Fehler in Manifold Geometrie!  (', er, ')');
  end;

  mesh := TMeshGLClass.get_meshgl(cube, True);

  WriteLn('--- MANIFOLD CSG ERGEBNIS ---');
  WriteLn('n_verts: ', mesh.meshgl_num_vert, ' | n_tris: ', mesh.meshgl_num_tri, ' | n_props: ', mesh.meshgl_num_prop);
end;

destructor TMyManifold.Destroy;
begin
  mesh.Free;
  inherited Destroy;
end;

function TMyManifold.get_n_verts: Tsize_t;
begin
  Result := mesh.meshgl_num_vert;
end;

function TMyManifold.get_n_tris: Tsize_t;
begin
  Result := mesh.meshgl_num_tri;
end;

function TMyManifold.get_n_props: Tsize_t;
begin
  Result := mesh.meshgl_num_prop;
end;

function TMyManifold.get_verts_data: Psingle;
begin
  Result := mesh.meshgl_vert_properties;
end;

function TMyManifold.get_tris_data: Puint32_t;
begin
  Result := mesh.meshgl_tri_verts;
end;

end.
