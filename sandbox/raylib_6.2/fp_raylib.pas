unit fp_raylib;

interface

const
  {$IFDEF Linux}
  libraylib = 'raylib';
  {$ENDIF}

  {$IFDEF Windows}
  libraylib = 'raylib.dll'; // ?????
  {$ENDIF}

type
  Tva_list = Pointer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  RAYLIB_VERSION_MAJOR = 5;
  RAYLIB_VERSION_MINOR = 6;
  RAYLIB_VERSION_PATCH = 0;
  RAYLIB_VERSION = '5.6-dev';

const
  DEG2RAD = PI / 180.0;
  RAD2DEG = 180.0 / PI;

type
  Pbool = ^Tbool;
  Tbool = Boolean32;

type
  TVector2 = record
    x: single;
    y: single;
  end;
  PVector2 = ^TVector2;

  TVector3 = record
    x: single;
    y: single;
    z: single;
  end;
  PVector3 = ^TVector3;

  TVector4 = record
    x: single;
    y: single;
    z: single;
    w: single;
  end;
  PVector4 = ^TVector4;

  PQuaternion = ^TQuaternion;
  TQuaternion = TVector4;

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

  TColor = record
    r: byte;
    g: byte;
    b: byte;
    a: byte;
  end;
  PColor = ^TColor;

  TRectangle = record
    x: single;
    y: single;
    width: single;
    height: single;
  end;
  PRectangle = ^TRectangle;
  PPRectangle = ^PRectangle;

  TImage = record
    data: pointer;
    width: longint;
    height: longint;
    mipmaps: longint;
    format: longint;
  end;
  PImage = ^TImage;

  TTexture = record
    id: dword;
    width: longint;
    height: longint;
    mipmaps: longint;
    format: longint;
  end;
  PTexture = ^TTexture;

  PTexture2D = ^TTexture2D;
  TTexture2D = TTexture;

  PTextureCubemap = ^TTextureCubemap;
  TTextureCubemap = TTexture;

  TRenderTexture = record
    id: dword;
    texture: TTexture;
    depth: TTexture;
  end;
  PRenderTexture = ^TRenderTexture;

  PRenderTexture2D = ^TRenderTexture2D;
  TRenderTexture2D = TRenderTexture;

  TNPatchInfo = record
    source: TRectangle;
    left: longint;
    top: longint;
    right: longint;
    bottom: longint;
    layout: longint;
  end;
  PNPatchInfo = ^TNPatchInfo;

  TGlyphInfo = record
    value: longint;
    offsetX: longint;
    offsetY: longint;
    advanceX: longint;
    image: TImage;
  end;
  PGlyphInfo = ^TGlyphInfo;

  TFont = record
    baseSize: longint;
    glyphCount: longint;
    glyphPadding: longint;
    texture: TTexture2D;
    recs: PRectangle;
    glyphs: PGlyphInfo;
  end;
  PFont = ^TFont;

  TCamera3D = record
    position: TVector3;
    target: TVector3;
    up: TVector3;
    fovy: single;
    projection: longint;
  end;
  PCamera3D = ^TCamera3D;

  PCamera = ^TCamera;
  TCamera = TCamera3D;

  TCamera2D = record
    offset: TVector2;
    target: TVector2;
    rotation: single;
    zoom: single;
  end;
  PCamera2D = ^TCamera2D;

  TMesh = record
    vertexCount: longint;
    triangleCount: longint;
    vertices: Psingle;
    texcoords: Psingle;
    texcoords2: Psingle;
    normals: Psingle;
    tangents: Psingle;
    colors: pbyte;
    indices: Pword;
    animVertices: Psingle;
    animNormals: Psingle;
    boneIds: pbyte;
    boneWeights: Psingle;
    boneMatrices: PMatrix;
    boneCount: longint;
    vaoId: dword;
    vboId: Pdword;
  end;
  PMesh = ^TMesh;

  TShader = record
    id: dword;
    locs: Plongint;
  end;
  PShader = ^TShader;

  TMaterialMap = record
    texture: TTexture2D;
    color: TColor;
    value: single;
  end;
  PMaterialMap = ^TMaterialMap;

  TMaterial = record
    shader: TShader;
    maps: PMaterialMap;
    params: array[0..3] of single;
  end;
  PMaterial = ^TMaterial;

  TTransform = record
    translation: TVector3;
    rotation: TQuaternion;
    scale: TVector3;
  end;
  PTransform = ^TTransform;

  TBoneInfo = record
    name: array[0..31] of char;
    parent: longint;
  end;
  PBoneInfo = ^TBoneInfo;

  TModel = record
    transform: TMatrix;
    meshCount: longint;
    materialCount: longint;
    meshes: PMesh;
    materials: PMaterial;
    meshMaterial: Plongint;
    boneCount: longint;
    bones: PBoneInfo;
    bindPose: PTransform;
  end;
  PModel = ^TModel;

  TModelAnimation = record
    boneCount: longint;
    frameCount: longint;
    bones: PBoneInfo;
    framePoses: ^PTransform;
    name: array[0..31] of char;
  end;
  PModelAnimation = ^TModelAnimation;

  TRay = record
    position: TVector3;
    direction: TVector3;
  end;
  PRay = ^TRay;

  TRayCollision = record
    hit: Tbool;
    distance: single;
    point: TVector3;
    normal: TVector3;
  end;
  PRayCollision = ^TRayCollision;

  TBoundingBox = record
    min: TVector3;
    max: TVector3;
  end;
  PBoundingBox = ^TBoundingBox;

  TWave = record
    frameCount: dword;
    sampleRate: dword;
    sampleSize: dword;
    channels: dword;
    data: pointer;
  end;
  PWave = ^TWave;

  PrAudioBuffer = type Pointer;
  PrAudioProcessor = type Pointer;

  TAudioStream = record
    buffer: PrAudioBuffer;
    processor: PrAudioProcessor;
    sampleRate: dword;
    sampleSize: dword;
    channels: dword;
  end;
  PAudioStream = ^TAudioStream;

  TSound = record
    stream: TAudioStream;
    frameCount: dword;
  end;
  PSound = ^TSound;

  TMusic = record
    stream: TAudioStream;
    frameCount: dword;
    looping: Tbool;
    ctxType: longint;
    ctxData: pointer;
  end;
  PMusic = ^TMusic;

  TVrDeviceInfo = record
    hResolution: longint;
    vResolution: longint;
    hScreenSize: single;
    vScreenSize: single;
    eyeToScreenDistance: single;
    lensSeparationDistance: single;
    interpupillaryDistance: single;
    lensDistortionValues: array[0..3] of single;
    chromaAbCorrection: array[0..3] of single;
  end;
  PVrDeviceInfo = ^TVrDeviceInfo;

  TVrStereoConfig = record
    projection: array[0..1] of TMatrix;
    viewOffset: array[0..1] of TMatrix;
    leftLensCenter: array[0..1] of single;
    rightLensCenter: array[0..1] of single;
    leftScreenCenter: array[0..1] of single;
    rightScreenCenter: array[0..1] of single;
    scale: array[0..1] of single;
    scaleIn: array[0..1] of single;
  end;
  PVrStereoConfig = ^TVrStereoConfig;

  TFilePathList = record
    count: dword;
    paths: ^pchar;
  end;
  PFilePathList = ^TFilePathList;

  TAutomationEvent = record
    frame: dword;
    _type: dword;
    params: array[0..3] of longint;
  end;
  PAutomationEvent = ^TAutomationEvent;

  TAutomationEventList = record
    capacity: dword;
    count: dword;
    events: PAutomationEvent;
  end;
  PAutomationEventList = ^TAutomationEventList;

type
  PConfigFlags = ^TConfigFlags;
  TConfigFlags = longint;

const
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

type
  PTraceLogLevel = ^TTraceLogLevel;
  TTraceLogLevel = longint;

const
  LOG_ALL = 0;
  LOG_TRACE = 1;
  LOG_DEBUG = 2;
  LOG_INFO = 3;
  LOG_WARNING = 4;
  LOG_ERROR = 5;
  LOG_FATAL = 6;
  LOG_NONE = 7;

type
  PKeyboardKey = ^TKeyboardKey;
  TKeyboardKey = longint;

const
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

type
  PMouseButton = ^TMouseButton;
  TMouseButton = longint;

const
  MOUSE_BUTTON_LEFT = 0;
  MOUSE_BUTTON_RIGHT = 1;
  MOUSE_BUTTON_MIDDLE = 2;
  MOUSE_BUTTON_SIDE = 3;
  MOUSE_BUTTON_EXTRA = 4;
  MOUSE_BUTTON_FORWARD = 5;
  MOUSE_BUTTON_BACK = 6;

  MOUSE_LEFT_BUTTON = MOUSE_BUTTON_LEFT;
  MOUSE_RIGHT_BUTTON = MOUSE_BUTTON_RIGHT;
  MOUSE_MIDDLE_BUTTON = MOUSE_BUTTON_MIDDLE;

type
  PMouseCursor = ^TMouseCursor;
  TMouseCursor = longint;

const
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

type
  PGamepadButton = ^TGamepadButton;
  TGamepadButton = longint;

const
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

type
  PGamepadAxis = ^TGamepadAxis;
  TGamepadAxis = longint;

const
  GAMEPAD_AXIS_LEFT_X = 0;
  GAMEPAD_AXIS_LEFT_Y = 1;
  GAMEPAD_AXIS_RIGHT_X = 2;
  GAMEPAD_AXIS_RIGHT_Y = 3;
  GAMEPAD_AXIS_LEFT_TRIGGER = 4;
  GAMEPAD_AXIS_RIGHT_TRIGGER = 5;

type
  PMaterialMapIndex = ^TMaterialMapIndex;
  TMaterialMapIndex = longint;

const
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

  MATERIAL_MAP_DIFFUSE = MATERIAL_MAP_ALBEDO;
  MATERIAL_MAP_SPECULAR = MATERIAL_MAP_METALNESS;

type
  PShaderLocationIndex = ^TShaderLocationIndex;
  TShaderLocationIndex = longint;

const
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
  SHADER_LOC_BONE_MATRICES = 28;
  SHADER_LOC_VERTEX_INSTANCE_TX = 29;

  SHADER_LOC_MAP_DIFFUSE = SHADER_LOC_MAP_ALBEDO;
  SHADER_LOC_MAP_SPECULAR = SHADER_LOC_MAP_METALNESS;

type
  PShaderUniformDataType = ^TShaderUniformDataType;
  TShaderUniformDataType = longint;

const
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

type
  PShaderAttributeDataType = ^TShaderAttributeDataType;
  TShaderAttributeDataType = longint;

const
  SHADER_ATTRIB_FLOAT = 0;
  SHADER_ATTRIB_VEC2 = 1;
  SHADER_ATTRIB_VEC3 = 2;
  SHADER_ATTRIB_VEC4 = 3;

type
  PPixelFormat = ^TPixelFormat;
  TPixelFormat = longint;

const
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

type
  PTextureFilter = ^TTextureFilter;
  TTextureFilter = longint;

const
  TEXTURE_FILTER_POINT = 0;
  TEXTURE_FILTER_BILINEAR = 1;
  TEXTURE_FILTER_TRILINEAR = 2;
  TEXTURE_FILTER_ANISOTROPIC_4X = 3;
  TEXTURE_FILTER_ANISOTROPIC_8X = 4;
  TEXTURE_FILTER_ANISOTROPIC_16X = 5;

type
  PTextureWrap = ^TTextureWrap;
  TTextureWrap = longint;

const
  TEXTURE_WRAP_REPEAT = 0;
  TEXTURE_WRAP_CLAMP = 1;
  TEXTURE_WRAP_MIRROR_REPEAT = 2;
  TEXTURE_WRAP_MIRROR_CLAMP = 3;

type
  PCubemapLayout = ^TCubemapLayout;
  TCubemapLayout = longint;

const
  CUBEMAP_LAYOUT_AUTO_DETECT = 0;
  CUBEMAP_LAYOUT_LINE_VERTICAL = 1;
  CUBEMAP_LAYOUT_LINE_HORIZONTAL = 2;
  CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR = 3;
  CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE = 4;

type
  PFontType = ^TFontType;
  TFontType = longint;

const
  FONT_DEFAULT = 0;
  FONT_BITMAP = 1;
  FONT_SDF = 2;

type
  PBlendMode = ^TBlendMode;
  TBlendMode = longint;

const
  BLEND_ALPHA = 0;
  BLEND_ADDITIVE = 1;
  BLEND_MULTIPLIED = 2;
  BLEND_ADD_COLORS = 3;
  BLEND_SUBTRACT_COLORS = 4;
  BLEND_ALPHA_PREMULTIPLY = 5;
  BLEND_CUSTOM = 6;
  BLEND_CUSTOM_SEPARATE = 7;

type
  PGesture = ^TGesture;
  TGesture = longint;

const
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

type
  PCameraMode = ^TCameraMode;
  TCameraMode = longint;

const
  CAMERA_CUSTOM = 0;
  CAMERA_FREE = 1;
  CAMERA_ORBITAL = 2;
  CAMERA_FIRST_PERSON = 3;
  CAMERA_THIRD_PERSON = 4;

type
  PCameraProjection = ^TCameraProjection;
  TCameraProjection = longint;

const
  CAMERA_PERSPECTIVE = 0;
  CAMERA_ORTHOGRAPHIC = 1;

type
  PNPatchLayout = ^TNPatchLayout;
  TNPatchLayout = longint;

const
  NPATCH_NINE_PATCH = 0;
  NPATCH_THREE_PATCH_VERTICAL = 1;
  NPATCH_THREE_PATCH_HORIZONTAL = 2;

type
  TTraceLogCallback = procedure(logLevel: longint; text: pchar; args: Tva_list); cdecl;
  TLoadFileDataCallback = function(fileName: pchar; dataSize: Plongint): pbyte; cdecl;
  TSaveFileDataCallback = function(fileName: pchar; data: pointer; dataSize: longint): Tbool; cdecl;
  TLoadFileTextCallback = function(fileName: pchar): pchar; cdecl;
  TSaveFileTextCallback = function(fileName: pchar; text: pchar): Tbool; cdecl;

procedure InitWindow(width: longint; height: longint; title: pchar); cdecl; external libraylib;
procedure CloseWindow; cdecl; external libraylib;
function WindowShouldClose: Tbool; cdecl; external libraylib;
function IsWindowReady: Tbool; cdecl; external libraylib;
function IsWindowFullscreen: Tbool; cdecl; external libraylib;
function IsWindowHidden: Tbool; cdecl; external libraylib;
function IsWindowMinimized: Tbool; cdecl; external libraylib;
function IsWindowMaximized: Tbool; cdecl; external libraylib;
function IsWindowFocused: Tbool; cdecl; external libraylib;
function IsWindowResized: Tbool; cdecl; external libraylib;
function IsWindowState(flag: dword): Tbool; cdecl; external libraylib;
procedure SetWindowState(flags: dword); cdecl; external libraylib;
procedure ClearWindowState(flags: dword); cdecl; external libraylib;
procedure ToggleFullscreen; cdecl; external libraylib;
procedure ToggleBorderlessWindowed; cdecl; external libraylib;
procedure MaximizeWindow; cdecl; external libraylib;
procedure MinimizeWindow; cdecl; external libraylib;
procedure RestoreWindow; cdecl; external libraylib;
procedure SetWindowIcon(image: TImage); cdecl; external libraylib;
procedure SetWindowIcons(images: PImage; count: longint); cdecl; external libraylib;
procedure SetWindowTitle(title: pchar); cdecl; external libraylib;
procedure SetWindowPosition(x: longint; y: longint); cdecl; external libraylib;
procedure SetWindowMonitor(monitor: longint); cdecl; external libraylib;
procedure SetWindowMinSize(width: longint; height: longint); cdecl; external libraylib;
procedure SetWindowMaxSize(width: longint; height: longint); cdecl; external libraylib;
procedure SetWindowSize(width: longint; height: longint); cdecl; external libraylib;
procedure SetWindowOpacity(opacity: single); cdecl; external libraylib;
procedure SetWindowFocused; cdecl; external libraylib;
function GetWindowHandle: pointer; cdecl; external libraylib;
function GetScreenWidth: longint; cdecl; external libraylib;
function GetScreenHeight: longint; cdecl; external libraylib;
function GetRenderWidth: longint; cdecl; external libraylib;
function GetRenderHeight: longint; cdecl; external libraylib;
function GetMonitorCount: longint; cdecl; external libraylib;
function GetCurrentMonitor: longint; cdecl; external libraylib;
function GetMonitorPosition(monitor: longint): TVector2; cdecl; external libraylib;
function GetMonitorWidth(monitor: longint): longint; cdecl; external libraylib;
function GetMonitorHeight(monitor: longint): longint; cdecl; external libraylib;
function GetMonitorPhysicalWidth(monitor: longint): longint; cdecl; external libraylib;
function GetMonitorPhysicalHeight(monitor: longint): longint; cdecl; external libraylib;
function GetMonitorRefreshRate(monitor: longint): longint; cdecl; external libraylib;
function GetWindowPosition: TVector2; cdecl; external libraylib;
function GetWindowScaleDPI: TVector2; cdecl; external libraylib;
function GetMonitorName(monitor: longint): pchar; cdecl; external libraylib;
procedure SetClipboardText(text: pchar); cdecl; external libraylib;
function GetClipboardText: pchar; cdecl; external libraylib;
function GetClipboardImage: TImage; cdecl; external libraylib;
procedure EnableEventWaiting; cdecl; external libraylib;
procedure DisableEventWaiting; cdecl; external libraylib;
procedure ShowCursor; cdecl; external libraylib;
procedure HideCursor; cdecl; external libraylib;
function IsCursorHidden: Tbool; cdecl; external libraylib;
procedure EnableCursor; cdecl; external libraylib;
procedure DisableCursor; cdecl; external libraylib;
function IsCursorOnScreen: Tbool; cdecl; external libraylib;
procedure ClearBackground(color: TColor); cdecl; external libraylib;
procedure BeginDrawing; cdecl; external libraylib;
procedure EndDrawing; cdecl; external libraylib;
procedure BeginMode2D(camera: TCamera2D); cdecl; external libraylib;
procedure EndMode2D; cdecl; external libraylib;
procedure BeginMode3D(camera: TCamera3D); cdecl; external libraylib;
procedure EndMode3D; cdecl; external libraylib;
procedure BeginTextureMode(target: TRenderTexture2D); cdecl; external libraylib;
procedure EndTextureMode; cdecl; external libraylib;
procedure BeginShaderMode(shader: TShader); cdecl; external libraylib;
procedure EndShaderMode; cdecl; external libraylib;
procedure BeginBlendMode(mode: longint); cdecl; external libraylib;
procedure EndBlendMode; cdecl; external libraylib;
procedure BeginScissorMode(x: longint; y: longint; width: longint; height: longint); cdecl; external libraylib;
procedure EndScissorMode; cdecl; external libraylib;
procedure BeginVrStereoMode(config: TVrStereoConfig); cdecl; external libraylib;
procedure EndVrStereoMode; cdecl; external libraylib;
function LoadVrStereoConfig(device: TVrDeviceInfo): TVrStereoConfig; cdecl; external libraylib;
procedure UnloadVrStereoConfig(config: TVrStereoConfig); cdecl; external libraylib;
function LoadShader(vsFileName: pchar; fsFileName: pchar): TShader; cdecl; external libraylib;
function LoadShaderFromMemory(vsCode: pchar; fsCode: pchar): TShader; cdecl; external libraylib;
function IsShaderValid(shader: TShader): Tbool; cdecl; external libraylib;
function GetShaderLocation(shader: TShader; uniformName: pchar): longint; cdecl; external libraylib;
function GetShaderLocationAttrib(shader: TShader; attribName: pchar): longint; cdecl; external libraylib;
procedure SetShaderValue(shader: TShader; locIndex: longint; value: pointer; uniformType: longint); cdecl; external libraylib;
procedure SetShaderValueV(shader: TShader; locIndex: longint; value: pointer; uniformType: longint; count: longint); cdecl; external libraylib;
procedure SetShaderValueMatrix(shader: TShader; locIndex: longint; mat: TMatrix); cdecl; external libraylib;
procedure SetShaderValueTexture(shader: TShader; locIndex: longint; texture: TTexture2D); cdecl; external libraylib;
procedure UnloadShader(shader: TShader); cdecl; external libraylib;
function GetScreenToWorldRay(position: TVector2; camera: TCamera): TRay; cdecl; external libraylib;
function GetScreenToWorldRayEx(position: TVector2; camera: TCamera; width: longint; height: longint): TRay; cdecl; external libraylib;
function GetWorldToScreen(position: TVector3; camera: TCamera): TVector2; cdecl; external libraylib;
function GetWorldToScreenEx(position: TVector3; camera: TCamera; width: longint; height: longint): TVector2; cdecl; external libraylib;
function GetWorldToScreen2D(position: TVector2; camera: TCamera2D): TVector2; cdecl; external libraylib;
function GetScreenToWorld2D(position: TVector2; camera: TCamera2D): TVector2; cdecl; external libraylib;
function GetCameraMatrix(camera: TCamera): TMatrix; cdecl; external libraylib;
function GetCameraMatrix2D(camera: TCamera2D): TMatrix; cdecl; external libraylib;
procedure SetTargetFPS(fps: longint); cdecl; external libraylib;
function GetFrameTime: single; cdecl; external libraylib;
function GetTime: double; cdecl; external libraylib;
function GetFPS: longint; cdecl; external libraylib;
procedure SwapScreenBuffer; cdecl; external libraylib;
procedure PollInputEvents; cdecl; external libraylib;
procedure WaitTime(seconds: double); cdecl; external libraylib;
procedure SetRandomSeed(seed: dword); cdecl; external libraylib;
function GetRandomValue(min: longint; max: longint): longint; cdecl; external libraylib;
function LoadRandomSequence(count: dword; min: longint; max: longint): Plongint; cdecl; external libraylib;
procedure UnloadRandomSequence(sequence: Plongint); cdecl; external libraylib;
procedure TakeScreenshot(fileName: pchar); cdecl; external libraylib;
procedure SetConfigFlags(flags: dword); cdecl; external libraylib;
procedure OpenURL(url: pchar); cdecl; external libraylib;
procedure SetTraceLogLevel(logLevel: longint); cdecl; external libraylib;
procedure TraceLog(logLevel: longint; text: pchar); cdecl; varargs; external libraylib;
procedure SetTraceLogCallback(callback: TTraceLogCallback); cdecl; external libraylib;
function MemAlloc(size: dword): pointer; cdecl; external libraylib;
function MemRealloc(ptr: pointer; size: dword): pointer; cdecl; external libraylib;
procedure MemFree(ptr: pointer); cdecl; external libraylib;
function LoadFileData(fileName: pchar; dataSize: Plongint): pbyte; cdecl; external libraylib;
procedure UnloadFileData(data: pbyte); cdecl; external libraylib;
function SaveFileData(fileName: pchar; data: pointer; dataSize: longint): Tbool; cdecl; external libraylib;
function ExportDataAsCode(data: pbyte; dataSize: longint; fileName: pchar): Tbool; cdecl; external libraylib;
function LoadFileText(fileName: pchar): pchar; cdecl; external libraylib;
procedure UnloadFileText(text: pchar); cdecl; external libraylib;
function SaveFileText(fileName: pchar; text: pchar): Tbool; cdecl; external libraylib;
procedure SetLoadFileDataCallback(callback: TLoadFileDataCallback); cdecl; external libraylib;
procedure SetSaveFileDataCallback(callback: TSaveFileDataCallback); cdecl; external libraylib;
procedure SetLoadFileTextCallback(callback: TLoadFileTextCallback); cdecl; external libraylib;
procedure SetSaveFileTextCallback(callback: TSaveFileTextCallback); cdecl; external libraylib;
function FileRename(fileName: pchar; fileRename: pchar): longint; cdecl; external libraylib;
function FileRemove(fileName: pchar): longint; cdecl; external libraylib;
function FileCopy(srcPath: pchar; dstPath: pchar): longint; cdecl; external libraylib;
function FileMove(srcPath: pchar; dstPath: pchar): longint; cdecl; external libraylib;
function FileTextReplace(fileName: pchar; search: pchar; replacement: pchar): longint; cdecl; external libraylib;
function FileTextFindIndex(fileName: pchar; search: pchar): longint; cdecl; external libraylib;
function FileExists(fileName: pchar): Tbool; cdecl; external libraylib;
function DirectoryExists(dirPath: pchar): Tbool; cdecl; external libraylib;
function IsFileExtension(fileName: pchar; ext: pchar): Tbool; cdecl; external libraylib;
function GetFileLength(fileName: pchar): longint; cdecl; external libraylib;
function GetFileModTime(fileName: pchar): longint; cdecl; external libraylib;
function GetFileExtension(fileName: pchar): pchar; cdecl; external libraylib;
function GetFileName(filePath: pchar): pchar; cdecl; external libraylib;
function GetFileNameWithoutExt(filePath: pchar): pchar; cdecl; external libraylib;
function GetDirectoryPath(filePath: pchar): pchar; cdecl; external libraylib;
function GetPrevDirectoryPath(dirPath: pchar): pchar; cdecl; external libraylib;
function GetWorkingDirectory: pchar; cdecl; external libraylib;
function GetApplicationDirectory: pchar; cdecl; external libraylib;
function MakeDirectory(dirPath: pchar): longint; cdecl; external libraylib;
function ChangeDirectory(dirPath: pchar): Tbool; cdecl; external libraylib;
function IsPathFile(path: pchar): Tbool; cdecl; external libraylib;
function IsFileNameValid(fileName: pchar): Tbool; cdecl; external libraylib;
function LoadDirectoryFiles(dirPath: pchar): TFilePathList; cdecl; external libraylib;
function LoadDirectoryFilesEx(basePath: pchar; filter: pchar; scanSubdirs: Tbool): TFilePathList; cdecl; external libraylib;
procedure UnloadDirectoryFiles(files: TFilePathList); cdecl; external libraylib;
function IsFileDropped: Tbool; cdecl; external libraylib;
function LoadDroppedFiles: TFilePathList; cdecl; external libraylib;
procedure UnloadDroppedFiles(files: TFilePathList); cdecl; external libraylib;
function GetDirectoryFileCount(dirPath: pchar): dword; cdecl; external libraylib;
function GetDirectoryFileCountEx(basePath: pchar; filter: pchar; scanSubdirs: Tbool): dword; cdecl; external libraylib;
function CompressData(data: pbyte; dataSize: longint; compDataSize: Plongint): pbyte; cdecl; external libraylib;
function DecompressData(compData: pbyte; compDataSize: longint; dataSize: Plongint): pbyte; cdecl; external libraylib;
function EncodeDataBase64(data: pbyte; dataSize: longint; outputSize: Plongint): pchar; cdecl; external libraylib;
function DecodeDataBase64(text: pchar; outputSize: Plongint): pbyte; cdecl; external libraylib;
function ComputeCRC32(data: pbyte; dataSize: longint): dword; cdecl; external libraylib;
function ComputeMD5(data: pbyte; dataSize: longint): Pdword; cdecl; external libraylib;
function ComputeSHA1(data: pbyte; dataSize: longint): Pdword; cdecl; external libraylib;
function ComputeSHA256(data: pbyte; dataSize: longint): Pdword; cdecl; external libraylib;
function LoadAutomationEventList(fileName: pchar): TAutomationEventList; cdecl; external libraylib;
procedure UnloadAutomationEventList(list: TAutomationEventList); cdecl; external libraylib;
function ExportAutomationEventList(list: TAutomationEventList; fileName: pchar): Tbool; cdecl; external libraylib;
procedure SetAutomationEventList(list: PAutomationEventList); cdecl; external libraylib;
procedure SetAutomationEventBaseFrame(frame: longint); cdecl; external libraylib;
procedure StartAutomationEventRecording; cdecl; external libraylib;
procedure StopAutomationEventRecording; cdecl; external libraylib;
procedure PlayAutomationEvent(event: TAutomationEvent); cdecl; external libraylib;

function IsKeyPressed(key: longint): Tbool; cdecl; external libraylib;
function IsKeyPressedRepeat(key: longint): Tbool; cdecl; external libraylib;
function IsKeyDown(key: longint): Tbool; cdecl; external libraylib;
function IsKeyReleased(key: longint): Tbool; cdecl; external libraylib;
function IsKeyUp(key: longint): Tbool; cdecl; external libraylib;
function GetKeyPressed: longint; cdecl; external libraylib;
function GetCharPressed: longint; cdecl; external libraylib;
function GetKeyName(key: longint): pchar; cdecl; external libraylib;
procedure SetExitKey(key: longint); cdecl; external libraylib;
function IsGamepadAvailable(gamepad: longint): Tbool; cdecl; external libraylib;
function GetGamepadName(gamepad: longint): pchar; cdecl; external libraylib;
function IsGamepadButtonPressed(gamepad: longint; button: longint): Tbool; cdecl; external libraylib;
function IsGamepadButtonDown(gamepad: longint; button: longint): Tbool; cdecl; external libraylib;
function IsGamepadButtonReleased(gamepad: longint; button: longint): Tbool; cdecl; external libraylib;
function IsGamepadButtonUp(gamepad: longint; button: longint): Tbool; cdecl; external libraylib;
function GetGamepadButtonPressed: longint; cdecl; external libraylib;
function GetGamepadAxisCount(gamepad: longint): longint; cdecl; external libraylib;
function GetGamepadAxisMovement(gamepad: longint; axis: longint): single; cdecl; external libraylib;
function SetGamepadMappings(mappings: pchar): longint; cdecl; external libraylib;
procedure SetGamepadVibration(gamepad: longint; leftMotor: single; rightMotor: single; duration: single); cdecl; external libraylib;
function IsMouseButtonPressed(button: longint): Tbool; cdecl; external libraylib;
function IsMouseButtonDown(button: longint): Tbool; cdecl; external libraylib;
function IsMouseButtonReleased(button: longint): Tbool; cdecl; external libraylib;
function IsMouseButtonUp(button: longint): Tbool; cdecl; external libraylib;
function GetMouseX: longint; cdecl; external libraylib;
function GetMouseY: longint; cdecl; external libraylib;
function GetMousePosition: TVector2; cdecl; external libraylib;
function GetMouseDelta: TVector2; cdecl; external libraylib;
procedure SetMousePosition(x: longint; y: longint); cdecl; external libraylib;
procedure SetMouseOffset(offsetX: longint; offsetY: longint); cdecl; external libraylib;
procedure SetMouseScale(scaleX: single; scaleY: single); cdecl; external libraylib;
function GetMouseWheelMove: single; cdecl; external libraylib;
function GetMouseWheelMoveV: TVector2; cdecl; external libraylib;
procedure SetMouseCursor(cursor: longint); cdecl; external libraylib;
function GetTouchX: longint; cdecl; external libraylib;
function GetTouchY: longint; cdecl; external libraylib;
function GetTouchPosition(index: longint): TVector2; cdecl; external libraylib;
function GetTouchPointId(index: longint): longint; cdecl; external libraylib;
function GetTouchPointCount: longint; cdecl; external libraylib;

procedure SetGesturesEnabled(flags: dword); cdecl; external libraylib;
function IsGestureDetected(gesture: dword): Tbool; cdecl; external libraylib;
function GetGestureDetected: longint; cdecl; external libraylib;
function GetGestureHoldDuration: single; cdecl; external libraylib;
function GetGestureDragVector: TVector2; cdecl; external libraylib;
function GetGestureDragAngle: single; cdecl; external libraylib;
function GetGesturePinchVector: TVector2; cdecl; external libraylib;
function GetGesturePinchAngle: single; cdecl; external libraylib;

procedure UpdateCamera(camera: PCamera; mode: longint); cdecl; external libraylib;
procedure UpdateCameraPro(camera: PCamera; movement: TVector3; rotation: TVector3; zoom: single); cdecl; external libraylib;

procedure SetShapesTexture(texture: TTexture2D; source: TRectangle); cdecl; external libraylib;
function GetShapesTexture: TTexture2D; cdecl; external libraylib;
function GetShapesTextureRectangle: TRectangle; cdecl; external libraylib;
procedure DrawPixel(posX: longint; posY: longint; color: TColor); cdecl; external libraylib;
procedure DrawPixelV(position: TVector2; color: TColor); cdecl; external libraylib;
procedure DrawLine(startPosX: longint; startPosY: longint; endPosX: longint; endPosY: longint; color: TColor); cdecl; external libraylib;
procedure DrawLineV(startPos: TVector2; endPos: TVector2; color: TColor); cdecl; external libraylib;
procedure DrawLineEx(startPos: TVector2; endPos: TVector2; thick: single; color: TColor); cdecl; external libraylib;
procedure DrawLineStrip(points: PVector2; pointCount: longint; color: TColor); cdecl; external libraylib;
procedure DrawLineBezier(startPos: TVector2; endPos: TVector2; thick: single; color: TColor); cdecl; external libraylib;
procedure DrawLineDashed(startPos: TVector2; endPos: TVector2; dashSize: longint; spaceSize: longint; color: TColor); cdecl; external libraylib;
procedure DrawCircle(centerX: longint; centerY: longint; radius: single; color: TColor); cdecl; external libraylib;
procedure DrawCircleSector(center: TVector2; radius: single; startAngle: single; endAngle: single; segments: longint; color: TColor); cdecl; external libraylib;
procedure DrawCircleSectorLines(center: TVector2; radius: single; startAngle: single; endAngle: single; segments: longint; color: TColor); cdecl; external libraylib;
procedure DrawCircleGradient(centerX: longint; centerY: longint; radius: single; inner: TColor; outer: TColor); cdecl; external libraylib;
procedure DrawCircleV(center: TVector2; radius: single; color: TColor); cdecl; external libraylib;
procedure DrawCircleLines(centerX: longint; centerY: longint; radius: single; color: TColor); cdecl; external libraylib;
procedure DrawCircleLinesV(center: TVector2; radius: single; color: TColor); cdecl; external libraylib;
procedure DrawEllipse(centerX: longint; centerY: longint; radiusH: single; radiusV: single; color: TColor); cdecl; external libraylib;
procedure DrawEllipseV(center: TVector2; radiusH: single; radiusV: single; color: TColor); cdecl; external libraylib;
procedure DrawEllipseLines(centerX: longint; centerY: longint; radiusH: single; radiusV: single; color: TColor); cdecl; external libraylib;
procedure DrawEllipseLinesV(center: TVector2; radiusH: single; radiusV: single; color: TColor); cdecl; external libraylib;
procedure DrawRing(center: TVector2; innerRadius: single; outerRadius: single; startAngle: single; endAngle: single;
  segments: longint; color: TColor); cdecl; external libraylib;
procedure DrawRingLines(center: TVector2; innerRadius: single; outerRadius: single; startAngle: single; endAngle: single;
  segments: longint; color: TColor); cdecl; external libraylib;
procedure DrawRectangle(posX: longint; posY: longint; width: longint; height: longint; color: TColor); cdecl; external libraylib;
procedure DrawRectangleV(position: TVector2; size: TVector2; color: TColor); cdecl; external libraylib;
procedure DrawRectangleRec(rec: TRectangle; color: TColor); cdecl; external libraylib;
procedure DrawRectanglePro(rec: TRectangle; origin: TVector2; rotation: single; color: TColor); cdecl; external libraylib;
procedure DrawRectangleGradientV(posX: longint; posY: longint; width: longint; height: longint; top: TColor; bottom: TColor); cdecl; external libraylib;
procedure DrawRectangleGradientH(posX: longint; posY: longint; width: longint; height: longint; left: TColor; right: TColor); cdecl; external libraylib;
procedure DrawRectangleGradientEx(rec: TRectangle; topLeft: TColor; bottomLeft: TColor; bottomRight: TColor; topRight: TColor); cdecl; external libraylib;
procedure DrawRectangleLines(posX: longint; posY: longint; width: longint; height: longint; color: TColor); cdecl; external libraylib;
procedure DrawRectangleLinesEx(rec: TRectangle; lineThick: single; color: TColor); cdecl; external libraylib;
procedure DrawRectangleRounded(rec: TRectangle; roundness: single; segments: longint; color: TColor); cdecl; external libraylib;
procedure DrawRectangleRoundedLines(rec: TRectangle; roundness: single; segments: longint; color: TColor); cdecl; external libraylib;
procedure DrawRectangleRoundedLinesEx(rec: TRectangle; roundness: single; segments: longint; lineThick: single; color: TColor); cdecl; external libraylib;
procedure DrawTriangle(v1: TVector2; v2: TVector2; v3: TVector2; color: TColor); cdecl; external libraylib;
procedure DrawTriangleLines(v1: TVector2; v2: TVector2; v3: TVector2; color: TColor); cdecl; external libraylib;
procedure DrawTriangleFan(points: PVector2; pointCount: longint; color: TColor); cdecl; external libraylib;
procedure DrawTriangleStrip(points: PVector2; pointCount: longint; color: TColor); cdecl; external libraylib;
procedure DrawPoly(center: TVector2; sides: longint; radius: single; rotation: single; color: TColor); cdecl; external libraylib;
procedure DrawPolyLines(center: TVector2; sides: longint; radius: single; rotation: single; color: TColor); cdecl; external libraylib;
procedure DrawPolyLinesEx(center: TVector2; sides: longint; radius: single; rotation: single; lineThick: single; color: TColor); cdecl; external libraylib;
procedure DrawSplineLinear(points: PVector2; pointCount: longint; thick: single; color: TColor); cdecl; external libraylib;
procedure DrawSplineBasis(points: PVector2; pointCount: longint; thick: single; color: TColor); cdecl; external libraylib;
procedure DrawSplineCatmullRom(points: PVector2; pointCount: longint; thick: single; color: TColor); cdecl; external libraylib;
procedure DrawSplineBezierQuadratic(points: PVector2; pointCount: longint; thick: single; color: TColor); cdecl; external libraylib;
procedure DrawSplineBezierCubic(points: PVector2; pointCount: longint; thick: single; color: TColor); cdecl; external libraylib;
procedure DrawSplineSegmentLinear(p1: TVector2; p2: TVector2; thick: single; color: TColor); cdecl; external libraylib;
procedure DrawSplineSegmentBasis(p1: TVector2; p2: TVector2; p3: TVector2; p4: TVector2; thick: single; color: TColor); cdecl; external libraylib;
procedure DrawSplineSegmentCatmullRom(p1: TVector2; p2: TVector2; p3: TVector2; p4: TVector2; thick: single; color: TColor); cdecl; external libraylib;
procedure DrawSplineSegmentBezierQuadratic(p1: TVector2; c2: TVector2; p3: TVector2; thick: single; color: TColor); cdecl; external libraylib;
procedure DrawSplineSegmentBezierCubic(p1: TVector2; c2: TVector2; c3: TVector2; p4: TVector2; thick: single; color: TColor); cdecl; external libraylib;
function GetSplinePointLinear(startPos: TVector2; endPos: TVector2; t: single): TVector2; cdecl; external libraylib;
function GetSplinePointBasis(p1: TVector2; p2: TVector2; p3: TVector2; p4: TVector2; t: single): TVector2; cdecl; external libraylib;
function GetSplinePointCatmullRom(p1: TVector2; p2: TVector2; p3: TVector2; p4: TVector2; t: single): TVector2; cdecl; external libraylib;
function GetSplinePointBezierQuad(p1: TVector2; c2: TVector2; p3: TVector2; t: single): TVector2; cdecl; external libraylib;
function GetSplinePointBezierCubic(p1: TVector2; c2: TVector2; c3: TVector2; p4: TVector2; t: single): TVector2; cdecl; external libraylib;
function CheckCollisionRecs(rec1: TRectangle; rec2: TRectangle): Tbool; cdecl; external libraylib;
function CheckCollisionCircles(center1: TVector2; radius1: single; center2: TVector2; radius2: single): Tbool; cdecl; external libraylib;
function CheckCollisionCircleRec(center: TVector2; radius: single; rec: TRectangle): Tbool; cdecl; external libraylib;
function CheckCollisionCircleLine(center: TVector2; radius: single; p1: TVector2; p2: TVector2): Tbool; cdecl; external libraylib;
function CheckCollisionPointRec(point: TVector2; rec: TRectangle): Tbool; cdecl; external libraylib;
function CheckCollisionPointCircle(point: TVector2; center: TVector2; radius: single): Tbool; cdecl; external libraylib;
function CheckCollisionPointTriangle(point: TVector2; p1: TVector2; p2: TVector2; p3: TVector2): Tbool; cdecl; external libraylib;
function CheckCollisionPointLine(point: TVector2; p1: TVector2; p2: TVector2; threshold: longint): Tbool; cdecl; external libraylib;
function CheckCollisionPointPoly(point: TVector2; points: PVector2; pointCount: longint): Tbool; cdecl; external libraylib;
function CheckCollisionLines(startPos1: TVector2; endPos1: TVector2; startPos2: TVector2; endPos2: TVector2; collisionPoint: PVector2): Tbool; cdecl; external libraylib;
function GetCollisionRec(rec1: TRectangle; rec2: TRectangle): TRectangle; cdecl; external libraylib;

function LoadImage(fileName: pchar): TImage; cdecl; external libraylib;
function LoadImageRaw(fileName: pchar; width: longint; height: longint; format: longint; headerSize: longint): TImage; cdecl; external libraylib;
function LoadImageAnim(fileName: pchar; frames: Plongint): TImage; cdecl; external libraylib;
function LoadImageAnimFromMemory(fileType: pchar; fileData: pbyte; dataSize: longint; frames: Plongint): TImage; cdecl; external libraylib;
function LoadImageFromMemory(fileType: pchar; fileData: pbyte; dataSize: longint): TImage; cdecl; external libraylib;
function LoadImageFromTexture(texture: TTexture2D): TImage; cdecl; external libraylib;
function LoadImageFromScreen: TImage; cdecl; external libraylib;
function IsImageValid(image: TImage): Tbool; cdecl; external libraylib;
procedure UnloadImage(image: TImage); cdecl; external libraylib;
function ExportImage(image: TImage; fileName: pchar): Tbool; cdecl; external libraylib;
function ExportImageToMemory(image: TImage; fileType: pchar; fileSize: Plongint): pbyte; cdecl; external libraylib;
function ExportImageAsCode(image: TImage; fileName: pchar): Tbool; cdecl; external libraylib;
function GenImageColor(width: longint; height: longint; color: TColor): TImage; cdecl; external libraylib;
function GenImageGradientLinear(width: longint; height: longint; direction: longint; start: TColor; end_: TColor): TImage; cdecl; external libraylib;
function GenImageGradientRadial(width: longint; height: longint; density: single; inner: TColor; outer: TColor): TImage; cdecl; external libraylib;
function GenImageGradientSquare(width: longint; height: longint; density: single; inner: TColor; outer: TColor): TImage; cdecl; external libraylib;
function GenImageChecked(width: longint; height: longint; checksX: longint; checksY: longint; col1: TColor; col2: TColor): TImage; cdecl; external libraylib;
function GenImageWhiteNoise(width: longint; height: longint; factor: single): TImage; cdecl; external libraylib;
function GenImagePerlinNoise(width: longint; height: longint; offsetX: longint; offsetY: longint; scale: single): TImage; cdecl; external libraylib;
function GenImageCellular(width: longint; height: longint; tileSize: longint): TImage; cdecl; external libraylib;
function GenImageText(width: longint; height: longint; text: pchar): TImage; cdecl; external libraylib;
function ImageCopy(image: TImage): TImage; cdecl; external libraylib;
function ImageFromImage(image: TImage; rec: TRectangle): TImage; cdecl; external libraylib;
function ImageFromChannel(image: TImage; selectedChannel: longint): TImage; cdecl; external libraylib;
function ImageText(text: pchar; fontSize: longint; color: TColor): TImage; cdecl; external libraylib;
function ImageTextEx(font: TFont; text: pchar; fontSize: single; spacing: single; tint: TColor): TImage; cdecl; external libraylib;
procedure ImageFormat(image: PImage; newFormat: longint); cdecl; external libraylib;
procedure ImageToPOT(image: PImage; fill: TColor); cdecl; external libraylib;
procedure ImageCrop(image: PImage; crop: TRectangle); cdecl; external libraylib;
procedure ImageAlphaCrop(image: PImage; threshold: single); cdecl; external libraylib;
procedure ImageAlphaClear(image: PImage; color: TColor; threshold: single); cdecl; external libraylib;
procedure ImageAlphaMask(image: PImage; alphaMask: TImage); cdecl; external libraylib;
procedure ImageAlphaPremultiply(image: PImage); cdecl; external libraylib;
procedure ImageBlurGaussian(image: PImage; blurSize: longint); cdecl; external libraylib;
procedure ImageKernelConvolution(image: PImage; kernel: Psingle; kernelSize: longint); cdecl; external libraylib;
procedure ImageResize(image: PImage; newWidth: longint; newHeight: longint); cdecl; external libraylib;
procedure ImageResizeNN(image: PImage; newWidth: longint; newHeight: longint); cdecl; external libraylib;
procedure ImageResizeCanvas(image: PImage; newWidth: longint; newHeight: longint; offsetX: longint; offsetY: longint; fill: TColor); cdecl; external libraylib;
procedure ImageMipmaps(image: PImage); cdecl; external libraylib;
procedure ImageDither(image: PImage; rBpp: longint; gBpp: longint; bBpp: longint; aBpp: longint); cdecl; external libraylib;
procedure ImageFlipVertical(image: PImage); cdecl; external libraylib;
procedure ImageFlipHorizontal(image: PImage); cdecl; external libraylib;
procedure ImageRotate(image: PImage; degrees: longint); cdecl; external libraylib;
procedure ImageRotateCW(image: PImage); cdecl; external libraylib;
procedure ImageRotateCCW(image: PImage); cdecl; external libraylib;
procedure ImageColorTint(image: PImage; color: TColor); cdecl; external libraylib;
procedure ImageColorInvert(image: PImage); cdecl; external libraylib;
procedure ImageColorGrayscale(image: PImage); cdecl; external libraylib;
procedure ImageColorContrast(image: PImage; contrast: single); cdecl; external libraylib;
procedure ImageColorBrightness(image: PImage; brightness: longint); cdecl; external libraylib;
procedure ImageColorReplace(image: PImage; color: TColor; replace: TColor); cdecl; external libraylib;
function LoadImageColors(image: TImage): PColor; cdecl; external libraylib;
function LoadImagePalette(image: TImage; maxPaletteSize: longint; colorCount: Plongint): PColor; cdecl; external libraylib;
procedure UnloadImageColors(colors: PColor); cdecl; external libraylib;
procedure UnloadImagePalette(colors: PColor); cdecl; external libraylib;
function GetImageAlphaBorder(image: TImage; threshold: single): TRectangle; cdecl; external libraylib;
function GetImageColor(image: TImage; x: longint; y: longint): TColor; cdecl; external libraylib;
procedure ImageClearBackground(dst: PImage; color: TColor); cdecl; external libraylib;
procedure ImageDrawPixel(dst: PImage; posX: longint; posY: longint; color: TColor); cdecl; external libraylib;
procedure ImageDrawPixelV(dst: PImage; position: TVector2; color: TColor); cdecl; external libraylib;
procedure ImageDrawLine(dst: PImage; startPosX: longint; startPosY: longint; endPosX: longint; endPosY: longint; color: TColor); cdecl; external libraylib;
procedure ImageDrawLineV(dst: PImage; start: TVector2; end_: TVector2; color: TColor); cdecl; external libraylib;
procedure ImageDrawLineEx(dst: PImage; start: TVector2; end_: TVector2; thick: longint; color: TColor); cdecl; external libraylib;
procedure ImageDrawCircle(dst: PImage; centerX: longint; centerY: longint; radius: longint; color: TColor); cdecl; external libraylib;
procedure ImageDrawCircleV(dst: PImage; center: TVector2; radius: longint; color: TColor); cdecl; external libraylib;
procedure ImageDrawCircleLines(dst: PImage; centerX: longint; centerY: longint; radius: longint; color: TColor); cdecl; external libraylib;
procedure ImageDrawCircleLinesV(dst: PImage; center: TVector2; radius: longint; color: TColor); cdecl; external libraylib;
procedure ImageDrawRectangle(dst: PImage; posX: longint; posY: longint; width: longint; height: longint; color: TColor); cdecl; external libraylib;
procedure ImageDrawRectangleV(dst: PImage; position: TVector2; size: TVector2; color: TColor); cdecl; external libraylib;
procedure ImageDrawRectangleRec(dst: PImage; rec: TRectangle; color: TColor); cdecl; external libraylib;
procedure ImageDrawRectangleLines(dst: PImage; rec: TRectangle; thick: longint; color: TColor); cdecl; external libraylib;
procedure ImageDrawTriangle(dst: PImage; v1: TVector2; v2: TVector2; v3: TVector2; color: TColor); cdecl; external libraylib;
procedure ImageDrawTriangleEx(dst: PImage; v1: TVector2; v2: TVector2; v3: TVector2; c1: TColor; c2: TColor; c3: TColor); cdecl; external libraylib;
procedure ImageDrawTriangleLines(dst: PImage; v1: TVector2; v2: TVector2; v3: TVector2; color: TColor); cdecl; external libraylib;
procedure ImageDrawTriangleFan(dst: PImage; points: PVector2; pointCount: longint; color: TColor); cdecl; external libraylib;
procedure ImageDrawTriangleStrip(dst: PImage; points: PVector2; pointCount: longint; color: TColor); cdecl; external libraylib;
procedure ImageDraw(dst: PImage; src: TImage; srcRec: TRectangle; dstRec: TRectangle; tint: TColor); cdecl; external libraylib;
procedure ImageDrawText(dst: PImage; text: pchar; posX: longint; posY: longint; fontSize: longint; color: TColor); cdecl; external libraylib;
procedure ImageDrawTextEx(dst: PImage; font: TFont; text: pchar; position: TVector2; fontSize: single; spacing: single; tint: TColor); cdecl; external libraylib;
function LoadTexture(fileName: pchar): TTexture2D; cdecl; external libraylib;
function LoadTextureFromImage(image: TImage): TTexture2D; cdecl; external libraylib;
function LoadTextureCubemap(image: TImage; layout: longint): TTextureCubemap; cdecl; external libraylib;
function LoadRenderTexture(width: longint; height: longint): TRenderTexture2D; cdecl; external libraylib;
function IsTextureValid(texture: TTexture2D): Tbool; cdecl; external libraylib;
procedure UnloadTexture(texture: TTexture2D); cdecl; external libraylib;
function IsRenderTextureValid(target: TRenderTexture2D): Tbool; cdecl; external libraylib;
procedure UnloadRenderTexture(target: TRenderTexture2D); cdecl; external libraylib;
procedure UpdateTexture(texture: TTexture2D; pixels: pointer); cdecl; external libraylib;
procedure UpdateTextureRec(texture: TTexture2D; rec: TRectangle; pixels: pointer); cdecl; external libraylib;
procedure GenTextureMipmaps(texture: PTexture2D); cdecl; external libraylib;
procedure SetTextureFilter(texture: TTexture2D; filter: longint); cdecl; external libraylib;
procedure SetTextureWrap(texture: TTexture2D; wrap: longint); cdecl; external libraylib;
procedure DrawTexture(texture: TTexture2D; posX: longint; posY: longint; tint: TColor); cdecl; external libraylib;
procedure DrawTextureV(texture: TTexture2D; position: TVector2; tint: TColor); cdecl; external libraylib;
procedure DrawTextureEx(texture: TTexture2D; position: TVector2; rotation: single; scale: single; tint: TColor); cdecl; external libraylib;
procedure DrawTextureRec(texture: TTexture2D; source: TRectangle; position: TVector2; tint: TColor); cdecl; external libraylib;
procedure DrawTexturePro(texture: TTexture2D; source: TRectangle; dest: TRectangle; origin: TVector2; rotation: single; tint: TColor); cdecl; external libraylib;
procedure DrawTextureNPatch(texture: TTexture2D; nPatchInfo: TNPatchInfo; dest: TRectangle; origin: TVector2; rotation: single; tint: TColor); cdecl; external libraylib;
function ColorIsEqual(col1: TColor; col2: TColor): Tbool; cdecl; external libraylib;
function Fade(color: TColor; alpha: single): TColor; cdecl; external libraylib;
function ColorToInt(color: TColor): longint; cdecl; external libraylib;
function ColorNormalize(color: TColor): TVector4; cdecl; external libraylib;
function ColorFromNormalized(normalized: TVector4): TColor; cdecl; external libraylib;
function ColorToHSV(color: TColor): TVector3; cdecl; external libraylib;
function ColorFromHSV(hue: single; saturation: single; value: single): TColor; cdecl; external libraylib;
function ColorTint(color: TColor; tint: TColor): TColor; cdecl; external libraylib;
function ColorBrightness(color: TColor; factor: single): TColor; cdecl; external libraylib;
function ColorContrast(color: TColor; contrast: single): TColor; cdecl; external libraylib;
function ColorAlpha(color: TColor; alpha: single): TColor; cdecl; external libraylib;
function ColorAlphaBlend(dst: TColor; src: TColor; tint: TColor): TColor; cdecl; external libraylib;
function ColorLerp(color1: TColor; color2: TColor; factor: single): TColor; cdecl; external libraylib;
function GetColor(hexValue: dword): TColor; cdecl; external libraylib;
function GetPixelColor(srcPtr: pointer; format: longint): TColor; cdecl; external libraylib;
procedure SetPixelColor(dstPtr: pointer; color: TColor; format: longint); cdecl; external libraylib;
function GetPixelDataSize(width: longint; height: longint; format: longint): longint; cdecl; external libraylib;

function GetFontDefault: TFont; cdecl; external libraylib;
function LoadFont(fileName: pchar): TFont; cdecl; external libraylib;
function LoadFontEx(fileName: pchar; fontSize: longint; codepoints: Plongint; codepointCount: longint): TFont; cdecl; external libraylib;
function LoadFontFromImage(image: TImage; key: TColor; firstChar: longint): TFont; cdecl; external libraylib;
function LoadFontFromMemory(fileType: pchar; fileData: pbyte; dataSize: longint; fontSize: longint; codepoints: Plongint; codepointCount: longint): TFont; cdecl; external libraylib;
function IsFontValid(font: TFont): Tbool; cdecl; external libraylib;
function LoadFontData(fileData: pbyte; dataSize: longint; fontSize: longint; codepoints: Plongint; codepointCount: longint;
  _type: longint; glyphCount: Plongint): PGlyphInfo; cdecl; external libraylib;
function GenImageFontAtlas(glyphs: PGlyphInfo; glyphRecs: PPRectangle; glyphCount: longint; fontSize: longint; padding: longint;
  packMethod: longint): TImage; cdecl; external libraylib;
procedure UnloadFontData(glyphs: PGlyphInfo; glyphCount: longint); cdecl; external libraylib;
procedure UnloadFont(font: TFont); cdecl; external libraylib;
function ExportFontAsCode(font: TFont; fileName: pchar): Tbool; cdecl; external libraylib;
procedure DrawFPS(posX: longint; posY: longint); cdecl; external libraylib;
procedure DrawText(text: pchar; posX: longint; posY: longint; fontSize: longint; color: TColor); cdecl; external libraylib;
procedure DrawTextEx(font: TFont; text: pchar; position: TVector2; fontSize: single; spacing: single; tint: TColor); cdecl; external libraylib;
procedure DrawTextPro(font: TFont; text: pchar; position: TVector2; origin: TVector2; rotation: single;
  fontSize: single; spacing: single; tint: TColor); cdecl; external libraylib;
procedure DrawTextCodepoint(font: TFont; codepoint: longint; position: TVector2; fontSize: single; tint: TColor); cdecl; external libraylib;
procedure DrawTextCodepoints(font: TFont; codepoints: Plongint; codepointCount: longint; position: TVector2; fontSize: single;
  spacing: single; tint: TColor); cdecl; external libraylib;
procedure SetTextLineSpacing(spacing: longint); cdecl; external libraylib;
function MeasureText(text: pchar; fontSize: longint): longint; cdecl; external libraylib;
function MeasureTextEx(font: TFont; text: pchar; fontSize: single; spacing: single): TVector2; cdecl; external libraylib;
function GetGlyphIndex(font: TFont; codepoint: longint): longint; cdecl; external libraylib;
function GetGlyphInfo(font: TFont; codepoint: longint): TGlyphInfo; cdecl; external libraylib;
function GetGlyphAtlasRec(font: TFont; codepoint: longint): TRectangle; cdecl; external libraylib;
function LoadUTF8(codepoints: Plongint; length: longint): pchar; cdecl; external libraylib;
procedure UnloadUTF8(text: pchar); cdecl; external libraylib;
function LoadCodepoints(text: pchar; count: Plongint): Plongint; cdecl; external libraylib;
procedure UnloadCodepoints(codepoints: Plongint); cdecl; external libraylib;
function GetCodepointCount(text: pchar): longint; cdecl; external libraylib;
function GetCodepoint(text: pchar; codepointSize: Plongint): longint; cdecl; external libraylib;
function GetCodepointNext(text: pchar; codepointSize: Plongint): longint; cdecl; external libraylib;
function GetCodepointPrevious(text: pchar; codepointSize: Plongint): longint; cdecl; external libraylib;
function CodepointToUTF8(codepoint: longint; utf8Size: Plongint): pchar; cdecl; external libraylib;
function LoadTextLines(text: pchar; count: Plongint): PPchar; cdecl; external libraylib;
procedure UnloadTextLines(text: PPchar; lineCount: longint); cdecl; external libraylib;
function TextCopy(dst: pchar; src: pchar): longint; cdecl; external libraylib;
function TextIsEqual(text1: pchar; text2: pchar): Tbool; cdecl; external libraylib;
function TextLength(text: pchar): dword; cdecl; external libraylib;
function TextFormat(text: pchar): pchar; cdecl; varargs; external libraylib;
function TextSubtext(text: pchar; position: longint; length: longint): pchar; cdecl; external libraylib;
function TextRemoveSpaces(text: pchar): pchar; cdecl; external libraylib;
function GetTextBetween(text: pchar; begin_: pchar; end_: pchar): pchar; cdecl; external libraylib;
function TextReplace(text: pchar; search: pchar; replacement: pchar): pchar; cdecl; external libraylib;
function TextReplaceBetween(text: pchar; begin_: pchar; end_: pchar; replacement: pchar): pchar; cdecl; external libraylib;
function TextInsert(text: pchar; insert: pchar; position: longint): pchar; cdecl; external libraylib;
function TextJoin(textList: PPchar; count: longint; delimiter: pchar): pchar; cdecl; external libraylib;
function TextSplit(text: pchar; delimiter: char; count: Plongint): Ppchar; cdecl; external libraylib;
procedure TextAppend(text: pchar; append: pchar; position: Plongint); cdecl; external libraylib;
function TextFindIndex(text: pchar; search: pchar): longint; cdecl; external libraylib;
function TextToUpper(text: pchar): pchar; cdecl; external libraylib;
function TextToLower(text: pchar): pchar; cdecl; external libraylib;
function TextToPascal(text: pchar): pchar; cdecl; external libraylib;
function TextToSnake(text: pchar): pchar; cdecl; external libraylib;
function TextToCamel(text: pchar): pchar; cdecl; external libraylib;
function TextToInteger(text: pchar): longint; cdecl; external libraylib;
function TextToFloat(text: pchar): single; cdecl; external libraylib;

procedure DrawLine3D(startPos: TVector3; endPos: TVector3; color: TColor); cdecl; external libraylib;
procedure DrawPoint3D(position: TVector3; color: TColor); cdecl; external libraylib;
procedure DrawCircle3D(center: TVector3; radius: single; rotationAxis: TVector3; rotationAngle: single; color: TColor); cdecl; external libraylib;
procedure DrawTriangle3D(v1: TVector3; v2: TVector3; v3: TVector3; color: TColor); cdecl; external libraylib;
procedure DrawTriangleStrip3D(points: PVector3; pointCount: longint; color: TColor); cdecl; external libraylib;
procedure DrawCube(position: TVector3; width: single; height: single; length: single; color: TColor); cdecl; external libraylib;
procedure DrawCubeV(position: TVector3; size: TVector3; color: TColor); cdecl; external libraylib;
procedure DrawCubeWires(position: TVector3; width: single; height: single; length: single; color: TColor); cdecl; external libraylib;
procedure DrawCubeWiresV(position: TVector3; size: TVector3; color: TColor); cdecl; external libraylib;
procedure DrawSphere(centerPos: TVector3; radius: single; color: TColor); cdecl; external libraylib;
procedure DrawSphereEx(centerPos: TVector3; radius: single; rings: longint; slices: longint; color: TColor); cdecl; external libraylib;
procedure DrawSphereWires(centerPos: TVector3; radius: single; rings: longint; slices: longint; color: TColor); cdecl; external libraylib;
procedure DrawCylinder(position: TVector3; radiusTop: single; radiusBottom: single; height: single; slices: longint; color: TColor); cdecl; external libraylib;
procedure DrawCylinderEx(startPos: TVector3; endPos: TVector3; startRadius: single; endRadius: single; sides: longint; color: TColor); cdecl; external libraylib;
procedure DrawCylinderWires(position: TVector3; radiusTop: single; radiusBottom: single; height: single; slices: longint; color: TColor); cdecl; external libraylib;
procedure DrawCylinderWiresEx(startPos: TVector3; endPos: TVector3; startRadius: single; endRadius: single; sides: longint; color: TColor); cdecl; external libraylib;
procedure DrawCapsule(startPos: TVector3; endPos: TVector3; radius: single; slices: longint; rings: longint; color: TColor); cdecl; external libraylib;
procedure DrawCapsuleWires(startPos: TVector3; endPos: TVector3; radius: single; slices: longint; rings: longint; color: TColor); cdecl; external libraylib;
procedure DrawPlane(centerPos: TVector3; size: TVector2; color: TColor); cdecl; external libraylib;
procedure DrawRay(ray: TRay; color: TColor); cdecl; external libraylib;
procedure DrawGrid(slices: longint; spacing: single); cdecl; external libraylib;

function LoadModel(fileName: pchar): TModel; cdecl; external libraylib;
function LoadModelFromMesh(mesh: TMesh): TModel; cdecl; external libraylib;
function IsModelValid(model: TModel): Tbool; cdecl; external libraylib;
procedure UnloadModel(model: TModel); cdecl; external libraylib;
function GetModelBoundingBox(model: TModel): TBoundingBox; cdecl; external libraylib;
procedure DrawModel(model: TModel; position: TVector3; scale: single; tint: TColor); cdecl; external libraylib;
procedure DrawModelEx(model: TModel; position: TVector3; rotationAxis: TVector3; rotationAngle: single; scale: TVector3; tint: TColor); cdecl; external libraylib;
procedure DrawModelWires(model: TModel; position: TVector3; scale: single; tint: TColor); cdecl; external libraylib;
procedure DrawModelWiresEx(model: TModel; position: TVector3; rotationAxis: TVector3; rotationAngle: single; scale: TVector3; tint: TColor); cdecl; external libraylib;
procedure DrawModelPoints(model: TModel; position: TVector3; scale: single; tint: TColor); cdecl; external libraylib;
procedure DrawModelPointsEx(model: TModel; position: TVector3; rotationAxis: TVector3; rotationAngle: single; scale: TVector3; tint: TColor); cdecl; external libraylib;
procedure DrawBoundingBox(box: TBoundingBox; color: TColor); cdecl; external libraylib;
procedure DrawBillboard(camera: TCamera; texture: TTexture2D; position: TVector3; scale: single; tint: TColor); cdecl; external libraylib;
procedure DrawBillboardRec(camera: TCamera; texture: TTexture2D; source: TRectangle; position: TVector3; size: TVector2; tint: TColor); cdecl; external libraylib;
procedure DrawBillboardPro(camera: TCamera; texture: TTexture2D; source: TRectangle; position: TVector3; up: TVector3;
  size: TVector2; origin: TVector2; rotation: single; tint: TColor); cdecl; external libraylib;
procedure UploadMesh(mesh: PMesh; dynamic: Tbool); cdecl; external libraylib;
procedure UpdateMeshBuffer(mesh: TMesh; index: longint; data: pointer; dataSize: longint; offset: longint); cdecl; external libraylib;
procedure UnloadMesh(mesh: TMesh); cdecl; external libraylib;
procedure DrawMesh(mesh: TMesh; material: TMaterial; transform: TMatrix); cdecl; external libraylib;
procedure DrawMeshInstanced(mesh: TMesh; material: TMaterial; transforms: PMatrix; instances: longint); cdecl; external libraylib;
function GetMeshBoundingBox(mesh: TMesh): TBoundingBox; cdecl; external libraylib;
procedure GenMeshTangents(mesh: PMesh); cdecl; external libraylib;
function ExportMesh(mesh: TMesh; fileName: pchar): Tbool; cdecl; external libraylib;
function ExportMeshAsCode(mesh: TMesh; fileName: pchar): Tbool; cdecl; external libraylib;
function GenMeshPoly(sides: longint; radius: single): TMesh; cdecl; external libraylib;
function GenMeshPlane(width: single; length: single; resX: longint; resZ: longint): TMesh; cdecl; external libraylib;
function GenMeshCube(width: single; height: single; length: single): TMesh; cdecl; external libraylib;
function GenMeshSphere(radius: single; rings: longint; slices: longint): TMesh; cdecl; external libraylib;
function GenMeshHemiSphere(radius: single; rings: longint; slices: longint): TMesh; cdecl; external libraylib;
function GenMeshCylinder(radius: single; height: single; slices: longint): TMesh; cdecl; external libraylib;
function GenMeshCone(radius: single; height: single; slices: longint): TMesh; cdecl; external libraylib;
function GenMeshTorus(radius: single; size: single; radSeg: longint; sides: longint): TMesh; cdecl; external libraylib;
function GenMeshKnot(radius: single; size: single; radSeg: longint; sides: longint): TMesh; cdecl; external libraylib;
function GenMeshHeightmap(heightmap: TImage; size: TVector3): TMesh; cdecl; external libraylib;
function GenMeshCubicmap(cubicmap: TImage; cubeSize: TVector3): TMesh; cdecl; external libraylib;
function LoadMaterials(fileName: pchar; materialCount: Plongint): PMaterial; cdecl; external libraylib;
function LoadMaterialDefault: TMaterial; cdecl; external libraylib;
function IsMaterialValid(material: TMaterial): Tbool; cdecl; external libraylib;
procedure UnloadMaterial(material: TMaterial); cdecl; external libraylib;
procedure SetMaterialTexture(material: PMaterial; mapType: longint; texture: TTexture2D); cdecl; external libraylib;
procedure SetModelMeshMaterial(model: PModel; meshId: longint; materialId: longint); cdecl; external libraylib;
function LoadModelAnimations(fileName: pchar; animCount: Plongint): PModelAnimation; cdecl; external libraylib;
procedure UpdateModelAnimation(model: TModel; anim: TModelAnimation; frame: longint); cdecl; external libraylib;
procedure UpdateModelAnimationBones(model: TModel; anim: TModelAnimation; frame: longint); cdecl; external libraylib;
procedure UnloadModelAnimation(anim: TModelAnimation); cdecl; external libraylib;
procedure UnloadModelAnimations(animations: PModelAnimation; animCount: longint); cdecl; external libraylib;
function IsModelAnimationValid(model: TModel; anim: TModelAnimation): Tbool; cdecl; external libraylib;
function CheckCollisionSpheres(center1: TVector3; radius1: single; center2: TVector3; radius2: single): Tbool; cdecl; external libraylib;
function CheckCollisionBoxes(box1: TBoundingBox; box2: TBoundingBox): Tbool; cdecl; external libraylib;
function CheckCollisionBoxSphere(box: TBoundingBox; center: TVector3; radius: single): Tbool; cdecl; external libraylib;
function GetRayCollisionSphere(ray: TRay; center: TVector3; radius: single): TRayCollision; cdecl; external libraylib;
function GetRayCollisionBox(ray: TRay; box: TBoundingBox): TRayCollision; cdecl; external libraylib;
function GetRayCollisionMesh(ray: TRay; mesh: TMesh; transform: TMatrix): TRayCollision; cdecl; external libraylib;
function GetRayCollisionTriangle(ray: TRay; p1: TVector3; p2: TVector3; p3: TVector3): TRayCollision; cdecl; external libraylib;
function GetRayCollisionQuad(ray: TRay; p1: TVector3; p2: TVector3; p3: TVector3; p4: TVector3): TRayCollision; cdecl; external libraylib;

type
  TAudioCallback = procedure(bufferData: pointer; frames: dword); cdecl;

procedure InitAudioDevice; cdecl; external libraylib;
procedure CloseAudioDevice; cdecl; external libraylib;
function IsAudioDeviceReady: Tbool; cdecl; external libraylib;
procedure SetMasterVolume(volume: single); cdecl; external libraylib;
function GetMasterVolume: single; cdecl; external libraylib;
function LoadWave(fileName: pchar): TWave; cdecl; external libraylib;
function LoadWaveFromMemory(fileType: pchar; fileData: pbyte; dataSize: longint): TWave; cdecl; external libraylib;
function IsWaveValid(wave: TWave): Tbool; cdecl; external libraylib;
function LoadSound(fileName: pchar): TSound; cdecl; external libraylib;
function LoadSoundFromWave(wave: TWave): TSound; cdecl; external libraylib;
function LoadSoundAlias(source: TSound): TSound; cdecl; external libraylib;
function IsSoundValid(sound: TSound): Tbool; cdecl; external libraylib;
procedure UpdateSound(sound: TSound; data: pointer; sampleCount: longint); cdecl; external libraylib;
procedure UnloadWave(wave: TWave); cdecl; external libraylib;
procedure UnloadSound(sound: TSound); cdecl; external libraylib;
procedure UnloadSoundAlias(alias: TSound); cdecl; external libraylib;
function ExportWave(wave: TWave; fileName: pchar): Tbool; cdecl; external libraylib;
function ExportWaveAsCode(wave: TWave; fileName: pchar): Tbool; cdecl; external libraylib;
procedure PlaySound(sound: TSound); cdecl; external libraylib;
procedure StopSound(sound: TSound); cdecl; external libraylib;
procedure PauseSound(sound: TSound); cdecl; external libraylib;
procedure ResumeSound(sound: TSound); cdecl; external libraylib;
function IsSoundPlaying(sound: TSound): Tbool; cdecl; external libraylib;
procedure SetSoundVolume(sound: TSound; volume: single); cdecl; external libraylib;
procedure SetSoundPitch(sound: TSound; pitch: single); cdecl; external libraylib;
procedure SetSoundPan(sound: TSound; pan: single); cdecl; external libraylib;
function WaveCopy(wave: TWave): TWave; cdecl; external libraylib;
procedure WaveCrop(wave: PWave; initFrame: longint; finalFrame: longint); cdecl; external libraylib;
procedure WaveFormat(wave: PWave; sampleRate: longint; sampleSize: longint; channels: longint); cdecl; external libraylib;
function LoadWaveSamples(wave: TWave): Psingle; cdecl; external libraylib;
procedure UnloadWaveSamples(samples: Psingle); cdecl; external libraylib;
function LoadMusicStream(fileName: pchar): TMusic; cdecl; external libraylib;
function LoadMusicStreamFromMemory(fileType: pchar; data: pbyte; dataSize: longint): TMusic; cdecl; external libraylib;
function IsMusicValid(music: TMusic): Tbool; cdecl; external libraylib;
procedure UnloadMusicStream(music: TMusic); cdecl; external libraylib;
procedure PlayMusicStream(music: TMusic); cdecl; external libraylib;
function IsMusicStreamPlaying(music: TMusic): Tbool; cdecl; external libraylib;
procedure UpdateMusicStream(music: TMusic); cdecl; external libraylib;
procedure StopMusicStream(music: TMusic); cdecl; external libraylib;
procedure PauseMusicStream(music: TMusic); cdecl; external libraylib;
procedure ResumeMusicStream(music: TMusic); cdecl; external libraylib;
procedure SeekMusicStream(music: TMusic; position: single); cdecl; external libraylib;
procedure SetMusicVolume(music: TMusic; volume: single); cdecl; external libraylib;
procedure SetMusicPitch(music: TMusic; pitch: single); cdecl; external libraylib;
procedure SetMusicPan(music: TMusic; pan: single); cdecl; external libraylib;
function GetMusicTimeLength(music: TMusic): single; cdecl; external libraylib;
function GetMusicTimePlayed(music: TMusic): single; cdecl; external libraylib;
function LoadAudioStream(sampleRate: dword; sampleSize: dword; channels: dword): TAudioStream; cdecl; external libraylib;
function IsAudioStreamValid(stream: TAudioStream): Tbool; cdecl; external libraylib;
procedure UnloadAudioStream(stream: TAudioStream); cdecl; external libraylib;
procedure UpdateAudioStream(stream: TAudioStream; data: pointer; frameCount: longint); cdecl; external libraylib;
function IsAudioStreamProcessed(stream: TAudioStream): Tbool; cdecl; external libraylib;
procedure PlayAudioStream(stream: TAudioStream); cdecl; external libraylib;
procedure PauseAudioStream(stream: TAudioStream); cdecl; external libraylib;
procedure ResumeAudioStream(stream: TAudioStream); cdecl; external libraylib;
function IsAudioStreamPlaying(stream: TAudioStream): Tbool; cdecl; external libraylib;
procedure StopAudioStream(stream: TAudioStream); cdecl; external libraylib;
procedure SetAudioStreamVolume(stream: TAudioStream; volume: single); cdecl; external libraylib;
procedure SetAudioStreamPitch(stream: TAudioStream; pitch: single); cdecl; external libraylib;
procedure SetAudioStreamPan(stream: TAudioStream; pan: single); cdecl; external libraylib;
procedure SetAudioStreamBufferSizeDefault(size: longint); cdecl; external libraylib;
procedure SetAudioStreamCallback(stream: TAudioStream; callback: TAudioCallback); cdecl; external libraylib;
procedure AttachAudioStreamProcessor(stream: TAudioStream; processor: TAudioCallback); cdecl; external libraylib;
procedure DetachAudioStreamProcessor(stream: TAudioStream; processor: TAudioCallback); cdecl; external libraylib;
procedure AttachAudioMixedProcessor(processor: TAudioCallback); cdecl; external libraylib;
procedure DetachAudioMixedProcessor(processor: TAudioCallback); cdecl; external libraylib;

const
  LIGHTGRAY: TColor = (r: 200; g: 200; b: 200; a: 255);
  GRAY: TColor = (r: 130; g: 130; b: 130; a: 255);
  DARKGRAY: TColor = (r: 80; g: 80; b: 80; a: 255);
  YELLOW: TColor = (r: 253; g: 249; b: 0; a: 255);
  GOLD: TColor = (r: 255; g: 203; b: 0; a: 255);
  ORANGE: TColor = (r: 255; g: 161; b: 0; a: 255);
  PINK: TColor = (r: 255; g: 109; b: 194; a: 255);
  RED: TColor = (r: 230; g: 41; b: 55; a: 255);
  MAROON: TColor = (r: 190; g: 33; b: 55; a: 255);
  GREEN: TColor = (r: 0; g: 228; b: 48; a: 255);
  LIME: TColor = (r: 0; g: 158; b: 47; a: 255);
  DARKGREEN: TColor = (r: 0; g: 117; b: 44; a: 255);
  SKYBLUE: TColor = (r: 102; g: 191; b: 255; a: 255);
  BLUE: TColor = (r: 0; g: 121; b: 241; a: 255);
  DARKBLUE: TColor = (r: 0; g: 82; b: 172; a: 255);
  PURPLE: TColor = (r: 200; g: 122; b: 255; a: 255);
  VIOLET: TColor = (r: 135; g: 60; b: 190; a: 255);
  DARKPURPL: TColor = (r: 112; g: 31; b: 126; a: 255);
  BEIGE: TColor = (r: 211; g: 176; b: 131; a: 255);
  BROWN: TColor = (r: 127; g: 106; b: 79; a: 255);
  DARKBROWN: TColor = (r: 76; g: 63; b: 47; a: 255);
  WHITE: TColor = (r: 255; g: 255; b: 255; a: 255);
  BLACK: TColor = (r: 0; g: 0; b: 0; a: 255);
  BLANK: TColor = (r: 0; g: 0; b: 0; a: 0);
  MAGENTA: TColor = (r: 255; g: 0; b: 255; a: 255);
  RAYWHITE: TColor = (r: 245; g: 245; b: 245; a: 255);


  // === Konventiert am: 26-1-26 20:04:05 ===


implementation

// wegen "division_by_zero" in den clibs
{$IF defined(CPUX86) or defined(CPUX64)}
{$asmmode intel}
procedure SetMXCSR;
var
  w2: word = 8064;
begin
  asm
           Ldmxcsr w2
  end;
end;
{$ENDIF}

begin
  {$IF defined(CPUX86) or defined(CPUX64)}
  SetMXCSR;
  {$ENDIF}
end.
