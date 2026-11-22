unit cimport;

interface

uses
  fp_mb;

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
{* @file  cimport.h
 *  @brief Defines the C-API to the Open Asset Import Library.
  }
(** unsupported pragma#pragma once*)
{$ifndef AI_ASSIMP_H_INC}
{$define AI_ASSIMP_H_INC}
{$ifdef __GNUC__}
(** unsupported pragma#pragma GCC system_header*)
{$endif}
{$include <assimp/importerdesc.h>}
{$include <assimp/types.h>}
{ C++ extern C conditionnal removed }
type
  PaiScene = ^TaiScene;
  TaiScene = record
      {undefined structure}
    end;

  PaiFileIO = ^TaiFileIO;
  TaiFileIO = record
      {undefined structure}
    end;

{ message  }{ user  }
  TaiLogStreamCallback = procedure (para1:Pchar; para2:Pchar);cdecl;
{ -------------------------------------------------------------------------------- }
{* C-API: Represents a log stream. A log stream receives all log messages and
 *  streams them _somewhere_.
 *  @see aiGetPredefinedLogStream
 *  @see aiAttachLogStream
 *  @see aiDetachLogStream  }
{ -------------------------------------------------------------------------------- }
{* callback to be called  }
{* user data to be passed to the callback  }
  PaiLogStream = ^TaiLogStream;
  TaiLogStream = record
      callback : TaiLogStreamCallback;cdecl;
      user : Pchar;
    end;

{ -------------------------------------------------------------------------------- }
{* C-API: Represents an opaque set of settings to be used during importing.
 *  @see aiCreatePropertyStore
 *  @see aiReleasePropertyStore
 *  @see aiImportFileExWithProperties
 *  @see aiSetPropertyInteger
 *  @see aiSetPropertyFloat
 *  @see aiSetPropertyString
 *  @see aiSetPropertyMatrix
  }
{ -------------------------------------------------------------------------------- }
  PaiPropertyStore = ^TaiPropertyStore;
  TaiPropertyStore = record
      sentinel : char;
    end;

{* Our own C boolean type  }

  PaiBool = ^TaiBool;
  TaiBool = longint;

const
  AI_FALSE = 0;  
  AI_TRUE = 1;  
{ -------------------------------------------------------------------------------- }
{* Reads the given file and returns its content.
 *
 * If the call succeeds, the imported data is returned in an aiScene structure.
 * The data is intended to be read-only, it stays property of the ASSIMP
 * library and will be stable until aiReleaseImport() is called. After you're
 * done with it, call aiReleaseImport() to free the resources associated with
 * this file. If the import fails, NULL is returned instead. Call
 * aiGetErrorString() to retrieve a human-readable error text.
 * @param pFile Path and filename of the file to be imported,
 *   expected to be a null-terminated c-string. NULL is not a valid value.
 * @param pFlags Optional post processing steps to be executed after
 *   a successful import. Provide a bitwise combination of the
 *   #aiPostProcessSteps flags.
 * @return Pointer to the imported data or NULL if the import failed.
  }

function aiImportFile(pFile:Pchar; pFlags:dword):PaiScene;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Reads the given file using user-defined I/O functions and returns
 *   its content.
 *
 * If the call succeeds, the imported data is returned in an aiScene structure.
 * The data is intended to be read-only, it stays property of the ASSIMP
 * library and will be stable until aiReleaseImport() is called. After you're
 * done with it, call aiReleaseImport() to free the resources associated with
 * this file. If the import fails, NULL is returned instead. Call
 * aiGetErrorString() to retrieve a human-readable error text.
 * @param pFile Path and filename of the file to be imported,
 *   expected to be a null-terminated c-string. NULL is not a valid value.
 * @param pFlags Optional post processing steps to be executed after
 *   a successful import. Provide a bitwise combination of the
 *   #aiPostProcessSteps flags.
 * @param pFS aiFileIO structure. Will be used to open the model file itself
 *   and any other files the loader needs to open.  Pass NULL to use the default
 *   implementation.
 * @return Pointer to the imported data or NULL if the import failed.
 * @note Include <aiFileIO.h> for the definition of #aiFileIO.
  }
function aiImportFileEx(pFile:Pchar; pFlags:dword; pFS:PaiFileIO):PaiScene;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Same as #aiImportFileEx, but adds an extra parameter containing importer settings.
 *
 * @param pFile Path and filename of the file to be imported,
 *   expected to be a null-terminated c-string. NULL is not a valid value.
 * @param pFlags Optional post processing steps to be executed after
 *   a successful import. Provide a bitwise combination of the
 *   #aiPostProcessSteps flags.
 * @param pFS aiFileIO structure. Will be used to open the model file itself
 *   and any other files the loader needs to open.  Pass NULL to use the default
 *   implementation.
 * @param pProps #aiPropertyStore instance containing import settings.
 * @return Pointer to the imported data or NULL if the import failed.
 * @note Include <aiFileIO.h> for the definition of #aiFileIO.
 * @see aiImportFileEx
  }
function aiImportFileExWithProperties(pFile:Pchar; pFlags:dword; pFS:PaiFileIO; pProps:PaiPropertyStore):PaiScene;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Reads the given file from a given memory buffer,
 *
 * If the call succeeds, the contents of the file are returned as a pointer to an
 * aiScene object. The returned data is intended to be read-only, the importer keeps
 * ownership of the data and will destroy it upon destruction. If the import fails,
 * NULL is returned.
 * A human-readable error description can be retrieved by calling aiGetErrorString().
 * @param pBuffer Pointer to the file data
 * @param pLength Length of pBuffer, in bytes
 * @param pFlags Optional post processing steps to be executed after
 *   a successful import. Provide a bitwise combination of the
 *   #aiPostProcessSteps flags. If you wish to inspect the imported
 *   scene first in order to fine-tune your post-processing setup,
 *   consider to use #aiApplyPostProcessing().
 * @param pHint An additional hint to the library. If this is a non empty string,
 *   the library looks for a loader to support the file extension specified by pHint
 *   and passes the file to the first matching loader. If this loader is unable to
 *   completely the request, the library continues and tries to determine the file
 *   format on its own, a task that may or may not be successful.
 *   Check the return value, and you'll know ...
 * @return A pointer to the imported data, NULL if the import failed.
 *
 * @note This is a straightforward way to decode models from memory
 * buffers, but it doesn't handle model formats that spread their
 * data across multiple files or even directories. Examples include
 * OBJ or MD3, which outsource parts of their material info into
 * external scripts. If you need full functionality, provide
 * a custom IOSystem to make Assimp find these files and use
 * the regular aiImportFileEx()/aiImportFileExWithProperties() API.
  }
function aiImportFileFromMemory(pBuffer:Pchar; pLength:dword; pFlags:dword; pHint:Pchar):PaiScene;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Same as #aiImportFileFromMemory, but adds an extra parameter containing importer settings.
 *
 * @param pBuffer Pointer to the file data
 * @param pLength Length of pBuffer, in bytes
 * @param pFlags Optional post processing steps to be executed after
 *   a successful import. Provide a bitwise combination of the
 *   #aiPostProcessSteps flags. If you wish to inspect the imported
 *   scene first in order to fine-tune your post-processing setup,
 *   consider to use #aiApplyPostProcessing().
 * @param pHint An additional hint to the library. If this is a non empty string,
 *   the library looks for a loader to support the file extension specified by pHint
 *   and passes the file to the first matching loader. If this loader is unable to
 *   completely the request, the library continues and tries to determine the file
 *   format on its own, a task that may or may not be successful.
 *   Check the return value, and you'll know ...
 * @param pProps #aiPropertyStore instance containing import settings.
 * @return A pointer to the imported data, NULL if the import failed.
 *
 * @note This is a straightforward way to decode models from memory
 * buffers, but it doesn't handle model formats that spread their
 * data across multiple files or even directories. Examples include
 * OBJ or MD3, which outsource parts of their material info into
 * external scripts. If you need full functionality, provide
 * a custom IOSystem to make Assimp find these files and use
 * the regular aiImportFileEx()/aiImportFileExWithProperties() API.
 * @see aiImportFileFromMemory
  }
function aiImportFileFromMemoryWithProperties(pBuffer:Pchar; pLength:dword; pFlags:dword; pHint:Pchar; pProps:PaiPropertyStore):PaiScene;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Apply post-processing to an already-imported scene.
 *
 * This is strictly equivalent to calling #aiImportFile()/#aiImportFileEx with the
 * same flags. However, you can use this separate function to inspect the imported
 * scene first to fine-tune your post-processing setup.
 * @param pScene Scene to work on.
 * @param pFlags Provide a bitwise combination of the #aiPostProcessSteps flags.
 * @return A pointer to the post-processed data. Post processing is done in-place,
 *   meaning this is still the same #aiScene which you passed for pScene. However,
 *   _if_ post-processing failed, the scene could now be NULL. That's quite a rare
 *   case, post processing steps are not really designed to 'fail'. To be exact,
 *   the #aiProcess_ValidateDataStructure flag is currently the only post processing step
 *   which can actually cause the scene to be reset to NULL.
  }
function aiApplyPostProcessing(pScene:PaiScene; pFlags:dword):PaiScene;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get one of the predefine log streams. This is the quick'n'easy solution to
 *  access Assimp's log system. Attaching a log stream can slightly reduce Assimp's
 *  overall import performance.
 *
 *  Usage is rather simple (this will stream the log to a file, named log.txt, and
 *  the stdout stream of the process:
 *  @code
 *    struct aiLogStream c;
 *    c = aiGetPredefinedLogStream(aiDefaultLogStream_FILE,"log.txt");
 *    aiAttachLogStream(&c);
 *    c = aiGetPredefinedLogStream(aiDefaultLogStream_STDOUT,NULL);
 *    aiAttachLogStream(&c);
 *  @endcode
 *
 *  @param pStreams One of the #aiDefaultLogStream enumerated values.
 *  @param file Solely for the #aiDefaultLogStream_FILE flag: specifies the file to write to.
 *    Pass NULL for all other flags.
 *  @return The log stream. callback is set to NULL if something went wrong.
  }
function aiGetPredefinedLogStream(pStreams:TaiDefaultLogStream; file:Pchar):TaiLogStream;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Attach a custom log stream to the libraries' logging system.
 *
 *  Attaching a log stream can slightly reduce Assimp's overall import
 *  performance. Multiple log-streams can be attached.
 *  @param stream Describes the new log stream.
 *  @note To ensure proper destruction of the logging system, you need to manually
 *    call aiDetachLogStream() on every single log stream you attach.
 *    Alternatively (for the lazy folks) #aiDetachAllLogStreams is provided.
  }
procedure aiAttachLogStream(stream:PaiLogStream);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Enable verbose logging. Verbose logging includes debug-related stuff and
 *  detailed import statistics. This can have severe impact on import performance
 *  and memory consumption. However, it might be useful to find out why a file
 *  didn't read correctly.
 *  @param d AI_TRUE or AI_FALSE, your decision.
  }
procedure aiEnableVerboseLogging(d:TaiBool);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Detach a custom log stream from the libraries' logging system.
 *
 *  This is the counterpart of #aiAttachLogStream. If you attached a stream,
 *  don't forget to detach it again.
 *  @param stream The log stream to be detached.
 *  @return AI_SUCCESS if the log stream has been detached successfully.
 *  @see aiDetachAllLogStreams
  }
function aiDetachLogStream(stream:PaiLogStream):TaiReturn;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Detach all active log streams from the libraries' logging system.
 *  This ensures that the logging system is terminated properly and all
 *  resources allocated by it are actually freed. If you attached a stream,
 *  don't forget to detach it again.
 *  @see aiAttachLogStream
 *  @see aiDetachLogStream
  }
procedure aiDetachAllLogStreams;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Releases all resources associated with the given import process.
 *
 * Call this function after you're done with the imported data.
 * @param pScene The imported data to release. NULL is a valid value.
  }
procedure aiReleaseImport(pScene:PaiScene);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Returns the error text of the last failed import process.
 *
 * @return A textual description of the error that occurred at the last
 * import process. NULL if there was no error. There can't be an error if you
 * got a non-NULL #aiScene from #aiImportFile/#aiImportFileEx/#aiApplyPostProcessing.
  }
function aiGetErrorString:Pchar;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Returns whether a given file extension is supported by ASSIMP
 *
 * @param szExtension Extension for which the function queries support for.
 * Must include a leading dot '.'. Example: ".3ds", ".md3"
 * @return AI_TRUE if the file extension is supported.
  }
function aiIsExtensionSupported(szExtension:Pchar):TaiBool;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get a list of all file extensions supported by ASSIMP.
 *
 * If a file extension is contained in the list this does, of course, not
 * mean that ASSIMP is able to load all files with this extension.
 * @param szOut String to receive the extension list.
 * Format of the list: "*.3ds;*.obj;*.dae". NULL is not a valid parameter.
  }
procedure aiGetExtensionList(szOut:PaiString);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get the approximated storage required by an imported asset
 * @param pIn Input asset.
 * @param in Data structure to be filled.
  }
procedure aiGetMemoryRequirements(pIn:PaiScene; in:PaiMemoryInfo);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Create an empty property store. Property stores are used to collect import
 *  settings.
 * @return New property store. Property stores need to be manually destroyed using
 *   the #aiReleasePropertyStore API function.
  }
function aiCreatePropertyStore:PaiPropertyStore;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Delete a property store.
 * @param p Property store to be deleted.
  }
procedure aiReleasePropertyStore(p:PaiPropertyStore);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Set an integer property.
 *
 *  This is the C-version of #Assimp::Importer::SetPropertyInteger(). In the C
 *  interface, properties are always shared by all imports. It is not possible to
 *  specify them per import.
 *
 * @param store Store to modify. Use #aiCreatePropertyStore to obtain a store.
 * @param szName Name of the configuration property to be set. All supported
 *   public properties are defined in the config.h header file (AI_CONFIG_XXX).
 * @param value New value for the property
  }
procedure aiSetImportPropertyInteger(store:PaiPropertyStore; szName:Pchar; value:longint);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Set a floating-point property.
 *
 *  This is the C-version of #Assimp::Importer::SetPropertyFloat(). In the C
 *  interface, properties are always shared by all imports. It is not possible to
 *  specify them per import.
 *
 * @param store Store to modify. Use #aiCreatePropertyStore to obtain a store.
 * @param szName Name of the configuration property to be set. All supported
 *   public properties are defined in the config.h header file (AI_CONFIG_XXX).
 * @param value New value for the property
  }
procedure aiSetImportPropertyFloat(store:PaiPropertyStore; szName:Pchar; value:Tai_real);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Set a string property.
 *
 *  This is the C-version of #Assimp::Importer::SetPropertyString(). In the C
 *  interface, properties are always shared by all imports. It is not possible to
 *  specify them per import.
 *
 * @param store Store to modify. Use #aiCreatePropertyStore to obtain a store.
 * @param szName Name of the configuration property to be set. All supported
 *   public properties are defined in the config.h header file (AI_CONFIG_XXX).
 * @param st New value for the property
  }
procedure aiSetImportPropertyString(store:PaiPropertyStore; szName:Pchar; st:PaiString);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Set a matrix property.
 *
 *  This is the C-version of #Assimp::Importer::SetPropertyMatrix(). In the C
 *  interface, properties are always shared by all imports. It is not possible to
 *  specify them per import.
 *
 * @param store Store to modify. Use #aiCreatePropertyStore to obtain a store.
 * @param szName Name of the configuration property to be set. All supported
 *   public properties are defined in the config.h header file (AI_CONFIG_XXX).
 * @param mat New value for the property
  }
procedure aiSetImportPropertyMatrix(store:PaiPropertyStore; szName:Pchar; mat:PaiMatrix4x4);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Construct a quaternion from a 3x3 rotation matrix.
 *  @param quat Receives the output quaternion.
 *  @param mat Matrix to 'quaternionize'.
 *  @see aiQuaternion(const aiMatrix3x3& pRotMatrix)
  }
procedure aiCreateQuaternionFromMatrix(quat:PaiQuaternion; mat:PaiMatrix3x3);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Decompose a transformation matrix into its rotational, translational and
 *  scaling components.
 *
 * @param mat Matrix to decompose
 * @param scaling Receives the scaling component
 * @param rotation Receives the rotational component
 * @param position Receives the translational component.
 * @see aiMatrix4x4::Decompose (aiVector3D&, aiQuaternion&, aiVector3D&) const;
  }
procedure aiDecomposeMatrix(mat:PaiMatrix4x4; scaling:PaiVector3D; rotation:PaiQuaternion; position:PaiVector3D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Transpose a 4x4 matrix.
 *  @param mat Pointer to the matrix to be transposed
  }
procedure aiTransposeMatrix4(mat:PaiMatrix4x4);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Transpose a 3x3 matrix.
 *  @param mat Pointer to the matrix to be transposed
  }
procedure aiTransposeMatrix3(mat:PaiMatrix3x3);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Transform a vector by a 3x3 matrix
 *  @param vec Vector to be transformed.
 *  @param mat Matrix to transform the vector with.
  }
procedure aiTransformVecByMatrix3(vec:PaiVector3D; mat:PaiMatrix3x3);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Transform a vector by a 4x4 matrix
 *  @param vec Vector to be transformed.
 *  @param mat Matrix to transform the vector with.
  }
procedure aiTransformVecByMatrix4(vec:PaiVector3D; mat:PaiMatrix4x4);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Multiply two 4x4 matrices.
 *  @param dst First factor, receives result.
 *  @param src Matrix to be multiplied with 'dst'.
  }
procedure aiMultiplyMatrix4(dst:PaiMatrix4x4; src:PaiMatrix4x4);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Multiply two 3x3 matrices.
 *  @param dst First factor, receives result.
 *  @param src Matrix to be multiplied with 'dst'.
  }
procedure aiMultiplyMatrix3(dst:PaiMatrix3x3; src:PaiMatrix3x3);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get a 3x3 identity matrix.
 *  @param mat Matrix to receive its personal identity
  }
procedure aiIdentityMatrix3(mat:PaiMatrix3x3);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get a 4x4 identity matrix.
 *  @param mat Matrix to receive its personal identity
  }
procedure aiIdentityMatrix4(mat:PaiMatrix4x4);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Returns the number of import file formats available in the current Assimp build.
 * Use aiGetImportFormatDescription() to retrieve infos of a specific import format.
  }
function aiGetImportFormatCount:Tsize_t;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Returns a description of the nth import file format. Use #aiGetImportFormatCount()
 * to learn how many import formats are supported.
 * @param pIndex Index of the import format to retrieve information for. Valid range is
 *    0 to #aiGetImportFormatCount()
 * @return A description of that specific import format. NULL if pIndex is out of range.
  }
function aiGetImportFormatDescription(pIndex:Tsize_t):PaiImporterDesc;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Check if 2D vectors are equal.
 *  @param a First vector to compare
 *  @param b Second vector to compare
 *  @return 1 if the vectors are equal
 *  @return 0 if the vectors are not equal
  }
function aiVector2AreEqual(a:PaiVector2D; b:PaiVector2D):longint;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Check if 2D vectors are equal using epsilon.
 *  @param a First vector to compare
 *  @param b Second vector to compare
 *  @param epsilon Epsilon
 *  @return 1 if the vectors are equal
 *  @return 0 if the vectors are not equal
  }
function aiVector2AreEqualEpsilon(a:PaiVector2D; b:PaiVector2D; epsilon:single):longint;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Add 2D vectors.
 *  @param dst First addend, receives result.
 *  @param src Vector to be added to 'dst'.
  }
procedure aiVector2Add(dst:PaiVector2D; src:PaiVector2D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Subtract 2D vectors.
 *  @param dst Minuend, receives result.
 *  @param src Vector to be subtracted from 'dst'.
  }
procedure aiVector2Subtract(dst:PaiVector2D; src:PaiVector2D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Multiply a 2D vector by a scalar.
 *  @param dst Vector to be scaled by \p s
 *  @param s Scale factor
  }
procedure aiVector2Scale(dst:PaiVector2D; s:single);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Multiply each component of a 2D vector with
 *  the components of another vector.
 *  @param dst First vector, receives result
 *  @param other Second vector
  }
procedure aiVector2SymMul(dst:PaiVector2D; other:PaiVector2D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Divide a 2D vector by a scalar.
 *  @param dst Vector to be divided by \p s
 *  @param s Scalar divisor
  }
procedure aiVector2DivideByScalar(dst:PaiVector2D; s:single);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Divide each component of a 2D vector by
 *  the components of another vector.
 *  @param dst Vector as the dividend
 *  @param v Vector as the divisor
  }
procedure aiVector2DivideByVector(dst:PaiVector2D; v:PaiVector2D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get the length of a 2D vector.
 *  @return v Vector to evaluate
  }
function aiVector2Length(v:PaiVector2D):single;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get the squared length of a 2D vector.
 *  @return v Vector to evaluate
  }
function aiVector2SquareLength(v:PaiVector2D):single;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Negate a 2D vector.
 *  @param dst Vector to be negated
  }
procedure aiVector2Negate(dst:PaiVector2D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get the dot product of 2D vectors.
 *  @param a First vector
 *  @param b Second vector
 *  @return The dot product of vectors
  }
function aiVector2DotProduct(a:PaiVector2D; b:PaiVector2D):single;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Normalize a 2D vector.
 *  @param v Vector to normalize
  }
procedure aiVector2Normalize(v:PaiVector2D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Check if 3D vectors are equal.
 *  @param a First vector to compare
 *  @param b Second vector to compare
 *  @return 1 if the vectors are equal
 *  @return 0 if the vectors are not equal
  }
function aiVector3AreEqual(a:PaiVector3D; b:PaiVector3D):longint;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Check if 3D vectors are equal using epsilon.
 *  @param a First vector to compare
 *  @param b Second vector to compare
 *  @param epsilon Epsilon
 *  @return 1 if the vectors are equal
 *  @return 0 if the vectors are not equal
  }
function aiVector3AreEqualEpsilon(a:PaiVector3D; b:PaiVector3D; epsilon:single):longint;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Check if vector \p a is less than vector \p b.
 *  @param a First vector to compare
 *  @param b Second vector to compare
 *  @param epsilon Epsilon
 *  @return 1 if \p a is less than \p b
 *  @return 0 if \p a is equal or greater than \p b
  }
function aiVector3LessThan(a:PaiVector3D; b:PaiVector3D):longint;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Add 3D vectors.
 *  @param dst First addend, receives result.
 *  @param src Vector to be added to 'dst'.
  }
procedure aiVector3Add(dst:PaiVector3D; src:PaiVector3D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Subtract 3D vectors.
 *  @param dst Minuend, receives result.
 *  @param src Vector to be subtracted from 'dst'.
  }
procedure aiVector3Subtract(dst:PaiVector3D; src:PaiVector3D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Multiply a 3D vector by a scalar.
 *  @param dst Vector to be scaled by \p s
 *  @param s Scale factor
  }
procedure aiVector3Scale(dst:PaiVector3D; s:single);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Multiply each component of a 3D vector with
 *  the components of another vector.
 *  @param dst First vector, receives result
 *  @param other Second vector
  }
procedure aiVector3SymMul(dst:PaiVector3D; other:PaiVector3D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Divide a 3D vector by a scalar.
 *  @param dst Vector to be divided by \p s
 *  @param s Scalar divisor
  }
procedure aiVector3DivideByScalar(dst:PaiVector3D; s:single);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Divide each component of a 3D vector by
 *  the components of another vector.
 *  @param dst Vector as the dividend
 *  @param v Vector as the divisor
  }
procedure aiVector3DivideByVector(dst:PaiVector3D; v:PaiVector3D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get the length of a 3D vector.
 *  @return v Vector to evaluate
  }
function aiVector3Length(v:PaiVector3D):single;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get the squared length of a 3D vector.
 *  @return v Vector to evaluate
  }
function aiVector3SquareLength(v:PaiVector3D):single;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Negate a 3D vector.
 *  @param dst Vector to be negated
  }
procedure aiVector3Negate(dst:PaiVector3D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get the dot product of 3D vectors.
 *  @param a First vector
 *  @param b Second vector
 *  @return The dot product of vectors
  }
function aiVector3DotProduct(a:PaiVector3D; b:PaiVector3D):single;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get cross product of 3D vectors.
 *  @param dst Vector to receive the result.
 *  @param a First vector
 *  @param b Second vector
 *  @return The dot product of vectors
  }
procedure aiVector3CrossProduct(dst:PaiVector3D; a:PaiVector3D; b:PaiVector3D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Normalize a 3D vector.
 *  @param v Vector to normalize
  }
procedure aiVector3Normalize(v:PaiVector3D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Check for division by zero and normalize a 3D vector.
 *  @param v Vector to normalize
  }
procedure aiVector3NormalizeSafe(v:PaiVector3D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Rotate a 3D vector by a quaternion.
 *  @param v The vector to rotate by \p q
 *  @param q Quaternion to use to rotate \p v
  }
procedure aiVector3RotateByQuaternion(v:PaiVector3D; q:PaiQuaternion);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Construct a 3x3 matrix from a 4x4 matrix.
 *  @param dst Receives the output matrix
 *  @param mat The 4x4 matrix to use
  }
procedure aiMatrix3FromMatrix4(dst:PaiMatrix3x3; mat:PaiMatrix4x4);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Construct a 3x3 matrix from a quaternion.
 *  @param mat Receives the output matrix
 *  @param q The quaternion matrix to use
  }
procedure aiMatrix3FromQuaternion(mat:PaiMatrix3x3; q:PaiQuaternion);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Check if 3x3 matrices are equal.
 *  @param a First matrix to compare
 *  @param b Second matrix to compare
 *  @return 1 if the matrices are equal
 *  @return 0 if the matrices are not equal
  }
function aiMatrix3AreEqual(a:PaiMatrix3x3; b:PaiMatrix3x3):longint;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Check if 3x3 matrices are equal.
 *  @param a First matrix to compare
 *  @param b Second matrix to compare
 *  @param epsilon Epsilon
 *  @return 1 if the matrices are equal
 *  @return 0 if the matrices are not equal
  }
function aiMatrix3AreEqualEpsilon(a:PaiMatrix3x3; b:PaiMatrix3x3; epsilon:single):longint;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Invert a 3x3 matrix.
 *  @param mat Matrix to invert
  }
procedure aiMatrix3Inverse(mat:PaiMatrix3x3);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get the determinant of a 3x3 matrix.
 *  @param mat Matrix to get the determinant from
  }
function aiMatrix3Determinant(mat:PaiMatrix3x3):single;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get a 3x3 rotation matrix around the Z axis.
 *  @param mat Receives the output matrix
 *  @param angle Rotation angle, in radians
  }
procedure aiMatrix3RotationZ(mat:PaiMatrix3x3; angle:single);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Returns a 3x3 rotation matrix for a rotation around an arbitrary axis.
 *  @param mat Receives the output matrix
 *  @param axis Rotation axis, should be a normalized vector
 *  @param angle Rotation angle, in radians
  }
procedure aiMatrix3FromRotationAroundAxis(mat:PaiMatrix3x3; axis:PaiVector3D; angle:single);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get a 3x3 translation matrix.
 *  @param mat Receives the output matrix
 *  @param translation The translation vector
  }
procedure aiMatrix3Translation(mat:PaiMatrix3x3; translation:PaiVector2D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Create a 3x3 matrix that rotates one vector to another vector.
 *  @param mat Receives the output matrix
 *  @param from Vector to rotate from
 *  @param to Vector to rotate to
  }
procedure aiMatrix3FromTo(mat:PaiMatrix3x3; from:PaiVector3D; to:PaiVector3D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Construct a 4x4 matrix from a 3x3 matrix.
 *  @param dst Receives the output matrix
 *  @param mat The 3x3 matrix to use
  }
procedure aiMatrix4FromMatrix3(dst:PaiMatrix4x4; mat:PaiMatrix3x3);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Construct a 4x4 matrix from scaling, rotation and position.
 *  @param mat Receives the output matrix.
 *  @param scaling The scaling for the x,y,z axes
 *  @param rotation The rotation as a hamilton quaternion
 *  @param position The position for the x,y,z axes
  }
procedure aiMatrix4FromScalingQuaternionPosition(mat:PaiMatrix4x4; scaling:PaiVector3D; rotation:PaiQuaternion; position:PaiVector3D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Add 4x4 matrices.
 *  @param dst First addend, receives result.
 *  @param src Matrix to be added to 'dst'.
  }
procedure aiMatrix4Add(dst:PaiMatrix4x4; src:PaiMatrix4x4);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Check if 4x4 matrices are equal.
 *  @param a First matrix to compare
 *  @param b Second matrix to compare
 *  @return 1 if the matrices are equal
 *  @return 0 if the matrices are not equal
  }
function aiMatrix4AreEqual(a:PaiMatrix4x4; b:PaiMatrix4x4):longint;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Check if 4x4 matrices are equal.
 *  @param a First matrix to compare
 *  @param b Second matrix to compare
 *  @param epsilon Epsilon
 *  @return 1 if the matrices are equal
 *  @return 0 if the matrices are not equal
  }
function aiMatrix4AreEqualEpsilon(a:PaiMatrix4x4; b:PaiMatrix4x4; epsilon:single):longint;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Invert a 4x4 matrix.
 *  @param result Matrix to invert
  }
procedure aiMatrix4Inverse(mat:PaiMatrix4x4);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get the determinant of a 4x4 matrix.
 *  @param mat Matrix to get the determinant from
 *  @return The determinant of the matrix
  }
function aiMatrix4Determinant(mat:PaiMatrix4x4):single;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Returns true of the matrix is the identity matrix.
 *  @param mat Matrix to get the determinant from
 *  @return 1 if \p mat is an identity matrix.
 *  @return 0 if \p mat is not an identity matrix.
  }
function aiMatrix4IsIdentity(mat:PaiMatrix4x4):longint;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Decompose a transformation matrix into its scaling,
 *  rotational as euler angles, and translational components.
 *
 * @param mat Matrix to decompose
 * @param scaling Receives the output scaling for the x,y,z axes
 * @param rotation Receives the output rotation as a Euler angles
 * @param position Receives the output position for the x,y,z axes
  }
procedure aiMatrix4DecomposeIntoScalingEulerAnglesPosition(mat:PaiMatrix4x4; scaling:PaiVector3D; rotation:PaiVector3D; position:PaiVector3D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Decompose a transformation matrix into its scaling,
 *  rotational split into an axis and rotational angle,
 *  and it's translational components.
 *
 * @param mat Matrix to decompose
 * @param rotation Receives the rotational component
 * @param axis Receives the output rotation axis
 * @param angle Receives the output rotation angle
 * @param position Receives the output position for the x,y,z axes.
  }
procedure aiMatrix4DecomposeIntoScalingAxisAnglePosition(mat:PaiMatrix4x4; scaling:PaiVector3D; axis:PaiVector3D; angle:Pai_real; position:PaiVector3D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Decompose a transformation matrix into its rotational and
 *  translational components.
 *
 * @param mat Matrix to decompose
 * @param rotation Receives the rotational component
 * @param position Receives the translational component.
  }
procedure aiMatrix4DecomposeNoScaling(mat:PaiMatrix4x4; rotation:PaiQuaternion; position:PaiVector3D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Creates a 4x4 matrix from a set of euler angles.
 *  @param mat Receives the output matrix
 *  @param x Rotation angle for the x-axis, in radians
 *  @param y Rotation angle for the y-axis, in radians
 *  @param z Rotation angle for the z-axis, in radians
  }
procedure aiMatrix4FromEulerAngles(mat:PaiMatrix4x4; x:single; y:single; z:single);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get a 4x4 rotation matrix around the X axis.
 *  @param mat Receives the output matrix
 *  @param angle Rotation angle, in radians
  }
procedure aiMatrix4RotationX(mat:PaiMatrix4x4; angle:single);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get a 4x4 rotation matrix around the Y axis.
 *  @param mat Receives the output matrix
 *  @param angle Rotation angle, in radians
  }
procedure aiMatrix4RotationY(mat:PaiMatrix4x4; angle:single);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get a 4x4 rotation matrix around the Z axis.
 *  @param mat Receives the output matrix
 *  @param angle Rotation angle, in radians
  }
procedure aiMatrix4RotationZ(mat:PaiMatrix4x4; angle:single);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Returns a 4x4 rotation matrix for a rotation around an arbitrary axis.
 *  @param mat Receives the output matrix
 *  @param axis Rotation axis, should be a normalized vector
 *  @param angle Rotation angle, in radians
  }
procedure aiMatrix4FromRotationAroundAxis(mat:PaiMatrix4x4; axis:PaiVector3D; angle:single);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get a 4x4 translation matrix.
 *  @param mat Receives the output matrix
 *  @param translation The translation vector
  }
procedure aiMatrix4Translation(mat:PaiMatrix4x4; translation:PaiVector3D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Get a 4x4 scaling matrix.
 *  @param mat Receives the output matrix
 *  @param scaling The scaling vector
  }
procedure aiMatrix4Scaling(mat:PaiMatrix4x4; scaling:PaiVector3D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Create a 4x4 matrix that rotates one vector to another vector.
 *  @param mat Receives the output matrix
 *  @param from Vector to rotate from
 *  @param to Vector to rotate to
  }
procedure aiMatrix4FromTo(mat:PaiMatrix4x4; from:PaiVector3D; to:PaiVector3D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Create a Quaternion from euler angles.
 *  @param q Receives the output quaternion
 *  @param x Rotation angle for the x-axis, in radians
 *  @param y Rotation angle for the y-axis, in radians
 *  @param z Rotation angle for the z-axis, in radians
  }
procedure aiQuaternionFromEulerAngles(q:PaiQuaternion; x:single; y:single; z:single);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Create a Quaternion from an axis angle pair.
 *  @param q Receives the output quaternion
 *  @param axis The orientation axis
 *  @param angle The rotation angle, in radians
  }
procedure aiQuaternionFromAxisAngle(q:PaiQuaternion; axis:PaiVector3D; angle:single);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Create a Quaternion from a normalized quaternion stored
 *  in a 3D vector.
 *  @param q Receives the output quaternion
 *  @param normalized The vector that stores the quaternion
  }
procedure aiQuaternionFromNormalizedQuaternion(q:PaiQuaternion; normalized:PaiVector3D);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Check if quaternions are equal.
 *  @param a First quaternion to compare
 *  @param b Second quaternion to compare
 *  @return 1 if the quaternions are equal
 *  @return 0 if the quaternions are not equal
  }
function aiQuaternionAreEqual(a:PaiQuaternion; b:PaiQuaternion):longint;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Check if quaternions are equal using epsilon.
 *  @param a First quaternion to compare
 *  @param b Second quaternion to compare
 *  @param epsilon Epsilon
 *  @return 1 if the quaternions are equal
 *  @return 0 if the quaternions are not equal
  }
function aiQuaternionAreEqualEpsilon(a:PaiQuaternion; b:PaiQuaternion; epsilon:single):longint;cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Normalize a quaternion.
 *  @param q Quaternion to normalize
  }
procedure aiQuaternionNormalize(q:PaiQuaternion);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Compute quaternion conjugate.
 *  @param q Quaternion to compute conjugate,
 *           receives the output quaternion
  }
procedure aiQuaternionConjugate(q:PaiQuaternion);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Multiply quaternions.
 *  @param dst First quaternion, receives the output quaternion
 *  @param q Second quaternion
  }
procedure aiQuaternionMultiply(dst:PaiQuaternion; q:PaiQuaternion);cdecl;external libmb;
{ -------------------------------------------------------------------------------- }
{* Performs a spherical interpolation between two quaternions.
 * @param dst Receives the quaternion resulting from the interpolation.
 * @param start Quaternion when factor == 0
 * @param end Quaternion when factor == 1
 * @param factor Interpolation factor between 0 and 1
  }
procedure aiQuaternionInterpolate(dst:PaiQuaternion; start:PaiQuaternion; end:PaiQuaternion; factor:single);cdecl;external libmb;
{ C++ end of extern C conditionnal removed }
{$endif}
{ AI_ASSIMP_H_INC }

// === Konventiert am: 22-11-26 17:09:04 ===


implementation



end.
