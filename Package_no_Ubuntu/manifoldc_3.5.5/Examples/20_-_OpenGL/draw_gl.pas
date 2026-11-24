unit draw_gl;

{$i-}

interface

uses
  fp_glew,
  fp_manifold_obj,
  fp_manifoldc;

const
  MAX_RAYS = 200;

procedure InitScene;
procedure draw;
procedure CloseScene;


implementation

type
  TVector3f = array[0..2] of single;
  TVector4f = array[0..3] of single;

var
  ListeID: TGLuint;

procedure InitScene;
var
  mesh: TMeshGLClass;

  n_verts, n_tris, n_props: longint;
  verts_data: Psingle = nil;
  tris_data: Puint32_t = nil;
  x, y, z, nx, ny, nz: single;
  i: integer;
  a, b, c: Tuint32_t;

  v: TVector3f;
  vectors: array of record
    v, n: TVector3f;
    end
  = nil;

  er: TManifoldError;
  cube, hole, hole2: TManifoldClass;

const
  Sektor = 32;
  HoleCount = 13;
begin

  // === Manifold
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
  WriteLn('n_verts: ', n_verts);
  WriteLn('n_tris: ', n_tris);
  WriteLn('n_props: ', n_props);

  tris_data := mesh.meshgl_tri_verts;

  verts_data := mesh.meshgl_vert_properties;

  WriteLn(#10'Liste aller Eckpunkte (Vertices):');

  SetLength(vectors, n_verts);

  for  i := 0 to n_verts - 1 do begin
    x := verts_data[i * n_props + 0];
    y := verts_data[i * n_props + 1];
    z := verts_data[i * n_props + 2];

    nx := verts_data[i * n_props + 6];
    ny := verts_data[i * n_props + 7];
    nz := verts_data[i * n_props + 8];

    WriteLn(i: 3, '  ', x: 4: 2, '/', y: 4: 2, '/', z: 4: 2, ' - ', nx: 4: 2, '/', ny: 4: 2, '/', nz: 4: 2);

    vectors[i].v[0] := x;
    vectors[i].v[1] := y;
    vectors[i].v[2] := z;

    vectors[i].n[0] := nx;
    vectors[i].n[1] := ny;
    vectors[i].n[2] := nz;
  end;

  // === OpenGL
  ListeID := glGenLists(1);
  glNewList(ListeID, GL_COMPILE);

  WriteLn(#10'Liste aller Dreiecke (Indices):');
  glBegin(GL_TRIANGLES);
  for  i := 0 to n_tris - 1 do begin
    a := tris_data[i * 3 + 0];
    b := tris_data[i * 3 + 1];
    c := tris_data[i * 3 + 2];

     WriteLn(i: 3, '  ', a: 2, '/', b: 2, '/', c: 2);

    v := vectors[a].n;
    glNormal3fv(@v);
    v := vectors[a].v;
    glVertex3fv(@v);

    v := vectors[b].n;
    glNormal3fv(@v);
    v := vectors[b].v;
    glVertex3fv(@v);

    v := vectors[c].n;
    glNormal3fv(@v);
    v := vectors[c].v;
    glVertex3fv(@v);

  end;
  glEnd;

  glEndList();
  mesh.Free;
end;

procedure draw;
const
  scale = 1.5;
  w: single = 0;
var
  sun_direction: TVector4f = (1.0, 1.0, 1.0, 0.0);
  sun_diffuse: TVector4f = (1.0, 1.0, 1.0, 1.0);
  sun_specular: TVector4f = (1.0, 1.0, 1.0, 1.0);

  mat_specular: TVector4f = (1.0, 1.0, 1.0, 1.0);
  mat_shininess: single = 110.0;

  meineObjektFarbe: TVector4f = (0.8, 0.0, 0.0, 1.0);
  mat_emission: TVector4f = (0.2, 0.0, 0.0, 1.0);

begin
  glClearColor(0.05, 0.05, 0.1, 1.0);
  glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);

  glEnable(GL_DEPTH_TEST);
  glEnable(GL_NORMALIZE);
  glShadeModel(GL_SMOOTH);

  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  glFrustum(-1.0, 1.0, -1.0, 1.0, 1.5, 100.0);

  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity();

  glLightfv(GL_LIGHT0, GL_POSITION, @sun_direction);
  glLightfv(GL_LIGHT0, GL_DIFFUSE, @sun_diffuse);
  glLightfv(GL_LIGHT0, GL_SPECULAR, @sun_specular);

  glEnable(GL_LIGHTING);
  glEnable(GL_LIGHT0);

  glMaterialfv(GL_FRONT, GL_AMBIENT, @meineObjektFarbe);
  glMaterialfv(GL_FRONT, GL_DIFFUSE, @meineObjektFarbe);
  glMaterialfv(GL_FRONT, GL_SPECULAR, @mat_specular);
  glMaterialf(GL_FRONT, GL_SHININESS, mat_shininess);
  glMaterialfv(GL_FRONT, GL_EMISSION, @mat_emission);

  glTranslatef(0, 0, -30);
  glScalef(scale, scale, scale);

  glRotatef(w, 1.0, 0.8, 0.3);
  w := w + 0.8;

  glCallList(ListeID);
end;

procedure CloseScene;
begin
  glDeleteLists(ListeID, 1);
end;


end.
