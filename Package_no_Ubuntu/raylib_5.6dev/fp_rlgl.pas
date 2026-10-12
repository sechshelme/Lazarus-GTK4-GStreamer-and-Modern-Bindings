unit fp_rlgl;

interface

uses
  fp_raylib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  RLGL_VERSION = '5.0';
  RL_DEFAULT_BATCH_BUFFER_ELEMENTS = 8192; // ????
  //  RL_DEFAULT_BATCH_BUFFER_ELEMENTS = 2048;
  RL_DEFAULT_BATCH_BUFFERS = 1;
  RL_DEFAULT_BATCH_DRAWCALLS = 256;
  RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS = 4;
  RL_MAX_MATRIX_STACK_SIZE = 32;
  RL_MAX_SHADER_LOCATIONS = 32;
  RL_CULL_DISTANCE_NEAR = 0.05;
  RL_CULL_DISTANCE_FAR = 4000.0;

const
  RL_TEXTURE_WRAP_S = $2802;
  RL_TEXTURE_WRAP_T = $2803;
  RL_TEXTURE_MAG_FILTER = $2800;
  RL_TEXTURE_MIN_FILTER = $2801;
  RL_TEXTURE_FILTER_NEAREST = $2600;
  RL_TEXTURE_FILTER_LINEAR = $2601;
  RL_TEXTURE_FILTER_MIP_NEAREST = $2700;
  RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR = $2702;
  RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST = $2701;
  RL_TEXTURE_FILTER_MIP_LINEAR = $2703;
  RL_TEXTURE_FILTER_ANISOTROPIC = $3000;
  RL_TEXTURE_MIPMAP_BIAS_RATIO = $4000;
  RL_TEXTURE_WRAP_REPEAT = $2901;
  RL_TEXTURE_WRAP_CLAMP = $812F;
  RL_TEXTURE_WRAP_MIRROR_REPEAT = $8370;
  RL_TEXTURE_WRAP_MIRROR_CLAMP = $8742;
  RL_MODELVIEW = $1700;
  RL_PROJECTION = $1701;
  RL_TEXTURE = $1702;
  RL_LINES = $0001;
  RL_TRIANGLES = $0004;
  RL_QUADS = $0007;
  RL_UNSIGNED_BYTE = $1401;
  RL_FLOAT = $1406;
  RL_STREAM_DRAW = $88E0;
  RL_STREAM_READ = $88E1;
  RL_STREAM_COPY = $88E2;
  RL_STATIC_DRAW = $88E4;
  RL_STATIC_READ = $88E5;
  RL_STATIC_COPY = $88E6;
  RL_DYNAMIC_DRAW = $88E8;
  RL_DYNAMIC_READ = $88E9;
  RL_DYNAMIC_COPY = $88EA;
  RL_FRAGMENT_SHADER = $8B30;
  RL_VERTEX_SHADER = $8B31;
  RL_COMPUTE_SHADER = $91B9;
  RL_ZERO = 0;
  RL_ONE = 1;
  RL_SRC_COLOR = $0300;
  RL_ONE_MINUS_SRC_COLOR = $0301;
  RL_SRC_ALPHA = $0302;
  RL_ONE_MINUS_SRC_ALPHA = $0303;
  RL_DST_ALPHA = $0304;
  RL_ONE_MINUS_DST_ALPHA = $0305;
  RL_DST_COLOR = $0306;
  RL_ONE_MINUS_DST_COLOR = $0307;
  RL_SRC_ALPHA_SATURATE = $0308;
  RL_CONSTANT_COLOR = $8001;
  RL_ONE_MINUS_CONSTANT_COLOR = $8002;
  RL_CONSTANT_ALPHA = $8003;
  RL_ONE_MINUS_CONSTANT_ALPHA = $8004;
  RL_FUNC_ADD = $8006;
  RL_MIN = $8007;
  RL_MAX = $8008;
  RL_FUNC_SUBTRACT = $800A;
  RL_FUNC_REVERSE_SUBTRACT = $800B;
  RL_BLEND_EQUATION = $8009;
  RL_BLEND_EQUATION_RGB = $8009;
  RL_BLEND_EQUATION_ALPHA = $883D;
  RL_BLEND_DST_RGB = $80C8;
  RL_BLEND_SRC_RGB = $80C9;
  RL_BLEND_DST_ALPHA = $80CA;
  RL_BLEND_SRC_ALPHA = $80CB;
  RL_BLEND_COLOR = $8005;
  RL_READ_FRAMEBUFFER = $8CA8;
  RL_DRAW_FRAMEBUFFER = $8CA9;

const
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_POSITION = 0;
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD = 1;
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_NORMAL = 2;
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_COLOR = 3;
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_TANGENT = 4;
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD2 = 5;
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_INDICES = 6;
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEIDS = 7;
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEWEIGHTS = 8;
  RL_DEFAULT_SHADER_ATTRIB_LOCATION_INSTANCE_TX = 9;

type
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
  PMatrix = ^TMatrix;

type
  TrlVertexBuffer = record
    elementCount: longint;
    vertices: Psingle;
    texcoords: Psingle;
    normals: Psingle;
    colors: pbyte;
    indices: Pdword;
    vaoId: dword;
    vboId: array[0..4] of dword;
  end;
  PrlVertexBuffer = ^TrlVertexBuffer;

  TrlDrawCall = record
    mode: longint;
    vertexCount: longint;
    vertexAlignment: longint;
    textureId: dword;
  end;
  PrlDrawCall = ^TrlDrawCall;

  TrlRenderBatch = record
    bufferCount: longint;
    currentBuffer: longint;
    vertexBuffer: PrlVertexBuffer;
    draws: PrlDrawCall;
    drawCounter: longint;
    currentDepth: single;
  end;
  PrlRenderBatch = ^TrlRenderBatch;

type
  PrlGlVersion = ^TrlGlVersion;
  TrlGlVersion = longint;

const
  RL_OPENGL_11_SOFTWARE = 0;
  RL_OPENGL_11 = 1;
  RL_OPENGL_21 = 2;
  RL_OPENGL_33 = 3;
  RL_OPENGL_43 = 4;
  RL_OPENGL_ES_20 = 5;
  RL_OPENGL_ES_30 = 6;

type
  PrlTraceLogLevel = ^TrlTraceLogLevel;
  TrlTraceLogLevel = longint;

const
  RL_LOG_ALL = 0;
  RL_LOG_TRACE = 1;
  RL_LOG_DEBUG = 2;
  RL_LOG_INFO = 3;
  RL_LOG_WARNING = 4;
  RL_LOG_ERROR = 5;
  RL_LOG_FATAL = 6;
  RL_LOG_NONE = 7;

type
  PrlPixelFormat = ^TrlPixelFormat;
  TrlPixelFormat = longint;

const
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

type
  PrlTextureFilter = ^TrlTextureFilter;
  TrlTextureFilter = longint;

const
  RL_TEXTURE_FILTER_POINT = 0;
  RL_TEXTURE_FILTER_BILINEAR = 1;
  RL_TEXTURE_FILTER_TRILINEAR = 2;
  RL_TEXTURE_FILTER_ANISOTROPIC_4X = 3;
  RL_TEXTURE_FILTER_ANISOTROPIC_8X = 4;
  RL_TEXTURE_FILTER_ANISOTROPIC_16X = 5;

type
  PrlBlendMode = ^TrlBlendMode;
  TrlBlendMode = longint;

const
  RL_BLEND_ALPHA = 0;
  RL_BLEND_ADDITIVE = 1;
  RL_BLEND_MULTIPLIED = 2;
  RL_BLEND_ADD_COLORS = 3;
  RL_BLEND_SUBTRACT_COLORS = 4;
  RL_BLEND_ALPHA_PREMULTIPLY = 5;
  RL_BLEND_CUSTOM = 6;
  RL_BLEND_CUSTOM_SEPARATE = 7;

type
  PrlShaderLocationIndex = ^TrlShaderLocationIndex;
  TrlShaderLocationIndex = longint;

const
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

  RL_SHADER_LOC_MAP_DIFFUSE = RL_SHADER_LOC_MAP_ALBEDO;
  RL_SHADER_LOC_MAP_SPECULAR = RL_SHADER_LOC_MAP_METALNESS;

type
  PrlShaderUniformDataType = ^TrlShaderUniformDataType;
  TrlShaderUniformDataType = longint;

const
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

type
  PrlShaderAttributeDataType = ^TrlShaderAttributeDataType;
  TrlShaderAttributeDataType = longint;

const
  RL_SHADER_ATTRIB_FLOAT = 0;
  RL_SHADER_ATTRIB_VEC2 = 1;
  RL_SHADER_ATTRIB_VEC3 = 2;
  RL_SHADER_ATTRIB_VEC4 = 3;

type
  PrlFramebufferAttachType = ^TrlFramebufferAttachType;
  TrlFramebufferAttachType = longint;

const
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

type
  PrlFramebufferAttachTextureType = ^TrlFramebufferAttachTextureType;
  TrlFramebufferAttachTextureType = longint;

const
  RL_ATTACHMENT_CUBEMAP_POSITIVE_X = 0;
  RL_ATTACHMENT_CUBEMAP_NEGATIVE_X = 1;
  RL_ATTACHMENT_CUBEMAP_POSITIVE_Y = 2;
  RL_ATTACHMENT_CUBEMAP_NEGATIVE_Y = 3;
  RL_ATTACHMENT_CUBEMAP_POSITIVE_Z = 4;
  RL_ATTACHMENT_CUBEMAP_NEGATIVE_Z = 5;
  RL_ATTACHMENT_TEXTURE2D = 100;
  RL_ATTACHMENT_RENDERBUFFER = 200;

type
  PrlCullMode = ^TrlCullMode;
  TrlCullMode = longint;

const
  RL_CULL_FACE_FRONT = 0;
  RL_CULL_FACE_BACK = 1;

procedure rlMatrixMode(mode: longint); cdecl; external libraylib;
procedure rlPushMatrix; cdecl; external libraylib;
procedure rlPopMatrix; cdecl; external libraylib;
procedure rlLoadIdentity; cdecl; external libraylib;
procedure rlTranslatef(x: single; y: single; z: single); cdecl; external libraylib;
procedure rlRotatef(angle: single; x: single; y: single; z: single); cdecl; external libraylib;
procedure rlScalef(x: single; y: single; z: single); cdecl; external libraylib;
procedure rlMultMatrixf(matf: Psingle); cdecl; external libraylib;
procedure rlFrustum(left: double; right: double; bottom: double; top: double; znear: double; zfar: double); cdecl; external libraylib;
procedure rlOrtho(left: double; right: double; bottom: double; top: double; znear: double; zfar: double); cdecl; external libraylib;
procedure rlViewport(x: longint; y: longint; width: longint; height: longint); cdecl; external libraylib;
procedure rlSetClipPlanes(nearPlane: double; farPlane: double); cdecl; external libraylib;
function rlGetCullDistanceNear: double; cdecl; external libraylib;
function rlGetCullDistanceFar: double; cdecl; external libraylib;

procedure rlBegin(mode: longint); cdecl; external libraylib;
procedure rlEnd; cdecl; external libraylib;
procedure rlVertex2i(x: longint; y: longint); cdecl; external libraylib;
procedure rlVertex2f(x: single; y: single); cdecl; external libraylib;
procedure rlVertex3f(x: single; y: single; z: single); cdecl; external libraylib;
procedure rlTexCoord2f(x: single; y: single); cdecl; external libraylib;
procedure rlNormal3f(x: single; y: single; z: single); cdecl; external libraylib;
procedure rlColor4ub(r: byte; g: byte; b: byte; a: byte); cdecl; external libraylib;
procedure rlColor3f(x: single; y: single; z: single); cdecl; external libraylib;
procedure rlColor4f(x: single; y: single; z: single; w: single); cdecl; external libraylib;

function rlEnableVertexArray(vaoId: dword): Tbool; cdecl; external libraylib;
procedure rlDisableVertexArray; cdecl; external libraylib;
procedure rlEnableVertexBuffer(id: dword); cdecl; external libraylib;
procedure rlDisableVertexBuffer; cdecl; external libraylib;
procedure rlEnableVertexBufferElement(id: dword); cdecl; external libraylib;
procedure rlDisableVertexBufferElement; cdecl; external libraylib;
procedure rlEnableVertexAttribute(index: dword); cdecl; external libraylib;
procedure rlDisableVertexAttribute(index: dword); cdecl; external libraylib;
procedure rlEnableStatePointer(vertexAttribType: longint; buffer: pointer); cdecl; external libraylib;
procedure rlDisableStatePointer(vertexAttribType: longint); cdecl; external libraylib;
procedure rlActiveTextureSlot(slot: longint); cdecl; external libraylib;
procedure rlEnableTexture(id: dword); cdecl; external libraylib;
procedure rlDisableTexture; cdecl; external libraylib;
procedure rlEnableTextureCubemap(id: dword); cdecl; external libraylib;
procedure rlDisableTextureCubemap; cdecl; external libraylib;
procedure rlTextureParameters(id: dword; param: longint; value: longint); cdecl; external libraylib;
procedure rlCubemapParameters(id: dword; param: longint; value: longint); cdecl; external libraylib;
procedure rlEnableShader(id: dword); cdecl; external libraylib;
procedure rlDisableShader; cdecl; external libraylib;
procedure rlEnableFramebuffer(id: dword); cdecl; external libraylib;
procedure rlDisableFramebuffer; cdecl; external libraylib;
function rlGetActiveFramebuffer: dword; cdecl; external libraylib;
procedure rlActiveDrawBuffers(count: longint); cdecl; external libraylib;
procedure rlBlitFramebuffer(srcX: longint; srcY: longint; srcWidth: longint; srcHeight: longint; dstX: longint;
  dstY: longint; dstWidth: longint; dstHeight: longint; bufferMask: longint); cdecl; external libraylib;
procedure rlBindFramebuffer(target: dword; framebuffer: dword); cdecl; external libraylib;
procedure rlEnableColorBlend; cdecl; external libraylib;
procedure rlDisableColorBlend; cdecl; external libraylib;
procedure rlEnableDepthTest; cdecl; external libraylib;
procedure rlDisableDepthTest; cdecl; external libraylib;
procedure rlEnableDepthMask; cdecl; external libraylib;
procedure rlDisableDepthMask; cdecl; external libraylib;
procedure rlEnableBackfaceCulling; cdecl; external libraylib;
procedure rlDisableBackfaceCulling; cdecl; external libraylib;
procedure rlColorMask(r: Tbool; g: Tbool; b: Tbool; a: Tbool); cdecl; external libraylib;
procedure rlSetCullFace(mode: longint); cdecl; external libraylib;
procedure rlEnableScissorTest; cdecl; external libraylib;
procedure rlDisableScissorTest; cdecl; external libraylib;
procedure rlScissor(x: longint; y: longint; width: longint; height: longint); cdecl; external libraylib;
procedure rlEnablePointMode; cdecl; external libraylib;
procedure rlDisablePointMode; cdecl; external libraylib;
procedure rlSetPointSize(size: single); cdecl; external libraylib;
function rlGetPointSize: single; cdecl; external libraylib;
procedure rlEnableWireMode; cdecl; external libraylib;
procedure rlDisableWireMode; cdecl; external libraylib;
procedure rlSetLineWidth(width: single); cdecl; external libraylib;
function rlGetLineWidth: single; cdecl; external libraylib;
procedure rlEnableSmoothLines; cdecl; external libraylib;
procedure rlDisableSmoothLines; cdecl; external libraylib;
procedure rlEnableStereoRender; cdecl; external libraylib;
procedure rlDisableStereoRender; cdecl; external libraylib;
function rlIsStereoRenderEnabled: Tbool; cdecl; external libraylib;
procedure rlClearColor(r: byte; g: byte; b: byte; a: byte); cdecl; external libraylib;
procedure rlClearScreenBuffers; cdecl; external libraylib;
procedure rlCheckErrors; cdecl; external libraylib;
procedure rlSetBlendMode(mode: longint); cdecl; external libraylib;
procedure rlSetBlendFactors(glSrcFactor: longint; glDstFactor: longint; glEquation: longint); cdecl; external libraylib;
procedure rlSetBlendFactorsSeparate(glSrcRGB: longint; glDstRGB: longint; glSrcAlpha: longint; glDstAlpha: longint; glEqRGB: longint;
  glEqAlpha: longint); cdecl; external libraylib;

procedure rlglInit(width: longint; height: longint); cdecl; external libraylib;
procedure rlglClose; cdecl; external libraylib;
procedure rlLoadExtensions(loader: pointer); cdecl; external libraylib;
function rlGetProcAddress(procName: pchar): pointer; cdecl; external libraylib;
function rlGetVersion: longint; cdecl; external libraylib;
procedure rlSetFramebufferWidth(width: longint); cdecl; external libraylib;
function rlGetFramebufferWidth: longint; cdecl; external libraylib;
procedure rlSetFramebufferHeight(height: longint); cdecl; external libraylib;
function rlGetFramebufferHeight: longint; cdecl; external libraylib;
function rlGetTextureIdDefault: dword; cdecl; external libraylib;
function rlGetShaderIdDefault: dword; cdecl; external libraylib;
function rlGetShaderLocsDefault: Plongint; cdecl; external libraylib;
function rlLoadRenderBatch(numBuffers: longint; bufferElements: longint): TrlRenderBatch; cdecl; external libraylib;
procedure rlUnloadRenderBatch(batch: TrlRenderBatch); cdecl; external libraylib;
procedure rlDrawRenderBatch(batch: PrlRenderBatch); cdecl; external libraylib;
procedure rlSetRenderBatchActive(batch: PrlRenderBatch); cdecl; external libraylib;
procedure rlDrawRenderBatchActive; cdecl; external libraylib;
function rlCheckRenderBatchLimit(vCount: longint): Tbool; cdecl; external libraylib;
procedure rlSetTexture(id: dword); cdecl; external libraylib;

function rlLoadVertexArray: dword; cdecl; external libraylib;
function rlLoadVertexBuffer(buffer: pointer; size: longint; dynamic: Tbool): dword; cdecl; external libraylib;
function rlLoadVertexBufferElement(buffer: pointer; size: longint; dynamic: Tbool): dword; cdecl; external libraylib;
procedure rlUpdateVertexBuffer(bufferId: dword; data: pointer; dataSize: longint; offset: longint); cdecl; external libraylib;
procedure rlUpdateVertexBufferElements(id: dword; data: pointer; dataSize: longint; offset: longint); cdecl; external libraylib;
procedure rlUnloadVertexArray(vaoId: dword); cdecl; external libraylib;
procedure rlUnloadVertexBuffer(vboId: dword); cdecl; external libraylib;
procedure rlSetVertexAttribute(index: dword; compSize: longint; _type: longint; normalized: Tbool; stride: longint; offset: longint); cdecl; external libraylib;
procedure rlSetVertexAttributeDivisor(index: dword; divisor: longint); cdecl; external libraylib;
procedure rlSetVertexAttributeDefault(locIndex: longint; value: pointer; attribType: longint; count: longint); cdecl; external libraylib;
procedure rlDrawVertexArray(offset: longint; count: longint); cdecl; external libraylib;
procedure rlDrawVertexArrayElements(offset: longint; count: longint; buffer: pointer); cdecl; external libraylib;
procedure rlDrawVertexArrayInstanced(offset: longint; count: longint; instances: longint); cdecl; external libraylib;
procedure rlDrawVertexArrayElementsInstanced(offset: longint; count: longint; buffer: pointer; instances: longint); cdecl; external libraylib;
function rlLoadTexture(data: pointer; width: longint; height: longint; format: longint; mipmapCount: longint): dword; cdecl; external libraylib;
function rlLoadTextureDepth(width: longint; height: longint; useRenderBuffer: Tbool): dword; cdecl; external libraylib;
function rlLoadTextureCubemap(data: pointer; size: longint; format: longint; mipmapCount: longint): dword; cdecl; external libraylib;
procedure rlUpdateTexture(id: dword; offsetX: longint; offsetY: longint; width: longint; height: longint; format: longint; data: pointer); cdecl; external libraylib;
procedure rlGetGlTextureFormats(format: longint; glInternalFormat: Pdword; glFormat: Pdword; glType: Pdword); cdecl; external libraylib;
function rlGetPixelFormatName(format: dword): pchar; cdecl; external libraylib;
procedure rlUnloadTexture(id: dword); cdecl; external libraylib;
procedure rlGenTextureMipmaps(id: dword; width: longint; height: longint; format: longint; mipmaps: Plongint); cdecl; external libraylib;
function rlReadTexturePixels(id: dword; width: longint; height: longint; format: longint): pointer; cdecl; external libraylib;
function rlReadScreenPixels(width: longint; height: longint): pbyte; cdecl; external libraylib;
function rlLoadFramebuffer: dword; cdecl; external libraylib;
procedure rlFramebufferAttach(fboId: dword; texId: dword; attachType: longint; texType: longint; mipLevel: longint); cdecl; external libraylib;
function rlFramebufferComplete(id: dword): Tbool; cdecl; external libraylib;
procedure rlUnloadFramebuffer(id: dword); cdecl; external libraylib;
procedure rlCopyFramebuffer(x: longint; y: longint; width: longint; height: longint; format: longint; pixels: pointer); cdecl; external libraylib;
procedure rlResizeFramebuffer(width: longint; height: longint); cdecl; external libraylib;
function rlLoadShaderCode(vsCode: pchar; fsCode: pchar): dword; cdecl; external libraylib;
function rlCompileShader(shaderCode: pchar; _type: longint): dword; cdecl; external libraylib;
function rlLoadShaderProgram(vShaderId: dword; fShaderId: dword): dword; cdecl; external libraylib;
procedure rlUnloadShaderProgram(id: dword); cdecl; external libraylib;
function rlGetLocationUniform(shaderId: dword; uniformName: pchar): longint; cdecl; external libraylib;
function rlGetLocationAttrib(shaderId: dword; attribName: pchar): longint; cdecl; external libraylib;
procedure rlSetUniform(locIndex: longint; value: pointer; uniformType: longint; count: longint); cdecl; external libraylib;
procedure rlSetUniformMatrix(locIndex: longint; mat: TMatrix); cdecl; external libraylib;
procedure rlSetUniformMatrices(locIndex: longint; mat: PMatrix; count: longint); cdecl; external libraylib;
procedure rlSetUniformSampler(locIndex: longint; textureId: dword); cdecl; external libraylib;
procedure rlSetShader(id: dword; locs: Plongint); cdecl; external libraylib;
function rlLoadComputeShaderProgram(shaderId: dword): dword; cdecl; external libraylib;
procedure rlComputeShaderDispatch(groupX: dword; groupY: dword; groupZ: dword); cdecl; external libraylib;
function rlLoadShaderBuffer(size: dword; data: pointer; usageHint: longint): dword; cdecl; external libraylib;
procedure rlUnloadShaderBuffer(ssboId: dword); cdecl; external libraylib;
procedure rlUpdateShaderBuffer(id: dword; data: pointer; dataSize: dword; offset: dword); cdecl; external libraylib;
procedure rlBindShaderBuffer(id: dword; index: dword); cdecl; external libraylib;
procedure rlReadShaderBuffer(id: dword; dest: pointer; count: dword; offset: dword); cdecl; external libraylib;
procedure rlCopyShaderBuffer(destId: dword; srcId: dword; destOffset: dword; srcOffset: dword; count: dword); cdecl; external libraylib;
function rlGetShaderBufferSize(id: dword): dword; cdecl; external libraylib;
procedure rlBindImageTexture(id: dword; index: dword; format: longint; readonly: Tbool); cdecl; external libraylib;
function rlGetMatrixModelview: TMatrix; cdecl; external libraylib;
function rlGetMatrixProjection: TMatrix; cdecl; external libraylib;
function rlGetMatrixTransform: TMatrix; cdecl; external libraylib;
function rlGetMatrixProjectionStereo(eye: longint): TMatrix; cdecl; external libraylib;
function rlGetMatrixViewOffsetStereo(eye: longint): TMatrix; cdecl; external libraylib;
procedure rlSetMatrixProjection(proj: TMatrix); cdecl; external libraylib;
procedure rlSetMatrixModelview(view: TMatrix); cdecl; external libraylib;
procedure rlSetMatrixProjectionStereo(right: TMatrix; left: TMatrix); cdecl; external libraylib;
procedure rlSetMatrixViewOffsetStereo(right: TMatrix; left: TMatrix); cdecl; external libraylib;
procedure rlLoadDrawCube; cdecl; external libraylib;
procedure rlLoadDrawQuad; cdecl; external libraylib;

const
  GL_SHADING_LANGUAGE_VERSION = $8B8C;
  GL_COMPRESSED_RGB_S3TC_DXT1_EXT = $83F0;
  GL_COMPRESSED_RGBA_S3TC_DXT1_EXT = $83F1;
  GL_COMPRESSED_RGBA_S3TC_DXT3_EXT = $83F2;
  GL_COMPRESSED_RGBA_S3TC_DXT5_EXT = $83F3;
  GL_ETC1_RGB8_OES = $8D64;
  GL_COMPRESSED_RGB8_ETC2 = $9274;
  GL_COMPRESSED_RGBA8_ETC2_EAC = $9278;
  GL_COMPRESSED_RGB_PVRTC_4BPPV1_IMG = $8C00;
  GL_COMPRESSED_RGBA_PVRTC_4BPPV1_IMG = $8C02;
  GL_COMPRESSED_RGBA_ASTC_4x4_KHR = $93b0;
  GL_COMPRESSED_RGBA_ASTC_8x8_KHR = $93b7;
  GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT = $84FF;
  GL_TEXTURE_MAX_ANISOTROPY_EXT = $84FE;
  GL_PROGRAM_POINT_SIZE = $8642;
  GL_LINE_WIDTH = $0B21;
  GL_UNSIGNED_SHORT_5_6_5 = $8363;
  GL_UNSIGNED_SHORT_5_5_5_1 = $8034;
  GL_UNSIGNED_SHORT_4_4_4_4 = $8033;
  GL_LUMINANCE = $1909;
  GL_LUMINANCE_ALPHA = $190A;

  RL_DEFAULT_SHADER_ATTRIB_NAME_POSITION = 'vertexPosition';
  RL_DEFAULT_SHADER_ATTRIB_NAME_TEXCOORD = 'vertexTexCoord';
  RL_DEFAULT_SHADER_ATTRIB_NAME_NORMAL = 'vertexNormal';
  RL_DEFAULT_SHADER_ATTRIB_NAME_COLOR = 'vertexColor';
  RL_DEFAULT_SHADER_ATTRIB_NAME_TANGENT = 'vertexTangent';
  RL_DEFAULT_SHADER_ATTRIB_NAME_TEXCOORD2 = 'vertexTexCoord2';
  RL_DEFAULT_SHADER_ATTRIB_NAME_BONEIDS = 'vertexBoneIds';
  RL_DEFAULT_SHADER_ATTRIB_NAME_BONEWEIGHTS = 'vertexBoneWeights';
  RL_DEFAULT_SHADER_ATTRIB_NAME_INSTANCE_TX = 'instanceTransform';
  RL_DEFAULT_SHADER_UNIFORM_NAME_MVP = 'mvp';
  RL_DEFAULT_SHADER_UNIFORM_NAME_VIEW = 'matView';
  RL_DEFAULT_SHADER_UNIFORM_NAME_PROJECTION = 'matProjection';
  RL_DEFAULT_SHADER_UNIFORM_NAME_MODEL = 'matModel';
  RL_DEFAULT_SHADER_UNIFORM_NAME_NORMAL = 'matNormal';
  RL_DEFAULT_SHADER_UNIFORM_NAME_COLOR = 'colDiffuse';
  RL_DEFAULT_SHADER_UNIFORM_NAME_BONE_MATRICES = 'boneMatrices';
  RL_DEFAULT_SHADER_SAMPLER2D_NAME_TEXTURE0 = 'texture0';
  RL_DEFAULT_SHADER_SAMPLER2D_NAME_TEXTURE1 = 'texture1';
  RL_DEFAULT_SHADER_SAMPLER2D_NAME_TEXTURE2 = 'texture2';

type
  TrlglLoadProc = function(name: pchar): pointer; cdecl;

  TrlglData = record
    currentBatch: PrlRenderBatch;
    defaultBatch: TrlRenderBatch;
    loader: TrlglLoadProc;
    State: record
      vertexCounter: longint;
      texcoordx: single;
      texcoordy: single;
      normalx: single;
      normaly: single;
      normalz: single;
      colorr: byte;
      colorg: byte;
      colorb: byte;
      colora: byte;
      currentMatrixMode: longint;
      currentMatrix: PMatrix;
      modelview: TMatrix;
      projection: TMatrix;
      transform: TMatrix;
      transformRequired: Tbool;
      stack: array[0..(RL_MAX_MATRIX_STACK_SIZE) - 1] of TMatrix;
      stackCounter: longint;
      currentTextureId: dword;
      defaultTextureId: dword;
      activeTextureId: array[0..(RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS) - 1] of dword;
      defaultVShaderId: dword;
      defaultFShaderId: dword;
      defaultShaderId: dword;
      defaultShaderLocs: Plongint;
      currentShaderId: dword;
      currentShaderLocs: Plongint;
      stereoRender: Tbool;
      projectionStereo: array[0..1] of TMatrix;
      viewOffsetStereo: array[0..1] of TMatrix;
      currentBlendMode: longint;
      glBlendSrcFactor: longint;
      glBlendDstFactor: longint;
      glBlendEquation: longint;
      glBlendSrcFactorRGB: longint;
      glBlendDestFactorRGB: longint;
      glBlendSrcFactorAlpha: longint;
      glBlendDestFactorAlpha: longint;
      glBlendEquationRGB: longint;
      glBlendEquationAlpha: longint;
      glCustomBlendModeModified: Tbool;
      framebufferWidth: longint;
      framebufferHeight: longint;
      end;
    ExtSupported: record
      vao: Tbool;
      instancing: Tbool;
      texNPOT: Tbool;
      texDepth: Tbool;
      texDepthWebGL: Tbool;
      texFloat32: Tbool;
      texFloat16: Tbool;
      texCompDXT: Tbool;
      texCompETC1: Tbool;
      texCompETC2: Tbool;
      texCompPVRT: Tbool;
      texCompASTC: Tbool;
      texMirrorClamp: Tbool;
      texAnisoFilter: Tbool;
      computeShader: Tbool;
      ssbo: Tbool;
      maxAnisotropyLevel: single;
      maxDepthBits: longint;
      end;
  end;
  PrlglData = ^TrlglData;

  // === Konventiert am: 27-1-26 19:17:14 ===


implementation



end.
