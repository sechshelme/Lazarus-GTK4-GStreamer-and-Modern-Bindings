unit GLAreaWidget;

interface

uses
  fp_rlgl, fp_raylib, fp_raymath,
  fp_glib2, fp_GTK4;

type
  PGLAreaWidget = type Pointer;
  PGLAreaWidgetClass = type Pointer;

function gl_area_widget_get_type: TGType;
function gl_area_widget_new(step: single): PGTKWidget;

implementation

// ==== private

{$IFDEF LINUX}
function GetProcAddress(procname: PAnsiChar): Pointer; cdecl; external 'libEGL.so.1' name 'eglGetProcAddress';
{$ENDIF}

{$IFDEF WINDOWS}
uses Windows;

function wglGetProcAddress(procname: PAnsiChar): Pointer; stdcall; external 'opengl32.dll';

function GetProcAddress(procname: PAnsiChar): Pointer; cdecl;
var
  h: HMODULE;
begin
  Result := wglGetProcAddress(procname);
  if PtrUInt(Result) <= 3 then begin
    h := GetModuleHandle('opengl32.dll');
    if h <> 0 then
      Result := Windows.GetProcAddress(h, procname);
  end;
end;
{$ENDIF}

type
  TInstPriv = record
    cubeMesh: TMesh;
    cubeMat: TMaterial;
    radius:Single;
    camera: TCamera3D;
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

function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
begin
  gtk_gl_area_queue_render(GTK_GL_AREA(widget));
  Result := G_SOURCE_CONTINUE;
end;

procedure on_realize(area: PGtkGLArea); cdecl;
var
  priv: PInstPriv;
  width, height: longint;
begin
  priv := GetPriv(area);

  with priv^ do begin
    gtk_gl_area_make_current(area);
    if gtk_gl_area_get_error(area) <> nil then begin
      Exit;
    end;

    width := gtk_widget_get_width(GTK_WIDGET(area));
    height := gtk_widget_get_height(GTK_WIDGET(area));
    rlLoadExtensions(@GetProcAddress);
    rlglInit(width, height);
    rlEnableDepthTest;

    cubeMesh:=  GenMeshCube(2.0, 2.0, 2.0);
    cubeMat := LoadMaterialDefault;

    radius:=4.0;
    with camera do begin
      position := vec3(radius, 4.0, 4.0);
      target := vec3(0.0, 0.0, 0.0);
      up := vec3(0.0, 1.0, 0.0);
      fovy := 45.0;
      projection := CAMERA_PERSPECTIVE;
    end;

    gtk_widget_add_tick_callback(GTK_WIDGET(area), @on_tick, nil, nil);
  end;
end;

function on_render(area: PGtkGLArea; context: PGdkGLContext): Tgboolean; cdecl;
var
  priv: PInstPriv;
  width, height, scale: longint;
  matProj, matView: TMatrix;
  col: TColor;
  seconds, angle: extended;
begin
  priv := GetPriv(area);
  with priv^ do begin
    width := gtk_widget_get_width(GTK_WIDGET(area));
    height := gtk_widget_get_height(GTK_WIDGET(area));

    scale := gtk_widget_get_scale_factor(GTK_WIDGET(area));
    rlViewport(0, 0, width * scale, height * scale);

    rlClearColor(245, 245, 245, 255);
    rlClearScreenBuffers;

    seconds := gdk_frame_clock_get_frame_time(gtk_widget_get_frame_clock(GTK_WIDGET(area))) / 1000000.0;
    angle:=seconds;;

    with camera do begin
      position.x:=Cos(angle)*radius;
      position.y:=Sin(angle)*radius;
    end;

    matProj := MatrixPerspective(camera.fovy * DEG2RAD, width / height, 0.01, 1000.0);
    matView := MatrixLookAt(camera.position, camera.target, camera.up);

    rlSetMatrixProjection(matProj);
    rlSetMatrixModelview(matView);

    col.r := Round((Sin(seconds) + 1.0) * 0.5 * $FF);
    col.g := Round((Sin(seconds * 1.3) + 1.0) * 0.5 * $FF);
    col.b := Round((Sin(seconds * 1.7) + 1.0) * 0.5 * $FF);
    col.a := $FF;


    cubeMat.maps[MATERIAL_MAP_DIFFUSE].color := col;
    DrawMesh(cubeMesh, cubeMat, MatrixIdentity());
    DrawCubeWires(vec3(0.0, 0.0, 0.0), 2.0, 2.0, 2.0, MAROON);
    DrawGrid(10, 1.0);

    rlDrawRenderBatchActive;
  end;
  Result := True;
end;

procedure on_unrealize(area: PGtkGLArea); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(area);
  with priv^ do begin
    rlglClose;
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
end;

end.
