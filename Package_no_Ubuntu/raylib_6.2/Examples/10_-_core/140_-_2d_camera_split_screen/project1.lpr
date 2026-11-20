program project1;

uses
  fp_raylib,
  fp_raymath;

const
  PLAYER_SIZE = 40;
  screenWidth = 800;
  screenHeight = 440;

var
  player1, player2: TRectangle;
  camera1, camera2: TCamera2D;
  rtScreenCamera1, rtScreenCamera2: TRenderTexture2D;
  recSplitScreen: TRectangle;
  i, j: integer;

begin
  InitWindow(screenWidth, screenHeight, 'raylib [core] example - 2d camera split screen');

  player1 := rect(200, 200, PLAYER_SIZE, PLAYER_SIZE);
  player2 := rect(250, 200, PLAYER_SIZE, PLAYER_SIZE);

  camera1 := Default(TCamera2D);
  camera1.target := vec2(player1.x, player1.y);
  camera1.offset := vec2(200.0, 200.0);
  camera1.rotation := 0.0;
  camera1.zoom := 1.0;

  camera2 := Default(TCamera2D);
  camera2.target := vec2(player2.x, player2.y);
  camera2.offset := vec2(200.0, 200.0);
  camera2.rotation := 0.0;
  camera2.zoom := 1.0;

  rtScreenCamera1 := LoadRenderTexture(screenWidth div 2, screenHeight);
  rtScreenCamera2 := LoadRenderTexture(screenWidth div 2, screenHeight);

  recSplitScreen := rect(0.0, 0.0, rtScreenCamera1.texture.width, -rtScreenCamera1.texture.height);

  SetTargetFPS(60);

  while not WindowShouldClose do begin
    if IsKeyDown(KEY_S) then begin
      player1.y := player1.y + 3.0;
    end else if IsKeyDown(KEY_W) then begin
      player1.y := player1.y - 3.0;
    end;
    if IsKeyDown(KEY_D) then begin
      player1.x := player1.x + 3.0;
    end else if IsKeyDown(KEY_A) then begin
      player1.x := player1.x - 3.0;
    end;

    if IsKeyDown(KEY_UP) then begin
      player2.y := player2.y - 3.0;
    end else if IsKeyDown(KEY_DOWN) then begin
      player2.y := player2.y + 3.0;
    end;
    if IsKeyDown(KEY_RIGHT) then begin
      player2.x := player2.x + 3.0;
    end else if IsKeyDown(KEY_LEFT) then begin
      player2.x := player2.x - 3.0;
    end;

    camera1.target := vec2(player1.x, player1.y);
    camera2.target := vec2(player2.x, player2.y);

    BeginTextureMode(rtScreenCamera1);
    ClearBackground(RAYWHITE);

    BeginMode2D(camera1);
    for i := 0 to (screenWidth div PLAYER_SIZE) do begin
      DrawLineV(vec2(PLAYER_SIZE * i, 0), vec2(PLAYER_SIZE * i, screenHeight), LIGHTGRAY);
    end;

    for i := 0 to (screenHeight div PLAYER_SIZE) do begin
      DrawLineV(vec2(0, PLAYER_SIZE * i), vec2(screenWidth, PLAYER_SIZE * i), LIGHTGRAY);
    end;

    for i := 0 to (screenWidth div PLAYER_SIZE) - 1 do begin
      for j := 0 to (screenHeight div PLAYER_SIZE) - 1 do begin
        DrawText(TextFormat('[%i,%i]', i, j), 10 + PLAYER_SIZE * i, 15 + PLAYER_SIZE * j, 10, LIGHTGRAY);
      end;
    end;

    DrawRectangleRec(player1, RED);
    DrawRectangleRec(player2, BLUE);
    EndMode2D;

    DrawRectangle(0, 0, GetScreenWidth div 2, 30, Fade(RAYWHITE, 0.6));
    DrawText('PLAYER1: W/S/A/D to move', 10, 10, 10, MAROON);
    EndTextureMode;

    BeginTextureMode(rtScreenCamera2);
    ClearBackground(RAYWHITE);

    BeginMode2D(camera2);
    for i := 0 to (screenWidth div PLAYER_SIZE) do begin
      DrawLineV(vec2(PLAYER_SIZE * i, 0), vec2(PLAYER_SIZE * i, screenHeight), LIGHTGRAY);
    end;

    for i := 0 to (screenHeight div PLAYER_SIZE) do begin
      DrawLineV(vec2(0, PLAYER_SIZE * i), vec2(screenWidth, PLAYER_SIZE * i), LIGHTGRAY);
    end;

    for i := 0 to (screenWidth div PLAYER_SIZE) - 1 do begin
      for j := 0 to (screenHeight div PLAYER_SIZE) - 1 do begin
        DrawText(TextFormat('[%i,%i]', i, j), 10 + PLAYER_SIZE * i, 15 + PLAYER_SIZE * j, 10, LIGHTGRAY);
      end;
    end;

    DrawRectangleRec(player1, RED);
    DrawRectangleRec(player2, BLUE);
    EndMode2D;

    DrawRectangle(0, 0, GetScreenWidth div 2, 30, Fade(RAYWHITE, 0.6));
    DrawText('PLAYER2: UP/DOWN/LEFT/RIGHT to move', 10, 10, 10, DARKBLUE);
    EndTextureMode;

    BeginDrawing;
    ClearBackground(BLACK);

    DrawTextureRec(rtScreenCamera1.texture, recSplitScreen, vec2(0, 0), WHITE);
    DrawTextureRec(rtScreenCamera2.texture, recSplitScreen, vec2(screenWidth / 2.0, 0), WHITE);

    DrawRectangle(GetScreenWidth div 2 - 2, 0, 4, GetScreenHeight, LIGHTGRAY);
    EndDrawing;
  end;

  UnloadRenderTexture(rtScreenCamera1);
  UnloadRenderTexture(rtScreenCamera2);

  CloseWindow;
end.
