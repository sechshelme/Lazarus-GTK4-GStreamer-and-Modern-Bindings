unit fp_raymath;

interface

uses
  fp_raylib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tfloat3 = record
    v: array[0..2] of single;
  end;
  Pfloat3 = ^Tfloat3;

  Tfloat16 = record
    v: array[0..15] of single;
  end;
  Pfloat16 = ^Tfloat16;

function Clamp(value: single; min: single; max: single): single; cdecl; external libraylib;
function Lerp(start: single; end_: single; amount: single): single; cdecl; external libraylib;
function Normalize(value: single; start: single; end_: single): single; cdecl; external libraylib;
function Remap(value: single; inputStart: single; inputEnd: single; outputStart: single; outputEnd: single): single; cdecl; external libraylib;
function Wrap(value: single; min: single; max: single): single; cdecl; external libraylib;
function FloatEquals(x: single; y: single): longint; cdecl; external libraylib;
function Vector2Zero: TVector2; cdecl; external libraylib;
function Vector2One: TVector2; cdecl; external libraylib;
function Vector2Add(v1: TVector2; v2: TVector2): TVector2; cdecl; external libraylib;
function Vector2AddValue(v: TVector2; add: single): TVector2; cdecl; external libraylib;
function Vector2Subtract(v1: TVector2; v2: TVector2): TVector2; cdecl; external libraylib;
function Vector2SubtractValue(v: TVector2; sub: single): TVector2; cdecl; external libraylib;
function Vector2Length(v: TVector2): single; cdecl; external libraylib;
function Vector2LengthSqr(v: TVector2): single; cdecl; external libraylib;
function Vector2DotProduct(v1: TVector2; v2: TVector2): single; cdecl; external libraylib;
function Vector2CrossProduct(v1: TVector2; v2: TVector2): single; cdecl; external libraylib;
function Vector2Distance(v1: TVector2; v2: TVector2): single; cdecl; external libraylib;
function Vector2DistanceSqr(v1: TVector2; v2: TVector2): single; cdecl; external libraylib;
function Vector2Angle(v1: TVector2; v2: TVector2): single; cdecl; external libraylib;
function Vector2LineAngle(start: TVector2; end_: TVector2): single; cdecl; external libraylib;
function Vector2Scale(v: TVector2; scale: single): TVector2; cdecl; external libraylib;
function Vector2Multiply(v1: TVector2; v2: TVector2): TVector2; cdecl; external libraylib;
function Vector2Negate(v: TVector2): TVector2; cdecl; external libraylib;
function Vector2Divide(v1: TVector2; v2: TVector2): TVector2; cdecl; external libraylib;
function Vector2Normalize(v: TVector2): TVector2; cdecl; external libraylib;
function Vector2Transform(v: TVector2; mat: TMatrix): TVector2; cdecl; external libraylib;
function Vector2Lerp(v1: TVector2; v2: TVector2; amount: single): TVector2; cdecl; external libraylib;
function Vector2Reflect(v: TVector2; normal: TVector2): TVector2; cdecl; external libraylib;
function Vector2Min(v1: TVector2; v2: TVector2): TVector2; cdecl; external libraylib;
function Vector2Max(v1: TVector2; v2: TVector2): TVector2; cdecl; external libraylib;
function Vector2Rotate(v: TVector2; angle: single): TVector2; cdecl; external libraylib;
function Vector2MoveTowards(v: TVector2; target: TVector2; maxDistance: single): TVector2; cdecl; external libraylib;
function Vector2Invert(v: TVector2): TVector2; cdecl; external libraylib;
function Vector2Clamp(v: TVector2; min: TVector2; max: TVector2): TVector2; cdecl; external libraylib;
function Vector2ClampValue(v: TVector2; min: single; max: single): TVector2; cdecl; external libraylib;
function Vector2Equals(p: TVector2; q: TVector2): longint; cdecl; external libraylib;
function Vector2Refract(v: TVector2; n: TVector2; r: single): TVector2; cdecl; external libraylib;
function Vector3Zero: TVector3; cdecl; external libraylib;
function Vector3One: TVector3; cdecl; external libraylib;
function Vector3Add(v1: TVector3; v2: TVector3): TVector3; cdecl; external libraylib;
function Vector3AddValue(v: TVector3; add: single): TVector3; cdecl; external libraylib;
function Vector3Subtract(v1: TVector3; v2: TVector3): TVector3; cdecl; external libraylib;
function Vector3SubtractValue(v: TVector3; sub: single): TVector3; cdecl; external libraylib;
function Vector3Scale(v: TVector3; scalar: single): TVector3; cdecl; external libraylib;
function Vector3Multiply(v1: TVector3; v2: TVector3): TVector3; cdecl; external libraylib;
function Vector3CrossProduct(v1: TVector3; v2: TVector3): TVector3; cdecl; external libraylib;
function Vector3Perpendicular(v: TVector3): TVector3; cdecl; external libraylib;
function Vector3Length(v: TVector3): single; cdecl; external libraylib;
function Vector3LengthSqr(v: TVector3): single; cdecl; external libraylib;
function Vector3DotProduct(v1: TVector3; v2: TVector3): single; cdecl; external libraylib;
function Vector3Distance(v1: TVector3; v2: TVector3): single; cdecl; external libraylib;
function Vector3DistanceSqr(v1: TVector3; v2: TVector3): single; cdecl; external libraylib;
function Vector3Angle(v1: TVector3; v2: TVector3): single; cdecl; external libraylib;
function Vector3Negate(v: TVector3): TVector3; cdecl; external libraylib;
function Vector3Divide(v1: TVector3; v2: TVector3): TVector3; cdecl; external libraylib;
function Vector3Normalize(v: TVector3): TVector3; cdecl; external libraylib;
function Vector3Project(v1: TVector3; v2: TVector3): TVector3; cdecl; external libraylib;
function Vector3Reject(v1: TVector3; v2: TVector3): TVector3; cdecl; external libraylib;
procedure Vector3OrthoNormalize(v1: PVector3; v2: PVector3); cdecl; external libraylib;
function Vector3Transform(v: TVector3; mat: TMatrix): TVector3; cdecl; external libraylib;
function Vector3RotateByQuaternion(v: TVector3; q: TQuaternion): TVector3; cdecl; external libraylib;
function Vector3RotateByAxisAngle(v: TVector3; axis: TVector3; angle: single): TVector3; cdecl; external libraylib;
function Vector3MoveTowards(v: TVector3; target: TVector3; maxDistance: single): TVector3; cdecl; external libraylib;
function Vector3Lerp(v1: TVector3; v2: TVector3; amount: single): TVector3; cdecl; external libraylib;
function Vector3CubicHermite(v1: TVector3; tangent1: TVector3; v2: TVector3; tangent2: TVector3; amount: single): TVector3; cdecl; external libraylib;
function Vector3Reflect(v: TVector3; normal: TVector3): TVector3; cdecl; external libraylib;
function Vector3Min(v1: TVector3; v2: TVector3): TVector3; cdecl; external libraylib;
function Vector3Max(v1: TVector3; v2: TVector3): TVector3; cdecl; external libraylib;
function Vector3Barycenter(p: TVector3; a: TVector3; b: TVector3; c: TVector3): TVector3; cdecl; external libraylib;
function Vector3Unproject(source: TVector3; projection: TMatrix; view: TMatrix): TVector3; cdecl; external libraylib;
function Vector3ToFloatV(v: TVector3): Tfloat3; cdecl; external libraylib;
function Vector3Invert(v: TVector3): TVector3; cdecl; external libraylib;
function Vector3Clamp(v: TVector3; min: TVector3; max: TVector3): TVector3; cdecl; external libraylib;
function Vector3ClampValue(v: TVector3; min: single; max: single): TVector3; cdecl; external libraylib;
function Vector3Equals(p: TVector3; q: TVector3): longint; cdecl; external libraylib;
function Vector3Refract(v: TVector3; n: TVector3; r: single): TVector3; cdecl; external libraylib;
function Vector4Zero: TVector4; cdecl; external libraylib;
function Vector4One: TVector4; cdecl; external libraylib;
function Vector4Add(v1: TVector4; v2: TVector4): TVector4; cdecl; external libraylib;
function Vector4AddValue(v: TVector4; add: single): TVector4; cdecl; external libraylib;
function Vector4Subtract(v1: TVector4; v2: TVector4): TVector4; cdecl; external libraylib;
function Vector4SubtractValue(v: TVector4; add: single): TVector4; cdecl; external libraylib;
function Vector4Length(v: TVector4): single; cdecl; external libraylib;
function Vector4LengthSqr(v: TVector4): single; cdecl; external libraylib;
function Vector4DotProduct(v1: TVector4; v2: TVector4): single; cdecl; external libraylib;
function Vector4Distance(v1: TVector4; v2: TVector4): single; cdecl; external libraylib;
function Vector4DistanceSqr(v1: TVector4; v2: TVector4): single; cdecl; external libraylib;
function Vector4Scale(v: TVector4; scale: single): TVector4; cdecl; external libraylib;
function Vector4Multiply(v1: TVector4; v2: TVector4): TVector4; cdecl; external libraylib;
function Vector4Negate(v: TVector4): TVector4; cdecl; external libraylib;
function Vector4Divide(v1: TVector4; v2: TVector4): TVector4; cdecl; external libraylib;
function Vector4Normalize(v: TVector4): TVector4; cdecl; external libraylib;
function Vector4Min(v1: TVector4; v2: TVector4): TVector4; cdecl; external libraylib;
function Vector4Max(v1: TVector4; v2: TVector4): TVector4; cdecl; external libraylib;
function Vector4Lerp(v1: TVector4; v2: TVector4; amount: single): TVector4; cdecl; external libraylib;
function Vector4MoveTowards(v: TVector4; target: TVector4; maxDistance: single): TVector4; cdecl; external libraylib;
function Vector4Invert(v: TVector4): TVector4; cdecl; external libraylib;
function Vector4Equals(p: TVector4; q: TVector4): longint; cdecl; external libraylib;
function MatrixDeterminant(mat: TMatrix): single; cdecl; external libraylib;
function MatrixTrace(mat: TMatrix): single; cdecl; external libraylib;
function MatrixTranspose(mat: TMatrix): TMatrix; cdecl; external libraylib;
function MatrixInvert(mat: TMatrix): TMatrix; cdecl; external libraylib;
function MatrixIdentity: TMatrix; cdecl; external libraylib;
function MatrixAdd(left: TMatrix; right: TMatrix): TMatrix; cdecl; external libraylib;
function MatrixSubtract(left: TMatrix; right: TMatrix): TMatrix; cdecl; external libraylib;
function MatrixMultiply(left: TMatrix; right: TMatrix): TMatrix; cdecl; external libraylib;
function MatrixTranslate(x: single; y: single; z: single): TMatrix; cdecl; external libraylib;
function MatrixRotate(axis: TVector3; angle: single): TMatrix; cdecl; external libraylib;
function MatrixRotateX(angle: single): TMatrix; cdecl; external libraylib;
function MatrixRotateY(angle: single): TMatrix; cdecl; external libraylib;
function MatrixRotateZ(angle: single): TMatrix; cdecl; external libraylib;
function MatrixRotateXYZ(angle: TVector3): TMatrix; cdecl; external libraylib;
function MatrixRotateZYX(angle: TVector3): TMatrix; cdecl; external libraylib;
function MatrixScale(x: single; y: single; z: single): TMatrix; cdecl; external libraylib;
function MatrixFrustum(left: double; right: double; bottom: double; top: double; nearPlane: double;
  farPlane: double): TMatrix; cdecl; external libraylib;
function MatrixPerspective(fovY: double; aspect: double; nearPlane: double; farPlane: double): TMatrix; cdecl; external libraylib;
function MatrixOrtho(left: double; right: double; bottom: double; top: double; nearPlane: double;
  farPlane: double): TMatrix; cdecl; external libraylib;
function MatrixLookAt(eye: TVector3; target: TVector3; up: TVector3): TMatrix; cdecl; external libraylib;
function MatrixToFloatV(mat: TMatrix): Tfloat16; cdecl; external libraylib;
function QuaternionAdd(q1: TQuaternion; q2: TQuaternion): TQuaternion; cdecl; external libraylib;
function QuaternionAddValue(q: TQuaternion; add: single): TQuaternion; cdecl; external libraylib;
function QuaternionSubtract(q1: TQuaternion; q2: TQuaternion): TQuaternion; cdecl; external libraylib;
function QuaternionSubtractValue(q: TQuaternion; sub: single): TQuaternion; cdecl; external libraylib;
function QuaternionIdentity: TQuaternion; cdecl; external libraylib;
function QuaternionLength(q: TQuaternion): single; cdecl; external libraylib;
function QuaternionNormalize(q: TQuaternion): TQuaternion; cdecl; external libraylib;
function QuaternionInvert(q: TQuaternion): TQuaternion; cdecl; external libraylib;
function QuaternionMultiply(q1: TQuaternion; q2: TQuaternion): TQuaternion; cdecl; external libraylib;
function QuaternionScale(q: TQuaternion; mul: single): TQuaternion; cdecl; external libraylib;
function QuaternionDivide(q1: TQuaternion; q2: TQuaternion): TQuaternion; cdecl; external libraylib;
function QuaternionLerp(q1: TQuaternion; q2: TQuaternion; amount: single): TQuaternion; cdecl; external libraylib;
function QuaternionNlerp(q1: TQuaternion; q2: TQuaternion; amount: single): TQuaternion; cdecl; external libraylib;
function QuaternionSlerp(q1: TQuaternion; q2: TQuaternion; amount: single): TQuaternion; cdecl; external libraylib;
function QuaternionCubicHermiteSpline(q1: TQuaternion; outTangent1: TQuaternion; q2: TQuaternion; inTangent2: TQuaternion; t: single): TQuaternion; cdecl; external libraylib;
function QuaternionFromVector3ToVector3(from: TVector3; to_: TVector3): TQuaternion; cdecl; external libraylib;
function QuaternionFromMatrix(mat: TMatrix): TQuaternion; cdecl; external libraylib;
function QuaternionToMatrix(q: TQuaternion): TMatrix; cdecl; external libraylib;
function QuaternionFromAxisAngle(axis: TVector3; angle: single): TQuaternion; cdecl; external libraylib;
procedure QuaternionToAxisAngle(q: TQuaternion; outAxis: PVector3; outAngle: Psingle); cdecl; external libraylib;
function QuaternionFromEuler(pitch: single; yaw: single; roll: single): TQuaternion; cdecl; external libraylib;
function QuaternionToEuler(q: TQuaternion): TVector3; cdecl; external libraylib;
function QuaternionTransform(q: TQuaternion; mat: TMatrix): TQuaternion; cdecl; external libraylib;
function QuaternionEquals(p: TQuaternion; q: TQuaternion): longint; cdecl; external libraylib;
function MatrixCompose(translation: TVector3; rotation: TQuaternion; scale: TVector3): TMatrix; cdecl; external libraylib;
procedure MatrixDecompose(mat: TMatrix; translation: PVector3; rotation: PQuaternion; scale: PVector3); cdecl; external libraylib;

// === Konventiert am: 11-2-26 14:17:51 ===


implementation



end.
