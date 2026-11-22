unit types;

interface

uses
  fp_assimp, defs, vector3;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pai_int32 = ^Tai_int32;
  Tai_int32 = Tint32_t;

  Pai_uint32 = ^Tai_uint32;
  Tai_uint32 = Tuint32_t;

const
  MAXLEN = 1024;

type
  PaiPlane = ^TaiPlane;
  TaiPlane = record
    a: Tai_real;
    b: Tai_real;
    c: Tai_real;
    d: Tai_real;
  end;

  PaiRay = ^TaiRay;
  TaiRay = record
    pos: TaiVector3D;
    dir: TaiVector3D;
  end;

  PaiColor3D = ^TaiColor3D;
  TaiColor3D = record
    r: Tai_real;
    g: Tai_real;
    b: Tai_real;
  end;

  PaiString = ^TaiString;
  TaiString = record
    length: Tai_uint32;
    data: array[0..(MAXLEN) - 1] of char;
  end;

type
  PaiReturn = ^TaiReturn;
  TaiReturn = longint;
const
  aiReturn_SUCCESS = $0;
  aiReturn_FAILURE = -($1);
  aiReturn_OUTOFMEMORY = -($3);
  _AI_ENFORCE_ENUM_SIZE = $7fffffff;

const
  AI_SUCCESS = aiReturn_SUCCESS;
  AI_FAILURE = aiReturn_FAILURE;
  AI_OUTOFMEMORY = aiReturn_OUTOFMEMORY;

type
  TaiOrigin = longint;
const
  aiOrigin_SET = $0;
  aiOrigin_CUR = $1;
  aiOrigin_END = $2;
  _AI_ORIGIN_ENFORCE_ENUM_SIZE = $7fffffff;

type
  TaiDefaultLogStream = longint;
const
  aiDefaultLogStream_FILE = $1;
  aiDefaultLogStream_STDOUT = $2;
  aiDefaultLogStream_STDERR = $4;
  aiDefaultLogStream_DEBUGGER = $8;
  _AI_DLS_ENFORCE_ENUM_SIZE = $7fffffff;

const
  DLS_FILE = aiDefaultLogStream_FILE;
  DLS_STDOUT = aiDefaultLogStream_STDOUT;
  DLS_STDERR = aiDefaultLogStream_STDERR;
  DLS_DEBUGGER = aiDefaultLogStream_DEBUGGER;

type
  PaiMemoryInfo = ^TaiMemoryInfo;
  TaiMemoryInfo = record
    textures: dword;
    materials: dword;
    meshes: dword;
    nodes: dword;
    animations: dword;
    cameras: dword;
    lights: dword;
    total: dword;
  end;


  // === Konventiert am: 22-11-26 17:34:14 ===


implementation



end.
