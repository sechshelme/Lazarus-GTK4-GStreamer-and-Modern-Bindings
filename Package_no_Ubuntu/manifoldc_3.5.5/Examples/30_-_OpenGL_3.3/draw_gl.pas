unit draw_gl;

{$i-}

interface

uses
  fp_epoxy, fp_GL_Tools,
  fp_cglm,
  fp_manifold_obj,
  fp_manifoldc;

procedure InitScene;
procedure draw;
procedure CloseScene;

implementation

const
  VertexShaderSource: PChar =
    '#version 330 core' + #10 +
    'layout(location = 0) in vec3 aPos;' + #10 +
    'layout(location = 1) in vec3 aNormal;' + #10 +
    'out vec3 FragPos;' + #10 +
    'out vec3 Normal;' + #10 +
    'uniform mat4 model;' + #10 +
    'uniform mat4 view;' + #10 +
    'uniform mat4 projection;' + #10 +
    'void main() {' + #10 +
    '  FragPos = vec3(model * vec4(aPos, 1.0));' + #10 +
    '  Normal = mat3(transpose(inverse(model))) * aNormal;' + #10 +
    '  gl_Position = projection * view * vec4(FragPos, 1.0);' + #10 +
    '}';

  FragmentShaderSource: PChar =
    '#version 330 core' + #10 +
    'in vec3 FragPos;' + #10 +
    'in vec3 Normal;' + #10 +
    'out vec4 FragColor;' + #10 +
    '// Fixe Licht- und Materialwerte' + #10 +
    'const vec3 lightDir = vec3(1.0, 1.0, 1.0);' + #10 +
    'const vec3 lightDiffuse = vec3(1.0, 1.0, 1.0);' + #10 +
    'const vec3 lightSpecular = vec3(1.0, 1.0, 1.0);' + #10 +
    'const vec3 objectColor = vec3(0.8, 0.0, 0.0);' + #10 +
    'const vec3 matSpecular = vec3(1.0, 1.0, 1.0);' + #10 +
    'const vec3 matEmission = vec3(0.2, 0.0, 0.0);' + #10 +
    'const float matShininess = 110.0;' + #10 +
    'void main() {' + #10 +
    '  vec3 norm = normalize(Normal);' + #10 +
    '  vec3 lDir = normalize(lightDir);' + #10 +
    '  vec3 viewDir = normalize(-FragPos);' + #10 +
    '  // Ambient & Diffuse' + #10 +
    '  float diff = max(dot(norm, lDir), 0.0);' + #10 +
    '  vec3 ambient = 0.2 * objectColor;' + #10 +
    '  vec3 diffuse = diff * lightDiffuse * objectColor;' + #10 +
    '  // Specular' + #10 +
    '  vec3 reflectDir = reflect(-lDir, norm);' + #10 +
    '  float spec = pow(max(dot(viewDir, reflectDir), 0.0), matShininess);' + #10 +
    '  vec3 specular = spec * lightSpecular * matSpecular;' + #10 +
    '  vec3 result = matEmission + ambient + diffuse + specular;' + #10 +
    '  FragColor = vec4(result, 1.0);' + #10 +
    '}';

var
  VAO, VBO, EBO: TGLuint;
  shader: PShader;
  IndexCount: TGLsizei;

procedure InitScene;
var
  mesh: TMeshGLClass;
  n_verts, n_tris, n_props: longint;
  verts_data: Psingle = nil;
  tris_data: Puint32_t = nil;
  i: integer;
  er: TManifoldError;
  cube, hole, hole2: TManifoldClass;
  stride: TGLsizei;
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
  IndexCount := n_tris * 3;

  WriteLn('--- MANIFOLD CSG ERGEBNIS ---');
  WriteLn('n_verts: ', n_verts, ' | n_tris: ', n_tris, ' | n_props: ', n_props);

  tris_data := mesh.meshgl_tri_verts;
  verts_data := mesh.meshgl_vert_properties;

  // === OpenGL
  shader := shader_new;
  if not shader_load_shaderobject(shader, GL_VERTEX_SHADER, pchar(VertexShaderSource)) then begin
    WriteLn('Fehler im Vertex-Shader:');
    WriteLn(shader_get_errortext(shader));
  end;
  if not shader_load_shaderobject(shader, GL_FRAGMENT_SHADER, pchar(FragmentShaderSource)) then begin
    WriteLn('Fehler im Fragment-Shader:');
    WriteLn(shader_get_errortext(shader));
  end;
  if not shader_link_program(shader) then begin
    WriteLn('Fehler beim Linken der Shader:');
    WriteLn(shader_get_errortext(shader));
  end;

  glGenVertexArrays(1, @VAO);
  glGenBuffers(1, @VBO);
  glGenBuffers(1, @EBO);

  glBindVertexArray(VAO);

  glBindBuffer(GL_ARRAY_BUFFER, VBO);
  glBufferData(GL_ARRAY_BUFFER, n_verts * n_props * SizeOf(single), verts_data, GL_STATIC_DRAW);

  glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBO);
  glBufferData(GL_ELEMENT_ARRAY_BUFFER, IndexCount * SizeOf(Tuint32_t), tris_data, GL_STATIC_DRAW);

  stride := n_props * SizeOf(single);

  glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, stride, Pointer(0));
  glEnableVertexAttribArray(0);
  glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, stride, Pointer(6 * SizeOf(single)));
  glEnableVertexAttribArray(1);

  glBindVertexArray(0);

  mesh.Free;
end;

procedure draw;
const
  scale = 1.5;
  w: single = 0;
var
  {$CODEALIGN LOCALMIN=16}
  proj, view, model: Tmat4;
  transVec, scaleVec, rotAxis: Tvec3;
begin
  glClearColor(0.05, 0.05, 0.1, 1.0);
  glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
  glEnable(GL_DEPTH_TEST);

  shader_use_program(shader);

  glmc_frustum(-1.0, 1.0, -1.0, 1.0, 1.5, 100.0, proj);
  glmc_mat4_identity(view);
  glmc_mat4_identity(model);

  transVec[0] := 0.0;
  transVec[1] := 0.0;
  transVec[2] := -30.0;
  glmc_translate(model, transVec);

  scaleVec[0] := scale;
  scaleVec[1] := scale;
  scaleVec[2] := scale;
  glmc_scale(model, scaleVec);

  rotAxis[0] := 1.0;
  rotAxis[1] := 0.8;
  rotAxis[2] := 0.3;
  //  glmc_rotate(model, glmc_rad(w), rotAxis);
  glmc_rotate(model, w * pi / 360, rotAxis);
  w := w + 0.8;

  glUniformMatrix4fv(shader_uniform_location(shader, 'projection'), 1, GL_FALSE, @proj);
  glUniformMatrix4fv(shader_uniform_location(shader, 'view'), 1, GL_FALSE, @view);
  glUniformMatrix4fv(shader_uniform_location(shader, 'model'), 1, GL_FALSE, @model);

  glBindVertexArray(VAO);
  glDrawElements(GL_TRIANGLES, IndexCount, GL_UNSIGNED_INT, nil);
  glBindVertexArray(0);
end;

procedure CloseScene;
begin
  glDeleteVertexArrays(1, @VAO);
  glDeleteBuffers(1, @VBO);
  glDeleteBuffers(1, @EBO);
  shader_unref(shader);
end;

end.
