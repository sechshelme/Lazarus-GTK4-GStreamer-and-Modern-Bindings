program project1;

uses
  fp_raylib;

  procedure main;
  const
    screenWidth = 800;
    screenHeight = 450;
    speed = 10.0;
    circleRadius = 32.0;
  var
    currentFps: integer = 60;
    deltaCircle: TVector2 = (items: (0, screenHeight / 3.0));
    frameCircle: TVector2 = (items: (0, screenHeight * (2.0 / 3.0)));
    mouseWheel: single;
    fpsText: PChar = nil;
  begin
    InitWindow(screenWidth, screenHeight, 'raylib [core] example - delta time');
    SetTargetFPS(currentFps);

    while not WindowShouldClose do begin
      mouseWheel := GetMouseWheelMove;
      if mouseWheel <> 0 then begin
        currentFps += Trunc(mouseWheel);
        if currentFps < 0 then begin
          currentFps := 0;
        end;
        SetTargetFPS(currentFps);
      end;

        deltaCircle.x += GetFrameTime() * 6.0 * speed;
        frameCircle.x += 0.1 * speed;

        if deltaCircle.x > screenWidth then begin
          deltaCircle.x := 0;
        end;
        if frameCircle.x > screenWidth then begin
          frameCircle.x := 0;
        end;
      if IsKeyPressed(KEY_R) then begin
        deltaCircle.x := 0;
        frameCircle.x := 0;
      end;

      BeginDrawing;
      ClearBackground(RAYWHITE);

      DrawCircleV(deltaCircle, circleRadius, RED);
      DrawCircleV(frameCircle, circleRadius, BLUE);

      if currentFps <= 0 then begin
        fpsText := TextFormat('FPS: unlimited (%i)', GetFPS);
      end else begin
        fpsText := TextFormat('FPS: %i (target: %i', GetFPS, currentFps);
      end;
      DrawText(fpsText, 10, 10, 20, DARKGRAY);
      DrawText(TextFormat('Frame time: %02.02f ms', GetFrameTime * 1000.0), 10, 30, 20, DARKGRAY);
      DrawText('Use the scroll wheel to change the fps limit, r to reset', 10, 50, 20, DARKGRAY);

      DrawText('FUNC: x += GetFrameTime()*speed', 10, 90, 20, RED);
      DrawText('FUNC: x += speed', 10, 240, 20, BLUE);
      EndDrawing;
    end;
    CloseWindow;
  end;

begin
  main;
end.
