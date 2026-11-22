
unit scene;
interface

{
  Automatically converted by H2Pas 1.0.0 from scene.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    scene.h
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
PaiAnimation  = ^aiAnimation;
PaiCamera  = ^aiCamera;
PaiLight  = ^aiLight;
PaiMaterial  = ^aiMaterial;
PaiMesh  = ^aiMesh;
PaiMetadata  = ^aiMetadata;
PaiNode  = ^aiNode;
PaiScene  = ^aiScene;
PaiSkeleton  = ^aiSkeleton;
PaiTexture  = ^aiTexture;
Pchar  = ^char;
Pdword  = ^dword;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
---------------------------------------------------------------------------
Open Asset Import Library (assimp)
---------------------------------------------------------------------------

Copyright (c) 2006-2022, assimp team

All rights reserved.

Redistribution and use of this software in source and binary forms,
with or without modification, are permitted provided that the following
conditions are met:

* Redistributions of source code must retain the above
  copyright notice, this list of conditions and the
  following disclaimer.

* Redistributions in binary form must reproduce the above
  copyright notice, this list of conditions and the
  following disclaimer in the documentation and/or other
  materials provided with the distribution.

* Neither the name of the assimp team, nor the names of its
  contributors may be used to endorse or promote products
  derived from this software without specific prior
  written permission of the assimp team.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
---------------------------------------------------------------------------
 }
{* @file scene.h
 *  @brief Defines the data structures in which the imported scene is returned.
  }
(** unsupported pragma#pragma once*)
{$ifndef AI_SCENE_H_INC}
{$define AI_SCENE_H_INC}
{$ifdef __GNUC__}
(** unsupported pragma#pragma GCC system_header*)
{$endif}
{$include <assimp/types.h>}
{$include <assimp/texture.h>}
{$include <assimp/mesh.h>}
{$include <assimp/light.h>}
{$include <assimp/camera.h>}
{$include <assimp/material.h>}
{$include <assimp/anim.h>}
{$include <assimp/metadata.h>}
{$ifdef __GNUC__}
(** unsupported pragma#pragma GCC diagnostic push*)
(** unsupported pragma#pragma GCC diagnostic ignored "-Wattributes"*)
{$endif}
{ ------------------------------------------------------------------------------- }
{*
 * A node in the imported hierarchy.
 *
 * Each node has name, a parent node (except for the root node),
 * a transformation relative to its parent and possibly several child nodes.
 * Simple file formats don't support hierarchical structures - for these formats
 * the imported scene does consist of only a single root node without children.
  }
{ ------------------------------------------------------------------------------- }
{* The name of the node.
     *
     * The name might be empty (length of zero) but all nodes which
     * need to be referenced by either bones or animations are named.
     * Multiple nodes may have the same name, except for nodes which are referenced
     * by bones (see #aiBone and #aiMesh::mBones). Their names *must* be unique.
     *
     * Cameras and lights reference a specific node by name - if there
     * are multiple nodes with this name, they are assigned to each of them.
     * <br>
     * There are no limitations with regard to the characters contained in
     * the name string as it is usually taken directly from the source file.
     *
     * Implementations should be able to handle tokens such as whitespace, tabs,
     * line feeds, quotation marks, ampersands etc.
     *
     * Sometimes assimp introduces new nodes not present in the source file
     * into the hierarchy (usually out of necessity because sometimes the
     * source hierarchy format is simply not compatible). Their names are
     * surrounded by @verbatim <> @endverbatim e.g.
     *  @verbatim<DummyRootNode> @endverbatim.
      }
{* The transformation relative to the node's parent.  }
{* Parent node. nullptr if this node is the root node.  }
{* The number of child nodes of this node.  }
{* The child nodes of this node. nullptr if mNumChildren is 0.  }
{* The number of meshes of this node.  }
{* The meshes of this node. Each entry is an index into the
      * mesh list of the #aiScene.
       }
{* Metadata associated with this node or nullptr if there is no metadata.
      *  Whether any metadata is generated depends on the source file format. See the
      * @link importer_notes @endlink page for more information on every source file
      * format. Importers that don't document any metadata don't write any.
       }
{ __cplusplus }
type
  PaiNode = ^TaiNode;
  TaiNode = record
      mName : TaiString;
      mTransformation : TaiMatrix4x4;
      mParent : PaiNode;
      mNumChildren : dword;
      mChildren : ^PaiNode;
      mNumMeshes : dword;
      mMeshes : Pdword;
      mMetaData : PaiMetadata;
    end;

{$ifdef __GNUC__}
(** unsupported pragma#pragma GCC diagnostic pop*)
{$endif}
{ ------------------------------------------------------------------------------- }
{*
 * Specifies that the scene data structure that was imported is not complete.
 * This flag bypasses some internal validations and allows the import
 * of animation skeletons, material libraries or camera animation paths
 * using Assimp. Most applications won't support such data.
  }

const
  AI_SCENE_FLAGS_INCOMPLETE = $1;  
{*
 * This flag is set by the validation postprocess-step (aiPostProcess_ValidateDS)
 * if the validation is successful. In a validated scene you can be sure that
 * any cross references in the data structure (e.g. vertex indices) are valid.
  }
  AI_SCENE_FLAGS_VALIDATED = $2;  
{*
 * This flag is set by the validation postprocess-step (aiPostProcess_ValidateDS)
 * if the validation is successful but some issues have been found.
 * This can for example mean that a texture that does not exist is referenced
 * by a material or that the bone weights for a vertex don't sum to 1.0 ... .
 * In most cases you should still be able to use the import. This flag could
 * be useful for applications which don't capture Assimp's log output.
  }
  AI_SCENE_FLAGS_VALIDATION_WARNING = $4;  
{*
 * This flag is currently only set by the aiProcess_JoinIdenticalVertices step.
 * It indicates that the vertices of the output meshes aren't in the internal
 * verbose format anymore. In the verbose format all vertices are unique,
 * no vertex is ever referenced by more than one face.
  }
  AI_SCENE_FLAGS_NON_VERBOSE_FORMAT = $8;  
{*
 * Denotes pure height-map terrain data. Pure terrains usually consist of quads,
 * sometimes triangles, in a regular grid. The x,y coordinates of all vertex
 * positions refer to the x,y coordinates on the terrain height map, the z-axis
 * stores the elevation at a specific point.
 *
 * TER (Terragen) and HMP (3D Game Studio) are height map formats.
 * @note Assimp is probably not the best choice for loading *huge* terrains -
 * fully triangulated data takes extremely much free store and should be avoided
 * as long as possible (typically you'll do the triangulation when you actually
 * need to render it).
  }
  AI_SCENE_FLAGS_TERRAIN = $10;  
{*
 * Specifies that the scene data can be shared between structures. For example:
 * one vertex in few faces. \ref AI_SCENE_FLAGS_NON_VERBOSE_FORMAT can not be
 * used for this because \ref AI_SCENE_FLAGS_NON_VERBOSE_FORMAT has internal
 * meaning about postprocessing steps.
  }
  AI_SCENE_FLAGS_ALLOW_SHARED = $20;  
{ ------------------------------------------------------------------------------- }
{* The root structure of the imported data.
 *
 *  Everything that was imported from the given file can be accessed from here.
 *  Objects of this class are generally maintained and owned by Assimp, not
 *  by the caller. You shouldn't want to instance it, nor should you ever try to
 *  delete a given scene on your own.
  }
{ ------------------------------------------------------------------------------- }
{* Any combination of the AI_SCENE_FLAGS_XXX flags. By default
    * this value is 0, no flags are set. Most applications will
    * want to reject all scenes with the AI_SCENE_FLAGS_INCOMPLETE
    * bit set.
     }
{* The root node of the hierarchy.
    *
    * There will always be at least the root node if the import
    * was successful (and no special flags have been set).
    * Presence of further nodes depends on the format and content
    * of the imported file.
     }
{* The number of meshes in the scene.  }
{* The array of meshes.
    *
    * Use the indices given in the aiNode structure to access
    * this array. The array is mNumMeshes in size. If the
    * AI_SCENE_FLAGS_INCOMPLETE flag is not set there will always
    * be at least ONE material.
     }
{* The number of materials in the scene.  }
{* The array of materials.
    *
    * Use the index given in each aiMesh structure to access this
    * array. The array is mNumMaterials in size. If the
    * AI_SCENE_FLAGS_INCOMPLETE flag is not set there will always
    * be at least ONE material.
     }
{* The number of animations in the scene.  }
{* The array of animations.
    *
    * All animations imported from the given file are listed here.
    * The array is mNumAnimations in size.
     }
{* The number of textures embedded into the file  }
{* The array of embedded textures.
    *
    * Not many file formats embed their textures into the file.
    * An example is Quake's MDL format (which is also used by
    * some GameStudio versions)
     }
{* The number of light sources in the scene. Light sources
    * are fully optional, in most cases this attribute will be 0
         }
{* The array of light sources.
    *
    * All light sources imported from the given file are
    * listed here. The array is mNumLights in size.
     }
{* The number of cameras in the scene. Cameras
    * are fully optional, in most cases this attribute will be 0
         }
{* The array of cameras.
    *
    * All cameras imported from the given file are listed here.
    * The array is mNumCameras in size. The first camera in the
    * array (if existing) is the default camera view into
    * the scene.
     }
{*
     *  @brief  The global metadata assigned to the scene itself.
     *
     *  This data contains global metadata which belongs to the scene like
     *  unit-conversions, versions, vendors or other model-specific data. This
     *  can be used to store format-specific metadata as well.
      }
{* The name of the scene itself.
      }
{*
     *
      }
{*
     *
      }
{ __cplusplus }
{*  Internal data, do not touch  }
type
  PaiScene = ^TaiScene;
  TaiScene = record
      mFlags : dword;
      mRootNode : PaiNode;
      mNumMeshes : dword;
      mMeshes : ^PaiMesh;
      mNumMaterials : dword;
      mMaterials : ^PaiMaterial;
      mNumAnimations : dword;
      mAnimations : ^PaiAnimation;
      mNumTextures : dword;
      mTextures : ^PaiTexture;
      mNumLights : dword;
      mLights : ^PaiLight;
      mNumCameras : dword;
      mCameras : ^PaiCamera;
      mMetaData : PaiMetadata;
      mName : TaiString;
      mNumSkeletons : dword;
      mSkeletons : ^PaiSkeleton;
      mPrivate : Pchar;
    end;

{ C++ end of extern C conditionnal removed }
{! extern "C" }
{$endif}
{ AI_SCENE_H_INC }

implementation


end.
