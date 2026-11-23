{$IFDEF read_interface}


const
  AI_MAX_FACE_INDICES = $7fff;
  AI_MAX_BONE_WEIGHTS = $7fffffff;
  AI_MAX_VERTICES = $7fffffff;
  AI_MAX_FACES = $7fffffff;
  AI_MAX_NUMBER_OF_COLOR_SETS = $8;

const
  AI_MAX_NUMBER_OF_TEXTURECOORDS = $8;

type
  PaiFace = ^TaiFace;
  TaiFace = record
    mNumIndices: dword;
    mIndices: Pdword;
  end;

  PaiVertexWeight = ^TaiVertexWeight;
  TaiVertexWeight = record
    mVertexId: dword;
    mWeight: Tai_real;
  end;

type
  PaiBone = ^TaiBone;
  TaiBone = record
    mName: TaiString;
    mNumWeights: dword;
    mArmature: PaiNode;
    mNode: PaiNode;
    mWeights: PaiVertexWeight;
    mOffsetMatrix: TaiMatrix4x4;
  end;

type
  TaiPrimitiveType = longint;
const
  aiPrimitiveType_POINT = $1;
  aiPrimitiveType_LINE = $2;
  aiPrimitiveType_TRIANGLE = $4;
  aiPrimitiveType_POLYGON = $8;
  aiPrimitiveType_NGONEncodingFlag = $10;
  _aiPrimitiveType_Force32Bit = MaxInt;

function AI_PRIMITIVE_TYPE_FOR_N_INDICES(n: cardinal): TaiPrimitiveType; inline;

type
  PaiAnimMesh = ^TaiAnimMesh;
  TaiAnimMesh = record
    mName: TaiString;
    mVertices: PaiVector3D;
    mNormals: PaiVector3D;
    mTangents: PaiVector3D;
    mBitangents: PaiVector3D;
    mColors: array[0..(AI_MAX_NUMBER_OF_COLOR_SETS) - 1] of PaiColor4D;
    mTextureCoords: array[0..(AI_MAX_NUMBER_OF_TEXTURECOORDS) - 1] of PaiVector3D;
    mNumVertices: dword;
    mWeight: single;
  end;

type
  TaiMorphingMethod = longint;
const
  aiMorphingMethod_UNKNOWN = $0;
  aiMorphingMethod_VERTEX_BLEND = $1;
  aiMorphingMethod_MORPH_NORMALIZED = $2;
  aiMorphingMethod_MORPH_RELATIVE = $3;
  _aiMorphingMethod_Force32Bit = MaxInt;

type
  PaiMesh = ^TaiMesh;
  TaiMesh = record
    mPrimitiveTypes: dword;
    mNumVertices: dword;
    mNumFaces: dword;
    mVertices: PaiVector3D;
    mNormals: PaiVector3D;
    mTangents: PaiVector3D;
    mBitangents: PaiVector3D;
    mColors: array[0..(AI_MAX_NUMBER_OF_COLOR_SETS) - 1] of PaiColor4D;
    mTextureCoords: array[0..(AI_MAX_NUMBER_OF_TEXTURECOORDS) - 1] of PaiVector3D;
    mNumUVComponents: array[0..(AI_MAX_NUMBER_OF_TEXTURECOORDS) - 1] of dword;
    mFaces: PaiFace;
    mNumBones: dword;
    mBones: ^PaiBone;
    mMaterialIndex: dword;
    mName: TaiString;
    mNumAnimMeshes: dword;
    mAnimMeshes: ^PaiAnimMesh;
    mMethod: TaiMorphingMethod;
    mAABB: TaiAABB;
    mTextureCoordsNames: ^PaiString;
  end;

type
  PaiSkeletonBone = ^TaiSkeletonBone;
  TaiSkeletonBone = record
    mParent: longint;
    mArmature: PaiNode;
    mNode: PaiNode;
    mNumnWeights: dword;
    mMeshId: PaiMesh;
    mWeights: PaiVertexWeight;
    mOffsetMatrix: TaiMatrix4x4;
    mLocalMatrix: TaiMatrix4x4;
  end;

  PaiSkeleton = ^TaiSkeleton;
  TaiSkeleton = record
    mName: TaiString;
    mNumBones: dword;
    mBones: ^PaiSkeletonBone;
  end;


  // === Konventiert am: 22-11-26 17:30:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function AI_PRIMITIVE_TYPE_FOR_N_INDICES(n: cardinal): TaiPrimitiveType;
begin
  if n > 3 then begin
    Result := aiPrimitiveType_POLYGON;
  end else begin
    Result := TaiPrimitiveType(1 shl (n - 1));
  end;
end;

{$ENDIF read_implementation}
