unit Manifold_Cube;

interface

uses
  fp_glib2,
  fp_manifoldc, fp_manifold_obj,
  Manifold_Mesh;

type

  { TManifold_Cube }

  TManifold_Cube=class(TManifold_Mesh)
    public
    function get_verts_data: Psingle;
    function get_n_verts: Tsize_t;
    function get_tris_data: Puint32_t;
    function get_n_tris: Tsize_t;
  end;

implementation

{ TManifold_Cube }

function TManifold_Cube.get_verts_data: Psingle;
begin
  Result := mesh.meshgl_vert_properties;
end;

function TManifold_Cube.get_n_verts: Tsize_t;
begin
  Result := mesh.meshgl_num_vert;
end;

function TManifold_Cube.get_tris_data: Puint32_t;
begin
  Result := mesh.meshgl_tri_verts;
end;

function TManifold_Cube.get_n_tris: Tsize_t;
begin
  Result := mesh.meshgl_num_tri;
end;


end.

