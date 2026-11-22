enum aiTextureOp {
    /** T = T1 * T2 */
    aiTextureOp_Multiply = 0x0,

    /** T = T1 + T2 */
    aiTextureOp_Add = 0x1,

    /** T = T1 - T2 */
    aiTextureOp_Subtract = 0x2,

    /** T = T1 / T2 */
    aiTextureOp_Divide = 0x3,

    /** T = (T1 + T2) - (T1 * T2) */
    aiTextureOp_SmoothAdd = 0x4,

    /** T = T1 + (T2-0.5) */
    aiTextureOp_SignedAdd = 0x5,

#ifndef SWIG
    _aiTextureOp_Force32Bit = INT_MAX
#endif
};

// ---------------------------------------------------------------------------
/** @brief Defines how UV coordinates outside the [0...1] range are handled.
 *
 *  Commonly referred to as 'wrapping mode'.
 */
enum aiTextureMapMode {
    /** A texture coordinate u|v is translated to u%1|v%1
     */
    aiTextureMapMode_Wrap = 0x0,

    /** Texture coordinates outside [0...1]
     *  are clamped to the nearest valid value.
     */
    aiTextureMapMode_Clamp = 0x1,

    /** If the texture coordinates for a pixel are outside [0...1]
     *  the texture is not applied to that pixel
     */
    aiTextureMapMode_Decal = 0x3,

    /** A texture coordinate u|v becomes u%1|v%1 if (u-(u%1))%2 is zero and
     *  1-(u%1)|1-(v%1) otherwise
     */
    aiTextureMapMode_Mirror = 0x2,

#ifndef SWIG
    _aiTextureMapMode_Force32Bit = INT_MAX
#endif
};

// ---------------------------------------------------------------------------
/** @brief Defines how the mapping coords for a texture are generated.
 *
 *  Real-time applications typically require full UV coordinates, so the use of
 *  the aiProcess_GenUVCoords step is highly recommended. It generates proper
 *  UV channels for non-UV mapped objects, as long as an accurate description
 *  how the mapping should look like (e.g spherical) is given.
 *  See the #AI_MATKEY_MAPPING property for more details.
 */
enum aiTextureMapping {
    /** The mapping coordinates are taken from an UV channel.
     *
     *  #AI_MATKEY_UVWSRC property specifies from which UV channel
     *  the texture coordinates are to be taken from (remember,
     *  meshes can have more than one UV channel).
    */
    aiTextureMapping_UV = 0x0,

    /** Spherical mapping */
    aiTextureMapping_SPHERE = 0x1,

    /** Cylindrical mapping */
    aiTextureMapping_CYLINDER = 0x2,

    /** Cubic mapping */
    aiTextureMapping_BOX = 0x3,

    /** Planar mapping */
    aiTextureMapping_PLANE = 0x4,

    /** Undefined mapping. Have fun. */
    aiTextureMapping_OTHER = 0x5,

#ifndef SWIG
    _aiTextureMapping_Force32Bit = INT_MAX
#endif
};

// ---------------------------------------------------------------------------
/** @brief Defines the purpose of a texture
 *
 *  This is a very difficult topic. Different 3D packages support different
 *  kinds of textures. For very common texture types, such as bumpmaps, the
 *  rendering results depend on implementation details in the rendering
 *  pipelines of these applications. Assimp loads all texture references from
 *  the model file and tries to determine which of the predefined texture
 *  types below is the best choice to match the original use of the texture
 *  as closely as possible.<br>
 *
 *  In content pipelines you'll usually define how textures have to be handled,
 *  and the artists working on models have to conform to this specification,
 *  regardless which 3D tool they're using.
 */
enum aiTextureType {
    /** Dummy value.
     *
     *  No texture, but the value to be used as 'texture semantic'
     *  (#aiMaterialProperty::mSemantic) for all material properties
     *  *not* related to textures.
     */
    aiTextureType_NONE = 0,

    /** LEGACY API MATERIALS
     * Legacy refers to materials which
     * Were originally implemented in the specifications around 2000.
     * These must never be removed, as most engines support them.
     */

    /** The texture is combined with the result of the diffuse
     *  lighting equation.
     *  OR
     *  PBR Specular/Glossiness
     */
    aiTextureType_DIFFUSE = 1,

    /** The texture is combined with the result of the specular
     *  lighting equation.
     *  OR
     *  PBR Specular/Glossiness
     */
    aiTextureType_SPECULAR = 2,

    /** The texture is combined with the result of the ambient
     *  lighting equation.
     */
    aiTextureType_AMBIENT = 3,

    /** The texture is added to the result of the lighting
     *  calculation. It isn't influenced by incoming light.
     */
    aiTextureType_EMISSIVE = 4,

    /** The texture is a height map.
     *
     *  By convention, higher gray-scale values stand for
     *  higher elevations from the base height.
     */
    aiTextureType_HEIGHT = 5,

    /** The texture is a (tangent space) normal-map.
     *
     *  Again, there are several conventions for tangent-space
     *  normal maps. Assimp does (intentionally) not
     *  distinguish here.
     */
    aiTextureType_NORMALS = 6,

    /** The texture defines the glossiness of the material.
     *
     *  The glossiness is in fact the exponent of the specular
     *  (phong) lighting equation. Usually there is a conversion
     *  function defined to map the linear color values in the
     *  texture to a suitable exponent. Have fun.
    */
    aiTextureType_SHININESS = 7,

    /** The texture defines per-pixel opacity.
     *
     *  Usually 'white' means opaque and 'black' means
     *  'transparency'. Or quite the opposite. Have fun.
    */
    aiTextureType_OPACITY = 8,

    /** Displacement texture
     *
     *  The exact purpose and format is application-dependent.
     *  Higher color values stand for higher vertex displacements.
    */
    aiTextureType_DISPLACEMENT = 9,

    /** Lightmap texture (aka Ambient Occlusion)
     *
     *  Both 'Lightmaps' and dedicated 'ambient occlusion maps' are
     *  covered by this material property. The texture contains a
     *  scaling value for the final color value of a pixel. Its
     *  intensity is not affected by incoming light.
    */
    aiTextureType_LIGHTMAP = 10,

    /** Reflection texture
     *
     * Contains the color of a perfect mirror reflection.
     * Rarely used, almost never for real-time applications.
    */
    aiTextureType_REFLECTION = 11,

    /** PBR Materials
     * PBR definitions from maya and other modelling packages now use this standard.
     * This was originally introduced around 2012.
     * Support for this is in game engines like Godot, Unreal or Unity3D.
     * Modelling packages which use this are very common now.
     */

    aiTextureType_BASE_COLOR = 12,
    aiTextureType_NORMAL_CAMERA = 13,
    aiTextureType_EMISSION_COLOR = 14,
    aiTextureType_METALNESS = 15,
    aiTextureType_DIFFUSE_ROUGHNESS = 16,
    aiTextureType_AMBIENT_OCCLUSION = 17,

    /** PBR Material Modifiers
    * Some modern renderers have further PBR modifiers that may be overlaid
    * on top of the 'base' PBR materials for additional realism.
    * These use multiple texture maps, so only the base type is directly defined
    */

    /** Sheen
    * Generally used to simulate textiles that are covered in a layer of microfibers
    * eg velvet
    * https://github.com/KhronosGroup/glTF/tree/master/extensions/2.0/Khronos/KHR_materials_sheen
    */
    aiTextureType_SHEEN = 19,

    /** Clearcoat
    * Simulates a layer of 'polish' or 'lacquer' layered on top of a PBR substrate
    * https://autodesk.github.io/standard-surface/#closures/coating
    * https://github.com/KhronosGroup/glTF/tree/master/extensions/2.0/Khronos/KHR_materials_clearcoat
    */
    aiTextureType_CLEARCOAT = 20,

    /** Transmission
    * Simulates transmission through the surface
    * May include further information such as wall thickness
    */
    aiTextureType_TRANSMISSION = 21,

    /** Unknown texture
     *
     *  A texture reference that does not match any of the definitions
     *  above is considered to be 'unknown'. It is still imported,
     *  but is excluded from any further post-processing.
    */
    aiTextureType_UNKNOWN = 18,

#ifndef SWIG
    _aiTextureType_Force32Bit = INT_MAX
#endif
};

#define AI_TEXTURE_TYPE_MAX aiTextureType_TRANSMISSION

// -------------------------------------------------------------------------------
// Get a string for a given aiTextureType
extern const char *aiTextureTypeToString(enum aiTextureType in);

// ---------------------------------------------------------------------------
/** @brief Defines all shading models supported by the library
 *
 *  Property: #AI_MATKEY_SHADING_MODEL
 *
 *  The list of shading modes has been taken from Blender.
 *  See Blender documentation for more information. The API does
 *  not distinguish between "specular" and "diffuse" shaders (thus the
 *  specular term for diffuse shading models like Oren-Nayar remains
 *  undefined). <br>
 *  Again, this value is just a hint. Assimp tries to select the shader whose
 *  most common implementation matches the original rendering results of the
 *  3D modeler which wrote a particular model as closely as possible.
 *
 */
enum aiShadingMode {
    /** Flat shading. Shading is done on per-face base,
     *  diffuse only. Also known as 'faceted shading'.
     */
    aiShadingMode_Flat = 0x1,

    /** Simple Gouraud shading.
     */
    aiShadingMode_Gouraud = 0x2,

    /** Phong-Shading -
     */
    aiShadingMode_Phong = 0x3,

    /** Phong-Blinn-Shading
     */
    aiShadingMode_Blinn = 0x4,

    /** Toon-Shading per pixel
     *
     *  Also known as 'comic' shader.
     */
    aiShadingMode_Toon = 0x5,

    /** OrenNayar-Shading per pixel
     *
     *  Extension to standard Lambertian shading, taking the
     *  roughness of the material into account
     */
    aiShadingMode_OrenNayar = 0x6,

    /** Minnaert-Shading per pixel
     *
     *  Extension to standard Lambertian shading, taking the
     *  "darkness" of the material into account
     */
    aiShadingMode_Minnaert = 0x7,

    /** CookTorrance-Shading per pixel
     *
     *  Special shader for metallic surfaces.
     */
    aiShadingMode_CookTorrance = 0x8,

    /** No shading at all. Constant light influence of 1.0.
    * Also known as "Unlit"
    */
    aiShadingMode_NoShading = 0x9,
    aiShadingMode_Unlit = aiShadingMode_NoShading, // Alias

    /** Fresnel shading
     */
    aiShadingMode_Fresnel = 0xa,

    /** Physically-Based Rendering (PBR) shading using
    * Bidirectional scattering/reflectance distribution function (BSDF/BRDF)
    * There are multiple methods under this banner, and model files may provide
    * data for more than one PBR-BRDF method.
    * Applications should use the set of provided properties to determine which
    * of their preferred PBR rendering methods are likely to be available
    * eg:
    * - If AI_MATKEY_METALLIC_FACTOR is set, then a Metallic/Roughness is available
    * - If AI_MATKEY_GLOSSINESS_FACTOR is set, then a Specular/Glossiness is available
    * Note that some PBR methods allow layering of techniques
    */
    aiShadingMode_PBR_BRDF = 0xb,

#ifndef SWIG
    _aiShadingMode_Force32Bit = INT_MAX
#endif
};

// ---------------------------------------------------------------------------
/** @brief Defines some mixed flags for a particular texture.
 *
 *  Usually you'll instruct your cg artists how textures have to look like ...
 *  and how they will be processed in your application. However, if you use
 *  Assimp for completely generic loading purposes you might also need to
 *  process these flags in order to display as many 'unknown' 3D models as
 *  possible correctly.
 *
 *  This corresponds to the #AI_MATKEY_TEXFLAGS property.
*/
enum aiTextureFlags {
    /** The texture's color values have to be inverted (component-wise 1-n)
     */
    aiTextureFlags_Invert = 0x1,

    /** Explicit request to the application to process the alpha channel
     *  of the texture.
     *
     *  Mutually exclusive with #aiTextureFlags_IgnoreAlpha. These
     *  flags are set if the library can say for sure that the alpha
     *  channel is used/is not used. If the model format does not
     *  define this, it is left to the application to decide whether
     *  the texture alpha channel - if any - is evaluated or not.
     */
    aiTextureFlags_UseAlpha = 0x2,

    /** Explicit request to the application to ignore the alpha channel
     *  of the texture.
     *
     *  Mutually exclusive with #aiTextureFlags_UseAlpha.
     */
    aiTextureFlags_IgnoreAlpha = 0x4,

#ifndef SWIG
    _aiTextureFlags_Force32Bit = INT_MAX
#endif
};

// ---------------------------------------------------------------------------
/** @brief Defines alpha-blend flags.
 *
 *  If you're familiar with OpenGL or D3D, these flags aren't new to you.
 *  They define *how* the final color value of a pixel is computed, basing
 *  on the previous color at that pixel and the new color value from the
 *  material.
 *  The blend formula is:
 *  @code
 *    SourceColor * SourceBlend + DestColor * DestBlend
 *  @endcode
 *  where DestColor is the previous color in the frame-buffer at this
 *  position and SourceColor is the material color before the transparency
 *  calculation.<br>
 *  This corresponds to the #AI_MATKEY_BLEND_FUNC property.
*/
enum aiBlendMode {
    /**
     *  Formula:
     *  @code
     *  SourceColor*SourceAlpha + DestColor*(1-SourceAlpha)
     *  @endcode
     */
    aiBlendMode_Default = 0x0,

    /** Additive blending
     *
     *  Formula:
     *  @code
     *  SourceColor*1 + DestColor*1
     *  @endcode
     */
    aiBlendMode_Additive = 0x1,

// we don't need more for the moment, but we might need them
// in future versions ...

#ifndef SWIG
    _aiBlendMode_Force32Bit = INT_MAX
#endif
};

#include "./Compiler/pushpack1.h"

// ---------------------------------------------------------------------------
/** @brief Defines how an UV channel is transformed.
 *
 *  This is just a helper structure for the #AI_MATKEY_UVTRANSFORM key.
 *  See its documentation for more details.
 *
 *  Typically you'll want to build a matrix of this information. However,
 *  we keep separate scaling/translation/rotation values to make it
 *  easier to process and optimize UV transformations internally.
 */
struct aiUVTransform {
    /** Translation on the u and v axes.
     *
     *  The default value is (0|0).
     */
     aiVector2D mTranslation;

    /** Scaling on the u and v axes.
     *
     *  The default value is (1|1).
     */
     aiVector2D mScaling;

    /** Rotation - in counter-clockwise direction.
     *
     *  The rotation angle is specified in radians. The
     *  rotation center is 0.5f|0.5f. The default value
     *  0.f.
     */
    ai_real mRotation;

#ifdef __cplusplus
    aiUVTransform() AI_NO_EXCEPT
            : mTranslation(0.0, 0.0),
              mScaling(1.0, 1.0),
              mRotation(0.0) {
        // nothing to be done here ...
    }
#endif
};

#include "./Compiler/poppack1.h"

//! @cond AI_DOX_INCLUDE_INTERNAL
// ---------------------------------------------------------------------------
/** @brief A very primitive RTTI system for the contents of material
 *  properties.
 */
enum aiPropertyTypeInfo {
    /** Array of single-precision (32 Bit) floats
     *
     *  It is possible to use aiGetMaterialInteger[Array]() (or the C++-API
     *  aiMaterial::Get()) to query properties stored in floating-point format.
     *  The material system performs the type conversion automatically.
    */
    aiPTI_Float = 0x1,

    /** Array of double-precision (64 Bit) floats
     *
     *  It is possible to use aiGetMaterialInteger[Array]() (or the C++-API
     *  aiMaterial::Get()) to query properties stored in floating-point format.
     *  The material system performs the type conversion automatically.
    */
    aiPTI_Double = 0x2,

    /** The material property is an aiString.
     *
     *  Arrays of strings aren't possible, aiGetMaterialString() (or the
     *  C++-API aiMaterial::Get()) *must* be used to query a string property.
    */
    aiPTI_String = 0x3,

    /** Array of (32 Bit) integers
     *
     *  It is possible to use aiGetMaterialFloat[Array]() (or the C++-API
     *  aiMaterial::Get()) to query properties stored in integer format.
     *  The material system performs the type conversion automatically.
    */
    aiPTI_Integer = 0x4,

    /** Simple binary buffer, content undefined. Not convertible to anything.
    */
    aiPTI_Buffer = 0x5,

/** This value is not used. It is just there to force the
     *  compiler to map this enum to a 32 Bit integer.
     */
#ifndef SWIG
    _aiPTI_Force32Bit = INT_MAX
#endif
};

// ---------------------------------------------------------------------------
/** @brief Data structure for a single material property
 *
 *  As an user, you'll probably never need to deal with this data structure.
 *  Just use the provided aiGetMaterialXXX() or aiMaterial::Get() family
 *  of functions to query material properties easily. Processing them
 *  manually is faster, but it is not the recommended way. It isn't worth
 *  the effort. <br>
 *  Material property names follow a simple scheme:
 *  @code
 *    $<name>
 *    ?<name>
 *       A public property, there must be corresponding AI_MATKEY_XXX define
 *       2nd: Public, but ignored by the #aiProcess_RemoveRedundantMaterials
 *       post-processing step.
 *    ~<name>
 *       A temporary property for internal use.
 *  @endcode
 *  @see aiMaterial
 */
struct aiMaterialProperty {
    /** Specifies the name of the property (key)
     *  Keys are generally case insensitive.
     */
     aiString mKey;

    /** Textures: Specifies their exact usage semantic.
     * For non-texture properties, this member is always 0
     * (or, better-said, #aiTextureType_NONE).
     */
    unsigned int mSemantic;

    /** Textures: Specifies the index of the texture.
     *  For non-texture properties, this member is always 0.
     */
    unsigned int mIndex;

    /** Size of the buffer mData is pointing to, in bytes.
     *  This value may not be 0.
     */
    unsigned int mDataLength;

    /** Type information for the property.
     *
     * Defines the data layout inside the data buffer. This is used
     * by the library internally to perform debug checks and to
     * utilize proper type conversions.
     * (It's probably a hacky solution, but it works.)
     */
     aiPropertyTypeInfo mType;

    /** Binary buffer to hold the property's value.
     * The size of the buffer is always mDataLength.
     */
    char *mData;

#ifdef __cplusplus

    aiMaterialProperty() AI_NO_EXCEPT
            : mSemantic(0),
              mIndex(0),
              mDataLength(0),
              mType(aiPTI_Float),
              mData(nullptr) {
        // empty
    }

    ~aiMaterialProperty() {
        delete[] mData;
        mData = nullptr;
    }

#endif
};
//! @endcond

#ifdef __cplusplus
} // We need to leave the "C" block here to allow template member functions
#endif

// ---------------------------------------------------------------------------
/** @brief Data structure for a material
*
*  Material data is stored using a key-value structure. A single key-value
*  pair is called a 'material property'. C++ users should use the provided
*  member functions of aiMaterial to process material properties, C users
*  have to stick with the aiMaterialGetXXX family of unbound functions.
*  The library defines a set of standard keys (AI_MATKEY_XXX).
*/
#ifdef __cplusplus
struct extern aiMaterial
#else
struct aiMaterial
#endif
{

#ifdef __cplusplus

public:
    aiMaterial();
    ~aiMaterial();

    // -------------------------------------------------------------------
    /**
      * @brief  Returns the name of the material.
      * @return The name of the material.
      */
    // -------------------------------------------------------------------
    aiString GetName() const;

    // -------------------------------------------------------------------
    /** @brief Retrieve an array of Type values with a specific key
     *  from the material
     *
     * @param pKey Key to search for. One of the AI_MATKEY_XXX constants.
     * @param type .. set by AI_MATKEY_XXX
     * @param idx .. set by AI_MATKEY_XXX
     * @param pOut Pointer to a buffer to receive the result.
     * @param pMax Specifies the size of the given buffer, in Type's.
     * Receives the number of values (not bytes!) read.
     * NULL is a valid value for this parameter.
     */
    template <typename Type>
    aiReturn Get(const char *pKey, unsigned int type,
            unsigned int idx, Type *pOut, unsigned int *pMax) const;

    aiReturn Get(const char *pKey, unsigned int type,
            unsigned int idx, int *pOut, unsigned int *pMax) const;

    aiReturn Get(const char *pKey, unsigned int type,
            unsigned int idx, ai_real *pOut, unsigned int *pMax) const;

    // -------------------------------------------------------------------
    /** @brief Retrieve a Type value with a specific key
     *  from the material
     *
     * @param pKey Key to search for. One of the AI_MATKEY_XXX constants.
    * @param type Specifies the type of the texture to be retrieved (
    *    e.g. diffuse, specular, height map ...)
    * @param idx Index of the texture to be retrieved.
     * @param pOut Reference to receive the output value
     */
    template <typename Type>
    aiReturn Get(const char *pKey, unsigned int type,
            unsigned int idx, Type &pOut) const;

    aiReturn Get(const char *pKey, unsigned int type,
            unsigned int idx, int &pOut) const;

    aiReturn Get(const char *pKey, unsigned int type,
            unsigned int idx, ai_real &pOut) const;

    aiReturn Get(const char *pKey, unsigned int type,
            unsigned int idx, aiString &pOut) const;

    aiReturn Get(const char *pKey, unsigned int type,
            unsigned int idx, aiColor3D &pOut) const;

    aiReturn Get(const char *pKey, unsigned int type,
            unsigned int idx, aiColor4D &pOut) const;

    aiReturn Get(const char *pKey, unsigned int type,
            unsigned int idx, aiUVTransform &pOut) const;

    // -------------------------------------------------------------------
    /** Get the number of textures for a particular texture type.
     *  @param type Texture type to check for
     *  @return Number of textures for this type.
     *  @note A texture can be easily queried using #GetTexture() */
    unsigned int GetTextureCount(aiTextureType type) const;

    // -------------------------------------------------------------------
    /** Helper function to get all parameters pertaining to a
     *  particular texture slot from a material.
     *
     *  This function is provided just for convenience, you could also
     *  read the single material properties manually.
     *  @param type Specifies the type of the texture to be retrieved (
     *    e.g. diffuse, specular, height map ...)
     *  @param index Index of the texture to be retrieved. The function fails
     *    if there is no texture of that type with this index.
     *    #GetTextureCount() can be used to determine the number of textures
     *    per texture type.
     *  @param path Receives the path to the texture.
     *    Use aiScene::GetEmbeddedTexture() method to determine if returned path
     *    is an image file to be opened or a string key of embedded texture stored in the corresponding scene
     *    (could be a '*' followed by the id of the texture in case of no name)
     *    NULL is a valid value.
     *  @param mapping The texture mapping.
     *    NULL is allowed as value.
     *  @param uvindex Receives the UV index of the texture.
     *    NULL is a valid value.
     *  @param blend Receives the blend factor for the texture
     *    NULL is a valid value.
     *  @param op Receives the texture operation to be performed between
     *    this texture and the previous texture. NULL is allowed as value.
     *  @param mapmode Receives the mapping modes to be used for the texture.
     *    The parameter may be NULL but if it is a valid pointer it MUST
     *    point to an array of 3 aiTextureMapMode's (one for each
     *    axis: UVW order (=XYZ)).
     */
    // -------------------------------------------------------------------
    aiReturn GetTexture(aiTextureType type,
            unsigned int index,
             aiString *path,
            aiTextureMapping *mapping = NULL,
            unsigned int *uvindex = NULL,
            ai_real *blend = NULL,
            aiTextureOp *op = NULL,
            aiTextureMapMode *mapmode = NULL) const;

    // Setters

    // ------------------------------------------------------------------------------
    /** @brief Add a property with a given key and type info to the material
     *  structure
     *
     *  @param pInput Pointer to input data
     *  @param pSizeInBytes Size of input data
     *  @param pKey Key/Usage of the property (AI_MATKEY_XXX)
     *  @param type Set by the AI_MATKEY_XXX macro
     *  @param index Set by the AI_MATKEY_XXX macro
     *  @param pType Type information hint */
    aiReturn AddBinaryProperty(const void *pInput,
            unsigned int pSizeInBytes,
            const char *pKey,
            unsigned int type,
            unsigned int index,
            aiPropertyTypeInfo pType);

    // ------------------------------------------------------------------------------
    /** @brief Add a string property with a given key and type info to the
     *  material structure
     *
     *  @param pInput Input string
     *  @param pKey Key/Usage of the property (AI_MATKEY_XXX)
     *  @param type Set by the AI_MATKEY_XXX macro
     *  @param index Set by the AI_MATKEY_XXX macro */
    aiReturn AddProperty(const aiString *pInput,
            const char *pKey,
            unsigned int type = 0,
            unsigned int index = 0);

    // ------------------------------------------------------------------------------
    /** @brief Add a property with a given key to the material structure
     *  @param pInput Pointer to the input data
     *  @param pNumValues Number of values in the array
     *  @param pKey Key/Usage of the property (AI_MATKEY_XXX)
     *  @param type Set by the AI_MATKEY_XXX macro
     *  @param index Set by the AI_MATKEY_XXX macro  */
    template <class TYPE>
    aiReturn AddProperty(const TYPE *pInput,
            unsigned int pNumValues,
            const char *pKey,
            unsigned int type = 0,
            unsigned int index = 0);

    aiReturn AddProperty(const aiVector3D *pInput,
            unsigned int pNumValues,
            const char *pKey,
            unsigned int type = 0,
            unsigned int index = 0);

    aiReturn AddProperty(const aiColor3D *pInput,
            unsigned int pNumValues,
            const char *pKey,
            unsigned int type = 0,
            unsigned int index = 0);

    aiReturn AddProperty(const aiColor4D *pInput,
            unsigned int pNumValues,
            const char *pKey,
            unsigned int type = 0,
            unsigned int index = 0);

    aiReturn AddProperty(const int *pInput,
            unsigned int pNumValues,
            const char *pKey,
            unsigned int type = 0,
            unsigned int index = 0);

    aiReturn AddProperty(const float *pInput,
            unsigned int pNumValues,
            const char *pKey,
            unsigned int type = 0,
            unsigned int index = 0);

    aiReturn AddProperty(const double *pInput,
            unsigned int pNumValues,
            const char *pKey,
            unsigned int type = 0,
            unsigned int index = 0);

    aiReturn AddProperty(const aiUVTransform *pInput,
            unsigned int pNumValues,
            const char *pKey,
            unsigned int type = 0,
            unsigned int index = 0);

    // ------------------------------------------------------------------------------
    /** @brief Remove a given key from the list.
     *
     *  The function fails if the key isn't found
     *  @param pKey Key to be deleted
     *  @param type Set by the AI_MATKEY_XXX macro
     *  @param index Set by the AI_MATKEY_XXX macro  */
    aiReturn RemoveProperty(const char *pKey,
            unsigned int type = 0,
            unsigned int index = 0);

    // ------------------------------------------------------------------------------
    /** @brief Removes all properties from the material.
     *
     *  The data array remains allocated so adding new properties is quite fast.  */
    void Clear();

    // ------------------------------------------------------------------------------
    /** Copy the property list of a material
     *  @param pcDest Destination material
     *  @param pcSrc Source material
     */
    static void CopyPropertyList(aiMaterial *pcDest,
            const aiMaterial *pcSrc);

#endif

    /** List of all material properties loaded. */
     aiMaterialProperty **mProperties;

    /** Number of properties in the data base */
    unsigned int mNumProperties;

    /** Storage allocated */
    unsigned int mNumAllocated;
};

// Go back to extern "C" again
#ifdef __cplusplus
extern "C" {
#endif


// ---------------------------------------------------------------------------
// Pure key names for all texture-related properties
//! @cond MATS_DOC_FULL
#define _AI_MATKEY_TEXTURE_BASE "$tex.file"
#define _AI_MATKEY_UVWSRC_BASE "$tex.uvwsrc"
#define _AI_MATKEY_TEXOP_BASE "$tex.op"
#define _AI_MATKEY_MAPPING_BASE "$tex.mapping"
#define _AI_MATKEY_TEXBLEND_BASE "$tex.blend"
#define _AI_MATKEY_MAPPINGMODE_U_BASE "$tex.mapmodeu"
#define _AI_MATKEY_MAPPINGMODE_V_BASE "$tex.mapmodev"
#define _AI_MATKEY_TEXMAP_AXIS_BASE "$tex.mapaxis"
#define _AI_MATKEY_UVTRANSFORM_BASE "$tex.uvtrafo"
#define _AI_MATKEY_TEXFLAGS_BASE "$tex.flags"
//! @endcond

// ---------------------------------------------------------------------------

//! @endcond

extern  aiReturn aiGetMaterialProperty(
        const  aiMaterial *pMat,
        const char *pKey,
        unsigned int type,
        unsigned int index,
        const  aiMaterialProperty **pPropOut);

// ---------------------------------------------------------------------------
/** @brief Retrieve an array of float values with a specific key
 *  from the material
 *
 * Pass one of the AI_MATKEY_XXX constants for the last three parameters (the
 * example reads the #AI_MATKEY_UVTRANSFORM property of the first diffuse texture)
 * @code
 * aiUVTransform trafo;
 * unsigned int max = sizeof(aiUVTransform);
 * if (AI_SUCCESS != aiGetMaterialFloatArray(mat, AI_MATKEY_UVTRANSFORM(aiTextureType_DIFFUSE,0),
 *    (float*)&trafo, &max) || sizeof(aiUVTransform) != max)
 * {
 *   // error handling
 * }
 * @endcode
 *
 * @param pMat Pointer to the input material. May not be NULL
 * @param pKey Key to search for. One of the AI_MATKEY_XXX constants.
 * @param pOut Pointer to a buffer to receive the result.
 * @param pMax Specifies the size of the given buffer, in float's.
 *        Receives the number of values (not bytes!) read.
 * @param type (see the code sample above)
 * @param index (see the code sample above)
 * @return Specifies whether the key has been found. If not, the output
 *   arrays remains unmodified and pMax is set to 0.*/
// ---------------------------------------------------------------------------
extern  aiReturn aiGetMaterialFloatArray(
        const  aiMaterial *pMat,
        const char *pKey,
        unsigned int type,
        unsigned int index,
        ai_real *pOut,
        unsigned int *pMax);

/**xxxxxxxx
// ---------------------------------------------------------------------------
inline aiReturn aiGetMaterialFloat(const  aiMaterial *pMat,
        const char *pKey,
        unsigned int type,
        unsigned int index,
        ai_real *pOut) {
    return aiGetMaterialFloatArray(pMat, pKey, type, index, pOut, (unsigned int *)0x0);
}
*/

// ---------------------------------------------------------------------------
/** @brief Retrieve an array of integer values with a specific key
 *  from a material
 *
 * See the sample for aiGetMaterialFloatArray for more information.*/
extern  aiReturn aiGetMaterialIntegerArray(const  aiMaterial *pMat,
        const char *pKey,
        unsigned int type,
        unsigned int index,
        int *pOut,
        unsigned int *pMax);

// ---------------------------------------------------------------------------
/*xxxxxxx
inline aiReturn aiGetMaterialInteger(const  aiMaterial *pMat,
        const char *pKey,
        unsigned int type,
        unsigned int index,
        int *pOut) {
    return aiGetMaterialIntegerArray(pMat, pKey, type, index, pOut, (unsigned int *)0x0);
}
*/

// ---------------------------------------------------------------------------
/** @brief Retrieve a color value from the material property table
*
* See the sample for aiGetMaterialFloat for more information*/
// ---------------------------------------------------------------------------
extern  aiReturn aiGetMaterialColor(const  aiMaterial *pMat,
        const char *pKey,
        unsigned int type,
        unsigned int index,
         aiColor4D *pOut);

// ---------------------------------------------------------------------------
/** @brief Retrieve a aiUVTransform value from the material property table
*
* See the sample for aiGetMaterialFloat for more information*/
// ---------------------------------------------------------------------------
extern  aiReturn aiGetMaterialUVTransform(const  aiMaterial *pMat,
        const char *pKey,
        unsigned int type,
        unsigned int index,
         aiUVTransform *pOut);

// ---------------------------------------------------------------------------
/** @brief Retrieve a string from the material property table
*
* See the sample for aiGetMaterialFloat for more information.*/
// ---------------------------------------------------------------------------
extern  aiReturn aiGetMaterialString(const  aiMaterial *pMat,
        const char *pKey,
        unsigned int type,
        unsigned int index,
         aiString *pOut);

// ---------------------------------------------------------------------------
/** Get the number of textures for a particular texture type.
 *  @param[in] pMat Pointer to the input material. May not be NULL
 *  @param type Texture type to check for
 *  @return Number of textures for this type.
 *  @note A texture can be easily queried using #aiGetMaterialTexture() */
// ---------------------------------------------------------------------------
extern unsigned int aiGetMaterialTextureCount(const  aiMaterial *pMat,
         aiTextureType type);

// ---------------------------------------------------------------------------
/** @brief Helper function to get all values pertaining to a particular
 *  texture slot from a material structure.
 *
 *  This function is provided just for convenience. You could also read the
 *  texture by parsing all of its properties manually. This function bundles
 *  all of them in a huge function monster.
 *
 *  @param[in] mat Pointer to the input material. May not be NULL
 *  @param[in] type Specifies the texture stack to read from (e.g. diffuse,
 *     specular, height map ...).
 *  @param[in] index Index of the texture. The function fails if the
 *     requested index is not available for this texture type.
 *     #aiGetMaterialTextureCount() can be used to determine the number of
 *     textures in a particular texture stack.
 *  @param[out] path Receives the output path
 *     If the texture is embedded, receives a '*' followed by the id of
 *     the texture (for the textures stored in the corresponding scene) which
 *     can be converted to an int using a function like atoi.
 *     This parameter must be non-null.
 *  @param mapping The texture mapping mode to be used.
 *      Pass NULL if you're not interested in this information.
 *  @param[out] uvindex For UV-mapped textures: receives the index of the UV
 *      source channel. Unmodified otherwise.
 *      Pass NULL if you're not interested in this information.
 *  @param[out] blend Receives the blend factor for the texture
 *      Pass NULL if you're not interested in this information.
 *  @param[out] op Receives the texture blend operation to be perform between
 *      this texture and the previous texture.
 *      Pass NULL if you're not interested in this information.
 *  @param[out] mapmode Receives the mapping modes to be used for the texture.
 *      Pass NULL if you're not interested in this information. Otherwise,
 *      pass a pointer to an array of two aiTextureMapMode's (one for each
 *      axis, UV order).
 *  @param[out] flags Receives the the texture flags.
 *  @return AI_SUCCESS on success, otherwise something else. Have fun.*/
// ---------------------------------------------------------------------------
#ifdef __cplusplus
extern aiReturn aiGetMaterialTexture(const  aiMaterial *mat,
        aiTextureType type,
        unsigned int index,
        aiString *path,
        aiTextureMapping *mapping = NULL,
        unsigned int *uvindex = NULL,
        ai_real *blend = NULL,
        aiTextureOp *op = NULL,
        aiTextureMapMode *mapmode = NULL,
        unsigned int *flags = NULL);
#else
 aiReturn aiGetMaterialTexture(const  aiMaterial *mat,
         aiTextureType type,
        unsigned int index,
         aiString *path,
         aiTextureMapping *mapping /*= NULL*/,
        unsigned int *uvindex /*= NULL*/,
        ai_real *blend /*= NULL*/,
         aiTextureOp *op /*= NULL*/,
         aiTextureMapMode *mapmode /*= NULL*/,
        unsigned int *flags /*= NULL*/);
#endif // !#ifdef __cplusplus

#ifdef __cplusplus
}

#include "material.inl"

#endif //!__cplusplus

#endif //!!AI_MATERIAL_H_INC
