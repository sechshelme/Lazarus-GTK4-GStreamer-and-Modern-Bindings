
unit cpl_compressor;
interface

{
  Automatically converted by H2Pas 1.0.0 from cpl_compressor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cpl_compressor.h
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
Pchar  = ^char;
PCPLCompressor  = ^CPLCompressor;
PCPLCompressorType  = ^CPLCompressorType;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*********************************************************************
 * Project:  CPL - Common Portability Library
 * Purpose:  Registry of compression/decompression functions
 * Author:   Even Rouault <even.rouault at spatialys.com>
 *
 **********************************************************************
 * Copyright (c) 2021, Even Rouault <even.rouault at spatialys.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *************************************************************************** }
{$ifndef CPL_COMPRESSOR_H_INCLUDED}
{$define CPL_COMPRESSOR_H_INCLUDED}
{$include "cpl_port.h"}
{$include <stdbool.h>}
{*
 * \file cpl_compressor.h
 *
 * API for compressors and decompressors of binary buffers.
  }
{* Callback of a compressor/decompressor.
 *
 * For a compressor, input is uncompressed data, and output compressed data.
 * For a decompressor, input is compressed data, and output uncompressed data.
 *
 * Valid situations for output_data and output_size are:
 * <ul>
 * <li>output_data != NULL and *output_data != NULL and output_size != NULL and
 * *output_size != 0. The caller provides the output
 * buffer in *output_data and its size in *output_size. In case of successful
 * operation, *output_size will be updated to the actual size.
 * This mode is the one that is always guaranteed to be implemented efficiently.
 * In case of failure due to insufficient space, it will be updated to the size
 * needed (if known), or 0 (if unknown)</li>
 * <li>output_data == NULL and output_size != NULL. *output_size will be updated
 * with the minimum size the output buffer should be (if known), or 0 (if
 * unknown).</li> <li>output_data != NULL and *output_data == NULL and
 * output_size != NULL. *output_data will be allocated using VSIMalloc(), and
 * should be freed by the caller with VSIFree(). *output_size will be updated to
 * the size of the output buffer.</li>
 * </ul>
 *
 * @param input_data Input data. Should not be NULL.
 * @param input_size Size of input data, in bytes.
 * @param output_data Pointer to output data.
 * @param output_size Pointer to output size.
 * @param options NULL terminated list of options. Or NULL.
 * @param compressor_user_data User data provided at registration time.
 * @return true in case of success.
  }
(* Const before type ignored *)
type

  TCPLCompressionFunc = function (input_data:pointer; input_size:Tsize_t; output_data:Ppointer; output_size:Psize_t; options:TCSLConstList; 
               compressor_user_data:pointer):Tbool;cdecl;
{* Type of compressor  }
{* Compressor  }
{* Filter  }

  PCPLCompressorType = ^TCPLCompressorType;
  TCPLCompressorType =  Longint;
  Const
    CCT_COMPRESSOR = 0;
    CCT_FILTER = 1;
;
{* Compressor/decompressor description  }
{* Structure version. Should be set to 1  }
{* Id of the compressor/decompressor. Should NOT be NULL.  }
(* Const before type ignored *)
{* Compressor type  }
{* Metadata, as a NULL terminated list of strings. Or NULL.
     * The OPTIONS metadata key is reserved for compressors/decompressors to
     * provide the available options as a XML string of the form
     * &lt;Options&gt;
     *   &lt;Option name='' type='' description='' default=''/&gt;
     * &lt;/Options&gt;
      }
{* Compressor/decompressor callback. Should NOT be NULL.  }
{* User data to provide to the callback. May be NULL.  }
type
  PCPLCompressor = ^TCPLCompressor;
  TCPLCompressor = record
      nStructVersion : longint;
      pszId : Pchar;
      eType : TCPLCompressorType;
      papszMetadata : TCSLConstList;
      pfnFunc : TCPLCompressionFunc;
      user_data : pointer;
    end;
(* Const before type ignored *)

function CPLRegisterCompressor(compressor:PCPLCompressor):Tbool;cdecl;external;
(* Const before type ignored *)
function CPLRegisterDecompressor(decompressor:PCPLCompressor):Tbool;cdecl;external;
function CPLGetCompressors:^Pchar;cdecl;external;
function CPLGetDecompressors:^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLGetCompressor(pszId:Pchar):PCPLCompressor;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CPLGetDecompressor(pszId:Pchar):PCPLCompressor;cdecl;external;
{! @cond Doxygen_Suppress  }
procedure CPLDestroyCompressorRegistry;cdecl;external;
{! @endcond  }
{$endif}
{ CPL_COMPRESSOR_H_INCLUDED }

implementation


end.
