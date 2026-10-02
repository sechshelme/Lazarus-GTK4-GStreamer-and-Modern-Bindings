unit cpl_compressor;

interface

uses
  fp_gdal, cpl_port;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TCPLCompressionFunc = function(input_data: pointer; input_size: Tsize_t; output_data: Ppointer; output_size: Psize_t; options: TCSLConstList; compressor_user_data: pointer): Boolean32; cdecl;

type
  PCPLCompressorType = ^TCPLCompressorType;
  TCPLCompressorType = longint;
const
  CCT_COMPRESSOR = 0;
  CCT_FILTER = 1;

type
  PCPLCompressor = ^TCPLCompressor;
  TCPLCompressor = record
    nStructVersion: longint;
    pszId: pchar;
    eType: TCPLCompressorType;
    papszMetadata: TCSLConstList;
    pfnFunc: TCPLCompressionFunc;
    user_data: pointer;
  end;

function CPLRegisterCompressor(compressor: PCPLCompressor): Boolean; cdecl; external libgdal;
function CPLRegisterDecompressor(decompressor: PCPLCompressor): Boolean; cdecl; external libgdal;
function CPLGetCompressors: Ppchar; cdecl; external libgdal;
function CPLGetDecompressors: Ppchar; cdecl; external libgdal;
function CPLGetCompressor(pszId: pchar): PCPLCompressor; cdecl; external libgdal;
function CPLGetDecompressor(pszId: pchar): PCPLCompressor; cdecl; external libgdal;
procedure CPLDestroyCompressorRegistry; cdecl; external libgdal;

// === Konventiert am: 2-10-26 15:57:27 ===


implementation



end.
