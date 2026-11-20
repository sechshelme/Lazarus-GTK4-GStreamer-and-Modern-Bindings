program project1;

uses
  fp_raylib;

  procedure main;
  const
    MAX_GESTURE_STRINGS = 20;
    screenWidth = 800;
    screenHeight = 450;
  var
    touchPosition: TVector2 = (x: 0; y: 0);
    touchArea: TRectangle = (x: 220; y: 10; width: screenWidth - 230.0; height: screenHeight - 20.0);
    gesturesCount: integer = 0;
    gestureStrings: array[0..MAX_GESTURE_STRINGS - 1, 0..31] of char;
    currentGesture: integer = GESTURE_NONE;
    lastGesture: integer = GESTURE_NONE;
    i: integer;
  begin
    InitWindow(screenWidth, screenHeight, 'raylib [core] example - input gestures');
    SetTargetFPS(60);

    while not WindowShouldClose do begin
      lastGesture := currentGesture;
      currentGesture := GetGestureDetected;
      touchPosition := GetTouchPosition(0);

      if (CheckCollisionPointRec(touchPosition, touchArea)) and (currentGesture <> GESTURE_NONE) then begin
        if currentGesture <> lastGesture then begin
          case currentGesture of
            GESTURE_TAP: begin
              TextCopy(gestureStrings[gesturesCount], 'GESTURE TAP');
            end;
            GESTURE_DOUBLETAP: begin
              TextCopy(gestureStrings[gesturesCount], 'GESTURE DOUBLETAP');
            end;
            GESTURE_HOLD: begin
              TextCopy(gestureStrings[gesturesCount], 'GESTURE HOLD');
            end;
            GESTURE_DRAG: begin
              TextCopy(gestureStrings[gesturesCount], 'GESTURE DRAG');
            end;
            GESTURE_SWIPE_RIGHT: begin
              TextCopy(gestureStrings[gesturesCount], 'GESTURE SWIPE RIGHT');
            end;
            GESTURE_SWIPE_LEFT: begin
              TextCopy(gestureStrings[gesturesCount], 'GESTURE SWIPE LEFT');
            end;
            GESTURE_SWIPE_UP: begin
              TextCopy(gestureStrings[gesturesCount], 'GESTURE SWIPE UP');
            end;
            GESTURE_SWIPE_DOWN: begin
              TextCopy(gestureStrings[gesturesCount], 'GESTURE SWIPE DOWN');
            end;
            GESTURE_PINCH_IN: begin
              TextCopy(gestureStrings[gesturesCount], 'GESTURE PINCH IN');
            end;
            GESTURE_PINCH_OUT: begin
              TextCopy(gestureStrings[gesturesCount], 'GESTURE PINCH OUT');
            end;
          end;

          Inc(gesturesCount);
          if gesturesCount >= MAX_GESTURE_STRINGS then begin
            for i := 0 to MAX_GESTURE_STRINGS - 1 do begin
              TextCopy(gestureStrings[i], #0);
            end;
            gesturesCount := 0;
          end;
        end;
      end;

      BeginDrawing;

      ClearBackground(RAYWHITE);

      DrawRectangleRec(touchArea, GRAY);
      DrawRectangle(225, 15, screenWidth - 240, screenHeight - 30, RAYWHITE);

      DrawText('GESTURES TEST AREA', screenWidth - 270, screenHeight - 40, 20, Fade(GRAY, 0.5));

      for  i := 0 to gesturesCount - 1 do begin
        if i mod 2 = 0 then begin
          DrawRectangle(10, 30 + 20 * i, 200, 20, Fade(LIGHTGRAY, 0.5));
        end else begin
          DrawRectangle(10, 30 + 20 * i, 200, 20, Fade(LIGHTGRAY, 0.3));
        end;

        if i < gesturesCount - 1 then begin
          DrawText(gestureStrings[i], 35, 36 + 20 * i, 10, DARKGRAY);
        end else begin
          DrawText(gestureStrings[i], 35, 36 + 20 * i, 10, MAROON);
        end;
      end;

      DrawRectangleLines(10, 29, 200, screenHeight - 50, GRAY);
      DrawText('DETECTED GESTURES', 50, 15, 10, GRAY);

      if currentGesture <> GESTURE_NONE then  begin
        DrawCircleV(touchPosition, 30, MAROON);
      end;

      EndDrawing();
    end;
    CloseWindow;
  end;

begin
  main;
end.
