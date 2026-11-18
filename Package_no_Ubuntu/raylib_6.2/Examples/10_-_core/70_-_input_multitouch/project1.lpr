program project1;

uses
  fp_raylib;

  procedure main;
  const
    MAX_TOUCH_POINTS = 10;
    screenWidth = 800;
    screenHeight = 450;
  var
    tCount: longint;
    touchPositions: array [0..MAX_TOUCH_POINTS - 1] of TVector2;
    i: integer;
  begin
    InitWindow(screenWidth, screenHeight, 'raylib [core] example - input multitouch');
    SetTargetFPS(60);

    while not WindowShouldClose do begin
      tCount := GetTouchPointCount;
      if tCount > MAX_TOUCH_POINTS then begin
        tCount := MAX_TOUCH_POINTS;
      end;
      for  i := 0 to tCount - 1 do begin
        touchPositions[i] := GetTouchPosition(i);
      end;

      BeginDrawing;
      ClearBackground(RAYWHITE);

      for  i := 0 to tCount - 1 do begin
        if (touchPositions[i].x > 0) and (touchPositions[i].y > 0) then begin
          DrawCircleV(touchPositions[i], 34, ORANGE);
          DrawText(TextFormat('%d', i), Trunc(touchPositions[i].x) - 10, Trunc(touchPositions[i].y) - 70, 40, BLACK);
        end;
      end;

      DrawText('touch the screen at multiple locations to get multiple balls', 10, 10, 20, DARKGRAY);

      EndDrawing;
    end;
    CloseWindow;
  end;

begin
  main;
end.
