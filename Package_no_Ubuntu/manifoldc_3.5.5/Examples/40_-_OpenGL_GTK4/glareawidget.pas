unit GLAreaWidget;

interface

uses
  fp_manifoldc, fp_manifold_obj,
  fp_glib2, fp_GTK4,
  fp_cglm,
  fp_GL_Tools, fp_epoxy,
  manifold;

type
  PGLAreaWidget = type Pointer;
  PGLAreaWidgetClass = type Pointer;

function gl_area_widget_get_type: TGType;
function gl_area_widget_new(step: single): PGTKWidget;

implementation

// ==== private

type
  TUBOBuffer = record
    model, view, proj: Tmat4;
    objectColor: Tvec4;
  end;

  {$PUSH}{$CODEALIGN RECORDMIN=16}
  TInstPriv = record
    UBOBuffer: TUBOBuffer;
    VAO, VBO, EBO, UBO: TGLuint;
    shader: PShader;
    IndexCount: TGLsizei;
    w, step: single;
  end;
  PInstPriv = ^TInstPriv;
  {$POP}

  TClassPriv = record
  end;
  PClassPriv = ^TClassPriv;

var
  parent_class: PGLAreaWidgetClass = nil;
  instance_size: integer = 0;

function GetPriv(w: Tgpointer): PInstPriv; inline;
begin
  Result := PInstPriv(w + instance_size);
end;

const
  VertexShaderSource: PChar =
    '#version 330 core' + #10 +

    'layout(location = 0) in vec3 aPos;' + #10 +
    'layout(location = 1) in vec3 aNormal;' + #10 +

    'layout (std140) uniform Material {' + #10 +
    '  mat4 model;' + #10 +
    '  mat4 view;' + #10 +
    '  mat4 projection;' + #10 +
    '  vec3 objectColor;' + #10 +
    '};' + #10 +

    'out vec3 FragPos;' + #10 +
    'out vec3 Normal;' + #10 +

    'void main() {' + #10 +
    '  FragPos = vec3(model * vec4(aPos, 1.0));' + #10 +
    '  Normal = mat3(transpose(inverse(model))) * aNormal;' + #10 +
    '  gl_Position = projection * view * vec4(FragPos, 1.0);' + #10 +
    '}';

  FragmentShaderSource: PChar =
    '#version 330 core' + #10 +

    'in vec3 FragPos;' + #10 +
    'in vec3 Normal;' + #10 +

    'layout (std140) uniform Material {' + #10 +
    '  mat4 model;' + #10 +
    '  mat4 view;' + #10 +
    '  mat4 projection;' + #10 +
    '  vec3 objectColor;' + #10 +
    '};' + #10 +

    'out vec4 FragColor;' + #10 +

    'const vec3 lightDir = vec3(1.0, 1.0, 1.0);' + #10 +
    'const vec3 lightDiffuse = vec3(1.0, 1.0, 1.0);' + #10 +
    'const vec3 lightSpecular = vec3(1.0, 1.0, 1.0);' + #10 +
    //    'const vec3 objectColor = vec3(0.8, 0.0, 0.0);' + #10 +
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


function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
begin
  gtk_gl_area_queue_render(GTK_GL_AREA(widget));
  Result := G_SOURCE_CONTINUE;
end;

procedure on_realize(area: PGtkGLArea); cdecl;
var
  priv: PInstPriv;
  mani: TMyManifold;
begin
  priv := GetPriv(area);

  with priv^ do begin
    gtk_gl_area_make_current(area);
    if gtk_gl_area_get_error(area) <> nil then begin
      Exit;
    end;

    mani := TMyManifold.Create;

    // === OpenGL

    with UBOBuffer do begin
      //      objectColor := [1.0, 0.0, 0.0, 0.0];
      objectColor := [Random, Random, Random, 0.0];
    end;

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
    glGenBuffers(1, @UBO);
    glBindVertexArray(VAO);

    glUniformBlockBinding(shader_get_ID(shader), shader_uniform_block_index(shader, 'Material'), 0);

    glBindBuffer(GL_UNIFORM_BUFFER, UBO);
    glBufferData(GL_UNIFORM_BUFFER, sizeof(TUBOBuffer), nil, GL_DYNAMIC_DRAW);
    glBindBufferBase(GL_UNIFORM_BUFFER, 0, UBO);

    IndexCount := mani.get_n_tris * 3;

    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, mani.get_n_verts * mani.get_n_props * SizeOf(TGLfloat), mani.get_verts_data, GL_STATIC_DRAW);

    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBO);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, IndexCount * 3 * SizeOf(Tgint), mani.get_tris_data, GL_STATIC_DRAW);

    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 6 * SizeOf(single), Pointer(0));
    glEnableVertexAttribArray(0);
    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 6 * SizeOf(single), Pointer(3 * SizeOf(TGLfloat)));
    glEnableVertexAttribArray(1);
    glBindVertexArray(0);

    gtk_widget_add_tick_callback(GTK_WIDGET(area), @on_tick, nil, nil);

    mani.Free;
  end;
end;

function on_render(area: PGtkGLArea; context: PGdkGLContext): Tgboolean; cdecl;
const
  scale = 1.5;
var
  priv: PInstPriv;
begin
  priv := GetPriv(area);
  with priv^ do begin
    if gtk_gl_area_get_error(area) <> nil then begin
      Exit(False);
    end;

    glClearColor(0.05, 0.05, 0.1, 1.0);
    glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
    glEnable(GL_DEPTH_TEST);

    shader_use_program(shader);

    glmc_frustum(-1.0, 1.0, -1.0, 1.0, 1.5, 100.0, UBOBuffer.proj);
    glmc_mat4_identity(UBOBuffer.view);
    glmc_mat4_identity(UBOBuffer.model);

    glmc_translate(UBOBuffer.model, [0.0, 0.0, -30.0]);
    glmc_scale_uni(UBOBuffer.model, scale);
    glmc_rotate(UBOBuffer.model, w * pi / 360 * step, [1.0, 0.8, 0.3]);
    w := w + 0.8;

    glBindBuffer(GL_UNIFORM_BUFFER, UBO);
    glBufferSubData(GL_UNIFORM_BUFFER, 0, sizeof(TUBOBuffer), @UBOBuffer);

    glBindVertexArray(VAO);
    glDrawElements(GL_TRIANGLES, IndexCount, GL_UNSIGNED_INT, nil);
    glBindVertexArray(0);
  end;
  Result := True;
end;

procedure on_unrealize(area: PGtkGLArea); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(area);
  with priv^ do begin
    gtk_gl_area_make_current(area);
    glDeleteVertexArrays(1, @VAO);
    glDeleteBuffers(1, @VBO);
    glDeleteBuffers(1, @EBO);
    glDeleteBuffers(1, @UBO);
    shader_unref(shader);
  end;
end;


procedure finalize_cp(obj: PGObject); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(obj);
  with priv^ do begin
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  parent_class := g_type_class_peek_parent(g_class);
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(instance);
  with priv^ do begin
    step := 0.5;
  end;

  gtk_gl_area_set_required_version(GTK_GL_AREA(instance), 3, 3);
  gtk_gl_area_set_has_depth_buffer(GTK_GL_AREA(instance), True);
  gtk_gl_area_set_has_stencil_buffer(GTK_GL_AREA(instance), True);
  gtk_gl_area_set_auto_render(GTK_GL_AREA(instance), True);
  gtk_widget_set_hexpand(GTK_WIDGET(instance), True);
  gtk_widget_set_vexpand(GTK_WIDGET(instance), True);
  g_signal_connect(instance, 'realize', G_CALLBACK(@on_realize), nil);
  g_signal_connect(instance, 'unrealize', G_CALLBACK(@on_unrealize), nil);
  g_signal_connect(instance, 'render', G_CALLBACK(@on_render), nil);
end;


// ==== public

function gl_area_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(GTK_TYPE_GL_AREA, @query);
    instance_size := query.instance_size;

    id := g_type_register_static_simple(GTK_TYPE_GL_AREA, 'GLWidget',
      query.class_size + SizeOf(TClassPriv), @class_init_cp,
      query.instance_size + SizeOf(TInstPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function gl_area_widget_new(step: single): PGTKWidget;
var
  priv: PInstPriv;
begin
  Result := g_object_new(gl_area_widget_get_type, nil);
  priv := GetPriv(Result);
  priv^.step := step;
end;

end.
