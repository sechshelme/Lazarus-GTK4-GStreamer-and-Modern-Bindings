program project1;

uses
  fp_raylib,
  fp_raymath;

const
  screenWidth = 800;
  screenHeight = 450;

var
  camera: TCamera3D;
  cubePosition: TVector3;

begin
  InitWindow(screenWidth, screenHeight, 'raylib [core] example - 3d camera free');

  camera := Default(TCamera3D);
  camera.position := vec3(0.0, 10.0, 10.0);
  camera.target := vec3(0.0, 0.0, 0.0);
  camera.up := vec3(0.0, 1.0, 0.0);
  camera.fovy := 45.0;
  camera.projection := CAMERA_PERSPECTIVE;

  cubePosition := vec3(0.0, 0.0, 0.0);

  SetTargetFPS(60);

  while not WindowShouldClose do begin
    UpdateCamera(@camera, CAMERA_FREE);

    if IsKeyPressed(KEY_Z) then begin
      camera.target := vec3(0.0, 0.0, 0.0);
    end;

    BeginDrawing;
    ClearBackground(RAYWHITE);

    BeginMode3D(camera);
    DrawCube(cubePosition, 2.0, 2.0, 2.0, RED);
    DrawCubeWires(cubePosition, 2.0, 2.0, 2.0, MAROON);
    DrawGrid(10, 1.0);
    EndMode3D();

    DrawRectangle(10, 10, 320, 93, Fade(SKYBLUE, 0.5));
    DrawRectangleLines(10, 10, 320, 93, BLUE);

    DrawText('Free camera default controls:', 20, 20, 10, BLACK);
    DrawText('- Mouse Wheel to Zoom in-out', 40, 40, 10, DARKGRAY);
    DrawText('- Mouse Wheel Pressed to Pan', 40, 60, 10, DARKGRAY);
    DrawText('- Z to zoom to (0, 0, 0)', 40, 80, 10, DARKGRAY);

    EndDrawing;
  end;

  CloseWindow;
end.
