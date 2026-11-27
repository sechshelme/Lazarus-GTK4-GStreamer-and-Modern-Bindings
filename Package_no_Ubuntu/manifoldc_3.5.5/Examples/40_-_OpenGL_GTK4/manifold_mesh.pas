unit Manifold_Mesh;

interface

uses
  fp_glib2,
  fp_manifoldc, fp_manifold_obj;

type
  TManifold_Mesh = class(TObject)
  protected
    mesh: TMeshGLClass;
  public
    constructor Create;
    destructor Destroy; override;
    function CreateMesh: TManifoldClass; virtual;
    function get_verts_data: Psingle;
    function get_n_verts: Tsize_t;
    function get_tris_data: Puint32_t;
    function get_n_tris: Tsize_t;
  end;

implementation

constructor TManifold_Mesh.Create;
var
  cube: TManifoldClass;
  er: TManifoldError;
begin
  inherited Create;
  mesh := nil;
  cube := CreateMesh;
  if cube <> nil then begin
    cube := TManifoldClass.calculate_normals(cube, 0, 30.0, True);

    er := manifold_status(cube.obj);
    if er <> MANIFOLD_NO_ERROR then begin
      g_print('Fehler in Manifold Geometrie! (%d)'#10, Ord(er));
    end;

    mesh := TMeshGLClass.get_meshgl(cube, True);

    g_print('--- MANIFOLD CSG ERGEBNIS ---'#10);
    g_print('n_verts: %u | n_tris: %u | n_props: %u'#10, mesh.meshgl_num_vert, mesh.meshgl_num_tri, mesh.meshgl_num_prop);
  end else begin
    g_print('WARNUNG: CreateMesh hat nil zurückgegeben!'#10);
  end;
end;

destructor TManifold_Mesh.Destroy;
begin
  mesh.Free;
  inherited Destroy;
end;

function TManifold_Mesh.CreateMesh: TManifoldClass;
begin
  Result := TManifoldClass.cube(10.0, 10.0, 10.0, 15);
end;

function TManifold_Mesh.get_verts_data: Psingle;
begin
  Result := mesh.meshgl_vert_properties;
end;

function TManifold_Mesh.get_n_verts: Tsize_t;
begin
  Result := mesh.meshgl_num_vert;
end;

function TManifold_Mesh.get_tris_data: Puint32_t;
begin
  Result := mesh.meshgl_tri_verts;
end;

function TManifold_Mesh.get_n_tris: Tsize_t;
begin
  Result := mesh.meshgl_num_tri;
end;


end.
