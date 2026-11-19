program project1;

{$mode objfpc}{$H+}

uses
  fp_raylib;

  procedure main;
  const
    screenWidth = 800;
    screenHeight = 450;

    BUTTON_NONE = -1;
    BUTTON_UP = 0;
    BUTTON_LEFT = 1;
    BUTTON_RIGHT = 2;
    BUTTON_DOWN = 3;
    BUTTON_MAX = 4;
  var
    padPosition: TVector2 = (x: 100; y: 350);
    buttonRadius: single = 30;

    buttonPositions: array[0..BUTTON_MAX - 1] of TVector2;
    arrowTris: array[0..3, 0..2] of TVector2;
    buttonLabelColors: array[0..BUTTON_MAX - 1] of PColor = (@YELLOW, @BLUE, @RED, @GREEN);

    pressedButton: integer = BUTTON_NONE;
    inputPosition: TVector2 = (x: 0; y: 0);

    playerPosition: TVector2;
    playerSpeed: single = 75;

    i: integer;
    distX, distY: single;
    btnColor: TColor;
  begin
    InitWindow(screenWidth, screenHeight, 'raylib [core] example - input virtual controls');

    buttonPositions := [
      vec2(padPosition.x, padPosition.y - buttonRadius * 1.5),
      vec2(padPosition.x - buttonRadius * 1.5, padPosition.y),
      vec2(padPosition.x + buttonRadius * 1.5, padPosition.y),
      vec2(padPosition.x, padPosition.y + buttonRadius * 1.5)];

    buttonPositions := [
      vec2(padPosition.x, padPosition.y - buttonRadius * 1.5),
      vec2(padPosition.x - buttonRadius * 1.5, padPosition.y),
      vec2(padPosition.x + buttonRadius * 1.5, padPosition.y),
      vec2(padPosition.x, padPosition.y + buttonRadius * 1.5)];

    arrowTris := [[
      vec2(buttonPositions[0].x, buttonPositions[0].y - 12),
      vec2(buttonPositions[0].x - 9, buttonPositions[0].y + 9),
      vec2(buttonPositions[0].x + 9, buttonPositions[0].y + 9)
      ], [
      vec2(buttonPositions[1].x + 9, buttonPositions[1].y - 9),
      vec2(buttonPositions[1].x - 12, buttonPositions[1].y),
      vec2(buttonPositions[1].x + 9, buttonPositions[1].y + 9)
      ], [
      vec2(buttonPositions[2].x + 12, buttonPositions[2].y),
      vec2(buttonPositions[2].x - 9, buttonPositions[2].y - 9),
      vec2(buttonPositions[2].x - 9, buttonPositions[2].y + 9)
      ], [
      vec2(buttonPositions[3].x - 9, buttonPositions[3].y - 9),
      vec2(buttonPositions[3].x, buttonPositions[3].y + 12),
      vec2(buttonPositions[3].x + 9, buttonPositions[3].y - 9)
      ]];

    playerPosition := vec2(screenWidth / 2, screenHeight / 2);

    SetTargetFPS(60);
    //--------------------------------------------------------------------------
    while not WindowShouldClose do begin
      if GetTouchPointCount() > 0 then begin
        inputPosition := GetTouchPosition(0);
      end else begin
        inputPosition := GetMousePosition();
      end;

      pressedButton := BUTTON_NONE;

      if (GetTouchPointCount() > 0) or ((GetTouchPointCount() = 0) and IsMouseButtonDown(MOUSE_BUTTON_LEFT)) then begin
        for i := 0 to BUTTON_MAX - 1 do begin
          distX := Abs(buttonPositions[i].x - inputPosition.x);
          distY := Abs(buttonPositions[i].y - inputPosition.y);

          if (distX + distY < buttonRadius) then begin
            pressedButton := i;
            break;
          end;
        end;
      end;

      case pressedButton of
        BUTTON_UP: begin
          playerPosition.y := playerPosition.y - playerSpeed * GetFrameTime();
        end;
        BUTTON_LEFT: begin
          playerPosition.x := playerPosition.x - playerSpeed * GetFrameTime();
        end;
        BUTTON_RIGHT: begin
          playerPosition.x := playerPosition.x + playerSpeed * GetFrameTime();
        end;
        BUTTON_DOWN: begin
          playerPosition.y := playerPosition.y + playerSpeed * GetFrameTime();
        end;
      end;

      BeginDrawing();
      ClearBackground(RAYWHITE);

      DrawCircleV(playerPosition, 50, MAROON);

      for i := 0 to BUTTON_MAX - 1 do begin
        if i = pressedButton then begin
          btnColor := DARKGRAY;
        end else begin
          btnColor := BLACK;
        end;

        DrawCircleV(buttonPositions[i], buttonRadius, btnColor);
        DrawTriangle(arrowTris[i, 0], arrowTris[i, 1], arrowTris[i, 2], buttonLabelColors[i]^);
      end;

      DrawText('move the player with D-Pad buttons', 10, 10, 20, DARKGRAY);
      EndDrawing();
    end;

    CloseWindow();
  end;

begin
  main;
end.
