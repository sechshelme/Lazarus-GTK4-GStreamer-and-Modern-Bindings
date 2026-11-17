unit fp_rlgl;

interface


{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*********************************************************************************************
*
*   rlgl v6.0 - A multi-OpenGL abstraction layer with an immediate-mode style API
*
*   DESCRIPTION:
*       An abstraction layer for multiple OpenGL versions (1.1, 2.1, 3.3 Core, 4.3 Core, ES 2.0, ES 3.0)
*       that provides a pseudo-OpenGL 1.1 immediate-mode style API (rlVertex, rlTranslate, rlRotate...)
*
*   ADDITIONAL NOTES:
*       When choosing an OpenGL backend different than OpenGL 1.1, some internal buffers are
*       initialized on rlglInit() to accumulate vertex data
*
*       When an internal state change is required all the stored vertex data is rendered in a batch,
*       additionally, rlDrawRenderBatchActive() could be called to force flushing of the batch
*
*       Some resources are also loaded for convenience, here the complete list:
*          - Default batch (RLGL.defaultBatch): RenderBatch system to accumulate vertex data
*          - Default texture (RLGL.defaultTextureId): 1x1 white pixel R8G8B8A8
*          - Default shader (RLGL.State.defaultShaderId, RLGL.State.defaultShaderLocs)
*
*       Internal buffer (and resources) must be manually unloaded calling rlglClose()
*
*   CONFIGURATION:
*       #define GRAPHICS_API_OPENGL_SOFTWARE
*       #define GRAPHICS_API_OPENGL_11
*       #define GRAPHICS_API_OPENGL_21
*       #define GRAPHICS_API_OPENGL_33
*       #define GRAPHICS_API_OPENGL_43
*       #define GRAPHICS_API_OPENGL_ES2
*       #define GRAPHICS_API_OPENGL_ES3
*           Use selected OpenGL graphics backend, should be supported by platform
*           Those preprocessor defines are only used on the rlgl module, if OpenGL version is
*           required by any other module, use rlGetVersion() to check it
*
*       #define RLGL_IMPLEMENTATION
*           Generates the implementation of the library into the included file
*           If not defined, the library is in header only mode and can be included in other headers
*           or source files without problems. But only ONE file should hold the implementation
*
*       #if RLGL_SHOW_GL_DETAILS_INFO
*           Show OpenGL extensions and capabilities detailed logs on init
*
*       #if RLGL_ENABLE_OPENGL_DEBUG_CONTEXT
*           Enable debug context (only available on OpenGL 4.3)
*
*       rlgl capabilities could be customized defining some internal
*       values before library inclusion (default values listed):
*
*       #define RL_DEFAULT_BATCH_BUFFER_ELEMENTS   8192    // Default internal render batch elements limits
*       #define RL_DEFAULT_BATCH_BUFFERS              1    // Default number of batch buffers (multi-buffering)
*       #define RL_DEFAULT_BATCH_DRAWCALLS          256    // Default number of batch draw calls (by state changes: mode, texture)
*       #define RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS    4    // Maximum number of texture units that can be activated on batch drawing (SetShaderValueTexture())
*
*       #define RL_MAX_MATRIX_STACK_SIZE             32    // Maximum size of internal Matrix stack
*       #define RL_MAX_SHADER_LOCATIONS              32    // Maximum number of shader locations supported
*       #define RL_CULL_DISTANCE_NEAR              0.05    // Default projection matrix near cull distance
*       #define RL_CULL_DISTANCE_FAR             4000.0    // Default projection matrix far cull distance
*
*       When loading a shader, the following vertex attributes and uniform location names are tried to be set automatically:
*       WARNING: Pre-defined names can not be changed, they are used by default shaders and all raylib examples shaders, they are just listed here for reference
*
*       #define RL_DEFAULT_SHADER_ATTRIB_NAME_POSITION     "vertexPosition"    // Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_LOCATION_POSITION
*       #define RL_DEFAULT_SHADER_ATTRIB_NAME_TEXCOORD     "vertexTexCoord"    // Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD
*       #define RL_DEFAULT_SHADER_ATTRIB_NAME_NORMAL       "vertexNormal"      // Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_LOCATION_NORMAL
*       #define RL_DEFAULT_SHADER_ATTRIB_NAME_COLOR        "vertexColor"       // Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_LOCATION_COLOR
*       #define RL_DEFAULT_SHADER_ATTRIB_NAME_TANGENT      "vertexTangent"     // Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_LOCATION_TANGENT
*       #define RL_DEFAULT_SHADER_ATTRIB_NAME_TEXCOORD2    "vertexTexCoord2"   // Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD2
*       #define RL_DEFAULT_SHADER_ATTRIB_NAME_BONEINDICES  "vertexBoneIndices" // Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEINDICES
*       #define RL_DEFAULT_SHADER_ATTRIB_NAME_BONEWEIGHTS  "vertexBoneWeights" // Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEWEIGHTS
*       #define RL_DEFAULT_SHADER_ATTRIB_NAME_INSTANCETRANSFORM "instanceTransform" // Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_LOCATION_INSTANCETRANSFORM
*
*       #define RL_DEFAULT_SHADER_UNIFORM_NAME_MVP         "mvp"               // model-view-projection matrix
*       #define RL_DEFAULT_SHADER_UNIFORM_NAME_VIEW        "matView"           // view matrix
*       #define RL_DEFAULT_SHADER_UNIFORM_NAME_PROJECTION  "matProjection"     // projection matrix
*       #define RL_DEFAULT_SHADER_UNIFORM_NAME_MODEL       "matModel"          // model matrix
*       #define RL_DEFAULT_SHADER_UNIFORM_NAME_NORMAL      "matNormal"         // normal matrix (transpose(inverse(matModelView)))
*       #define RL_DEFAULT_SHADER_UNIFORM_NAME_COLOR       "colDiffuse"        // color diffuse (base tint color, multiplied by texture color)
*       #define RL_DEFAULT_SHADER_UNIFORM_NAME_BONEMATRICES "boneMatrices"     // bone matrices
*
*       #define RL_DEFAULT_SHADER_SAMPLER2D_NAME_TEXTURE0  "texture0"          // texture0 (texture slot active 0)
*       #define RL_DEFAULT_SHADER_SAMPLER2D_NAME_TEXTURE1  "texture1"          // texture1 (texture slot active 1)
*       #define RL_DEFAULT_SHADER_SAMPLER2D_NAME_TEXTURE2  "texture2"          // texture2 (texture slot active 2)
*
*   DEPENDENCIES:
*      - OpenGL libraries (depending on platform and OpenGL version selected)
*      - GLAD OpenGL extensions loading library (only for OpenGL 3.3 Core, 4.3 Core)
*
*
*   LICENSE: zlib/libpng
*
*   Copyright (c) 2014-2026 Ramon Santamaria (@raysan5)
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
{$ifndef RLGL_H}
{$define RLGL_H}

const
  RLGL_VERSION = '6.0';  
{---------------------------------------------------------------------------------- }
{ Defines and Macros }
{---------------------------------------------------------------------------------- }
{ Default internal render batch elements limits }
{$ifndef RL_DEFAULT_BATCH_BUFFER_ELEMENTS}
{$if defined(GRAPHICS_API_OPENGL_11) || defined(GRAPHICS_API_OPENGL_33)}
{ This is the maximum amount of elements (quads) per batch }
{ NOTE: Be careful with text, every letter maps to a quad }

const
  RL_DEFAULT_BATCH_BUFFER_ELEMENTS = 8192;  
{$endif}
{$if defined(GRAPHICS_API_OPENGL_ES2)}
{ Reducing memory sizes for embedded systems (RPI and HTML5) }
{ NOTE: On HTML5 (emscripten) this is allocated on heap, }
{ by default heap is only 16MB!...just take care... }

const
  RL_DEFAULT_BATCH_BUFFER_ELEMENTS = 2048;  
{$endif}
{$endif}
{$ifndef RL_DEFAULT_BATCH_BUFFERS}

const
  RL_DEFAULT_BATCH_BUFFERS = 1;  { Default number of batch buffers (multi-buffering) }
{$endif}
{$ifndef RL_DEFAULT_BATCH_DRAWCALLS}

const
  RL_DEFAULT_BATCH_DRAWCALLS = 256;  { Default number of batch draw calls (by state changes: mode, texture) }
{$endif}
{$ifndef RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS}

const
  RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS = 4;  { Maximum number of textures units that can be activated on batch drawing (SetShaderValueTexture()) }
{$endif}
{ Internal Matrix stack }
{$ifndef RL_MAX_MATRIX_STACK_SIZE}

const
  RL_MAX_MATRIX_STACK_SIZE = 32;  { Maximum size of Matrix stack }
{$endif}
{ Shader limits }
{$ifndef RL_MAX_SHADER_LOCATIONS}

const
  RL_MAX_SHADER_LOCATIONS = 32;  { Maximum number of shader locations supported }
{$endif}
{ Projection matrix culling }
{$ifndef RL_CULL_DISTANCE_NEAR}

const
  RL_CULL_DISTANCE_NEAR = 0.05;  { Default near cull distance }
{$endif}
{$ifndef RL_CULL_DISTANCE_FAR}

const
  RL_CULL_DISTANCE_FAR = 4000.0;  { Default far cull distance }
{$endif}
{ Texture parameters (equivalent to OpenGL defines) }

const
  RL_TEXTURE_WRAP_S = $2802;  { GL_TEXTURE_WRAP_S }
  RL_TEXTURE_WRAP_T = $2803;  { GL_TEXTURE_WRAP_T }
  RL_TEXTURE_MAG_FILTER = $2800;  { GL_TEXTURE_MAG_FILTER }
  RL_TEXTURE_MIN_FILTER = $2801;  { GL_TEXTURE_MIN_FILTER }
  RL_TEXTURE_FILTER_NEAREST = $2600;  { GL_NEAREST }
  RL_TEXTURE_FILTER_LINEAR = $2601;  { GL_LINEAR }
  RL_TEXTURE_FILTER_MIP_NEAREST = $2700;  { GL_NEAREST_MIPMAP_NEAREST }
  RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR = $2702;  { GL_NEAREST_MIPMAP_LINEAR }
  RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST = $2701;  { GL_LINEAR_MIPMAP_NEAREST }
  RL_TEXTURE_FILTER_MIP_LINEAR = $2703;  { GL_LINEAR_MIPMAP_LINEAR }
  RL_TEXTURE_FILTER_ANISOTROPIC = $3000;  { Anisotropic filter (custom identifier) }
  RL_TEXTURE_MIPMAP_BIAS_RATIO = $4000;  { Texture mipmap bias, percentage ratio (custom identifier) }
  RL_TEXTURE_WRAP_REPEAT = $2901;  { GL_REPEAT }
  RL_TEXTURE_WRAP_CLAMP = $812F;  { GL_CLAMP_TO_EDGE }
  RL_TEXTURE_WRAP_MIRROR_REPEAT = $8370;  { GL_MIRRORED_REPEAT }
  RL_TEXTURE_WRAP_MIRROR_CLAMP = $8742;  { GL_MIRROR_CLAMP_EXT }
{ Matrix modes (equivalent to OpenGL) }
  RL_MODELVIEW = $1700;  { GL_MODELVIEW }
  RL_PROJECTION = $1701;  { GL_PROJECTION }
  RL_TEXTURE = $1702;  { GL_TEXTURE }
{ Primitive assembly draw modes }
  RL_LINES = $0001;  { GL_LINES }
  RL_TRIANGLES = $0004;  { GL_TRIANGLES }
  RL_QUADS = $0007;  { GL_QUADS }
{ GL equivalent data types }
  RL_UNSIGNED_BYTE = $1401;  { GL_UNSIGNED_BYTE }
  RL_FLOAT = $1406;  { GL_FLOAT }
{ GL buffer usage hint }
  RL_STREAM_DRAW = $88E0;  { GL_STREAM_DRAW }
  RL_STREAM_READ = $88E1;  { GL_STREAM_READ }
  RL_STREAM_COPY = $88E2;  { GL_STREAM_COPY }
  RL_STATIC_DRAW = $88E4;  { GL_STATIC_DRAW }
  RL_STATIC_READ = $88E5;  { GL_STATIC_READ }
  RL_STATIC_COPY = $88E6;  { GL_STATIC_COPY }
  RL_DYNAMIC_DRAW = $88E8;  { GL_DYNAMIC_DRAW }
  RL_DYNAMIC_READ = $88E9;  { GL_DYNAMIC_READ }
  RL_DYNAMIC_COPY = $88EA;  { GL_DYNAMIC_COPY }
{ GL Shader type }
  RL_FRAGMENT_SHADER = $8B30;  { GL_FRAGMENT_SHADER }
  RL_VERTEX_SHADER = $8B31;  { GL_VERTEX_SHADER }
  RL_COMPUTE_SHADER = $91B9;  { GL_COMPUTE_SHADER }
{ GL blending factors }
  RL_ZERO = 0;  { GL_ZERO }
  RL_ONE = 1;  { GL_ONE }
  RL_SRC_COLOR = $0300;  { GL_SRC_COLOR }
  RL_ONE_MINUS_SRC_COLOR = $0301;  { GL_ONE_MINUS_SRC_COLOR }
  RL_SRC_ALPHA = $0302;  { GL_SRC_ALPHA }
  RL_ONE_MINUS_SRC_ALPHA = $0303;  { GL_ONE_MINUS_SRC_ALPHA }
  RL_DST_ALPHA = $0304;  { GL_DST_ALPHA }
  RL_ONE_MINUS_DST_ALPHA = $0305;  { GL_ONE_MINUS_DST_ALPHA }
  RL_DST_COLOR = $0306;  { GL_DST_COLOR }
  RL_ONE_MINUS_DST_COLOR = $0307;  { GL_ONE_MINUS_DST_COLOR }
  RL_SRC_ALPHA_SATURATE = $0308;  { GL_SRC_ALPHA_SATURATE }
  RL_CONSTANT_COLOR = $8001;  { GL_CONSTANT_COLOR }
  RL_ONE_MINUS_CONSTANT_COLOR = $8002;  { GL_ONE_MINUS_CONSTANT_COLOR }
  RL_CONSTANT_ALPHA = $8003;  { GL_CONSTANT_ALPHA }
  RL_ONE_MINUS_CONSTANT_ALPHA = $8004;  { GL_ONE_MINUS_CONSTANT_ALPHA }
{ GL blending functions/equations }
  RL_FUNC_ADD = $8006;  { GL_FUNC_ADD }
  RL_MIN = $8007;  { GL_MIN }
  RL_MAX = $8008;  { GL_MAX }
  RL_FUNC_SUBTRACT = $800A;  { GL_FUNC_SUBTRACT }
  RL_FUNC_REVERSE_SUBTRACT = $800B;  { GL_FUNC_REVERSE_SUBTRACT }
  RL_BLEND_EQUATION = $8009;  { GL_BLEND_EQUATION }
  RL_BLEND_EQUATION_RGB = $8009;  { GL_BLEND_EQUATION_RGB   // (Same as BLEND_EQUATION) }
  RL_BLEND_EQUATION_ALPHA = $883D;  { GL_BLEND_EQUATION_ALPHA }
  RL_BLEND_DST_RGB = $80C8;  { GL_BLEND_DST_RGB }
  RL_BLEND_SRC_RGB = $80C9;  { GL_BLEND_SRC_RGB }
  RL_BLEND_DST_ALPHA = $80CA;  { GL_BLEND_DST_ALPHA }
  RL_BLEND_SRC_ALPHA = $80CB;  { GL_BLEND_SRC_ALPHA }
  RL_BLEND_COLOR = $8005;  { GL_BLEND_COLOR }
  RL_READ_FRAMEBUFFER = $8CA8;  { GL_READ_FRAMEBUFFER }
  RL_DRAW_FRAMEBUFFER = $8CA9;  { GL_DRAW_FRAMEBUFFER }
{ Default shader vertex attribute locations }
{ NOTE: Locations can be redefined by user if required }
{$ifndef RL_DEFAULT_SHADER_ATTRIB_LOCATION_POSITION}

const
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_POSITION = 0;  
{$endif}
{$ifndef RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD}

const
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD = 1;  
{$endif}
{$ifndef RL_DEFAULT_SHADER_ATTRIB_LOCATION_NORMAL}

const
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_NORMAL = 2;  
{$endif}
{$ifndef RL_DEFAULT_SHADER_ATTRIB_LOCATION_COLOR}

const
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_COLOR = 3;  
{$endif}
{$ifndef RL_DEFAULT_SHADER_ATTRIB_LOCATION_TANGENT}

const
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_TANGENT = 4;  
{$endif}
{$ifndef RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD2}

const
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD2 = 5;  
{$endif}
{$ifndef RL_DEFAULT_SHADER_ATTRIB_LOCATION_INDICES}

const
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_INDICES = 6;  
{$endif}
{$ifndef RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEINDICES}

const
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEINDICES = 7;  
{$endif}
{$ifndef RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEWEIGHTS}

const
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEWEIGHTS = 8;  
{$endif}
{$ifndef RL_DEFAULT_SHADER_ATTRIB_LOCATION_INSTANCETRANSFORM}

const
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_INSTANCETRANSFORM = 9;  
{$endif}
{---------------------------------------------------------------------------------- }
{ Types and Structures Definition }
{---------------------------------------------------------------------------------- }
{$if !defined(__cplusplus)}
{$if (defined(__STDC__) && __STDC_VERSION__ >= 199901L) || (defined(_MSC_VER) && _MSC_VER >= 1800)}
{$include <stdbool.h>}
(*** was #elif ****){$else !defined(bool)}
type
  Pbool = ^Tbool;
  Tbool =  Longint;
  Const
    false = 0;
    true =  not (_false);
;
{$define RL_BOOL_TYPE}
{$endif}
{$endif}
{$if !defined(RL_MATRIX_TYPE)}
{ Matrix, 4x4 components, column major, OpenGL style, right handed }
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
{$define RL_MATRIX_TYPE}
{$endif}
{ Dynamic vertex buffers (position + texcoords + colors + indices arrays) }
{ Number of elements in the buffer (QUADS) }
{ Vertex position (XYZ - 3 components per vertex) (shader-location = 0) }
{ Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1) }
{ Vertex normal (XYZ - 3 components per vertex) (shader-location = 2) }
{ Vertex colors (RGBA - 4 components per vertex) (shader-location = 3) }
{$if defined(GRAPHICS_API_OPENGL_11) || defined(GRAPHICS_API_OPENGL_33)}
{ Vertex indices (in case vertex data comes indexed) (6 indices per quad) }
{$endif}
{$if defined(GRAPHICS_API_OPENGL_ES2)}
{ Vertex indices (in case vertex data comes indexed) (6 indices per quad) }
{$endif}
{ OpenGL Vertex Array Object id }
{ OpenGL Vertex Buffer Objects id (5 types of vertex data) }
type
  PrlVertexBuffer = ^TrlVertexBuffer;
  TrlVertexBuffer = record
      elementCount : longint;
      vertices : Psingle;
      texcoords : Psingle;
      normals : Psingle;
      colors : Pbyte;
      indices : Pdword;
      indices : Pword;
      vaoId : dword;
      vboId : array[0..4] of dword;
    end;
{ Draw call type }
{ NOTE: Only texture changes register a new draw, other state-change-related elements are not }
{ used at this moment (vaoId, shaderId, matrices), raylib forces a batch draw call if any }
{ of those state-change happens (this is done in core module) }
{ Drawing mode: LINES, TRIANGLES, QUADS }
{ Number of vertex of the draw }
{ Number of vertex required for index alignment (LINES, TRIANGLES) }
{unsigned int vaoId;       // Vertex array id to be used on the draw -> Using RLGL.currentBatch->vertexBuffer.vaoId }
{unsigned int shaderId;    // Shader id to be used on the draw -> Using RLGL.currentShaderId }
{ Texture id to be used on the draw -> Use to create new draw call if changes }
{Matrix projection;        // Projection matrix for this draw -> Using RLGL.projection by default }
{Matrix modelview;         // Modelview matrix for this draw -> Using RLGL.modelview by default }

  PrlDrawCall = ^TrlDrawCall;
  TrlDrawCall = record
      mode : longint;
      vertexCount : longint;
      vertexAlignment : longint;
      textureId : dword;
    end;
{ rlRenderBatch type }
{ Number of vertex buffers (multi-buffering support) }
{ Current buffer tracking in case of multi-buffering }
{ Dynamic buffer(s) for vertex data }
{ Draw calls array, depends on textureId }
{ Draw calls counter }
{ Current depth value for next draw }

  PrlRenderBatch = ^TrlRenderBatch;
  TrlRenderBatch = record
      bufferCount : longint;
      currentBuffer : longint;
      vertexBuffer : PrlVertexBuffer;
      draws : PrlDrawCall;
      drawCounter : longint;
      currentDepth : single;
    end;
{ OpenGL version }
{ Software rendering }
{ OpenGL 1.1 }
{ OpenGL 2.1 (GLSL 120) }
{ OpenGL 3.3 (GLSL 330) }
{ OpenGL 4.3 (using GLSL 330) }
{ OpenGL ES 2.0 (GLSL 100) }
{ OpenGL ES 3.0 (GLSL 300 es) }

  PrlGlVersion = ^TrlGlVersion;
  TrlGlVersion =  Longint;
  Const
    RL_OPENGL_SOFTWARE = 0;
    RL_OPENGL_11 = 1;
    RL_OPENGL_21 = 2;
    RL_OPENGL_33 = 3;
    RL_OPENGL_43 = 4;
    RL_OPENGL_ES_20 = 5;
    RL_OPENGL_ES_30 = 6;
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
  PrlTraceLogLevel = ^TrlTraceLogLevel;
  TrlTraceLogLevel =  Longint;
  Const
    RL_LOG_ALL = 0;
    RL_LOG_TRACE = 1;
    RL_LOG_DEBUG = 2;
    RL_LOG_INFO = 3;
    RL_LOG_WARNING = 4;
    RL_LOG_ERROR = 5;
    RL_LOG_FATAL = 6;
    RL_LOG_NONE = 7;
;
{ Texture pixel formats }
{ NOTE: Support depends on OpenGL version }
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
  PrlPixelFormat = ^TrlPixelFormat;
  TrlPixelFormat =  Longint;
  Const
    RL_PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1;
    RL_PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA = 2;
    RL_PIXELFORMAT_UNCOMPRESSED_R5G6B5 = 3;
    RL_PIXELFORMAT_UNCOMPRESSED_R8G8B8 = 4;
    RL_PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 = 5;
    RL_PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 = 6;
    RL_PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 = 7;
    RL_PIXELFORMAT_UNCOMPRESSED_R32 = 8;
    RL_PIXELFORMAT_UNCOMPRESSED_R32G32B32 = 9;
    RL_PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = 10;
    RL_PIXELFORMAT_UNCOMPRESSED_R16 = 11;
    RL_PIXELFORMAT_UNCOMPRESSED_R16G16B16 = 12;
    RL_PIXELFORMAT_UNCOMPRESSED_R16G16B16A16 = 13;
    RL_PIXELFORMAT_COMPRESSED_DXT1_RGB = 14;
    RL_PIXELFORMAT_COMPRESSED_DXT1_RGBA = 15;
    RL_PIXELFORMAT_COMPRESSED_DXT3_RGBA = 16;
    RL_PIXELFORMAT_COMPRESSED_DXT5_RGBA = 17;
    RL_PIXELFORMAT_COMPRESSED_ETC1_RGB = 18;
    RL_PIXELFORMAT_COMPRESSED_ETC2_RGB = 19;
    RL_PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA = 20;
    RL_PIXELFORMAT_COMPRESSED_PVRT_RGB = 21;
    RL_PIXELFORMAT_COMPRESSED_PVRT_RGBA = 22;
    RL_PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA = 23;
    RL_PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA = 24;
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
  PrlTextureFilter = ^TrlTextureFilter;
  TrlTextureFilter =  Longint;
  Const
    RL_TEXTURE_FILTER_POINT = 0;
    RL_TEXTURE_FILTER_BILINEAR = 1;
    RL_TEXTURE_FILTER_TRILINEAR = 2;
    RL_TEXTURE_FILTER_ANISOTROPIC_4X = 3;
    RL_TEXTURE_FILTER_ANISOTROPIC_8X = 4;
    RL_TEXTURE_FILTER_ANISOTROPIC_16X = 5;
;
{ Color blending modes (pre-defined) }
{ Blend textures considering alpha (default) }
{ Blend textures adding colors }
{ Blend textures multiplying colors }
{ Blend textures adding colors (alternative) }
{ Blend textures subtracting colors (alternative) }
{ Blend premultiplied textures considering alpha }
{ Blend textures using custom src/dst factors (use rlSetBlendFactors()) }
{ Blend textures using custom src/dst factors (use rlSetBlendFactorsSeparate()) }
type
  PrlBlendMode = ^TrlBlendMode;
  TrlBlendMode =  Longint;
  Const
    RL_BLEND_ALPHA = 0;
    RL_BLEND_ADDITIVE = 1;
    RL_BLEND_MULTIPLIED = 2;
    RL_BLEND_ADD_COLORS = 3;
    RL_BLEND_SUBTRACT_COLORS = 4;
    RL_BLEND_ALPHA_PREMULTIPLY = 5;
    RL_BLEND_CUSTOM = 6;
    RL_BLEND_CUSTOM_SEPARATE = 7;
;
{ Shader location point type }
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
{ Shader location: sampler2d texture: albedo (same as: RL_SHADER_LOC_MAP_DIFFUSE) }
{ Shader location: sampler2d texture: metalness (same as: RL_SHADER_LOC_MAP_SPECULAR) }
{ Shader location: sampler2d texture: normal }
{ Shader location: sampler2d texture: roughness }
{ Shader location: sampler2d texture: occlusion }
{ Shader location: sampler2d texture: emission }
{ Shader location: sampler2d texture: height }
{ Shader location: samplerCube texture: cubemap }
{ Shader location: samplerCube texture: irradiance }
{ Shader location: samplerCube texture: prefilter }
{ Shader location: sampler2d texture: brdf }
type
  PrlShaderLocationIndex = ^TrlShaderLocationIndex;
  TrlShaderLocationIndex =  Longint;
  Const
    RL_SHADER_LOC_VERTEX_POSITION = 0;
    RL_SHADER_LOC_VERTEX_TEXCOORD01 = 1;
    RL_SHADER_LOC_VERTEX_TEXCOORD02 = 2;
    RL_SHADER_LOC_VERTEX_NORMAL = 3;
    RL_SHADER_LOC_VERTEX_TANGENT = 4;
    RL_SHADER_LOC_VERTEX_COLOR = 5;
    RL_SHADER_LOC_MATRIX_MVP = 6;
    RL_SHADER_LOC_MATRIX_VIEW = 7;
    RL_SHADER_LOC_MATRIX_PROJECTION = 8;
    RL_SHADER_LOC_MATRIX_MODEL = 9;
    RL_SHADER_LOC_MATRIX_NORMAL = 10;
    RL_SHADER_LOC_VECTOR_VIEW = 11;
    RL_SHADER_LOC_COLOR_DIFFUSE = 12;
    RL_SHADER_LOC_COLOR_SPECULAR = 13;
    RL_SHADER_LOC_COLOR_AMBIENT = 14;
    RL_SHADER_LOC_MAP_ALBEDO = 15;
    RL_SHADER_LOC_MAP_METALNESS = 16;
    RL_SHADER_LOC_MAP_NORMAL = 17;
    RL_SHADER_LOC_MAP_ROUGHNESS = 18;
    RL_SHADER_LOC_MAP_OCCLUSION = 19;
    RL_SHADER_LOC_MAP_EMISSION = 20;
    RL_SHADER_LOC_MAP_HEIGHT = 21;
    RL_SHADER_LOC_MAP_CUBEMAP = 22;
    RL_SHADER_LOC_MAP_IRRADIANCE = 23;
    RL_SHADER_LOC_MAP_PREFILTER = 24;
    RL_SHADER_LOC_MAP_BRDF = 25;
;
  RL_SHADER_LOC_MAP_DIFFUSE = RL_SHADER_LOC_MAP_ALBEDO;  
  RL_SHADER_LOC_MAP_SPECULAR = RL_SHADER_LOC_MAP_METALNESS;  
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
  PrlShaderUniformDataType = ^TrlShaderUniformDataType;
  TrlShaderUniformDataType =  Longint;
  Const
    RL_SHADER_UNIFORM_FLOAT = 0;
    RL_SHADER_UNIFORM_VEC2 = 1;
    RL_SHADER_UNIFORM_VEC3 = 2;
    RL_SHADER_UNIFORM_VEC4 = 3;
    RL_SHADER_UNIFORM_INT = 4;
    RL_SHADER_UNIFORM_IVEC2 = 5;
    RL_SHADER_UNIFORM_IVEC3 = 6;
    RL_SHADER_UNIFORM_IVEC4 = 7;
    RL_SHADER_UNIFORM_UINT = 8;
    RL_SHADER_UNIFORM_UIVEC2 = 9;
    RL_SHADER_UNIFORM_UIVEC3 = 10;
    RL_SHADER_UNIFORM_UIVEC4 = 11;
    RL_SHADER_UNIFORM_SAMPLER2D = 12;
;
{ Shader attribute data types }
{ Shader attribute type: float }
{ Shader attribute type: vec2 (2 float) }
{ Shader attribute type: vec3 (3 float) }
{ Shader attribute type: vec4 (4 float) }
type
  PrlShaderAttributeDataType = ^TrlShaderAttributeDataType;
  TrlShaderAttributeDataType =  Longint;
  Const
    RL_SHADER_ATTRIB_FLOAT = 0;
    RL_SHADER_ATTRIB_VEC2 = 1;
    RL_SHADER_ATTRIB_VEC3 = 2;
    RL_SHADER_ATTRIB_VEC4 = 3;
;
{ Framebuffer attachment type }
{ NOTE: By default up to 8 color channels defined, but it can be more }
{ Framebuffer attachment type: color 0 }
{ Framebuffer attachment type: color 1 }
{ Framebuffer attachment type: color 2 }
{ Framebuffer attachment type: color 3 }
{ Framebuffer attachment type: color 4 }
{ Framebuffer attachment type: color 5 }
{ Framebuffer attachment type: color 6 }
{ Framebuffer attachment type: color 7 }
{ Framebuffer attachment type: depth }
{ Framebuffer attachment type: stencil }
type
  PrlFramebufferAttachType = ^TrlFramebufferAttachType;
  TrlFramebufferAttachType =  Longint;
  Const
    RL_ATTACHMENT_COLOR_CHANNEL0 = 0;
    RL_ATTACHMENT_COLOR_CHANNEL1 = 1;
    RL_ATTACHMENT_COLOR_CHANNEL2 = 2;
    RL_ATTACHMENT_COLOR_CHANNEL3 = 3;
    RL_ATTACHMENT_COLOR_CHANNEL4 = 4;
    RL_ATTACHMENT_COLOR_CHANNEL5 = 5;
    RL_ATTACHMENT_COLOR_CHANNEL6 = 6;
    RL_ATTACHMENT_COLOR_CHANNEL7 = 7;
    RL_ATTACHMENT_DEPTH = 100;
    RL_ATTACHMENT_STENCIL = 200;
;
{ Framebuffer texture attachment type }
{ Framebuffer texture attachment type: cubemap, +X side }
{ Framebuffer texture attachment type: cubemap, -X side }
{ Framebuffer texture attachment type: cubemap, +Y side }
{ Framebuffer texture attachment type: cubemap, -Y side }
{ Framebuffer texture attachment type: cubemap, +Z side }
{ Framebuffer texture attachment type: cubemap, -Z side }
{ Framebuffer texture attachment type: texture2d }
{ Framebuffer texture attachment type: renderbuffer }
type
  PrlFramebufferAttachTextureType = ^TrlFramebufferAttachTextureType;
  TrlFramebufferAttachTextureType =  Longint;
  Const
    RL_ATTACHMENT_CUBEMAP_POSITIVE_X = 0;
    RL_ATTACHMENT_CUBEMAP_NEGATIVE_X = 1;
    RL_ATTACHMENT_CUBEMAP_POSITIVE_Y = 2;
    RL_ATTACHMENT_CUBEMAP_NEGATIVE_Y = 3;
    RL_ATTACHMENT_CUBEMAP_POSITIVE_Z = 4;
    RL_ATTACHMENT_CUBEMAP_NEGATIVE_Z = 5;
    RL_ATTACHMENT_TEXTURE2D = 100;
    RL_ATTACHMENT_RENDERBUFFER = 200;
;
{ Face culling mode }
type
  PrlCullMode = ^TrlCullMode;
  TrlCullMode =  Longint;
  Const
    RL_CULL_FACE_FRONT = 0;
    RL_CULL_FACE_BACK = 1;
;
{------------------------------------------------------------------------------------ }
{ Functions Declaration - Matrix operations }
{------------------------------------------------------------------------------------ }

procedure rlMatrixMode(mode:longint);cdecl;external libraylib;
{ Choose the current matrix to be transformed }
procedure rlPushMatrix;cdecl;external libraylib;
{ Push the current matrix to stack }
procedure rlPopMatrix;cdecl;external libraylib;
{ Pop latest inserted matrix from stack }
procedure rlLoadIdentity;cdecl;external libraylib;
{ Reset current matrix to identity matrix }
procedure rlTranslatef(x:single; y:single; z:single);cdecl;external libraylib;
{ Multiply the current matrix by a translation matrix }
procedure rlRotatef(angle:single; x:single; y:single; z:single);cdecl;external libraylib;
{ Multiply the current matrix by a rotation matrix }
procedure rlScalef(x:single; y:single; z:single);cdecl;external libraylib;
{ Multiply the current matrix by a scaling matrix }
procedure rlMultMatrixf(matf:Psingle);cdecl;external libraylib;
{ Multiply the current matrix by another matrix }
procedure rlFrustum(left:Tdouble; right:Tdouble; bottom:Tdouble; top:Tdouble; znear:Tdouble; 
            zfar:Tdouble);cdecl;external libraylib;
procedure rlOrtho(left:Tdouble; right:Tdouble; bottom:Tdouble; top:Tdouble; znear:Tdouble; 
            zfar:Tdouble);cdecl;external libraylib;
procedure rlViewport(x:longint; y:longint; width:longint; height:longint);cdecl;external libraylib;
{ Set the viewport area }
procedure rlSetClipPlanes(nearPlane:Tdouble; farPlane:Tdouble);cdecl;external libraylib;
{ Set clip planes distances }
function rlGetCullDistanceNear:Tdouble;cdecl;external libraylib;
{ Get cull plane distance near }
function rlGetCullDistanceFar:Tdouble;cdecl;external libraylib;
{ Get cull plane distance far }
{------------------------------------------------------------------------------------ }
{ Functions Declaration - Vertex level operations }
{------------------------------------------------------------------------------------ }
procedure rlBegin(mode:longint);cdecl;external libraylib;
{ Initialize drawing mode (how to organize vertex) }
procedure rlEnd;cdecl;external libraylib;
{ Finish vertex providing }
procedure rlVertex2i(x:longint; y:longint);cdecl;external libraylib;
{ Define one vertex (position) - 2 int }
procedure rlVertex2f(x:single; y:single);cdecl;external libraylib;
{ Define one vertex (position) - 2 float }
procedure rlVertex3f(x:single; y:single; z:single);cdecl;external libraylib;
{ Define one vertex (position) - 3 float }
procedure rlTexCoord2f(x:single; y:single);cdecl;external libraylib;
{ Define one vertex (texture coordinate) - 2 float }
procedure rlNormal3f(x:single; y:single; z:single);cdecl;external libraylib;
{ Define one vertex (normal) - 3 float }
procedure rlColor4ub(r:byte; g:byte; b:byte; a:byte);cdecl;external libraylib;
{ Define one vertex (color) - 4 byte }
procedure rlColor3f(x:single; y:single; z:single);cdecl;external libraylib;
{ Define one vertex (color) - 3 float }
procedure rlColor4f(x:single; y:single; z:single; w:single);cdecl;external libraylib;
{ Define one vertex (color) - 4 float }
{------------------------------------------------------------------------------------ }
{ Functions Declaration - OpenGL style functions (common to 1.1, 3.3+, ES2) }
{ NOTE: This functions are used to completely abstract raylib code from OpenGL layer, }
{ some of them are direct wrappers over OpenGL calls, some others are custom }
{------------------------------------------------------------------------------------ }
{ Vertex buffers state }
function rlEnableVertexArray(vaoId:dword):Tbool;cdecl;external libraylib;
{ Enable vertex array (VAO, if supported) }
procedure rlDisableVertexArray;cdecl;external libraylib;
{ Disable vertex array (VAO, if supported) }
procedure rlEnableVertexBuffer(id:dword);cdecl;external libraylib;
{ Enable vertex buffer (VBO) }
procedure rlDisableVertexBuffer;cdecl;external libraylib;
{ Disable vertex buffer (VBO) }
procedure rlEnableVertexBufferElement(id:dword);cdecl;external libraylib;
{ Enable vertex buffer element (VBO element) }
procedure rlDisableVertexBufferElement;cdecl;external libraylib;
{ Disable vertex buffer element (VBO element) }
procedure rlEnableVertexAttribute(index:dword);cdecl;external libraylib;
{ Enable vertex attribute index }
procedure rlDisableVertexAttribute(index:dword);cdecl;external libraylib;
{ Disable vertex attribute index }
procedure rlEnableStatePointer(vertexAttribType:longint; buffer:pointer);cdecl;external libraylib;
{ Enable attribute state pointer }
procedure rlDisableStatePointer(vertexAttribType:longint);cdecl;external libraylib;
{ Disable attribute state pointer }
{ Textures state }
procedure rlActiveTextureSlot(slot:longint);cdecl;external libraylib;
{ Select and active a texture slot }
procedure rlEnableTexture(id:dword);cdecl;external libraylib;
{ Enable texture }
procedure rlDisableTexture;cdecl;external libraylib;
{ Disable texture }
procedure rlEnableTextureCubemap(id:dword);cdecl;external libraylib;
{ Enable texture cubemap }
procedure rlDisableTextureCubemap;cdecl;external libraylib;
{ Disable texture cubemap }
procedure rlTextureParameters(id:dword; param:longint; value:longint);cdecl;external libraylib;
{ Set texture parameters (filter, wrap) }
procedure rlCubemapParameters(id:dword; param:longint; value:longint);cdecl;external libraylib;
{ Set cubemap parameters (filter, wrap) }
{ Shader state }
procedure rlEnableShader(id:dword);cdecl;external libraylib;
{ Enable shader program }
procedure rlDisableShader;cdecl;external libraylib;
{ Disable shader program }
{ Framebuffer state }
procedure rlEnableFramebuffer(id:dword);cdecl;external libraylib;
{ Enable render texture (fbo) }
procedure rlDisableFramebuffer;cdecl;external libraylib;
{ Disable render texture (fbo), return to default framebuffer }
function rlGetActiveFramebuffer:dword;cdecl;external libraylib;
{ Get the currently active render texture (fbo), 0 for default framebuffer }
procedure rlActiveDrawBuffers(count:longint);cdecl;external libraylib;
{ Activate multiple draw color buffers }
procedure rlBlitFramebuffer(srcX:longint; srcY:longint; srcWidth:longint; srcHeight:longint; dstX:longint; 
            dstY:longint; dstWidth:longint; dstHeight:longint; bufferMask:longint);cdecl;external libraylib;
{ Blit active framebuffer to main framebuffer }
procedure rlBindFramebuffer(target:dword; framebuffer:dword);cdecl;external libraylib;
{ Bind framebuffer (FBO) }
{ General render state }
procedure rlEnableColorBlend;cdecl;external libraylib;
{ Enable color blending }
procedure rlDisableColorBlend;cdecl;external libraylib;
{ Disable color blending }
procedure rlEnableDepthTest;cdecl;external libraylib;
{ Enable depth test }
procedure rlDisableDepthTest;cdecl;external libraylib;
{ Disable depth test }
procedure rlEnableDepthMask;cdecl;external libraylib;
{ Enable depth write }
procedure rlDisableDepthMask;cdecl;external libraylib;
{ Disable depth write }
procedure rlEnableBackfaceCulling;cdecl;external libraylib;
{ Enable backface culling }
procedure rlDisableBackfaceCulling;cdecl;external libraylib;
{ Disable backface culling }
procedure rlColorMask(r:Tbool; g:Tbool; b:Tbool; a:Tbool);cdecl;external libraylib;
{ Color mask control }
procedure rlSetCullFace(mode:longint);cdecl;external libraylib;
{ Set face culling mode }
procedure rlEnableScissorTest;cdecl;external libraylib;
{ Enable scissor test }
procedure rlDisableScissorTest;cdecl;external libraylib;
{ Disable scissor test }
procedure rlScissor(x:longint; y:longint; width:longint; height:longint);cdecl;external libraylib;
{ Scissor test }
procedure rlEnablePointMode;cdecl;external libraylib;
{ Enable point mode }
procedure rlDisablePointMode;cdecl;external libraylib;
{ Disable point mode }
procedure rlSetPointSize(size:single);cdecl;external libraylib;
{ Set the point drawing size }
function rlGetPointSize:single;cdecl;external libraylib;
{ Get the point drawing size }
procedure rlEnableWireMode;cdecl;external libraylib;
{ Enable wire mode }
procedure rlDisableWireMode;cdecl;external libraylib;
{ Disable wire mode }
procedure rlSetLineWidth(width:single);cdecl;external libraylib;
{ Set the line drawing width }
function rlGetLineWidth:single;cdecl;external libraylib;
{ Get the line drawing width }
procedure rlEnableSmoothLines;cdecl;external libraylib;
{ Enable line aliasing }
procedure rlDisableSmoothLines;cdecl;external libraylib;
{ Disable line aliasing }
procedure rlEnableStereoRender;cdecl;external libraylib;
{ Enable stereo rendering }
procedure rlDisableStereoRender;cdecl;external libraylib;
{ Disable stereo rendering }
function rlIsStereoRenderEnabled:Tbool;cdecl;external libraylib;
{ Check if stereo render is enabled }
procedure rlClearColor(r:byte; g:byte; b:byte; a:byte);cdecl;external libraylib;
{ Clear color buffer with color }
procedure rlClearScreenBuffers;cdecl;external libraylib;
{ Clear used screen buffers (color and depth) }
procedure rlCheckErrors;cdecl;external libraylib;
{ Check and log OpenGL error codes }
procedure rlSetBlendMode(mode:longint);cdecl;external libraylib;
{ Set blending mode }
procedure rlSetBlendFactors(glSrcFactor:longint; glDstFactor:longint; glEquation:longint);cdecl;external libraylib;
{ Set blending mode factor and equation (using OpenGL factors) }
procedure rlSetBlendFactorsSeparate(glSrcRGB:longint; glDstRGB:longint; glSrcAlpha:longint; glDstAlpha:longint; glEqRGB:longint; 
            glEqAlpha:longint);cdecl;external libraylib;
{ Set blending mode factors and equations separately (using OpenGL factors) }
{------------------------------------------------------------------------------------ }
{ Functions Declaration - rlgl functionality }
{------------------------------------------------------------------------------------ }
{ rlgl initialization functions }
procedure rlglInit(width:longint; height:longint);cdecl;external libraylib;
{ Initialize rlgl (buffers, shaders, textures, states) }
procedure rlglClose;cdecl;external libraylib;
{ De-initialize rlgl (buffers, shaders, textures) }
procedure rlLoadExtensions(loader:pointer);cdecl;external libraylib;
{ Load OpenGL extensions (loader function required) }
function rlGetProcAddress(procName:Pchar):pointer;cdecl;external libraylib;
{ Get OpenGL procedure address }
function rlGetVersion:longint;cdecl;external libraylib;
{ Get current OpenGL version }
procedure rlSetFramebufferWidth(width:longint);cdecl;external libraylib;
{ Set current framebuffer width }
function rlGetFramebufferWidth:longint;cdecl;external libraylib;
{ Get default framebuffer width }
procedure rlSetFramebufferHeight(height:longint);cdecl;external libraylib;
{ Set current framebuffer height }
function rlGetFramebufferHeight:longint;cdecl;external libraylib;
{ Get default framebuffer height }
function rlGetTextureIdDefault:dword;cdecl;external libraylib;
{ Get default texture id }
function rlGetShaderIdDefault:dword;cdecl;external libraylib;
{ Get default shader id }
function rlGetShaderLocsDefault:Plongint;cdecl;external libraylib;
{ Get default shader locations }
{ Render batch management }
{ NOTE: rlgl provides a default render batch to behave like OpenGL 1.1 immediate mode }
{ but this render batch API is exposed in case of custom batches are required }
function rlLoadRenderBatch(numBuffers:longint; bufferElements:longint):TrlRenderBatch;cdecl;external libraylib;
{ Load a render batch system }
procedure rlUnloadRenderBatch(batch:TrlRenderBatch);cdecl;external libraylib;
{ Unload render batch system }
procedure rlDrawRenderBatch(batch:PrlRenderBatch);cdecl;external libraylib;
{ Draw render batch data (Update->Draw->Reset) }
procedure rlSetRenderBatchActive(batch:PrlRenderBatch);cdecl;external libraylib;
{ Set the active render batch for rlgl (NULL for default internal) }
procedure rlDrawRenderBatchActive;cdecl;external libraylib;
{ Update and draw internal render batch }
function rlCheckRenderBatchLimit(vCount:longint):Tbool;cdecl;external libraylib;
{ Check internal buffer overflow for a given number of vertex }
procedure rlSetTexture(id:dword);cdecl;external libraylib;
{ Set current texture for render batch and check buffers limits }
{------------------------------------------------------------------------------------------------------------------------ }
{ Vertex buffers management }
function rlLoadVertexArray:dword;cdecl;external libraylib;
{ Load vertex array (vao) if supported }
function rlLoadVertexBuffer(buffer:pointer; size:longint; dynamic:Tbool):dword;cdecl;external libraylib;
{ Load a vertex buffer object }
function rlLoadVertexBufferElement(buffer:pointer; size:longint; dynamic:Tbool):dword;cdecl;external libraylib;
{ Load vertex buffer elements object }
procedure rlUpdateVertexBuffer(bufferId:dword; data:pointer; dataSize:longint; offset:longint);cdecl;external libraylib;
{ Update vertex buffer object data on GPU buffer }
procedure rlUpdateVertexBufferElements(id:dword; data:pointer; dataSize:longint; offset:longint);cdecl;external libraylib;
{ Update vertex buffer elements data on GPU buffer }
procedure rlUnloadVertexArray(vaoId:dword);cdecl;external libraylib;
{ Unload vertex array (vao) }
procedure rlUnloadVertexBuffer(vboId:dword);cdecl;external libraylib;
{ Unload vertex buffer object }
procedure rlSetVertexAttribute(index:dword; compSize:longint; _type:longint; normalized:Tbool; stride:longint; 
            offset:longint);cdecl;external libraylib;
{ Set vertex attribute data configuration }
procedure rlSetVertexAttributeDivisor(index:dword; divisor:longint);cdecl;external libraylib;
{ Set vertex attribute data divisor }
procedure rlSetVertexAttributeDefault(locIndex:longint; value:pointer; attribType:longint; count:longint);cdecl;external libraylib;
{ Set vertex attribute default value, when attribute to provided }
procedure rlDrawVertexArray(offset:longint; count:longint);cdecl;external libraylib;
{ Draw vertex array (currently active vao) }
procedure rlDrawVertexArrayElements(offset:longint; count:longint; buffer:pointer);cdecl;external libraylib;
{ Draw vertex array elements }
procedure rlDrawVertexArrayInstanced(offset:longint; count:longint; instances:longint);cdecl;external libraylib;
{ Draw vertex array (currently active vao) with instancing }
procedure rlDrawVertexArrayElementsInstanced(offset:longint; count:longint; buffer:pointer; instances:longint);cdecl;external libraylib;
{ Draw vertex array elements with instancing }
{ Textures management }
function rlLoadTexture(data:pointer; width:longint; height:longint; format:longint; mipmapCount:longint):dword;cdecl;external libraylib;
{ Load texture data }
function rlLoadTextureDepth(width:longint; height:longint; useRenderBuffer:Tbool):dword;cdecl;external libraylib;
{ Load depth texture/renderbuffer (to be attached to fbo) }
function rlLoadTextureCubemap(data:pointer; size:longint; format:longint; mipmapCount:longint):dword;cdecl;external libraylib;
{ Load texture cubemap data }
procedure rlUpdateTexture(id:dword; offsetX:longint; offsetY:longint; width:longint; height:longint; 
            format:longint; data:pointer);cdecl;external libraylib;
{ Update texture with new data on GPU }
procedure rlGetGlTextureFormats(format:longint; glInternalFormat:Pdword; glFormat:Pdword; glType:Pdword);cdecl;external libraylib;
{ Get OpenGL internal formats }
function rlGetPixelFormatName(format:dword):Pchar;cdecl;external libraylib;
{ Get name string for pixel format }
procedure rlUnloadTexture(id:dword);cdecl;external libraylib;
{ Unload texture from GPU memory }
procedure rlGenTextureMipmaps(id:dword; width:longint; height:longint; format:longint; mipmaps:Plongint);cdecl;external libraylib;
{ Generate mipmap data for selected texture }
function rlReadTexturePixels(id:dword; width:longint; height:longint; format:longint):pointer;cdecl;external libraylib;
{ Read texture pixel data }
function rlReadScreenPixels(width:longint; height:longint):Pbyte;cdecl;external libraylib;
{ Read screen pixel data (color buffer) }
{ Framebuffer management (fbo) }
function rlLoadFramebuffer:dword;cdecl;external libraylib;
{ Load an empty framebuffer }
procedure rlFramebufferAttach(id:dword; texId:dword; attachType:longint; texType:longint; mipLevel:longint);cdecl;external libraylib;
{ Attach texture/renderbuffer to a framebuffer }
function rlFramebufferComplete(id:dword):Tbool;cdecl;external libraylib;
{ Verify framebuffer is complete }
procedure rlUnloadFramebuffer(id:dword);cdecl;external libraylib;
{ Delete framebuffer from GPU }
{ WARNING: Copy and resize framebuffer functionality only defined for software backend }
procedure rlCopyFramebuffer(x:longint; y:longint; width:longint; height:longint; format:longint; 
            pixels:pointer);cdecl;external libraylib;
{ Copy framebuffer pixel data to internal buffer }
procedure rlResizeFramebuffer(width:longint; height:longint);cdecl;external libraylib;
{ Resize internal framebuffer }
{ Shaders management }
function rlLoadShader(code:Pchar; _type:longint):dword;cdecl;external libraylib;
{ Load (compile) shader and return shader id (type: RL_VERTEX_SHADER, RL_FRAGMENT_SHADER, RL_COMPUTE_SHADER) }
function rlLoadShaderProgram(vsCode:Pchar; fsCode:Pchar):dword;cdecl;external libraylib;
{ Load shader from code strings }
function rlLoadShaderProgramEx(vsId:dword; fsId:dword):dword;cdecl;external libraylib;
{ Load shader program, using already loaded shader ids }
function rlLoadShaderProgramCompute(csId:dword):dword;cdecl;external libraylib;
{ Load compute shader program }
procedure rlUnloadShader(id:dword);cdecl;external libraylib;
{ Unload shader, loaded with rlLoadShader() }
procedure rlUnloadShaderProgram(id:dword);cdecl;external libraylib;
{ Unload shader program }
function rlGetLocationUniform(id:dword; uniformName:Pchar):longint;cdecl;external libraylib;
{ Get shader location uniform, requires shader program id }
function rlGetLocationAttrib(id:dword; attribName:Pchar):longint;cdecl;external libraylib;
{ Get shader location attribute, requires shader program id }
procedure rlSetUniform(locIndex:longint; value:pointer; uniformType:longint; count:longint);cdecl;external libraylib;
{ Set shader value uniform }
procedure rlSetUniformMatrix(locIndex:longint; mat:TMatrix);cdecl;external libraylib;
{ Set shader value matrix }
procedure rlSetUniformMatrices(locIndex:longint; mat:PMatrix; count:longint);cdecl;external libraylib;
{ Set shader value matrices }
procedure rlSetUniformSampler(locIndex:longint; textureId:dword);cdecl;external libraylib;
{ Set shader value sampler }
procedure rlSetShader(id:dword; locs:Plongint);cdecl;external libraylib;
{ Set shader currently active (id and locations) }
{ Compute shader management }
procedure rlComputeShaderDispatch(groupX:dword; groupY:dword; groupZ:dword);cdecl;external libraylib;
{ Dispatch compute shader (equivalent to *draw* for graphics pipeline) }
{ Shader buffer storage object management (ssbo) }
function rlLoadShaderBuffer(size:dword; data:pointer; usageHint:longint):dword;cdecl;external libraylib;
{ Load shader storage buffer object (SSBO) }
procedure rlUnloadShaderBuffer(ssboId:dword);cdecl;external libraylib;
{ Unload shader storage buffer object (SSBO) }
procedure rlUpdateShaderBuffer(id:dword; data:pointer; dataSize:dword; offset:dword);cdecl;external libraylib;
{ Update SSBO buffer data }
procedure rlBindShaderBuffer(id:dword; index:dword);cdecl;external libraylib;
{ Bind SSBO buffer }
procedure rlReadShaderBuffer(id:dword; dest:pointer; count:dword; offset:dword);cdecl;external libraylib;
{ Read SSBO buffer data (GPU->CPU) }
procedure rlCopyShaderBuffer(destId:dword; srcId:dword; destOffset:dword; srcOffset:dword; count:dword);cdecl;external libraylib;
{ Copy SSBO data between buffers }
function rlGetShaderBufferSize(id:dword):dword;cdecl;external libraylib;
{ Get SSBO buffer size }
{ Buffer management }
procedure rlBindImageTexture(id:dword; index:dword; format:longint; readonly:Tbool);cdecl;external libraylib;
{ Bind image texture }
{ Matrix state management }
function rlGetMatrixModelview:TMatrix;cdecl;external libraylib;
{ Get internal modelview matrix }
function rlGetMatrixProjection:TMatrix;cdecl;external libraylib;
{ Get internal projection matrix }
function rlGetMatrixTransform:TMatrix;cdecl;external libraylib;
{ Get internal accumulated transform matrix }
function rlGetMatrixProjectionStereo(eye:longint):TMatrix;cdecl;external libraylib;
{ Get internal projection matrix for stereo render (selected eye) }
function rlGetMatrixViewOffsetStereo(eye:longint):TMatrix;cdecl;external libraylib;
{ Get internal view offset matrix for stereo render (selected eye) }
procedure rlSetMatrixProjection(proj:TMatrix);cdecl;external libraylib;
{ Set a custom projection matrix (replaces internal projection matrix) }
procedure rlSetMatrixModelview(view:TMatrix);cdecl;external libraylib;
{ Set a custom modelview matrix (replaces internal modelview matrix) }
procedure rlSetMatrixProjectionStereo(right:TMatrix; left:TMatrix);cdecl;external libraylib;
{ Set eyes projection matrices for stereo rendering }
procedure rlSetMatrixViewOffsetStereo(right:TMatrix; left:TMatrix);cdecl;external libraylib;
{ Set eyes view offsets matrices for stereo rendering }
{ Quick and dirty cube/quad buffers load->draw->unload }
procedure rlLoadDrawCube;cdecl;external libraylib;
{ Load and draw a cube }
procedure rlLoadDrawQuad;cdecl;external libraylib;
{ Load and draw a quad }

// === Konventiert am: 17-11-26 13:59:18 ===


implementation



end.
