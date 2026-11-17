program project1;

uses
  fp_raylib;

  procedure main;
  const
    screenWidth = 800;
    screenHeight = 450;
  var
    ballPosition: TVector2 = (items: (screenWidth / 2, screenHeight / 3));
  begin
    InitWindow(screenWidth, screenHeight, 'raylib [core] example - input keys');
    SetTargetFPS(60);

    while not WindowShouldClose do begin
      if IsKeyDown(KEY_RIGHT) then begin
        ballPosition.x += 2.0;
      end;
      if IsKeyDown(KEY_LEFT) then begin
        ballPosition.x -= 2.0;
      end;
      if IsKeyDown(KEY_UP) then begin
        ballPosition.y -= 2.0;
      end;
      if IsKeyDown(KEY_DOWN) then begin
        ballPosition.y += 2.0;
      end;

      BeginDrawing;
      ClearBackground(RAYWHITE);
      DrawText('move the ball with arrow keys', 10, 10, 20, DARKGRAY);
      DrawCircleV(ballPosition, 50, MAROON);
      EndDrawing;
    end;
    CloseWindow;
  end;

begin
  main;
end.
