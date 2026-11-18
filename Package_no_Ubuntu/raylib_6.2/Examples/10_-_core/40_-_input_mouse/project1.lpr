program project1;

uses
  fp_raylib;

  procedure main;
  const
    screenWidth = 800;
    screenHeight = 450;
  var
    ballPosition: TVector2 = (items: (screenWidth / 2, screenHeight / 3));
    ballColor: TColor;
  begin
    InitWindow(screenWidth, screenHeight, 'raylib [core] example - input mouse');
    SetTargetFPS(60);
    ballColor := DARKBLUE;

    while not WindowShouldClose do begin
      if IsKeyDown(KEY_H) then begin
        if IsCursorHidden then begin
          ShowCursor;
        end else begin
          HideCursor();
        end;
      end;

      if IsMouseButtonPressed(MOUSE_BUTTON_LEFT) then begin
        ballColor := MAROON;
      end else if IsMouseButtonPressed(MOUSE_BUTTON_MIDDLE) then begin
        ballColor := LIME;
      end else if IsMouseButtonPressed(MOUSE_BUTTON_RIGHT) then begin
        ballColor := DARKBLUE;
      end else if IsMouseButtonPressed(MOUSE_BUTTON_SIDE) then begin
        ballColor := PURPLE;
      end else if IsMouseButtonPressed(MOUSE_BUTTON_EXTRA) then begin
        ballColor := YELLOW;
      end else if IsMouseButtonPressed(MOUSE_BUTTON_FORWARD) then begin
        ballColor := ORANGE;
      end else if IsMouseButtonPressed(MOUSE_BUTTON_BACK) then begin
        ballColor := BEIGE;
      end;

      BeginDrawing;
      ClearBackground(RAYWHITE);

      DrawCircleV(ballPosition, 40, ballColor);

      DrawText('move ball with mouse and click mouse button to change color', 10, 10, 20, DARKGRAY);
      DrawText('Press ''H'' to toggle cursor visibility', 10, 30, 20, DARKGRAY);

      if IsCursorHidden then begin
        DrawText('CURSOR HIDDEN', 20, 60, 20, RED);
      end else begin
        DrawText('CURSOR VISIBLE', 20, 60, 20, LIME);
      end;
      EndDrawing;
    end;
    CloseWindow;
  end;

begin
  main;
end.
