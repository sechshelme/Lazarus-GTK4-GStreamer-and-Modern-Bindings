program project1;

uses
  Math,
  fp_raylib,
  fp_raymath,
  fp_rlgl;

  procedure main;
  const
    screenWidth = 800;
    screenHeight = 450;
  var
    camera: TCamera2D;
    zoomMode: integer = 0;
    delta, renderScale, mouseWorldPos, textPos: TVector2;
    wheel, scale, deltaX: single;
  begin
    InitWindow(screenWidth, screenHeight, 'raylib [core] example - 2d camera mouse zoom');

    FillChar(camera, SizeOf(TCamera2D), 0);
    camera.zoom := 1.0;

    SetTargetFPS(60);

    while not WindowShouldClose do begin
      if IsKeyPressed(KEY_ONE) then begin
        zoomMode := 0;
      end else if IsKeyPressed(KEY_TWO) then begin
        zoomMode := 1;
      end;

      if IsMouseButtonDown(MOUSE_BUTTON_LEFT) then  begin
        delta := GetMouseDelta();
        delta := Vector2Scale(delta, -1.0 / camera.zoom);
        camera.target := Vector2Add(camera.target, delta);
      end;

      renderScale.x := GetRenderWidth() / GetScreenWidth();
      renderScale.y := GetRenderHeight() / GetScreenHeight();

      if zoomMode = 0 then  begin
        wheel := GetMouseWheelMove();
        if wheel <> 0 then  begin
          scale := 0.2 * wheel;
          mouseWorldPos := GetScreenToWorld2D(GetMousePosition(), camera);

          camera.offset := Vector2Multiply(GetMousePosition(), renderScale);
          camera.target := mouseWorldPos;
          camera.zoom := Clamp(Exp(Ln(camera.zoom) + scale), 0.125, 64.0);
        end;
      end else begin
        if IsMouseButtonPressed(MOUSE_BUTTON_RIGHT) then  begin
          mouseWorldPos := GetScreenToWorld2D(GetMousePosition(), camera);

          camera.offset := Vector2Multiply(GetMousePosition(), renderScale);
          camera.target := mouseWorldPos;
        end;

        if IsMouseButtonDown(MOUSE_BUTTON_RIGHT) then  begin
          deltaX := GetMouseDelta().x;
          scale := 0.005 * deltaX;
          camera.zoom := Clamp(Exp(Ln(camera.zoom) + scale), 0.125, 64.0);
        end;
      end;

      BeginDrawing;
      ClearBackground(RAYWHITE);

      BeginMode2D(camera);
      rlPushMatrix();
      rlTranslatef(0, 25 * 50, 0);
      rlRotatef(90, 1, 0, 0);
      DrawGrid(100, 50);
      rlPopMatrix();

      DrawCircle(GetScreenWidth() div 2, GetScreenHeight() div 2, 50, MAROON);
      EndMode2D();

      DrawCircleV(GetMousePosition(), 4, DARKGRAY);
      textPos := Vector2Add(GetMousePosition(), vec2(-44, -24));
      DrawTextEx(GetFontDefault(), TextFormat('[%i, %i]', GetMouseX(), GetMouseY()), textPos, 20, 2, BLACK);

      DrawText('[1][2] Select mouse zoom mode (Wheel or Move)', 20, 20, 20, DARKGRAY);
      if zoomMode = 0 then begin
        DrawText('Mouse left button drag to move, mouse wheel to zoom', 20, 50, 20, DARKGRAY);
      end else begin
        DrawText('Mouse left button drag to move, mouse press and move to zoom', 20, 50, 20, DARKGRAY);
      end;

      EndDrawing;
    end;

    CloseWindow;
  end;

begin
  main;
end.
