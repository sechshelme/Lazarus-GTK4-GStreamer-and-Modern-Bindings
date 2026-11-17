unit fp_rcamera;

interface

uses
  fp_raylib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  CAMERA_CULL_DISTANCE_NEAR = 0.05;
  CAMERA_CULL_DISTANCE_FAR = 4000.0;

type
  PVector2 = ^TVector2;
  TVector2 = record
    x: single;
    y: single;
  end;

  PVector3 = ^TVector3;
  TVector3 = record
    x: single;
    y: single;
    z: single;
  end;

  PMatrix = ^TMatrix;
  TMatrix = record
    m0: single;
    m4: single;
    m8: single;
    m12: single;
    m1: single;
    m5: single;
    m9: single;
    m13: single;
    m2: single;
    m6: single;
    m10: single;
    m14: single;
    m3: single;
    m7: single;
    m11: single;
    m15: single;
  end;

  PCamera3D = ^TCamera3D;
  TCamera3D = record
    position: TVector3;
    target: TVector3;
    up: TVector3;
    fovy: single;
    projection: longint;
  end;

  PCamera = ^TCamera;
  TCamera = TCamera3D;

type
  PCameraProjection = ^TCameraProjection;
  TCameraProjection = longint;
const
  CAMERA_PERSPECTIVE = 0;
  CAMERA_ORTHOGRAPHIC = 1;

type
  PCameraMode = ^TCameraMode;
  TCameraMode = longint;
const
  CAMERA_CUSTOM = 0;
  CAMERA_FREE = 1;
  CAMERA_ORBITAL = 2;
  CAMERA_FIRST_PERSON = 3;
  CAMERA_THIRD_PERSON = 4;

function GetCameraForward(camera: PCamera): TVector3; cdecl; external libraylib;
function GetCameraUp(camera: PCamera): TVector3; cdecl; external libraylib;
function GetCameraRight(camera: PCamera): TVector3; cdecl; external libraylib;
procedure CameraMoveForward(camera: PCamera; distance: single; moveInWorldPlane: Boolean); cdecl; external libraylib;
procedure CameraMoveUp(camera: PCamera; distance: single); cdecl; external libraylib;
procedure CameraMoveRight(camera: PCamera; distance: single; moveInWorldPlane: Boolean); cdecl; external libraylib;
procedure CameraMoveToTarget(camera: PCamera; delta: single); cdecl; external libraylib;
procedure CameraYaw(camera: PCamera; angle: single; rotateAroundTarget: Boolean); cdecl; external libraylib;
procedure CameraPitch(camera: PCamera; angle: single; lockView: Boolean; rotateAroundTarget: Boolean; rotateUp: Boolean); cdecl; external libraylib;
procedure CameraRoll(camera: PCamera; angle: single); cdecl; external libraylib;
function GetCameraViewMatrix(camera: PCamera): TMatrix; cdecl; external libraylib;
function GetCameraProjectionMatrix(camera: PCamera; aspect: single): TMatrix; cdecl; external libraylib;

// === Konventiert am: 17-11-26 13:59:21 ===


implementation



end.
