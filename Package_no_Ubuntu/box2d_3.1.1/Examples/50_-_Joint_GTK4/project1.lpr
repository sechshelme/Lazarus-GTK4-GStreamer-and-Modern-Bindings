program project1;

uses
  fp_glib2,
  fp_cairo,
  fp_GTK4,
  fp_box2d,
  EngineCalc;

type
  TAniData = record
    BodyIds: Tb2BodyIds;
    engine: TEngine;
  end;
  PAniData = ^TAniData;

const
  anyDataKey = 'anyKey';

const
  WORLD_LEFT   = -5.0;
  WORLD_TOP    =  9.0;
  WORLD_WIDTH  =  10.0;
  WORLD_HEIGHT =  6.0;

  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure drawPolygone(cr: Pcairo_t; shapeId: Tb2ShapeId);
  var
    i: integer;
    polygon: Tb2Polygon;
    bodyId: Tb2BodyId;
    transform: Tb2Transform;
    p: Tb2Vec2;
  begin
    polygon := b2Shape_GetPolygon(shapeId);
    bodyId := b2Shape_GetBody(shapeId);
    transform := b2Body_GetTransform(bodyId);

    if polygon.count > 0 then begin
      p := b2TransformPoint(transform, polygon.vertices[0]);
      cairo_move_to(cr, p.x, p.y);

      for i := 1 to polygon.count - 1 do begin
        p := b2TransformPoint(transform, polygon.vertices[i]);
        cairo_line_to(cr, p.x, p.y);
      end;

      cairo_close_path(cr);
    end;
    cairo_fill(cr);
  end;

  procedure drawCircle(cr: Pcairo_t; shapeId: Tb2ShapeId);
  var
    circle: Tb2Circle;
    bodyId: Tb2BodyId;
    transform: Tb2Transform;
    center: Tb2Vec2;
  begin
    circle := b2Shape_GetCircle(shapeId);
    bodyId := b2Shape_GetBody(shapeId);
    transform := b2Body_GetTransform(bodyId);
    center := b2TransformPoint(transform, circle.center);

    cairo_arc(cr, center.x, center.y, circle.radius, 0, 2 * Pi);
    cairo_close_path(cr);
    cairo_fill(cr);
  end;


  procedure draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  var
    anyData: PAniData;
    i, j: integer;
    scX, scY, sc: double;
    shapeCount: longint;
    shapeType: Tb2ShapeType;
    ud: PuserData;
  const
    shapesId: array of Tb2ShapeId = nil;
  begin
    anyData := g_object_get_data(G_OBJECT(drawing_area), anyDataKey);

    scX := Width / WORLD_WIDTH;
    scY := Height / WORLD_HEIGHT;
    if scX < scY then begin
      sc := scX;
    end else begin
      sc := scY;
    end;

    cairo_translate(cr, (Width - WORLD_WIDTH * sc) / 2, (Height - WORLD_HEIGHT * sc) / 2);
    cairo_scale(cr, sc, -sc);
    cairo_translate(cr, -WORLD_LEFT, -WORLD_TOP);
    cairo_set_line_width(cr, 1.5 / sc);

    with anyData^ do begin
      cairo_set_source_rgb(cr, 0.3, 0.3, 0.3);
      cairo_paint(cr);

      for i := 0 to Length(BodyIds) - 1 do begin
        shapeCount := b2Body_GetShapeCount(BodyIds[i]);
        SetLength(shapesId, shapeCount);
        b2Body_GetShapes(BodyIds[i], Pb2ShapeId(shapesId), shapeCount);
        ud := b2Body_GetUserData(BodyIds[i]);
        if ud <> nil then begin
          cairo_set_source_rgb(cr, ud^.color.r, ud^.color.g, ud^.color.b);
        end else begin
          cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
        end;

        for j := 0 to shapeCount - 1 do begin
          shapeType := b2Shape_GetType(shapesId[j]);
          case shapeType of
            b2_polygonShape: begin
              drawPolygone(cr, shapesId[j]);
            end;
            b2_circleShape: begin
              drawCircle(cr, shapesId[j]);
            end;
          end;
        end;
      end;

      cairo_stroke(cr);
    end;
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  var
    anyData: PAniData;
  begin
    anyData := g_object_get_data(G_OBJECT(widget), anyDataKey);
    with anyData^ do begin
      engine.NextScene;
      BodyIds := engine.SceneBodyIds;
    end;
    gtk_widget_queue_draw(widget);
    Result := G_SOURCE_CONTINUE;
  end;

  procedure startup_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    anyData: PAniData absolute user_data;
  begin
    with anyData^ do begin
      engine := TEngine.Create;
    end;
  end;

  procedure shutdown_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    anyData: PAniData absolute user_data;
  begin
    with anyData^ do begin
      engine.Free;
    end;
  end;

  procedure activate_cp(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    anyData: PAniData absolute user_data;
    window, box, button, drawing_area: PGtkWidget;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Box2d demo');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    drawing_area := gtk_drawing_area_new;
    gtk_widget_set_vexpand(drawing_area, True);
    gtk_widget_set_hexpand(drawing_area, True);
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), @draw_func, nil, nil);
    gtk_widget_add_tick_callback(drawing_area, @on_tick, nil, nil);
    gtk_box_append(GTK_BOX(box), drawing_area);

    g_object_set_data_full(G_OBJECT(drawing_area), anyDataKey, anyData, nil);

    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_set_child(GTK_WINDOW(window), box);
    gtk_window_present(GTK_WINDOW(window));
  end;


  procedure main;
  var
    app: PGtkApplication;
    anyData: TAniData;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'startup', G_CALLBACK(@startup_cp), @anyData);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate_cp), @anyData);
    g_signal_connect(app, 'shutdown', G_CALLBACK(@shutdown_cp), @anyData);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
