unit cfileio;

interface

uses
  fp_assimp, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PaiFileIO = ^TaiFileIO;
  PaiFile = ^TaiFile;

  TaiFileWriteProc = function(para1: PaiFile; para2: Pchar; para3: Tsize_t; para4: Tsize_t): Tsize_t; cdecl;
  TaiFileReadProc = function(para1: PaiFile; para2: Pchar; para3: Tsize_t; para4: Tsize_t): Tsize_t; cdecl;
  TaiFileTellProc = function(para1: PaiFile): Tsize_t; cdecl;
  TaiFileFlushProc = procedure(para1: PaiFile); cdecl;
  TaiFileSeek = function(para1: PaiFile; para2: Tsize_t; para3: TaiOrigin): TaiReturn; cdecl;
  TaiFileOpenProc = function(para1: PaiFileIO; para2: Pchar; para3: Pchar): PaiFile; cdecl;
  TaiFileCloseProc = procedure(para1: PaiFileIO; para2: PaiFile); cdecl;

  PaiUserData = ^TaiUserData;
  TaiUserData = Pchar;

  TaiFileIO = record
    OpenProc: TaiFileOpenProc;
    CloseProc: TaiFileCloseProc;
    UserData: TaiUserData;
  end;

  TaiFile = record
    ReadProc: TaiFileReadProc;
    WriteProc: TaiFileWriteProc;
    TellProc: TaiFileTellProc;
    FileSizeProc: TaiFileTellProc;
    SeekProc: TaiFileSeek;
    FlushProc: TaiFileFlushProc;
    UserData: TaiUserData;
  end;


  // === Konventiert am: 22-11-26 17:09:07 ===


implementation



end.
