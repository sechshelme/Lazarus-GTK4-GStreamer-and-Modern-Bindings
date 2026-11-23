unit scene;

interface

uses
  fp_assimp, types, matrix4x4, metadata, mesh, texture, light, material, anim, camera;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PaiNode = ^TaiNode;
  TaiNode = record
    mName: TaiString;
    mTransformation: TaiMatrix4x4;
    mParent: PaiNode;
    mNumChildren: dword;
    mChildren: ^PaiNode;
    mNumMeshes: dword;
    mMeshes: Pdword;
    mMetaData: PaiMetadata;
  end;

const
  AI_SCENE_FLAGS_INCOMPLETE = $1;
  AI_SCENE_FLAGS_VALIDATED = $2;
  AI_SCENE_FLAGS_VALIDATION_WARNING = $4;
  AI_SCENE_FLAGS_NON_VERBOSE_FORMAT = $8;
  AI_SCENE_FLAGS_TERRAIN = $10;
  AI_SCENE_FLAGS_ALLOW_SHARED = $20;

type
  PaiScene = ^TaiScene;
  TaiScene = record
    mFlags: dword;
    mRootNode: PaiNode;
    mNumMeshes: dword;
    mMeshes: ^PaiMesh;
    mNumMaterials: dword;
    mMaterials: ^PaiMaterial;
    mNumAnimations: dword;
    mAnimations: ^PaiAnimation;
    mNumTextures: dword;
    mTextures: ^PaiTexture;
    mNumLights: dword;
    mLights: ^PaiLight;
    mNumCameras: dword;
    mCameras: ^PaiCamera;
    mMetaData: PaiMetadata;
    mName: TaiString;
    mNumSkeletons: dword;
    mSkeletons: ^PaiSkeleton;
    mPrivate: Pchar;
  end;


  // === Konventiert am: 22-11-26 17:34:19 ===


implementation



end.
