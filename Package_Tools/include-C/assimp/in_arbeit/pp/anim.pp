
unit anim;
interface

{
  Automatically converted by H2Pas 1.0.0 from anim.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    anim.h
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
PaiAnimBehaviour  = ^aiAnimBehaviour;
PaiMeshAnim  = ^aiMeshAnim;
PaiMeshKey  = ^aiMeshKey;
PaiMeshMorphAnim  = ^aiMeshMorphAnim;
PaiMeshMorphKey  = ^aiMeshMorphKey;
PaiNodeAnim  = ^aiNodeAnim;
PaiQuatKey  = ^aiQuatKey;
PaiVectorKey  = ^aiVectorKey;
Pdouble  = ^double;
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
{*
  * @file   anim.h
  * @brief  Defines the data structures in which the imported animations
  *         are returned.
   }
(** unsupported pragma#pragma once*)
{$ifndef AI_ANIM_H_INC}
{$define AI_ANIM_H_INC}
{$ifdef __GNUC__}
(** unsupported pragma#pragma GCC system_header*)
{$endif}
{$include <assimp/quaternion.h>}
{$include <assimp/types.h>}
{ C++ extern C conditionnal removed }
{ --------------------------------------------------------------------------- }
{* A time-value pair specifying a certain 3D vector for the given time.  }
{* The time of this key  }
{* The value of this key  }
{ __cplusplus }
type
  PaiVectorKey = ^TaiVectorKey;
  TaiVectorKey = record
      mTime : Tdouble;
      mValue : TaiVector3D;
    end;

{ --------------------------------------------------------------------------- }
{* A time-value pair specifying a rotation for the given time.
 *  Rotations are expressed with quaternions.  }
{* The time of this key  }
{* The value of this key  }
  PaiQuatKey = ^TaiQuatKey;
  TaiQuatKey = record
      mTime : Tdouble;
      mValue : TaiQuaternion;
    end;

{ --------------------------------------------------------------------------- }
{* Binds a anim-mesh to a specific point in time.  }
{* The time of this key  }
{* Index into the aiMesh::mAnimMeshes array of the
     *  mesh corresponding to the #aiMeshAnim hosting this
     *  key frame. The referenced anim mesh is evaluated
     *  according to the rules defined in the docs for #aiAnimMesh. }
  PaiMeshKey = ^TaiMeshKey;
  TaiMeshKey = record
      mTime : Tdouble;
      mValue : dword;
    end;

{ --------------------------------------------------------------------------- }
{* Binds a morph anim mesh to a specific point in time.  }
{* The time of this key  }
{* The values and weights at the time of this key
     *   - mValues: index of attachment mesh to apply weight at the same position in mWeights
     *   - mWeights: weight to apply to the blend shape index at the same position in mValues
      }
{* The number of values and weights  }
  PaiMeshMorphKey = ^TaiMeshMorphKey;
  TaiMeshMorphKey = record
      mTime : Tdouble;
      mValues : Pdword;
      mWeights : Pdouble;
      mNumValuesAndWeights : dword;
    end;

{ --------------------------------------------------------------------------- }
{* Defines how an animation channel behaves outside the defined time
 *  range. This corresponds to aiNodeAnim::mPreState and
 *  aiNodeAnim::mPostState. }
{* The value from the default node transformation is taken }
{* The nearest key value is used without interpolation  }
{* The value of the nearest two keys is linearly
     *  extrapolated for the current time value. }
{* The animation is repeated.
     *
     *  If the animation key go from n to m and the current
     *  time is t, use the value at (t-n) % (|m-n|). }
{* This value is not used, it is just here to force the
     *  the compiler to map this enum to a 32 Bit integer   }
{$ifndef SWIG}
{$endif}
type
  TaiAnimBehaviour =  Longint;
  Const
    aiAnimBehaviour_DEFAULT = $0;
    aiAnimBehaviour_CONSTANT = $1;
    aiAnimBehaviour_LINEAR = $2;
    aiAnimBehaviour_REPEAT = $3;
    _aiAnimBehaviour_Force32Bit = INT_MAX;

{ --------------------------------------------------------------------------- }
{* Describes the animation of a single node. The name specifies the
 *  bone/node which is affected by this animation channel. The keyframes
 *  are given in three separate series of values, one each for position,
 *  rotation and scaling. The transformation matrix computed from these
 *  values replaces the node's original transformation matrix at a
 *  specific time.
 *  This means all keys are absolute and not relative to the bone default pose.
 *  The order in which the transformations are applied is
 *  - as usual - scaling, rotation, translation.
 *
 *  @note All keys are returned in their correct, chronological order.
 *  Duplicate keys don't pass the validation step. Most likely there
 *  will be no negative time values, but they are not forbidden also ( so
 *  implementations need to cope with them! )  }
{* The name of the node affected by this animation. The node
     *  must exist and it must be unique. }
{* The number of position keys  }
{* The position keys of this animation channel. Positions are
     * specified as 3D vector. The array is mNumPositionKeys in size.
     *
     * If there are position keys, there will also be at least one
     * scaling and one rotation key. }
{* The number of rotation keys  }
{* The rotation keys of this animation channel. Rotations are
     *  given as quaternions,  which are 4D vectors. The array is
     *  mNumRotationKeys in size.
     *
     * If there are rotation keys, there will also be at least one
     * scaling and one position key.  }
{* The number of scaling keys  }
{* The scaling keys of this animation channel. Scalings are
     *  specified as 3D vector. The array is mNumScalingKeys in size.
     *
     * If there are scaling keys, there will also be at least one
     * position and one rotation key. }
{* Defines how the animation behaves before the first
     *  key is encountered.
     *
     *  The default value is aiAnimBehaviour_DEFAULT (the original
     *  transformation matrix of the affected node is used). }
{* Defines how the animation behaves after the last
     *  key was processed.
     *
     *  The default value is aiAnimBehaviour_DEFAULT (the original
     *  transformation matrix of the affected node is taken). }
{ __cplusplus }
type
  PaiNodeAnim = ^TaiNodeAnim;
  TaiNodeAnim = record
      mNodeName : TaiString;
      mNumPositionKeys : dword;
      mPositionKeys : PaiVectorKey;
      mNumRotationKeys : dword;
      mRotationKeys : PaiQuatKey;
      mNumScalingKeys : dword;
      mScalingKeys : PaiVectorKey;
      mPreState : TaiAnimBehaviour;
      mPostState : TaiAnimBehaviour;
    end;

{ --------------------------------------------------------------------------- }
{* Describes vertex-based animations for a single mesh or a group of
 *  meshes. Meshes carry the animation data for each frame in their
 *  aiMesh::mAnimMeshes array. The purpose of aiMeshAnim is to
 *  define keyframes linking each mesh attachment to a particular
 *  point in time.  }
{* Name of the mesh to be animated. An empty string is not allowed,
     *  animated meshes need to be named (not necessarily uniquely,
     *  the name can basically serve as wild-card to select a group
     *  of meshes with similar animation setup) }
{* Size of the #mKeys array. Must be 1, at least.  }
{* Key frames of the animation. May not be nullptr.  }
  PaiMeshAnim = ^TaiMeshAnim;
  TaiMeshAnim = record
      mName : TaiString;
      mNumKeys : dword;
      mKeys : PaiMeshKey;
    end;

{ --------------------------------------------------------------------------- }
{* Describes a morphing animation of a given mesh.  }
{* Name of the mesh to be animated. An empty string is not allowed,
     *  animated meshes need to be named (not necessarily uniquely,
     *  the name can basically serve as wildcard to select a group
     *  of meshes with similar animation setup) }
{* Size of the #mKeys array. Must be 1, at least.  }
{* Key frames of the animation. May not be nullptr.  }
  PaiMeshMorphAnim = ^TaiMeshMorphAnim;
  TaiMeshMorphAnim = record
      mName : TaiString;
      mNumKeys : dword;
      mKeys : PaiMeshMorphKey;
    end;

{ --------------------------------------------------------------------------- }
{* An animation consists of key-frame data for a number of nodes. For
 *  each node affected by the animation a separate series of data is given. }
{* The name of the animation. If the modeling package this data was
     *  exported from does support only a single animation channel, this
     *  name is usually empty (length is zero).  }
{* Duration of the animation in ticks.   }
{* Ticks per second. 0 if not specified in the imported file  }
{* The number of bone animation channels. Each channel affects
     *  a single node.  }
{* The node animation channels. Each channel affects a single node.
     *  The array is mNumChannels in size.  }
{* The number of mesh animation channels. Each channel affects
     *  a single mesh and defines vertex-based animation.  }
{* The mesh animation channels. Each channel affects a single mesh.
     *  The array is mNumMeshChannels in size.  }
{* The number of mesh animation channels. Each channel affects
     *  a single mesh and defines morphing animation.  }
{* The morph mesh animation channels. Each channel affects a single mesh.
     *  The array is mNumMorphMeshChannels in size.  }
{ __cplusplus }
  PaiAnimation = ^TaiAnimation;
  TaiAnimation = record
      mName : TaiString;
      mDuration : Tdouble;
      mTicksPerSecond : Tdouble;
      mNumChannels : dword;
      mChannels : ^PaiNodeAnim;
      mNumMeshChannels : dword;
      mMeshChannels : ^PaiMeshAnim;
      mNumMorphMeshChannels : dword;
      mMorphMeshChannels : ^PaiMeshMorphAnim;
    end;

{ __cplusplus }
{$endif}
{ AI_ANIM_H_INC }

implementation


end.
