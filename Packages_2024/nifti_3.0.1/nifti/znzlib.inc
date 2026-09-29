{$IFDEF read_interface}


type
  TgzFile = Pointer;

  Tznz_off_t = int64;

  Pznzptr = ^Tznzptr;
  Tznzptr = record
    withz: longint;
    nzfptr: PFILE;
    zfptr: TgzFile;
  end;

  PznzFile = ^TznzFile;
  TznzFile = Pznzptr;

function znzopen(path: pchar; mode: pchar; use_compression: longint): TznzFile; cdecl; external libniftiio;
function znzdopen(fd: longint; mode: pchar; use_compression: longint): TznzFile; cdecl; external libniftiio;
function Xznzclose(file_: PznzFile): longint; cdecl; external libniftiio;
function znzread(buf: pointer; size: Tsize_t; nmemb: Tsize_t; file_: TznzFile): Tsize_t; cdecl; external libniftiio;
function znzwrite(buf: pointer; size: Tsize_t; nmemb: Tsize_t; file_: TznzFile): Tsize_t; cdecl; external libniftiio;
function znzseek(file_: TznzFile; offset: Tznz_off_t; whence: longint): Tznz_off_t; cdecl; external libniftiio;
function znzrewind(stream: TznzFile): longint; cdecl; external libniftiio;
function znztell(file_: TznzFile): Tznz_off_t; cdecl; external libniftiio;
function znzputs(str: pchar; file_: TznzFile): longint; cdecl; external libniftiio;
function znzgets(str: pchar; size: longint; file_: TznzFile): pchar; cdecl; external libniftiio;
function znzputc(c: longint; file_: TznzFile): longint; cdecl; external libniftiio;
function znzgetc(file_: TznzFile): longint; cdecl; external libniftiio;
function znzprintf(stream: TznzFile; format: pchar): longint; cdecl; varargs; external libniftiio;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
