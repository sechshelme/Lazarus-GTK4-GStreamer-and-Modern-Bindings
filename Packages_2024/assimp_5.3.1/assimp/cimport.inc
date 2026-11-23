{$IFDEF read_interface}


type
  TaiLogStreamCallback = procedure(para1: Pchar; para2: Pchar); cdecl;

  PaiLogStream = ^TaiLogStream;
  TaiLogStream = record
    callback: TaiLogStreamCallback;
    user: Pchar;
  end;

  PaiPropertyStore = ^TaiPropertyStore;
  TaiPropertyStore = record
    sentinel: char;
  end;

  PaiBool = ^TaiBool;
  TaiBool = Boolean32;

const
  AI_FALSE = 0;
  AI_TRUE = 1;

function aiImportFile(pFile: Pchar; pFlags: dword): PaiScene; cdecl; external libassimp;
function aiImportFileEx(pFile: Pchar; pFlags: dword; pFS: PaiFileIO): PaiScene; cdecl; external libassimp;
function aiImportFileExWithProperties(pFile: Pchar; pFlags: dword; pFS: PaiFileIO; pProps: PaiPropertyStore): PaiScene; cdecl; external libassimp;
function aiImportFileFromMemory(pBuffer: Pchar; pLength: dword; pFlags: dword; pHint: Pchar): PaiScene; cdecl; external libassimp;
function aiImportFileFromMemoryWithProperties(pBuffer: Pchar; pLength: dword; pFlags: dword; pHint: Pchar; pProps: PaiPropertyStore): PaiScene; cdecl; external libassimp;
function aiApplyPostProcessing(pScene: PaiScene; pFlags: dword): PaiScene; cdecl; external libassimp;
function aiGetPredefinedLogStream(pStreams: TaiDefaultLogStream; file_: Pchar): TaiLogStream; cdecl; external libassimp;
procedure aiAttachLogStream(stream: PaiLogStream); cdecl; external libassimp;
procedure aiEnableVerboseLogging(d: TaiBool); cdecl; external libassimp;
function aiDetachLogStream(stream: PaiLogStream): TaiReturn; cdecl; external libassimp;
procedure aiDetachAllLogStreams; cdecl; external libassimp;
procedure aiReleaseImport(pScene: PaiScene); cdecl; external libassimp;
function aiGetErrorString: Pchar; cdecl; external libassimp;
function aiIsExtensionSupported(szExtension: Pchar): TaiBool; cdecl; external libassimp;
procedure aiGetExtensionList(szOut: PaiString); cdecl; external libassimp;
procedure aiGetMemoryRequirements(pIn: PaiScene; in_: PaiMemoryInfo); cdecl; external libassimp;
function aiCreatePropertyStore: PaiPropertyStore; cdecl; external libassimp;
procedure aiReleasePropertyStore(p: PaiPropertyStore); cdecl; external libassimp;
procedure aiSetImportPropertyInteger(store: PaiPropertyStore; szName: Pchar; value: longint); cdecl; external libassimp;
procedure aiSetImportPropertyFloat(store: PaiPropertyStore; szName: Pchar; value: Tai_real); cdecl; external libassimp;
procedure aiSetImportPropertyString(store: PaiPropertyStore; szName: Pchar; st: PaiString); cdecl; external libassimp;
procedure aiSetImportPropertyMatrix(store: PaiPropertyStore; szName: Pchar; mat: PaiMatrix4x4); cdecl; external libassimp;
procedure aiCreateQuaternionFromMatrix(quat: PaiQuaternion; mat: PaiMatrix3x3); cdecl; external libassimp;
procedure aiDecomposeMatrix(mat: PaiMatrix4x4; scaling: PaiVector3D; rotation: PaiQuaternion; position: PaiVector3D); cdecl; external libassimp;
procedure aiTransposeMatrix4(mat: PaiMatrix4x4); cdecl; external libassimp;
procedure aiTransposeMatrix3(mat: PaiMatrix3x3); cdecl; external libassimp;
procedure aiTransformVecByMatrix3(vec: PaiVector3D; mat: PaiMatrix3x3); cdecl; external libassimp;
procedure aiTransformVecByMatrix4(vec: PaiVector3D; mat: PaiMatrix4x4); cdecl; external libassimp;
procedure aiMultiplyMatrix4(dst: PaiMatrix4x4; src: PaiMatrix4x4); cdecl; external libassimp;
procedure aiMultiplyMatrix3(dst: PaiMatrix3x3; src: PaiMatrix3x3); cdecl; external libassimp;
procedure aiIdentityMatrix3(mat: PaiMatrix3x3); cdecl; external libassimp;
procedure aiIdentityMatrix4(mat: PaiMatrix4x4); cdecl; external libassimp;
function aiGetImportFormatCount: Tsize_t; cdecl; external libassimp;
function aiGetImportFormatDescription(pIndex: Tsize_t): PaiImporterDesc; cdecl; external libassimp;
function aiVector2AreEqual(a: PaiVector2D; b: PaiVector2D): longint; cdecl; external libassimp;
function aiVector2AreEqualEpsilon(a: PaiVector2D; b: PaiVector2D; epsilon: single): longint; cdecl; external libassimp;
procedure aiVector2Add(dst: PaiVector2D; src: PaiVector2D); cdecl; external libassimp;
procedure aiVector2Subtract(dst: PaiVector2D; src: PaiVector2D); cdecl; external libassimp;
procedure aiVector2Scale(dst: PaiVector2D; s: single); cdecl; external libassimp;
procedure aiVector2SymMul(dst: PaiVector2D; other: PaiVector2D); cdecl; external libassimp;
procedure aiVector2DivideByScalar(dst: PaiVector2D; s: single); cdecl; external libassimp;
procedure aiVector2DivideByVector(dst: PaiVector2D; v: PaiVector2D); cdecl; external libassimp;
function aiVector2Length(v: PaiVector2D): single; cdecl; external libassimp;
function aiVector2SquareLength(v: PaiVector2D): single; cdecl; external libassimp;
procedure aiVector2Negate(dst: PaiVector2D); cdecl; external libassimp;
function aiVector2DotProduct(a: PaiVector2D; b: PaiVector2D): single; cdecl; external libassimp;
procedure aiVector2Normalize(v: PaiVector2D); cdecl; external libassimp;
function aiVector3AreEqual(a: PaiVector3D; b: PaiVector3D): longint; cdecl; external libassimp;
function aiVector3AreEqualEpsilon(a: PaiVector3D; b: PaiVector3D; epsilon: single): longint; cdecl; external libassimp;
function aiVector3LessThan(a: PaiVector3D; b: PaiVector3D): longint; cdecl; external libassimp;
procedure aiVector3Add(dst: PaiVector3D; src: PaiVector3D); cdecl; external libassimp;
procedure aiVector3Subtract(dst: PaiVector3D; src: PaiVector3D); cdecl; external libassimp;
procedure aiVector3Scale(dst: PaiVector3D; s: single); cdecl; external libassimp;
procedure aiVector3SymMul(dst: PaiVector3D; other: PaiVector3D); cdecl; external libassimp;
procedure aiVector3DivideByScalar(dst: PaiVector3D; s: single); cdecl; external libassimp;
procedure aiVector3DivideByVector(dst: PaiVector3D; v: PaiVector3D); cdecl; external libassimp;
function aiVector3Length(v: PaiVector3D): single; cdecl; external libassimp;
function aiVector3SquareLength(v: PaiVector3D): single; cdecl; external libassimp;
procedure aiVector3Negate(dst: PaiVector3D); cdecl; external libassimp;
function aiVector3DotProduct(a: PaiVector3D; b: PaiVector3D): single; cdecl; external libassimp;
procedure aiVector3CrossProduct(dst: PaiVector3D; a: PaiVector3D; b: PaiVector3D); cdecl; external libassimp;
procedure aiVector3Normalize(v: PaiVector3D); cdecl; external libassimp;
procedure aiVector3NormalizeSafe(v: PaiVector3D); cdecl; external libassimp;
procedure aiVector3RotateByQuaternion(v: PaiVector3D; q: PaiQuaternion); cdecl; external libassimp;
procedure aiMatrix3FromMatrix4(dst: PaiMatrix3x3; mat: PaiMatrix4x4); cdecl; external libassimp;
procedure aiMatrix3FromQuaternion(mat: PaiMatrix3x3; q: PaiQuaternion); cdecl; external libassimp;
function aiMatrix3AreEqual(a: PaiMatrix3x3; b: PaiMatrix3x3): longint; cdecl; external libassimp;
function aiMatrix3AreEqualEpsilon(a: PaiMatrix3x3; b: PaiMatrix3x3; epsilon: single): longint; cdecl; external libassimp;
procedure aiMatrix3Inverse(mat: PaiMatrix3x3); cdecl; external libassimp;
function aiMatrix3Determinant(mat: PaiMatrix3x3): single; cdecl; external libassimp;
procedure aiMatrix3RotationZ(mat: PaiMatrix3x3; angle: single); cdecl; external libassimp;
procedure aiMatrix3FromRotationAroundAxis(mat: PaiMatrix3x3; axis: PaiVector3D; angle: single); cdecl; external libassimp;
procedure aiMatrix3Translation(mat: PaiMatrix3x3; translation: PaiVector2D); cdecl; external libassimp;
procedure aiMatrix3FromTo(mat: PaiMatrix3x3; from: PaiVector3D; to_: PaiVector3D); cdecl; external libassimp;
procedure aiMatrix4FromMatrix3(dst: PaiMatrix4x4; mat: PaiMatrix3x3); cdecl; external libassimp;
procedure aiMatrix4FromScalingQuaternionPosition(mat: PaiMatrix4x4; scaling: PaiVector3D; rotation: PaiQuaternion; position: PaiVector3D); cdecl; external libassimp;
procedure aiMatrix4Add(dst: PaiMatrix4x4; src: PaiMatrix4x4); cdecl; external libassimp;
function aiMatrix4AreEqual(a: PaiMatrix4x4; b: PaiMatrix4x4): longint; cdecl; external libassimp;
function aiMatrix4AreEqualEpsilon(a: PaiMatrix4x4; b: PaiMatrix4x4; epsilon: single): longint; cdecl; external libassimp;
procedure aiMatrix4Inverse(mat: PaiMatrix4x4); cdecl; external libassimp;
function aiMatrix4Determinant(mat: PaiMatrix4x4): single; cdecl; external libassimp;
function aiMatrix4IsIdentity(mat: PaiMatrix4x4): longint; cdecl; external libassimp;
procedure aiMatrix4DecomposeIntoScalingEulerAnglesPosition(mat: PaiMatrix4x4; scaling: PaiVector3D; rotation: PaiVector3D; position: PaiVector3D); cdecl; external libassimp;
procedure aiMatrix4DecomposeIntoScalingAxisAnglePosition(mat: PaiMatrix4x4; scaling: PaiVector3D; axis: PaiVector3D; angle: Pai_real; position: PaiVector3D); cdecl; external libassimp;
procedure aiMatrix4DecomposeNoScaling(mat: PaiMatrix4x4; rotation: PaiQuaternion; position: PaiVector3D); cdecl; external libassimp;
procedure aiMatrix4FromEulerAngles(mat: PaiMatrix4x4; x: single; y: single; z: single); cdecl; external libassimp;
procedure aiMatrix4RotationX(mat: PaiMatrix4x4; angle: single); cdecl; external libassimp;
procedure aiMatrix4RotationY(mat: PaiMatrix4x4; angle: single); cdecl; external libassimp;
procedure aiMatrix4RotationZ(mat: PaiMatrix4x4; angle: single); cdecl; external libassimp;
procedure aiMatrix4FromRotationAroundAxis(mat: PaiMatrix4x4; axis: PaiVector3D; angle: single); cdecl; external libassimp;
procedure aiMatrix4Translation(mat: PaiMatrix4x4; translation: PaiVector3D); cdecl; external libassimp;
procedure aiMatrix4Scaling(mat: PaiMatrix4x4; scaling: PaiVector3D); cdecl; external libassimp;
procedure aiMatrix4FromTo(mat: PaiMatrix4x4; from: PaiVector3D; to_: PaiVector3D); cdecl; external libassimp;
procedure aiQuaternionFromEulerAngles(q: PaiQuaternion; x: single; y: single; z: single); cdecl; external libassimp;
procedure aiQuaternionFromAxisAngle(q: PaiQuaternion; axis: PaiVector3D; angle: single); cdecl; external libassimp;
procedure aiQuaternionFromNormalizedQuaternion(q: PaiQuaternion; normalized: PaiVector3D); cdecl; external libassimp;
function aiQuaternionAreEqual(a: PaiQuaternion; b: PaiQuaternion): longint; cdecl; external libassimp;
function aiQuaternionAreEqualEpsilon(a: PaiQuaternion; b: PaiQuaternion; epsilon: single): longint; cdecl; external libassimp;
procedure aiQuaternionNormalize(q: PaiQuaternion); cdecl; external libassimp;
procedure aiQuaternionConjugate(q: PaiQuaternion); cdecl; external libassimp;
procedure aiQuaternionMultiply(dst: PaiQuaternion; q: PaiQuaternion); cdecl; external libassimp;
procedure aiQuaternionInterpolate(dst: PaiQuaternion; start: PaiQuaternion; end_: PaiQuaternion; factor: single); cdecl; external libassimp;

// === Konventiert am: 22-11-26 17:09:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
