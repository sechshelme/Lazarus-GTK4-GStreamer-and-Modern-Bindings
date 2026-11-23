unit material;

interface

uses
  fp_assimp, vector2, defs, types, color4, texture;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PaiTextureOp = ^TaiTextureOp;
  TaiTextureOp = longint;
const
  aiTextureOp_Multiply = $0;
  aiTextureOp_Add = $1;
  aiTextureOp_Subtract = $2;
  aiTextureOp_Divide = $3;
  aiTextureOp_SmoothAdd = $4;
  aiTextureOp_SignedAdd = $5;
  _aiTextureOp_Force32Bit = MaxInt;

type
  TaiTextureMapMode = longint;
  PaiTextureMapMode = ^TaiTextureMapMode;
const
  aiTextureMapMode_Wrap = $0;
  aiTextureMapMode_Clamp = $1;
  aiTextureMapMode_Decal = $3;
  aiTextureMapMode_Mirror = $2;
  _aiTextureMapMode_Force32Bit = MaxInt;

type
  TaiTextureMapping = longint;
  PaiTextureMapping = ^TaiTextureMapping;
const
  aiTextureMapping_UV = $0;
  aiTextureMapping_SPHERE = $1;
  aiTextureMapping_CYLINDER = $2;
  aiTextureMapping_BOX = $3;
  aiTextureMapping_PLANE = $4;
  aiTextureMapping_OTHER = $5;
  _aiTextureMapping_Force32Bit = MaxInt;

type
  TaiTextureType = longint;
const
  aiTextureType_NONE = 0;
  aiTextureType_DIFFUSE = 1;
  aiTextureType_SPECULAR = 2;
  aiTextureType_AMBIENT = 3;
  aiTextureType_EMISSIVE = 4;
  aiTextureType_HEIGHT = 5;
  aiTextureType_NORMALS = 6;
  aiTextureType_SHININESS = 7;
  aiTextureType_OPACITY = 8;
  aiTextureType_DISPLACEMENT = 9;
  aiTextureType_LIGHTMAP = 10;
  aiTextureType_REFLECTION = 11;
  aiTextureType_BASE_COLOR = 12;
  aiTextureType_NORMAL_CAMERA = 13;
  aiTextureType_EMISSION_COLOR = 14;
  aiTextureType_METALNESS = 15;
  aiTextureType_DIFFUSE_ROUGHNESS = 16;
  aiTextureType_AMBIENT_OCCLUSION = 17;
  aiTextureType_SHEEN = 19;
  aiTextureType_CLEARCOAT = 20;
  aiTextureType_TRANSMISSION = 21;
  aiTextureType_UNKNOWN = 18;
  _aiTextureType_Force32Bit = MaxInt;

  AI_TEXTURE_TYPE_MAX = aiTextureType_TRANSMISSION;

function aiTextureTypeToString(in_: TaiTextureType): Pchar; cdecl; external libassimp;

type
  TaiShadingMode = longint;
const
  aiShadingMode_Flat = $1;
  aiShadingMode_Gouraud = $2;
  aiShadingMode_Phong = $3;
  aiShadingMode_Blinn = $4;
  aiShadingMode_Toon = $5;
  aiShadingMode_OrenNayar = $6;
  aiShadingMode_Minnaert = $7;
  aiShadingMode_CookTorrance = $8;
  aiShadingMode_NoShading = $9;
  aiShadingMode_Unlit = aiShadingMode_NoShading;
  aiShadingMode_Fresnel = $a;
  aiShadingMode_PBR_BRDF = $b;
  _aiShadingMode_Force32Bit = MaxInt;

type
  TaiTextureFlags = longint;
const
  aiTextureFlags_Invert = $1;
  aiTextureFlags_UseAlpha = $2;
  aiTextureFlags_IgnoreAlpha = $4;
  _aiTextureFlags_Force32Bit = MaxInt;

type
  TaiBlendMode = longint;
const
  aiBlendMode_Default = $0;
  aiBlendMode_Additive = $1;
  _aiBlendMode_Force32Bit = MaxInt;

type
  PaiUVTransform = ^TaiUVTransform;
  TaiUVTransform = record
    mTranslation: TaiVector2D;
    mScaling: TaiVector2D;
    mRotation: Tai_real;
  end;

type
  TaiPropertyTypeInfo = longint;
const
  aiPTI_Float = $1;
  aiPTI_Double = $2;
  aiPTI_String = $3;
  aiPTI_Integer = $4;
  aiPTI_Buffer = $5;
  _aiPTI_Force32Bit = MaxInt;

type
  PPaiMaterialProperty = ^PaiMaterialProperty;
  PaiMaterialProperty = ^TaiMaterialProperty;
  TaiMaterialProperty = record
    mKey: TaiString;
    mSemantic: dword;
    mIndex: dword;
    mDataLength: dword;
    mType: TaiPropertyTypeInfo;
    mData: Pchar;
  end;

  PaiMaterial = ^TaiMaterial;
  TaiMaterial = record
    mProperties: ^PaiMaterialProperty;
    mNumProperties: dword;
    mNumAllocated: dword;
  end;

const
  _AI_MATKEY_TEXTURE_BASE = '$tex.file';
  _AI_MATKEY_UVWSRC_BASE = '$tex.uvwsrc';
  _AI_MATKEY_TEXOP_BASE = '$tex.op';
  _AI_MATKEY_MAPPING_BASE = '$tex.mapping';
  _AI_MATKEY_TEXBLEND_BASE = '$tex.blend';
  _AI_MATKEY_MAPPINGMODE_U_BASE = '$tex.mapmodeu';
  _AI_MATKEY_MAPPINGMODE_V_BASE = '$tex.mapmodev';
  _AI_MATKEY_TEXMAP_AXIS_BASE = '$tex.mapaxis';
  _AI_MATKEY_UVTRANSFORM_BASE = '$tex.uvtrafo';
  _AI_MATKEY_TEXFLAGS_BASE = '$tex.flags';

function aiGetMaterialProperty(pMat: PaiMaterial; pKey: Pchar; _type: dword; index: dword; pPropOut: PPaiMaterialProperty): TaiReturn; cdecl; external libassimp;
function aiGetMaterialFloatArray(pMat: PaiMaterial; pKey: Pchar; _type: dword; index: dword; pOut: Pai_real; pMax: Pdword): TaiReturn; cdecl; external libassimp;
function aiGetMaterialIntegerArray(pMat: PaiMaterial; pKey: Pchar; _type: dword; index: dword; pOut: Plongint; pMax: Pdword): TaiReturn; cdecl; external libassimp;
function aiGetMaterialColor(pMat: PaiMaterial; pKey: Pchar; _type: dword; index: dword; pOut: PaiColor4D): TaiReturn; cdecl; external libassimp;
function aiGetMaterialUVTransform(pMat: PaiMaterial; pKey: Pchar; _type: dword; index: dword; pOut: PaiUVTransform): TaiReturn; cdecl; external libassimp;
function aiGetMaterialString(pMat: PaiMaterial; pKey: Pchar; _type: dword; index: dword; pOut: PaiString): TaiReturn; cdecl; external libassimp;
function aiGetMaterialTextureCount(pMat: PaiMaterial; _type: TaiTextureType): dword; cdecl; external libassimp;
function aiGetMaterialTexture(mat: PaiMaterial; _type: TaiTextureType; index: dword; path: PaiString; mapping: PaiTextureMapping;
  uvindex: Pdword; blend: Pai_real; op: PaiTextureOp; mapmode: PaiTextureMapMode; flags: Pdword): TaiReturn; cdecl; external libassimp;

function aiGetMaterialFloat(pMat: PaiMaterial; pKey: Pchar; _type: dword; index: dword; pOut: Pai_real): TaiReturn; inline;
function aiGetMaterialInteger(pMat: PaiMaterial; pKey: Pchar; _type: dword; index: dword; pOut: Plongint): TaiReturn; inline;

// === Konventiert am: 22-11-26 17:30:25 ===


implementation

function aiGetMaterialFloat(pMat: PaiMaterial; pKey: Pchar; _type: dword; index: dword; pOut: Pai_real): TaiReturn; inline;
begin
  Result := aiGetMaterialFloatArray(pMat, pKey, _type, index, pOut, nil);
end;

function aiGetMaterialInteger(pMat: PaiMaterial; pKey: Pchar; _type: dword; index: dword; pOut: Plongint): TaiReturn; inline;
begin
  Result := aiGetMaterialIntegerArray(pMat, pKey, _type, index, pOut, nil);
end;


end.
