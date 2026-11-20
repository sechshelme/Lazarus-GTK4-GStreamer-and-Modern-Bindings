program project1;

uses
  fp_raylib;

  procedure main;
  const
    MAX_BUILDINGS = 100;
    screenWidth = 800;
    screenHeight = 450;
  var
    player: TRectangle = (x: 400; y: 280; width: 40; height: 40);
    buildings: array  [0..MAX_BUILDINGS - 1] of TRectangle;
    buildColors: array  [0..MAX_BUILDINGS - 1] of TColor;
    spacing: integer = 0;
    i: integer;
    camera: TCamera2D;

  begin
    InitWindow(screenWidth, screenHeight, 'raylib [core] example - 2d camera');

    for  i := 0 to MAX_BUILDINGS - 1 do begin
      buildings[i].width := GetRandomValue(50, 200);
      buildings[i].height := GetRandomValue(100, 800);
      buildings[i].y := screenHeight - 130.0 - buildings[i].height;
      buildings[i].x := -6000.0 + spacing;

      spacing += Trunc(buildings[i].width);

      buildColors[i] := color(
        GetRandomValue(200, 240),
        GetRandomValue(200, 240),
        GetRandomValue(200, 250),
        255);
    end;

    camera.target := vec2(player.x + 20.0, player.y + 20.0);
    camera.offset := vec2(GetRenderWidth() / 2.0, GetRenderHeight() / 2.0);
    camera.rotation := 0.0;
    camera.zoom := 1.0;

    SetTargetFPS(60);
    while not WindowShouldClose do begin
      if IsKeyDown(KEY_RIGHT) then begin
        player.x += 2;
      end else if IsKeyDown(KEY_LEFT) then begin
        player.x -= 2;
      end;

      camera.target := vec2(player.x + 20, player.y + 20);

      if IsKeyDown(KEY_A) then  begin
        camera.rotation -= 1.0;
      end else if (IsKeyDown(KEY_S)) then begin
        camera.rotation += 1.0;
      end;

      if camera.rotation > 40 then  begin
        camera.rotation := 40;
      end else if camera.rotation < -40 then  begin
        camera.rotation := -40;
      end;

      camera.zoom := Exp(Ln(camera.zoom) + (GetMouseWheelMove() * 0.1));

      if camera.zoom > 3.0 then  begin
        camera.zoom := 3.0;
      end else if camera.zoom < 0.1 then begin
        camera.zoom := 0.1;
      end;

      if IsKeyPressed(KEY_R) then begin
        camera.zoom := 1.0;
        camera.rotation := 0.0;
      end;

      BeginDrawing();

      ClearBackground(RAYWHITE);
      BeginMode2D(camera);

      DrawRectangle(-6000, 320, 13000, 8000, DARKGRAY);

      for  i := 0 to MAX_BUILDINGS - 1 do begin
        DrawRectangleRec(buildings[i], buildColors[i]);
      end;

      DrawRectangleRec(player, RED);

      DrawLine(Trunc(camera.target.x), -screenHeight * 10, Trunc(camera.target.x), screenHeight * 10, GREEN);
      DrawLine(-screenWidth * 10, Trunc(camera.target.y), screenWidth * 10, Trunc(camera.target.y), GREEN);

      EndMode2D();

      DrawText('SCREEN AREA', 640, 10, 20, RED);

      DrawRectangle(0, 0, screenWidth, 5, RED);
      DrawRectangle(0, 5, 5, screenHeight - 10, RED);
      DrawRectangle(screenWidth - 5, 5, 5, screenHeight - 10, RED);
      DrawRectangle(0, screenHeight - 5, screenWidth, 5, RED);

      DrawRectangle(10, 10, 250, 113, Fade(SKYBLUE, 0.5));
      DrawRectangleLines(10, 10, 250, 113, BLUE);

      DrawText('Free 2D camera controls:', 20, 20, 10, BLACK);
      DrawText('- Right/Left to move player', 40, 40, 10, DARKGRAY);
      DrawText('- Mouse Wheel to Zoom in-out', 40, 60, 10, DARKGRAY);
      DrawText('- A / S to Rotate', 40, 80, 10, DARKGRAY);
      DrawText('- R to reset Zoom and Rotation', 40, 100, 10, DARKGRAY);
      EndDrawing;
    end;
    CloseWindow;
  end;

begin
  main;
end.
