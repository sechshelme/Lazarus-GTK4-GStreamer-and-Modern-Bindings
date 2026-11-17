program project1;

uses
  fp_raymath,
  fp_rlgl,
  fp_raylib;

  function vec3(x, y, z: single): TVector3; inline;
  begin
    Result.x := x;
    Result.y := y;
    Result.z := z;
  end;

  procedure main;
  var
    camera: TCamera3D;
    cubeModel: TModel;
    rotation: single;
  begin
    InitWindow(800, 600, 'Rotierender Würfel');

    FillChar(camera, SizeOf(camera), 0);
    camera.position := vec3(5.0, 5.0, 5.0);
    camera.target := vec3(0.0, 0.0, 0.0);
    camera.up := vec3(0.0, 1.0, 0.0);
    camera.fovy := 45.0;
    camera.projection := CAMERA_PERSPECTIVE;

    cubeModel := LoadModelFromMesh(GenMeshCube(2.0, 2.0, 2.0));
    rotation := 0.0;

    SetTargetFPS(60);

    while not WindowShouldClose do begin
      rotation := rotation + 90.0 * GetFrameTime;

      BeginDrawing;
      ClearBackground(RAYWHITE);
      DrawText('Der Würfel dreht sich!', 190, 50, 20, DARKGRAY);

      BeginMode3D(camera);
      DrawModelEx(cubeModel, vec3(0, 0, 0), vec3(0, 1, 0), rotation, vec3(1, 1, 1), RED);
      DrawModelWiresEx(cubeModel, vec3(0, 0, 0), vec3(0, 1, 0), rotation, vec3(1, 1, 1), BLACK);
      DrawGrid(10, 1.0);
      EndMode3D;

      DrawFPS(10, 10);
      EndDrawing;
    end;

    UnloadModel(cubeModel);
    CloseWindow;
  end;

begin
  main;
end.
