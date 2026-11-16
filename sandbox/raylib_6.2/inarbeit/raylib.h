/**********************************************************************************************
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
**********************************************************************************************/

#ifndef RAYLIB_H
#define RAYLIB_H

#include <stdarg.h>     // Required for: va_list - Only used by TraceLogCallback

#define RAYLIB_VERSION_MAJOR 6
#define RAYLIB_VERSION_MINOR 2
#define RAYLIB_VERSION_PATCH 0
#define RAYLIB_VERSION  "6.2"


//----------------------------------------------------------------------------------
// Defines and Macros
//----------------------------------------------------------------------------------
#ifndef DEG2RAD
    #define DEG2RAD (PI/180.0)
#endif
#ifndef RAD2DEG
    #define RAD2DEG (180.0/PI)
#endif



/* xxxxxxxxxxxxx/ Some Basic Colors
#define LIGHTGRAY  CLITERAL(Color){ 200, 200, 200, 255 }   // Light Gray
#define GRAY       CLITERAL(Color){ 130, 130, 130, 255 }   // Gray
#define DARKGRAY   CLITERAL(Color){ 80, 80, 80, 255 }      // Dark Gray
#define YELLOW     CLITERAL(Color){ 253, 249, 0, 255 }     // Yellow
#define GOLD       CLITERAL(Color){ 255, 203, 0, 255 }     // Gold
#define ORANGE     CLITERAL(Color){ 255, 161, 0, 255 }     // Orange
#define PINK       CLITERAL(Color){ 255, 109, 194, 255 }   // Pink
#define RED        CLITERAL(Color){ 230, 41, 55, 255 }     // Red
#define MAROON     CLITERAL(Color){ 190, 33, 55, 255 }     // Maroon
#define GREEN      CLITERAL(Color){ 0, 228, 48, 255 }      // Green
#define LIME       CLITERAL(Color){ 0, 158, 47, 255 }      // Lime
#define DARKGREEN  CLITERAL(Color){ 0, 117, 44, 255 }      // Dark Green
#define SKYBLUE    CLITERAL(Color){ 102, 191, 255, 255 }   // Sky Blue
#define BLUE       CLITERAL(Color){ 0, 121, 241, 255 }     // Blue
#define DARKBLUE   CLITERAL(Color){ 0, 82, 172, 255 }      // Dark Blue
#define PURPLE     CLITERAL(Color){ 200, 122, 255, 255 }   // Purple
#define VIOLET     CLITERAL(Color){ 135, 60, 190, 255 }    // Violet
#define DARKPURPLE CLITERAL(Color){ 112, 31, 126, 255 }    // Dark Purple
#define BEIGE      CLITERAL(Color){ 211, 176, 131, 255 }   // Beige
#define BROWN      CLITERAL(Color){ 127, 106, 79, 255 }    // Brown
#define DARKBROWN  CLITERAL(Color){ 76, 63, 47, 255 }      // Dark Brown

#define WHITE      CLITERAL(Color){ 255, 255, 255, 255 }   // White
#define BLACK      CLITERAL(Color){ 0, 0, 0, 255 }         // Black
#define BLANK      CLITERAL(Color){ 0, 0, 0, 0 }           // Blank (Transparent)
#define MAGENTA    CLITERAL(Color){ 255, 0, 255, 255 }     // Magenta
#define RAYWHITE   CLITERAL(Color){ 245, 245, 245, 255 }   // My own White (raylib logo)
*/

//----------------------------------------------------------------------------------
// Types and Structures Definition
//----------------------------------------------------------------------------------

// Vector2, 2 components
typedef struct Vector2 {
    float x;                // Vector x component
    float y;                // Vector y component
} Vector2;

// Vector3, 3 components
typedef struct Vector3 {
    float x;                // Vector x component
    float y;                // Vector y component
    float z;                // Vector z component
} Vector3;

// Vector4, 4 components
typedef struct Vector4 {
    float x;                // Vector x component
    float y;                // Vector y component
    float z;                // Vector z component
    float w;                // Vector w component
} Vector4;

// Quaternion, 4 components (Vector4 alias)
typedef Vector4 Quaternion;

// Matrix, 4x4 components, column major, OpenGL style, right-handed
typedef struct Matrix {
    float m0, m4, m8, m12;  // Matrix first row (4 components)
    float m1, m5, m9, m13;  // Matrix second row (4 components)
    float m2, m6, m10, m14; // Matrix third row (4 components)
    float m3, m7, m11, m15; // Matrix fourth row (4 components)
} Matrix;

// Color, 4 components, R8G8B8A8 (32bit)
typedef struct Color {
    unsigned char r;        // Color red value
    unsigned char g;        // Color green value
    unsigned char b;        // Color blue value
    unsigned char a;        // Color alpha value
} Color;

// Rectangle, 4 components
typedef struct Rectangle {
    float x;                // Rectangle top-left corner position x
    float y;                // Rectangle top-left corner position y
    float width;            // Rectangle width
    float height;           // Rectangle height
} Rectangle;

// Image, pixel data stored in CPU memory (RAM)
typedef struct Image {
    void *data;             // Image raw data
    int width;              // Image base width
    int height;             // Image base height
    int mipmaps;            // Mipmap levels, 1 by default
    int format;             // Data format (PixelFormat type)
} Image;

// Texture, tex data stored in GPU memory (VRAM)
typedef struct Texture {
    unsigned int id;        // OpenGL texture id
    int width;              // Texture base width
    int height;             // Texture base height
    int mipmaps;            // Mipmap levels, 1 by default
    int format;             // Data format (PixelFormat type)
} Texture;

// Texture2D, same as Texture
typedef Texture Texture2D;

// TextureCubemap, same as Texture
typedef Texture TextureCubemap;

// RenderTexture, fbo for texture rendering
typedef struct RenderTexture {
    unsigned int id;        // OpenGL framebuffer object id
    Texture texture;        // Color buffer attachment texture
    Texture depth;          // Depth buffer attachment texture
} RenderTexture;

// RenderTexture2D, same as RenderTexture
typedef RenderTexture RenderTexture2D;

// NPatchInfo, n-patch layout info
typedef struct NPatchInfo {
    Rectangle source;       // Texture source rectangle
    int left;               // Left border offset
    int top;                // Top border offset
    int right;              // Right border offset
    int bottom;             // Bottom border offset
    int layout;             // Layout of the n-patch: 3x3, 1x3 or 3x1
} NPatchInfo;

// GlyphInfo, font characters glyphs info
typedef struct GlyphInfo {
    int value;              // Character value (Unicode)
    int offsetX;            // Character offset X when drawing
    int offsetY;            // Character offset Y when drawing
    int advanceX;           // Character advance position X
    Image image;            // Character image data
} GlyphInfo;

// Font, font texture and GlyphInfo array data
typedef struct Font {
    int baseSize;           // Base size (default chars height)
    int glyphCount;         // Number of glyph characters
    int glyphPadding;       // Padding around the glyph characters
    Texture2D texture;      // Texture atlas containing the glyphs
    Rectangle *recs;        // Rectangles in texture for the glyphs
    GlyphInfo *glyphs;      // Glyphs info data
} Font;

// Camera, defines position/orientation in 3d space
typedef struct Camera3D {
    Vector3 position;       // Camera position
    Vector3 target;         // Camera target it looks-at
    Vector3 up;             // Camera up vector (rotation over its axis)
    float fovy;             // Camera field-of-view aperture in Y (degrees) in perspective, used as near plane height in world units in orthographic
    int projection;         // Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
} Camera3D;

typedef Camera3D Camera;    // Camera type fallback, defaults to Camera3D

// Camera2D, defines position/orientation in 2d space
typedef struct Camera2D {
    Vector2 offset;         // Camera offset (screen space offset from window origin, unscaled by DPI, real pixel size)
    Vector2 target;         // Camera target (world space target point that is mapped to screen space offset)
    float rotation;         // Camera rotation in degrees (pivots around target)
    float zoom;             // Camera zoom (scaling around target), must not be set to 0, set to 1.0f for no scale
} Camera2D;

// Mesh, vertex data and vao/vbo
typedef struct Mesh {
    int vertexCount;        // Number of vertices stored in arrays
    int triangleCount;      // Number of triangles stored (indexed or not)

    // Vertex attributes data
    float *vertices;        // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
    float *texcoords;       // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
    float *texcoords2;      // Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
    float *normals;         // Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
    float *tangents;        // Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
    unsigned char *colors;  // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
    unsigned short *indices; // Vertex indices (in case vertex data comes indexed)

    // Skin data for animation
    int boneCount;          // Number of bones (MAX: 256 bones)
    unsigned char *boneIndices; // Vertex bone indices, up to 4 bones influence by vertex (skinning) (shader-location = 6)
    float *boneWeights;     // Vertex bone weight, up to 4 bones influence by vertex (skinning) (shader-location = 7)

    // Runtime animation vertex data (CPU skinning)
    // NOTE: In case of GPU skinning, not used, pointers are NULL
    float *animVertices;    // Animated vertex positions (after bones transformations)
    float *animNormals;     // Animated normals (after bones transformations)

    // OpenGL identifiers
    unsigned int vaoId;     // OpenGL Vertex Array Object id
    unsigned int *vboId;    // OpenGL Vertex Buffer Objects id (default vertex data)
} Mesh;

// Shader
typedef struct Shader {
    unsigned int id;        // Shader program id
    int *locs;              // Shader locations array (RL_MAX_SHADER_LOCATIONS)
} Shader;

// MaterialMap
typedef struct MaterialMap {
    Texture2D texture;      // Material map texture
    Color color;            // Material map color
    float value;            // Material map value
} MaterialMap;

// Material, includes shader and maps
typedef struct Material {
    Shader shader;          // Material shader
    MaterialMap *maps;      // Material maps array (MAX_MATERIAL_MAPS)
    float params[4];        // Material generic parameters (if required)
} Material;

// Transform, vertex transformation data
typedef struct Transform {
    Vector3 translation;    // Translation
    Quaternion rotation;    // Rotation
    Vector3 scale;          // Scale
} Transform;

// Anim pose, an array of Transform[]
typedef Transform *ModelAnimPose;

// Bone, skeletal animation bone
typedef struct BoneInfo {
    char name[32];          // Bone name
    int parent;             // Bone parent
} BoneInfo;

// Skeleton, animation bones hierarchy
typedef struct ModelSkeleton {
    unsigned int boneCount; // Number of bones
    BoneInfo *bones;        // Bones information (skeleton)
    ModelAnimPose bindPose; // Bones base transformation (Transform[])
} ModelSkeleton;

// Model, meshes, materials and animation data
typedef struct Model {
    Matrix transform;       // Local transform matrix

    int meshCount;          // Number of meshes
    int materialCount;      // Number of materials
    Mesh *meshes;           // Meshes array
    Material *materials;    // Materials array
    int *meshMaterial;      // Mesh material number

    // Animation data
    ModelSkeleton skeleton; // Skeleton for animation

    // Runtime animation data (CPU/GPU skinning)
    ModelAnimPose currentPose; // Current animation pose (Transform[])
    Matrix *boneMatrices;   // Bones animated transformation matrices
} Model;

// ModelAnimation, contains a full animation sequence
typedef struct ModelAnimation {
    char name[32];          // Animation name

    unsigned int boneCount; // Number of bones (per pose)
    int keyframeCount;      // Number of animation key frames
    ModelAnimPose *keyframePoses; // Animation sequence keyframe poses [keyframe][pose]
} ModelAnimation;

// Ray, ray for raycasting
typedef struct Ray {
    Vector3 position;       // Ray position (origin)
    Vector3 direction;      // Ray direction (normalized)
} Ray;

// RayCollision, ray hit information
typedef struct RayCollision {
    bool hit;               // Did the ray hit something?
    float distance;         // Distance to the nearest hit
    Vector3 point;          // Point of the nearest hit
    Vector3 normal;         // Surface normal of hit
} RayCollision;

// BoundingBox
typedef struct BoundingBox {
    Vector3 min;            // Minimum vertex box-corner
    Vector3 max;            // Maximum vertex box-corner
} BoundingBox;

// Wave, audio wave data
typedef struct Wave {
    unsigned int frameCount;    // Total number of frames (considering channels)
    unsigned int sampleRate;    // Frequency (samples per second)
    unsigned int sampleSize;    // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    unsigned int channels;      // Number of channels (1-mono, 2-stereo, ...)
    void *data;                 // Buffer data pointer
} Wave;

// Opaque structs declaration
// NOTE: Actual structs are defined internally in raudio module
typedef struct rAudioBuffer rAudioBuffer;
typedef struct rAudioProcessor rAudioProcessor;

// AudioStream, custom audio stream
typedef struct AudioStream {
    rAudioBuffer *buffer;       // Pointer to internal data used by the audio system
    rAudioProcessor *processor; // Pointer to internal data processor, useful for audio effects

    unsigned int sampleRate;    // Frequency (samples per second)
    unsigned int sampleSize;    // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    unsigned int channels;      // Number of channels (1-mono, 2-stereo, ...)
} AudioStream;

// Sound
typedef struct Sound {
    AudioStream stream;         // Audio stream
    unsigned int frameCount;    // Total number of frames (considering channels)
} Sound;

// Music, audio stream, anything longer than ~10 seconds should be streamed
typedef struct Music {
    AudioStream stream;         // Audio stream
    unsigned int frameCount;    // Total number of frames (considering channels)
    bool looping;               // Music looping enable

    int ctxType;                // Type of music context (audio filetype)
    void *ctxData;              // Audio context data, depends on type
} Music;

// VrDeviceInfo, Head-Mounted-Display device parameters
typedef struct VrDeviceInfo {
    int hResolution;                // Horizontal resolution in pixels
    int vResolution;                // Vertical resolution in pixels
    float hScreenSize;              // Horizontal size in meters
    float vScreenSize;              // Vertical size in meters
    float eyeToScreenDistance;      // Distance between eye and display in meters
    float lensSeparationDistance;   // Lens separation distance in meters
    float interpupillaryDistance;   // IPD (distance between pupils) in meters
    float lensDistortionValues[4];  // Lens distortion constant parameters
    float chromaAbCorrection[4];    // Chromatic aberration correction parameters
} VrDeviceInfo;

// VrStereoConfig, VR stereo rendering configuration for simulator
typedef struct VrStereoConfig {
    Matrix projection[2];           // VR projection matrices (per eye)
    Matrix viewOffset[2];           // VR view offset matrices (per eye)
    float leftLensCenter[2];        // VR left lens center
    float rightLensCenter[2];       // VR right lens center
    float leftScreenCenter[2];      // VR left screen center
    float rightScreenCenter[2];     // VR right screen center
    float scale[2];                 // VR distortion scale
    float scaleIn[2];               // VR distortion scale in
} VrStereoConfig;

// File path list
typedef struct FilePathList {
    unsigned int count;             // Filepaths entries count
    char **paths;                   // Filepaths entries
} FilePathList;

// Automation event
typedef struct AutomationEvent {
    unsigned int frame;             // Event frame
    unsigned int type;              // Event type (AutomationEventType)
    int params[4];                  // Event parameters (if required)
} AutomationEvent;

// Automation event list
typedef struct AutomationEventList {
    unsigned int capacity;          // Events max entries (MAX_AUTOMATION_EVENTS)
    unsigned int count;             // Events entries count
    AutomationEvent *events;        // Events entries
} AutomationEventList;

//----------------------------------------------------------------------------------
// Enumerators Definition
//----------------------------------------------------------------------------------
// System/Window config flags
// NOTE: Every bit registers one state (use it with bit masks)
// By default all flags are set to 0
typedef enum {
    FLAG_VSYNC_HINT         = 0x00000040,   // Set to try enabling V-Sync on GPU
    FLAG_FULLSCREEN_MODE    = 0x00000002,   // Set to run program in fullscreen
    FLAG_WINDOW_RESIZABLE   = 0x00000004,   // Set to allow resizable window
    FLAG_WINDOW_UNDECORATED = 0x00000008,   // Set to disable window decoration (frame and buttons)
    FLAG_WINDOW_HIDDEN      = 0x00000080,   // Set to hide window
    FLAG_WINDOW_MINIMIZED   = 0x00000200,   // Set to minimize window (iconify)
    FLAG_WINDOW_MAXIMIZED   = 0x00000400,   // Set to maximize window (expanded to monitor)
    FLAG_WINDOW_UNFOCUSED   = 0x00000800,   // Set to window non focused
    FLAG_WINDOW_TOPMOST     = 0x00001000,   // Set to window always on top
    FLAG_WINDOW_ALWAYS_RUN  = 0x00000100,   // Set to allow windows running while minimized
    FLAG_WINDOW_TRANSPARENT = 0x00000010,   // Set to allow transparent framebuffer
    FLAG_WINDOW_HIGHDPI     = 0x00002000,   // Set to support HighDPI
    FLAG_WINDOW_MOUSE_PASSTHROUGH = 0x00004000, // Set to support mouse passthrough, only supported when FLAG_WINDOW_UNDECORATED
    FLAG_BORDERLESS_WINDOWED_MODE = 0x00008000, // Set to run program in borderless windowed mode
    FLAG_MSAA_4X_HINT       = 0x00000020,   // Set to try enabling MSAA 4X
    FLAG_INTERLACED_HINT    = 0x00010000    // Set to try enabling interlaced video format (for V3D)
} ConfigFlags;

// Trace log level
// NOTE: Organized by priority level
typedef enum {
    LOG_ALL = 0,        // Display all logs
    LOG_TRACE,          // Trace logging, intended for internal use only
    LOG_DEBUG,          // Debug logging, used for internal debugging, it should be disabled on release builds
    LOG_INFO,           // Info logging, used for program execution info
    LOG_WARNING,        // Warning logging, used on recoverable failures
    LOG_ERROR,          // Error logging, used on unrecoverable failures
    LOG_FATAL,          // Fatal logging, used to abort program: exit(EXIT_FAILURE)
    LOG_NONE            // Disable logging
} TraceLogLevel;

// Keyboard keys (US keyboard layout)
// NOTE: Use GetKeyPressed() to allow redefining required keys for alternative layouts
typedef enum {
    KEY_NULL            = 0,        // Key: NULL, used for no key pressed
    // Alphanumeric keys
    KEY_APOSTROPHE      = 39,       // Key: '
    KEY_COMMA           = 44,       // Key: ,
    KEY_MINUS           = 45,       // Key: -
    KEY_PERIOD          = 46,       // Key: .
    KEY_SLASH           = 47,       // Key: /
    KEY_ZERO            = 48,       // Key: 0
    KEY_ONE             = 49,       // Key: 1
    KEY_TWO             = 50,       // Key: 2
    KEY_THREE           = 51,       // Key: 3
    KEY_FOUR            = 52,       // Key: 4
    KEY_FIVE            = 53,       // Key: 5
    KEY_SIX             = 54,       // Key: 6
    KEY_SEVEN           = 55,       // Key: 7
    KEY_EIGHT           = 56,       // Key: 8
    KEY_NINE            = 57,       // Key: 9
    KEY_SEMICOLON       = 59,       // Key: ;
    KEY_EQUAL           = 61,       // Key: =
    KEY_A               = 65,       // Key: A | a
    KEY_B               = 66,       // Key: B | b
    KEY_C               = 67,       // Key: C | c
    KEY_D               = 68,       // Key: D | d
    KEY_E               = 69,       // Key: E | e
    KEY_F               = 70,       // Key: F | f
    KEY_G               = 71,       // Key: G | g
    KEY_H               = 72,       // Key: H | h
    KEY_I               = 73,       // Key: I | i
    KEY_J               = 74,       // Key: J | j
    KEY_K               = 75,       // Key: K | k
    KEY_L               = 76,       // Key: L | l
    KEY_M               = 77,       // Key: M | m
    KEY_N               = 78,       // Key: N | n
    KEY_O               = 79,       // Key: O | o
    KEY_P               = 80,       // Key: P | p
    KEY_Q               = 81,       // Key: Q | q
    KEY_R               = 82,       // Key: R | r
    KEY_S               = 83,       // Key: S | s
    KEY_T               = 84,       // Key: T | t
    KEY_U               = 85,       // Key: U | u
    KEY_V               = 86,       // Key: V | v
    KEY_W               = 87,       // Key: W | w
    KEY_X               = 88,       // Key: X | x
    KEY_Y               = 89,       // Key: Y | y
    KEY_Z               = 90,       // Key: Z | z
    KEY_LEFT_BRACKET    = 91,       // Key: [
    KEY_BACKSLASH       = 92,       // Key: '\'
    KEY_RIGHT_BRACKET   = 93,       // Key: ]
    KEY_GRAVE           = 96,       // Key: `
    // Function keys
    KEY_SPACE           = 32,       // Key: Space
    KEY_ESCAPE          = 256,      // Key: Esc
    KEY_ENTER           = 257,      // Key: Enter
    KEY_TAB             = 258,      // Key: Tab
    KEY_BACKSPACE       = 259,      // Key: Backspace
    KEY_INSERT          = 260,      // Key: Ins
    KEY_DELETE          = 261,      // Key: Del
    KEY_RIGHT           = 262,      // Key: Cursor right
    KEY_LEFT            = 263,      // Key: Cursor left
    KEY_DOWN            = 264,      // Key: Cursor down
    KEY_UP              = 265,      // Key: Cursor up
    KEY_PAGE_UP         = 266,      // Key: Page up
    KEY_PAGE_DOWN       = 267,      // Key: Page down
    KEY_HOME            = 268,      // Key: Home
    KEY_END             = 269,      // Key: End
    KEY_CAPS_LOCK       = 280,      // Key: Caps lock
    KEY_SCROLL_LOCK     = 281,      // Key: Scroll down
    KEY_NUM_LOCK        = 282,      // Key: Num lock
    KEY_PRINT_SCREEN    = 283,      // Key: Print screen
    KEY_PAUSE           = 284,      // Key: Pause
    KEY_F1              = 290,      // Key: F1
    KEY_F2              = 291,      // Key: F2
    KEY_F3              = 292,      // Key: F3
    KEY_F4              = 293,      // Key: F4
    KEY_F5              = 294,      // Key: F5
    KEY_F6              = 295,      // Key: F6
    KEY_F7              = 296,      // Key: F7
    KEY_F8              = 297,      // Key: F8
    KEY_F9              = 298,      // Key: F9
    KEY_F10             = 299,      // Key: F10
    KEY_F11             = 300,      // Key: F11
    KEY_F12             = 301,      // Key: F12
    KEY_LEFT_SHIFT      = 340,      // Key: Shift left
    KEY_LEFT_CONTROL    = 341,      // Key: Control left
    KEY_LEFT_ALT        = 342,      // Key: Alt left
    KEY_LEFT_SUPER      = 343,      // Key: Super left
    KEY_RIGHT_SHIFT     = 344,      // Key: Shift right
    KEY_RIGHT_CONTROL   = 345,      // Key: Control right
    KEY_RIGHT_ALT       = 346,      // Key: Alt right
    KEY_RIGHT_SUPER     = 347,      // Key: Super right
    KEY_KB_MENU         = 348,      // Key: KB menu
    // Keypad keys
    KEY_KP_0            = 320,      // Key: Keypad 0
    KEY_KP_1            = 321,      // Key: Keypad 1
    KEY_KP_2            = 322,      // Key: Keypad 2
    KEY_KP_3            = 323,      // Key: Keypad 3
    KEY_KP_4            = 324,      // Key: Keypad 4
    KEY_KP_5            = 325,      // Key: Keypad 5
    KEY_KP_6            = 326,      // Key: Keypad 6
    KEY_KP_7            = 327,      // Key: Keypad 7
    KEY_KP_8            = 328,      // Key: Keypad 8
    KEY_KP_9            = 329,      // Key: Keypad 9
    KEY_KP_DECIMAL      = 330,      // Key: Keypad .
    KEY_KP_DIVIDE       = 331,      // Key: Keypad /
    KEY_KP_MULTIPLY     = 332,      // Key: Keypad *
    KEY_KP_SUBTRACT     = 333,      // Key: Keypad -
    KEY_KP_ADD          = 334,      // Key: Keypad +
    KEY_KP_ENTER        = 335,      // Key: Keypad Enter
    KEY_KP_EQUAL        = 336,      // Key: Keypad =
    // Android key buttons
    KEY_BACK            = 4,        // Key: Android back button
    KEY_MENU            = 5,        // Key: Android menu button
    KEY_VOLUME_UP       = 24,       // Key: Android volume up button
    KEY_VOLUME_DOWN     = 25        // Key: Android volume down button
} KeyboardKey;

// Add backwards compatibility support for deprecated names
#define MOUSE_LEFT_BUTTON   MOUSE_BUTTON_LEFT
#define MOUSE_RIGHT_BUTTON  MOUSE_BUTTON_RIGHT
#define MOUSE_MIDDLE_BUTTON MOUSE_BUTTON_MIDDLE

// Mouse buttons
typedef enum {
    MOUSE_BUTTON_LEFT    = 0,       // Mouse button left
    MOUSE_BUTTON_RIGHT   = 1,       // Mouse button right
    MOUSE_BUTTON_MIDDLE  = 2,       // Mouse button middle (pressed wheel)
    MOUSE_BUTTON_SIDE    = 3,       // Mouse button side (advanced mouse device)
    MOUSE_BUTTON_EXTRA   = 4,       // Mouse button extra (advanced mouse device)
    MOUSE_BUTTON_FORWARD = 5,       // Mouse button forward (advanced mouse device)
    MOUSE_BUTTON_BACK    = 6,       // Mouse button back (advanced mouse device)
} MouseButton;

// Mouse cursor
typedef enum {
    MOUSE_CURSOR_DEFAULT       = 0,     // Default pointer shape
    MOUSE_CURSOR_ARROW         = 1,     // Arrow shape
    MOUSE_CURSOR_IBEAM         = 2,     // Text writing cursor shape
    MOUSE_CURSOR_CROSSHAIR     = 3,     // Cross shape
    MOUSE_CURSOR_POINTING_HAND = 4,     // Pointing hand cursor
    MOUSE_CURSOR_RESIZE_EW     = 5,     // Horizontal resize/move arrow shape
    MOUSE_CURSOR_RESIZE_NS     = 6,     // Vertical resize/move arrow shape
    MOUSE_CURSOR_RESIZE_NWSE   = 7,     // Top-left to bottom-right diagonal resize/move arrow shape
    MOUSE_CURSOR_RESIZE_NESW   = 8,     // The top-right to bottom-left diagonal resize/move arrow shape
    MOUSE_CURSOR_RESIZE_ALL    = 9,     // The omnidirectional resize/move cursor shape
    MOUSE_CURSOR_NOT_ALLOWED   = 10     // The operation-not-allowed shape
} MouseCursor;

// Gamepad buttons
typedef enum {
    GAMEPAD_BUTTON_UNKNOWN = 0,         // Unknown button, for error checking
    GAMEPAD_BUTTON_LEFT_FACE_UP,        // Gamepad left DPAD up button
    GAMEPAD_BUTTON_LEFT_FACE_RIGHT,     // Gamepad left DPAD right button
    GAMEPAD_BUTTON_LEFT_FACE_DOWN,      // Gamepad left DPAD down button
    GAMEPAD_BUTTON_LEFT_FACE_LEFT,      // Gamepad left DPAD left button
    GAMEPAD_BUTTON_RIGHT_FACE_UP,       // Gamepad right button up (i.e. PS3: Triangle, Xbox: Y)
    GAMEPAD_BUTTON_RIGHT_FACE_RIGHT,    // Gamepad right button right (i.e. PS3: Circle, Xbox: B)
    GAMEPAD_BUTTON_RIGHT_FACE_DOWN,     // Gamepad right button down (i.e. PS3: Cross, Xbox: A)
    GAMEPAD_BUTTON_RIGHT_FACE_LEFT,     // Gamepad right button left (i.e. PS3: Square, Xbox: X)
    GAMEPAD_BUTTON_LEFT_TRIGGER_1,      // Gamepad top/back trigger left (first), it could be a trailing button
    GAMEPAD_BUTTON_LEFT_TRIGGER_2,      // Gamepad top/back trigger left (second), it could be a trailing button
    GAMEPAD_BUTTON_RIGHT_TRIGGER_1,     // Gamepad top/back trigger right (first), it could be a trailing button
    GAMEPAD_BUTTON_RIGHT_TRIGGER_2,     // Gamepad top/back trigger right (second), it could be a trailing button
    GAMEPAD_BUTTON_MIDDLE_LEFT,         // Gamepad center buttons, left one (i.e. PS3: Select)
    GAMEPAD_BUTTON_MIDDLE,              // Gamepad center buttons, middle one (i.e. PS3: PS, Xbox: XBOX)
    GAMEPAD_BUTTON_MIDDLE_RIGHT,        // Gamepad center buttons, right one (i.e. PS3: Start)
    GAMEPAD_BUTTON_LEFT_THUMB,          // Gamepad joystick pressed button left
    GAMEPAD_BUTTON_RIGHT_THUMB          // Gamepad joystick pressed button right
} GamepadButton;

// Gamepad axes
typedef enum {
    GAMEPAD_AXIS_LEFT_X        = 0,     // Gamepad left stick X axis
    GAMEPAD_AXIS_LEFT_Y        = 1,     // Gamepad left stick Y axis
    GAMEPAD_AXIS_RIGHT_X       = 2,     // Gamepad right stick X axis
    GAMEPAD_AXIS_RIGHT_Y       = 3,     // Gamepad right stick Y axis
    GAMEPAD_AXIS_LEFT_TRIGGER  = 4,     // Gamepad back trigger left, pressure level: [1..-1]
    GAMEPAD_AXIS_RIGHT_TRIGGER = 5      // Gamepad back trigger right, pressure level: [1..-1]
} GamepadAxis;

// Material map index
typedef enum {
    MATERIAL_MAP_ALBEDO = 0,        // Albedo material (same as: MATERIAL_MAP_DIFFUSE)
    MATERIAL_MAP_METALNESS,         // Metalness material (same as: MATERIAL_MAP_SPECULAR)
    MATERIAL_MAP_NORMAL,            // Normal material
    MATERIAL_MAP_ROUGHNESS,         // Roughness material
    MATERIAL_MAP_OCCLUSION,         // Ambient occlusion material
    MATERIAL_MAP_EMISSION,          // Emission material
    MATERIAL_MAP_HEIGHT,            // Heightmap material
    MATERIAL_MAP_CUBEMAP,           // Cubemap material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
    MATERIAL_MAP_IRRADIANCE,        // Irradiance material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
    MATERIAL_MAP_PREFILTER,         // Prefilter material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
    MATERIAL_MAP_BRDF               // Brdf material
} MaterialMapIndex;

#define MATERIAL_MAP_DIFFUSE      MATERIAL_MAP_ALBEDO
#define MATERIAL_MAP_SPECULAR     MATERIAL_MAP_METALNESS

// Shader location index
// NOTE: Some locations are tried to be set automatically on shader loading,
// but only if default attributes/uniforms names are found, check config.h for names
typedef enum {
    SHADER_LOC_VERTEX_POSITION = 0, // Shader location: vertex attribute: position
    SHADER_LOC_VERTEX_TEXCOORD01,   // Shader location: vertex attribute: texcoord01
    SHADER_LOC_VERTEX_TEXCOORD02,   // Shader location: vertex attribute: texcoord02
    SHADER_LOC_VERTEX_NORMAL,       // Shader location: vertex attribute: normal
    SHADER_LOC_VERTEX_TANGENT,      // Shader location: vertex attribute: tangent
    SHADER_LOC_VERTEX_COLOR,        // Shader location: vertex attribute: color
    SHADER_LOC_MATRIX_MVP,          // Shader location: matrix uniform: model-view-projection
    SHADER_LOC_MATRIX_VIEW,         // Shader location: matrix uniform: view (camera transform)
    SHADER_LOC_MATRIX_PROJECTION,   // Shader location: matrix uniform: projection
    SHADER_LOC_MATRIX_MODEL,        // Shader location: matrix uniform: model (transform)
    SHADER_LOC_MATRIX_NORMAL,       // Shader location: matrix uniform: normal
    SHADER_LOC_VECTOR_VIEW,         // Shader location: vector uniform: view
    SHADER_LOC_COLOR_DIFFUSE,       // Shader location: vector uniform: diffuse color
    SHADER_LOC_COLOR_SPECULAR,      // Shader location: vector uniform: specular color
    SHADER_LOC_COLOR_AMBIENT,       // Shader location: vector uniform: ambient color
    SHADER_LOC_MAP_ALBEDO,          // Shader location: sampler2d texture: albedo (same as: SHADER_LOC_MAP_DIFFUSE)
    SHADER_LOC_MAP_METALNESS,       // Shader location: sampler2d texture: metalness (same as: SHADER_LOC_MAP_SPECULAR)
    SHADER_LOC_MAP_NORMAL,          // Shader location: sampler2d texture: normal
    SHADER_LOC_MAP_ROUGHNESS,       // Shader location: sampler2d texture: roughness
    SHADER_LOC_MAP_OCCLUSION,       // Shader location: sampler2d texture: occlusion
    SHADER_LOC_MAP_EMISSION,        // Shader location: sampler2d texture: emission
    SHADER_LOC_MAP_HEIGHT,          // Shader location: sampler2d texture: heightmap
    SHADER_LOC_MAP_CUBEMAP,         // Shader location: samplerCube texture: cubemap
    SHADER_LOC_MAP_IRRADIANCE,      // Shader location: samplerCube texture: irradiance
    SHADER_LOC_MAP_PREFILTER,       // Shader location: samplerCube texture: prefilter
    SHADER_LOC_MAP_BRDF,            // Shader location: sampler2d texture: brdf
    SHADER_LOC_VERTEX_BONEIDS,      // Shader location: vertex attribute: bone indices
    SHADER_LOC_VERTEX_BONEWEIGHTS,  // Shader location: vertex attribute: bone weights
    SHADER_LOC_MATRIX_BONETRANSFORMS, // Shader location: matrix attribute: bone transforms (animation)
    SHADER_LOC_VERTEX_INSTANCETRANSFORM // Shader location: vertex attribute: instance transforms
} ShaderLocationIndex;

#define SHADER_LOC_MAP_DIFFUSE      SHADER_LOC_MAP_ALBEDO
#define SHADER_LOC_MAP_SPECULAR     SHADER_LOC_MAP_METALNESS

// Shader uniform data type
typedef enum {
    SHADER_UNIFORM_FLOAT = 0,       // Shader uniform type: float
    SHADER_UNIFORM_VEC2,            // Shader uniform type: vec2 (2 float)
    SHADER_UNIFORM_VEC3,            // Shader uniform type: vec3 (3 float)
    SHADER_UNIFORM_VEC4,            // Shader uniform type: vec4 (4 float)
    SHADER_UNIFORM_INT,             // Shader uniform type: int
    SHADER_UNIFORM_IVEC2,           // Shader uniform type: ivec2 (2 int)
    SHADER_UNIFORM_IVEC3,           // Shader uniform type: ivec3 (3 int)
    SHADER_UNIFORM_IVEC4,           // Shader uniform type: ivec4 (4 int)
    SHADER_UNIFORM_UINT,            // Shader uniform type: unsigned int
    SHADER_UNIFORM_UIVEC2,          // Shader uniform type: uivec2 (2 unsigned int)
    SHADER_UNIFORM_UIVEC3,          // Shader uniform type: uivec3 (3 unsigned int)
    SHADER_UNIFORM_UIVEC4,          // Shader uniform type: uivec4 (4 unsigned int)
    SHADER_UNIFORM_SAMPLER2D        // Shader uniform type: sampler2d
} ShaderUniformDataType;

// Shader attribute data types
typedef enum {
    SHADER_ATTRIB_FLOAT = 0,        // Shader attribute type: float
    SHADER_ATTRIB_VEC2,             // Shader attribute type: vec2 (2 float)
    SHADER_ATTRIB_VEC3,             // Shader attribute type: vec3 (3 float)
    SHADER_ATTRIB_VEC4              // Shader attribute type: vec4 (4 float)
} ShaderAttributeDataType;

// Pixel formats
// NOTE: Support depends on OpenGL version and platform
typedef enum {
    PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1, // 8 bit per pixel (no alpha)
    PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA,    // 8*2 bpp (2 channels)
    PIXELFORMAT_UNCOMPRESSED_R5G6B5,        // 16 bpp
    PIXELFORMAT_UNCOMPRESSED_R8G8B8,        // 24 bpp
    PIXELFORMAT_UNCOMPRESSED_R5G5B5A1,      // 16 bpp (1 bit alpha)
    PIXELFORMAT_UNCOMPRESSED_R4G4B4A4,      // 16 bpp (4 bit alpha)
    PIXELFORMAT_UNCOMPRESSED_R8G8B8A8,      // 32 bpp
    PIXELFORMAT_UNCOMPRESSED_R32,           // 32 bpp (1 channel - float)
    PIXELFORMAT_UNCOMPRESSED_R32G32B32,     // 32*3 bpp (3 channels - float)
    PIXELFORMAT_UNCOMPRESSED_R32G32B32A32,  // 32*4 bpp (4 channels - float)
    PIXELFORMAT_UNCOMPRESSED_R16,           // 16 bpp (1 channel - half float)
    PIXELFORMAT_UNCOMPRESSED_R16G16B16,     // 16*3 bpp (3 channels - half float)
    PIXELFORMAT_UNCOMPRESSED_R16G16B16A16,  // 16*4 bpp (4 channels - half float)
    PIXELFORMAT_COMPRESSED_DXT1_RGB,        // 4 bpp (no alpha)
    PIXELFORMAT_COMPRESSED_DXT1_RGBA,       // 4 bpp (1 bit alpha)
    PIXELFORMAT_COMPRESSED_DXT3_RGBA,       // 8 bpp
    PIXELFORMAT_COMPRESSED_DXT5_RGBA,       // 8 bpp
    PIXELFORMAT_COMPRESSED_ETC1_RGB,        // 4 bpp
    PIXELFORMAT_COMPRESSED_ETC2_RGB,        // 4 bpp
    PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA,   // 8 bpp
    PIXELFORMAT_COMPRESSED_PVRT_RGB,        // 4 bpp
    PIXELFORMAT_COMPRESSED_PVRT_RGBA,       // 4 bpp
    PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA,   // 8 bpp
    PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA    // 2 bpp
} PixelFormat;

// Texture parameters: filter mode
// NOTE 1: Filtering considers mipmaps if available in the texture
// NOTE 2: Filter is accordingly set for minification and magnification
typedef enum {
    TEXTURE_FILTER_POINT = 0,               // No filter, pixel approximation
    TEXTURE_FILTER_BILINEAR,                // Linear filtering
    TEXTURE_FILTER_TRILINEAR,               // Trilinear filtering (linear with mipmaps)
    TEXTURE_FILTER_ANISOTROPIC_4X,          // Anisotropic filtering 4x
    TEXTURE_FILTER_ANISOTROPIC_8X,          // Anisotropic filtering 8x
    TEXTURE_FILTER_ANISOTROPIC_16X,         // Anisotropic filtering 16x
} TextureFilter;

// Texture parameters: wrap mode
typedef enum {
    TEXTURE_WRAP_REPEAT = 0,                // Repeats texture in tiled mode
    TEXTURE_WRAP_CLAMP,                     // Clamps texture to edge pixel in tiled mode
    TEXTURE_WRAP_MIRROR_REPEAT,             // Mirrors and repeats the texture in tiled mode
    TEXTURE_WRAP_MIRROR_CLAMP               // Mirrors and clamps to border the texture in tiled mode
} TextureWrap;

// Cubemap layouts
typedef enum {
    CUBEMAP_LAYOUT_AUTO_DETECT = 0,         // Automatically detect layout type
    CUBEMAP_LAYOUT_LINE_VERTICAL,           // Layout is defined by a vertical line with faces
    CUBEMAP_LAYOUT_LINE_HORIZONTAL,         // Layout is defined by a horizontal line with faces
    CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR,     // Layout is defined by a 3x4 cross with cubemap faces
    CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE     // Layout is defined by a 4x3 cross with cubemap faces
} CubemapLayout;

// Font type, defines generation method
typedef enum {
    FONT_DEFAULT = 0,               // Default font generation, anti-aliased
    FONT_BITMAP,                    // Bitmap font generation, no anti-aliasing
    FONT_SDF                        // SDF font generation, requires external shader
} FontType;

// Color blending modes (pre-defined)
typedef enum {
    BLEND_ALPHA = 0,                // Blend textures considering alpha (default)
    BLEND_ADDITIVE,                 // Blend textures adding colors
    BLEND_MULTIPLIED,               // Blend textures multiplying colors
    BLEND_ADD_COLORS,               // Blend textures adding colors (alternative)
    BLEND_SUBTRACT_COLORS,          // Blend textures subtracting colors (alternative)
    BLEND_ALPHA_PREMULTIPLY,        // Blend premultiplied textures considering alpha
    BLEND_CUSTOM,                   // Blend textures using custom src/dst factors (use rlSetBlendFactors())
    BLEND_CUSTOM_SEPARATE           // Blend textures using custom rgb/alpha separate src/dst factors (use rlSetBlendFactorsSeparate())
} BlendMode;

// Gesture
// NOTE: Provided as bit-wise flags to enable only desired gestures
typedef enum {
    GESTURE_NONE        = 0,        // No gesture
    GESTURE_TAP         = 1,        // Tap gesture
    GESTURE_DOUBLETAP   = 2,        // Double tap gesture
    GESTURE_HOLD        = 4,        // Hold gesture
    GESTURE_DRAG        = 8,        // Drag gesture
    GESTURE_SWIPE_RIGHT = 16,       // Swipe right gesture
    GESTURE_SWIPE_LEFT  = 32,       // Swipe left gesture
    GESTURE_SWIPE_UP    = 64,       // Swipe up gesture
    GESTURE_SWIPE_DOWN  = 128,      // Swipe down gesture
    GESTURE_PINCH_IN    = 256,      // Pinch in gesture
    GESTURE_PINCH_OUT   = 512       // Pinch out gesture
} Gesture;

// Camera system modes
typedef enum {
    CAMERA_CUSTOM = 0,              // Camera custom, controlled by user (UpdateCamera() does nothing)
    CAMERA_FREE,                    // Camera free mode
    CAMERA_ORBITAL,                 // Camera orbital, around target, zoom supported
    CAMERA_FIRST_PERSON,            // Camera first person
    CAMERA_THIRD_PERSON             // Camera third person
} CameraMode;

// Camera projection
typedef enum {
    CAMERA_PERSPECTIVE = 0,         // Perspective projection
    CAMERA_ORTHOGRAPHIC             // Orthographic projection
} CameraProjection;

// N-patch layout
typedef enum {
    NPATCH_NINE_PATCH = 0,          // Npatch layout: 3x3 tiles
    NPATCH_THREE_PATCH_VERTICAL,    // Npatch layout: 1x3 tiles
    NPATCH_THREE_PATCH_HORIZONTAL   // Npatch layout: 3x1 tiles
} NPatchLayout;

// Callbacks to hook some internal functions
// WARNING: These callbacks are intended for advanced users
typedef void (*TraceLogCallback)(int logLevel, const char *text, va_list args); // Logging: Redirect trace log messages
typedef unsigned char *(*LoadFileDataCallback)(const char *fileName, int *dataSize); // FileIO: Load binary data
typedef bool (*SaveFileDataCallback)(const char *fileName, const void *data, int dataSize); // FileIO: Save binary data
typedef char *(*LoadFileTextCallback)(const char *fileName);                  // FileIO: Load text data
typedef bool (*SaveFileTextCallback)(const char *fileName, const char *text); // FileIO: Save text data

//------------------------------------------------------------------------------------
// Global Variables Definition
//------------------------------------------------------------------------------------
// It's lonely here...

//------------------------------------------------------------------------------------
// Window and Graphics Device Functions (Module: core)
//------------------------------------------------------------------------------------


// Window-related functions
extern void InitWindow(int width, int height, const char *title);  // Initialize window and OpenGL context
extern void CloseWindow(void);                                     // Close window and unload OpenGL context
extern bool WindowShouldClose(void);                               // Check if application should close (KEY_ESCAPE pressed or windows close icon clicked)
extern bool IsWindowReady(void);                                   // Check if window has been initialized successfully
extern bool IsWindowFullscreen(void);                              // Check if window is currently fullscreen
extern bool IsWindowHidden(void);                                  // Check if window is currently hidden
extern bool IsWindowMinimized(void);                               // Check if window is currently minimized
extern bool IsWindowMaximized(void);                               // Check if window is currently maximized
extern bool IsWindowFocused(void);                                 // Check if window is currently focused
extern bool IsWindowResized(void);                                 // Check if window has been resized last frame
extern bool IsWindowState(unsigned int flag);                      // Check if one specific window flag is enabled
extern void SetWindowState(unsigned int flags);                    // Set window configuration state using flags
extern void ClearWindowState(unsigned int flags);                  // Clear window configuration state flags
extern void ToggleFullscreen(void);                                // Toggle window state: fullscreen/windowed, resizes monitor to match window resolution
extern void ToggleBorderlessWindowed(void);                        // Toggle window state: borderless windowed, resizes window to match monitor resolution
extern void MaximizeWindow(void);                                  // Set window state: maximized, if resizable
extern void MinimizeWindow(void);                                  // Set window state: minimized, if resizable
extern void RestoreWindow(void);                                   // Restore window from being minimized/maximized
extern void SetWindowIcon(Image image);                            // Set icon for window (single image, RGBA 32bit)
extern void SetWindowIcons(Image *images, int count);              // Set icon for window (multiple images, RGBA 32bit)
extern void SetWindowTitle(const char *title);                     // Set title for window
extern void SetWindowPosition(int x, int y);                       // Set window position on screen
extern void SetWindowMonitor(int monitor);                         // Set monitor for the current window
extern void SetWindowMinSize(int width, int height);               // Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
extern void SetWindowMaxSize(int width, int height);               // Set window maximum dimensions (for FLAG_WINDOW_RESIZABLE)
extern void SetWindowSize(int width, int height);                  // Set window dimensions
extern void SetWindowOpacity(float opacity);                       // Set window opacity [0.0f..1.0f]
extern void SetWindowFocused(void);                                // Set window focused
extern void *GetWindowHandle(void);                                // Get native window handle
extern int GetScreenWidth(void);                                   // Get current screen width
extern int GetScreenHeight(void);                                  // Get current screen height
extern int GetRenderWidth(void);                                   // Get current render width (it considers HiDPI)
extern int GetRenderHeight(void);                                  // Get current render height (it considers HiDPI)
extern int GetMonitorCount(void);                                  // Get number of connected monitors
extern int GetCurrentMonitor(void);                                // Get current monitor where window is placed
extern Vector2 GetMonitorPosition(int monitor);                    // Get specified monitor position
extern int GetMonitorWidth(int monitor);                           // Get specified monitor width (current video mode used by monitor)
extern int GetMonitorHeight(int monitor);                          // Get specified monitor height (current video mode used by monitor)
extern int GetMonitorPhysicalWidth(int monitor);                   // Get specified monitor physical width in millimetres
extern int GetMonitorPhysicalHeight(int monitor);                  // Get specified monitor physical height in millimetres
extern int GetMonitorRefreshRate(int monitor);                     // Get specified monitor refresh rate
extern Vector2 GetWindowPosition(void);                            // Get window position XY on monitor
extern Vector2 GetWindowScaleDPI(void);                            // Get window scale DPI factor
extern const char *GetMonitorName(int monitor);                    // Get the human-readable, UTF-8 encoded name of the specified monitor
extern void SetClipboardText(const char *text);                    // Set clipboard text content
extern const char *GetClipboardText(void);                         // Get clipboard text content
extern Image GetClipboardImage(void);                              // Get clipboard image content
extern void EnableEventWaiting(void);                              // Enable waiting for events on EndDrawing(), no automatic event polling
extern void DisableEventWaiting(void);                             // Disable waiting for events on EndDrawing(), automatic events polling

// Cursor-related functions
extern void ShowCursor(void);                                      // Show cursor
extern void HideCursor(void);                                      // Hide cursor
extern bool IsCursorHidden(void);                                  // Check if cursor is not visible
extern void EnableCursor(void);                                    // Enable cursor (unlock cursor)
extern void DisableCursor(void);                                   // Disable cursor (lock cursor)
extern bool IsCursorOnScreen(void);                                // Check if cursor is on the screen

// Drawing-related functions
extern void ClearBackground(Color color);                          // Clear background (framebuffer) to color
extern void BeginDrawing(void);                                    // Begin canvas (framebuffer) drawing
extern void EndDrawing(void);                                      // End canvas (framebuffer) drawing and swap buffers (double buffering)
extern void BeginMode2D(Camera2D camera);                          // Begin 2D mode with custom camera (2D)
extern void EndMode2D(void);                                       // End 2D mode with custom camera
extern void BeginMode3D(Camera3D camera);                          // Begin 3D mode with custom camera (3D)
extern void EndMode3D(void);                                       // End 3D mode and returns to default 2D orthographic mode
extern void BeginTextureMode(RenderTexture2D target);              // Begin drawing to render texture
extern void EndTextureMode(void);                                  // End drawing to render texture
extern void BeginShaderMode(Shader shader);                        // Begin custom shader drawing
extern void EndShaderMode(void);                                   // End custom shader drawing (use default shader)
extern void BeginBlendMode(int mode);                              // Begin blending mode (alpha, additive, multiplied, subtract, custom)
extern void EndBlendMode(void);                                    // End blending mode (reset to default: alpha blending)
extern void BeginScissorMode(int x, int y, int width, int height); // Begin scissor mode (define screen area for following drawing)
extern void EndScissorMode(void);                                  // End scissor mode
extern void BeginVrStereoMode(VrStereoConfig config);              // Begin stereo rendering (requires VR simulator)
extern void EndVrStereoMode(void);                                 // End stereo rendering (requires VR simulator)

// VR stereo config functions for VR simulator
extern VrStereoConfig LoadVrStereoConfig(VrDeviceInfo device);     // Load VR stereo config for VR simulator device parameters
extern void UnloadVrStereoConfig(VrStereoConfig config);           // Unload VR stereo config

// Shader management functions
// NOTE: Shader functionality is not available on OpenGL 1.1
extern Shader LoadShader(const char *vsFileName, const char *fsFileName);   // Load shader from files and bind default locations
extern Shader LoadShaderFromMemory(const char *vsCode, const char *fsCode); // Load shader from code strings and bind default locations
extern bool IsShaderValid(Shader shader);                                   // Check if shader is valid (loaded on GPU)
extern int GetShaderLocation(Shader shader, const char *uniformName);       // Get shader uniform location
extern int GetShaderLocationAttrib(Shader shader, const char *attribName);  // Get shader attribute location
extern void SetShaderValue(Shader shader, int locIndex, const void *value, int uniformType); // Set shader uniform value
extern void SetShaderValueV(Shader shader, int locIndex, const void *value, int uniformType, int count); // Set shader uniform value vector
extern void SetShaderValueMatrix(Shader shader, int locIndex, Matrix mat);  // Set shader uniform value (matrix 4x4)
extern void SetShaderValueTexture(Shader shader, int locIndex, Texture2D texture); // Set shader uniform value and bind the texture (sampler2d)
extern void UnloadShader(Shader shader);                                    // Unload shader from GPU memory (VRAM)

// Screen-space-related functions
extern Ray GetScreenToWorldRay(Vector2 position, Camera camera);         // Get a ray trace from screen position (i.e mouse)
extern Ray GetScreenToWorldRayEx(Vector2 position, Camera camera, int width, int height); // Get a ray trace from screen position (i.e mouse) in a viewport
extern Vector2 GetWorldToScreen(Vector3 position, Camera camera);        // Get screen space position for a 3d world space position
extern Vector2 GetWorldToScreenEx(Vector3 position, Camera camera, int width, int height); // Get sized screen space position for a 3d world space position
extern Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera);    // Get screen space position for a 2d camera world space position
extern Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera);    // Get world space position for a 2d camera screen space position
extern Matrix GetCameraMatrix(Camera camera);                            // Get camera transform matrix (view matrix)
extern Matrix GetCameraMatrix2D(Camera2D camera);                        // Get camera 2d transform matrix

// Timing-related functions
extern void SetTargetFPS(int fps);                       // Set target FPS (maximum)
extern float GetFrameTime(void);                         // Get time in seconds for last frame drawn (delta time)
extern double GetTime(void);                             // Get elapsed time in seconds since InitWindow()
extern int GetFPS(void);                                 // Get current FPS

// Custom frame control functions
// NOTE: Those functions are intended for advanced users that want full control over the frame processing
// By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timing + PollInputEvents()
// To avoid that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL
extern void SwapScreenBuffer(void);                      // Swap back buffer with front buffer (screen drawing)
extern void PollInputEvents(void);                       // Register all input events
extern void WaitTime(double seconds);                    // Wait for some time (halt program execution)

// Random values generation functions
extern void SetRandomSeed(unsigned int seed);            // Set the seed for the random number generator
extern int GetRandomValue(int min, int max);             // Get a random value between min and max (both included)
extern int *LoadRandomSequence(unsigned int count, int min, int max); // Load random values sequence, no values repeated
extern void UnloadRandomSequence(int *sequence);         // Unload random values sequence

// Misc. functions
extern void TakeScreenshot(const char *fileName);                // Takes a screenshot of current screen (filename extension defines format)
extern void SetConfigFlags(unsigned int flags);                  // Set init configuration flags (view FLAGS)
extern void OpenURL(const char *url);                            // Open URL with default system browser (if available)

// Logging system
extern void SetTraceLogLevel(int logLevel);                      // Set the current threshold (minimum) log level
extern void TraceLog(int logLevel, const char *text, ...);       // Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)
extern void SetTraceLogCallback(TraceLogCallback callback);      // Set custom trace log

// Memory management, using internal allocators
extern void *MemAlloc(unsigned int size);                        // Internal memory allocator
extern void *MemRealloc(void *ptr, unsigned int size);           // Internal memory reallocator
extern void MemFree(void *ptr);                                  // Internal memory free

// File system management functions
extern unsigned char *LoadFileData(const char *fileName, int *dataSize); // Load file data as byte array (read)
extern void UnloadFileData(unsigned char *data);                     // Unload file data allocated by LoadFileData()
extern bool SaveFileData(const char *fileName, const void *data, int dataSize); // Save data to file from byte array (write), returns true on success
extern bool ExportDataAsCode(const unsigned char *data, int dataSize, const char *fileName); // Export data to code (.h), returns true on success
extern char *LoadFileText(const char *fileName);                     // Load text data from file (read), returns a '\0' terminated string
extern void UnloadFileText(char *text);                              // Unload file text data allocated by LoadFileText()
extern bool SaveFileText(const char *fileName, const char *text);    // Save text data to file (write), string must be '\0' terminated, returns true on success

// File access custom callbacks
// WARNING: Callbacks setup is intended for advanced users
extern void SetLoadFileDataCallback(LoadFileDataCallback callback);  // Set custom file binary data loader
extern void SetSaveFileDataCallback(SaveFileDataCallback callback);  // Set custom file binary data saver
extern void SetLoadFileTextCallback(LoadFileTextCallback callback);  // Set custom file text data loader
extern void SetSaveFileTextCallback(SaveFileTextCallback callback);  // Set custom file text data saver

extern int FileRename(const char *fileName, const char *fileRename); // Rename file (if exists), returns 0 on success
extern int FileRemove(const char *fileName);                         // Remove file (if exists), returns 0 on success
extern int FileCopy(const char *srcPath, const char *dstPath);       // Copy file from one path to another, dstPath created if it doesn't exist, returns 0 on success
extern int FileMove(const char *srcPath, const char *dstPath);       // Move file from one directory to another, dstPath created if it doesn't exist, returns 0 on success
extern int FileTextReplace(const char *fileName, const char *search, const char *replacement); // Replace text in an existing file, returns 0 on success
extern int FileTextFindIndex(const char *fileName, const char *search); // Find text in existing file, returns -1 if index not found or index otherwise
extern bool FileExists(const char *fileName);                        // Check if file exists
extern bool DirectoryExists(const char *dirPath);                    // Check if directory path exists
extern bool IsFileExtension(const char *fileName, const char *ext);  // Check file extension (recommended include point: .png, .wav)
extern bool IsFileHidden(const char *filePath);                      // Check if file path (file or directory) is hidden by OS
extern int GetFileLength(const char *fileName);                      // Get file length in bytes (NOTE: GetFileSize() conflicts with windows.h)
extern long GetFileModTime(const char *fileName);                    // Get file modification time (last write time)
extern const char *GetFileExtension(const char *fileName);           // Get pointer to extension for a filename string (includes dot: '.png')
extern const char *GetFileName(const char *filePath);                // Get pointer to filename for a path string
extern const char *GetFileNameWithoutExt(const char *filePath);      // Get filename string without extension (uses static string)
extern const char *GetDirectoryPath(const char *filePath);           // Get full path for a provided fileName with path (uses static string)
extern const char *GetPrevDirectoryPath(const char *dirPath);        // Get previous directory path for a provided path (uses static string)
extern const char *GetWorkingDirectory(void);                        // Get current working directory (uses static string)
extern const char *GetApplicationDirectory(void);                    // Get the directory of the running application (uses static string)
extern int MakeDirectory(const char *dirPath);                       // Create directories (including full path requested), returns 0 on success
extern int ChangeDirectory(const char *dirPath);                     // Change working directory, returns 0 on success
extern bool IsPathFile(const char *path);                            // Check if provided path points to a file
extern bool IsPathDirectory(const char *path);                       // Check if provided path points to a directory
extern bool IsPathAbsolute(const char *path);                        // Check if provided path is an absolute path
extern bool IsFileNameValid(const char *fileName);                   // Check if fileName is valid for the platform/OS
extern FilePathList LoadDirectoryFiles(const char *dirPath);         // Load directory filepaths, files and directories, no subdirs scan
extern FilePathList LoadDirectoryFilesEx(const char *basePath, const char *filter, bool scanSubdirs); // Load directory filepaths with extension filtering and subdir scan; some filters available: '*.*','FILES*','DIRS*'
extern void UnloadDirectoryFiles(FilePathList files);                // Unload filepaths
extern bool IsFileDropped(void);                                     // Check if file has been dropped into window
extern FilePathList LoadDroppedFiles(void);                          // Load dropped filepaths
extern void UnloadDroppedFiles(FilePathList files);                  // Unload dropped filepaths
extern unsigned int GetDirectoryFileCount(const char *dirPath);      // Get the file count in a directory
extern unsigned int GetDirectoryFileCountEx(const char *basePath, const char *filter, bool scanSubdirs); // Get the file count in a directory with extension filtering and recursive directory scan. Use 'DIR' in the filter string to include directories in the result

// Compression/Encoding functionality
extern unsigned char *CompressData(const unsigned char *data, int dataSize, int *compDataSize);        // Compress data (DEFLATE algorithm), memory must be MemFree()
extern unsigned char *DecompressData(const unsigned char *compData, int compDataSize, int *dataSize);  // Decompress data (DEFLATE algorithm), memory must be MemFree()
extern char *EncodeDataBase64(const unsigned char *data, int dataSize, int *outputSize);               // Encode data to Base64 string (includes NULL terminator), memory must be MemFree()
extern unsigned char *DecodeDataBase64(const char *text, int *outputSize);                             // Decode Base64 string (expected NULL terminated), memory must be MemFree()
extern unsigned int ComputeCRC32(const unsigned char *data, int dataSize); // Compute CRC32 hash code
extern unsigned int *ComputeMD5(const unsigned char *data, int dataSize);  // Compute MD5 hash code, returns static int[4] (16 bytes)
extern unsigned int *ComputeSHA1(const unsigned char *data, int dataSize); // Compute SHA1 hash code, returns static int[5] (20 bytes)
extern unsigned int *ComputeSHA256(const unsigned char *data, int dataSize); // Compute SHA256 hash code, returns static int[8] (32 bytes)

// Automation events functionality
extern AutomationEventList LoadAutomationEventList(const char *fileName); // Load automation events list from file, NULL for empty list, capacity = MAX_AUTOMATION_EVENTS
extern void UnloadAutomationEventList(AutomationEventList list);   // Unload automation events list from file
extern bool ExportAutomationEventList(AutomationEventList list, const char *fileName); // Export automation events list as text file
extern void SetAutomationEventList(AutomationEventList *list);     // Set automation event list to record to
extern void SetAutomationEventBaseFrame(int frame);                // Set automation event internal base frame to start recording
extern void StartAutomationEventRecording(void);                   // Start recording automation events (AutomationEventList must be set)
extern void StopAutomationEventRecording(void);                    // Stop recording automation events
extern void PlayAutomationEvent(AutomationEvent event);            // Play a recorded automation event

//------------------------------------------------------------------------------------
// Input Handling Functions (Module: core)
//------------------------------------------------------------------------------------

// Input-related functions: keyboard
extern bool IsKeyPressed(int key);                             // Check if key has been pressed once
extern bool IsKeyPressedRepeat(int key);                       // Check if key has been pressed again
extern bool IsKeyDown(int key);                                // Check if key is being pressed
extern bool IsKeyReleased(int key);                            // Check if key has been released once
extern bool IsKeyUp(int key);                                  // Check if key is NOT being pressed
extern int GetKeyPressed(void);                                // Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
extern int GetCharPressed(void);                               // Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
extern const char *GetKeyName(int key);                        // Get name of a QWERTY key on the current keyboard layout (eg returns string 'q' for KEY_A on an AZERTY keyboard)
extern void SetExitKey(int key);                               // Set a custom key to exit program (default is ESC)

// Input-related functions: gamepads
extern bool IsGamepadAvailable(int gamepad);                   // Check if gamepad is available
extern const char *GetGamepadName(int gamepad);                // Get gamepad internal name id
extern bool IsGamepadButtonPressed(int gamepad, int button);   // Check if gamepad button has been pressed once
extern bool IsGamepadButtonDown(int gamepad, int button);      // Check if gamepad button is being pressed
extern bool IsGamepadButtonReleased(int gamepad, int button);  // Check if gamepad button has been released once
extern bool IsGamepadButtonUp(int gamepad, int button);        // Check if gamepad button is NOT being pressed
extern int GetGamepadButtonPressed(void);                      // Get the last gamepad button pressed
extern int GetGamepadAxisCount(int gamepad);                   // Get axis count for a gamepad
extern float GetGamepadAxisMovement(int gamepad, int axis);    // Get movement value for a gamepad axis
extern int SetGamepadMappings(const char *mappings);           // Set internal gamepad mappings (SDL_GameControllerDB)
extern void SetGamepadVibration(int gamepad, float leftMotor, float rightMotor, float duration); // Set gamepad vibration for both motors (duration in seconds)

// Input-related functions: mouse
extern bool IsMouseButtonPressed(int button);                  // Check if mouse button has been pressed once
extern bool IsMouseButtonDown(int button);                     // Check if mouse button is being pressed
extern bool IsMouseButtonReleased(int button);                 // Check if mouse button has been released once
extern bool IsMouseButtonUp(int button);                       // Check if mouse button is NOT being pressed
extern int GetMouseX(void);                                    // Get mouse position X
extern int GetMouseY(void);                                    // Get mouse position Y
extern Vector2 GetMousePosition(void);                         // Get mouse position XY
extern Vector2 GetMouseDelta(void);                            // Get mouse delta between frames
extern void SetMousePosition(int x, int y);                    // Set mouse position XY
extern void SetMouseOffset(int offsetX, int offsetY);          // Set mouse offset
extern void SetMouseScale(float scaleX, float scaleY);         // Set mouse scaling
extern float GetMouseWheelMove(void);                          // Get mouse wheel movement for X or Y, whichever is larger
extern Vector2 GetMouseWheelMoveV(void);                       // Get mouse wheel movement for both X and Y
extern void SetMouseCursor(int cursor);                        // Set mouse cursor

// Input-related functions: touch
extern int GetTouchX(void);                                    // Get touch position X for touch point 0 (relative to screen size)
extern int GetTouchY(void);                                    // Get touch position Y for touch point 0 (relative to screen size)
extern Vector2 GetTouchPosition(int index);                    // Get touch position XY for a touch point index (relative to screen size)
extern int GetTouchPointId(int index);                         // Get touch point identifier for provided index
extern int GetTouchPointCount(void);                           // Get number of touch points

//------------------------------------------------------------------------------------
// Gestures and Touch Handling Functions (Module: rgestures)
//------------------------------------------------------------------------------------
extern void SetGesturesEnabled(unsigned int flags);            // Enable a set of gestures using flags
extern bool IsGestureDetected(unsigned int gesture);           // Check if gesture has been detected
extern int GetGestureDetected(void);                           // Get latest detected gesture
extern float GetGestureHoldDuration(void);                     // Get gesture hold time in seconds
extern Vector2 GetGestureDragVector(void);                     // Get gesture drag vector
extern float GetGestureDragAngle(void);                        // Get gesture drag angle
extern Vector2 GetGesturePinchVector(void);                    // Get gesture pinch delta
extern float GetGesturePinchAngle(void);                       // Get gesture pinch angle

//------------------------------------------------------------------------------------
// Camera System Functions (Module: rcamera)
//------------------------------------------------------------------------------------
extern void UpdateCamera(Camera *camera, int mode);            // Update camera position for selected mode
extern void UpdateCameraPro(Camera *camera, Vector3 movement, Vector3 rotation, float zoom); // Update camera movement/rotation

//------------------------------------------------------------------------------------
// Basic Shapes Drawing Functions (Module: shapes)
//------------------------------------------------------------------------------------
// Set texture and rectangle to be used on shapes drawing
// NOTE: It can be useful when using basic shapes and one single font,
// defining a font char white rectangle would allow drawing everything in a single draw call
extern void SetShapesTexture(Texture2D texture, Rectangle rec); // Set texture and rectangle to be used on shapes drawing
extern Texture2D GetShapesTexture(void);                 // Get texture that is used for shapes drawing
extern Rectangle GetShapesTextureRectangle(void);        // Get texture source rectangle that is used for shapes drawing

// Basic shapes drawing functions
extern void DrawPixel(int posX, int posY, Color color);                                                   // Draw a pixel using geometry [Can be slow, use with care]
extern void DrawPixelV(Vector2 position, Color color);                                                    // Draw a pixel using geometry (Vector version) [Can be slow, use with care]
extern void DrawLine(int startPosX, int startPosY, int endPosX, int endPosY, Color color);                // Draw a line
extern void DrawLineV(Vector2 startPos, Vector2 endPos, Color color);                                     // Draw a line (using gl lines)
extern void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color);                       // Draw a line (using triangles/quads)
extern void DrawLineStrip(const Vector2 *points, int pointCount, Color color);                            // Draw lines sequence (using gl lines)
extern void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color);                   // Draw line segment cubic-bezier in-out interpolation
extern void DrawLineDashed(Vector2 startPos, Vector2 endPos, int dashSize, int spaceSize, Color color);   // Draw a dashed line
extern void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);                                // Draw a color-filled triangle, counter-clockwise vertex order
extern void DrawTriangleGradient(Vector2 v1, Vector2 v2, Vector2 v3, Color c1, Color c2, Color c3);       // Draw triangle with interpolated colors, counter-clockwise vertex/color order
extern void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);                           // Draw triangle outline, counter-clockwise vertex order
extern void DrawTriangleLinesEx(Vector2 v1, Vector2 v2, Vector2 v3, float thick, Color color);            // Draw triangle outline with line thickness, counter-clockwise vertex order
extern void DrawTriangleFan(const Vector2 *points, int pointCount, Color color);                          // Draw a triangle fan defined by points (first vertex is the center)
extern void DrawTriangleStrip(const Vector2 *points, int pointCount, Color color);                        // Draw a triangle strip defined by points
extern void DrawRectangle(int posX, int posY, int width, int height, Color color);                        // Draw a color-filled rectangle
extern void DrawRectangleV(Vector2 position, Vector2 size, Color color);                                  // Draw a color-filled rectangle (Vector version)
extern void DrawRectangleRec(Rectangle rec, Color color);                                                 // Draw a color-filled rectangle
extern void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color);                 // Draw a color-filled rectangle with pro parameters
extern void DrawRectangleGradientV(int posX, int posY, int width, int height, Color top, Color bottom);   // Draw a vertical-gradient-filled rectangle
extern void DrawRectangleGradientH(int posX, int posY, int width, int height, Color left, Color right);   // Draw a horizontal-gradient-filled rectangle
extern void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4);       // Draw a gradient-filled rectangle with custom vertex colors, counter-clockwise color order
extern void DrawRectangleLines(int posX, int posY, int width, int height, Color color);                   // Draw rectangle outline
extern void DrawRectangleLinesEx(Rectangle rec, float thick, Color color);                                // Draw rectangle outline with line thickness
extern void DrawRectangleRounded(Rectangle rec, float roundness, int segments, Color color);              // Draw rectangle with rounded edges
extern void DrawRectangleRoundedLines(Rectangle rec, float roundness, int segments, Color color);         // Draw rectangle lines with rounded edges
extern void DrawRectangleRoundedLinesEx(Rectangle rec, float roundness, int segments, float thick, Color color); // Draw rectangle lines with rounded edges outline and line thickness
extern void DrawPoly(Vector2 center, int sides, float radius, float rotation, Color color);               // Draw a polygon of n sides
extern void DrawPolyLines(Vector2 center, int sides, float radius, float rotation, Color color);          // Draw a polygon outline of n sides
extern void DrawPolyLinesEx(Vector2 center, int sides, float radius, float rotation, float thick, Color color); // Draw a polygon outline of n sides with line thickness
extern void DrawCircle(int centerX, int centerY, float radius, Color color);                              // Draw a color-filled circle
extern void DrawCircleV(Vector2 center, float radius, Color color);                                       // Draw a color-filled circle (Vector version)
extern void DrawCircleGradient(Vector2 center, float radius, Color inner, Color outer);                   // Draw a gradient-filled circle
extern void DrawCircleSector(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color); // Draw a piece of a circle
extern void DrawCircleSectorLines(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color); // Draw circle sector outline
extern void DrawCircleSectorLinesEx(Vector2 center, float radius, float startAngle, float endAngle, int segments, float thick, Color color); // Draw circle sector outline with thickness
extern void DrawCircleLines(int centerX, int centerY, float radius, Color color);                         // Draw circle outline
extern void DrawCircleLinesV(Vector2 center, float radius, Color color);                                  // Draw circle outline (Vector version)
extern void DrawCircleLinesEx(Vector2 center, float radius, float thick, Color color);                    // Draw circle outline with line thickness
extern void DrawEllipse(int centerX, int centerY, float radiusH, float radiusV, Color color);             // Draw ellipse
extern void DrawEllipseV(Vector2 center, float radiusH, float radiusV, Color color);                      // Draw ellipse (Vector version)
extern void DrawEllipseLines(int centerX, int centerY, float radiusH, float radiusV, Color color);        // Draw ellipse outline
extern void DrawEllipseLinesV(Vector2 center, float radiusH, float radiusV, Color color);                 // Draw ellipse outline (Vector version)
extern void DrawEllipseLinesEx(Vector2 center, float radiusH, float radiusV, float thick, Color color);   // Draw ellipse outline with line thickness
extern void DrawRing(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color); // Draw ring
extern void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color); // Draw ring outline
extern void DrawRingLinesEx(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, float thick, Color color); // Draw ring outline with line thickness

// Splines drawing functions
extern void DrawSplineLinear(const Vector2 *points, int pointCount, float thick, Color color);            // Draw spline: Linear, minimum 2 points
extern void DrawSplineBasis(const Vector2 *points, int pointCount, float thick, Color color);             // Draw spline: B-Spline, minimum 4 points
extern void DrawSplineCatmullRom(const Vector2 *points, int pointCount, float thick, Color color);        // Draw spline: Catmull-Rom, minimum 4 points
extern void DrawSplineBezierQuadratic(const Vector2 *points, int pointCount, float thick, Color color);   // Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]
extern void DrawSplineBezierCubic(const Vector2 *points, int pointCount, float thick, Color color);       // Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]
extern void DrawSplineSegmentLinear(Vector2 p1, Vector2 p2, float thick, Color color);                    // Draw spline segment: Linear, 2 points
extern void DrawSplineSegmentBasis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color); // Draw spline segment: B-Spline, 4 points
extern void DrawSplineSegmentCatmullRom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color); // Draw spline segment: Catmull-Rom, 4 points
extern void DrawSplineSegmentBezierQuadratic(Vector2 p1, Vector2 c2, Vector2 p3, float thick, Color color); // Draw spline segment: Quadratic Bezier, 2 points, 1 control point
extern void DrawSplineSegmentBezierCubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float thick, Color color); // Draw spline segment: Cubic Bezier, 2 points, 2 control points

// Spline segment point evaluation functions, for a provided t [0.0f .. 1.0f]
extern Vector2 GetSplinePointLinear(Vector2 startPos, Vector2 endPos, float t);                           // Get (evaluate) spline point: Linear
extern Vector2 GetSplinePointBasis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t);              // Get (evaluate) spline point: B-Spline
extern Vector2 GetSplinePointCatmullRom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t);         // Get (evaluate) spline point: Catmull-Rom
extern Vector2 GetSplinePointBezierQuadratic(Vector2 p1, Vector2 c2, Vector2 p3, float t);                // Get (evaluate) spline point: Quadratic Bezier
extern Vector2 GetSplinePointBezierCubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float t);        // Get (evaluate) spline point: Cubic Bezier

// Basic shapes collision detection functions
extern bool CheckCollisionRecs(Rectangle rec1, Rectangle rec2);                                           // Check collision between two rectangles
extern bool CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2);        // Check collision between two circles
extern bool CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec);                         // Check collision between circle and rectangle
extern bool CheckCollisionCircleLine(Vector2 center, float radius, Vector2 p1, Vector2 p2);               // Check if circle collides with a line created between two points [p1] and [p2]
extern bool CheckCollisionPointRec(Vector2 point, Rectangle rec);                                         // Check if point is inside rectangle
extern bool CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius);                       // Check if point is inside circle
extern bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3);               // Check if point is inside a triangle
extern bool CheckCollisionPointLine(Vector2 point, Vector2 p1, Vector2 p2, int threshold);                // Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
extern bool CheckCollisionPointPoly(Vector2 point, const Vector2 *points, int pointCount);                // Check if point is within a polygon described by array of vertices
extern bool CheckCollisionLines(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2 *collisionPoint); // Check the collision between two lines defined by two points each, returns collision point by reference
extern Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2);                                         // Get collision rectangle for two rectangles collision

//------------------------------------------------------------------------------------
// Texture Loading and Drawing Functions (Module: textures)
//------------------------------------------------------------------------------------

// Image loading functions
// NOTE: These functions do not require GPU access
extern Image LoadImage(const char *fileName);                                                             // Load image from file into CPU memory (RAM)
extern Image LoadImageRaw(const char *fileName, int width, int height, int format, int headerSize);       // Load image from RAW file data
extern Image LoadImageAnim(const char *fileName, int *frames);                                            // Load image sequence from file (frames appended to image.data)
extern Image LoadImageAnimFromMemory(const char *fileType, const unsigned char *fileData, int dataSize, int *frames); // Load image sequence from memory buffer
extern Image LoadImageFromMemory(const char *fileType, const unsigned char *fileData, int dataSize);      // Load image from memory buffer, fileType refers to extension: i.e. '.png'
extern Image LoadImageFromTexture(Texture2D texture);                                                     // Load image from GPU texture data
extern Image LoadImageFromScreen(void);                                                                   // Load image from screen buffer (screenshot)
extern bool IsImageValid(Image image);                                                                    // Check if an image is valid (data and parameters)
extern void UnloadImage(Image image);                                                                     // Unload image from CPU memory (RAM)
extern bool ExportImage(Image image, const char *fileName);                                               // Export image data to file, returns true on success
extern unsigned char *ExportImageToMemory(Image image, const char *fileType, int *fileSize);              // Export image to memory buffer, memory must be MemFree()
extern bool ExportImageAsCode(Image image, const char *fileName);                                         // Export image as code file defining an array of bytes, returns true on success

// Image generation functions
extern Image GenImageColor(int width, int height, Color color);                                           // Generate image: plain color
extern Image GenImageGradientLinear(int width, int height, int direction, Color start, Color end);        // Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient
extern Image GenImageGradientRadial(int width, int height, float density, Color inner, Color outer);      // Generate image: radial gradient
extern Image GenImageGradientSquare(int width, int height, float density, Color inner, Color outer);      // Generate image: square gradient
extern Image GenImageChecked(int width, int height, int checksX, int checksY, Color col1, Color col2);    // Generate image: checked
extern Image GenImageWhiteNoise(int width, int height, float factor);                                     // Generate image: white noise
extern Image GenImagePerlinNoise(int width, int height, int offsetX, int offsetY, float scale);           // Generate image: perlin noise
extern Image GenImageCellular(int width, int height, int tileSize);                                       // Generate image: cellular algorithm, bigger tileSize means bigger cells
extern Image GenImageText(int width, int height, const char *text);                                       // Generate image: grayscale image from text data

// Image manipulation functions
extern Image ImageCopy(Image image);                                                                      // Create an image duplicate (useful for transformations)
extern Image ImageFromImage(Image image, Rectangle rec);                                                  // Create an image from another image piece
extern Image ImageFromChannel(Image image, int selectedChannel);                                          // Create an image from a selected channel of another image (GRAYSCALE)
extern Image ImageText(const char *text, int fontSize, Color color);                                      // Create an image from text (default font)
extern Image ImageTextEx(Font font, const char *text, float fontSize, float spacing, Color tint);         // Create an image from text (custom sprite font)
extern void ImageFormat(Image *image, int newFormat);                                                     // Convert image data to desired format
extern void ImageToPOT(Image *image, Color fill);                                                         // Convert image to POT (power-of-two)
extern void ImageCrop(Image *image, Rectangle crop);                                                      // Crop an image to a defined rectangle
extern void ImageAlphaCrop(Image *image, float threshold);                                                // Crop image depending on alpha value
extern void ImageAlphaClear(Image *image, Color color, float threshold);                                  // Clear alpha channel to desired color
extern void ImageAlphaMask(Image *image, Image alphaMask);                                                // Apply alpha mask to image
extern void ImageAlphaPremultiply(Image *image);                                                          // Premultiply alpha channel
extern void ImageBlurGaussian(Image *image, int blurSize);                                                // Apply Gaussian blur using a box blur approximation
extern void ImageKernelConvolution(Image *image, const float *kernel, int kernelSize);                    // Apply custom square convolution kernel to image
extern void ImageResize(Image *image, int newWidth, int newHeight);                                       // Resize image (Bicubic scaling algorithm)
extern void ImageResizeNN(Image *image, int newWidth, int newHeight);                                     // Resize image (Nearest-Neighbor scaling algorithm)
extern void ImageResizeCanvas(Image *image, int newWidth, int newHeight, int offsetX, int offsetY, Color fill); // Resize canvas and fill with color
extern void ImageMipmaps(Image *image);                                                                   // Compute all mipmap levels for a provided image
extern void ImageDither(Image *image, int rBpp, int gBpp, int bBpp, int aBpp);                            // Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
extern void ImageFlipVertical(Image *image);                                                              // Flip image vertically
extern void ImageFlipHorizontal(Image *image);                                                            // Flip image horizontally
extern void ImageRotate(Image *image, int degrees);                                                       // Rotate image by input angle in degrees (-359 to 359)
extern void ImageRotateCW(Image *image);                                                                  // Rotate image clockwise 90deg
extern void ImageRotateCCW(Image *image);                                                                 // Rotate image counter-clockwise 90deg
extern void ImageColorTint(Image *image, Color color);                                                    // Modify image color: tint
extern void ImageColorInvert(Image *image);                                                               // Modify image color: invert
extern void ImageColorGrayscale(Image *image);                                                            // Modify image color: grayscale
extern void ImageColorContrast(Image *image, int contrast);                                               // Modify image color: contrast (-100 to 100)
extern void ImageColorBrightness(Image *image, int brightness);                                           // Modify image color: brightness (-255 to 255)
extern void ImageColorReplace(Image *image, Color color, Color replace);                                  // Modify image color: replace color
extern Color *LoadImageColors(Image image);                                                               // Load color data from image as a Color array (RGBA - 32bit)
extern Color *LoadImagePalette(Image image, int maxPaletteSize, int *colorCount);                         // Load colors palette from image as a Color array (RGBA - 32bit)
extern void UnloadImageColors(Color *colors);                                                             // Unload color data loaded with LoadImageColors()
extern void UnloadImagePalette(Color *colors);                                                            // Unload colors palette loaded with LoadImagePalette()
extern Rectangle GetImageAlphaBorder(Image image, float threshold);                                       // Get image alpha border rectangle
extern Color GetImageColor(Image image, int x, int y);                                                    // Get image pixel color at (x, y) position

// Image drawing functions
// NOTE: Image software-rendering functions (CPU)
extern void ImageClearBackground(Image *dst, Color color);                                                // Clear image background with provided color
extern void ImageDrawPixel(Image *dst, int posX, int posY, Color color);                                  // Draw pixel within an image
extern void ImageDrawPixelV(Image *dst, Vector2 position, Color color);                                   // Draw pixel within an image (Vector version)
extern void ImageDrawLine(Image *dst, int startPosX, int startPosY, int endPosX, int endPosY, Color color); // Draw line within an image
extern void ImageDrawLineV(Image *dst, Vector2 start, Vector2 end, Color color);                          // Draw line within an image (Vector version)
extern void ImageDrawLineEx(Image *dst, Vector2 start, Vector2 end, int thick, Color color);              // Draw a line defining thickness within an image
extern void ImageDrawLineStrip(Image *dst, const Vector2 *points, int pointCount, Color color);           // Draw a lines sequence within an image
extern void ImageDrawTriangle(Image *dst, Vector2 v1, Vector2 v2, Vector2 v3, Color color);               // Draw triangle within an image
extern void ImageDrawTriangleGradient(Image *dst, Vector2 v1, Vector2 v2, Vector2 v3, Color c1, Color c2, Color c3); // Draw triangle with interpolated colors within an image
extern void ImageDrawTriangleLines(Image *dst, Vector2 v1, Vector2 v2, Vector2 v3, Color color);          // Draw triangle outline within an image
extern void ImageDrawTriangleFan(Image *dst, const Vector2 *points, int pointCount, Color color);         // Draw a triangle fan defined by points within an image (first vertex is the center)
extern void ImageDrawTriangleStrip(Image *dst, const Vector2 *points, int pointCount, Color color);       // Draw a triangle strip defined by points within an image
extern void ImageDrawRectangle(Image *dst, int posX, int posY, int width, int height, Color color);       // Draw rectangle within an image
extern void ImageDrawRectangleV(Image *dst, Vector2 position, Vector2 size, Color color);                 // Draw rectangle within an image (Vector version)
extern void ImageDrawRectangleRec(Image *dst, Rectangle rec, Color color);                                // Draw rectangle within an image
extern void ImageDrawRectanglePro(Image *dst, Rectangle rec, Vector2 origin, float rotation, Color color); // Draw a color-filled rectangle with pro parameters within and image
extern void ImageDrawRectangleLines(Image *dst, int posX, int posY, int width, int height, Color color);  // Draw rectangle lines within an image
extern void ImageDrawRectangleLinesEx(Image *dst, Rectangle rec, int thick, Color color);                 // Draw rectangle lines within an image with line thickness
extern void ImageDrawRectangleGradientEx(Image *dst, Rectangle rec, Color col1, Color col2, Color col3, Color col4); // Draw rectangle with gradient colors within an image, counter-clockwise color order
extern void ImageDrawCircle(Image *dst, int centerX, int centerY, int radius, Color color);               // Draw a filled circle within an image
extern void ImageDrawCircleV(Image *dst, Vector2 center, int radius, Color color);                        // Draw a filled circle within an image (Vector version)
extern void ImageDrawCircleLines(Image *dst, int centerX, int centerY, int radius, Color color);          // Draw circle outline within an image
extern void ImageDrawCircleLinesV(Image *dst, Vector2 center, int radius, Color color);                   // Draw circle outline within an image (Vector version)
extern void ImageDrawCircleGradient(Image *dst, Vector2 center, float radius, Color inner, Color outer);  // Draw a gradient-filled circle within an image

extern void ImageDrawImage(Image *dst, Image src, int posX, int posY, Color tint);                      // Draw an image within an image
extern void ImageDrawImageEx(Image *dst, Image src, Vector2 position, float rotation, float scale, Color tint); // Draw an image with scaling and rotation within an image
extern void ImageDrawImageRec(Image *dst, Image src, Rectangle srcRec, Vector2 position, Color tint);     // Draw a part of an image defined by a rectangle within an image
extern void ImageDrawImagePro(Image *dst, Image src, Rectangle srcRec, Rectangle dstRec, Vector2 origin, float rotation, Color tint); // Draw a part of an image defined by a rectangle into destination rectangle, with scaling and rotation, within an image
extern void ImageDrawText(Image *dst, const char *text, int posX, int posY, int fontSize, Color color);   // Draw text (using default font) within an image (destination)
extern void ImageDrawTextEx(Image *dst, Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint); // Draw text (custom sprite font) within an image (destination)
extern void ImageDrawTextPro(Image *dst, Font font, const char *text, Vector2 position, Vector2 origin, float rotation, float fontSize, float spacing, Color tint); // Draw text using Font and pro parameters (rotation)

// Texture loading functions
// NOTE: These functions require GPU access
extern Texture2D LoadTexture(const char *fileName);                                                       // Load texture from file into GPU memory (VRAM)
extern Texture2D LoadTextureFromImage(Image image);                                                       // Load texture from image data
extern TextureCubemap LoadTextureCubemap(Image image, int layout);                                        // Load cubemap from image, multiple image cubemap layouts supported
extern RenderTexture2D LoadRenderTexture(int width, int height);                                          // Load texture for rendering (framebuffer)
extern RenderTexture2D LoadRenderTextureEx(int width, int height, int format);                            // Load texture for rendering (framebuffer), with specific format
extern bool IsTextureValid(Texture2D texture);                                                            // Check if texture is valid (loaded in GPU)
extern void UnloadTexture(Texture2D texture);                                                             // Unload texture from GPU memory (VRAM)
extern bool IsRenderTextureValid(RenderTexture2D target);                                                 // Check if render texture is valid (loaded in GPU)
extern void UnloadRenderTexture(RenderTexture2D target);                                                  // Unload render texture from GPU memory (VRAM)
extern void UpdateTexture(Texture2D texture, const void *pixels);                                         // Update GPU texture with new data (pixels should be able to fill texture)
extern void UpdateTextureRec(Texture2D texture, Rectangle rec, const void *pixels);                       // Update GPU texture rectangle with new data (pixels and rec should fit in texture)

// Texture configuration functions
extern void GenTextureMipmaps(Texture2D *texture);                                                        // Generate GPU mipmaps for a texture
extern void SetTextureFilter(Texture2D texture, int filter);                                              // Set texture scaling filter mode
extern void SetTextureWrap(Texture2D texture, int wrap);                                                  // Set texture wrapping mode

// Texture drawing functions
extern void DrawTexture(Texture2D texture, int posX, int posY, Color tint);                               // Draw a Texture2D
extern void DrawTextureV(Texture2D texture, Vector2 position, Color tint);                                // Draw a Texture2D with position defined as Vector2
extern void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint);  // Draw a Texture2D with rotation and scale
extern void DrawTextureRec(Texture2D texture, Rectangle rec, Vector2 position, Color tint);               // Draw a part of a texture defined by a rectangle
extern void DrawTexturePro(Texture2D texture, Rectangle srcrec, Rectangle dstrec, Vector2 origin, float rotation, Color tint); // Draw a part of a texture defined by a source rectangle to destination rectangle, with scaling and rotation
extern void DrawTextureNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle dstrec, Vector2 origin, float rotation, Color tint); // Draw a texture (or part of it) that stretches or shrinks nicely

// Color/pixel related functions
extern bool ColorIsEqual(Color col1, Color col2);                            // Check if two colors are equal
extern Color Fade(Color color, float alpha);                                 // Get color with alpha applied, alpha goes from 0.0f to 1.0f
extern int ColorToInt(Color color);                                          // Get hexadecimal value for a Color (0xRRGGBBAA)
extern Vector4 ColorNormalize(Color color);                                  // Get Color normalized as float [0..1]
extern Color ColorFromNormalized(Vector4 normalized);                        // Get Color from normalized values [0..1]
extern Vector3 ColorToHSV(Color color);                                      // Get HSV values for a Color, hue [0..360], saturation/value [0..1]
extern Color ColorFromHSV(float hue, float saturation, float value);         // Get a Color from HSV values, hue [0..360], saturation/value [0..1]
extern Color ColorTint(Color color, Color tint);                             // Get color multiplied with another color
extern Color ColorBrightness(Color color, float factor);                     // Get color with brightness correction, brightness factor goes from -1.0f to 1.0f
extern Color ColorContrast(Color color, float contrast);                     // Get color with contrast correction, contrast values between -1.0f and 1.0f
extern Color ColorAlpha(Color color, float alpha);                           // Get color with alpha applied, alpha goes from 0.0f to 1.0f
extern Color ColorAlphaBlend(Color dst, Color src, Color tint);              // Get src alpha-blended into dst color with tint
extern Color ColorLerp(Color color1, Color color2, float factor);            // Get color lerp interpolation between two colors, factor [0.0f..1.0f]
extern Color GetColor(unsigned int hexValue);                                // Get Color structure from hexadecimal value
extern Color GetPixelColor(const void *srcPtr, int format);                  // Get Color from a source pixel pointer of certain format
extern void SetPixelColor(void *dstPtr, Color color, int format);            // Set color formatted into destination pixel pointer
extern int GetPixelDataSize(int width, int height, int format);              // Get pixel data size in bytes for certain format

//------------------------------------------------------------------------------------
// Font Loading and Text Drawing Functions (Module: text)
//------------------------------------------------------------------------------------

// Font loading/unloading functions
extern Font GetFontDefault(void);                                                            // Get the default Font
extern Font LoadFont(const char *fileName);                                                  // Load font from file into GPU memory (VRAM)
extern Font LoadFontEx(const char *fileName, int fontSize, const int *codepoints, int codepointCount); // Load font from file with defined codepoints and generation size, use NULL for codepoints and 0 for codepointCount to load the default character set, font size is provided in pixels height
extern Font LoadFontFromImage(Image image, Color key, int firstChar);                        // Load font from Image (XNA style)
extern Font LoadFontFromMemory(const char *fileType, const unsigned char *fileData, int dataSize, int fontSize, const int *codepoints, int codepointCount); // Load font from memory buffer, fileType refers to extension: i.e. '.ttf'
extern bool IsFontValid(Font font);                                                          // Check if font is valid (font data loaded, WARNING: GPU texture not checked)
extern GlyphInfo *LoadFontData(const unsigned char *fileData, int dataSize, int fontSize, const int *codepoints, int codepointCount, int type, int *glyphCount); // Load font data for further use
extern Image GenImageFontAtlas(const GlyphInfo *glyphs, Rectangle **glyphRecs, int glyphCount, int fontSize, int padding, int packMethod); // Generate image font atlas using chars info
extern void UnloadFontData(GlyphInfo *glyphs, int glyphCount);                               // Unload font chars info data (RAM)
extern void UnloadFont(Font font);                                                           // Unload font from GPU memory (VRAM)
extern bool ExportFontAsCode(Font font, const char *fileName);                               // Export font as code file, returns true on success

// Text drawing functions
extern void DrawFPS(int posX, int posY);                                                     // Draw current FPS
extern void DrawText(const char *text, int posX, int posY, int fontSize, Color color);       // Draw text (using default font)
extern void DrawTextEx(Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint); // Draw text using font and additional parameters
extern void DrawTextPro(Font font, const char *text, Vector2 position, Vector2 origin, float rotation, float fontSize, float spacing, Color tint); // Draw text using Font and pro parameters (rotation)
extern void DrawTextCodepoint(Font font, int codepoint, Vector2 position, float fontSize, Color tint); // Draw one character (codepoint)
extern void DrawTextCodepoints(Font font, const int *codepoints, int codepointCount, Vector2 position, float fontSize, float spacing, Color tint); // Draw multiple characters (codepoint)

// Text font info functions
extern void SetTextLineSpacing(int spacing);                                                 // Set vertical line spacing when drawing with line-breaks
extern int MeasureText(const char *text, int fontSize);                                      // Measure string width for default font
extern Vector2 MeasureTextEx(Font font, const char *text, float fontSize, float spacing);    // Measure string size for Font
extern Vector2 MeasureTextCodepoints(Font font, const int *codepoints, int length, float fontSize, float spacing); // Measure string size for an existing array of codepoints for Font
extern int GetGlyphIndex(Font font, int codepoint);                                          // Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found
extern GlyphInfo GetGlyphInfo(Font font, int codepoint);                                     // Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
extern Rectangle GetGlyphAtlasRec(Font font, int codepoint);                                 // Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found

// Text codepoints management functions (unicode characters)
extern char *LoadUTF8(const int *codepoints, int length);                                    // Load UTF-8 text encoded from codepoints array
extern void UnloadUTF8(char *text);                                                          // Unload UTF-8 text encoded from codepoints array
extern int *LoadCodepoints(const char *text, int *count);                                    // Load all codepoints from a UTF-8 text string, codepoints count returned by parameter
extern void UnloadCodepoints(int *codepoints);                                               // Unload codepoints data from memory
extern int GetCodepointCount(const char *text);                                              // Get total number of codepoints in a UTF-8 encoded string
extern int GetCodepoint(const char *text, int *codepointSize);                               // Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
extern int GetCodepointNext(const char *text, int *codepointSize);                           // Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
extern int GetCodepointPrevious(const char *text, int *codepointSize);                       // Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
extern const char *CodepointToUTF8(int codepoint, int *utf8Size);                            // Encode one codepoint into UTF-8 byte array (array length returned as parameter)

// Text strings management functions (no UTF-8 strings, only byte chars)
// WARNING 1: Most of these functions use internal static buffers[], it's recommended to store returned data on user-side for re-use
// WARNING 2: Some functions allocate memory internally for the returned strings, those strings must be freed by user using MemFree()
extern char **LoadTextLines(const char *text, int *count);                                   // Load text as separate lines ('\n')
extern void UnloadTextLines(char **text, int lineCount);                                     // Unload text lines
extern int TextCopy(char *dst, const char *src);                                             // Copy one string to another, returns bytes copied
extern bool TextIsEqual(const char *text1, const char *text2);                               // Check if two text strings are equal
extern unsigned int TextLength(const char *text);                                            // Get text length, checks for '\0' ending
extern const char *TextFormat(const char *text, ...);                                        // Text formatting with variables (sprintf() style)
extern const char *TextSubtext(const char *text, int position, int length);                  // Get a piece of a text string
extern const char *TextRemoveSpaces(const char *text);                                       // Remove text spaces, concat words
extern char *GetTextBetween(const char *text, const char *begin, const char *end);           // Get text between two strings
extern char *TextReplace(const char *text, const char *search, const char *replacement);     // Replace text string with new string
extern char *TextReplaceAlloc(const char *text, const char *search, const char *replacement); // Replace text string with new string, memory must be MemFree()
extern char *TextReplaceBetween(const char *text, const char *begin, const char *end, const char *replacement); // Replace text between two specific strings
extern char *TextReplaceBetweenAlloc(const char *text, const char *begin, const char *end, const char *replacement); // Replace text between two specific strings, memory must be MemFree()
extern char *TextInsert(const char *text, const char *insert, int position);                 // Insert text in a defined byte position
extern char *TextInsertAlloc(const char *text, const char *insert, int position);            // Insert text in a defined byte position, memory must be MemFree()
extern char *TextJoin(char **textList, int count, const char *delimiter);                    // Join text strings with delimiter
extern char **TextSplit(const char *text, char delimiter, int *count);                       // Split text into multiple strings, using MAX_TEXTSPLIT_COUNT static strings
extern void TextAppend(char *text, const char *append, int *position);                       // Append text at specific position and move cursor
extern int TextFindIndex(const char *text, const char *search);                              // Find first text occurrence within a string, -1 if not found
extern char *TextToUpper(const char *text);                                                  // Get upper case version of provided string
extern char *TextToLower(const char *text);                                                  // Get lower case version of provided string
extern char *TextToPascal(const char *text);                                                 // Get Pascal case notation version of provided string
extern char *TextToSnake(const char *text);                                                  // Get Snake case notation version of provided string
extern char *TextToCamel(const char *text);                                                  // Get Camel case notation version of provided string
extern int TextToInteger(const char *text);                                                  // Get integer value from text
extern float TextToFloat(const char *text);                                                  // Get float value from text

//------------------------------------------------------------------------------------
// Basic 3d Shapes Drawing Functions (Module: models)
//------------------------------------------------------------------------------------

// Basic geometric 3D shapes drawing functions
extern void DrawLine3D(Vector3 startPos, Vector3 endPos, Color color);                                    // Draw a line in 3D world space
extern void DrawPoint3D(Vector3 position, Color color);                                                   // Draw a point in 3D space, actually a small line
extern void DrawCircle3D(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color); // Draw a circle in 3D world space
extern void DrawTriangle3D(Vector3 v1, Vector3 v2, Vector3 v3, Color color);                              // Draw a color-filled triangle, counter-clockwise vertex order
extern void DrawTriangleStrip3D(const Vector3 *points, int pointCount, Color color);                      // Draw a triangle strip defined by points
extern void DrawCube(Vector3 position, float width, float height, float length, Color color);             // Draw cube
extern void DrawCubeV(Vector3 position, Vector3 size, Color color);                                       // Draw cube (Vector version)
extern void DrawCubeWires(Vector3 position, float width, float height, float length, Color color);        // Draw cube wires
extern void DrawCubeWiresV(Vector3 position, Vector3 size, Color color);                                  // Draw cube wires (Vector version)
extern void DrawSphere(Vector3 centerPos, float radius, Color color);                                     // Draw sphere
extern void DrawSphereEx(Vector3 centerPos, float radius, int rings, int slices, Color color);            // Draw sphere with defined rings and slices
extern void DrawSphereWires(Vector3 centerPos, float radius, int rings, int slices, Color color);         // Draw sphere wires
extern void DrawCylinder(Vector3 position, float radiusTop, float radiusBottom, float height, int sides, Color color); // Draw a cylinder/cone
extern void DrawCylinderEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color); // Draw a cylinder with base at startPos and top at endPos
extern void DrawCylinderWires(Vector3 position, float radiusTop, float radiusBottom, float height, int sides, Color color); // Draw a cylinder/cone wires
extern void DrawCylinderWiresEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color); // Draw a cylinder wires with base at startPos and top at endPos
extern void DrawCapsule(Vector3 startPos, Vector3 endPos, float radius, int rings, int slices, Color color); // Draw a capsule with the center of its sphere caps at startPos and endPos
extern void DrawCapsuleWires(Vector3 startPos, Vector3 endPos, float radius, int rings, int slices, Color color); // Draw capsule wireframe with the center of its sphere caps at startPos and endPos
extern void DrawPlane(Vector3 centerPos, Vector2 size, Color color);                                      // Draw a plane XZ
extern void DrawRay(Ray ray, Color color);                                                                // Draw a ray line
extern void DrawGrid(int slices, float spacing);                                                          // Draw a grid (centered at (0, 0, 0))

//------------------------------------------------------------------------------------
// Model 3d Loading and Drawing Functions (Module: models)
//------------------------------------------------------------------------------------

// Model management functions
extern Model LoadModel(const char *fileName);                                                // Load model from files (meshes and materials)
extern Model LoadModelFromMesh(Mesh mesh);                                                   // Load model from generated mesh (default material)
extern bool IsModelValid(Model model);                                                       // Check if model is valid (loaded in GPU, VAO/VBOs)
extern void UnloadModel(Model model);                                                        // Unload model (including meshes) from memory (RAM and/or VRAM)
extern BoundingBox GetModelBoundingBox(Model model);                                         // Compute model bounding box limits (considers all meshes)

// Model drawing functions
extern void DrawModel(Model model, Vector3 position, float scale, Color tint);               // Draw a model (with texture if set)
extern void DrawModelEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint); // Draw a model with custom transform
extern void DrawModelWires(Model model, Vector3 position, float scale, Color tint);          // Draw a model wires (with texture if set)
extern void DrawModelWiresEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint); // Draw a model wires with custom transform
extern void DrawBoundingBox(BoundingBox box, Color color);                                   // Draw bounding box (wires)
extern void DrawBillboard(Camera camera, Texture2D texture, Vector3 position, float scale, Color tint); // Draw a billboard texture
extern void DrawBillboardRec(Camera camera, Texture2D texture, Rectangle rec, Vector3 position, Vector2 size, Color tint); // Draw a billboard texture defined by rectangle
extern void DrawBillboardPro(Camera camera, Texture2D texture, Rectangle rec, Vector3 position, Vector3 up, Vector2 size, Vector2 origin, float rotation, Color tint); // Draw a billboard texture defined by source rectangle with scaling and rotation

// Mesh management functions
extern void UploadMesh(Mesh *mesh, bool dynamic);                                            // Upload mesh vertex data in GPU and provide VAO/VBO ids
extern void UpdateMeshBuffer(Mesh mesh, int index, const void *data, int dataSize, int offset); // Update mesh vertex data in GPU for a specific buffer index
extern void UnloadMesh(Mesh mesh);                                                           // Unload mesh data from CPU and GPU
extern void DrawMesh(Mesh mesh, Material material, Matrix transform);                        // Draw a 3d mesh with material and transform
extern void DrawMeshInstanced(Mesh mesh, Material material, const Matrix *transforms, int instances); // Draw multiple mesh instances with material and different transforms
extern BoundingBox GetMeshBoundingBox(Mesh mesh);                                            // Compute mesh bounding box limits
extern void GenMeshTangents(Mesh *mesh);                                                     // Compute mesh tangents
extern bool ExportMesh(Mesh mesh, const char *fileName);                                     // Export mesh data to file, returns true on success
extern bool ExportMeshAsCode(Mesh mesh, const char *fileName);                               // Export mesh as code file (.h) defining multiple arrays of vertex attributes

// Mesh generation functions
extern Mesh GenMeshPoly(int sides, float radius);                                            // Generate polygonal mesh
extern Mesh GenMeshPlane(float width, float length, int resX, int resZ);                     // Generate plane mesh (with subdivisions)
extern Mesh GenMeshCube(float width, float height, float length);                            // Generate cuboid mesh
extern Mesh GenMeshSphere(float radius, int rings, int slices);                              // Generate sphere mesh (standard sphere)
extern Mesh GenMeshHemiSphere(float radius, int rings, int slices);                          // Generate half-sphere mesh (no bottom cap)
extern Mesh GenMeshCylinder(float radius, float height, int slices);                         // Generate cylinder mesh
extern Mesh GenMeshCone(float radius, float height, int slices);                             // Generate cone/pyramid mesh
extern Mesh GenMeshTorus(float radius, float size, int radSeg, int sides);                   // Generate torus mesh
extern Mesh GenMeshKnot(float radius, float size, int radSeg, int sides);                    // Generate trefoil knot mesh
extern Mesh GenMeshHeightmap(Image heightmap, Vector3 size);                                 // Generate heightmap mesh from image data
extern Mesh GenMeshCubicmap(Image cubicmap, Vector3 cubeSize);                               // Generate cubes-based map mesh from image data

// Material loading/unloading functions
extern Material *LoadMaterials(const char *fileName, int *materialCount);                    // Load materials from model file
extern Material LoadMaterialDefault(void);                                                   // Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
extern bool IsMaterialValid(Material material);                                              // Check if material is valid (shader assigned, map textures loaded in GPU)
extern void UnloadMaterial(Material material);                                               // Unload material from GPU memory (VRAM)
extern void SetMaterialTexture(Material *material, int mapType, Texture2D texture);          // Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)
extern void SetModelMeshMaterial(Model *model, int meshId, int materialId);                  // Set material for a mesh

// Model animations loading/unloading functions
extern ModelAnimation *LoadModelAnimations(const char *fileName, int *animCount);            // Load model animations from file
extern void UpdateModelAnimation(Model model, ModelAnimation anim, float frame);             // Update model animation pose (vertex buffers and bone matrices)
extern void UpdateModelAnimationEx(Model model, ModelAnimation animA, float frameA, ModelAnimation animB, float frameB, float blend); // Update model animation pose, blending two animations
extern void UnloadModelAnimations(ModelAnimation *animations, int animCount);                // Unload animation array data
extern bool IsModelAnimationValid(Model model, ModelAnimation anim);                         // Check model animation skeleton match

// Collision detection functions
extern bool CheckCollisionSpheres(Vector3 center1, float radius1, Vector3 center2, float radius2); // Check collision between two spheres
extern bool CheckCollisionBoxes(BoundingBox box1, BoundingBox box2);                         // Check collision between two bounding boxes
extern bool CheckCollisionBoxSphere(BoundingBox box, Vector3 center, float radius);          // Check collision between box and sphere
extern RayCollision GetRayCollisionSphere(Ray ray, Vector3 center, float radius);            // Get collision info between ray and sphere
extern RayCollision GetRayCollisionBox(Ray ray, BoundingBox box);                            // Get collision info between ray and box
extern RayCollision GetRayCollisionMesh(Ray ray, Mesh mesh, Matrix transform);               // Get collision info between ray and mesh
extern RayCollision GetRayCollisionTriangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3);    // Get collision info between ray and triangle
extern RayCollision GetRayCollisionQuad(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4); // Get collision info between ray and quad

//------------------------------------------------------------------------------------
// Audio Loading and Playing Functions (Module: audio)
//------------------------------------------------------------------------------------
typedef void (*AudioCallback)(void *bufferData, unsigned int frames);

// Audio device management functions
extern void InitAudioDevice(void);                                     // Initialize audio device and context
extern void CloseAudioDevice(void);                                    // Close the audio device and context
extern bool IsAudioDeviceReady(void);                                  // Check if audio device has been initialized successfully
extern void SetMasterVolume(float volume);                             // Set master volume (listener)
extern float GetMasterVolume(void);                                    // Get master volume (listener)

// Wave/Sound loading/unloading functions
extern Wave LoadWave(const char *fileName);                            // Load wave data from file
extern Wave LoadWaveFromMemory(const char *fileType, const unsigned char *fileData, int dataSize); // Load wave from memory buffer, fileType refers to extension: i.e. '.wav'
extern bool IsWaveValid(Wave wave);                                    // Check if wave data is valid (data loaded and parameters)
extern Sound LoadSound(const char *fileName);                          // Load sound from file
extern Sound LoadSoundFromWave(Wave wave);                             // Load sound from wave data
extern Sound LoadSoundAlias(Sound source);                             // Load sound alias, new sound that shares the same sample data as the source sound, does not own the sound data
extern bool IsSoundValid(Sound sound);                                 // Check if sound is valid (data loaded and buffers initialized)
extern void UpdateSound(Sound sound, const void *data, int frameCount); // Update sound buffer with new data (default data format: 32 bit float, stereo)
extern void UnloadWave(Wave wave);                                     // Unload wave data
extern void UnloadSound(Sound sound);                                  // Unload sound
extern void UnloadSoundAlias(Sound alias);                             // Unload sound alias (does not deallocate sample data)
extern bool ExportWave(Wave wave, const char *fileName);               // Export wave data to file, returns true on success
extern bool ExportWaveAsCode(Wave wave, const char *fileName);         // Export wave sample data to code (.h), returns true on success

// Wave/Sound management functions
extern void PlaySound(Sound sound);                                    // Play a sound
extern void StopSound(Sound sound);                                    // Stop playing a sound
extern void PauseSound(Sound sound);                                   // Pause a sound
extern void ResumeSound(Sound sound);                                  // Resume a paused sound
extern bool IsSoundPlaying(Sound sound);                               // Check if sound is currently playing
extern void SetSoundVolume(Sound sound, float volume);                 // Set volume for a sound (1.0 is max level)
extern void SetSoundPitch(Sound sound, float pitch);                   // Set pitch for a sound (1.0 is base level)
extern void SetSoundPan(Sound sound, float pan);                       // Set pan for a sound (-1.0 left, 0.0 center, 1.0 right)
extern Wave WaveCopy(Wave wave);                                       // Copy a wave to a new wave
extern void WaveCrop(Wave *wave, int initFrame, int finalFrame);       // Crop a wave to defined frames range
extern void WaveFormat(Wave *wave, int sampleRate, int sampleSize, int channels); // Convert wave data to desired format
extern float *LoadWaveSamples(Wave wave);                              // Load samples data from wave as a 32bit float data array
extern void UnloadWaveSamples(float *samples);                         // Unload samples data loaded with LoadWaveSamples()

// Music management functions
extern Music LoadMusicStream(const char *fileName);                    // Load music stream from file
extern Music LoadMusicStreamFromMemory(const char *fileType, const unsigned char *data, int dataSize); // Load music stream from data
extern bool IsMusicValid(Music music);                                 // Check if music stream is valid (context and buffers initialized)
extern void UnloadMusicStream(Music music);                            // Unload music stream
extern void PlayMusicStream(Music music);                              // Start music playing
extern bool IsMusicStreamPlaying(Music music);                         // Check if music is playing
extern void UpdateMusicStream(Music music);                            // Update buffers for music streaming
extern void StopMusicStream(Music music);                              // Stop music playing
extern void PauseMusicStream(Music music);                             // Pause music playing
extern void ResumeMusicStream(Music music);                            // Resume playing paused music
extern void SeekMusicStream(Music music, float position);              // Seek music to a position (in seconds)
extern void SetMusicVolume(Music music, float volume);                 // Set volume for music (1.0 is max level)
extern void SetMusicPitch(Music music, float pitch);                   // Set pitch for music (1.0 is base level)
extern void SetMusicPan(Music music, float pan);                       // Set pan for music (-1.0 left, 0.0 center, 1.0 right)
extern float GetMusicTimeLength(Music music);                          // Get music time length (in seconds)
extern float GetMusicTimePlayed(Music music);                          // Get current music time played (in seconds)

// AudioStream management functions
extern AudioStream LoadAudioStream(unsigned int sampleRate, unsigned int sampleSize, unsigned int channels); // Load audio stream (to stream raw audio pcm data)
extern bool IsAudioStreamValid(AudioStream stream);                    // Check if an audio stream is valid (buffers initialized)
extern void UnloadAudioStream(AudioStream stream);                     // Unload audio stream and free memory
extern void UpdateAudioStream(AudioStream stream, const void *data, int frameCount); // Update audio stream buffers with data
extern bool IsAudioStreamProcessed(AudioStream stream);                // Check if any audio stream buffers requires refill
extern void PlayAudioStream(AudioStream stream);                       // Play audio stream
extern void PauseAudioStream(AudioStream stream);                      // Pause audio stream
extern void ResumeAudioStream(AudioStream stream);                     // Resume audio stream
extern bool IsAudioStreamPlaying(AudioStream stream);                  // Check if audio stream is playing
extern void StopAudioStream(AudioStream stream);                       // Stop audio stream
extern void SetAudioStreamVolume(AudioStream stream, float volume);    // Set volume for audio stream (1.0 is max level)
extern void SetAudioStreamPitch(AudioStream stream, float pitch);      // Set pitch for audio stream (1.0 is base level)
extern void SetAudioStreamPan(AudioStream stream, float pan);          // Set pan for audio stream (-1.0 left, 0.0 center, 1.0 right)
extern void SetAudioStreamBufferSizeDefault(int size);                 // Default size for new audio streams
extern void SetAudioStreamCallback(AudioStream stream, AudioCallback callback); // Audio thread callback to request new data

extern void AttachAudioStreamProcessor(AudioStream stream, AudioCallback processor); // Attach audio stream processor to stream, receives frames x 2 samples as 'float' (stereo)
extern void DetachAudioStreamProcessor(AudioStream stream, AudioCallback processor); // Detach audio stream processor from stream

extern void AttachAudioMixedProcessor(AudioCallback processor); // Attach audio stream processor to the entire audio pipeline, receives frames x 2 samples as 'float' (stereo)
extern void DetachAudioMixedProcessor(AudioCallback processor); // Detach audio stream processor from the entire audio pipeline


