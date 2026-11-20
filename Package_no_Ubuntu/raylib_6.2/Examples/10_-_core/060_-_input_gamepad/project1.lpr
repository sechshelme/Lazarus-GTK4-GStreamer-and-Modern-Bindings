program project1;

uses
  fp_raylib;

  procedure main;
  const
    screenWidth = 800;
    screenHeight = 450;

    XBOX_ALIAS_1 = 'xbox';
    XBOX_ALIAS_2 = 'x-box';
    PS_ALIAS_1 = 'playstation';
    PS_ALIAS_2 = 'sony';
  var
    leftStickDeadzoneX: single = 0.1;
    leftStickDeadzoneY: single = 0.1;
    rightStickDeadzoneX: single = 0.1;
    rightStickDeadzoneY: single = 0.1;
    leftTriggerDeadzone: single = -0.9;
    rightTriggerDeadzone: single = -0.9;

    gamepad: integer = 0;

    texPs3Pad, texXboxPad: TTexture2D;
    vibrateButton:TRectangle;
    mousePosition: TVector2;
    leftStickX, leftStickY, rightStickX, rightStickY, leftTrigger, rightTrigger: single;
    leftGamepadColor, rightGamepadColor: TColor;
    i: integer;
  begin
    SetConfigFlags(FLAG_MSAA_4X_HINT);

    InitWindow(screenWidth, screenHeight, 'raylib [core] example - input gamepad');

    texPs3Pad := LoadTexture('../../../../../../Raylib_media/ps3.png');
    texXboxPad := LoadTexture('../../../../../../Raylib_media/xbox.png');

    SetTargetFPS(60);
    while not WindowShouldClose do begin
      if IsKeyPressed(KEY_LEFT) and (gamepad > 0) then begin
        Dec(gamepad);
      end;
      if IsKeyPressed(KEY_RIGHT) then begin
        inc(gamepad);
      end;
      mousePosition := GetMousePosition();

      vibrateButton.items := [10, 70.0 + 20 * GetGamepadAxisCount(gamepad) + 20, 75, 24];
      if IsMouseButtonPressed(MOUSE_BUTTON_LEFT) and CheckCollisionPointRec(mousePosition, vibrateButton) then begin
        SetGamepadVibration(gamepad, 1.0, 1.0, 1.0);
      end;

      BeginDrawing();
      ClearBackground(RAYWHITE);

      if IsGamepadAvailable(gamepad) then begin
        DrawText(TextFormat('GP%d: %s', gamepad, GetGamepadName(gamepad)), 10, 10, 10, BLACK);

        leftStickX := GetGamepadAxisMovement(gamepad, GAMEPAD_AXIS_LEFT_X);
        leftStickY := GetGamepadAxisMovement(gamepad, GAMEPAD_AXIS_LEFT_Y);
        rightStickX := GetGamepadAxisMovement(gamepad, GAMEPAD_AXIS_RIGHT_X);
        rightStickY := GetGamepadAxisMovement(gamepad, GAMEPAD_AXIS_RIGHT_Y);
        leftTrigger := GetGamepadAxisMovement(gamepad, GAMEPAD_AXIS_LEFT_TRIGGER);
        rightTrigger := GetGamepadAxisMovement(gamepad, GAMEPAD_AXIS_RIGHT_TRIGGER);

        if (leftStickX > -leftStickDeadzoneX) and (leftStickX < leftStickDeadzoneX) then begin
          leftStickX := 0.0;
        end;
        if (leftStickY > -leftStickDeadzoneY) and (leftStickY < leftStickDeadzoneY) then  begin
          leftStickY := 0.0;
        end;
        if (rightStickX > -rightStickDeadzoneX) and (rightStickX < rightStickDeadzoneX) then begin
          rightStickX := 0.0;
        end;
        if (rightStickY > -rightStickDeadzoneY) and (rightStickY < rightStickDeadzoneY) then begin
          rightStickY := 0.0;
        end;
        if leftTrigger < leftTriggerDeadzone then begin
          leftTrigger := -1.0;
        end;
        if rightTrigger < rightTriggerDeadzone then begin
          rightTrigger := -1.0;
        end;

        if ((TextFindIndex(TextToLower(GetGamepadName(gamepad)), XBOX_ALIAS_1) > -1) or
          (TextFindIndex(TextToLower(GetGamepadName(gamepad)), XBOX_ALIAS_2) > -1)) then begin
          DrawTexture(texXboxPad, 0, 0, DARKGRAY);

          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_MIDDLE) then begin
            DrawCircle(394, 89, 19, RED);
          end;

          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_MIDDLE_RIGHT) then begin
            DrawCircle(436, 150, 9, RED);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_MIDDLE_LEFT) then begin
            DrawCircle(352, 150, 9, RED);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_RIGHT_FACE_LEFT) then begin
            DrawCircle(501, 151, 15, BLUE);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_RIGHT_FACE_DOWN) then begin
            DrawCircle(536, 187, 15, LIME);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_RIGHT_FACE_RIGHT) then begin
            DrawCircle(572, 151, 15, MAROON);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_RIGHT_FACE_UP) then begin
            DrawCircle(536, 115, 15, GOLD);
          end;

          DrawRectangle(317, 202, 19, 71, BLACK);
          DrawRectangle(293, 228, 69, 19, BLACK);
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_LEFT_FACE_UP) then begin
            DrawRectangle(317, 202, 19, 26, RED);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_LEFT_FACE_DOWN) then begin
            DrawRectangle(317, 202 + 45, 19, 26, RED);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_LEFT_FACE_LEFT) then begin
            DrawRectangle(292, 228, 25, 19, RED);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_LEFT_FACE_RIGHT) then begin
            DrawRectangle(292 + 44, 228, 26, 19, RED);
          end;

          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_LEFT_TRIGGER_1) then begin
            DrawCircle(259, 61, 20, RED);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_RIGHT_TRIGGER_1) then begin
            DrawCircle(536, 61, 20, RED);
          end;

          leftGamepadColor := BLACK;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_LEFT_THUMB) then begin
            leftGamepadColor := RED;
          end;
          DrawCircle(259, 152, 39, BLACK);
          DrawCircle(259, 152, 34, LIGHTGRAY);
          DrawCircle(259 + Trunc(leftStickX * 20), 152 + Trunc(leftStickY * 20), 25, leftGamepadColor);

          rightGamepadColor := BLACK;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_RIGHT_THUMB) then begin
            rightGamepadColor := RED;
          end;
          DrawCircle(461, 237, 38, BLACK);
          DrawCircle(461, 237, 33, LIGHTGRAY);
          DrawCircle(461 + Trunc(rightStickX * 20), 237 + Trunc(rightStickY * 20), 25, rightGamepadColor);

          DrawRectangle(170, 30, 15, 70, GRAY);
          DrawRectangle(604, 30, 15, 70, GRAY);
          DrawRectangle(170, 30, 15, Trunc(((1 + leftTrigger) / 2) * 70), RED);
          DrawRectangle(604, 30, 15, Trunc(((1 + rightTrigger) / 2) * 70), RED);

          //DrawText(TextFormat("Xbox axis LT: %02.02f", GetGamepadAxisMovement(gamepad, GAMEPAD_AXIS_LEFT_TRIGGER)), 10, 40, 10, BLACK);
          //DrawText(TextFormat("Xbox axis RT: %02.02f", GetGamepadAxisMovement(gamepad, GAMEPAD_AXIS_RIGHT_TRIGGER)), 10, 60, 10, BLACK);
        end else if ((TextFindIndex(TextToLower(GetGamepadName(gamepad)), PS_ALIAS_1) > -1)) or ((TextFindIndex(TextToLower(GetGamepadName(gamepad)), PS_ALIAS_2) > -1)) then begin
          DrawTexture(texPs3Pad, 0, 0, DARKGRAY);

          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_MIDDLE) then begin
            DrawCircle(396, 222, 13, RED);
          end;

          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_MIDDLE_LEFT) then begin
            DrawRectangle(328, 170, 32, 13, RED);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_MIDDLE_RIGHT) then begin
            DrawTriangle(vec2(436, 168), vec2(436, 185), vec2(464, 177), RED);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_RIGHT_FACE_UP) then begin
            DrawCircle(557, 144, 13, LIME);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_RIGHT_FACE_RIGHT) then begin
            DrawCircle(586, 173, 13, RED);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_RIGHT_FACE_DOWN) then begin
            DrawCircle(557, 203, 13, VIOLET);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_RIGHT_FACE_LEFT) then begin
            DrawCircle(527, 173, 13, PINK);
          end;

          DrawRectangle(225, 132, 24, 84, BLACK);
          DrawRectangle(195, 161, 84, 25, BLACK);
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_LEFT_FACE_UP) then begin
            DrawRectangle(225, 132, 24, 29, RED);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_LEFT_FACE_DOWN) then begin
            DrawRectangle(225, 132 + 54, 24, 30, RED);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_LEFT_FACE_LEFT) then begin
            DrawRectangle(195, 161, 30, 25, RED);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_LEFT_FACE_RIGHT) then begin
            DrawRectangle(195 + 54, 161, 30, 25, RED);
          end;

          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_LEFT_TRIGGER_1) then begin
            DrawCircle(239, 82, 20, RED);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_RIGHT_TRIGGER_1) then begin
            DrawCircle(557, 82, 20, RED);
          end;

          leftGamepadColor := BLACK;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_LEFT_THUMB) then begin
            leftGamepadColor := RED;
          end;
          DrawCircle(319, 255, 35, BLACK);
          DrawCircle(319, 255, 31, LIGHTGRAY);
          DrawCircle(319 + Trunc(leftStickX * 20), 255 + Trunc(leftStickY * 20), 25, leftGamepadColor);

          rightGamepadColor := BLACK;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_RIGHT_THUMB) then begin
            rightGamepadColor := RED;
          end;
          DrawCircle(475, 255, 35, BLACK);
          DrawCircle(475, 255, 31, LIGHTGRAY);
          DrawCircle(475 + trunc(rightStickX * 20), 255 + trunc(rightStickY * 20), 25, rightGamepadColor);

          DrawRectangle(169, 48, 15, 70, GRAY);
          DrawRectangle(611, 48, 15, 70, GRAY);
          DrawRectangle(169, 48, 15, trunc(((1 + leftTrigger) / 2) * 70), RED);
          DrawRectangle(611, 48, 15, trunc(((1 + rightTrigger) / 2) * 70), RED);
        end else begin
          DrawRectangleRounded(rect(175, 110, 460, 220), 0.3, 16, DARKGRAY);

          DrawCircle(365, 170, 12, RAYWHITE);
          DrawCircle(405, 170, 12, RAYWHITE);
          DrawCircle(445, 170, 12, RAYWHITE);
          DrawCircle(516, 191, 17, RAYWHITE);
          DrawCircle(551, 227, 17, RAYWHITE);
          DrawCircle(587, 191, 17, RAYWHITE);
          DrawCircle(551, 155, 17, RAYWHITE);
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_MIDDLE_LEFT) then begin
            DrawCircle(365, 170, 10, RED);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_MIDDLE) then begin
            DrawCircle(405, 170, 10, GREEN);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_MIDDLE_RIGHT) then begin
            DrawCircle(445, 170, 10, BLUE);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_RIGHT_FACE_LEFT) then begin
            DrawCircle(516, 191, 15, GOLD);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_RIGHT_FACE_DOWN) then begin
            DrawCircle(551, 227, 15, BLUE);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_RIGHT_FACE_RIGHT) then begin
            DrawCircle(587, 191, 15, GREEN);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_RIGHT_FACE_UP) then begin
            DrawCircle(551, 155, 15, RED);
          end;

          DrawRectangle(245, 145, 28, 88, RAYWHITE);
          DrawRectangle(215, 174, 88, 29, RAYWHITE);
          DrawRectangle(247, 147, 24, 84, BLACK);
          DrawRectangle(217, 176, 84, 25, BLACK);
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_LEFT_FACE_UP) then begin
            DrawRectangle(247, 147, 24, 29, RED);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_LEFT_FACE_DOWN) then begin
            DrawRectangle(247, 147 + 54, 24, 30, RED);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_LEFT_FACE_LEFT) then begin
            DrawRectangle(217, 176, 30, 25, RED);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_LEFT_FACE_RIGHT) then begin
            DrawRectangle(217 + 54, 176, 30, 25, RED);
          end;

          DrawRectangleRounded(rect(215, 98, 100, 10), 0.5, 16, DARKGRAY);
          DrawRectangleRounded(rect(495, 98, 100, 10), 0.5, 16, DARKGRAY);
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_LEFT_TRIGGER_1) then begin
            DrawRectangleRounded(rect(215, 98, 100, 10), 0.5, 16, RED);
          end;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_RIGHT_TRIGGER_1) then begin
            DrawRectangleRounded(rect(495, 98, 100, 10), 0.5, 16, RED);
          end;

          leftGamepadColor := BLACK;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_LEFT_THUMB) then begin
            leftGamepadColor := RED;
          end;
          DrawCircle(345, 260, 40, BLACK);
          DrawCircle(345, 260, 35, LIGHTGRAY);
          DrawCircle(345 + trunc(leftStickX * 20), 260 + trunc(leftStickY * 20), 25, leftGamepadColor);

          rightGamepadColor := BLACK;
          if IsGamepadButtonDown(gamepad, GAMEPAD_BUTTON_RIGHT_THUMB) then begin
            rightGamepadColor := RED;
          end;
          DrawCircle(465, 260, 40, BLACK);
          DrawCircle(465, 260, 35, LIGHTGRAY);
          DrawCircle(465 + trunc(rightStickX * 20), 260 + trunc(rightStickY * 20), 25, rightGamepadColor);

          DrawRectangle(151, 110, 15, 70, GRAY);
          DrawRectangle(644, 110, 15, 70, GRAY);
          DrawRectangle(151, 110, 15, trunc(((1 + leftTrigger) / 2) * 70), RED);
          DrawRectangle(644, 110, 15, trunc(((1 + rightTrigger) / 2) * 70), RED);
        end;

        DrawText(TextFormat('DETECTED AXIS [%i]:', GetGamepadAxisCount(gamepad)), 10, 50, 10, MAROON);

        for i := 0 to GetGamepadAxisCount(gamepad) - 1 do begin
          DrawText(TextFormat('AXIS %i: %.02', i, GetGamepadAxisMovement(gamepad, i)), 20, 70 + 20 * i, 10, DARKGRAY);
        end;

        DrawRectangleRec(vibrateButton, SKYBLUE);
        DrawText('VIBRATE', trunc(vibrateButton.x + 14), trunc(vibrateButton.y + 1), 10, DARKGRAY);

        if GetGamepadButtonPressed <> GAMEPAD_BUTTON_UNKNOWN then  begin
          DrawText(TextFormat('DETECTED BUTTON: %i', GetGamepadButtonPressed()), 10, 430, 10, RED);
        end else begin
          DrawText('DETECTED BUTTON: NONE', 10, 430, 10, GRAY);
        end;
      end else begin
        DrawText(TextFormat('GP%d: NOT DETECTED', gamepad), 10, 10, 10, GRAY);
        DrawTexture(texXboxPad, 0, 0, LIGHTGRAY);
      end;

      EndDrawing();
    end;
    UnloadTexture(texPs3Pad);
    UnloadTexture(texXboxPad);
    CloseWindow;
  end;

begin
  main;
end.
