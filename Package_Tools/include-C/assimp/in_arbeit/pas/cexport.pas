unit cexport;

interface

uses
  fp_assimp, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PaiScene = type Pointer;
  PPaiScene = ^PaiScene;
  PaiFileIO = type Pointer;

  PaiExportFormatDesc = ^TaiExportFormatDesc;
  TaiExportFormatDesc = record
    id: Pchar;
    description: Pchar;
    fileExtension: Pchar;
  end;

function aiGetExportFormatCount: Tsize_t; cdecl; external libassimp;
function aiGetExportFormatDescription(pIndex: Tsize_t): PaiExportFormatDesc; cdecl; external libassimp;
procedure aiReleaseExportFormatDescription(desc: PaiExportFormatDesc); cdecl; external libassimp;
procedure aiCopyScene(pIn: PaiScene; pOut: PPaiScene); cdecl; external libassimp;
procedure aiFreeScene(pIn: PaiScene); cdecl; external libassimp;
function aiExportScene(pScene: PaiScene; pFormatId: Pchar; pFileName: Pchar; pPreprocessing: dword): TaiReturn; cdecl; external libassimp;
function aiExportSceneEx(pScene: PaiScene; pFormatId: Pchar; pFileName: Pchar; pIO: PaiFileIO; pPreprocessing: dword): TaiReturn; cdecl; external libassimp;

type
  PaiExportDataBlob = ^TaiExportDataBlob;
  TaiExportDataBlob = record
    size: Tsize_t;
    data: pointer;
    name: TaiString;
    next: PaiExportDataBlob;
  end;

function aiExportSceneToBlob(pScene: PaiScene; pFormatId: Pchar; pPreprocessing: dword): PaiExportDataBlob; cdecl; external libassimp;
procedure aiReleaseExportBlob(pData: PaiExportDataBlob); cdecl; external libassimp;

// === Konventiert am: 22-11-26 17:00:54 ===


implementation



end.
