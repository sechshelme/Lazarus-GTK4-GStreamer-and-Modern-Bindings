program project1;

uses
  fp_raylib;

  procedure main;
  const
    screenWidth = 800;
    screenHeight = 450;
  begin
    InitWindow(screenWidth, screenHeight, 'raylib [core] example - basic window');
    SetTargetFPS(60);

    while not WindowShouldClose do begin
      BeginDrawing();
      ClearBackground(RAYWHITE);
      DrawText('Congrats! You created your first window!', 190, 200, 20, LIGHTGRAY);
      EndDrawing();
    end;

    CloseWindow();
  end;

begin
  main;
end.
