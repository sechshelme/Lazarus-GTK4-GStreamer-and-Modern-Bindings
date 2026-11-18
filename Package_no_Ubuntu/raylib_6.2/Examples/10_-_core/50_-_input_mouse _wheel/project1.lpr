program project1;

uses
  fp_raylib;

  procedure main;
  const
    screenWidth = 800;
    screenHeight = 450;
  var
    boxPositionY: integer = screenHeight div 2 - 40;
    scrollSpeed: integer = 4;
  begin
    InitWindow(screenWidth, screenHeight, 'raylib [core] example - input mouse wheel');
    SetTargetFPS(60);

    while not WindowShouldClose do begin
      boxPositionY -= Trunc(GetMouseWheelMove * scrollSpeed);

      BeginDrawing;
      ClearBackground(RAYWHITE);

      DrawRectangle(screenWidth div 2 - 40, boxPositionY, 80, 80, MAROON);

      DrawText('"Use mouse wheel to move the cube up and down!', 10, 10, 20, GRAY);
      DrawText(TextFormat('Box position Y: %03i', boxPositionY), 10, 40, 20, LIGHTGRAY);
      EndDrawing();
    end;
    CloseWindow;
  end;

begin
  main;
end.
