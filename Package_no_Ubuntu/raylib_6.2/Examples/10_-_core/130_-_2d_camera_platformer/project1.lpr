program project1;

uses
  fp_raylib,
  fp_raymath,
  fp_rlgl;

  function Min(a, b: single): single; inline;
  begin
    if a < b then begin
      Result := a;
    end else begin
      Result := b;
    end;
  end;

  function Max(a, b: single): single; inline;
  begin
    if a > b then begin
      Result := a;
    end else begin
      Result := b;
    end;
  end;

const
  G = 400.0;
  PLAYER_JUMP_SPD = 350.0;
  PLAYER_HOR_SPD = 200.0;

type
  TPlayer = record
    position: TVector2;
    speed: single;
    canJump: boolean;
  end;
  PPlayer = ^TPlayer;

  TEnvItem = record
    rect: TRectangle;
    blocking: integer;
    color: TColor;
  end;
  PEnvItem = ^TEnvItem;

  TCameraUpdater = procedure(camera: PCamera2D; player: PPlayer; envItems: PEnvItem; envItemsLength: integer; delta: single; width, height: integer);

  procedure UpdatePlayer(player: PPlayer; envItems: PEnvItem; envItemsLength: integer; delta: single);
  var
    i: integer;
    hitObstacle: boolean;
    ei: TEnvItem;
  begin
    if IsKeyDown(KEY_LEFT) then begin
      player^.position.x := player^.position.x - PLAYER_HOR_SPD * delta;
    end;
    if IsKeyDown(KEY_RIGHT) then begin
      player^.position.x := player^.position.x + PLAYER_HOR_SPD * delta;
    end;
    if IsKeyDown(KEY_SPACE) and player^.canJump then begin
      player^.speed := -PLAYER_JUMP_SPD;
      player^.canJump := False;
    end;

    hitObstacle := False;
    for i := 0 to envItemsLength - 1 do begin
      ei := envItems[i];
      if (ei.blocking <> 0) and
        (ei.rect.x <= player^.position.x) and
        (ei.rect.x + ei.rect.width >= player^.position.x) and
        (ei.rect.y >= player^.position.y) and
        (ei.rect.y <= player^.position.y + player^.speed * delta) then begin
        hitObstacle := True;
        player^.speed := 0.0;
        player^.position.y := ei.rect.y;
        Break;
      end;
    end;

    if not hitObstacle then begin
      player^.position.y := player^.position.y + player^.speed * delta;
      player^.speed := player^.speed + G * delta;
      player^.canJump := False;
    end else begin
      player^.canJump := True;
    end;
  end;

  procedure UpdateCameraCenter(camera: PCamera2D; player: PPlayer; envItems: PEnvItem; envItemsLength: integer; delta: single; width, height: integer);
  begin
    camera^.offset := vec2(width / 2.0, height / 2.0);
    camera^.target := player^.position;
  end;

  procedure UpdateCameraCenterInsideMap(camera: PCamera2D; player: PPlayer; envItems: PEnvItem; envItemsLength: integer; delta: single; width, height: integer);
  var
    minX, minY, maxX, maxY: single;
    i: integer;
    ei: TEnvItem;
    maxPos, minPos: TVector2;
  begin
    camera^.target := player^.position;
    camera^.offset := vec2(width / 2.0, height / 2.0);
    minX := 1000.0;
    minY := 1000.0;
    maxX := -1000.0;
    maxY := -1000.0;

    for i := 0 to envItemsLength - 1 do begin
      ei := envItems[i];
      minX := Min(ei.rect.x, minX);
      maxX := Max(ei.rect.x + ei.rect.width, maxX);
      minY := Min(ei.rect.y, minY);
      maxY := Max(ei.rect.y + ei.rect.height, maxY);
    end;

    maxPos := GetWorldToScreen2D(vec2(maxX, maxY), camera^);
    minPos := GetWorldToScreen2D(vec2(minX, minY), camera^);

    if maxPos.x < width then begin
      camera^.offset.x := width - (maxPos.x - width / 2.0);
    end;
    if maxPos.y < height then begin
      camera^.offset.y := height - (maxPos.y - height / 2.0);
    end;
    if minPos.x > 0 then begin
      camera^.offset.x := width / 2.0 - minPos.x;
    end;
    if minPos.y > 0 then begin
      camera^.offset.y := height / 2.0 - minPos.y;
    end;
  end;

  procedure UpdateCameraCenterSmoothFollow(camera: PCamera2D; player: PPlayer; envItems: PEnvItem; envItemsLength: integer; delta: single; width, height: integer);
  const
    minSpeed = 30.0;
    minEffectLength = 10.0;
    fractionSpeed = 0.8;
  var
    diff: TVector2;
    length, speed: single;
  begin
    camera^.offset := vec2(width / 2.0, height / 2.0);
    diff := Vector2Subtract(player^.position, camera^.target);
    length := Vector2Length(diff);

    if length > minEffectLength then begin
      speed := Max(fractionSpeed * length, minSpeed);
      camera^.target := Vector2Add(camera^.target, Vector2Scale(diff, speed * delta / length));
    end;
  end;

  procedure UpdateCameraEvenOutOnLanding(camera: PCamera2D; player: PPlayer; envItems: PEnvItem; envItemsLength: integer; delta: single; width, height: integer);
  const
    evenOutSpeed = 700.0;
  var
    eveningOut: boolean = False;
    evenOutTarget: single = 0.0;
  begin
    camera^.offset := vec2(width / 2.0, height / 2.0);
    camera^.target.x := player^.position.x;

    if eveningOut then begin
      if evenOutTarget > camera^.target.y then begin
        camera^.target.y := camera^.target.y + evenOutSpeed * delta;
        if camera^.target.y > evenOutTarget then begin
          camera^.target.y := evenOutTarget;
          eveningOut := False;
        end;
      end else begin
        camera^.target.y := camera^.target.y - evenOutSpeed * delta;
        if camera^.target.y < evenOutTarget then begin
          camera^.target.y := evenOutTarget;
          eveningOut := False;
        end;
      end;
    end else begin
      if player^.canJump and (player^.speed = 0.0) and (player^.position.y <> camera^.target.y) then begin
        eveningOut := True;
        evenOutTarget := player^.position.y;
      end;
    end;
  end;

  procedure UpdateCameraPlayerBoundsPush(camera: PCamera2D; player: PPlayer; envItems: PEnvItem; envItemsLength: integer; delta: single; width, height: integer);
  const
    bbox: TVector2 = (x: 0.2; y: 0.2);
  var
    bboxWorldMin, bboxWorldMax: TVector2;
  begin
    bboxWorldMin := GetScreenToWorld2D(vec2((1.0 - bbox.x) * 0.5 * width, (1.0 - bbox.y) * 0.5 * height), camera^);
    bboxWorldMax := GetScreenToWorld2D(vec2((1.0 + bbox.x) * 0.5 * width, (1.0 + bbox.y) * 0.5 * height), camera^);
    camera^.offset := vec2((1.0 - bbox.x) * 0.5 * width, (1.0 - bbox.y) * 0.5 * height);

    if player^.position.x < bboxWorldMin.x then begin
      camera^.target.x := player^.position.x;
    end;
    if player^.position.y < bboxWorldMin.y then begin
      camera^.target.y := player^.position.y;
    end;
    if player^.position.x > bboxWorldMax.x then begin
      camera^.target.x := bboxWorldMin.x + (player^.position.x - bboxWorldMax.x);
    end;
    if player^.position.y > bboxWorldMax.y then begin
      camera^.target.y := bboxWorldMin.y + (player^.position.y - bboxWorldMax.y);
    end;
  end;

const
  screenWidth = 800;
  screenHeight = 450;

var
  player: TPlayer;
  envItems: array[0..4] of TEnvItem;
  camera: TCamera2D;
  cameraUpdaters: array[0..4] of TCameraUpdater;
  cameraDescriptions: array[0..4] of PChar;
  cameraOption, i: integer;
  deltaTime: single;
  playerRect: TRectangle;

begin
  InitWindow(screenWidth, screenHeight, 'raylib [core] example - 2d camera platformer');

  player.position := vec2(400, 280);
  player.speed := 0;
  player.canJump := False;

  envItems[0].rect := rect(0, 0, 1000, 400);
  envItems[0].blocking := 0;
  envItems[0].color := LIGHTGRAY;
  envItems[1].rect := rect(0, 400, 1000, 200);
  envItems[1].blocking := 1;
  envItems[1].color := GRAY;
  envItems[2].rect := rect(300, 200, 400, 10);
  envItems[2].blocking := 1;
  envItems[2].color := GRAY;
  envItems[3].rect := rect(250, 300, 100, 10);
  envItems[3].blocking := 1;
  envItems[3].color := GRAY;
  envItems[4].rect := rect(650, 300, 100, 10);
  envItems[4].blocking := 1;
  envItems[4].color := GRAY;

  camera := Default(TCamera2D);
  camera.target := player.position;
  camera.offset := vec2(GetRenderWidth / 2.0, GetRenderHeight / 2.0);
  camera.rotation := 0.0;
  camera.zoom := 1.0;

  cameraUpdaters[0] := @UpdateCameraCenter;
  cameraUpdaters[1] := @UpdateCameraCenterInsideMap;
  cameraUpdaters[2] := @UpdateCameraCenterSmoothFollow;
  cameraUpdaters[3] := @UpdateCameraEvenOutOnLanding;
  cameraUpdaters[4] := @UpdateCameraPlayerBoundsPush;

  cameraOption := 0;

  cameraDescriptions[0] := 'Follow player center';
  cameraDescriptions[1] := 'Follow player center, but clamp to map edges';
  cameraDescriptions[2] := 'Follow player center; smoothed';
  cameraDescriptions[3] := 'Follow player center horizontally; update player center vertically after landing';
  cameraDescriptions[4] := 'Player push camera on getting too close to screen edge';

  SetTargetFPS(60);

  while not WindowShouldClose do begin
    deltaTime := GetFrameTime;

    UpdatePlayer(@player, envItems, Length(envItems), deltaTime);

    camera.zoom := camera.zoom + (GetMouseWheelMove * 0.05);

    if camera.zoom > 3.0 then begin
      camera.zoom := 3.0;
    end else if camera.zoom < 0.25 then begin
      camera.zoom := 0.25;
    end;

    if IsKeyPressed(KEY_R) then begin
      camera.zoom := 1.0;
      player.position := vec2(400, 280);
    end;

    if IsKeyPressed(KEY_C) then begin
      cameraOption := (cameraOption + 1) mod Length(cameraUpdaters);
    end;

    cameraUpdaters[cameraOption](@camera, @player, envItems, Length(envItems), deltaTime, screenWidth, screenHeight);

    BeginDrawing;
    ClearBackground(LIGHTGRAY);

    BeginMode2D(camera);
    for i := 0 to High(envItems) do begin
      DrawRectangleRec(envItems[i].rect, envItems[i].color);
    end;
    playerRect := rect(player.position.x - 20, player.position.y - 40, 40.0, 40.0);
    DrawRectangleRec(playerRect, RED);
    DrawCircleV(player.position, 5.0, GOLD);
    EndMode2D;

    DrawText('Controls:', 20, 20, 10, BLACK);
    DrawText('- Right/Left to move', 40, 40, 10, DARKGRAY);
    DrawText('- Space to jump', 40, 60, 10, DARKGRAY);
    DrawText('- Mouse Wheel to Zoom in-out', 40, 80, 10, DARKGRAY);
    DrawText('- R to reset position + zoom', 40, 100, 10, DARKGRAY);
    DrawText('- C to change camera mode', 40, 120, 10, DARKGRAY);
    DrawText('Current camera mode:', 20, 140, 10, BLACK);
    DrawText(cameraDescriptions[cameraOption], 40, 160, 10, DARKGRAY);

    EndDrawing;
  end;

  CloseWindow;
end.
