unit fp_rcamera;

interface

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{******************************************************************************************
*
*   rcamera - Basic camera system with support for multiple camera modes
*
*   CONFIGURATION:
*       #define RCAMERA_IMPLEMENTATION
*           Generates the implementation of the library into the included file.
*           If not defined, the library is in header only mode and can be included in other headers
*           or source files without problems. But only ONE file should hold the implementation.
*
*       #define RCAMERA_STANDALONE
*           If defined, the library can be used as standalone as a camera system but some
*           functions must be redefined to manage inputs accordingly.
*
*   CONTRIBUTORS:
*       Ramon Santamaria:   Supervision, review, update and maintenance
*       Christoph Wagner:   Complete redesign, using raymath (2022)
*       Marc Palau:         Initial implementation (2014)
*
*
*   LICENSE: zlib/libpng
*
*   Copyright (c) 2022-2026 Christoph Wagner (@Crydsch) and Ramon Santamaria (@raysan5)
*
*   This software is provided "as-is", without any express or implied warranty. In no event
*   will the authors be held liable for any damages arising from the use of this software.
*
*   Permission is granted to anyone to use this software for any purpose, including commercial
*   applications, and to alter it and redistribute it freely, subject to the following restrictions:
*
*     1. The origin of this software must not be misrepresented; you must not claim that you
*     wrote the original software. If you use this software in a product, an acknowledgment
*     in the product documentation would be appreciated but is not required.
*
*     2. Altered source versions must be plainly marked as such, and must not be misrepresented
*     as being the original software.
*
*     3. This notice may not be removed or altered from any source distribution.
*
********************************************************************************************* }
{$ifndef RCAMERA_H}
{$define RCAMERA_H}
{$if defined(RCAMERA_STANDALONE)}

const
  CAMERA_CULL_DISTANCE_NEAR = 0.05;  
  CAMERA_CULL_DISTANCE_FAR = 4000.0;  
{$else}

const
  CAMERA_CULL_DISTANCE_NEAR = RL_CULL_DISTANCE_NEAR;  
  CAMERA_CULL_DISTANCE_FAR = RL_CULL_DISTANCE_FAR;  
{$endif}
{---------------------------------------------------------------------------------- }
{ Types and Structures Definition }
{ NOTE: Below types are required for standalone usage }
{---------------------------------------------------------------------------------- }
{$if defined(RCAMERA_STANDALONE)}
{ Vector2, 2 components }
{ Vector x component }
{ Vector y component }
type
  PVector2 = ^TVector2;
  TVector2 = record
      x : single;
      y : single;
    end;
{ Vector3, 3 components }
{ Vector x component }
{ Vector y component }
{ Vector z component }

  PVector3 = ^TVector3;
  TVector3 = record
      x : single;
      y : single;
      z : single;
    end;
{ Matrix, 4x4 components, column major, OpenGL style, right-handed }
{ Matrix first row (4 components) }
{ Matrix second row (4 components) }
{ Matrix third row (4 components) }
{ Matrix fourth row (4 components) }

  PMatrix = ^TMatrix;
  TMatrix = record
      m0 : single;
      m4 : single;
      m8 : single;
      m12 : single;
      m1 : single;
      m5 : single;
      m9 : single;
      m13 : single;
      m2 : single;
      m6 : single;
      m10 : single;
      m14 : single;
      m3 : single;
      m7 : single;
      m11 : single;
      m15 : single;
    end;
{ Camera type, defines a camera position/orientation in 3d space }
{ Camera position }
{ Camera target it looks-at }
{ Camera up vector (rotation over its axis) }
{ Camera field-of-view aperture in Y (degrees) in perspective, used as near plane width in orthographic }
{ Camera projection type: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC }

  PCamera3D = ^TCamera3D;
  TCamera3D = record
      position : TVector3;
      target : TVector3;
      up : TVector3;
      fovy : single;
      projection : longint;
    end;

  PCamera = ^TCamera;
  TCamera = TCamera3D;
{ Camera type fallback, defaults to Camera3D }
{ Camera projection }
{ Perspective projection }
{ Orthographic projection }

  PCameraProjection = ^TCameraProjection;
  TCameraProjection =  Longint;
  Const
    CAMERA_PERSPECTIVE = 0;
    CAMERA_ORTHOGRAPHIC = 1;
;
{ Camera system modes }
{ Camera custom, controlled by user (UpdateCamera() does nothing) }
{ Camera free mode }
{ Camera orbital, around target, zoom supported }
{ Camera first person }
{ Camera third person }
type
  PCameraMode = ^TCameraMode;
  TCameraMode =  Longint;
  Const
    CAMERA_CUSTOM = 0;
    CAMERA_FREE = 1;
    CAMERA_ORBITAL = 2;
    CAMERA_FIRST_PERSON = 3;
    CAMERA_THIRD_PERSON = 4;
;
{$endif}
{---------------------------------------------------------------------------------- }
{ Global Variables Definition }
{---------------------------------------------------------------------------------- }
{... }
{---------------------------------------------------------------------------------- }
{ Module Functions Declaration }
{---------------------------------------------------------------------------------- }

function GetCameraForward(camera:PCamera):TVector3;cdecl;external libraylib;
function GetCameraUp(camera:PCamera):TVector3;cdecl;external libraylib;
function GetCameraRight(camera:PCamera):TVector3;cdecl;external libraylib;
{ Camera movement }
procedure CameraMoveForward(camera:PCamera; distance:single; moveInWorldPlane:Tbool);cdecl;external libraylib;
procedure CameraMoveUp(camera:PCamera; distance:single);cdecl;external libraylib;
procedure CameraMoveRight(camera:PCamera; distance:single; moveInWorldPlane:Tbool);cdecl;external libraylib;
procedure CameraMoveToTarget(camera:PCamera; delta:single);cdecl;external libraylib;
{ Camera rotation }
procedure CameraYaw(camera:PCamera; angle:single; rotateAroundTarget:Tbool);cdecl;external libraylib;
procedure CameraPitch(camera:PCamera; angle:single; lockView:Tbool; rotateAroundTarget:Tbool; rotateUp:Tbool);cdecl;external libraylib;
procedure CameraRoll(camera:PCamera; angle:single);cdecl;external libraylib;
function GetCameraViewMatrix(camera:PCamera):TMatrix;cdecl;external libraylib;
function GetCameraProjectionMatrix(camera:PCamera; aspect:single):TMatrix;cdecl;external libraylib;

// === Konventiert am: 17-11-26 13:59:21 ===


implementation



end.
