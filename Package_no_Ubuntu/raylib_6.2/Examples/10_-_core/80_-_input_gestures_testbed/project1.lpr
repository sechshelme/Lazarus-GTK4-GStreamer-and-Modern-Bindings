program project1;

uses
  fp_raylib;

  procedure main;
  const
     GESTURE_LOG_SIZE   = 20 ;
     MAX_TOUCH_COUNT    = 32;
     screenWidth = 800;
    screenHeight = 450;
  var
    messagePosition:TVector2=(x:160;y:7);
     lastGesture:Integer = 0;
      gestureLogIndex :Integer= 0;
      previousGesture:Integer = 0;
        logMode:Integer = 1;

     lastGesturePosition:TVector2 = (items:( 165, 130) );
     gestureLog:array [0..GESTURE_LOG_SIZE-1,0..11]of Char;

     gestureColor:TColor  = (items:( 0, 0,0, 255 ));
      logButton1:TRectangle = (items: (53,7, 48, 26 ));
     logButton2:TRectangle  = (items: (108, 7, 36, 26 ));
     gestureLogPosition: TVector2 = (items:(10, 10 ));

     angleLength:Single = 90.0;
     currentAngleDegrees:Single = 0.0;
      finalVector:TVector2 = (items:( 0.0, 0.0));
     protractorPosition:TVector2 = (items:( 266.0, 315.0));
     currentGesture, touchCount: LongInt;
     currentDragDegrees, currentPitchDegrees: Single;
     fillLog: Integer;


  begin
    InitWindow(screenWidth, screenHeight, 'raylib [core] example - input gestures testbed');
    SetTargetFPS(60);

//    char gestureLog[GESTURE_LOG_SIZE][12] = { "" };

    while not WindowShouldClose do begin
         currentGesture := GetGestureDetected;
         currentDragDegrees := GetGestureDragAngle;
          currentPitchDegrees := GetGesturePinchAngle;
          touchCount := GetTouchPointCount;

         if (currentGesture <> 0) and (currentGesture <> 4) and (currentGesture <> previousGesture) then
             lastGesture := currentGesture;

         if IsMouseButtonReleased(MOUSE_BUTTON_LEFT) then begin
             if CheckCollisionPointRec(GetMousePosition(), logButton1)then begin
                 case logMode of
                      3: logMode := 2;
                      2: logMode := 3;
                      1: logMode := 0;
                    else logMode := 1;
                     end;
             end             else if CheckCollisionPointRec(GetMousePosition(), logButton2) then begin
                 case logMode of
                      3: logMode := 1;
                     2: logMode := 0;
                      1: logMode := 3;
                     else logMode := 2;
                     end;
             end;

         end;

         fillLog := 0;
         if currentGesture <>0 do begin
             if (logMode == 3) // 3 hides repeated events and hide hold events
             {
                 if (((currentGesture != 4) && (currentGesture != previousGesture)) || (currentGesture < 3)) fillLog = 1;
             }
             else if (logMode == 2) // 2 shows repeated events but hide hold events
             {
                 if (currentGesture != 4) fillLog = 1;
             }
             else if (logMode == 1) // 1 hides repeated events
             {
                 if (currentGesture != previousGesture) fillLog = 1;
             }
             else  // 0 shows repeated events
             {
                 fillLog = 1;
             }
         }

         if (fillLog) // If one of the conditions from logMode was met, fill the gesture log
         {
             previousGesture = currentGesture;
             gestureColor = GetGestureColor(currentGesture);
             if (gestureLogIndex <= 0) gestureLogIndex = GESTURE_LOG_SIZE;
             gestureLogIndex--;

             // Copy the gesture respective name to the gesture log array
             TextCopy(gestureLog[gestureLogIndex], GetGestureName(currentGesture));
         }

         // Handle protractor
         if (currentGesture > 255) currentAngleDegrees = currentPitchDegrees; // Pinch In and Pinch Out
         else if (currentGesture > 15) currentAngleDegrees = currentDragDegrees; // Swipe Right, Swipe Left, Swipe Up and Swipe Down
         else if (currentGesture > 0) currentAngleDegrees = 0.0f; // Tap, Doubletap, Hold and Grab

         float currentAngleRadians = ((currentAngleDegrees + 90.0f)*PI/180); // Convert the current angle to Radians
         // Calculate the final vector for display
         finalVector = (Vector2){ (angleLength*sinf(currentAngleRadians)) + protractorPosition.x,
             (angleLength*cosf(currentAngleRadians)) + protractorPosition.y };

         // Handle touch and mouse pointer points
         Vector2 touchPosition[MAX_TOUCH_COUNT] = { 0 };
         Vector2 mousePosition = { 0 };
         if (currentGesture != GESTURE_NONE)
         {
             if (touchCount != 0)
             {
                 for (i = 0; i < touchCount; i++) touchPosition[i] = GetTouchPosition(i); // Fill the touch positions
             }
             else mousePosition = GetMousePosition();
         }
         //--------------------------------------------------------------------------------------

         // Draw
         //--------------------------------------------------------------------------------------
         BeginDrawing();
             ClearBackground(RAYWHITE);

             // Draw common elements
             DrawText("*", (int)messagePosition.x + 5, (int)messagePosition.y + 5, 10, BLACK);
             DrawText("Example optimized for Web/HTML5\non Smartphones with Touch Screen.", (int)messagePosition.x + 15, (int)messagePosition.y + 5, 10, BLACK);
             DrawText("*", (int)messagePosition.x + 5, (int)messagePosition.y + 35, 10, BLACK);
             DrawText("While running on Desktop Web Browsers,\ninspect and turn on Touch Emulation.", (int)messagePosition.x + 15, (int)messagePosition.y + 35, 10, BLACK);

             // Draw last gesture
             DrawText("Last gesture", (int)lastGesturePosition.x + 33, (int)lastGesturePosition.y - 47, 20, BLACK);
             DrawText("Swipe         Tap       Pinch  Touch", (int)lastGesturePosition.x + 17, (int)lastGesturePosition.y - 18, 10, BLACK);
             DrawRectangle((int)lastGesturePosition.x + 20, (int)lastGesturePosition.y, 20, 20, lastGesture == GESTURE_SWIPE_UP ? RED : LIGHTGRAY);
             DrawRectangle((int)lastGesturePosition.x, (int)lastGesturePosition.y + 20, 20, 20, lastGesture == GESTURE_SWIPE_LEFT ? RED : LIGHTGRAY);
             DrawRectangle((int)lastGesturePosition.x + 40, (int)lastGesturePosition.y + 20, 20, 20, lastGesture == GESTURE_SWIPE_RIGHT ? RED : LIGHTGRAY);
             DrawRectangle((int)lastGesturePosition.x + 20, (int)lastGesturePosition.y + 40, 20, 20, lastGesture == GESTURE_SWIPE_DOWN ? RED : LIGHTGRAY);
             DrawCircle((int)lastGesturePosition.x + 80, (int)lastGesturePosition.y + 16, 10, lastGesture == GESTURE_TAP ? BLUE : LIGHTGRAY);
             DrawRing( (Vector2){lastGesturePosition.x + 103, lastGesturePosition.y + 16}, 6.0f, 11.0f, 0.0f, 360.0f, 0, lastGesture == GESTURE_DRAG ? LIME : LIGHTGRAY);
             DrawCircle((int)lastGesturePosition.x + 80, (int)lastGesturePosition.y + 43, 10, lastGesture == GESTURE_DOUBLETAP ? SKYBLUE : LIGHTGRAY);
             DrawCircle((int)lastGesturePosition.x + 103, (int)lastGesturePosition.y + 43, 10, lastGesture == GESTURE_DOUBLETAP ? SKYBLUE : LIGHTGRAY);
             DrawTriangle((Vector2){ lastGesturePosition.x + 122, lastGesturePosition.y + 16 }, (Vector2){ lastGesturePosition.x + 137, lastGesturePosition.y + 26 }, (Vector2){lastGesturePosition.x + 137, lastGesturePosition.y + 6 }, lastGesture == GESTURE_PINCH_OUT? ORANGE : LIGHTGRAY);
             DrawTriangle((Vector2){ lastGesturePosition.x + 147, lastGesturePosition.y + 6 }, (Vector2){ lastGesturePosition.x + 147, lastGesturePosition.y + 26 }, (Vector2){ lastGesturePosition.x + 162, lastGesturePosition.y + 16 }, lastGesture == GESTURE_PINCH_OUT? ORANGE : LIGHTGRAY);
             DrawTriangle((Vector2){ lastGesturePosition.x + 125, lastGesturePosition.y + 33 }, (Vector2){ lastGesturePosition.x + 125, lastGesturePosition.y + 53 }, (Vector2){ lastGesturePosition.x + 140, lastGesturePosition.y + 43 }, lastGesture == GESTURE_PINCH_IN? VIOLET : LIGHTGRAY);
             DrawTriangle((Vector2){ lastGesturePosition.x + 144, lastGesturePosition.y + 43 }, (Vector2){ lastGesturePosition.x + 159, lastGesturePosition.y + 53 }, (Vector2){ lastGesturePosition.x + 159, lastGesturePosition.y + 33 }, lastGesture == GESTURE_PINCH_IN? VIOLET : LIGHTGRAY);
             for (i = 0; i < 4; i++) DrawCircle((int)lastGesturePosition.x + 180, (int)lastGesturePosition.y + 7 + i*15, 5, touchCount <= i? LIGHTGRAY : gestureColor);

             // Draw gesture log
             DrawText("Log", (int)gestureLogPosition.x, (int)gestureLogPosition.y, 20, BLACK);

             // Loop in both directions to print the gesture log array in the inverted order (and looping around if the index started somewhere in the middle)
             for (i = 0, ii = gestureLogIndex; i < GESTURE_LOG_SIZE; i++, ii = (ii + 1)%GESTURE_LOG_SIZE) DrawText(gestureLog[ii], (int)gestureLogPosition.x, (int)gestureLogPosition.y + 410 - i*20, 20, (i == 0 ? gestureColor : LIGHTGRAY));
             Color logButton1Color, logButton2Color;
             switch (logMode)
             {
                 case 3:  logButton1Color=MAROON; logButton2Color=MAROON; break;
                 case 2:  logButton1Color=GRAY;   logButton2Color=MAROON; break;
                 case 1:  logButton1Color=MAROON; logButton2Color=GRAY;   break;
                 default: logButton1Color=GRAY;   logButton2Color=GRAY;   break;
             }
             DrawRectangleRec(logButton1, logButton1Color);
             DrawText("Hide", (int)logButton1.x + 7, (int)logButton1.y + 3, 10, WHITE);
             DrawText("Repeat", (int)logButton1.x + 7, (int)logButton1.y + 13, 10, WHITE);
             DrawRectangleRec(logButton2, logButton2Color);
             DrawText("Hide", (int)logButton1.x + 62, (int)logButton1.y + 3, 10, WHITE);
             DrawText("Hold", (int)logButton1.x + 62, (int)logButton1.y + 13, 10, WHITE);

             // Draw protractor
             DrawText("Angle", (int)protractorPosition.x + 55, (int)protractorPosition.y + 76, 10, BLACK);
             const char *angleString = TextFormat("%f", currentAngleDegrees);
             const int angleStringDot = TextFindIndex(angleString, ".");
             const char *angleStringTrim = TextSubtext(angleString, 0, angleStringDot + 3);
             DrawText( angleStringTrim, (int)protractorPosition.x + 55, (int)protractorPosition.y + 92, 20, gestureColor);
             DrawCircleV(protractorPosition, 80.0f, WHITE);
             DrawLineEx((Vector2){ protractorPosition.x - 90, protractorPosition.y }, (Vector2){ protractorPosition.x + 90, protractorPosition.y }, 3.0f, LIGHTGRAY);
             DrawLineEx((Vector2){ protractorPosition.x, protractorPosition.y - 90 }, (Vector2){ protractorPosition.x, protractorPosition.y + 90 }, 3.0f, LIGHTGRAY);
             DrawLineEx((Vector2){ protractorPosition.x - 80, protractorPosition.y - 45 }, (Vector2){ protractorPosition.x + 80, protractorPosition.y + 45 }, 3.0f, GREEN);
             DrawLineEx((Vector2){ protractorPosition.x - 80, protractorPosition.y + 45 }, (Vector2){ protractorPosition.x + 80, protractorPosition.y - 45 }, 3.0f, GREEN);
             DrawText("0", (int)protractorPosition.x + 96, (int)protractorPosition.y - 9, 20, BLACK);
             DrawText("30", (int)protractorPosition.x + 74, (int)protractorPosition.y - 68, 20, BLACK);
             DrawText("90", (int)protractorPosition.x - 11, (int)protractorPosition.y - 110, 20, BLACK);
             DrawText("150", (int)protractorPosition.x - 100, (int)protractorPosition.y - 68, 20, BLACK);
             DrawText("180", (int)protractorPosition.x - 124, (int)protractorPosition.y - 9, 20, BLACK);
             DrawText("210", (int)protractorPosition.x - 100, (int)protractorPosition.y + 50, 20, BLACK);
             DrawText("270", (int)protractorPosition.x - 18, (int)protractorPosition.y + 92, 20, BLACK);
             DrawText("330", (int)protractorPosition.x + 72, (int)protractorPosition.y + 50, 20, BLACK);
             if (currentAngleDegrees != 0.0f) DrawLineEx(protractorPosition, finalVector, 3.0f, gestureColor);

             // Draw touch and mouse pointer points
             if (currentGesture != GESTURE_NONE)
             {
                 if ( touchCount != 0 )
                 {
                     for (i = 0; i < touchCount; i++)
                     {
                         DrawCircleV(touchPosition[i], 50.0f, Fade(gestureColor, 0.5f));
                         DrawCircleV(touchPosition[i], 5.0f, gestureColor);
                     }

                     if (touchCount == 2) DrawLineEx(touchPosition[0], touchPosition[1], ((currentGesture == 512)? 8.0f : 12.0f), gestureColor);
                 }
                 else
                 {
                     DrawCircleV(mousePosition, 35.0f, Fade(gestureColor, 0.5f));
                     DrawCircleV(mousePosition, 5.0f, gestureColor);
                 }
             }

         EndDrawing();
         //--------------------------------------------------------------------------------------
     }

     // De-Initialization
     //--------------------------------------------------------------------------------------
     CloseWindow();        // Close window and OpenGL context
     //--------------------------------------------------------
    end;
    CloseWindow;
  end;

begin
  main;
end.
