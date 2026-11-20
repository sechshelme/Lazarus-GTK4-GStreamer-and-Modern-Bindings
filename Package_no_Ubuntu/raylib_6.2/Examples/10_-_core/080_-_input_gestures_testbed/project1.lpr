program project1;

uses
  fp_raylib;

  function GetGestureName(gesture: integer): PChar;
  begin
    case gesture of
      0: begin
        Result := 'None';
      end;
      1: begin
        Result := 'Tap';
      end;
      2: begin
        Result := 'Double Tap';
      end;
      4: begin
        Result := 'Hold';
      end;
      8: begin
        Result := 'Drag';
      end;
      16: begin
        Result := 'Swipe Right';
      end;
      32: begin
        Result := 'Swipe Left';
      end;
      64: begin
        Result := 'Swipe Up';
      end;
      128: begin
        Result := 'Swipe Down';
      end;
      256: begin
        Result := 'Pinch In';
      end;
      512: begin
        Result := 'Pinch Out';
      end;
      else begin
        Result := 'Unknown';
      end;
    end;
  end;

  function GetGestureColor(gesture: integer): TColor;
  begin
    case gesture of
      0: begin
        Result := BLACK;
      end;
      1: begin
        Result := BLUE;
      end;
      2: begin
        Result := SKYBLUE;
      end;
      4: begin
        Result := BLACK;
      end;
      8: begin
        Result := LIME;
      end;
      16: begin
        Result := RED;
      end;
      32: begin
        Result := RED;
      end;
      64: begin
        Result := RED;
      end;
      128: begin
        Result := RED;
      end;
      256: begin
        Result := VIOLET;
      end;
      512: begin
        Result := ORANGE;
      end;
      else begin
        Result := BLACK;
      end;
    end;
  end;

  procedure main;
  const
    GESTURE_LOG_SIZE = 20;
    MAX_TOUCH_COUNT = 32;
    screenWidth = 800;
    screenHeight = 450;
  var
    messagePosition: TVector2 = (x: 160; y: 7);
    lastGesture: integer = 0;
    gestureLogIndex: integer = 0;
    previousGesture: integer = 0;
    logMode: integer = 1;

    lastGesturePosition: TVector2 = (items: (165, 130));
    gestureLog: array[0..GESTURE_LOG_SIZE - 1, 0..11] of char;

    gestureColor: TColor = (items: (0, 0, 0, 255));
    logButton1: TRectangle = (items: (53, 7, 48, 26));
    logButton2: TRectangle = (items: (108, 7, 36, 26));
    gestureLogPosition: TVector2 = (items: (10, 10));

    angleLength: single = 90.0;
    currentAngleDegrees: single = 0.0;
    finalVector: TVector2 = (items: (0.0, 0.0));
    protractorPosition: TVector2 = (items: (266.0, 315.0));

    currentGesture, touchCount: longint;
    currentDragDegrees, currentPitchDegrees: single;
    fillLog, i, ii: integer;
    currentAngleRadians: ValReal;

    touchPosition: array[0..MAX_TOUCH_COUNT - 1] of TVector2;
    mousePosition: TVector2;

    logButton1Color, logButton2Color: TColor;
    angleString, angleStringTrim: PChar;
    angleStringDot: integer;

    cSwipeUp, cSwipeLeft, cSwipeRight, cSwipeDown: TColor;
    cTap, cDrag, cDoubleTap, cPinchOut, cPinchIn: TColor;
    cTouch, cLogText: TColor;
    lineThickness: single;
  begin
    InitWindow(screenWidth, screenHeight, 'raylib [core] example - input gestures testbed');
    SetTargetFPS(60);

    FillChar(gestureLog, SizeOf(gestureLog), 0);

    while not WindowShouldClose do begin
      currentGesture := GetGestureDetected;
      currentDragDegrees := GetGestureDragAngle;
      currentPitchDegrees := GetGesturePinchAngle;
      touchCount := GetTouchPointCount;

      if (currentGesture <> 0) and (currentGesture <> 4) and (currentGesture <> previousGesture) then begin
        lastGesture := currentGesture;
      end;

      if IsMouseButtonReleased(MOUSE_BUTTON_LEFT) then begin
        if CheckCollisionPointRec(GetMousePosition(), logButton1) then begin
          case logMode of
            3: begin
              logMode := 2;
            end;
            2: begin
              logMode := 3;
            end;
            1: begin
              logMode := 0;
            end;
            else begin
              logMode := 1;
            end;
          end;
        end else if CheckCollisionPointRec(GetMousePosition(), logButton2) then begin
          case logMode of
            3: begin
              logMode := 1;
            end;
            2: begin
              logMode := 0;
            end;
            1: begin
              logMode := 3;
            end;
            else begin
              logMode := 2;
            end;
          end;
        end;
      end;

      fillLog := 0;
      if currentGesture <> 0 then begin
        case logMode of
          3: begin
            if (((currentGesture <> 4) and (currentGesture <> previousGesture)) or (currentGesture < 3)) then begin
              fillLog := 1;
            end;
          end;
          2: begin
            if currentGesture <> 4 then begin
              fillLog := 1;
            end;
          end;
          1: begin
            if currentGesture <> previousGesture then begin
              fillLog := 1;
            end;
          end;
          else begin
            fillLog := 1;
          end;
        end;
      end;

      if fillLog <> 0 then begin
        previousGesture := currentGesture;
        gestureColor := GetGestureColor(currentGesture);
        if gestureLogIndex <= 0 then begin
          gestureLogIndex := GESTURE_LOG_SIZE;
        end;
        Dec(gestureLogIndex);

        TextCopy(@gestureLog[gestureLogIndex][0], GetGestureName(currentGesture));
      end;

      if currentGesture > 255 then begin
        currentAngleDegrees := currentPitchDegrees;
      end else if currentGesture > 15 then begin
        currentAngleDegrees := currentDragDegrees;
      end else if currentGesture > 0 then begin
        currentAngleDegrees := 0.0;
      end;

      currentAngleRadians := (currentAngleDegrees + 90.0) * PI / 180.0;
      finalVector := vec2(
        (angleLength * Sin(currentAngleRadians)) + protractorPosition.x,
        (angleLength * Cos(currentAngleRadians)) + protractorPosition.y);

      for i := 0 to MAX_TOUCH_COUNT - 1 do begin
        touchPosition[i].items := [0, 0];
      end;
      mousePosition.items := [0, 0];

      if currentGesture <> GESTURE_NONE then begin
        if touchCount <> 0 then begin
          if touchCount > MAX_TOUCH_COUNT then begin
            touchCount := MAX_TOUCH_COUNT;
          end;
          for i := 0 to touchCount - 1 do begin
            touchPosition[i] := GetTouchPosition(i);
          end;
        end else begin
          mousePosition := GetMousePosition();
        end;
      end;

      if lastGesture = GESTURE_SWIPE_UP then begin
        cSwipeUp := RED;
      end else begin
        cSwipeUp := LIGHTGRAY;
      end;
      if lastGesture = GESTURE_SWIPE_LEFT then begin
        cSwipeLeft := RED;
      end else begin
        cSwipeLeft := LIGHTGRAY;
      end;
      if lastGesture = GESTURE_SWIPE_RIGHT then begin
        cSwipeRight := RED;
      end else begin
        cSwipeRight := LIGHTGRAY;
      end;
      if lastGesture = GESTURE_SWIPE_DOWN then begin
        cSwipeDown := RED;
      end else begin
        cSwipeDown := LIGHTGRAY;
      end;
      if lastGesture = GESTURE_TAP then begin
        cTap := BLUE;
      end else begin
        cTap := LIGHTGRAY;
      end;
      if lastGesture = GESTURE_DRAG then begin
        cDrag := LIME;
      end else begin
        cDrag := LIGHTGRAY;
      end;
      if lastGesture = GESTURE_DOUBLETAP then begin
        cDoubleTap := SKYBLUE;
      end else begin
        cDoubleTap := LIGHTGRAY;
      end;
      if lastGesture = GESTURE_PINCH_OUT then begin
        cPinchOut := ORANGE;
      end else begin
        cPinchOut := LIGHTGRAY;
      end;
      if lastGesture = GESTURE_PINCH_IN then begin
        cPinchIn := VIOLET;
      end else begin
        cPinchIn := LIGHTGRAY;
      end;

      BeginDrawing;
      ClearBackground(RAYWHITE);

      DrawText('*', Trunc(messagePosition.x) + 5, Trunc(messagePosition.y) + 5, 10, BLACK);
      DrawText('Example optimized for Web/HTML5 non Smartphones with Touch Screen.', Trunc(messagePosition.x) + 15, Trunc(messagePosition.y) + 5, 10, BLACK);
      DrawText('*', Trunc(messagePosition.x) + 5, Trunc(messagePosition.y) + 35, 10, BLACK);
      DrawText('While running on Desktop Web Browsers,' + #10 + 'inspect and turn on Touch Emulation.', Trunc(messagePosition.x) + 15, Trunc(messagePosition.y) + 35, 10, BLACK);

      DrawText('Last gesture', Trunc(lastGesturePosition.x) + 33, Trunc(lastGesturePosition.y) - 47, 20, BLACK);
      DrawText('Swipe         Tap       Pinch  Touch', Trunc(lastGesturePosition.x) + 17, Trunc(lastGesturePosition.y) - 18, 10, BLACK);

      DrawRectangle(Trunc(lastGesturePosition.x) + 20, Trunc(lastGesturePosition.y), 20, 20, cSwipeUp);
      DrawRectangle(Trunc(lastGesturePosition.x), Trunc(lastGesturePosition.y) + 20, 20, 20, cSwipeLeft);
      DrawRectangle(Trunc(lastGesturePosition.x) + 40, Trunc(lastGesturePosition.y) + 20, 20, 20, cSwipeRight);
      DrawRectangle(Trunc(lastGesturePosition.x) + 20, Trunc(lastGesturePosition.y) + 40, 20, 20, cSwipeDown);

      DrawCircle(Trunc(lastGesturePosition.x) + 80, Trunc(lastGesturePosition.y) + 16, 10, cTap);
      DrawRing(vec2(lastGesturePosition.x + 103, lastGesturePosition.y + 16), 6.0, 11.0, 0.0, 360.0, 0, cDrag);
      DrawCircle(Trunc(lastGesturePosition.x) + 80, Trunc(lastGesturePosition.y) + 43, 10, cDoubleTap);
      DrawCircle(Trunc(lastGesturePosition.x) + 103, Trunc(lastGesturePosition.y) + 43, 10, cDoubleTap);

      DrawTriangle(
        vec2(lastGesturePosition.x + 122, lastGesturePosition.y + 16),
        vec2(lastGesturePosition.x + 137, lastGesturePosition.y + 26),
        vec2(lastGesturePosition.x + 137, lastGesturePosition.y + 6),
        cPinchOut);
      DrawTriangle(
        vec2(lastGesturePosition.x + 147, lastGesturePosition.y + 6),
        vec2(lastGesturePosition.x + 147, lastGesturePosition.y + 26),
        vec2(lastGesturePosition.x + 162, lastGesturePosition.y + 16),
        cPinchOut);
      DrawTriangle(
        vec2(lastGesturePosition.x + 125, lastGesturePosition.y + 33),
        vec2(lastGesturePosition.x + 125, lastGesturePosition.y + 53),
        vec2(lastGesturePosition.x + 140, lastGesturePosition.y + 43),
        cPinchIn);
      DrawTriangle(
        vec2(lastGesturePosition.x + 144, lastGesturePosition.y + 43),
        vec2(lastGesturePosition.x + 159, lastGesturePosition.y + 53),
        vec2(lastGesturePosition.x + 159, lastGesturePosition.y + 33),
        cPinchIn);

      for i := 0 to 3 do begin
        if touchCount <= i then begin
          cTouch := LIGHTGRAY;
        end else begin
          cTouch := gestureColor;
        end;
        DrawCircle(Trunc(lastGesturePosition.x) + 180, Trunc(lastGesturePosition.y) + 7 + i * 15, 5, cTouch);
      end;

      DrawText('Log', Trunc(gestureLogPosition.x), Trunc(gestureLogPosition.y), 20, BLACK);

      ii := gestureLogIndex;
      for i := 0 to GESTURE_LOG_SIZE - 1 do begin
        if i = 0 then begin
          cLogText := gestureColor;
        end else begin
          cLogText := LIGHTGRAY;
        end;
        DrawText(@gestureLog[ii][0], Trunc(gestureLogPosition.x), Trunc(gestureLogPosition.y) + 410 - i * 20, 20, cLogText);
        ii := (ii + 1) mod GESTURE_LOG_SIZE;
      end;

      case logMode of
        3: begin
          logButton1Color := MAROON;
          logButton2Color := MAROON;
        end;
        2: begin
          logButton1Color := GRAY;
          logButton2Color := MAROON;
        end;
        1: begin
          logButton1Color := MAROON;
          logButton2Color := GRAY;
        end;
        else begin
          logButton1Color := GRAY;
          logButton2Color := GRAY;
        end;
      end;

      DrawRectangleRec(logButton1, logButton1Color);
      DrawText('Hide', Trunc(logButton1.x) + 7, Trunc(logButton1.y) + 3, 10, WHITE);
      DrawText('Repeat', Trunc(logButton1.x) + 7, Trunc(logButton1.y) + 13, 10, WHITE);
      DrawRectangleRec(logButton2, logButton2Color);
      DrawText('Hide', Trunc(logButton1.x) + 62, Trunc(logButton1.y) + 3, 10, WHITE);
      DrawText('Hold', Trunc(logButton1.x) + 62, Trunc(logButton1.y) + 13, 10, WHITE);

      DrawText('Angle', Trunc(protractorPosition.x) + 55, Trunc(protractorPosition.y) + 76, 10, BLACK);
      angleString := TextFormat('%f', currentAngleDegrees);
      angleStringDot := TextFindIndex(angleString, '.');
      angleStringTrim := TextSubtext(angleString, 0, angleStringDot + 3);
      DrawText(angleStringTrim, Trunc(protractorPosition.x) + 55, Trunc(protractorPosition.y) + 92, 20, gestureColor);
      DrawCircleV(protractorPosition, 80.0, WHITE);
      DrawLineEx(vec2(protractorPosition.x - 90, protractorPosition.y), vec2(protractorPosition.x + 90, protractorPosition.y), 3.0, LIGHTGRAY);
      DrawLineEx(vec2(protractorPosition.x, protractorPosition.y - 90), vec2(protractorPosition.x, protractorPosition.y + 90), 3.0, LIGHTGRAY);
      DrawLineEx(vec2(protractorPosition.x - 80, protractorPosition.y - 45), vec2(protractorPosition.x + 80, protractorPosition.y + 45), 3.0, GREEN);
      DrawLineEx(vec2(protractorPosition.x - 80, protractorPosition.y + 45), vec2(protractorPosition.x + 80, protractorPosition.y - 45), 3.0, GREEN);
      DrawText('0', Trunc(protractorPosition.x) + 96, Trunc(protractorPosition.y) - 9, 20, BLACK);
      DrawText('30', Trunc(protractorPosition.x) + 74, Trunc(protractorPosition.y) - 68, 20, BLACK);
      DrawText('90', Trunc(protractorPosition.x) - 11, Trunc(protractorPosition.y) - 110, 20, BLACK);
      DrawText('150', Trunc(protractorPosition.x) - 100, Trunc(protractorPosition.y) - 68, 20, BLACK);
      DrawText('180', Trunc(protractorPosition.x) - 124, Trunc(protractorPosition.y) - 9, 20, BLACK);
      DrawText('210', Trunc(protractorPosition.x) - 100, Trunc(protractorPosition.y) + 50, 20, BLACK);
      DrawText('270', Trunc(protractorPosition.x) - 18, Trunc(protractorPosition.y) + 92, 20, BLACK);
      DrawText('330', Trunc(protractorPosition.x) + 72, Trunc(protractorPosition.y) + 50, 20, BLACK);
      if currentAngleDegrees <> 0.0 then begin
        DrawLineEx(protractorPosition, finalVector, 3.0, gestureColor);
      end;

      if currentGesture <> GESTURE_NONE then begin
        if touchCount <> 0 then begin
          for i := 0 to touchCount - 1 do begin
            DrawCircleV(touchPosition[i], 50.0, Fade(gestureColor, 0.5));
            DrawCircleV(touchPosition[i], 5.0, gestureColor);
          end;
          if touchCount = 2 then begin
            if currentGesture = 512 then begin
              lineThickness := 8.0;
            end else begin
              lineThickness := 12.0;
            end;
            DrawLineEx(touchPosition[0], touchPosition[1], lineThickness, gestureColor);
          end;
        end else begin
          DrawCircleV(mousePosition, 35.0, Fade(gestureColor, 0.5));
          DrawCircleV(mousePosition, 5.0, gestureColor);
        end;
      end;
      EndDrawing;
    end;
    CloseWindow;
  end;

begin
  main;
end.
end;
