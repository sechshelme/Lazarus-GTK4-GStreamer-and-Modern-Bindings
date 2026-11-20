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
  InitWindow(screenWidth, screenHeight, 'raylib [core] example - 3d camera mode');

  camera := Default(TCamera3D);
  camera.position := vec3(0.0, 10.0, 10.0);
  camera.target := vec3(0.0, 0.0, 0.0);
  camera.up := vec3(0.0, 1.0, 0.0);
  camera.fovy := 45.0;
  camera.projection := CAMERA_PERSPECTIVE;

  cubePosition := vec3(0.0, 0.0, 0.0);

  SetTargetFPS(60);

  while not WindowShouldClose do begin
    BeginDrawing;
    ClearBackground(RAYWHITE);
    BeginMode3D(camera);
    DrawCube(cubePosition, 2.0, 2.0, 2.0, RED);
    DrawCubeWires(cubePosition, 2.0, 2.0, 2.0, MAROON);
    DrawGrid(10, 1.0);
    EndMode3D;
    DrawText('Welcome to the third dimension!', 10, 40, 20, DARKGRAY);
    DrawFPS(10, 10);
    EndDrawing;
  end;

  CloseWindow;
end.
