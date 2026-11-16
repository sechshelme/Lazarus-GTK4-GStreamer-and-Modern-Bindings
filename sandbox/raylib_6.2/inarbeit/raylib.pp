
unit raylib;
interface

{
  Automatically converted by H2Pas 1.0.0 from raylib.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    raylib.h
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
PAudioStream  = ^AudioStream;
PAutomationEvent  = ^AutomationEvent;
PAutomationEventList  = ^AutomationEventList;
PBlendMode  = ^BlendMode;
PBoneInfo  = ^BoneInfo;
PBoundingBox  = ^BoundingBox;
Pbyte  = ^byte;
PCamera  = ^Camera;
PCamera2D  = ^Camera2D;
PCamera3D  = ^Camera3D;
PCameraMode  = ^CameraMode;
PCameraProjection  = ^CameraProjection;
Pchar  = ^char;
PColor  = ^Color;
PConfigFlags  = ^ConfigFlags;
PCubemapLayout  = ^CubemapLayout;
Pdword  = ^dword;
PFilePathList  = ^FilePathList;
PFont  = ^Font;
PFontType  = ^FontType;
PGamepadAxis  = ^GamepadAxis;
PGamepadButton  = ^GamepadButton;
PGesture  = ^Gesture;
PGlyphInfo  = ^GlyphInfo;
PImage  = ^Image;
PKeyboardKey  = ^KeyboardKey;
PLoadFileDataCallback  = ^LoadFileDataCallback;
PLoadFileTextCallback  = ^LoadFileTextCallback;
Plongint  = ^longint;
PMaterial  = ^Material;
PMaterialMap  = ^MaterialMap;
PMaterialMapIndex  = ^MaterialMapIndex;
PMatrix  = ^Matrix;
PMesh  = ^Mesh;
PModel  = ^Model;
PModelAnimation  = ^ModelAnimation;
PModelAnimPose  = ^ModelAnimPose;
PModelSkeleton  = ^ModelSkeleton;
PMouseButton  = ^MouseButton;
PMouseCursor  = ^MouseCursor;
PMusic  = ^Music;
PNPatchInfo  = ^NPatchInfo;
PNPatchLayout  = ^NPatchLayout;
PPixelFormat  = ^PixelFormat;
PQuaternion  = ^Quaternion;
PrAudioBuffer  = ^rAudioBuffer;
PrAudioProcessor  = ^rAudioProcessor;
PRay  = ^Ray;
PRayCollision  = ^RayCollision;
PRectangle  = ^Rectangle;
PRenderTexture  = ^RenderTexture;
PRenderTexture2D  = ^RenderTexture2D;
PShader  = ^Shader;
PShaderAttributeDataType  = ^ShaderAttributeDataType;
PShaderLocationIndex  = ^ShaderLocationIndex;
PShaderUniformDataType  = ^ShaderUniformDataType;
Psingle  = ^single;
PSound  = ^Sound;
PTexture  = ^Texture;
PTexture2D  = ^Texture2D;
PTextureCubemap  = ^TextureCubemap;
PTextureFilter  = ^TextureFilter;
PTextureWrap  = ^TextureWrap;
PTraceLogLevel  = ^TraceLogLevel;
PTransform  = ^Transform;
PVector2  = ^Vector2;
PVector3  = ^Vector3;
PVector4  = ^Vector4;
PVrDeviceInfo  = ^VrDeviceInfo;
PVrStereoConfig  = ^VrStereoConfig;
PWave  = ^Wave;
Pword  = ^word;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*********************************************************************************************
*
*   raylib v6.2 - A simple and easy-to-use library to enjoy videogames programming (www.raylib.com)
*
*   FEATURES:
*       - NO external dependencies, all required libraries included with raylib
*       - Multiplatform: Windows, Linux, macOS, FreeBSD, Web, Android, Raspberry Pi, DRM native...
*       - Written in plain C code (C99) in PascalCase/camelCase notation
*       - Hardware accelerated with OpenGL (1.1, 2.1, 3.3, 4.3, ES2, ES3 - choose at compile)
*       - Software renderer optional, for systems with no GPU: [rlsw]
*       - Custom OpenGL abstraction layer (usable as standalone module): [rlgl]
*       - Multiple Fonts formats supported (TTF, OTF, FNT, BDF, Sprite fonts)
*       - Many texture formats supported, including compressed formats (DXT, ETC, ASTC)
*       - Full 3d support for 3d Shapes, Models, Billboards, Heightmaps and more!
*       - Flexible Materials system, supporting classic maps and PBR maps
*       - Animated 3D models supported (skeletal bones animation) (IQM, M3D, GLTF)
*       - Shaders support, including Model shaders and Postprocessing shaders
*       - Powerful math module for Vector, Matrix and Quaternion operations: [raymath]
*       - Audio loading and playing with streaming support (WAV, OGG, MP3, FLAC, QOA, XM, MOD)
*       - VR stereo rendering with configurable HMD device parameters
*       - Bindings to multiple programming languages available!
*
*   NOTES:
*       - One default Font is loaded on InitWindow()->LoadFontDefault() [core, text]
*       - One default Texture2D is loaded on rlglInit(), 1x1 white pixel R8G8B8A8 [rlgl] (OpenGL 3.3 or ES2)
*       - One default Shader is loaded on rlglInit()->rlLoadShaderDefault() [rlgl] (OpenGL 3.3 or ES2)
*       - One default RenderBatch is loaded on rlglInit()->rlLoadRenderBatch() [rlgl] (OpenGL 3.3 or ES2)
*
*   DEPENDENCIES:
*       [rcore] Depends on the selected platform backend, check rcore.c header for details
*       [rlgl] glad/glad_gles2 (David Herberth - github.com/Dav1dde/glad) for OpenGL extensions loading
*       [raudio] miniaudio (David Reid - github.com/mackron/miniaudio) for audio device/context management
*
*   OPTIONAL DEPENDENCIES (included):
*       [rcore] sinfl (Micha Mettke) for DEFLATE decompression algorithm
*       [rcore] sdefl (Micha Mettke) for DEFLATE compression algorithm
*       [rcore] rprand (Ramon Santamaria) for pseudo-random numbers generation
*       [rtextures] qoi (Dominic Szablewski - https://phoboslab.org) for QOI image management
*       [rtextures] stb_image (Sean Barrett) for images loading (BMP, TGA, PNG, JPEG, HDR...)
*       [rtextures] stb_image_write (Sean Barrett) for image writing (BMP, TGA, PNG, JPG)
*       [rtextures] stb_image_resize2 (Sean Barrett) for image resizing algorithms
*       [rtextures] stb_perlin (Sean Barrett) for Perlin Noise image generation
*       [rtextures] rltexgpu (Ramon Santamaria) for GPU-compressed texture formats
*       [rtext] stb_truetype (Sean Barrett) for ttf fonts loading
*       [rtext] stb_rect_pack (Sean Barrett) for rectangles packing
*       [rmodels] par_shapes (Philip Rideout) for parametric 3d shapes generation
*       [rmodels] tinyobj_loader_c (Syoyo Fujita) for models loading (OBJ, MTL)
*       [rmodels] cgltf (Johannes Kuhlmann) for models loading (glTF)
*       [rmodels] m3d (bzt) for models loading (M3D, https://bztsrc.gitlab.io/model3d)
*       [rmodels] vox_loader (Johann Nadalutti) for models loading (VOX)
*       [raudio] dr_wav (David Reid) for WAV audio file loading
*       [raudio] dr_flac (David Reid) for FLAC audio file loading
*       [raudio] dr_mp3 (David Reid) for MP3 audio file loading
*       [raudio] stb_vorbis (Sean Barrett) for OGG audio loading
*       [raudio] jar_xm (Joshua Reisenauer) for XM audio module loading
*       [raudio] jar_mod (Joshua Reisenauer) for MOD audio module loading
*       [raudio] qoa (Dominic Szablewski - https://phoboslab.org) for QOA audio management
*
*
*   LICENSE: zlib/libpng
*
*   raylib is licensed under an unmodified zlib/libpng license, which is an OSI-certified,
*   BSD-like license that allows static linking with closed source software:
*
*   Copyright (c) 2013-2026 Ramon Santamaria (@raysan5)
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
{$ifndef RAYLIB_H}
{$define RAYLIB_H}
{$include <stdarg.h>     // Required for: va_list - Only used by TraceLogCallback}

const
  RAYLIB_VERSION_MAJOR = 6;  
  RAYLIB_VERSION_MINOR = 2;  
  RAYLIB_VERSION_PATCH = 0;  
  RAYLIB_VERSION = '6.2';  
{---------------------------------------------------------------------------------- }
{ Defines and Macros }
{---------------------------------------------------------------------------------- }
{$ifndef DEG2RAD}

const
  DEG2RAD = PI/180.0;  
{$endif}
{$ifndef RAD2DEG}

const
  RAD2DEG = 180.0/PI;  
{$endif}
{ xxxxxxxxxxxxx/ Some Basic Colors
#define LIGHTGRAY  CLITERAL(Color) 200, 200, 200, 255    // Light Gray
#define GRAY       CLITERAL(Color) 130, 130, 130, 255    // Gray
#define DARKGRAY   CLITERAL(Color) 80, 80, 80, 255       // Dark Gray
#define YELLOW     CLITERAL(Color) 253, 249, 0, 255      // Yellow
#define GOLD       CLITERAL(Color) 255, 203, 0, 255      // Gold
#define ORANGE     CLITERAL(Color) 255, 161, 0, 255      // Orange
#define PINK       CLITERAL(Color) 255, 109, 194, 255    // Pink
#define RED        CLITERAL(Color) 230, 41, 55, 255      // Red
#define MAROON     CLITERAL(Color) 190, 33, 55, 255      // Maroon
#define GREEN      CLITERAL(Color) 0, 228, 48, 255       // Green
#define LIME       CLITERAL(Color) 0, 158, 47, 255       // Lime
#define DARKGREEN  CLITERAL(Color) 0, 117, 44, 255       // Dark Green
#define SKYBLUE    CLITERAL(Color) 102, 191, 255, 255    // Sky Blue
#define BLUE       CLITERAL(Color) 0, 121, 241, 255      // Blue
#define DARKBLUE   CLITERAL(Color) 0, 82, 172, 255       // Dark Blue
#define PURPLE     CLITERAL(Color) 200, 122, 255, 255    // Purple
#define VIOLET     CLITERAL(Color) 135, 60, 190, 255     // Violet
#define DARKPURPLE CLITERAL(Color) 112, 31, 126, 255     // Dark Purple
#define BEIGE      CLITERAL(Color) 211, 176, 131, 255    // Beige
#define BROWN      CLITERAL(Color) 127, 106, 79, 255     // Brown
#define DARKBROWN  CLITERAL(Color) 76, 63, 47, 255       // Dark Brown

#define WHITE      CLITERAL(Color) 255, 255, 255, 255    // White
#define BLACK      CLITERAL(Color) 0, 0, 0, 255          // Black
#define BLANK      CLITERAL(Color) 0, 0, 0, 0            // Blank (Transparent)
#define MAGENTA    CLITERAL(Color) 255, 0, 255, 255      // Magenta
#define RAYWHITE   CLITERAL(Color) 245, 245, 245, 255    // My own White (raylib logo)
 }
{---------------------------------------------------------------------------------- }
{ Types and Structures Definition }
{---------------------------------------------------------------------------------- }
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
{ Vector4, 4 components }
{ Vector x component }
{ Vector y component }
{ Vector z component }
{ Vector w component }

  PVector4 = ^TVector4;
  TVector4 = record
      x : single;
      y : single;
      z : single;
      w : single;
    end;
{ Quaternion, 4 components (Vector4 alias) }

  PQuaternion = ^TQuaternion;
  TQuaternion = TVector4;
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
{ Color, 4 components, R8G8B8A8 (32bit) }
{ Color red value }
{ Color green value }
{ Color blue value }
{ Color alpha value }

  PColor = ^TColor;
  TColor = record
      r : byte;
      g : byte;
      b : byte;
      a : byte;
    end;
{ Rectangle, 4 components }
{ Rectangle top-left corner position x }
{ Rectangle top-left corner position y }
{ Rectangle width }
{ Rectangle height }

  PRectangle = ^TRectangle;
  TRectangle = record
      x : single;
      y : single;
      width : single;
      height : single;
    end;
{ Image, pixel data stored in CPU memory (RAM) }
{ Image raw data }
{ Image base width }
{ Image base height }
{ Mipmap levels, 1 by default }
{ Data format (PixelFormat type) }

  PImage = ^TImage;
  TImage = record
      data : pointer;
      width : longint;
      height : longint;
      mipmaps : longint;
      format : longint;
    end;
{ Texture, tex data stored in GPU memory (VRAM) }
{ OpenGL texture id }
{ Texture base width }
{ Texture base height }
{ Mipmap levels, 1 by default }
{ Data format (PixelFormat type) }

  PTexture = ^TTexture;
  TTexture = record
      id : dword;
      width : longint;
      height : longint;
      mipmaps : longint;
      format : longint;
    end;
{ Texture2D, same as Texture }

  PTexture2D = ^TTexture2D;
  TTexture2D = TTexture;
{ TextureCubemap, same as Texture }

  PTextureCubemap = ^TTextureCubemap;
  TTextureCubemap = TTexture;
{ RenderTexture, fbo for texture rendering }
{ OpenGL framebuffer object id }
{ Color buffer attachment texture }
{ Depth buffer attachment texture }

  PRenderTexture = ^TRenderTexture;
  TRenderTexture = record
      id : dword;
      texture : TTexture;
      depth : TTexture;
    end;
{ RenderTexture2D, same as RenderTexture }

  PRenderTexture2D = ^TRenderTexture2D;
  TRenderTexture2D = TRenderTexture;
{ NPatchInfo, n-patch layout info }
{ Texture source rectangle }
{ Left border offset }
{ Top border offset }
{ Right border offset }
{ Bottom border offset }
{ Layout of the n-patch: 3x3, 1x3 or 3x1 }

  PNPatchInfo = ^TNPatchInfo;
  TNPatchInfo = record
      source : TRectangle;
      left : longint;
      top : longint;
      right : longint;
      bottom : longint;
      layout : longint;
    end;
{ GlyphInfo, font characters glyphs info }
{ Character value (Unicode) }
{ Character offset X when drawing }
{ Character offset Y when drawing }
{ Character advance position X }
{ Character image data }

  PGlyphInfo = ^TGlyphInfo;
  TGlyphInfo = record
      value : longint;
      offsetX : longint;
      offsetY : longint;
      advanceX : longint;
      image : TImage;
    end;
{ Font, font texture and GlyphInfo array data }
{ Base size (default chars height) }
{ Number of glyph characters }
{ Padding around the glyph characters }
{ Texture atlas containing the glyphs }
{ Rectangles in texture for the glyphs }
{ Glyphs info data }

  PFont = ^TFont;
  TFont = record
      baseSize : longint;
      glyphCount : longint;
      glyphPadding : longint;
      texture : TTexture2D;
      recs : PRectangle;
      glyphs : PGlyphInfo;
    end;
{ Camera, defines position/orientation in 3d space }
{ Camera position }
{ Camera target it looks-at }
{ Camera up vector (rotation over its axis) }
{ Camera field-of-view aperture in Y (degrees) in perspective, used as near plane height in world units in orthographic }
{ Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC }

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
{ Camera2D, defines position/orientation in 2d space }
{ Camera offset (screen space offset from window origin, unscaled by DPI, real pixel size) }
{ Camera target (world space target point that is mapped to screen space offset) }
{ Camera rotation in degrees (pivots around target) }
{ Camera zoom (scaling around target), must not be set to 0, set to 1.0f for no scale }

  PCamera2D = ^TCamera2D;
  TCamera2D = record
      offset : TVector2;
      target : TVector2;
      rotation : single;
      zoom : single;
    end;
{ Mesh, vertex data and vao/vbo }
{ Number of vertices stored in arrays }
{ Number of triangles stored (indexed or not) }
{ Vertex attributes data }
{ Vertex position (XYZ - 3 components per vertex) (shader-location = 0) }
{ Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1) }
{ Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5) }
{ Vertex normals (XYZ - 3 components per vertex) (shader-location = 2) }
{ Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4) }
{ Vertex colors (RGBA - 4 components per vertex) (shader-location = 3) }
{ Vertex indices (in case vertex data comes indexed) }
{ Skin data for animation }
{ Number of bones (MAX: 256 bones) }
{ Vertex bone indices, up to 4 bones influence by vertex (skinning) (shader-location = 6) }
{ Vertex bone weight, up to 4 bones influence by vertex (skinning) (shader-location = 7) }
{ Runtime animation vertex data (CPU skinning) }
{ NOTE: In case of GPU skinning, not used, pointers are NULL }
{ Animated vertex positions (after bones transformations) }
{ Animated normals (after bones transformations) }
{ OpenGL identifiers }
{ OpenGL Vertex Array Object id }
{ OpenGL Vertex Buffer Objects id (default vertex data) }

  PMesh = ^TMesh;
  TMesh = record
      vertexCount : longint;
      triangleCount : longint;
      vertices : Psingle;
      texcoords : Psingle;
      texcoords2 : Psingle;
      normals : Psingle;
      tangents : Psingle;
      colors : Pbyte;
      indices : Pword;
      boneCount : longint;
      boneIndices : Pbyte;
      boneWeights : Psingle;
      animVertices : Psingle;
      animNormals : Psingle;
      vaoId : dword;
      vboId : Pdword;
    end;
{ Shader }
{ Shader program id }
{ Shader locations array (RL_MAX_SHADER_LOCATIONS) }

  PShader = ^TShader;
  TShader = record
      id : dword;
      locs : Plongint;
    end;
{ MaterialMap }
{ Material map texture }
{ Material map color }
{ Material map value }

  PMaterialMap = ^TMaterialMap;
  TMaterialMap = record
      texture : TTexture2D;
      color : TColor;
      value : single;
    end;
{ Material, includes shader and maps }
{ Material shader }
{ Material maps array (MAX_MATERIAL_MAPS) }
{ Material generic parameters (if required) }

  PMaterial = ^TMaterial;
  TMaterial = record
      shader : TShader;
      maps : PMaterialMap;
      params : array[0..3] of single;
    end;
{ Transform, vertex transformation data }
{ Translation }
{ Rotation }
{ Scale }

  PTransform = ^TTransform;
  TTransform = record
      translation : TVector3;
      rotation : TQuaternion;
      scale : TVector3;
    end;
{ Anim pose, an array of Transform[] }

  PModelAnimPose = ^TModelAnimPose;
  TModelAnimPose = PTransform;
{ Bone, skeletal animation bone }
{ Bone name }
{ Bone parent }

  PBoneInfo = ^TBoneInfo;
  TBoneInfo = record
      name : array[0..31] of char;
      parent : longint;
    end;
{ Skeleton, animation bones hierarchy }
{ Number of bones }
{ Bones information (skeleton) }
{ Bones base transformation (Transform[]) }

  PModelSkeleton = ^TModelSkeleton;
  TModelSkeleton = record
      boneCount : dword;
      bones : PBoneInfo;
      bindPose : TModelAnimPose;
    end;
{ Model, meshes, materials and animation data }
{ Local transform matrix }
{ Number of meshes }
{ Number of materials }
{ Meshes array }
{ Materials array }
{ Mesh material number }
{ Animation data }
{ Skeleton for animation }
{ Runtime animation data (CPU/GPU skinning) }
{ Current animation pose (Transform[]) }
{ Bones animated transformation matrices }

  PModel = ^TModel;
  TModel = record
      transform : TMatrix;
      meshCount : longint;
      materialCount : longint;
      meshes : PMesh;
      materials : PMaterial;
      meshMaterial : Plongint;
      skeleton : TModelSkeleton;
      currentPose : TModelAnimPose;
      boneMatrices : PMatrix;
    end;
{ ModelAnimation, contains a full animation sequence }
{ Animation name }
{ Number of bones (per pose) }
{ Number of animation key frames }
{ Animation sequence keyframe poses [keyframe][pose] }

  PModelAnimation = ^TModelAnimation;
  TModelAnimation = record
      name : array[0..31] of char;
      boneCount : dword;
      keyframeCount : longint;
      keyframePoses : PModelAnimPose;
    end;
{ Ray, ray for raycasting }
{ Ray position (origin) }
{ Ray direction (normalized) }

  PRay = ^TRay;
  TRay = record
      position : TVector3;
      direction : TVector3;
    end;
{ RayCollision, ray hit information }
{ Did the ray hit something? }
{ Distance to the nearest hit }
{ Point of the nearest hit }
{ Surface normal of hit }

  PRayCollision = ^TRayCollision;
  TRayCollision = record
      hit : Tbool;
      distance : single;
      point : TVector3;
      normal : TVector3;
    end;
{ BoundingBox }
{ Minimum vertex box-corner }
{ Maximum vertex box-corner }

  PBoundingBox = ^TBoundingBox;
  TBoundingBox = record
      min : TVector3;
      max : TVector3;
    end;
{ Wave, audio wave data }
{ Total number of frames (considering channels) }
{ Frequency (samples per second) }
{ Bit depth (bits per sample): 8, 16, 32 (24 not supported) }
{ Number of channels (1-mono, 2-stereo, ...) }
{ Buffer data pointer }

  PWave = ^TWave;
  TWave = record
      frameCount : dword;
      sampleRate : dword;
      sampleSize : dword;
      channels : dword;
      data : pointer;
    end;
{ Opaque structs declaration }
{ NOTE: Actual structs are defined internally in raudio module }
{ AudioStream, custom audio stream }
{ Pointer to internal data used by the audio system }
{ Pointer to internal data processor, useful for audio effects }
{ Frequency (samples per second) }
{ Bit depth (bits per sample): 8, 16, 32 (24 not supported) }
{ Number of channels (1-mono, 2-stereo, ...) }

  PAudioStream = ^TAudioStream;
  TAudioStream = record
      buffer : PrAudioBuffer;
      processor : PrAudioProcessor;
      sampleRate : dword;
      sampleSize : dword;
      channels : dword;
    end;
{ Sound }
{ Audio stream }
{ Total number of frames (considering channels) }

  PSound = ^TSound;
  TSound = record
      stream : TAudioStream;
      frameCount : dword;
    end;
{ Music, audio stream, anything longer than ~10 seconds should be streamed }
{ Audio stream }
{ Total number of frames (considering channels) }
{ Music looping enable }
{ Type of music context (audio filetype) }
{ Audio context data, depends on type }

  PMusic = ^TMusic;
  TMusic = record
      stream : TAudioStream;
      frameCount : dword;
      looping : Tbool;
      ctxType : longint;
      ctxData : pointer;
    end;
{ VrDeviceInfo, Head-Mounted-Display device parameters }
{ Horizontal resolution in pixels }
{ Vertical resolution in pixels }
{ Horizontal size in meters }
{ Vertical size in meters }
{ Distance between eye and display in meters }
{ Lens separation distance in meters }
{ IPD (distance between pupils) in meters }
{ Lens distortion constant parameters }
{ Chromatic aberration correction parameters }

  PVrDeviceInfo = ^TVrDeviceInfo;
  TVrDeviceInfo = record
      hResolution : longint;
      vResolution : longint;
      hScreenSize : single;
      vScreenSize : single;
      eyeToScreenDistance : single;
      lensSeparationDistance : single;
      interpupillaryDistance : single;
      lensDistortionValues : array[0..3] of single;
      chromaAbCorrection : array[0..3] of single;
    end;
{ VrStereoConfig, VR stereo rendering configuration for simulator }
{ VR projection matrices (per eye) }
{ VR view offset matrices (per eye) }
{ VR left lens center }
{ VR right lens center }
{ VR left screen center }
{ VR right screen center }
{ VR distortion scale }
{ VR distortion scale in }

  PVrStereoConfig = ^TVrStereoConfig;
  TVrStereoConfig = record
      projection : array[0..1] of TMatrix;
      viewOffset : array[0..1] of TMatrix;
      leftLensCenter : array[0..1] of single;
      rightLensCenter : array[0..1] of single;
      leftScreenCenter : array[0..1] of single;
      rightScreenCenter : array[0..1] of single;
      scale : array[0..1] of single;
      scaleIn : array[0..1] of single;
    end;
{ File path list }
{ Filepaths entries count }
{ Filepaths entries }

  PFilePathList = ^TFilePathList;
  TFilePathList = record
      count : dword;
      paths : ^Pchar;
    end;
{ Automation event }
{ Event frame }
{ Event type (AutomationEventType) }
{ Event parameters (if required) }

  PAutomationEvent = ^TAutomationEvent;
  TAutomationEvent = record
      frame : dword;
      _type : dword;
      params : array[0..3] of longint;
    end;
{ Automation event list }
{ Events max entries (MAX_AUTOMATION_EVENTS) }
{ Events entries count }
{ Events entries }

  PAutomationEventList = ^TAutomationEventList;
  TAutomationEventList = record
      capacity : dword;
      count : dword;
      events : PAutomationEvent;
    end;
{---------------------------------------------------------------------------------- }
{ Enumerators Definition }
{---------------------------------------------------------------------------------- }
{ System/Window config flags }
{ NOTE: Every bit registers one state (use it with bit masks) }
{ By default all flags are set to 0 }
{ Set to try enabling V-Sync on GPU }
{ Set to run program in fullscreen }
{ Set to allow resizable window }
{ Set to disable window decoration (frame and buttons) }
{ Set to hide window }
{ Set to minimize window (iconify) }
{ Set to maximize window (expanded to monitor) }
{ Set to window non focused }
{ Set to window always on top }
{ Set to allow windows running while minimized }
{ Set to allow transparent framebuffer }
{ Set to support HighDPI }
{ Set to support mouse passthrough, only supported when FLAG_WINDOW_UNDECORATED }
{ Set to run program in borderless windowed mode }
{ Set to try enabling MSAA 4X }
{ Set to try enabling interlaced video format (for V3D) }

  PConfigFlags = ^TConfigFlags;
  TConfigFlags =  Longint;
  Const
    FLAG_VSYNC_HINT = $00000040;
    FLAG_FULLSCREEN_MODE = $00000002;
    FLAG_WINDOW_RESIZABLE = $00000004;
    FLAG_WINDOW_UNDECORATED = $00000008;
    FLAG_WINDOW_HIDDEN = $00000080;
    FLAG_WINDOW_MINIMIZED = $00000200;
    FLAG_WINDOW_MAXIMIZED = $00000400;
    FLAG_WINDOW_UNFOCUSED = $00000800;
    FLAG_WINDOW_TOPMOST = $00001000;
    FLAG_WINDOW_ALWAYS_RUN = $00000100;
    FLAG_WINDOW_TRANSPARENT = $00000010;
    FLAG_WINDOW_HIGHDPI = $00002000;
    FLAG_WINDOW_MOUSE_PASSTHROUGH = $00004000;
    FLAG_BORDERLESS_WINDOWED_MODE = $00008000;
    FLAG_MSAA_4X_HINT = $00000020;
    FLAG_INTERLACED_HINT = $00010000;
;
{ Trace log level }
{ NOTE: Organized by priority level }
{ Display all logs }
{ Trace logging, intended for internal use only }
{ Debug logging, used for internal debugging, it should be disabled on release builds }
{ Info logging, used for program execution info }
{ Warning logging, used on recoverable failures }
{ Error logging, used on unrecoverable failures }
{ Fatal logging, used to abort program: exit(EXIT_FAILURE) }
{ Disable logging }
type
  PTraceLogLevel = ^TTraceLogLevel;
  TTraceLogLevel =  Longint;
  Const
    LOG_ALL = 0;
    LOG_TRACE = 1;
    LOG_DEBUG = 2;
    LOG_INFO = 3;
    LOG_WARNING = 4;
    LOG_ERROR = 5;
    LOG_FATAL = 6;
    LOG_NONE = 7;
;
{ Keyboard keys (US keyboard layout) }
{ NOTE: Use GetKeyPressed() to allow redefining required keys for alternative layouts }
{ Key: NULL, used for no key pressed }
{ Alphanumeric keys }
{ Key: ' }
{ Key: , }
{ Key: - }
{ Key: . }
{ Key: / }
{ Key: 0 }
{ Key: 1 }
{ Key: 2 }
{ Key: 3 }
{ Key: 4 }
{ Key: 5 }
{ Key: 6 }
{ Key: 7 }
{ Key: 8 }
{ Key: 9 }
{ Key: ; }
{ Key: = }
{ Key: A | a }
{ Key: B | b }
{ Key: C | c }
{ Key: D | d }
{ Key: E | e }
{ Key: F | f }
{ Key: G | g }
{ Key: H | h }
{ Key: I | i }
{ Key: J | j }
{ Key: K | k }
{ Key: L | l }
{ Key: M | m }
{ Key: N | n }
{ Key: O | o }
{ Key: P | p }
{ Key: Q | q }
{ Key: R | r }
{ Key: S | s }
{ Key: T | t }
{ Key: U | u }
{ Key: V | v }
{ Key: W | w }
{ Key: X | x }
{ Key: Y | y }
{ Key: Z | z }
{ Key: [ }
{ Key: '\' }
{ Key: ] }
{ Key: ` }
{ Function keys }
{ Key: Space }
{ Key: Esc }
{ Key: Enter }
{ Key: Tab }
{ Key: Backspace }
{ Key: Ins }
{ Key: Del }
{ Key: Cursor right }
{ Key: Cursor left }
{ Key: Cursor down }
{ Key: Cursor up }
{ Key: Page up }
{ Key: Page down }
{ Key: Home }
{ Key: End }
{ Key: Caps lock }
{ Key: Scroll down }
{ Key: Num lock }
{ Key: Print screen }
{ Key: Pause }
{ Key: F1 }
{ Key: F2 }
{ Key: F3 }
{ Key: F4 }
{ Key: F5 }
{ Key: F6 }
{ Key: F7 }
{ Key: F8 }
{ Key: F9 }
{ Key: F10 }
{ Key: F11 }
{ Key: F12 }
{ Key: Shift left }
{ Key: Control left }
{ Key: Alt left }
{ Key: Super left }
{ Key: Shift right }
{ Key: Control right }
{ Key: Alt right }
{ Key: Super right }
{ Key: KB menu }
{ Keypad keys }
{ Key: Keypad 0 }
{ Key: Keypad 1 }
{ Key: Keypad 2 }
{ Key: Keypad 3 }
{ Key: Keypad 4 }
{ Key: Keypad 5 }
{ Key: Keypad 6 }
{ Key: Keypad 7 }
{ Key: Keypad 8 }
{ Key: Keypad 9 }
{ Key: Keypad . }
{ Key: Keypad / }
{ Key: Keypad * }
{ Key: Keypad - }
{ Key: Keypad + }
{ Key: Keypad Enter }
{ Key: Keypad = }
{ Android key buttons }
{ Key: Android back button }
{ Key: Android menu button }
{ Key: Android volume up button }
{ Key: Android volume down button }
type
  PKeyboardKey = ^TKeyboardKey;
  TKeyboardKey =  Longint;
  Const
    KEY_NULL = 0;
    KEY_APOSTROPHE = 39;
    KEY_COMMA = 44;
    KEY_MINUS = 45;
    KEY_PERIOD = 46;
    KEY_SLASH = 47;
    KEY_ZERO = 48;
    KEY_ONE = 49;
    KEY_TWO = 50;
    KEY_THREE = 51;
    KEY_FOUR = 52;
    KEY_FIVE = 53;
    KEY_SIX = 54;
    KEY_SEVEN = 55;
    KEY_EIGHT = 56;
    KEY_NINE = 57;
    KEY_SEMICOLON = 59;
    KEY_EQUAL = 61;
    KEY_A = 65;
    KEY_B = 66;
    KEY_C = 67;
    KEY_D = 68;
    KEY_E = 69;
    KEY_F = 70;
    KEY_G = 71;
    KEY_H = 72;
    KEY_I = 73;
    KEY_J = 74;
    KEY_K = 75;
    KEY_L = 76;
    KEY_M = 77;
    KEY_N = 78;
    KEY_O = 79;
    KEY_P = 80;
    KEY_Q = 81;
    KEY_R = 82;
    KEY_S = 83;
    KEY_T = 84;
    KEY_U = 85;
    KEY_V = 86;
    KEY_W = 87;
    KEY_X = 88;
    KEY_Y = 89;
    KEY_Z = 90;
    KEY_LEFT_BRACKET = 91;
    KEY_BACKSLASH = 92;
    KEY_RIGHT_BRACKET = 93;
    KEY_GRAVE = 96;
    KEY_SPACE = 32;
    KEY_ESCAPE = 256;
    KEY_ENTER = 257;
    KEY_TAB = 258;
    KEY_BACKSPACE = 259;
    KEY_INSERT = 260;
    KEY_DELETE = 261;
    KEY_RIGHT = 262;
    KEY_LEFT = 263;
    KEY_DOWN = 264;
    KEY_UP = 265;
    KEY_PAGE_UP = 266;
    KEY_PAGE_DOWN = 267;
    KEY_HOME = 268;
    KEY_END = 269;
    KEY_CAPS_LOCK = 280;
    KEY_SCROLL_LOCK = 281;
    KEY_NUM_LOCK = 282;
    KEY_PRINT_SCREEN = 283;
    KEY_PAUSE = 284;
    KEY_F1 = 290;
    KEY_F2 = 291;
    KEY_F3 = 292;
    KEY_F4 = 293;
    KEY_F5 = 294;
    KEY_F6 = 295;
    KEY_F7 = 296;
    KEY_F8 = 297;
    KEY_F9 = 298;
    KEY_F10 = 299;
    KEY_F11 = 300;
    KEY_F12 = 301;
    KEY_LEFT_SHIFT = 340;
    KEY_LEFT_CONTROL = 341;
    KEY_LEFT_ALT = 342;
    KEY_LEFT_SUPER = 343;
    KEY_RIGHT_SHIFT = 344;
    KEY_RIGHT_CONTROL = 345;
    KEY_RIGHT_ALT = 346;
    KEY_RIGHT_SUPER = 347;
    KEY_KB_MENU = 348;
    KEY_KP_0 = 320;
    KEY_KP_1 = 321;
    KEY_KP_2 = 322;
    KEY_KP_3 = 323;
    KEY_KP_4 = 324;
    KEY_KP_5 = 325;
    KEY_KP_6 = 326;
    KEY_KP_7 = 327;
    KEY_KP_8 = 328;
    KEY_KP_9 = 329;
    KEY_KP_DECIMAL = 330;
    KEY_KP_DIVIDE = 331;
    KEY_KP_MULTIPLY = 332;
    KEY_KP_SUBTRACT = 333;
    KEY_KP_ADD = 334;
    KEY_KP_ENTER = 335;
    KEY_KP_EQUAL = 336;
    KEY_BACK = 4;
    KEY_MENU = 5;
    KEY_VOLUME_UP = 24;
    KEY_VOLUME_DOWN = 25;
;
{ Add backwards compatibility support for deprecated names }
  MOUSE_LEFT_BUTTON = MOUSE_BUTTON_LEFT;  
  MOUSE_RIGHT_BUTTON = MOUSE_BUTTON_RIGHT;  
  MOUSE_MIDDLE_BUTTON = MOUSE_BUTTON_MIDDLE;  
{ Mouse buttons }
{ Mouse button left }
{ Mouse button right }
{ Mouse button middle (pressed wheel) }
{ Mouse button side (advanced mouse device) }
{ Mouse button extra (advanced mouse device) }
{ Mouse button forward (advanced mouse device) }
{ Mouse button back (advanced mouse device) }
type
  PMouseButton = ^TMouseButton;
  TMouseButton =  Longint;
  Const
    MOUSE_BUTTON_LEFT = 0;
    MOUSE_BUTTON_RIGHT = 1;
    MOUSE_BUTTON_MIDDLE = 2;
    MOUSE_BUTTON_SIDE = 3;
    MOUSE_BUTTON_EXTRA = 4;
    MOUSE_BUTTON_FORWARD = 5;
    MOUSE_BUTTON_BACK = 6;
;
{ Mouse cursor }
{ Default pointer shape }
{ Arrow shape }
{ Text writing cursor shape }
{ Cross shape }
{ Pointing hand cursor }
{ Horizontal resize/move arrow shape }
{ Vertical resize/move arrow shape }
{ Top-left to bottom-right diagonal resize/move arrow shape }
{ The top-right to bottom-left diagonal resize/move arrow shape }
{ The omnidirectional resize/move cursor shape }
{ The operation-not-allowed shape }
type
  PMouseCursor = ^TMouseCursor;
  TMouseCursor =  Longint;
  Const
    MOUSE_CURSOR_DEFAULT = 0;
    MOUSE_CURSOR_ARROW = 1;
    MOUSE_CURSOR_IBEAM = 2;
    MOUSE_CURSOR_CROSSHAIR = 3;
    MOUSE_CURSOR_POINTING_HAND = 4;
    MOUSE_CURSOR_RESIZE_EW = 5;
    MOUSE_CURSOR_RESIZE_NS = 6;
    MOUSE_CURSOR_RESIZE_NWSE = 7;
    MOUSE_CURSOR_RESIZE_NESW = 8;
    MOUSE_CURSOR_RESIZE_ALL = 9;
    MOUSE_CURSOR_NOT_ALLOWED = 10;
;
{ Gamepad buttons }
{ Unknown button, for error checking }
{ Gamepad left DPAD up button }
{ Gamepad left DPAD right button }
{ Gamepad left DPAD down button }
{ Gamepad left DPAD left button }
{ Gamepad right button up (i.e. PS3: Triangle, Xbox: Y) }
{ Gamepad right button right (i.e. PS3: Circle, Xbox: B) }
{ Gamepad right button down (i.e. PS3: Cross, Xbox: A) }
{ Gamepad right button left (i.e. PS3: Square, Xbox: X) }
{ Gamepad top/back trigger left (first), it could be a trailing button }
{ Gamepad top/back trigger left (second), it could be a trailing button }
{ Gamepad top/back trigger right (first), it could be a trailing button }
{ Gamepad top/back trigger right (second), it could be a trailing button }
{ Gamepad center buttons, left one (i.e. PS3: Select) }
{ Gamepad center buttons, middle one (i.e. PS3: PS, Xbox: XBOX) }
{ Gamepad center buttons, right one (i.e. PS3: Start) }
{ Gamepad joystick pressed button left }
{ Gamepad joystick pressed button right }
type
  PGamepadButton = ^TGamepadButton;
  TGamepadButton =  Longint;
  Const
    GAMEPAD_BUTTON_UNKNOWN = 0;
    GAMEPAD_BUTTON_LEFT_FACE_UP = 1;
    GAMEPAD_BUTTON_LEFT_FACE_RIGHT = 2;
    GAMEPAD_BUTTON_LEFT_FACE_DOWN = 3;
    GAMEPAD_BUTTON_LEFT_FACE_LEFT = 4;
    GAMEPAD_BUTTON_RIGHT_FACE_UP = 5;
    GAMEPAD_BUTTON_RIGHT_FACE_RIGHT = 6;
    GAMEPAD_BUTTON_RIGHT_FACE_DOWN = 7;
    GAMEPAD_BUTTON_RIGHT_FACE_LEFT = 8;
    GAMEPAD_BUTTON_LEFT_TRIGGER_1 = 9;
    GAMEPAD_BUTTON_LEFT_TRIGGER_2 = 10;
    GAMEPAD_BUTTON_RIGHT_TRIGGER_1 = 11;
    GAMEPAD_BUTTON_RIGHT_TRIGGER_2 = 12;
    GAMEPAD_BUTTON_MIDDLE_LEFT = 13;
    GAMEPAD_BUTTON_MIDDLE = 14;
    GAMEPAD_BUTTON_MIDDLE_RIGHT = 15;
    GAMEPAD_BUTTON_LEFT_THUMB = 16;
    GAMEPAD_BUTTON_RIGHT_THUMB = 17;
;
{ Gamepad axes }
{ Gamepad left stick X axis }
{ Gamepad left stick Y axis }
{ Gamepad right stick X axis }
{ Gamepad right stick Y axis }
{ Gamepad back trigger left, pressure level: [1..-1] }
{ Gamepad back trigger right, pressure level: [1..-1] }
type
  PGamepadAxis = ^TGamepadAxis;
  TGamepadAxis =  Longint;
  Const
    GAMEPAD_AXIS_LEFT_X = 0;
    GAMEPAD_AXIS_LEFT_Y = 1;
    GAMEPAD_AXIS_RIGHT_X = 2;
    GAMEPAD_AXIS_RIGHT_Y = 3;
    GAMEPAD_AXIS_LEFT_TRIGGER = 4;
    GAMEPAD_AXIS_RIGHT_TRIGGER = 5;
;
{ Material map index }
{ Albedo material (same as: MATERIAL_MAP_DIFFUSE) }
{ Metalness material (same as: MATERIAL_MAP_SPECULAR) }
{ Normal material }
{ Roughness material }
{ Ambient occlusion material }
{ Emission material }
{ Heightmap material }
{ Cubemap material (NOTE: Uses GL_TEXTURE_CUBE_MAP) }
{ Irradiance material (NOTE: Uses GL_TEXTURE_CUBE_MAP) }
{ Prefilter material (NOTE: Uses GL_TEXTURE_CUBE_MAP) }
{ Brdf material }
type
  PMaterialMapIndex = ^TMaterialMapIndex;
  TMaterialMapIndex =  Longint;
  Const
    MATERIAL_MAP_ALBEDO = 0;
    MATERIAL_MAP_METALNESS = 1;
    MATERIAL_MAP_NORMAL = 2;
    MATERIAL_MAP_ROUGHNESS = 3;
    MATERIAL_MAP_OCCLUSION = 4;
    MATERIAL_MAP_EMISSION = 5;
    MATERIAL_MAP_HEIGHT = 6;
    MATERIAL_MAP_CUBEMAP = 7;
    MATERIAL_MAP_IRRADIANCE = 8;
    MATERIAL_MAP_PREFILTER = 9;
    MATERIAL_MAP_BRDF = 10;
;
  MATERIAL_MAP_DIFFUSE = MATERIAL_MAP_ALBEDO;  
  MATERIAL_MAP_SPECULAR = MATERIAL_MAP_METALNESS;  
{ Shader location index }
{ NOTE: Some locations are tried to be set automatically on shader loading, }
{ but only if default attributes/uniforms names are found, check config.h for names }
{ Shader location: vertex attribute: position }
{ Shader location: vertex attribute: texcoord01 }
{ Shader location: vertex attribute: texcoord02 }
{ Shader location: vertex attribute: normal }
{ Shader location: vertex attribute: tangent }
{ Shader location: vertex attribute: color }
{ Shader location: matrix uniform: model-view-projection }
{ Shader location: matrix uniform: view (camera transform) }
{ Shader location: matrix uniform: projection }
{ Shader location: matrix uniform: model (transform) }
{ Shader location: matrix uniform: normal }
{ Shader location: vector uniform: view }
{ Shader location: vector uniform: diffuse color }
{ Shader location: vector uniform: specular color }
{ Shader location: vector uniform: ambient color }
{ Shader location: sampler2d texture: albedo (same as: SHADER_LOC_MAP_DIFFUSE) }
{ Shader location: sampler2d texture: metalness (same as: SHADER_LOC_MAP_SPECULAR) }
{ Shader location: sampler2d texture: normal }
{ Shader location: sampler2d texture: roughness }
{ Shader location: sampler2d texture: occlusion }
{ Shader location: sampler2d texture: emission }
{ Shader location: sampler2d texture: heightmap }
{ Shader location: samplerCube texture: cubemap }
{ Shader location: samplerCube texture: irradiance }
{ Shader location: samplerCube texture: prefilter }
{ Shader location: sampler2d texture: brdf }
{ Shader location: vertex attribute: bone indices }
{ Shader location: vertex attribute: bone weights }
{ Shader location: matrix attribute: bone transforms (animation) }
{ Shader location: vertex attribute: instance transforms }
type
  PShaderLocationIndex = ^TShaderLocationIndex;
  TShaderLocationIndex =  Longint;
  Const
    SHADER_LOC_VERTEX_POSITION = 0;
    SHADER_LOC_VERTEX_TEXCOORD01 = 1;
    SHADER_LOC_VERTEX_TEXCOORD02 = 2;
    SHADER_LOC_VERTEX_NORMAL = 3;
    SHADER_LOC_VERTEX_TANGENT = 4;
    SHADER_LOC_VERTEX_COLOR = 5;
    SHADER_LOC_MATRIX_MVP = 6;
    SHADER_LOC_MATRIX_VIEW = 7;
    SHADER_LOC_MATRIX_PROJECTION = 8;
    SHADER_LOC_MATRIX_MODEL = 9;
    SHADER_LOC_MATRIX_NORMAL = 10;
    SHADER_LOC_VECTOR_VIEW = 11;
    SHADER_LOC_COLOR_DIFFUSE = 12;
    SHADER_LOC_COLOR_SPECULAR = 13;
    SHADER_LOC_COLOR_AMBIENT = 14;
    SHADER_LOC_MAP_ALBEDO = 15;
    SHADER_LOC_MAP_METALNESS = 16;
    SHADER_LOC_MAP_NORMAL = 17;
    SHADER_LOC_MAP_ROUGHNESS = 18;
    SHADER_LOC_MAP_OCCLUSION = 19;
    SHADER_LOC_MAP_EMISSION = 20;
    SHADER_LOC_MAP_HEIGHT = 21;
    SHADER_LOC_MAP_CUBEMAP = 22;
    SHADER_LOC_MAP_IRRADIANCE = 23;
    SHADER_LOC_MAP_PREFILTER = 24;
    SHADER_LOC_MAP_BRDF = 25;
    SHADER_LOC_VERTEX_BONEIDS = 26;
    SHADER_LOC_VERTEX_BONEWEIGHTS = 27;
    SHADER_LOC_MATRIX_BONETRANSFORMS = 28;
    SHADER_LOC_VERTEX_INSTANCETRANSFORM = 29;
;
  SHADER_LOC_MAP_DIFFUSE = SHADER_LOC_MAP_ALBEDO;  
  SHADER_LOC_MAP_SPECULAR = SHADER_LOC_MAP_METALNESS;  
{ Shader uniform data type }
{ Shader uniform type: float }
{ Shader uniform type: vec2 (2 float) }
{ Shader uniform type: vec3 (3 float) }
{ Shader uniform type: vec4 (4 float) }
{ Shader uniform type: int }
{ Shader uniform type: ivec2 (2 int) }
{ Shader uniform type: ivec3 (3 int) }
{ Shader uniform type: ivec4 (4 int) }
{ Shader uniform type: unsigned int }
{ Shader uniform type: uivec2 (2 unsigned int) }
{ Shader uniform type: uivec3 (3 unsigned int) }
{ Shader uniform type: uivec4 (4 unsigned int) }
{ Shader uniform type: sampler2d }
type
  PShaderUniformDataType = ^TShaderUniformDataType;
  TShaderUniformDataType =  Longint;
  Const
    SHADER_UNIFORM_FLOAT = 0;
    SHADER_UNIFORM_VEC2 = 1;
    SHADER_UNIFORM_VEC3 = 2;
    SHADER_UNIFORM_VEC4 = 3;
    SHADER_UNIFORM_INT = 4;
    SHADER_UNIFORM_IVEC2 = 5;
    SHADER_UNIFORM_IVEC3 = 6;
    SHADER_UNIFORM_IVEC4 = 7;
    SHADER_UNIFORM_UINT = 8;
    SHADER_UNIFORM_UIVEC2 = 9;
    SHADER_UNIFORM_UIVEC3 = 10;
    SHADER_UNIFORM_UIVEC4 = 11;
    SHADER_UNIFORM_SAMPLER2D = 12;
;
{ Shader attribute data types }
{ Shader attribute type: float }
{ Shader attribute type: vec2 (2 float) }
{ Shader attribute type: vec3 (3 float) }
{ Shader attribute type: vec4 (4 float) }
type
  PShaderAttributeDataType = ^TShaderAttributeDataType;
  TShaderAttributeDataType =  Longint;
  Const
    SHADER_ATTRIB_FLOAT = 0;
    SHADER_ATTRIB_VEC2 = 1;
    SHADER_ATTRIB_VEC3 = 2;
    SHADER_ATTRIB_VEC4 = 3;
;
{ Pixel formats }
{ NOTE: Support depends on OpenGL version and platform }
{ 8 bit per pixel (no alpha) }
{ 8*2 bpp (2 channels) }
{ 16 bpp }
{ 24 bpp }
{ 16 bpp (1 bit alpha) }
{ 16 bpp (4 bit alpha) }
{ 32 bpp }
{ 32 bpp (1 channel - float) }
{ 32*3 bpp (3 channels - float) }
{ 32*4 bpp (4 channels - float) }
{ 16 bpp (1 channel - half float) }
{ 16*3 bpp (3 channels - half float) }
{ 16*4 bpp (4 channels - half float) }
{ 4 bpp (no alpha) }
{ 4 bpp (1 bit alpha) }
{ 8 bpp }
{ 8 bpp }
{ 4 bpp }
{ 4 bpp }
{ 8 bpp }
{ 4 bpp }
{ 4 bpp }
{ 8 bpp }
{ 2 bpp }
type
  PPixelFormat = ^TPixelFormat;
  TPixelFormat =  Longint;
  Const
    PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1;
    PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA = 2;
    PIXELFORMAT_UNCOMPRESSED_R5G6B5 = 3;
    PIXELFORMAT_UNCOMPRESSED_R8G8B8 = 4;
    PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 = 5;
    PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 = 6;
    PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 = 7;
    PIXELFORMAT_UNCOMPRESSED_R32 = 8;
    PIXELFORMAT_UNCOMPRESSED_R32G32B32 = 9;
    PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = 10;
    PIXELFORMAT_UNCOMPRESSED_R16 = 11;
    PIXELFORMAT_UNCOMPRESSED_R16G16B16 = 12;
    PIXELFORMAT_UNCOMPRESSED_R16G16B16A16 = 13;
    PIXELFORMAT_COMPRESSED_DXT1_RGB = 14;
    PIXELFORMAT_COMPRESSED_DXT1_RGBA = 15;
    PIXELFORMAT_COMPRESSED_DXT3_RGBA = 16;
    PIXELFORMAT_COMPRESSED_DXT5_RGBA = 17;
    PIXELFORMAT_COMPRESSED_ETC1_RGB = 18;
    PIXELFORMAT_COMPRESSED_ETC2_RGB = 19;
    PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA = 20;
    PIXELFORMAT_COMPRESSED_PVRT_RGB = 21;
    PIXELFORMAT_COMPRESSED_PVRT_RGBA = 22;
    PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA = 23;
    PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA = 24;
;
{ Texture parameters: filter mode }
{ NOTE 1: Filtering considers mipmaps if available in the texture }
{ NOTE 2: Filter is accordingly set for minification and magnification }
{ No filter, pixel approximation }
{ Linear filtering }
{ Trilinear filtering (linear with mipmaps) }
{ Anisotropic filtering 4x }
{ Anisotropic filtering 8x }
{ Anisotropic filtering 16x }
type
  PTextureFilter = ^TTextureFilter;
  TTextureFilter =  Longint;
  Const
    TEXTURE_FILTER_POINT = 0;
    TEXTURE_FILTER_BILINEAR = 1;
    TEXTURE_FILTER_TRILINEAR = 2;
    TEXTURE_FILTER_ANISOTROPIC_4X = 3;
    TEXTURE_FILTER_ANISOTROPIC_8X = 4;
    TEXTURE_FILTER_ANISOTROPIC_16X = 5;
;
{ Texture parameters: wrap mode }
{ Repeats texture in tiled mode }
{ Clamps texture to edge pixel in tiled mode }
{ Mirrors and repeats the texture in tiled mode }
{ Mirrors and clamps to border the texture in tiled mode }
type
  PTextureWrap = ^TTextureWrap;
  TTextureWrap =  Longint;
  Const
    TEXTURE_WRAP_REPEAT = 0;
    TEXTURE_WRAP_CLAMP = 1;
    TEXTURE_WRAP_MIRROR_REPEAT = 2;
    TEXTURE_WRAP_MIRROR_CLAMP = 3;
;
{ Cubemap layouts }
{ Automatically detect layout type }
{ Layout is defined by a vertical line with faces }
{ Layout is defined by a horizontal line with faces }
{ Layout is defined by a 3x4 cross with cubemap faces }
{ Layout is defined by a 4x3 cross with cubemap faces }
type
  PCubemapLayout = ^TCubemapLayout;
  TCubemapLayout =  Longint;
  Const
    CUBEMAP_LAYOUT_AUTO_DETECT = 0;
    CUBEMAP_LAYOUT_LINE_VERTICAL = 1;
    CUBEMAP_LAYOUT_LINE_HORIZONTAL = 2;
    CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR = 3;
    CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE = 4;
;
{ Font type, defines generation method }
{ Default font generation, anti-aliased }
{ Bitmap font generation, no anti-aliasing }
{ SDF font generation, requires external shader }
type
  PFontType = ^TFontType;
  TFontType =  Longint;
  Const
    FONT_DEFAULT = 0;
    FONT_BITMAP = 1;
    FONT_SDF = 2;
;
{ Color blending modes (pre-defined) }
{ Blend textures considering alpha (default) }
{ Blend textures adding colors }
{ Blend textures multiplying colors }
{ Blend textures adding colors (alternative) }
{ Blend textures subtracting colors (alternative) }
{ Blend premultiplied textures considering alpha }
{ Blend textures using custom src/dst factors (use rlSetBlendFactors()) }
{ Blend textures using custom rgb/alpha separate src/dst factors (use rlSetBlendFactorsSeparate()) }
type
  PBlendMode = ^TBlendMode;
  TBlendMode =  Longint;
  Const
    BLEND_ALPHA = 0;
    BLEND_ADDITIVE = 1;
    BLEND_MULTIPLIED = 2;
    BLEND_ADD_COLORS = 3;
    BLEND_SUBTRACT_COLORS = 4;
    BLEND_ALPHA_PREMULTIPLY = 5;
    BLEND_CUSTOM = 6;
    BLEND_CUSTOM_SEPARATE = 7;
;
{ Gesture }
{ NOTE: Provided as bit-wise flags to enable only desired gestures }
{ No gesture }
{ Tap gesture }
{ Double tap gesture }
{ Hold gesture }
{ Drag gesture }
{ Swipe right gesture }
{ Swipe left gesture }
{ Swipe up gesture }
{ Swipe down gesture }
{ Pinch in gesture }
{ Pinch out gesture }
type
  PGesture = ^TGesture;
  TGesture =  Longint;
  Const
    GESTURE_NONE = 0;
    GESTURE_TAP = 1;
    GESTURE_DOUBLETAP = 2;
    GESTURE_HOLD = 4;
    GESTURE_DRAG = 8;
    GESTURE_SWIPE_RIGHT = 16;
    GESTURE_SWIPE_LEFT = 32;
    GESTURE_SWIPE_UP = 64;
    GESTURE_SWIPE_DOWN = 128;
    GESTURE_PINCH_IN = 256;
    GESTURE_PINCH_OUT = 512;
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
{ Camera projection }
{ Perspective projection }
{ Orthographic projection }
type
  PCameraProjection = ^TCameraProjection;
  TCameraProjection =  Longint;
  Const
    CAMERA_PERSPECTIVE = 0;
    CAMERA_ORTHOGRAPHIC = 1;
;
{ N-patch layout }
{ Npatch layout: 3x3 tiles }
{ Npatch layout: 1x3 tiles }
{ Npatch layout: 3x1 tiles }
type
  PNPatchLayout = ^TNPatchLayout;
  TNPatchLayout =  Longint;
  Const
    NPATCH_NINE_PATCH = 0;
    NPATCH_THREE_PATCH_VERTICAL = 1;
    NPATCH_THREE_PATCH_HORIZONTAL = 2;
;
{ Callbacks to hook some internal functions }
{ WARNING: These callbacks are intended for advanced users }
(* Const before type ignored *)
type

  TTraceLogCallback = procedure (logLevel:longint; text:Pchar; args:Tva_list);cdecl;
{ Logging: Redirect trace log messages }
(* Const before type ignored *)

  PLoadFileDataCallback = ^TLoadFileDataCallback;
  TLoadFileDataCallback = function (fileName:Pchar; dataSize:Plongint):Pbyte;cdecl;
{ FileIO: Load binary data }
(* Const before type ignored *)
(* Const before type ignored *)

  TSaveFileDataCallback = function (fileName:Pchar; data:pointer; dataSize:longint):Tbool;cdecl;
{ FileIO: Save binary data }
(* Const before type ignored *)

  PLoadFileTextCallback = ^TLoadFileTextCallback;
  TLoadFileTextCallback = function (fileName:Pchar):Pchar;cdecl;
{ FileIO: Load text data }
(* Const before type ignored *)
(* Const before type ignored *)

  TSaveFileTextCallback = function (fileName:Pchar; text:Pchar):Tbool;cdecl;
{ FileIO: Save text data }
{------------------------------------------------------------------------------------ }
{ Global Variables Definition }
{------------------------------------------------------------------------------------ }
{ It's lonely here... }
{------------------------------------------------------------------------------------ }
{ Window and Graphics Device Functions (Module: core) }
{------------------------------------------------------------------------------------ }
{ Window-related functions }
(* Const before type ignored *)

procedure InitWindow(width:longint; height:longint; title:Pchar);cdecl;external;
{ Initialize window and OpenGL context }
procedure CloseWindow;cdecl;external;
{ Close window and unload OpenGL context }
function WindowShouldClose:Tbool;cdecl;external;
{ Check if application should close (KEY_ESCAPE pressed or windows close icon clicked) }
function IsWindowReady:Tbool;cdecl;external;
{ Check if window has been initialized successfully }
function IsWindowFullscreen:Tbool;cdecl;external;
{ Check if window is currently fullscreen }
function IsWindowHidden:Tbool;cdecl;external;
{ Check if window is currently hidden }
function IsWindowMinimized:Tbool;cdecl;external;
{ Check if window is currently minimized }
function IsWindowMaximized:Tbool;cdecl;external;
{ Check if window is currently maximized }
function IsWindowFocused:Tbool;cdecl;external;
{ Check if window is currently focused }
function IsWindowResized:Tbool;cdecl;external;
{ Check if window has been resized last frame }
function IsWindowState(flag:dword):Tbool;cdecl;external;
{ Check if one specific window flag is enabled }
procedure SetWindowState(flags:dword);cdecl;external;
{ Set window configuration state using flags }
procedure ClearWindowState(flags:dword);cdecl;external;
{ Clear window configuration state flags }
procedure ToggleFullscreen;cdecl;external;
{ Toggle window state: fullscreen/windowed, resizes monitor to match window resolution }
procedure ToggleBorderlessWindowed;cdecl;external;
{ Toggle window state: borderless windowed, resizes window to match monitor resolution }
procedure MaximizeWindow;cdecl;external;
{ Set window state: maximized, if resizable }
procedure MinimizeWindow;cdecl;external;
{ Set window state: minimized, if resizable }
procedure RestoreWindow;cdecl;external;
{ Restore window from being minimized/maximized }
procedure SetWindowIcon(image:TImage);cdecl;external;
{ Set icon for window (single image, RGBA 32bit) }
procedure SetWindowIcons(images:PImage; count:longint);cdecl;external;
{ Set icon for window (multiple images, RGBA 32bit) }
(* Const before type ignored *)
procedure SetWindowTitle(title:Pchar);cdecl;external;
{ Set title for window }
procedure SetWindowPosition(x:longint; y:longint);cdecl;external;
{ Set window position on screen }
procedure SetWindowMonitor(monitor:longint);cdecl;external;
{ Set monitor for the current window }
procedure SetWindowMinSize(width:longint; height:longint);cdecl;external;
{ Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE) }
procedure SetWindowMaxSize(width:longint; height:longint);cdecl;external;
{ Set window maximum dimensions (for FLAG_WINDOW_RESIZABLE) }
procedure SetWindowSize(width:longint; height:longint);cdecl;external;
{ Set window dimensions }
procedure SetWindowOpacity(opacity:single);cdecl;external;
{ Set window opacity [0.0f..1.0f] }
procedure SetWindowFocused;cdecl;external;
{ Set window focused }
function GetWindowHandle:pointer;cdecl;external;
{ Get native window handle }
function GetScreenWidth:longint;cdecl;external;
{ Get current screen width }
function GetScreenHeight:longint;cdecl;external;
{ Get current screen height }
function GetRenderWidth:longint;cdecl;external;
{ Get current render width (it considers HiDPI) }
function GetRenderHeight:longint;cdecl;external;
{ Get current render height (it considers HiDPI) }
function GetMonitorCount:longint;cdecl;external;
{ Get number of connected monitors }
function GetCurrentMonitor:longint;cdecl;external;
{ Get current monitor where window is placed }
function GetMonitorPosition(monitor:longint):TVector2;cdecl;external;
{ Get specified monitor position }
function GetMonitorWidth(monitor:longint):longint;cdecl;external;
{ Get specified monitor width (current video mode used by monitor) }
function GetMonitorHeight(monitor:longint):longint;cdecl;external;
{ Get specified monitor height (current video mode used by monitor) }
function GetMonitorPhysicalWidth(monitor:longint):longint;cdecl;external;
{ Get specified monitor physical width in millimetres }
function GetMonitorPhysicalHeight(monitor:longint):longint;cdecl;external;
{ Get specified monitor physical height in millimetres }
function GetMonitorRefreshRate(monitor:longint):longint;cdecl;external;
{ Get specified monitor refresh rate }
function GetWindowPosition:TVector2;cdecl;external;
{ Get window position XY on monitor }
function GetWindowScaleDPI:TVector2;cdecl;external;
{ Get window scale DPI factor }
(* Const before type ignored *)
function GetMonitorName(monitor:longint):Pchar;cdecl;external;
{ Get the human-readable, UTF-8 encoded name of the specified monitor }
(* Const before type ignored *)
procedure SetClipboardText(text:Pchar);cdecl;external;
{ Set clipboard text content }
(* Const before type ignored *)
function GetClipboardText:Pchar;cdecl;external;
{ Get clipboard text content }
function GetClipboardImage:TImage;cdecl;external;
{ Get clipboard image content }
procedure EnableEventWaiting;cdecl;external;
{ Enable waiting for events on EndDrawing(), no automatic event polling }
procedure DisableEventWaiting;cdecl;external;
{ Disable waiting for events on EndDrawing(), automatic events polling }
{ Cursor-related functions }
procedure ShowCursor;cdecl;external;
{ Show cursor }
procedure HideCursor;cdecl;external;
{ Hide cursor }
function IsCursorHidden:Tbool;cdecl;external;
{ Check if cursor is not visible }
procedure EnableCursor;cdecl;external;
{ Enable cursor (unlock cursor) }
procedure DisableCursor;cdecl;external;
{ Disable cursor (lock cursor) }
function IsCursorOnScreen:Tbool;cdecl;external;
{ Check if cursor is on the screen }
{ Drawing-related functions }
procedure ClearBackground(color:TColor);cdecl;external;
{ Clear background (framebuffer) to color }
procedure BeginDrawing;cdecl;external;
{ Begin canvas (framebuffer) drawing }
procedure EndDrawing;cdecl;external;
{ End canvas (framebuffer) drawing and swap buffers (double buffering) }
procedure BeginMode2D(camera:TCamera2D);cdecl;external;
{ Begin 2D mode with custom camera (2D) }
procedure EndMode2D;cdecl;external;
{ End 2D mode with custom camera }
procedure BeginMode3D(camera:TCamera3D);cdecl;external;
{ Begin 3D mode with custom camera (3D) }
procedure EndMode3D;cdecl;external;
{ End 3D mode and returns to default 2D orthographic mode }
procedure BeginTextureMode(target:TRenderTexture2D);cdecl;external;
{ Begin drawing to render texture }
procedure EndTextureMode;cdecl;external;
{ End drawing to render texture }
procedure BeginShaderMode(shader:TShader);cdecl;external;
{ Begin custom shader drawing }
procedure EndShaderMode;cdecl;external;
{ End custom shader drawing (use default shader) }
procedure BeginBlendMode(mode:longint);cdecl;external;
{ Begin blending mode (alpha, additive, multiplied, subtract, custom) }
procedure EndBlendMode;cdecl;external;
{ End blending mode (reset to default: alpha blending) }
procedure BeginScissorMode(x:longint; y:longint; width:longint; height:longint);cdecl;external;
{ Begin scissor mode (define screen area for following drawing) }
procedure EndScissorMode;cdecl;external;
{ End scissor mode }
procedure BeginVrStereoMode(config:TVrStereoConfig);cdecl;external;
{ Begin stereo rendering (requires VR simulator) }
procedure EndVrStereoMode;cdecl;external;
{ End stereo rendering (requires VR simulator) }
{ VR stereo config functions for VR simulator }
function LoadVrStereoConfig(device:TVrDeviceInfo):TVrStereoConfig;cdecl;external;
{ Load VR stereo config for VR simulator device parameters }
procedure UnloadVrStereoConfig(config:TVrStereoConfig);cdecl;external;
{ Unload VR stereo config }
{ Shader management functions }
{ NOTE: Shader functionality is not available on OpenGL 1.1 }
(* Const before type ignored *)
(* Const before type ignored *)
function LoadShader(vsFileName:Pchar; fsFileName:Pchar):TShader;cdecl;external;
{ Load shader from files and bind default locations }
(* Const before type ignored *)
(* Const before type ignored *)
function LoadShaderFromMemory(vsCode:Pchar; fsCode:Pchar):TShader;cdecl;external;
{ Load shader from code strings and bind default locations }
function IsShaderValid(shader:TShader):Tbool;cdecl;external;
{ Check if shader is valid (loaded on GPU) }
(* Const before type ignored *)
function GetShaderLocation(shader:TShader; uniformName:Pchar):longint;cdecl;external;
{ Get shader uniform location }
(* Const before type ignored *)
function GetShaderLocationAttrib(shader:TShader; attribName:Pchar):longint;cdecl;external;
{ Get shader attribute location }
(* Const before type ignored *)
procedure SetShaderValue(shader:TShader; locIndex:longint; value:pointer; uniformType:longint);cdecl;external;
{ Set shader uniform value }
(* Const before type ignored *)
procedure SetShaderValueV(shader:TShader; locIndex:longint; value:pointer; uniformType:longint; count:longint);cdecl;external;
{ Set shader uniform value vector }
procedure SetShaderValueMatrix(shader:TShader; locIndex:longint; mat:TMatrix);cdecl;external;
{ Set shader uniform value (matrix 4x4) }
procedure SetShaderValueTexture(shader:TShader; locIndex:longint; texture:TTexture2D);cdecl;external;
{ Set shader uniform value and bind the texture (sampler2d) }
procedure UnloadShader(shader:TShader);cdecl;external;
{ Unload shader from GPU memory (VRAM) }
{ Screen-space-related functions }
function GetScreenToWorldRay(position:TVector2; camera:TCamera):TRay;cdecl;external;
{ Get a ray trace from screen position (i.e mouse) }
function GetScreenToWorldRayEx(position:TVector2; camera:TCamera; width:longint; height:longint):TRay;cdecl;external;
{ Get a ray trace from screen position (i.e mouse) in a viewport }
function GetWorldToScreen(position:TVector3; camera:TCamera):TVector2;cdecl;external;
{ Get screen space position for a 3d world space position }
function GetWorldToScreenEx(position:TVector3; camera:TCamera; width:longint; height:longint):TVector2;cdecl;external;
{ Get sized screen space position for a 3d world space position }
function GetWorldToScreen2D(position:TVector2; camera:TCamera2D):TVector2;cdecl;external;
{ Get screen space position for a 2d camera world space position }
function GetScreenToWorld2D(position:TVector2; camera:TCamera2D):TVector2;cdecl;external;
{ Get world space position for a 2d camera screen space position }
function GetCameraMatrix(camera:TCamera):TMatrix;cdecl;external;
{ Get camera transform matrix (view matrix) }
function GetCameraMatrix2D(camera:TCamera2D):TMatrix;cdecl;external;
{ Get camera 2d transform matrix }
{ Timing-related functions }
procedure SetTargetFPS(fps:longint);cdecl;external;
{ Set target FPS (maximum) }
function GetFrameTime:single;cdecl;external;
{ Get time in seconds for last frame drawn (delta time) }
function GetTime:Tdouble;cdecl;external;
{ Get elapsed time in seconds since InitWindow() }
function GetFPS:longint;cdecl;external;
{ Get current FPS }
{ Custom frame control functions }
{ NOTE: Those functions are intended for advanced users that want full control over the frame processing }
{ By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timing + PollInputEvents() }
{ To avoid that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL }
procedure SwapScreenBuffer;cdecl;external;
{ Swap back buffer with front buffer (screen drawing) }
procedure PollInputEvents;cdecl;external;
{ Register all input events }
procedure WaitTime(seconds:Tdouble);cdecl;external;
{ Wait for some time (halt program execution) }
{ Random values generation functions }
procedure SetRandomSeed(seed:dword);cdecl;external;
{ Set the seed for the random number generator }
function GetRandomValue(min:longint; max:longint):longint;cdecl;external;
{ Get a random value between min and max (both included) }
function LoadRandomSequence(count:dword; min:longint; max:longint):Plongint;cdecl;external;
{ Load random values sequence, no values repeated }
procedure UnloadRandomSequence(sequence:Plongint);cdecl;external;
{ Unload random values sequence }
{ Misc. functions }
(* Const before type ignored *)
procedure TakeScreenshot(fileName:Pchar);cdecl;external;
{ Takes a screenshot of current screen (filename extension defines format) }
procedure SetConfigFlags(flags:dword);cdecl;external;
{ Set init configuration flags (view FLAGS) }
(* Const before type ignored *)
procedure OpenURL(url:Pchar);cdecl;external;
{ Open URL with default system browser (if available) }
{ Logging system }
procedure SetTraceLogLevel(logLevel:longint);cdecl;external;
{ Set the current threshold (minimum) log level }
(* Const before type ignored *)
procedure TraceLog(logLevel:longint; text:Pchar; args:array of const);cdecl;external;
procedure TraceLog(logLevel:longint; text:Pchar);cdecl;external;
{ Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...) }
procedure SetTraceLogCallback(callback:TTraceLogCallback);cdecl;external;
{ Set custom trace log }
{ Memory management, using internal allocators }
function MemAlloc(size:dword):pointer;cdecl;external;
{ Internal memory allocator }
function MemRealloc(ptr:pointer; size:dword):pointer;cdecl;external;
{ Internal memory reallocator }
procedure MemFree(ptr:pointer);cdecl;external;
{ Internal memory free }
{ File system management functions }
(* Const before type ignored *)
function LoadFileData(fileName:Pchar; dataSize:Plongint):Pbyte;cdecl;external;
{ Load file data as byte array (read) }
procedure UnloadFileData(data:Pbyte);cdecl;external;
{ Unload file data allocated by LoadFileData() }
(* Const before type ignored *)
(* Const before type ignored *)
function SaveFileData(fileName:Pchar; data:pointer; dataSize:longint):Tbool;cdecl;external;
{ Save data to file from byte array (write), returns true on success }
(* Const before type ignored *)
(* Const before type ignored *)
function ExportDataAsCode(data:Pbyte; dataSize:longint; fileName:Pchar):Tbool;cdecl;external;
{ Export data to code (.h), returns true on success }
(* Const before type ignored *)
function LoadFileText(fileName:Pchar):Pchar;cdecl;external;
{ Load text data from file (read), returns a '\0' terminated string }
procedure UnloadFileText(text:Pchar);cdecl;external;
{ Unload file text data allocated by LoadFileText() }
(* Const before type ignored *)
(* Const before type ignored *)
function SaveFileText(fileName:Pchar; text:Pchar):Tbool;cdecl;external;
{ Save text data to file (write), string must be '\0' terminated, returns true on success }
{ File access custom callbacks }
{ WARNING: Callbacks setup is intended for advanced users }
procedure SetLoadFileDataCallback(callback:TLoadFileDataCallback);cdecl;external;
{ Set custom file binary data loader }
procedure SetSaveFileDataCallback(callback:TSaveFileDataCallback);cdecl;external;
{ Set custom file binary data saver }
procedure SetLoadFileTextCallback(callback:TLoadFileTextCallback);cdecl;external;
{ Set custom file text data loader }
procedure SetSaveFileTextCallback(callback:TSaveFileTextCallback);cdecl;external;
{ Set custom file text data saver }
(* Const before type ignored *)
(* Const before type ignored *)
function FileRename(fileName:Pchar; fileRename:Pchar):longint;cdecl;external;
{ Rename file (if exists), returns 0 on success }
(* Const before type ignored *)
function FileRemove(fileName:Pchar):longint;cdecl;external;
{ Remove file (if exists), returns 0 on success }
(* Const before type ignored *)
(* Const before type ignored *)
function FileCopy(srcPath:Pchar; dstPath:Pchar):longint;cdecl;external;
{ Copy file from one path to another, dstPath created if it doesn't exist, returns 0 on success }
(* Const before type ignored *)
(* Const before type ignored *)
function FileMove(srcPath:Pchar; dstPath:Pchar):longint;cdecl;external;
{ Move file from one directory to another, dstPath created if it doesn't exist, returns 0 on success }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function FileTextReplace(fileName:Pchar; search:Pchar; replacement:Pchar):longint;cdecl;external;
{ Replace text in an existing file, returns 0 on success }
(* Const before type ignored *)
(* Const before type ignored *)
function FileTextFindIndex(fileName:Pchar; search:Pchar):longint;cdecl;external;
{ Find text in existing file, returns -1 if index not found or index otherwise }
(* Const before type ignored *)
function FileExists(fileName:Pchar):Tbool;cdecl;external;
{ Check if file exists }
(* Const before type ignored *)
function DirectoryExists(dirPath:Pchar):Tbool;cdecl;external;
{ Check if directory path exists }
(* Const before type ignored *)
(* Const before type ignored *)
function IsFileExtension(fileName:Pchar; ext:Pchar):Tbool;cdecl;external;
{ Check file extension (recommended include point: .png, .wav) }
(* Const before type ignored *)
function IsFileHidden(filePath:Pchar):Tbool;cdecl;external;
{ Check if file path (file or directory) is hidden by OS }
(* Const before type ignored *)
function GetFileLength(fileName:Pchar):longint;cdecl;external;
{ Get file length in bytes (NOTE: GetFileSize() conflicts with windows.h) }
(* Const before type ignored *)
function GetFileModTime(fileName:Pchar):longint;cdecl;external;
{ Get file modification time (last write time) }
(* Const before type ignored *)
(* Const before type ignored *)
function GetFileExtension(fileName:Pchar):Pchar;cdecl;external;
{ Get pointer to extension for a filename string (includes dot: '.png') }
(* Const before type ignored *)
(* Const before type ignored *)
function GetFileName(filePath:Pchar):Pchar;cdecl;external;
{ Get pointer to filename for a path string }
(* Const before type ignored *)
(* Const before type ignored *)
function GetFileNameWithoutExt(filePath:Pchar):Pchar;cdecl;external;
{ Get filename string without extension (uses static string) }
(* Const before type ignored *)
(* Const before type ignored *)
function GetDirectoryPath(filePath:Pchar):Pchar;cdecl;external;
{ Get full path for a provided fileName with path (uses static string) }
(* Const before type ignored *)
(* Const before type ignored *)
function GetPrevDirectoryPath(dirPath:Pchar):Pchar;cdecl;external;
{ Get previous directory path for a provided path (uses static string) }
(* Const before type ignored *)
function GetWorkingDirectory:Pchar;cdecl;external;
{ Get current working directory (uses static string) }
(* Const before type ignored *)
function GetApplicationDirectory:Pchar;cdecl;external;
{ Get the directory of the running application (uses static string) }
(* Const before type ignored *)
function MakeDirectory(dirPath:Pchar):longint;cdecl;external;
{ Create directories (including full path requested), returns 0 on success }
(* Const before type ignored *)
function ChangeDirectory(dirPath:Pchar):longint;cdecl;external;
{ Change working directory, returns 0 on success }
(* Const before type ignored *)
function IsPathFile(path:Pchar):Tbool;cdecl;external;
{ Check if provided path points to a file }
(* Const before type ignored *)
function IsPathDirectory(path:Pchar):Tbool;cdecl;external;
{ Check if provided path points to a directory }
(* Const before type ignored *)
function IsPathAbsolute(path:Pchar):Tbool;cdecl;external;
{ Check if provided path is an absolute path }
(* Const before type ignored *)
function IsFileNameValid(fileName:Pchar):Tbool;cdecl;external;
{ Check if fileName is valid for the platform/OS }
(* Const before type ignored *)
function LoadDirectoryFiles(dirPath:Pchar):TFilePathList;cdecl;external;
{ Load directory filepaths, files and directories, no subdirs scan }
(* Const before type ignored *)
(* Const before type ignored *)
function LoadDirectoryFilesEx(basePath:Pchar; filter:Pchar; scanSubdirs:Tbool):TFilePathList;cdecl;external;
{ Load directory filepaths with extension filtering and subdir scan; some filters available: '*.*','FILES*','DIRS*' }
procedure UnloadDirectoryFiles(files:TFilePathList);cdecl;external;
{ Unload filepaths }
function IsFileDropped:Tbool;cdecl;external;
{ Check if file has been dropped into window }
function LoadDroppedFiles:TFilePathList;cdecl;external;
{ Load dropped filepaths }
procedure UnloadDroppedFiles(files:TFilePathList);cdecl;external;
{ Unload dropped filepaths }
(* Const before type ignored *)
function GetDirectoryFileCount(dirPath:Pchar):dword;cdecl;external;
{ Get the file count in a directory }
(* Const before type ignored *)
(* Const before type ignored *)
function GetDirectoryFileCountEx(basePath:Pchar; filter:Pchar; scanSubdirs:Tbool):dword;cdecl;external;
{ Get the file count in a directory with extension filtering and recursive directory scan. Use 'DIR' in the filter string to include directories in the result }
{ Compression/Encoding functionality }
(* Const before type ignored *)
function CompressData(data:Pbyte; dataSize:longint; compDataSize:Plongint):Pbyte;cdecl;external;
{ Compress data (DEFLATE algorithm), memory must be MemFree() }
(* Const before type ignored *)
function DecompressData(compData:Pbyte; compDataSize:longint; dataSize:Plongint):Pbyte;cdecl;external;
{ Decompress data (DEFLATE algorithm), memory must be MemFree() }
(* Const before type ignored *)
function EncodeDataBase64(data:Pbyte; dataSize:longint; outputSize:Plongint):Pchar;cdecl;external;
{ Encode data to Base64 string (includes NULL terminator), memory must be MemFree() }
(* Const before type ignored *)
function DecodeDataBase64(text:Pchar; outputSize:Plongint):Pbyte;cdecl;external;
{ Decode Base64 string (expected NULL terminated), memory must be MemFree() }
(* Const before type ignored *)
function ComputeCRC32(data:Pbyte; dataSize:longint):dword;cdecl;external;
{ Compute CRC32 hash code }
(* Const before type ignored *)
function ComputeMD5(data:Pbyte; dataSize:longint):Pdword;cdecl;external;
{ Compute MD5 hash code, returns static int[4] (16 bytes) }
(* Const before type ignored *)
function ComputeSHA1(data:Pbyte; dataSize:longint):Pdword;cdecl;external;
{ Compute SHA1 hash code, returns static int[5] (20 bytes) }
(* Const before type ignored *)
function ComputeSHA256(data:Pbyte; dataSize:longint):Pdword;cdecl;external;
{ Compute SHA256 hash code, returns static int[8] (32 bytes) }
{ Automation events functionality }
(* Const before type ignored *)
function LoadAutomationEventList(fileName:Pchar):TAutomationEventList;cdecl;external;
{ Load automation events list from file, NULL for empty list, capacity = MAX_AUTOMATION_EVENTS }
procedure UnloadAutomationEventList(list:TAutomationEventList);cdecl;external;
{ Unload automation events list from file }
(* Const before type ignored *)
function ExportAutomationEventList(list:TAutomationEventList; fileName:Pchar):Tbool;cdecl;external;
{ Export automation events list as text file }
procedure SetAutomationEventList(list:PAutomationEventList);cdecl;external;
{ Set automation event list to record to }
procedure SetAutomationEventBaseFrame(frame:longint);cdecl;external;
{ Set automation event internal base frame to start recording }
procedure StartAutomationEventRecording;cdecl;external;
{ Start recording automation events (AutomationEventList must be set) }
procedure StopAutomationEventRecording;cdecl;external;
{ Stop recording automation events }
procedure PlayAutomationEvent(event:TAutomationEvent);cdecl;external;
{ Play a recorded automation event }
{------------------------------------------------------------------------------------ }
{ Input Handling Functions (Module: core) }
{------------------------------------------------------------------------------------ }
{ Input-related functions: keyboard }
function IsKeyPressed(key:longint):Tbool;cdecl;external;
{ Check if key has been pressed once }
function IsKeyPressedRepeat(key:longint):Tbool;cdecl;external;
{ Check if key has been pressed again }
function IsKeyDown(key:longint):Tbool;cdecl;external;
{ Check if key is being pressed }
function IsKeyReleased(key:longint):Tbool;cdecl;external;
{ Check if key has been released once }
function IsKeyUp(key:longint):Tbool;cdecl;external;
{ Check if key is NOT being pressed }
function GetKeyPressed:longint;cdecl;external;
{ Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty }
function GetCharPressed:longint;cdecl;external;
{ Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty }
(* Const before type ignored *)
function GetKeyName(key:longint):Pchar;cdecl;external;
{ Get name of a QWERTY key on the current keyboard layout (eg returns string 'q' for KEY_A on an AZERTY keyboard) }
procedure SetExitKey(key:longint);cdecl;external;
{ Set a custom key to exit program (default is ESC) }
{ Input-related functions: gamepads }
function IsGamepadAvailable(gamepad:longint):Tbool;cdecl;external;
{ Check if gamepad is available }
(* Const before type ignored *)
function GetGamepadName(gamepad:longint):Pchar;cdecl;external;
{ Get gamepad internal name id }
function IsGamepadButtonPressed(gamepad:longint; button:longint):Tbool;cdecl;external;
{ Check if gamepad button has been pressed once }
function IsGamepadButtonDown(gamepad:longint; button:longint):Tbool;cdecl;external;
{ Check if gamepad button is being pressed }
function IsGamepadButtonReleased(gamepad:longint; button:longint):Tbool;cdecl;external;
{ Check if gamepad button has been released once }
function IsGamepadButtonUp(gamepad:longint; button:longint):Tbool;cdecl;external;
{ Check if gamepad button is NOT being pressed }
function GetGamepadButtonPressed:longint;cdecl;external;
{ Get the last gamepad button pressed }
function GetGamepadAxisCount(gamepad:longint):longint;cdecl;external;
{ Get axis count for a gamepad }
function GetGamepadAxisMovement(gamepad:longint; axis:longint):single;cdecl;external;
{ Get movement value for a gamepad axis }
(* Const before type ignored *)
function SetGamepadMappings(mappings:Pchar):longint;cdecl;external;
{ Set internal gamepad mappings (SDL_GameControllerDB) }
procedure SetGamepadVibration(gamepad:longint; leftMotor:single; rightMotor:single; duration:single);cdecl;external;
{ Set gamepad vibration for both motors (duration in seconds) }
{ Input-related functions: mouse }
function IsMouseButtonPressed(button:longint):Tbool;cdecl;external;
{ Check if mouse button has been pressed once }
function IsMouseButtonDown(button:longint):Tbool;cdecl;external;
{ Check if mouse button is being pressed }
function IsMouseButtonReleased(button:longint):Tbool;cdecl;external;
{ Check if mouse button has been released once }
function IsMouseButtonUp(button:longint):Tbool;cdecl;external;
{ Check if mouse button is NOT being pressed }
function GetMouseX:longint;cdecl;external;
{ Get mouse position X }
function GetMouseY:longint;cdecl;external;
{ Get mouse position Y }
function GetMousePosition:TVector2;cdecl;external;
{ Get mouse position XY }
function GetMouseDelta:TVector2;cdecl;external;
{ Get mouse delta between frames }
procedure SetMousePosition(x:longint; y:longint);cdecl;external;
{ Set mouse position XY }
procedure SetMouseOffset(offsetX:longint; offsetY:longint);cdecl;external;
{ Set mouse offset }
procedure SetMouseScale(scaleX:single; scaleY:single);cdecl;external;
{ Set mouse scaling }
function GetMouseWheelMove:single;cdecl;external;
{ Get mouse wheel movement for X or Y, whichever is larger }
function GetMouseWheelMoveV:TVector2;cdecl;external;
{ Get mouse wheel movement for both X and Y }
procedure SetMouseCursor(cursor:longint);cdecl;external;
{ Set mouse cursor }
{ Input-related functions: touch }
function GetTouchX:longint;cdecl;external;
{ Get touch position X for touch point 0 (relative to screen size) }
function GetTouchY:longint;cdecl;external;
{ Get touch position Y for touch point 0 (relative to screen size) }
function GetTouchPosition(index:longint):TVector2;cdecl;external;
{ Get touch position XY for a touch point index (relative to screen size) }
function GetTouchPointId(index:longint):longint;cdecl;external;
{ Get touch point identifier for provided index }
function GetTouchPointCount:longint;cdecl;external;
{ Get number of touch points }
{------------------------------------------------------------------------------------ }
{ Gestures and Touch Handling Functions (Module: rgestures) }
{------------------------------------------------------------------------------------ }
procedure SetGesturesEnabled(flags:dword);cdecl;external;
{ Enable a set of gestures using flags }
function IsGestureDetected(gesture:dword):Tbool;cdecl;external;
{ Check if gesture has been detected }
function GetGestureDetected:longint;cdecl;external;
{ Get latest detected gesture }
function GetGestureHoldDuration:single;cdecl;external;
{ Get gesture hold time in seconds }
function GetGestureDragVector:TVector2;cdecl;external;
{ Get gesture drag vector }
function GetGestureDragAngle:single;cdecl;external;
{ Get gesture drag angle }
function GetGesturePinchVector:TVector2;cdecl;external;
{ Get gesture pinch delta }
function GetGesturePinchAngle:single;cdecl;external;
{ Get gesture pinch angle }
{------------------------------------------------------------------------------------ }
{ Camera System Functions (Module: rcamera) }
{------------------------------------------------------------------------------------ }
procedure UpdateCamera(camera:PCamera; mode:longint);cdecl;external;
{ Update camera position for selected mode }
procedure UpdateCameraPro(camera:PCamera; movement:TVector3; rotation:TVector3; zoom:single);cdecl;external;
{ Update camera movement/rotation }
{------------------------------------------------------------------------------------ }
{ Basic Shapes Drawing Functions (Module: shapes) }
{------------------------------------------------------------------------------------ }
{ Set texture and rectangle to be used on shapes drawing }
{ NOTE: It can be useful when using basic shapes and one single font, }
{ defining a font char white rectangle would allow drawing everything in a single draw call }
procedure SetShapesTexture(texture:TTexture2D; rec:TRectangle);cdecl;external;
{ Set texture and rectangle to be used on shapes drawing }
function GetShapesTexture:TTexture2D;cdecl;external;
{ Get texture that is used for shapes drawing }
function GetShapesTextureRectangle:TRectangle;cdecl;external;
{ Get texture source rectangle that is used for shapes drawing }
{ Basic shapes drawing functions }
procedure DrawPixel(posX:longint; posY:longint; color:TColor);cdecl;external;
{ Draw a pixel using geometry [Can be slow, use with care] }
procedure DrawPixelV(position:TVector2; color:TColor);cdecl;external;
{ Draw a pixel using geometry (Vector version) [Can be slow, use with care] }
procedure DrawLine(startPosX:longint; startPosY:longint; endPosX:longint; endPosY:longint; color:TColor);cdecl;external;
{ Draw a line }
procedure DrawLineV(startPos:TVector2; endPos:TVector2; color:TColor);cdecl;external;
{ Draw a line (using gl lines) }
procedure DrawLineEx(startPos:TVector2; endPos:TVector2; thick:single; color:TColor);cdecl;external;
{ Draw a line (using triangles/quads) }
(* Const before type ignored *)
procedure DrawLineStrip(points:PVector2; pointCount:longint; color:TColor);cdecl;external;
{ Draw lines sequence (using gl lines) }
procedure DrawLineBezier(startPos:TVector2; endPos:TVector2; thick:single; color:TColor);cdecl;external;
{ Draw line segment cubic-bezier in-out interpolation }
procedure DrawLineDashed(startPos:TVector2; endPos:TVector2; dashSize:longint; spaceSize:longint; color:TColor);cdecl;external;
{ Draw a dashed line }
procedure DrawTriangle(v1:TVector2; v2:TVector2; v3:TVector2; color:TColor);cdecl;external;
{ Draw a color-filled triangle, counter-clockwise vertex order }
procedure DrawTriangleGradient(v1:TVector2; v2:TVector2; v3:TVector2; c1:TColor; c2:TColor; 
            c3:TColor);cdecl;external;
{ Draw triangle with interpolated colors, counter-clockwise vertex/color order }
procedure DrawTriangleLines(v1:TVector2; v2:TVector2; v3:TVector2; color:TColor);cdecl;external;
{ Draw triangle outline, counter-clockwise vertex order }
procedure DrawTriangleLinesEx(v1:TVector2; v2:TVector2; v3:TVector2; thick:single; color:TColor);cdecl;external;
{ Draw triangle outline with line thickness, counter-clockwise vertex order }
(* Const before type ignored *)
procedure DrawTriangleFan(points:PVector2; pointCount:longint; color:TColor);cdecl;external;
{ Draw a triangle fan defined by points (first vertex is the center) }
(* Const before type ignored *)
procedure DrawTriangleStrip(points:PVector2; pointCount:longint; color:TColor);cdecl;external;
{ Draw a triangle strip defined by points }
procedure DrawRectangle(posX:longint; posY:longint; width:longint; height:longint; color:TColor);cdecl;external;
{ Draw a color-filled rectangle }
procedure DrawRectangleV(position:TVector2; size:TVector2; color:TColor);cdecl;external;
{ Draw a color-filled rectangle (Vector version) }
procedure DrawRectangleRec(rec:TRectangle; color:TColor);cdecl;external;
{ Draw a color-filled rectangle }
procedure DrawRectanglePro(rec:TRectangle; origin:TVector2; rotation:single; color:TColor);cdecl;external;
{ Draw a color-filled rectangle with pro parameters }
procedure DrawRectangleGradientV(posX:longint; posY:longint; width:longint; height:longint; top:TColor; 
            bottom:TColor);cdecl;external;
{ Draw a vertical-gradient-filled rectangle }
procedure DrawRectangleGradientH(posX:longint; posY:longint; width:longint; height:longint; left:TColor; 
            right:TColor);cdecl;external;
{ Draw a horizontal-gradient-filled rectangle }
procedure DrawRectangleGradientEx(rec:TRectangle; col1:TColor; col2:TColor; col3:TColor; col4:TColor);cdecl;external;
{ Draw a gradient-filled rectangle with custom vertex colors, counter-clockwise color order }
procedure DrawRectangleLines(posX:longint; posY:longint; width:longint; height:longint; color:TColor);cdecl;external;
{ Draw rectangle outline }
procedure DrawRectangleLinesEx(rec:TRectangle; thick:single; color:TColor);cdecl;external;
{ Draw rectangle outline with line thickness }
procedure DrawRectangleRounded(rec:TRectangle; roundness:single; segments:longint; color:TColor);cdecl;external;
{ Draw rectangle with rounded edges }
procedure DrawRectangleRoundedLines(rec:TRectangle; roundness:single; segments:longint; color:TColor);cdecl;external;
{ Draw rectangle lines with rounded edges }
procedure DrawRectangleRoundedLinesEx(rec:TRectangle; roundness:single; segments:longint; thick:single; color:TColor);cdecl;external;
{ Draw rectangle lines with rounded edges outline and line thickness }
procedure DrawPoly(center:TVector2; sides:longint; radius:single; rotation:single; color:TColor);cdecl;external;
{ Draw a polygon of n sides }
procedure DrawPolyLines(center:TVector2; sides:longint; radius:single; rotation:single; color:TColor);cdecl;external;
{ Draw a polygon outline of n sides }
procedure DrawPolyLinesEx(center:TVector2; sides:longint; radius:single; rotation:single; thick:single; 
            color:TColor);cdecl;external;
{ Draw a polygon outline of n sides with line thickness }
procedure DrawCircle(centerX:longint; centerY:longint; radius:single; color:TColor);cdecl;external;
{ Draw a color-filled circle }
procedure DrawCircleV(center:TVector2; radius:single; color:TColor);cdecl;external;
{ Draw a color-filled circle (Vector version) }
procedure DrawCircleGradient(center:TVector2; radius:single; inner:TColor; outer:TColor);cdecl;external;
{ Draw a gradient-filled circle }
procedure DrawCircleSector(center:TVector2; radius:single; startAngle:single; endAngle:single; segments:longint; 
            color:TColor);cdecl;external;
{ Draw a piece of a circle }
procedure DrawCircleSectorLines(center:TVector2; radius:single; startAngle:single; endAngle:single; segments:longint; 
            color:TColor);cdecl;external;
{ Draw circle sector outline }
procedure DrawCircleSectorLinesEx(center:TVector2; radius:single; startAngle:single; endAngle:single; segments:longint; 
            thick:single; color:TColor);cdecl;external;
{ Draw circle sector outline with thickness }
procedure DrawCircleLines(centerX:longint; centerY:longint; radius:single; color:TColor);cdecl;external;
{ Draw circle outline }
procedure DrawCircleLinesV(center:TVector2; radius:single; color:TColor);cdecl;external;
{ Draw circle outline (Vector version) }
procedure DrawCircleLinesEx(center:TVector2; radius:single; thick:single; color:TColor);cdecl;external;
{ Draw circle outline with line thickness }
procedure DrawEllipse(centerX:longint; centerY:longint; radiusH:single; radiusV:single; color:TColor);cdecl;external;
{ Draw ellipse }
procedure DrawEllipseV(center:TVector2; radiusH:single; radiusV:single; color:TColor);cdecl;external;
{ Draw ellipse (Vector version) }
procedure DrawEllipseLines(centerX:longint; centerY:longint; radiusH:single; radiusV:single; color:TColor);cdecl;external;
{ Draw ellipse outline }
procedure DrawEllipseLinesV(center:TVector2; radiusH:single; radiusV:single; color:TColor);cdecl;external;
{ Draw ellipse outline (Vector version) }
procedure DrawEllipseLinesEx(center:TVector2; radiusH:single; radiusV:single; thick:single; color:TColor);cdecl;external;
{ Draw ellipse outline with line thickness }
procedure DrawRing(center:TVector2; innerRadius:single; outerRadius:single; startAngle:single; endAngle:single; 
            segments:longint; color:TColor);cdecl;external;
{ Draw ring }
procedure DrawRingLines(center:TVector2; innerRadius:single; outerRadius:single; startAngle:single; endAngle:single; 
            segments:longint; color:TColor);cdecl;external;
{ Draw ring outline }
procedure DrawRingLinesEx(center:TVector2; innerRadius:single; outerRadius:single; startAngle:single; endAngle:single; 
            segments:longint; thick:single; color:TColor);cdecl;external;
{ Draw ring outline with line thickness }
{ Splines drawing functions }
(* Const before type ignored *)
procedure DrawSplineLinear(points:PVector2; pointCount:longint; thick:single; color:TColor);cdecl;external;
{ Draw spline: Linear, minimum 2 points }
(* Const before type ignored *)
procedure DrawSplineBasis(points:PVector2; pointCount:longint; thick:single; color:TColor);cdecl;external;
{ Draw spline: B-Spline, minimum 4 points }
(* Const before type ignored *)
procedure DrawSplineCatmullRom(points:PVector2; pointCount:longint; thick:single; color:TColor);cdecl;external;
{ Draw spline: Catmull-Rom, minimum 4 points }
(* Const before type ignored *)
procedure DrawSplineBezierQuadratic(points:PVector2; pointCount:longint; thick:single; color:TColor);cdecl;external;
{ Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...] }
(* Const before type ignored *)
procedure DrawSplineBezierCubic(points:PVector2; pointCount:longint; thick:single; color:TColor);cdecl;external;
{ Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...] }
procedure DrawSplineSegmentLinear(p1:TVector2; p2:TVector2; thick:single; color:TColor);cdecl;external;
{ Draw spline segment: Linear, 2 points }
procedure DrawSplineSegmentBasis(p1:TVector2; p2:TVector2; p3:TVector2; p4:TVector2; thick:single; 
            color:TColor);cdecl;external;
{ Draw spline segment: B-Spline, 4 points }
procedure DrawSplineSegmentCatmullRom(p1:TVector2; p2:TVector2; p3:TVector2; p4:TVector2; thick:single; 
            color:TColor);cdecl;external;
{ Draw spline segment: Catmull-Rom, 4 points }
procedure DrawSplineSegmentBezierQuadratic(p1:TVector2; c2:TVector2; p3:TVector2; thick:single; color:TColor);cdecl;external;
{ Draw spline segment: Quadratic Bezier, 2 points, 1 control point }
procedure DrawSplineSegmentBezierCubic(p1:TVector2; c2:TVector2; c3:TVector2; p4:TVector2; thick:single; 
            color:TColor);cdecl;external;
{ Draw spline segment: Cubic Bezier, 2 points, 2 control points }
{ Spline segment point evaluation functions, for a provided t [0.0f .. 1.0f] }
function GetSplinePointLinear(startPos:TVector2; endPos:TVector2; t:single):TVector2;cdecl;external;
{ Get (evaluate) spline point: Linear }
function GetSplinePointBasis(p1:TVector2; p2:TVector2; p3:TVector2; p4:TVector2; t:single):TVector2;cdecl;external;
{ Get (evaluate) spline point: B-Spline }
function GetSplinePointCatmullRom(p1:TVector2; p2:TVector2; p3:TVector2; p4:TVector2; t:single):TVector2;cdecl;external;
{ Get (evaluate) spline point: Catmull-Rom }
function GetSplinePointBezierQuadratic(p1:TVector2; c2:TVector2; p3:TVector2; t:single):TVector2;cdecl;external;
{ Get (evaluate) spline point: Quadratic Bezier }
function GetSplinePointBezierCubic(p1:TVector2; c2:TVector2; c3:TVector2; p4:TVector2; t:single):TVector2;cdecl;external;
{ Get (evaluate) spline point: Cubic Bezier }
{ Basic shapes collision detection functions }
function CheckCollisionRecs(rec1:TRectangle; rec2:TRectangle):Tbool;cdecl;external;
{ Check collision between two rectangles }
function CheckCollisionCircles(center1:TVector2; radius1:single; center2:TVector2; radius2:single):Tbool;cdecl;external;
{ Check collision between two circles }
function CheckCollisionCircleRec(center:TVector2; radius:single; rec:TRectangle):Tbool;cdecl;external;
{ Check collision between circle and rectangle }
function CheckCollisionCircleLine(center:TVector2; radius:single; p1:TVector2; p2:TVector2):Tbool;cdecl;external;
{ Check if circle collides with a line created between two points [p1] and [p2] }
function CheckCollisionPointRec(point:TVector2; rec:TRectangle):Tbool;cdecl;external;
{ Check if point is inside rectangle }
function CheckCollisionPointCircle(point:TVector2; center:TVector2; radius:single):Tbool;cdecl;external;
{ Check if point is inside circle }
function CheckCollisionPointTriangle(point:TVector2; p1:TVector2; p2:TVector2; p3:TVector2):Tbool;cdecl;external;
{ Check if point is inside a triangle }
function CheckCollisionPointLine(point:TVector2; p1:TVector2; p2:TVector2; threshold:longint):Tbool;cdecl;external;
{ Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold] }
(* Const before type ignored *)
function CheckCollisionPointPoly(point:TVector2; points:PVector2; pointCount:longint):Tbool;cdecl;external;
{ Check if point is within a polygon described by array of vertices }
function CheckCollisionLines(startPos1:TVector2; endPos1:TVector2; startPos2:TVector2; endPos2:TVector2; collisionPoint:PVector2):Tbool;cdecl;external;
{ Check the collision between two lines defined by two points each, returns collision point by reference }
function GetCollisionRec(rec1:TRectangle; rec2:TRectangle):TRectangle;cdecl;external;
{ Get collision rectangle for two rectangles collision }
{------------------------------------------------------------------------------------ }
{ Texture Loading and Drawing Functions (Module: textures) }
{------------------------------------------------------------------------------------ }
{ Image loading functions }
{ NOTE: These functions do not require GPU access }
(* Const before type ignored *)
function LoadImage(fileName:Pchar):TImage;cdecl;external;
{ Load image from file into CPU memory (RAM) }
(* Const before type ignored *)
function LoadImageRaw(fileName:Pchar; width:longint; height:longint; format:longint; headerSize:longint):TImage;cdecl;external;
{ Load image from RAW file data }
(* Const before type ignored *)
function LoadImageAnim(fileName:Pchar; frames:Plongint):TImage;cdecl;external;
{ Load image sequence from file (frames appended to image.data) }
(* Const before type ignored *)
(* Const before type ignored *)
function LoadImageAnimFromMemory(fileType:Pchar; fileData:Pbyte; dataSize:longint; frames:Plongint):TImage;cdecl;external;
{ Load image sequence from memory buffer }
(* Const before type ignored *)
(* Const before type ignored *)
function LoadImageFromMemory(fileType:Pchar; fileData:Pbyte; dataSize:longint):TImage;cdecl;external;
{ Load image from memory buffer, fileType refers to extension: i.e. '.png' }
function LoadImageFromTexture(texture:TTexture2D):TImage;cdecl;external;
{ Load image from GPU texture data }
function LoadImageFromScreen:TImage;cdecl;external;
{ Load image from screen buffer (screenshot) }
function IsImageValid(image:TImage):Tbool;cdecl;external;
{ Check if an image is valid (data and parameters) }
procedure UnloadImage(image:TImage);cdecl;external;
{ Unload image from CPU memory (RAM) }
(* Const before type ignored *)
function ExportImage(image:TImage; fileName:Pchar):Tbool;cdecl;external;
{ Export image data to file, returns true on success }
(* Const before type ignored *)
function ExportImageToMemory(image:TImage; fileType:Pchar; fileSize:Plongint):Pbyte;cdecl;external;
{ Export image to memory buffer, memory must be MemFree() }
(* Const before type ignored *)
function ExportImageAsCode(image:TImage; fileName:Pchar):Tbool;cdecl;external;
{ Export image as code file defining an array of bytes, returns true on success }
{ Image generation functions }
function GenImageColor(width:longint; height:longint; color:TColor):TImage;cdecl;external;
{ Generate image: plain color }
function GenImageGradientLinear(width:longint; height:longint; direction:longint; start:TColor; end:TColor):TImage;cdecl;external;
{ Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient }
function GenImageGradientRadial(width:longint; height:longint; density:single; inner:TColor; outer:TColor):TImage;cdecl;external;
{ Generate image: radial gradient }
function GenImageGradientSquare(width:longint; height:longint; density:single; inner:TColor; outer:TColor):TImage;cdecl;external;
{ Generate image: square gradient }
function GenImageChecked(width:longint; height:longint; checksX:longint; checksY:longint; col1:TColor; 
           col2:TColor):TImage;cdecl;external;
{ Generate image: checked }
function GenImageWhiteNoise(width:longint; height:longint; factor:single):TImage;cdecl;external;
{ Generate image: white noise }
function GenImagePerlinNoise(width:longint; height:longint; offsetX:longint; offsetY:longint; scale:single):TImage;cdecl;external;
{ Generate image: perlin noise }
function GenImageCellular(width:longint; height:longint; tileSize:longint):TImage;cdecl;external;
{ Generate image: cellular algorithm, bigger tileSize means bigger cells }
(* Const before type ignored *)
function GenImageText(width:longint; height:longint; text:Pchar):TImage;cdecl;external;
{ Generate image: grayscale image from text data }
{ Image manipulation functions }
function ImageCopy(image:TImage):TImage;cdecl;external;
{ Create an image duplicate (useful for transformations) }
function ImageFromImage(image:TImage; rec:TRectangle):TImage;cdecl;external;
{ Create an image from another image piece }
function ImageFromChannel(image:TImage; selectedChannel:longint):TImage;cdecl;external;
{ Create an image from a selected channel of another image (GRAYSCALE) }
(* Const before type ignored *)
function ImageText(text:Pchar; fontSize:longint; color:TColor):TImage;cdecl;external;
{ Create an image from text (default font) }
(* Const before type ignored *)
function ImageTextEx(font:TFont; text:Pchar; fontSize:single; spacing:single; tint:TColor):TImage;cdecl;external;
{ Create an image from text (custom sprite font) }
procedure ImageFormat(image:PImage; newFormat:longint);cdecl;external;
{ Convert image data to desired format }
procedure ImageToPOT(image:PImage; fill:TColor);cdecl;external;
{ Convert image to POT (power-of-two) }
procedure ImageCrop(image:PImage; crop:TRectangle);cdecl;external;
{ Crop an image to a defined rectangle }
procedure ImageAlphaCrop(image:PImage; threshold:single);cdecl;external;
{ Crop image depending on alpha value }
procedure ImageAlphaClear(image:PImage; color:TColor; threshold:single);cdecl;external;
{ Clear alpha channel to desired color }
procedure ImageAlphaMask(image:PImage; alphaMask:TImage);cdecl;external;
{ Apply alpha mask to image }
procedure ImageAlphaPremultiply(image:PImage);cdecl;external;
{ Premultiply alpha channel }
procedure ImageBlurGaussian(image:PImage; blurSize:longint);cdecl;external;
{ Apply Gaussian blur using a box blur approximation }
(* Const before type ignored *)
procedure ImageKernelConvolution(image:PImage; kernel:Psingle; kernelSize:longint);cdecl;external;
{ Apply custom square convolution kernel to image }
procedure ImageResize(image:PImage; newWidth:longint; newHeight:longint);cdecl;external;
{ Resize image (Bicubic scaling algorithm) }
procedure ImageResizeNN(image:PImage; newWidth:longint; newHeight:longint);cdecl;external;
{ Resize image (Nearest-Neighbor scaling algorithm) }
procedure ImageResizeCanvas(image:PImage; newWidth:longint; newHeight:longint; offsetX:longint; offsetY:longint; 
            fill:TColor);cdecl;external;
{ Resize canvas and fill with color }
procedure ImageMipmaps(image:PImage);cdecl;external;
{ Compute all mipmap levels for a provided image }
procedure ImageDither(image:PImage; rBpp:longint; gBpp:longint; bBpp:longint; aBpp:longint);cdecl;external;
{ Dither image data to 16bpp or lower (Floyd-Steinberg dithering) }
procedure ImageFlipVertical(image:PImage);cdecl;external;
{ Flip image vertically }
procedure ImageFlipHorizontal(image:PImage);cdecl;external;
{ Flip image horizontally }
procedure ImageRotate(image:PImage; degrees:longint);cdecl;external;
{ Rotate image by input angle in degrees (-359 to 359) }
procedure ImageRotateCW(image:PImage);cdecl;external;
{ Rotate image clockwise 90deg }
procedure ImageRotateCCW(image:PImage);cdecl;external;
{ Rotate image counter-clockwise 90deg }
procedure ImageColorTint(image:PImage; color:TColor);cdecl;external;
{ Modify image color: tint }
procedure ImageColorInvert(image:PImage);cdecl;external;
{ Modify image color: invert }
procedure ImageColorGrayscale(image:PImage);cdecl;external;
{ Modify image color: grayscale }
procedure ImageColorContrast(image:PImage; contrast:longint);cdecl;external;
{ Modify image color: contrast (-100 to 100) }
procedure ImageColorBrightness(image:PImage; brightness:longint);cdecl;external;
{ Modify image color: brightness (-255 to 255) }
procedure ImageColorReplace(image:PImage; color:TColor; replace:TColor);cdecl;external;
{ Modify image color: replace color }
function LoadImageColors(image:TImage):PColor;cdecl;external;
{ Load color data from image as a Color array (RGBA - 32bit) }
function LoadImagePalette(image:TImage; maxPaletteSize:longint; colorCount:Plongint):PColor;cdecl;external;
{ Load colors palette from image as a Color array (RGBA - 32bit) }
procedure UnloadImageColors(colors:PColor);cdecl;external;
{ Unload color data loaded with LoadImageColors() }
procedure UnloadImagePalette(colors:PColor);cdecl;external;
{ Unload colors palette loaded with LoadImagePalette() }
function GetImageAlphaBorder(image:TImage; threshold:single):TRectangle;cdecl;external;
{ Get image alpha border rectangle }
function GetImageColor(image:TImage; x:longint; y:longint):TColor;cdecl;external;
{ Get image pixel color at (x, y) position }
{ Image drawing functions }
{ NOTE: Image software-rendering functions (CPU) }
procedure ImageClearBackground(dst:PImage; color:TColor);cdecl;external;
{ Clear image background with provided color }
procedure ImageDrawPixel(dst:PImage; posX:longint; posY:longint; color:TColor);cdecl;external;
{ Draw pixel within an image }
procedure ImageDrawPixelV(dst:PImage; position:TVector2; color:TColor);cdecl;external;
{ Draw pixel within an image (Vector version) }
procedure ImageDrawLine(dst:PImage; startPosX:longint; startPosY:longint; endPosX:longint; endPosY:longint; 
            color:TColor);cdecl;external;
{ Draw line within an image }
procedure ImageDrawLineV(dst:PImage; start:TVector2; end:TVector2; color:TColor);cdecl;external;
{ Draw line within an image (Vector version) }
procedure ImageDrawLineEx(dst:PImage; start:TVector2; end:TVector2; thick:longint; color:TColor);cdecl;external;
{ Draw a line defining thickness within an image }
(* Const before type ignored *)
procedure ImageDrawLineStrip(dst:PImage; points:PVector2; pointCount:longint; color:TColor);cdecl;external;
{ Draw a lines sequence within an image }
procedure ImageDrawTriangle(dst:PImage; v1:TVector2; v2:TVector2; v3:TVector2; color:TColor);cdecl;external;
{ Draw triangle within an image }
procedure ImageDrawTriangleGradient(dst:PImage; v1:TVector2; v2:TVector2; v3:TVector2; c1:TColor; 
            c2:TColor; c3:TColor);cdecl;external;
{ Draw triangle with interpolated colors within an image }
procedure ImageDrawTriangleLines(dst:PImage; v1:TVector2; v2:TVector2; v3:TVector2; color:TColor);cdecl;external;
{ Draw triangle outline within an image }
(* Const before type ignored *)
procedure ImageDrawTriangleFan(dst:PImage; points:PVector2; pointCount:longint; color:TColor);cdecl;external;
{ Draw a triangle fan defined by points within an image (first vertex is the center) }
(* Const before type ignored *)
procedure ImageDrawTriangleStrip(dst:PImage; points:PVector2; pointCount:longint; color:TColor);cdecl;external;
{ Draw a triangle strip defined by points within an image }
procedure ImageDrawRectangle(dst:PImage; posX:longint; posY:longint; width:longint; height:longint; 
            color:TColor);cdecl;external;
{ Draw rectangle within an image }
procedure ImageDrawRectangleV(dst:PImage; position:TVector2; size:TVector2; color:TColor);cdecl;external;
{ Draw rectangle within an image (Vector version) }
procedure ImageDrawRectangleRec(dst:PImage; rec:TRectangle; color:TColor);cdecl;external;
{ Draw rectangle within an image }
procedure ImageDrawRectanglePro(dst:PImage; rec:TRectangle; origin:TVector2; rotation:single; color:TColor);cdecl;external;
{ Draw a color-filled rectangle with pro parameters within and image }
procedure ImageDrawRectangleLines(dst:PImage; posX:longint; posY:longint; width:longint; height:longint; 
            color:TColor);cdecl;external;
{ Draw rectangle lines within an image }
procedure ImageDrawRectangleLinesEx(dst:PImage; rec:TRectangle; thick:longint; color:TColor);cdecl;external;
{ Draw rectangle lines within an image with line thickness }
procedure ImageDrawRectangleGradientEx(dst:PImage; rec:TRectangle; col1:TColor; col2:TColor; col3:TColor; 
            col4:TColor);cdecl;external;
{ Draw rectangle with gradient colors within an image, counter-clockwise color order }
procedure ImageDrawCircle(dst:PImage; centerX:longint; centerY:longint; radius:longint; color:TColor);cdecl;external;
{ Draw a filled circle within an image }
procedure ImageDrawCircleV(dst:PImage; center:TVector2; radius:longint; color:TColor);cdecl;external;
{ Draw a filled circle within an image (Vector version) }
procedure ImageDrawCircleLines(dst:PImage; centerX:longint; centerY:longint; radius:longint; color:TColor);cdecl;external;
{ Draw circle outline within an image }
procedure ImageDrawCircleLinesV(dst:PImage; center:TVector2; radius:longint; color:TColor);cdecl;external;
{ Draw circle outline within an image (Vector version) }
procedure ImageDrawCircleGradient(dst:PImage; center:TVector2; radius:single; inner:TColor; outer:TColor);cdecl;external;
{ Draw a gradient-filled circle within an image }
procedure ImageDrawImage(dst:PImage; src:TImage; posX:longint; posY:longint; tint:TColor);cdecl;external;
{ Draw an image within an image }
procedure ImageDrawImageEx(dst:PImage; src:TImage; position:TVector2; rotation:single; scale:single; 
            tint:TColor);cdecl;external;
{ Draw an image with scaling and rotation within an image }
procedure ImageDrawImageRec(dst:PImage; src:TImage; srcRec:TRectangle; position:TVector2; tint:TColor);cdecl;external;
{ Draw a part of an image defined by a rectangle within an image }
procedure ImageDrawImagePro(dst:PImage; src:TImage; srcRec:TRectangle; dstRec:TRectangle; origin:TVector2; 
            rotation:single; tint:TColor);cdecl;external;
{ Draw a part of an image defined by a rectangle into destination rectangle, with scaling and rotation, within an image }
(* Const before type ignored *)
procedure ImageDrawText(dst:PImage; text:Pchar; posX:longint; posY:longint; fontSize:longint; 
            color:TColor);cdecl;external;
{ Draw text (using default font) within an image (destination) }
(* Const before type ignored *)
procedure ImageDrawTextEx(dst:PImage; font:TFont; text:Pchar; position:TVector2; fontSize:single; 
            spacing:single; tint:TColor);cdecl;external;
{ Draw text (custom sprite font) within an image (destination) }
(* Const before type ignored *)
procedure ImageDrawTextPro(dst:PImage; font:TFont; text:Pchar; position:TVector2; origin:TVector2; 
            rotation:single; fontSize:single; spacing:single; tint:TColor);cdecl;external;
{ Draw text using Font and pro parameters (rotation) }
{ Texture loading functions }
{ NOTE: These functions require GPU access }
(* Const before type ignored *)
function LoadTexture(fileName:Pchar):TTexture2D;cdecl;external;
{ Load texture from file into GPU memory (VRAM) }
function LoadTextureFromImage(image:TImage):TTexture2D;cdecl;external;
{ Load texture from image data }
function LoadTextureCubemap(image:TImage; layout:longint):TTextureCubemap;cdecl;external;
{ Load cubemap from image, multiple image cubemap layouts supported }
function LoadRenderTexture(width:longint; height:longint):TRenderTexture2D;cdecl;external;
{ Load texture for rendering (framebuffer) }
function LoadRenderTextureEx(width:longint; height:longint; format:longint):TRenderTexture2D;cdecl;external;
{ Load texture for rendering (framebuffer), with specific format }
function IsTextureValid(texture:TTexture2D):Tbool;cdecl;external;
{ Check if texture is valid (loaded in GPU) }
procedure UnloadTexture(texture:TTexture2D);cdecl;external;
{ Unload texture from GPU memory (VRAM) }
function IsRenderTextureValid(target:TRenderTexture2D):Tbool;cdecl;external;
{ Check if render texture is valid (loaded in GPU) }
procedure UnloadRenderTexture(target:TRenderTexture2D);cdecl;external;
{ Unload render texture from GPU memory (VRAM) }
(* Const before type ignored *)
procedure UpdateTexture(texture:TTexture2D; pixels:pointer);cdecl;external;
{ Update GPU texture with new data (pixels should be able to fill texture) }
(* Const before type ignored *)
procedure UpdateTextureRec(texture:TTexture2D; rec:TRectangle; pixels:pointer);cdecl;external;
{ Update GPU texture rectangle with new data (pixels and rec should fit in texture) }
{ Texture configuration functions }
procedure GenTextureMipmaps(texture:PTexture2D);cdecl;external;
{ Generate GPU mipmaps for a texture }
procedure SetTextureFilter(texture:TTexture2D; filter:longint);cdecl;external;
{ Set texture scaling filter mode }
procedure SetTextureWrap(texture:TTexture2D; wrap:longint);cdecl;external;
{ Set texture wrapping mode }
{ Texture drawing functions }
procedure DrawTexture(texture:TTexture2D; posX:longint; posY:longint; tint:TColor);cdecl;external;
{ Draw a Texture2D }
procedure DrawTextureV(texture:TTexture2D; position:TVector2; tint:TColor);cdecl;external;
{ Draw a Texture2D with position defined as Vector2 }
procedure DrawTextureEx(texture:TTexture2D; position:TVector2; rotation:single; scale:single; tint:TColor);cdecl;external;
{ Draw a Texture2D with rotation and scale }
procedure DrawTextureRec(texture:TTexture2D; rec:TRectangle; position:TVector2; tint:TColor);cdecl;external;
{ Draw a part of a texture defined by a rectangle }
procedure DrawTexturePro(texture:TTexture2D; srcrec:TRectangle; dstrec:TRectangle; origin:TVector2; rotation:single; 
            tint:TColor);cdecl;external;
{ Draw a part of a texture defined by a source rectangle to destination rectangle, with scaling and rotation }
procedure DrawTextureNPatch(texture:TTexture2D; nPatchInfo:TNPatchInfo; dstrec:TRectangle; origin:TVector2; rotation:single; 
            tint:TColor);cdecl;external;
{ Draw a texture (or part of it) that stretches or shrinks nicely }
{ Color/pixel related functions }
function ColorIsEqual(col1:TColor; col2:TColor):Tbool;cdecl;external;
{ Check if two colors are equal }
function Fade(color:TColor; alpha:single):TColor;cdecl;external;
{ Get color with alpha applied, alpha goes from 0.0f to 1.0f }
function ColorToInt(color:TColor):longint;cdecl;external;
{ Get hexadecimal value for a Color (0xRRGGBBAA) }
function ColorNormalize(color:TColor):TVector4;cdecl;external;
{ Get Color normalized as float [0..1] }
function ColorFromNormalized(normalized:TVector4):TColor;cdecl;external;
{ Get Color from normalized values [0..1] }
function ColorToHSV(color:TColor):TVector3;cdecl;external;
{ Get HSV values for a Color, hue [0..360], saturation/value [0..1] }
function ColorFromHSV(hue:single; saturation:single; value:single):TColor;cdecl;external;
{ Get a Color from HSV values, hue [0..360], saturation/value [0..1] }
function ColorTint(color:TColor; tint:TColor):TColor;cdecl;external;
{ Get color multiplied with another color }
function ColorBrightness(color:TColor; factor:single):TColor;cdecl;external;
{ Get color with brightness correction, brightness factor goes from -1.0f to 1.0f }
function ColorContrast(color:TColor; contrast:single):TColor;cdecl;external;
{ Get color with contrast correction, contrast values between -1.0f and 1.0f }
function ColorAlpha(color:TColor; alpha:single):TColor;cdecl;external;
{ Get color with alpha applied, alpha goes from 0.0f to 1.0f }
function ColorAlphaBlend(dst:TColor; src:TColor; tint:TColor):TColor;cdecl;external;
{ Get src alpha-blended into dst color with tint }
function ColorLerp(color1:TColor; color2:TColor; factor:single):TColor;cdecl;external;
{ Get color lerp interpolation between two colors, factor [0.0f..1.0f] }
function GetColor(hexValue:dword):TColor;cdecl;external;
{ Get Color structure from hexadecimal value }
(* Const before type ignored *)
function GetPixelColor(srcPtr:pointer; format:longint):TColor;cdecl;external;
{ Get Color from a source pixel pointer of certain format }
procedure SetPixelColor(dstPtr:pointer; color:TColor; format:longint);cdecl;external;
{ Set color formatted into destination pixel pointer }
function GetPixelDataSize(width:longint; height:longint; format:longint):longint;cdecl;external;
{ Get pixel data size in bytes for certain format }
{------------------------------------------------------------------------------------ }
{ Font Loading and Text Drawing Functions (Module: text) }
{------------------------------------------------------------------------------------ }
{ Font loading/unloading functions }
function GetFontDefault:TFont;cdecl;external;
{ Get the default Font }
(* Const before type ignored *)
function LoadFont(fileName:Pchar):TFont;cdecl;external;
{ Load font from file into GPU memory (VRAM) }
(* Const before type ignored *)
(* Const before type ignored *)
function LoadFontEx(fileName:Pchar; fontSize:longint; codepoints:Plongint; codepointCount:longint):TFont;cdecl;external;
{ Load font from file with defined codepoints and generation size, use NULL for codepoints and 0 for codepointCount to load the default character set, font size is provided in pixels height }
function LoadFontFromImage(image:TImage; key:TColor; firstChar:longint):TFont;cdecl;external;
{ Load font from Image (XNA style) }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function LoadFontFromMemory(fileType:Pchar; fileData:Pbyte; dataSize:longint; fontSize:longint; codepoints:Plongint; 
           codepointCount:longint):TFont;cdecl;external;
{ Load font from memory buffer, fileType refers to extension: i.e. '.ttf' }
function IsFontValid(font:TFont):Tbool;cdecl;external;
{ Check if font is valid (font data loaded, WARNING: GPU texture not checked) }
(* Const before type ignored *)
(* Const before type ignored *)
function LoadFontData(fileData:Pbyte; dataSize:longint; fontSize:longint; codepoints:Plongint; codepointCount:longint; 
           _type:longint; glyphCount:Plongint):PGlyphInfo;cdecl;external;
{ Load font data for further use }
(* Const before type ignored *)
function GenImageFontAtlas(glyphs:PGlyphInfo; glyphRecs:PPRectangle; glyphCount:longint; fontSize:longint; padding:longint; 
           packMethod:longint):TImage;cdecl;external;
{ Generate image font atlas using chars info }
procedure UnloadFontData(glyphs:PGlyphInfo; glyphCount:longint);cdecl;external;
{ Unload font chars info data (RAM) }
procedure UnloadFont(font:TFont);cdecl;external;
{ Unload font from GPU memory (VRAM) }
(* Const before type ignored *)
function ExportFontAsCode(font:TFont; fileName:Pchar):Tbool;cdecl;external;
{ Export font as code file, returns true on success }
{ Text drawing functions }
procedure DrawFPS(posX:longint; posY:longint);cdecl;external;
{ Draw current FPS }
(* Const before type ignored *)
procedure DrawText(text:Pchar; posX:longint; posY:longint; fontSize:longint; color:TColor);cdecl;external;
{ Draw text (using default font) }
(* Const before type ignored *)
procedure DrawTextEx(font:TFont; text:Pchar; position:TVector2; fontSize:single; spacing:single; 
            tint:TColor);cdecl;external;
{ Draw text using font and additional parameters }
(* Const before type ignored *)
procedure DrawTextPro(font:TFont; text:Pchar; position:TVector2; origin:TVector2; rotation:single; 
            fontSize:single; spacing:single; tint:TColor);cdecl;external;
{ Draw text using Font and pro parameters (rotation) }
procedure DrawTextCodepoint(font:TFont; codepoint:longint; position:TVector2; fontSize:single; tint:TColor);cdecl;external;
{ Draw one character (codepoint) }
(* Const before type ignored *)
procedure DrawTextCodepoints(font:TFont; codepoints:Plongint; codepointCount:longint; position:TVector2; fontSize:single; 
            spacing:single; tint:TColor);cdecl;external;
{ Draw multiple characters (codepoint) }
{ Text font info functions }
procedure SetTextLineSpacing(spacing:longint);cdecl;external;
{ Set vertical line spacing when drawing with line-breaks }
(* Const before type ignored *)
function MeasureText(text:Pchar; fontSize:longint):longint;cdecl;external;
{ Measure string width for default font }
(* Const before type ignored *)
function MeasureTextEx(font:TFont; text:Pchar; fontSize:single; spacing:single):TVector2;cdecl;external;
{ Measure string size for Font }
(* Const before type ignored *)
function MeasureTextCodepoints(font:TFont; codepoints:Plongint; length:longint; fontSize:single; spacing:single):TVector2;cdecl;external;
{ Measure string size for an existing array of codepoints for Font }
function GetGlyphIndex(font:TFont; codepoint:longint):longint;cdecl;external;
{ Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found }
function GetGlyphInfo(font:TFont; codepoint:longint):TGlyphInfo;cdecl;external;
{ Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found }
function GetGlyphAtlasRec(font:TFont; codepoint:longint):TRectangle;cdecl;external;
{ Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found }
{ Text codepoints management functions (unicode characters) }
(* Const before type ignored *)
function LoadUTF8(codepoints:Plongint; length:longint):Pchar;cdecl;external;
{ Load UTF-8 text encoded from codepoints array }
procedure UnloadUTF8(text:Pchar);cdecl;external;
{ Unload UTF-8 text encoded from codepoints array }
(* Const before type ignored *)
function LoadCodepoints(text:Pchar; count:Plongint):Plongint;cdecl;external;
{ Load all codepoints from a UTF-8 text string, codepoints count returned by parameter }
procedure UnloadCodepoints(codepoints:Plongint);cdecl;external;
{ Unload codepoints data from memory }
(* Const before type ignored *)
function GetCodepointCount(text:Pchar):longint;cdecl;external;
{ Get total number of codepoints in a UTF-8 encoded string }
(* Const before type ignored *)
function GetCodepoint(text:Pchar; codepointSize:Plongint):longint;cdecl;external;
{ Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure }
(* Const before type ignored *)
function GetCodepointNext(text:Pchar; codepointSize:Plongint):longint;cdecl;external;
{ Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure }
(* Const before type ignored *)
function GetCodepointPrevious(text:Pchar; codepointSize:Plongint):longint;cdecl;external;
{ Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure }
(* Const before type ignored *)
function CodepointToUTF8(codepoint:longint; utf8Size:Plongint):Pchar;cdecl;external;
{ Encode one codepoint into UTF-8 byte array (array length returned as parameter) }
{ Text strings management functions (no UTF-8 strings, only byte chars) }
{ WARNING 1: Most of these functions use internal static buffers[], it's recommended to store returned data on user-side for re-use }
{ WARNING 2: Some functions allocate memory internally for the returned strings, those strings must be freed by user using MemFree() }
(* Const before type ignored *)
function LoadTextLines(text:Pchar; count:Plongint):^Pchar;cdecl;external;
{ Load text as separate lines ('\n') }
procedure UnloadTextLines(text:PPchar; lineCount:longint);cdecl;external;
{ Unload text lines }
(* Const before type ignored *)
function TextCopy(dst:Pchar; src:Pchar):longint;cdecl;external;
{ Copy one string to another, returns bytes copied }
(* Const before type ignored *)
(* Const before type ignored *)
function TextIsEqual(text1:Pchar; text2:Pchar):Tbool;cdecl;external;
{ Check if two text strings are equal }
(* Const before type ignored *)
function TextLength(text:Pchar):dword;cdecl;external;
{ Get text length, checks for '\0' ending }
(* Const before type ignored *)
(* Const before type ignored *)
function TextFormat(text:Pchar; args:array of const):Pchar;cdecl;external;
function TextFormat(text:Pchar):Pchar;cdecl;external;
{ Text formatting with variables (sprintf() style) }
(* Const before type ignored *)
(* Const before type ignored *)
function TextSubtext(text:Pchar; position:longint; length:longint):Pchar;cdecl;external;
{ Get a piece of a text string }
(* Const before type ignored *)
(* Const before type ignored *)
function TextRemoveSpaces(text:Pchar):Pchar;cdecl;external;
{ Remove text spaces, concat words }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetTextBetween(text:Pchar; begin:Pchar; end:Pchar):Pchar;cdecl;external;
{ Get text between two strings }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function TextReplace(text:Pchar; search:Pchar; replacement:Pchar):Pchar;cdecl;external;
{ Replace text string with new string }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function TextReplaceAlloc(text:Pchar; search:Pchar; replacement:Pchar):Pchar;cdecl;external;
{ Replace text string with new string, memory must be MemFree() }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function TextReplaceBetween(text:Pchar; begin:Pchar; end:Pchar; replacement:Pchar):Pchar;cdecl;external;
{ Replace text between two specific strings }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function TextReplaceBetweenAlloc(text:Pchar; begin:Pchar; end:Pchar; replacement:Pchar):Pchar;cdecl;external;
{ Replace text between two specific strings, memory must be MemFree() }
(* Const before type ignored *)
(* Const before type ignored *)
function TextInsert(text:Pchar; insert:Pchar; position:longint):Pchar;cdecl;external;
{ Insert text in a defined byte position }
(* Const before type ignored *)
(* Const before type ignored *)
function TextInsertAlloc(text:Pchar; insert:Pchar; position:longint):Pchar;cdecl;external;
{ Insert text in a defined byte position, memory must be MemFree() }
(* Const before type ignored *)
function TextJoin(textList:PPchar; count:longint; delimiter:Pchar):Pchar;cdecl;external;
{ Join text strings with delimiter }
(* Const before type ignored *)
function TextSplit(text:Pchar; delimiter:char; count:Plongint):^Pchar;cdecl;external;
{ Split text into multiple strings, using MAX_TEXTSPLIT_COUNT static strings }
(* Const before type ignored *)
procedure TextAppend(text:Pchar; append:Pchar; position:Plongint);cdecl;external;
{ Append text at specific position and move cursor }
(* Const before type ignored *)
(* Const before type ignored *)
function TextFindIndex(text:Pchar; search:Pchar):longint;cdecl;external;
{ Find first text occurrence within a string, -1 if not found }
(* Const before type ignored *)
function TextToUpper(text:Pchar):Pchar;cdecl;external;
{ Get upper case version of provided string }
(* Const before type ignored *)
function TextToLower(text:Pchar):Pchar;cdecl;external;
{ Get lower case version of provided string }
(* Const before type ignored *)
function TextToPascal(text:Pchar):Pchar;cdecl;external;
{ Get Pascal case notation version of provided string }
(* Const before type ignored *)
function TextToSnake(text:Pchar):Pchar;cdecl;external;
{ Get Snake case notation version of provided string }
(* Const before type ignored *)
function TextToCamel(text:Pchar):Pchar;cdecl;external;
{ Get Camel case notation version of provided string }
(* Const before type ignored *)
function TextToInteger(text:Pchar):longint;cdecl;external;
{ Get integer value from text }
(* Const before type ignored *)
function TextToFloat(text:Pchar):single;cdecl;external;
{ Get float value from text }
{------------------------------------------------------------------------------------ }
{ Basic 3d Shapes Drawing Functions (Module: models) }
{------------------------------------------------------------------------------------ }
{ Basic geometric 3D shapes drawing functions }
procedure DrawLine3D(startPos:TVector3; endPos:TVector3; color:TColor);cdecl;external;
{ Draw a line in 3D world space }
procedure DrawPoint3D(position:TVector3; color:TColor);cdecl;external;
{ Draw a point in 3D space, actually a small line }
procedure DrawCircle3D(center:TVector3; radius:single; rotationAxis:TVector3; rotationAngle:single; color:TColor);cdecl;external;
{ Draw a circle in 3D world space }
procedure DrawTriangle3D(v1:TVector3; v2:TVector3; v3:TVector3; color:TColor);cdecl;external;
{ Draw a color-filled triangle, counter-clockwise vertex order }
(* Const before type ignored *)
procedure DrawTriangleStrip3D(points:PVector3; pointCount:longint; color:TColor);cdecl;external;
{ Draw a triangle strip defined by points }
procedure DrawCube(position:TVector3; width:single; height:single; length:single; color:TColor);cdecl;external;
{ Draw cube }
procedure DrawCubeV(position:TVector3; size:TVector3; color:TColor);cdecl;external;
{ Draw cube (Vector version) }
procedure DrawCubeWires(position:TVector3; width:single; height:single; length:single; color:TColor);cdecl;external;
{ Draw cube wires }
procedure DrawCubeWiresV(position:TVector3; size:TVector3; color:TColor);cdecl;external;
{ Draw cube wires (Vector version) }
procedure DrawSphere(centerPos:TVector3; radius:single; color:TColor);cdecl;external;
{ Draw sphere }
procedure DrawSphereEx(centerPos:TVector3; radius:single; rings:longint; slices:longint; color:TColor);cdecl;external;
{ Draw sphere with defined rings and slices }
procedure DrawSphereWires(centerPos:TVector3; radius:single; rings:longint; slices:longint; color:TColor);cdecl;external;
{ Draw sphere wires }
procedure DrawCylinder(position:TVector3; radiusTop:single; radiusBottom:single; height:single; sides:longint; 
            color:TColor);cdecl;external;
{ Draw a cylinder/cone }
procedure DrawCylinderEx(startPos:TVector3; endPos:TVector3; startRadius:single; endRadius:single; sides:longint; 
            color:TColor);cdecl;external;
{ Draw a cylinder with base at startPos and top at endPos }
procedure DrawCylinderWires(position:TVector3; radiusTop:single; radiusBottom:single; height:single; sides:longint; 
            color:TColor);cdecl;external;
{ Draw a cylinder/cone wires }
procedure DrawCylinderWiresEx(startPos:TVector3; endPos:TVector3; startRadius:single; endRadius:single; sides:longint; 
            color:TColor);cdecl;external;
{ Draw a cylinder wires with base at startPos and top at endPos }
procedure DrawCapsule(startPos:TVector3; endPos:TVector3; radius:single; rings:longint; slices:longint; 
            color:TColor);cdecl;external;
{ Draw a capsule with the center of its sphere caps at startPos and endPos }
procedure DrawCapsuleWires(startPos:TVector3; endPos:TVector3; radius:single; rings:longint; slices:longint; 
            color:TColor);cdecl;external;
{ Draw capsule wireframe with the center of its sphere caps at startPos and endPos }
procedure DrawPlane(centerPos:TVector3; size:TVector2; color:TColor);cdecl;external;
{ Draw a plane XZ }
procedure DrawRay(ray:TRay; color:TColor);cdecl;external;
{ Draw a ray line }
procedure DrawGrid(slices:longint; spacing:single);cdecl;external;
{ Draw a grid (centered at (0, 0, 0)) }
{------------------------------------------------------------------------------------ }
{ Model 3d Loading and Drawing Functions (Module: models) }
{------------------------------------------------------------------------------------ }
{ Model management functions }
(* Const before type ignored *)
function LoadModel(fileName:Pchar):TModel;cdecl;external;
{ Load model from files (meshes and materials) }
function LoadModelFromMesh(mesh:TMesh):TModel;cdecl;external;
{ Load model from generated mesh (default material) }
function IsModelValid(model:TModel):Tbool;cdecl;external;
{ Check if model is valid (loaded in GPU, VAO/VBOs) }
procedure UnloadModel(model:TModel);cdecl;external;
{ Unload model (including meshes) from memory (RAM and/or VRAM) }
function GetModelBoundingBox(model:TModel):TBoundingBox;cdecl;external;
{ Compute model bounding box limits (considers all meshes) }
{ Model drawing functions }
procedure DrawModel(model:TModel; position:TVector3; scale:single; tint:TColor);cdecl;external;
{ Draw a model (with texture if set) }
procedure DrawModelEx(model:TModel; position:TVector3; rotationAxis:TVector3; rotationAngle:single; scale:TVector3; 
            tint:TColor);cdecl;external;
{ Draw a model with custom transform }
procedure DrawModelWires(model:TModel; position:TVector3; scale:single; tint:TColor);cdecl;external;
{ Draw a model wires (with texture if set) }
procedure DrawModelWiresEx(model:TModel; position:TVector3; rotationAxis:TVector3; rotationAngle:single; scale:TVector3; 
            tint:TColor);cdecl;external;
{ Draw a model wires with custom transform }
procedure DrawBoundingBox(box:TBoundingBox; color:TColor);cdecl;external;
{ Draw bounding box (wires) }
procedure DrawBillboard(camera:TCamera; texture:TTexture2D; position:TVector3; scale:single; tint:TColor);cdecl;external;
{ Draw a billboard texture }
procedure DrawBillboardRec(camera:TCamera; texture:TTexture2D; rec:TRectangle; position:TVector3; size:TVector2; 
            tint:TColor);cdecl;external;
{ Draw a billboard texture defined by rectangle }
procedure DrawBillboardPro(camera:TCamera; texture:TTexture2D; rec:TRectangle; position:TVector3; up:TVector3; 
            size:TVector2; origin:TVector2; rotation:single; tint:TColor);cdecl;external;
{ Draw a billboard texture defined by source rectangle with scaling and rotation }
{ Mesh management functions }
procedure UploadMesh(mesh:PMesh; dynamic:Tbool);cdecl;external;
{ Upload mesh vertex data in GPU and provide VAO/VBO ids }
(* Const before type ignored *)
procedure UpdateMeshBuffer(mesh:TMesh; index:longint; data:pointer; dataSize:longint; offset:longint);cdecl;external;
{ Update mesh vertex data in GPU for a specific buffer index }
procedure UnloadMesh(mesh:TMesh);cdecl;external;
{ Unload mesh data from CPU and GPU }
procedure DrawMesh(mesh:TMesh; material:TMaterial; transform:TMatrix);cdecl;external;
{ Draw a 3d mesh with material and transform }
(* Const before type ignored *)
procedure DrawMeshInstanced(mesh:TMesh; material:TMaterial; transforms:PMatrix; instances:longint);cdecl;external;
{ Draw multiple mesh instances with material and different transforms }
function GetMeshBoundingBox(mesh:TMesh):TBoundingBox;cdecl;external;
{ Compute mesh bounding box limits }
procedure GenMeshTangents(mesh:PMesh);cdecl;external;
{ Compute mesh tangents }
(* Const before type ignored *)
function ExportMesh(mesh:TMesh; fileName:Pchar):Tbool;cdecl;external;
{ Export mesh data to file, returns true on success }
(* Const before type ignored *)
function ExportMeshAsCode(mesh:TMesh; fileName:Pchar):Tbool;cdecl;external;
{ Export mesh as code file (.h) defining multiple arrays of vertex attributes }
{ Mesh generation functions }
function GenMeshPoly(sides:longint; radius:single):TMesh;cdecl;external;
{ Generate polygonal mesh }
function GenMeshPlane(width:single; length:single; resX:longint; resZ:longint):TMesh;cdecl;external;
{ Generate plane mesh (with subdivisions) }
function GenMeshCube(width:single; height:single; length:single):TMesh;cdecl;external;
{ Generate cuboid mesh }
function GenMeshSphere(radius:single; rings:longint; slices:longint):TMesh;cdecl;external;
{ Generate sphere mesh (standard sphere) }
function GenMeshHemiSphere(radius:single; rings:longint; slices:longint):TMesh;cdecl;external;
{ Generate half-sphere mesh (no bottom cap) }
function GenMeshCylinder(radius:single; height:single; slices:longint):TMesh;cdecl;external;
{ Generate cylinder mesh }
function GenMeshCone(radius:single; height:single; slices:longint):TMesh;cdecl;external;
{ Generate cone/pyramid mesh }
function GenMeshTorus(radius:single; size:single; radSeg:longint; sides:longint):TMesh;cdecl;external;
{ Generate torus mesh }
function GenMeshKnot(radius:single; size:single; radSeg:longint; sides:longint):TMesh;cdecl;external;
{ Generate trefoil knot mesh }
function GenMeshHeightmap(heightmap:TImage; size:TVector3):TMesh;cdecl;external;
{ Generate heightmap mesh from image data }
function GenMeshCubicmap(cubicmap:TImage; cubeSize:TVector3):TMesh;cdecl;external;
{ Generate cubes-based map mesh from image data }
{ Material loading/unloading functions }
(* Const before type ignored *)
function LoadMaterials(fileName:Pchar; materialCount:Plongint):PMaterial;cdecl;external;
{ Load materials from model file }
function LoadMaterialDefault:TMaterial;cdecl;external;
{ Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps) }
function IsMaterialValid(material:TMaterial):Tbool;cdecl;external;
{ Check if material is valid (shader assigned, map textures loaded in GPU) }
procedure UnloadMaterial(material:TMaterial);cdecl;external;
{ Unload material from GPU memory (VRAM) }
procedure SetMaterialTexture(material:PMaterial; mapType:longint; texture:TTexture2D);cdecl;external;
{ Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...) }
procedure SetModelMeshMaterial(model:PModel; meshId:longint; materialId:longint);cdecl;external;
{ Set material for a mesh }
{ Model animations loading/unloading functions }
(* Const before type ignored *)
function LoadModelAnimations(fileName:Pchar; animCount:Plongint):PModelAnimation;cdecl;external;
{ Load model animations from file }
procedure UpdateModelAnimation(model:TModel; anim:TModelAnimation; frame:single);cdecl;external;
{ Update model animation pose (vertex buffers and bone matrices) }
procedure UpdateModelAnimationEx(model:TModel; animA:TModelAnimation; frameA:single; animB:TModelAnimation; frameB:single; 
            blend:single);cdecl;external;
{ Update model animation pose, blending two animations }
procedure UnloadModelAnimations(animations:PModelAnimation; animCount:longint);cdecl;external;
{ Unload animation array data }
function IsModelAnimationValid(model:TModel; anim:TModelAnimation):Tbool;cdecl;external;
{ Check model animation skeleton match }
{ Collision detection functions }
function CheckCollisionSpheres(center1:TVector3; radius1:single; center2:TVector3; radius2:single):Tbool;cdecl;external;
{ Check collision between two spheres }
function CheckCollisionBoxes(box1:TBoundingBox; box2:TBoundingBox):Tbool;cdecl;external;
{ Check collision between two bounding boxes }
function CheckCollisionBoxSphere(box:TBoundingBox; center:TVector3; radius:single):Tbool;cdecl;external;
{ Check collision between box and sphere }
function GetRayCollisionSphere(ray:TRay; center:TVector3; radius:single):TRayCollision;cdecl;external;
{ Get collision info between ray and sphere }
function GetRayCollisionBox(ray:TRay; box:TBoundingBox):TRayCollision;cdecl;external;
{ Get collision info between ray and box }
function GetRayCollisionMesh(ray:TRay; mesh:TMesh; transform:TMatrix):TRayCollision;cdecl;external;
{ Get collision info between ray and mesh }
function GetRayCollisionTriangle(ray:TRay; p1:TVector3; p2:TVector3; p3:TVector3):TRayCollision;cdecl;external;
{ Get collision info between ray and triangle }
function GetRayCollisionQuad(ray:TRay; p1:TVector3; p2:TVector3; p3:TVector3; p4:TVector3):TRayCollision;cdecl;external;
{ Get collision info between ray and quad }
{------------------------------------------------------------------------------------ }
{ Audio Loading and Playing Functions (Module: audio) }
{------------------------------------------------------------------------------------ }
type

  TAudioCallback = procedure (bufferData:pointer; frames:dword);cdecl;
{ Audio device management functions }

procedure InitAudioDevice;cdecl;external;
{ Initialize audio device and context }
procedure CloseAudioDevice;cdecl;external;
{ Close the audio device and context }
function IsAudioDeviceReady:Tbool;cdecl;external;
{ Check if audio device has been initialized successfully }
procedure SetMasterVolume(volume:single);cdecl;external;
{ Set master volume (listener) }
function GetMasterVolume:single;cdecl;external;
{ Get master volume (listener) }
{ Wave/Sound loading/unloading functions }
(* Const before type ignored *)
function LoadWave(fileName:Pchar):TWave;cdecl;external;
{ Load wave data from file }
(* Const before type ignored *)
(* Const before type ignored *)
function LoadWaveFromMemory(fileType:Pchar; fileData:Pbyte; dataSize:longint):TWave;cdecl;external;
{ Load wave from memory buffer, fileType refers to extension: i.e. '.wav' }
function IsWaveValid(wave:TWave):Tbool;cdecl;external;
{ Check if wave data is valid (data loaded and parameters) }
(* Const before type ignored *)
function LoadSound(fileName:Pchar):TSound;cdecl;external;
{ Load sound from file }
function LoadSoundFromWave(wave:TWave):TSound;cdecl;external;
{ Load sound from wave data }
function LoadSoundAlias(source:TSound):TSound;cdecl;external;
{ Load sound alias, new sound that shares the same sample data as the source sound, does not own the sound data }
function IsSoundValid(sound:TSound):Tbool;cdecl;external;
{ Check if sound is valid (data loaded and buffers initialized) }
(* Const before type ignored *)
procedure UpdateSound(sound:TSound; data:pointer; frameCount:longint);cdecl;external;
{ Update sound buffer with new data (default data format: 32 bit float, stereo) }
procedure UnloadWave(wave:TWave);cdecl;external;
{ Unload wave data }
procedure UnloadSound(sound:TSound);cdecl;external;
{ Unload sound }
procedure UnloadSoundAlias(alias:TSound);cdecl;external;
{ Unload sound alias (does not deallocate sample data) }
(* Const before type ignored *)
function ExportWave(wave:TWave; fileName:Pchar):Tbool;cdecl;external;
{ Export wave data to file, returns true on success }
(* Const before type ignored *)
function ExportWaveAsCode(wave:TWave; fileName:Pchar):Tbool;cdecl;external;
{ Export wave sample data to code (.h), returns true on success }
{ Wave/Sound management functions }
procedure PlaySound(sound:TSound);cdecl;external;
{ Play a sound }
procedure StopSound(sound:TSound);cdecl;external;
{ Stop playing a sound }
procedure PauseSound(sound:TSound);cdecl;external;
{ Pause a sound }
procedure ResumeSound(sound:TSound);cdecl;external;
{ Resume a paused sound }
function IsSoundPlaying(sound:TSound):Tbool;cdecl;external;
{ Check if sound is currently playing }
procedure SetSoundVolume(sound:TSound; volume:single);cdecl;external;
{ Set volume for a sound (1.0 is max level) }
procedure SetSoundPitch(sound:TSound; pitch:single);cdecl;external;
{ Set pitch for a sound (1.0 is base level) }
procedure SetSoundPan(sound:TSound; pan:single);cdecl;external;
{ Set pan for a sound (-1.0 left, 0.0 center, 1.0 right) }
function WaveCopy(wave:TWave):TWave;cdecl;external;
{ Copy a wave to a new wave }
procedure WaveCrop(wave:PWave; initFrame:longint; finalFrame:longint);cdecl;external;
{ Crop a wave to defined frames range }
procedure WaveFormat(wave:PWave; sampleRate:longint; sampleSize:longint; channels:longint);cdecl;external;
{ Convert wave data to desired format }
function LoadWaveSamples(wave:TWave):Psingle;cdecl;external;
{ Load samples data from wave as a 32bit float data array }
procedure UnloadWaveSamples(samples:Psingle);cdecl;external;
{ Unload samples data loaded with LoadWaveSamples() }
{ Music management functions }
(* Const before type ignored *)
function LoadMusicStream(fileName:Pchar):TMusic;cdecl;external;
{ Load music stream from file }
(* Const before type ignored *)
(* Const before type ignored *)
function LoadMusicStreamFromMemory(fileType:Pchar; data:Pbyte; dataSize:longint):TMusic;cdecl;external;
{ Load music stream from data }
function IsMusicValid(music:TMusic):Tbool;cdecl;external;
{ Check if music stream is valid (context and buffers initialized) }
procedure UnloadMusicStream(music:TMusic);cdecl;external;
{ Unload music stream }
procedure PlayMusicStream(music:TMusic);cdecl;external;
{ Start music playing }
function IsMusicStreamPlaying(music:TMusic):Tbool;cdecl;external;
{ Check if music is playing }
procedure UpdateMusicStream(music:TMusic);cdecl;external;
{ Update buffers for music streaming }
procedure StopMusicStream(music:TMusic);cdecl;external;
{ Stop music playing }
procedure PauseMusicStream(music:TMusic);cdecl;external;
{ Pause music playing }
procedure ResumeMusicStream(music:TMusic);cdecl;external;
{ Resume playing paused music }
procedure SeekMusicStream(music:TMusic; position:single);cdecl;external;
{ Seek music to a position (in seconds) }
procedure SetMusicVolume(music:TMusic; volume:single);cdecl;external;
{ Set volume for music (1.0 is max level) }
procedure SetMusicPitch(music:TMusic; pitch:single);cdecl;external;
{ Set pitch for music (1.0 is base level) }
procedure SetMusicPan(music:TMusic; pan:single);cdecl;external;
{ Set pan for music (-1.0 left, 0.0 center, 1.0 right) }
function GetMusicTimeLength(music:TMusic):single;cdecl;external;
{ Get music time length (in seconds) }
function GetMusicTimePlayed(music:TMusic):single;cdecl;external;
{ Get current music time played (in seconds) }
{ AudioStream management functions }
function LoadAudioStream(sampleRate:dword; sampleSize:dword; channels:dword):TAudioStream;cdecl;external;
{ Load audio stream (to stream raw audio pcm data) }
function IsAudioStreamValid(stream:TAudioStream):Tbool;cdecl;external;
{ Check if an audio stream is valid (buffers initialized) }
procedure UnloadAudioStream(stream:TAudioStream);cdecl;external;
{ Unload audio stream and free memory }
(* Const before type ignored *)
procedure UpdateAudioStream(stream:TAudioStream; data:pointer; frameCount:longint);cdecl;external;
{ Update audio stream buffers with data }
function IsAudioStreamProcessed(stream:TAudioStream):Tbool;cdecl;external;
{ Check if any audio stream buffers requires refill }
procedure PlayAudioStream(stream:TAudioStream);cdecl;external;
{ Play audio stream }
procedure PauseAudioStream(stream:TAudioStream);cdecl;external;
{ Pause audio stream }
procedure ResumeAudioStream(stream:TAudioStream);cdecl;external;
{ Resume audio stream }
function IsAudioStreamPlaying(stream:TAudioStream):Tbool;cdecl;external;
{ Check if audio stream is playing }
procedure StopAudioStream(stream:TAudioStream);cdecl;external;
{ Stop audio stream }
procedure SetAudioStreamVolume(stream:TAudioStream; volume:single);cdecl;external;
{ Set volume for audio stream (1.0 is max level) }
procedure SetAudioStreamPitch(stream:TAudioStream; pitch:single);cdecl;external;
{ Set pitch for audio stream (1.0 is base level) }
procedure SetAudioStreamPan(stream:TAudioStream; pan:single);cdecl;external;
{ Set pan for audio stream (-1.0 left, 0.0 center, 1.0 right) }
procedure SetAudioStreamBufferSizeDefault(size:longint);cdecl;external;
{ Default size for new audio streams }
procedure SetAudioStreamCallback(stream:TAudioStream; callback:TAudioCallback);cdecl;external;
{ Audio thread callback to request new data }
procedure AttachAudioStreamProcessor(stream:TAudioStream; processor:TAudioCallback);cdecl;external;
{ Attach audio stream processor to stream, receives frames x 2 samples as 'float' (stereo) }
procedure DetachAudioStreamProcessor(stream:TAudioStream; processor:TAudioCallback);cdecl;external;
{ Detach audio stream processor from stream }
procedure AttachAudioMixedProcessor(processor:TAudioCallback);cdecl;external;
{ Attach audio stream processor to the entire audio pipeline, receives frames x 2 samples as 'float' (stereo) }
procedure DetachAudioMixedProcessor(processor:TAudioCallback);cdecl;external;
{ Detach audio stream processor from the entire audio pipeline }

implementation


end.
