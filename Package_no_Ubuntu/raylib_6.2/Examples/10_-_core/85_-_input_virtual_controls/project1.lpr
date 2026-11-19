program project1;

uses
  fp_raylib;

  procedure main;
  const
    screenWidth = 800;
    screenHeight = 450;

        BUTTON_NONE = -1;
        BUTTON_UP=0;
        BUTTON_LEFT=1;
        BUTTON_RIGHT=2;
        BUTTON_DOWN=3;
        BUTTON_MAX=4;
  var
    padPosition:TVector2  = (x: 100;y: 350 );
   buttonRadius:Single = 30;

  begin
    InitWindow(screenWidth, screenHeight, 'raylib [core] example - input virtual controls');


      Vector2 buttonPositions[BUTTON_MAX] = {
          { padPosition.x,padPosition.y - buttonRadius*1.5f },  // Up
          { padPosition.x - buttonRadius*1.5f, padPosition.y }, // Left
          { padPosition.x + buttonRadius*1.5f, padPosition.y }, // Right
          { padPosition.x, padPosition.y + buttonRadius*1.5f }  // Down
      };

      Vector2 arrowTris[4][3] = {
          // Up
          {
              { buttonPositions[0].x,     buttonPositions[0].y - 12 },
              { buttonPositions[0].x - 9, buttonPositions[0].y + 9  },
              { buttonPositions[0].x + 9, buttonPositions[0].y + 9  }
          },
          // Left
          {
              { buttonPositions[1].x + 9,  buttonPositions[1].y - 9 },
              { buttonPositions[1].x - 12, buttonPositions[1].y     },
              { buttonPositions[1].x + 9,  buttonPositions[1].y + 9 }
          },
          // Right
          {
              { buttonPositions[2].x + 12, buttonPositions[2].y     },
              { buttonPositions[2].x - 9,  buttonPositions[2].y - 9 },
              { buttonPositions[2].x - 9,  buttonPositions[2].y + 9 }
          },
          // Down
          {
              { buttonPositions[3].x - 9, buttonPositions[3].y - 9  },
              { buttonPositions[3].x,     buttonPositions[3].y + 12 },
              { buttonPositions[3].x + 9, buttonPositions[3].y - 9  }
          }
      };

      Color buttonLabelColors[BUTTON_MAX] = {
          YELLOW, // Up
          BLUE,   // Left
          RED,    // Right
          GREEN   // Down
      };

      int pressedButton = BUTTON_NONE;
      Vector2 inputPosition = { 0, 0 };

      Vector2 playerPosition = { (float)screenWidth/2, (float)screenHeight/2 };
      float playerSpeed = 75;

      SetTargetFPS(60);
      //-------------------------------
    while not WindowShouldClose do begin
      if ((GetTouchPointCount() > 0)) inputPosition = GetTouchPosition(0); // Use touch position
        else inputPosition = GetMousePosition(); // Use mouse position

        // Reset pressed button to none
        pressedButton = BUTTON_NONE;

        // Make sure user is pressing left mouse button if they're from desktop
        if ((GetTouchPointCount() > 0) ||
            ((GetTouchPointCount() == 0) && IsMouseButtonDown(MOUSE_BUTTON_LEFT)))
        {
            // Find nearest D-Pad button to the input position
            for (int i = 0; i < BUTTON_MAX; i++)
            {
                float distX = fabsf(buttonPositions[i].x - inputPosition.x);
                float distY = fabsf(buttonPositions[i].y - inputPosition.y);

                if ((distX + distY < buttonRadius))
                {
                    pressedButton = i;
                    break;
                }
            }
        }

        // Move player according to pressed button
        switch (pressedButton)
        {
            case BUTTON_UP: playerPosition.y -= playerSpeed*GetFrameTime(); break;
            case BUTTON_LEFT: playerPosition.x -= playerSpeed*GetFrameTime(); break;
            case BUTTON_RIGHT: playerPosition.x += playerSpeed*GetFrameTime(); break;
            case BUTTON_DOWN: playerPosition.y += playerSpeed*GetFrameTime(); break;
            default: break;
        };
        //--------------------------------------------------------------------------

        // Draw
        //--------------------------------------------------------------------------
        BeginDrawing();

            ClearBackground(RAYWHITE);

            // Draw world
            DrawCircleV(playerPosition, 50, MAROON);

            // Draw GUI
            for (int i = 0; i < BUTTON_MAX; i++)
            {
                DrawCircleV(buttonPositions[i], buttonRadius, (i == pressedButton)? DARKGRAY : BLACK);

                DrawTriangle(
                    arrowTris[i][0],
                    arrowTris[i][1],
                    arrowTris[i][2],
                    buttonLabelColors[i]
                );
            }

            DrawText("move the player with D-Pad buttons", 10, 10, 20, DARKGRAY);

        EndDrawing();

    end;
    CloseWindow;
  end;

begin
  main;
end.
end;
