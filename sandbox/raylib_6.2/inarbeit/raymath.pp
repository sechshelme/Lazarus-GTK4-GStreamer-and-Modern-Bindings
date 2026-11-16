
unit raymath;
interface

{
  Automatically converted by H2Pas 1.0.0 from raymath.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    raymath.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pfloat16  = ^float16;
Pfloat3  = ^float3;
PMatrix  = ^Matrix;
PQuaternion  = ^Quaternion;
Psingle  = ^single;
PVector2  = ^Vector2;
PVector3  = ^Vector3;
PVector4  = ^Vector4;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



const
  EPSILON = 0.000001;  
  DEG2RAD = PI/180.0;  
  RAD2DEG = 180.0/PI;  
{ xxxxxxxxxxxxx
#ifndef MatrixToFloat
    #define MatrixToFloat(mat) (MatrixToFloatV(mat).v)
#endif

#ifndef Vector3ToFloat
    #define Vector3ToFloat(vec) (Vector3ToFloatV(vec).v)
#endif

 }
{---------------------------------------------------------------------------------- }
{ Types and Structures Definition }
{---------------------------------------------------------------------------------- }
{ Vector2 type }
type
  PVector2 = ^TVector2;
  TVector2 = record
      x : single;
      y : single;
    end;
{ Vector3 type }

  PVector3 = ^TVector3;
  TVector3 = record
      x : single;
      y : single;
      z : single;
    end;
{$endif}
{ Vector4 type }
type
  PVector4 = ^TVector4;
  TVector4 = record
      x : single;
      y : single;
      z : single;
      w : single;
    end;
{$if !defined(RL_QUATERNION_TYPE)}
{ Quaternion type }
type
  PQuaternion = ^TQuaternion;
  TQuaternion = TVector4;
{$endif}
{$if !defined(RL_MATRIX_TYPE)}
{ Matrix type (OpenGL style 4x4 - right handed, column major) }
{ Matrix first row (4 components) }
{ Matrix second row (4 components) }
{ Matrix third row (4 components) }
{ Matrix fourth row (4 components) }
type
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
{$endif}
{ NOTE: Helper types to be used instead of array return types for *ToFloat functions }
{$if !defined(RL_FLOAT3_TYPE)}
type
  Pfloat3 = ^Tfloat3;
  Tfloat3 = record
      v : array[0..2] of single;
    end;
{$endif}
{$if !defined(RL_FLOAT16_TYPE)}
type
  Pfloat16 = ^Tfloat16;
  Tfloat16 = record
      v : array[0..15] of single;
    end;
{$endif}
{---------------------------------------------------------------------------------- }
{ Module Functions Definition - Utils math }
{---------------------------------------------------------------------------------- }
{ Clamp float value }

function Clamp(value:single; min:single; max:single):single;cdecl;external;
function Lerp(start:single; end:single; amount:single):single;cdecl;external;
function Normalize(value:single; start:single; end:single):single;cdecl;external;
function Remap(value:single; inputStart:single; inputEnd:single; outputStart:single; outputEnd:single):single;cdecl;external;
function Wrap(value:single; min:single; max:single):single;cdecl;external;
function FloatEquals(x:single; y:single):longint;cdecl;external;
function Vector2Zero:TVector2;cdecl;external;
function Vector2One:TVector2;cdecl;external;
function Vector2Add(v1:TVector2; v2:TVector2):TVector2;cdecl;external;
function Vector2AddValue(v:TVector2; add:single):TVector2;cdecl;external;
function Vector2Subtract(v1:TVector2; v2:TVector2):TVector2;cdecl;external;
function Vector2SubtractValue(v:TVector2; sub:single):TVector2;cdecl;external;
function Vector2Length(v:TVector2):single;cdecl;external;
function Vector2LengthSqr(v:TVector2):single;cdecl;external;
function Vector2DotProduct(v1:TVector2; v2:TVector2):single;cdecl;external;
function Vector2CrossProduct(v1:TVector2; v2:TVector2):single;cdecl;external;
function Vector2Distance(v1:TVector2; v2:TVector2):single;cdecl;external;
function Vector2DistanceSqr(v1:TVector2; v2:TVector2):single;cdecl;external;
function Vector2Angle(v1:TVector2; v2:TVector2):single;cdecl;external;
function Vector2LineAngle(start:TVector2; end:TVector2):single;cdecl;external;
function Vector2Scale(v:TVector2; scale:single):TVector2;cdecl;external;
function Vector2Multiply(v1:TVector2; v2:TVector2):TVector2;cdecl;external;
function Vector2Negate(v:TVector2):TVector2;cdecl;external;
function Vector2Divide(v1:TVector2; v2:TVector2):TVector2;cdecl;external;
function Vector2Normalize(v:TVector2):TVector2;cdecl;external;
function Vector2Transform(v:TVector2; mat:TMatrix):TVector2;cdecl;external;
function Vector2Lerp(v1:TVector2; v2:TVector2; amount:single):TVector2;cdecl;external;
function Vector2Reflect(v:TVector2; normal:TVector2):TVector2;cdecl;external;
function Vector2Min(v1:TVector2; v2:TVector2):TVector2;cdecl;external;
function Vector2Max(v1:TVector2; v2:TVector2):TVector2;cdecl;external;
function Vector2Rotate(v:TVector2; angle:single):TVector2;cdecl;external;
function Vector2MoveTowards(v:TVector2; target:TVector2; maxDistance:single):TVector2;cdecl;external;
function Vector2Invert(v:TVector2):TVector2;cdecl;external;
function Vector2Clamp(v:TVector2; min:TVector2; max:TVector2):TVector2;cdecl;external;
function Vector2ClampValue(v:TVector2; min:single; max:single):TVector2;cdecl;external;
function Vector2Equals(p:TVector2; q:TVector2):longint;cdecl;external;
function Vector2Refract(v:TVector2; n:TVector2; r:single):TVector2;cdecl;external;
{---------------------------------------------------------------------------------- }
{ Module Functions Definition - Vector3 math }
{---------------------------------------------------------------------------------- }
function Vector3Zero:TVector3;cdecl;external;
function Vector3One:TVector3;cdecl;external;
function Vector3Add(v1:TVector3; v2:TVector3):TVector3;cdecl;external;
function Vector3AddValue(v:TVector3; add:single):TVector3;cdecl;external;
function Vector3Subtract(v1:TVector3; v2:TVector3):TVector3;cdecl;external;
function Vector3SubtractValue(v:TVector3; sub:single):TVector3;cdecl;external;
function Vector3Scale(v:TVector3; scalar:single):TVector3;cdecl;external;
function Vector3Multiply(v1:TVector3; v2:TVector3):TVector3;cdecl;external;
function Vector3CrossProduct(v1:TVector3; v2:TVector3):TVector3;cdecl;external;
function Vector3Perpendicular(v:TVector3):TVector3;cdecl;external;
(* Const before type ignored *)
function Vector3Length(v:TVector3):single;cdecl;external;
(* Const before type ignored *)
function Vector3LengthSqr(v:TVector3):single;cdecl;external;
function Vector3DotProduct(v1:TVector3; v2:TVector3):single;cdecl;external;
function Vector3Distance(v1:TVector3; v2:TVector3):single;cdecl;external;
function Vector3DistanceSqr(v1:TVector3; v2:TVector3):single;cdecl;external;
function Vector3Angle(v1:TVector3; v2:TVector3):single;cdecl;external;
function Vector3Negate(v:TVector3):TVector3;cdecl;external;
function Vector3Divide(v1:TVector3; v2:TVector3):TVector3;cdecl;external;
function Vector3Normalize(v:TVector3):TVector3;cdecl;external;
function Vector3Project(v1:TVector3; v2:TVector3):TVector3;cdecl;external;
function Vector3Reject(v1:TVector3; v2:TVector3):TVector3;cdecl;external;
procedure Vector3OrthoNormalize(v1:PVector3; v2:PVector3);cdecl;external;
function Vector3Transform(v:TVector3; mat:TMatrix):TVector3;cdecl;external;
function Vector3RotateByQuaternion(v:TVector3; q:TQuaternion):TVector3;cdecl;external;
function Vector3RotateByAxisAngle(v:TVector3; axis:TVector3; angle:single):TVector3;cdecl;external;
function Vector3MoveTowards(v:TVector3; target:TVector3; maxDistance:single):TVector3;cdecl;external;
function Vector3Lerp(v1:TVector3; v2:TVector3; amount:single):TVector3;cdecl;external;
function Vector3CubicHermite(v1:TVector3; tangent1:TVector3; v2:TVector3; tangent2:TVector3; amount:single):TVector3;cdecl;external;
function Vector3Reflect(v:TVector3; normal:TVector3):TVector3;cdecl;external;
function Vector3Min(v1:TVector3; v2:TVector3):TVector3;cdecl;external;
function Vector3Max(v1:TVector3; v2:TVector3):TVector3;cdecl;external;
function Vector3Barycenter(p:TVector3; a:TVector3; b:TVector3; c:TVector3):TVector3;cdecl;external;
function Vector3Unproject(source:TVector3; projection:TMatrix; view:TMatrix):TVector3;cdecl;external;
function Vector3ToFloatV(v:TVector3):Tfloat3;cdecl;external;
function Vector3Invert(v:TVector3):TVector3;cdecl;external;
function Vector3Clamp(v:TVector3; min:TVector3; max:TVector3):TVector3;cdecl;external;
function Vector3ClampValue(v:TVector3; min:single; max:single):TVector3;cdecl;external;
function Vector3Equals(p:TVector3; q:TVector3):longint;cdecl;external;
function Vector3Refract(v:TVector3; n:TVector3; r:single):TVector3;cdecl;external;
function Vector4Zero:TVector4;cdecl;external;
function Vector4One:TVector4;cdecl;external;
function Vector4Add(v1:TVector4; v2:TVector4):TVector4;cdecl;external;
function Vector4AddValue(v:TVector4; add:single):TVector4;cdecl;external;
function Vector4Subtract(v1:TVector4; v2:TVector4):TVector4;cdecl;external;
function Vector4SubtractValue(v:TVector4; add:single):TVector4;cdecl;external;
function Vector4Length(v:TVector4):single;cdecl;external;
function Vector4LengthSqr(v:TVector4):single;cdecl;external;
function Vector4DotProduct(v1:TVector4; v2:TVector4):single;cdecl;external;
function Vector4Distance(v1:TVector4; v2:TVector4):single;cdecl;external;
function Vector4DistanceSqr(v1:TVector4; v2:TVector4):single;cdecl;external;
function Vector4Scale(v:TVector4; scale:single):TVector4;cdecl;external;
function Vector4Multiply(v1:TVector4; v2:TVector4):TVector4;cdecl;external;
function Vector4Negate(v:TVector4):TVector4;cdecl;external;
function Vector4Divide(v1:TVector4; v2:TVector4):TVector4;cdecl;external;
function Vector4Normalize(v:TVector4):TVector4;cdecl;external;
function Vector4Min(v1:TVector4; v2:TVector4):TVector4;cdecl;external;
function Vector4Max(v1:TVector4; v2:TVector4):TVector4;cdecl;external;
function Vector4Lerp(v1:TVector4; v2:TVector4; amount:single):TVector4;cdecl;external;
function Vector4MoveTowards(v:TVector4; target:TVector4; maxDistance:single):TVector4;cdecl;external;
function Vector4Invert(v:TVector4):TVector4;cdecl;external;
function Vector4Equals(p:TVector4; q:TVector4):longint;cdecl;external;
{---------------------------------------------------------------------------------- }
{ Module Functions Definition - Matrix math }
{---------------------------------------------------------------------------------- }
function MatrixDeterminant(mat:TMatrix):single;cdecl;external;
function MatrixTrace(mat:TMatrix):single;cdecl;external;
function MatrixTranspose(mat:TMatrix):TMatrix;cdecl;external;
function MatrixInvert(mat:TMatrix):TMatrix;cdecl;external;
function MatrixIdentity:TMatrix;cdecl;external;
function MatrixAdd(left:TMatrix; right:TMatrix):TMatrix;cdecl;external;
function MatrixSubtract(left:TMatrix; right:TMatrix):TMatrix;cdecl;external;
function MatrixMultiply(left:TMatrix; right:TMatrix):TMatrix;cdecl;external;
function MatrixMultiplyValue(left:TMatrix; value:single):TMatrix;cdecl;external;
function MatrixTranslate(x:single; y:single; z:single):TMatrix;cdecl;external;
function MatrixRotate(axis:TVector3; angle:single):TMatrix;cdecl;external;
function MatrixRotateX(angle:single):TMatrix;cdecl;external;
function MatrixRotateY(angle:single):TMatrix;cdecl;external;
function MatrixRotateZ(angle:single):TMatrix;cdecl;external;
function MatrixRotateXYZ(angle:TVector3):TMatrix;cdecl;external;
function MatrixRotateZYX(angle:TVector3):TMatrix;cdecl;external;
function MatrixScale(x:single; y:single; z:single):TMatrix;cdecl;external;
function MatrixFrustum(left:Tdouble; right:Tdouble; bottom:Tdouble; top:Tdouble; nearPlane:Tdouble; 
           farPlane:Tdouble):TMatrix;cdecl;external;
function MatrixPerspective(fovY:Tdouble; aspect:Tdouble; nearPlane:Tdouble; farPlane:Tdouble):TMatrix;cdecl;external;
function MatrixOrtho(left:Tdouble; right:Tdouble; bottom:Tdouble; top:Tdouble; nearPlane:Tdouble; 
           farPlane:Tdouble):TMatrix;cdecl;external;
function MatrixLookAt(eye:TVector3; target:TVector3; up:TVector3):TMatrix;cdecl;external;
function MatrixToFloatV(mat:TMatrix):Tfloat16;cdecl;external;
{---------------------------------------------------------------------------------- }
{ Module Functions Definition - Quaternion math }
{---------------------------------------------------------------------------------- }
function QuaternionAdd(q1:TQuaternion; q2:TQuaternion):TQuaternion;cdecl;external;
function QuaternionAddValue(q:TQuaternion; add:single):TQuaternion;cdecl;external;
function QuaternionSubtract(q1:TQuaternion; q2:TQuaternion):TQuaternion;cdecl;external;
function QuaternionSubtractValue(q:TQuaternion; sub:single):TQuaternion;cdecl;external;
function QuaternionIdentity:TQuaternion;cdecl;external;
function QuaternionLength(q:TQuaternion):single;cdecl;external;
function QuaternionNormalize(q:TQuaternion):TQuaternion;cdecl;external;
function QuaternionInvert(q:TQuaternion):TQuaternion;cdecl;external;
function QuaternionMultiply(q1:TQuaternion; q2:TQuaternion):TQuaternion;cdecl;external;
function QuaternionScale(q:TQuaternion; mul:single):TQuaternion;cdecl;external;
function QuaternionDivide(q1:TQuaternion; q2:TQuaternion):TQuaternion;cdecl;external;
function QuaternionLerp(q1:TQuaternion; q2:TQuaternion; amount:single):TQuaternion;cdecl;external;
function QuaternionNlerp(q1:TQuaternion; q2:TQuaternion; amount:single):TQuaternion;cdecl;external;
function QuaternionSlerp(q1:TQuaternion; q2:TQuaternion; amount:single):TQuaternion;cdecl;external;
function QuaternionCubicHermiteSpline(q1:TQuaternion; outTangent1:TQuaternion; q2:TQuaternion; inTangent2:TQuaternion; t:single):TQuaternion;cdecl;external;
function QuaternionFromVector3ToVector3(from:TVector3; to:TVector3):TQuaternion;cdecl;external;
function QuaternionFromMatrix(mat:TMatrix):TQuaternion;cdecl;external;
function QuaternionToMatrix(q:TQuaternion):TMatrix;cdecl;external;
function QuaternionFromAxisAngle(axis:TVector3; angle:single):TQuaternion;cdecl;external;
procedure QuaternionToAxisAngle(q:TQuaternion; outAxis:PVector3; outAngle:Psingle);cdecl;external;
function QuaternionFromEuler(pitch:single; yaw:single; roll:single):TQuaternion;cdecl;external;
function QuaternionToEuler(q:TQuaternion):TVector3;cdecl;external;
function QuaternionTransform(q:TQuaternion; mat:TMatrix):TQuaternion;cdecl;external;
function QuaternionEquals(p:TQuaternion; q:TQuaternion):longint;cdecl;external;
function MatrixCompose(translation:TVector3; rotation:TQuaternion; scale:TVector3):TMatrix;cdecl;external;
procedure MatrixDecompose(mat:TMatrix; translation:PVector3; rotation:PQuaternion; scale:PVector3);cdecl;external;
{$if defined(__cplusplus) && !defined(RAYMATH_DISABLE_CPP_OPERATORS);}

implementation


end.
