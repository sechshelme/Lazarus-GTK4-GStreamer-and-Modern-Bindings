unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene, EngineCalc, fp_box2d;


type
  TBox2dData = record
    BodyIds: Tb2BodyIds;
    engine: TEngine;
  end;
  PBox2dData = ^TBox2dData;

const
  WORLD_LEFT = -80.0;
  WORLD_TOP = 30.0;
  WORLD_WIDTH = 340.0;
  WORLD_HEIGHT = 230.0;

type
  TMyWidget = record
    parent_instance: TGtkWidget;
    boxData: PBox2dData;
  end;
  PMyWidget = ^TMyWidget;

  TMyWidgetClass = record
    parent_class: TGtkWidgetClass;
  end;
  PMyWidgetClass = ^TMyWidgetClass;

function my_widget_get_type: TGType;
function my_widget_new(boxData: PBox2dData): PMyWidget;

function MY_TYPE_WIDGET: TGType;
function MY_WIDGET(obj: Pointer): PMyWidget;
function MY_WIDGET_CLASS(klass: Pointer): PMyWidgetClass;
function MY_IS_WIDGET(obj: Pointer): Tgboolean;
function MY_IS_WIDGET_CLASS(klass: Pointer): Tgboolean;
function MY_WIDGET_GET_CLASS(obj: Pointer): PMyWidgetClass;

implementation


// ==== private

var
  parent_class: PMyWidgetClass = nil;

procedure drawPolygonSnapshot(snapshot: PGtkSnapshot; shapeId: Tb2ShapeId; color: PGdkRGBA);
var
  polygon: Tb2Polygon;
  builder: PGskPathBuilder;
  path: PGskPath;
  bodyId: Tb2BodyId;
  transform: Tb2Transform;
  p: Tb2Vec2;
  i: integer;
begin
  polygon := b2Shape_GetPolygon(shapeId);
  bodyId := b2Shape_GetBody(shapeId);
  transform := b2Body_GetTransform(bodyId);

  builder := gsk_path_builder_new;
  if polygon.count > 0 then begin
    p := b2TransformPoint(transform, polygon.vertices[0]);
    gsk_path_builder_move_to(builder, p.x, p.y);

    for i := 1 to polygon.count - 1 do begin
      p := b2TransformPoint(transform, polygon.vertices[i]);
      gsk_path_builder_line_to(builder, p.x, p.y);
    end;

    gsk_path_builder_close(builder);
  end;

  path := gsk_path_builder_free_to_path(builder);
  gtk_snapshot_append_fill(snapshot, path, GSK_FILL_RULE_WINDING, color);

  gsk_path_unref(path);
end;

procedure drawCircleSnapshot(snapshot: PGtkSnapshot; shapeId: Tb2ShapeId; color: PGdkRGBA);
var
  circle: Tb2Circle;
  bodyId: Tb2BodyId;
  transform: Tb2Transform;
  center: Tb2Vec2;
  rect: Tgraphene_rect_t;
  rounded_rect: TGskRoundedRect;
  radius_size: Tgraphene_size_t;
begin
  circle := b2Shape_GetCircle(shapeId);
  bodyId := b2Shape_GetBody(shapeId);
  transform := b2Body_GetTransform(bodyId);
  center := b2TransformPoint(transform, circle.center);

  graphene_rect_init(@rect, center.x - circle.radius, center.y - circle.radius, circle.radius * 2, circle.radius * 2);

  graphene_size_init(@radius_size, circle.radius, circle.radius);
  gsk_rounded_rect_init(@rounded_rect, @rect, @radius_size, @radius_size, @radius_size, @radius_size);
  gtk_snapshot_push_rounded_clip(snapshot, @rounded_rect);
  gtk_snapshot_append_color(snapshot, color, @rect);
  gtk_snapshot_pop(snapshot);
end;

procedure drawCapsuleSnapshot(snapshot: PGtkSnapshot; shapeId: Tb2ShapeId; color: PGdkRGBA);
var
  capsule: Tb2Capsule;
  bodyId: Tb2BodyId;
  transform: Tb2Transform;
  p1, p2: Tb2Vec2;
  angle, dx, dy, r: single;
  builder: PGskPathBuilder;
  path: PGskPath;
  rect1, rect2: Tgraphene_rect_t;
  rounded1, rounded2: TGskRoundedRect;
  size: Tgraphene_size_t;
begin
  capsule := b2Shape_GetCapsule(shapeId);
  bodyId := b2Shape_GetBody(shapeId);
  transform := b2Body_GetTransform(bodyId);
  r := capsule.radius;

  p1 := b2TransformPoint(transform, capsule.center1);
  p2 := b2TransformPoint(transform, capsule.center2);

  builder := gsk_path_builder_new();

  graphene_rect_init(@rect1, p1.x - r, p1.y - r, r * 2, r * 2);
  graphene_size_init(@size, r, r);
  gsk_rounded_rect_init(@rounded1, @rect1, @size, @size, @size, @size);
  gsk_path_builder_add_rounded_rect(builder, @rounded1);

  graphene_rect_init(@rect2, p2.x - r, p2.y - r, r * 2, r * 2);
  gsk_rounded_rect_init(@rounded2, @rect2, @size, @size, @size, @size);
  gsk_path_builder_add_rounded_rect(builder, @rounded2);

  angle := b2Atan2(p2.y - p1.y, p2.x - p1.x);
  dx := sin(angle) * r;
  dy := cos(angle) * r;

  gsk_path_builder_move_to(builder, p1.x + dx, p1.y - dy);
  gsk_path_builder_line_to(builder, p2.x + dx, p2.y - dy);
  gsk_path_builder_line_to(builder, p2.x - dx, p2.y + dy);
  gsk_path_builder_line_to(builder, p1.x - dx, p1.y + dy);
  gsk_path_builder_close(builder);

  path := gsk_path_builder_free_to_path(builder);
  gtk_snapshot_append_fill(snapshot, path, GSK_FILL_RULE_WINDING, color);

  gsk_path_unref(path);
end;

procedure draw_func(snapshot: PGtkSnapshot; anyData: PBox2dData); cdecl;
var
  i, j: integer;
  shapeCount: longint;
  shapeType: Tb2ShapeType;
  ud: PuserData;
  color: TGdkRGBA;
const
  shapesId: array of Tb2ShapeId = nil;
begin
  with anyData^ do begin
    for i := 0 to Length(BodyIds) - 1 do begin
      shapeCount := b2Body_GetShapeCount(BodyIds[i]);
      SetLength(shapesId, shapeCount);
      b2Body_GetShapes(BodyIds[i], Pb2ShapeId(shapesId), shapeCount);

      ud := b2Body_GetUserData(BodyIds[i]);
      color.SetItems(ud^.color.r, ud^.color.g, ud^.color.b, ud^.color.a);

      for j := 0 to shapeCount - 1 do begin
        shapeType := b2Shape_GetType(shapesId[j]);
        case shapeType of
          b2_polygonShape: begin
            drawPolygonSnapshot(snapshot, shapesId[j], @color);
          end;
          b2_capsuleShape: begin
            drawCapsuleSnapshot(snapshot, shapesId[j], @color);
          end;
          b2_circleShape: begin
            drawCircleSnapshot(snapshot, shapesId[j], @color);
          end;
        end;
      end;
    end;
  end;
end;


procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  self: PMyWidget absolute widget;
var
  r: Tgraphene_rect_t;
  width, height, scX, scY, sc: single;
  p: Tgraphene_point_t;
  color: TGdkRGBA;
begin
  width := gtk_widget_get_width(widget);
  height := gtk_widget_get_height(widget);

  graphene_rect_init(@r, 0, 0, width, height);
  gtk_snapshot_push_clip(snapshot, @r);

  color.SetItems(0.3, 0.3, 0.3, 1.0);

  graphene_rect_init(@r, 0, 0, width, height);
  gtk_snapshot_append_color(snapshot, @color, @r);

  scX := Width / WORLD_WIDTH;
  scY := Height / WORLD_HEIGHT;
  if scX < scY then begin
    sc := scX;
  end else begin
    sc := scY;
  end;

  graphene_point_init(@p, (Width - WORLD_WIDTH * sc) / 2, (Height - WORLD_HEIGHT * sc) / 2);
  gtk_snapshot_translate(snapshot, @p);

  gtk_snapshot_scale(snapshot, sc, -sc);

  graphene_point_init(@p, -WORLD_LEFT, -WORLD_TOP);
  gtk_snapshot_translate(snapshot, @p);

  draw_func(snapshot, self^.boxData);

  gtk_snapshot_pop(snapshot);
end;


procedure finalize_cp(obj: PGObject); cdecl;
var
  self: PMyWidget absolute obj;
begin
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

function tick_cp(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
begin
  gtk_widget_queue_draw(widget);
  Result := G_SOURCE_CONTINUE;
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PMyWidget absolute instance;
begin
end;

procedure my_widget_class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  parent_class := g_type_class_peek_parent(g_class);

  GTK_WIDGET_CLASS(g_class)^.snapshot := @snapshoot_cp;
end;


// ==== public

function my_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_WIDGET, 'MyWidget', SizeOf(TMyWidgetClass), @my_widget_class_init, SizeOf(TMyWidget), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function my_widget_new(boxData: PBox2dData): PMyWidget;
begin
  Result := g_object_new(MY_TYPE_WIDGET, nil);
  Result^.boxData := boxData;
end;

// ====

function MY_TYPE_WIDGET: TGType;
begin
  Result := my_widget_get_type;
end;

function MY_WIDGET(obj: Pointer): PMyWidget;
begin
  Result := PMyWidget(g_type_check_instance_cast(obj, MY_TYPE_WIDGET));
end;

function MY_WIDGET_CLASS(klass: Pointer): PMyWidgetClass;
begin
  Result := PMyWidgetClass(g_type_check_class_cast(klass, MY_TYPE_WIDGET));
end;

function MY_IS_WIDGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, MY_TYPE_WIDGET);
end;

function MY_IS_WIDGET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, MY_TYPE_WIDGET);
end;

function MY_WIDGET_GET_CLASS(obj: Pointer): PMyWidgetClass;
begin
  Result := PMyWidgetClass(PGTypeInstance(obj)^.g_class);
end;


end.
