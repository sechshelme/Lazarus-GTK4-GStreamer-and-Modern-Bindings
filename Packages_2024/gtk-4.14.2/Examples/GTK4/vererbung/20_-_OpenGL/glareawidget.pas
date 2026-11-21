unit GLAreaWidget;

interface

uses
  fp_glib2, fp_GTK4,
  fp_GL_Tools, fp_epoxy;

type
  PGLAreaWidget = type Pointer;
  PGLAreaWidgetClass = type Pointer;

function gl_area_widget_get_type: TGType;
function gl_area_widget_new(step: single): PGTKWidget;

implementation

// ==== private

type
  TInstPriv = record
    shader: PShader;
    VBO, VAO: TGLuint;
    ang, step: single;
  end;
  PInstPriv = ^TInstPriv;

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
  VertexShaderSource =
    '#version 330 core' + #10 +
    'layout (location = 0) in vec3 aPos;' + #10 +
    'layout (location = 1) in vec3 aColor;' + #10 +
    'uniform float ang;' + #10 +
    'out vec3 ourColor;' + #10 +
    'void main() {' + #10 +
    '  float s = sin(ang);' + #10 +
    '  float c = cos(ang);' + #10 +
    '  vec3 rotatedPos = aPos;' + #10 +
    '  rotatedPos.x = aPos.x * c - aPos.y * s;' + #10 +
    '  rotatedPos.y = aPos.x * s + aPos.y * c;' + #10 +
    '  gl_Position = vec4(rotatedPos, 1.0);' + #10 +
    '  ourColor = aColor;' + #10 +
    '}';

  FragmentShaderSource =
    '#version 330 core' + #10 +
    'in vec3 ourColor;' + #10 +
    'out vec4 FragColor;' + #10 +
    'void main() {' + #10 +
    '  FragColor = vec4(ourColor, 1.0);' + #10 +
    '}';


function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
begin
  gtk_gl_area_queue_render(GTK_GL_AREA(widget));
  Result := G_SOURCE_CONTINUE;
end;


procedure on_realize(area: PGtkGLArea); cdecl;
var
  priv: PInstPriv;

  vertices: array[0..17] of TGLfloat = (
    -0.6, -0.3464, 0.0, 1.0, 0.0, 0.0,
    0.6, -0.3464, 0.0, 0.0, 1.0, 0.0,
    0.0, 0.6928, 0.0, 0.0, 0.0, 1.0);
begin
  priv := GetPriv(area);

  with priv^ do begin
    gtk_gl_area_make_current(area);
    if gtk_gl_area_get_error(area) <> nil then begin
      Exit;
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

    glBindVertexArray(VAO);
    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, SizeOf(vertices), @vertices, GL_STATIC_DRAW);

    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 6 * SizeOf(TGLfloat), nil);
    glEnableVertexAttribArray(0);
    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 6 * SizeOf(TGLfloat), Pointer(3 * SizeOf(TGLfloat)));
    glEnableVertexAttribArray(1);

    gtk_widget_add_tick_callback(GTK_WIDGET(area), @on_tick, nil, nil);
  end;
end;

function on_render(area: PGtkGLArea; context: PGdkGLContext): Tgboolean; cdecl;
var
  priv: PInstPriv;
  id: TGLint;
begin
  priv := GetPriv(area);
  with priv^ do begin
    if gtk_gl_area_get_error(area) <> nil then begin
      Exit(False);
    end;

    glClearColor(0.1, 0.1, 0.1, 1.0);
    glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);

    shader_use_program(shader);

    ang += step * 0.1;

    id := shader_uniform_location(shader, 'ang');
    glUniform1f(id, ang);

    glBindVertexArray(VAO);
    glDrawArrays(GL_TRIANGLES, 0, 3);
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
