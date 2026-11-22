
unit material;
interface

{
  Automatically converted by H2Pas 1.0.0 from material.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    material.h
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
Pai_real  = ^ai_real;
PaiBlendMode  = ^aiBlendMode;
PaiColor4D  = ^aiColor4D;
PaiMaterial  = ^aiMaterial;
PaiMaterialProperty  = ^aiMaterialProperty;
PaiPropertyTypeInfo  = ^aiPropertyTypeInfo;
PaiShadingMode  = ^aiShadingMode;
PaiString  = ^aiString;
PaiTextureFlags  = ^aiTextureFlags;
PaiTextureMapMode  = ^aiTextureMapMode;
PaiTextureMapping  = ^aiTextureMapping;
PaiTextureOp  = ^aiTextureOp;
PaiTextureType  = ^aiTextureType;
PaiUVTransform  = ^aiUVTransform;
Pchar  = ^char;
Pdword  = ^dword;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* T = T1 * T2  }
{* T = T1 + T2  }
{* T = T1 - T2  }
{* T = T1 / T2  }
{* T = (T1 + T2) - (T1 * T2)  }
{* T = T1 + (T2-0.5)  }
{$ifndef SWIG}
{$endif}
type
  TaiTextureOp =  Longint;
  Const
    aiTextureOp_Multiply = $0;
    aiTextureOp_Add = $1;
    aiTextureOp_Subtract = $2;
    aiTextureOp_Divide = $3;
    aiTextureOp_SmoothAdd = $4;
    aiTextureOp_SignedAdd = $5;
    _aiTextureOp_Force32Bit = INT_MAX;

{ --------------------------------------------------------------------------- }
{* @brief Defines how UV coordinates outside the [0...1] range are handled.
 *
 *  Commonly referred to as 'wrapping mode'.
  }
{* A texture coordinate u|v is translated to u%1|v%1
      }
{* Texture coordinates outside [0...1]
     *  are clamped to the nearest valid value.
      }
{* If the texture coordinates for a pixel are outside [0...1]
     *  the texture is not applied to that pixel
      }
{* A texture coordinate u|v becomes u%1|v%1 if (u-(u%1))%2 is zero and
     *  1-(u%1)|1-(v%1) otherwise
      }
{$ifndef SWIG}
{$endif}
type
  TaiTextureMapMode =  Longint;
  Const
    aiTextureMapMode_Wrap = $0;
    aiTextureMapMode_Clamp = $1;
    aiTextureMapMode_Decal = $3;
    aiTextureMapMode_Mirror = $2;
    _aiTextureMapMode_Force32Bit = INT_MAX;

{ --------------------------------------------------------------------------- }
{* @brief Defines how the mapping coords for a texture are generated.
 *
 *  Real-time applications typically require full UV coordinates, so the use of
 *  the aiProcess_GenUVCoords step is highly recommended. It generates proper
 *  UV channels for non-UV mapped objects, as long as an accurate description
 *  how the mapping should look like (e.g spherical) is given.
 *  See the #AI_MATKEY_MAPPING property for more details.
  }
{* The mapping coordinates are taken from an UV channel.
     *
     *  #AI_MATKEY_UVWSRC property specifies from which UV channel
     *  the texture coordinates are to be taken from (remember,
     *  meshes can have more than one UV channel).
     }
{* Spherical mapping  }
{* Cylindrical mapping  }
{* Cubic mapping  }
{* Planar mapping  }
{* Undefined mapping. Have fun.  }
{$ifndef SWIG}
{$endif}
type
  TaiTextureMapping =  Longint;
  Const
    aiTextureMapping_UV = $0;
    aiTextureMapping_SPHERE = $1;
    aiTextureMapping_CYLINDER = $2;
    aiTextureMapping_BOX = $3;
    aiTextureMapping_PLANE = $4;
    aiTextureMapping_OTHER = $5;
    _aiTextureMapping_Force32Bit = INT_MAX;

{ --------------------------------------------------------------------------- }
{* @brief Defines the purpose of a texture
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
  }
{* Dummy value.
     *
     *  No texture, but the value to be used as 'texture semantic'
     *  (#aiMaterialProperty::mSemantic) for all material properties
     *  *not* related to textures.
      }
{* LEGACY API MATERIALS
     * Legacy refers to materials which
     * Were originally implemented in the specifications around 2000.
     * These must never be removed, as most engines support them.
      }
{* The texture is combined with the result of the diffuse
     *  lighting equation.
     *  OR
     *  PBR Specular/Glossiness
      }
{* The texture is combined with the result of the specular
     *  lighting equation.
     *  OR
     *  PBR Specular/Glossiness
      }
{* The texture is combined with the result of the ambient
     *  lighting equation.
      }
{* The texture is added to the result of the lighting
     *  calculation. It isn't influenced by incoming light.
      }
{* The texture is a height map.
     *
     *  By convention, higher gray-scale values stand for
     *  higher elevations from the base height.
      }
{* The texture is a (tangent space) normal-map.
     *
     *  Again, there are several conventions for tangent-space
     *  normal maps. Assimp does (intentionally) not
     *  distinguish here.
      }
{* The texture defines the glossiness of the material.
     *
     *  The glossiness is in fact the exponent of the specular
     *  (phong) lighting equation. Usually there is a conversion
     *  function defined to map the linear color values in the
     *  texture to a suitable exponent. Have fun.
     }
{* The texture defines per-pixel opacity.
     *
     *  Usually 'white' means opaque and 'black' means
     *  'transparency'. Or quite the opposite. Have fun.
     }
{* Displacement texture
     *
     *  The exact purpose and format is application-dependent.
     *  Higher color values stand for higher vertex displacements.
     }
{* Lightmap texture (aka Ambient Occlusion)
     *
     *  Both 'Lightmaps' and dedicated 'ambient occlusion maps' are
     *  covered by this material property. The texture contains a
     *  scaling value for the final color value of a pixel. Its
     *  intensity is not affected by incoming light.
     }
{* Reflection texture
     *
     * Contains the color of a perfect mirror reflection.
     * Rarely used, almost never for real-time applications.
     }
{* PBR Materials
     * PBR definitions from maya and other modelling packages now use this standard.
     * This was originally introduced around 2012.
     * Support for this is in game engines like Godot, Unreal or Unity3D.
     * Modelling packages which use this are very common now.
      }
{* PBR Material Modifiers
    * Some modern renderers have further PBR modifiers that may be overlaid
    * on top of the 'base' PBR materials for additional realism.
    * These use multiple texture maps, so only the base type is directly defined
     }
{* Sheen
    * Generally used to simulate textiles that are covered in a layer of microfibers
    * eg velvet
    * https://github.com/KhronosGroup/glTF/tree/master/extensions/2.0/Khronos/KHR_materials_sheen
     }
{* Clearcoat
    * Simulates a layer of 'polish' or 'lacquer' layered on top of a PBR substrate
    * https://autodesk.github.io/standard-surface/#closures/coating
    * https://github.com/KhronosGroup/glTF/tree/master/extensions/2.0/Khronos/KHR_materials_clearcoat
     }
{* Transmission
    * Simulates transmission through the surface
    * May include further information such as wall thickness
     }
{* Unknown texture
     *
     *  A texture reference that does not match any of the definitions
     *  above is considered to be 'unknown'. It is still imported,
     *  but is excluded from any further post-processing.
     }
{$ifndef SWIG}
{$endif}
type
  TaiTextureType =  Longint;
  Const
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
    _aiTextureType_Force32Bit = INT_MAX;

  AI_TEXTURE_TYPE_MAX = aiTextureType_TRANSMISSION;  
{ ------------------------------------------------------------------------------- }
{ Get a string for a given aiTextureType }
(* Const before type ignored *)

function aiTextureTypeToString(in:TaiTextureType):Pchar;cdecl;external;
{ --------------------------------------------------------------------------- }
{* @brief Defines all shading models supported by the library
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
  }
{* Flat shading. Shading is done on per-face base,
     *  diffuse only. Also known as 'faceted shading'.
      }
{* Simple Gouraud shading.
      }
{* Phong-Shading -
      }
{* Phong-Blinn-Shading
      }
{* Toon-Shading per pixel
     *
     *  Also known as 'comic' shader.
      }
{* OrenNayar-Shading per pixel
     *
     *  Extension to standard Lambertian shading, taking the
     *  roughness of the material into account
      }
{* Minnaert-Shading per pixel
     *
     *  Extension to standard Lambertian shading, taking the
     *  "darkness" of the material into account
      }
{* CookTorrance-Shading per pixel
     *
     *  Special shader for metallic surfaces.
      }
{* No shading at all. Constant light influence of 1.0.
    * Also known as "Unlit"
     }
{ Alias }
{* Fresnel shading
      }
{* Physically-Based Rendering (PBR) shading using
    * Bidirectional scattering/reflectance distribution function (BSDF/BRDF)
    * There are multiple methods under this banner, and model files may provide
    * data for more than one PBR-BRDF method.
    * Applications should use the set of provided properties to determine which
    * of their preferred PBR rendering methods are likely to be available
    * eg:
    * - If AI_MATKEY_METALLIC_FACTOR is set, then a Metallic/Roughness is available
    * - If AI_MATKEY_GLOSSINESS_FACTOR is set, then a Specular/Glossiness is available
    * Note that some PBR methods allow layering of techniques
     }
{$ifndef SWIG}
{$endif}
type
  TaiShadingMode =  Longint;
  Const
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
    _aiShadingMode_Force32Bit = INT_MAX;

{ --------------------------------------------------------------------------- }
{* @brief Defines some mixed flags for a particular texture.
 *
 *  Usually you'll instruct your cg artists how textures have to look like ...
 *  and how they will be processed in your application. However, if you use
 *  Assimp for completely generic loading purposes you might also need to
 *  process these flags in order to display as many 'unknown' 3D models as
 *  possible correctly.
 *
 *  This corresponds to the #AI_MATKEY_TEXFLAGS property.
 }
{* The texture's color values have to be inverted (component-wise 1-n)
      }
{* Explicit request to the application to process the alpha channel
     *  of the texture.
     *
     *  Mutually exclusive with #aiTextureFlags_IgnoreAlpha. These
     *  flags are set if the library can say for sure that the alpha
     *  channel is used/is not used. If the model format does not
     *  define this, it is left to the application to decide whether
     *  the texture alpha channel - if any - is evaluated or not.
      }
{* Explicit request to the application to ignore the alpha channel
     *  of the texture.
     *
     *  Mutually exclusive with #aiTextureFlags_UseAlpha.
      }
{$ifndef SWIG}
{$endif}
type
  TaiTextureFlags =  Longint;
  Const
    aiTextureFlags_Invert = $1;
    aiTextureFlags_UseAlpha = $2;
    aiTextureFlags_IgnoreAlpha = $4;
    _aiTextureFlags_Force32Bit = INT_MAX;

{ --------------------------------------------------------------------------- }
{* @brief Defines alpha-blend flags.
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
 }
{*
     *  Formula:
     *  @code
     *  SourceColor*SourceAlpha + DestColor*(1-SourceAlpha)
     *  @endcode
      }
{* Additive blending
     *
     *  Formula:
     *  @code
     *  SourceColor*1 + DestColor*1
     *  @endcode
      }
{ we don't need more for the moment, but we might need them }
{ in future versions ... }
{$ifndef SWIG}
{$endif}
type
  TaiBlendMode =  Longint;
  Const
    aiBlendMode_Default = $0;
    aiBlendMode_Additive = $1;
    _aiBlendMode_Force32Bit = INT_MAX;

{$include "./Compiler/pushpack1.h"}
{ --------------------------------------------------------------------------- }
{* @brief Defines how an UV channel is transformed.
 *
 *  This is just a helper structure for the #AI_MATKEY_UVTRANSFORM key.
 *  See its documentation for more details.
 *
 *  Typically you'll want to build a matrix of this information. However,
 *  we keep separate scaling/translation/rotation values to make it
 *  easier to process and optimize UV transformations internally.
  }
{* Translation on the u and v axes.
     *
     *  The default value is (0|0).
      }
{* Scaling on the u and v axes.
     *
     *  The default value is (1|1).
      }
{* Rotation - in counter-clockwise direction.
     *
     *  The rotation angle is specified in radians. The
     *  rotation center is 0.5f|0.5f. The default value
     *  0.f.
      }
type
  PaiUVTransform = ^TaiUVTransform;
  TaiUVTransform = record
      mTranslation : TaiVector2D;
      mScaling : TaiVector2D;
      mRotation : Tai_real;
    end;

{$include "./Compiler/poppack1.h"}
{! @cond AI_DOX_INCLUDE_INTERNAL }
{ --------------------------------------------------------------------------- }
{* @brief A very primitive RTTI system for the contents of material
 *  properties.
  }
{* Array of single-precision (32 Bit) floats
     *
     *  It is possible to use aiGetMaterialInteger[Array]() (or the C++-API
     *  aiMaterial::Get()) to query properties stored in floating-point format.
     *  The material system performs the type conversion automatically.
     }
{* Array of double-precision (64 Bit) floats
     *
     *  It is possible to use aiGetMaterialInteger[Array]() (or the C++-API
     *  aiMaterial::Get()) to query properties stored in floating-point format.
     *  The material system performs the type conversion automatically.
     }
{* The material property is an aiString.
     *
     *  Arrays of strings aren't possible, aiGetMaterialString() (or the
     *  C++-API aiMaterial::Get()) *must* be used to query a string property.
     }
{* Array of (32 Bit) integers
     *
     *  It is possible to use aiGetMaterialFloat[Array]() (or the C++-API
     *  aiMaterial::Get()) to query properties stored in integer format.
     *  The material system performs the type conversion automatically.
     }
{* Simple binary buffer, content undefined. Not convertible to anything.
     }
{* This value is not used. It is just there to force the
     *  compiler to map this enum to a 32 Bit integer.
      }
{$ifndef SWIG}
{$endif}
type
  TaiPropertyTypeInfo =  Longint;
  Const
    aiPTI_Float = $1;
    aiPTI_Double = $2;
    aiPTI_String = $3;
    aiPTI_Integer = $4;
    aiPTI_Buffer = $5;
    _aiPTI_Force32Bit = INT_MAX;

{ --------------------------------------------------------------------------- }
{* @brief Data structure for a single material property
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
  }
{* Specifies the name of the property (key)
     *  Keys are generally case insensitive.
      }
{* Textures: Specifies their exact usage semantic.
     * For non-texture properties, this member is always 0
     * (or, better-said, #aiTextureType_NONE).
      }
{* Textures: Specifies the index of the texture.
     *  For non-texture properties, this member is always 0.
      }
{* Size of the buffer mData is pointing to, in bytes.
     *  This value may not be 0.
      }
{* Type information for the property.
     *
     * Defines the data layout inside the data buffer. This is used
     * by the library internally to perform debug checks and to
     * utilize proper type conversions.
     * (It's probably a hacky solution, but it works.)
      }
{* Binary buffer to hold the property's value.
     * The size of the buffer is always mDataLength.
      }
type
  PaiMaterialProperty = ^TaiMaterialProperty;
  TaiMaterialProperty = record
      mKey : TaiString;
      mSemantic : dword;
      mIndex : dword;
      mDataLength : dword;
      mType : TaiPropertyTypeInfo;
      mData : Pchar;
    end;

{! @endcond }
{ --------------------------------------------------------------------------- }
{* @brief Data structure for a material
*
*  Material data is stored using a key-value structure. A single key-value
*  pair is called a 'material property'. C++ users should use the provided
*  member functions of aiMaterial to process material properties, C users
*  have to stick with the aiMaterialGetXXX family of unbound functions.
*  The library defines a set of standard keys (AI_MATKEY_XXX).
 }
{* List of all material properties loaded.  }
{* Number of properties in the data base  }
{* Storage allocated  }
  PaiMaterial = ^TaiMaterial;
  TaiMaterial = record
      mProperties : ^PaiMaterialProperty;
      mNumProperties : dword;
      mNumAllocated : dword;
    end;

{ Go back to extern "C" again }
{ C++ extern C conditionnal removed }
{ --------------------------------------------------------------------------- }
{ Pure key names for all texture-related properties }
{! @cond MATS_DOC_FULL }

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
{! @endcond }
{ --------------------------------------------------------------------------- }
{! @endcond }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function aiGetMaterialProperty(pMat:PaiMaterial; pKey:Pchar; _type:dword; index:dword; pPropOut:PPaiMaterialProperty):TaiReturn;cdecl;external;
{ --------------------------------------------------------------------------- }
{* @brief Retrieve an array of float values with a specific key
 *  from the material
 *
 * Pass one of the AI_MATKEY_XXX constants for the last three parameters (the
 * example reads the #AI_MATKEY_UVTRANSFORM property of the first diffuse texture)
 * @code
 * aiUVTransform trafo;
 * unsigned int max = sizeof(aiUVTransform);
 * if (AI_SUCCESS != aiGetMaterialFloatArray(mat, AI_MATKEY_UVTRANSFORM(aiTextureType_DIFFUSE,0),
 *    (float*)&trafo, &max) || sizeof(aiUVTransform) != max)
 * 
 *   // error handling
 * 
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
 *   arrays remains unmodified and pMax is set to 0. }
{ --------------------------------------------------------------------------- }
(* Const before type ignored *)
(* Const before type ignored *)
function aiGetMaterialFloatArray(pMat:PaiMaterial; pKey:Pchar; _type:dword; index:dword; pOut:Pai_real; 
           pMax:Pdword):TaiReturn;cdecl;external;
{*xxxxxxxx
// ---------------------------------------------------------------------------
inline aiReturn aiGetMaterialFloat(const  aiMaterial *pMat,
        const char *pKey,
        unsigned int type,
        unsigned int index,
        ai_real *pOut) 
    return aiGetMaterialFloatArray(pMat, pKey, type, index, pOut, (unsigned int *)0x0);

 }
{ --------------------------------------------------------------------------- }
{* @brief Retrieve an array of integer values with a specific key
 *  from a material
 *
 * See the sample for aiGetMaterialFloatArray for more information. }
(* Const before type ignored *)
(* Const before type ignored *)
function aiGetMaterialIntegerArray(pMat:PaiMaterial; pKey:Pchar; _type:dword; index:dword; pOut:Plongint; 
           pMax:Pdword):TaiReturn;cdecl;external;
{ --------------------------------------------------------------------------- }
{xxxxxxx
inline aiReturn aiGetMaterialInteger(const  aiMaterial *pMat,
        const char *pKey,
        unsigned int type,
        unsigned int index,
        int *pOut) 
    return aiGetMaterialIntegerArray(pMat, pKey, type, index, pOut, (unsigned int *)0x0);

 }
{ --------------------------------------------------------------------------- }
{* @brief Retrieve a color value from the material property table
*
* See the sample for aiGetMaterialFloat for more information }
{ --------------------------------------------------------------------------- }
(* Const before type ignored *)
(* Const before type ignored *)
function aiGetMaterialColor(pMat:PaiMaterial; pKey:Pchar; _type:dword; index:dword; pOut:PaiColor4D):TaiReturn;cdecl;external;
{ --------------------------------------------------------------------------- }
{* @brief Retrieve a aiUVTransform value from the material property table
*
* See the sample for aiGetMaterialFloat for more information }
{ --------------------------------------------------------------------------- }
(* Const before type ignored *)
(* Const before type ignored *)
function aiGetMaterialUVTransform(pMat:PaiMaterial; pKey:Pchar; _type:dword; index:dword; pOut:PaiUVTransform):TaiReturn;cdecl;external;
{ --------------------------------------------------------------------------- }
{* @brief Retrieve a string from the material property table
*
* See the sample for aiGetMaterialFloat for more information. }
{ --------------------------------------------------------------------------- }
(* Const before type ignored *)
(* Const before type ignored *)
function aiGetMaterialString(pMat:PaiMaterial; pKey:Pchar; _type:dword; index:dword; pOut:PaiString):TaiReturn;cdecl;external;
{ --------------------------------------------------------------------------- }
{* Get the number of textures for a particular texture type.
 *  @param[in] pMat Pointer to the input material. May not be NULL
 *  @param type Texture type to check for
 *  @return Number of textures for this type.
 *  @note A texture can be easily queried using #aiGetMaterialTexture()  }
{ --------------------------------------------------------------------------- }
(* Const before type ignored *)
function aiGetMaterialTextureCount(pMat:PaiMaterial; _type:TaiTextureType):dword;cdecl;external;
{ --------------------------------------------------------------------------- }
{* @brief Helper function to get all values pertaining to a particular
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
 *  @return AI_SUCCESS on success, otherwise something else. Have fun. }
{ --------------------------------------------------------------------------- }
(* Const before type ignored *)
{= NULL }{= NULL }{= NULL }{= NULL }{= NULL }{= NULL }function aiGetMaterialTexture(mat:PaiMaterial; _type:TaiTextureType; index:dword; path:PaiString; mapping:PaiTextureMapping; 
           uvindex:Pdword; blend:Pai_real; op:PaiTextureOp; mapmode:PaiTextureMapMode; flags:Pdword):TaiReturn;cdecl;external;
{ !#ifdef __cplusplus }
{!__cplusplus }
{$endif}
{!!AI_MATERIAL_H_INC }

implementation


end.
