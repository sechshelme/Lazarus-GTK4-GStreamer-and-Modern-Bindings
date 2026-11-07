unit fp_isl;

interface

const
  {$IFDEF Linux}
  libisl = 'isl';
  libc = 'c';
  {$ENDIF}

  {$IFDEF Windows}
  libisl = 'libisl-23.dll';
  libc = 'msvcrt.dll';
  {$ENDIF}

type
  Tuint32_t = uint32;
  Tsize_t = SizeUInt;
  PFILE = type Pointer;

  {$IFDEF linux}
  var
    stdin: PFILE; cvar; external libc;
    stdout: PFILE; cvar; external libc;
    stderr: PFILE; cvar; external libc;
  {$ENDIF}

  {$IFDEF windows}
  function stdin: PFILE; inline;
  function stdout: PFILE; inline;
  function stderr: PFILE; inline;
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Pisl_options = type Pointer;
  Pisl_local_space = type Pointer;
  PPisl_local_space = ^Pisl_local_space;

  Pisl_id_to_ast_expr = type Pointer;
  Pisl_id_to_id = type Pointer;
  Pisl_id_to_pw_aff = type Pointer;
  Pisl_map_to_basic_set = type Pointer;

  Tmpz_t = Pointer; // ????


  // === Konventiert am: 5-11-26 16:55:29 ===


  {$DEFINE read_interface}
  {$include fp_isl_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_isl_includes.inc}
{$UNDEF read_implementation}

{$IFDEF windows}
function __iob_func: PFILE; cdecl; external libc;

function stdin: PFILE; inline;
begin
  Result := __iob_func + 0;
end;

function stdout: PFILE; inline;
begin
  Result := __iob_func + 48;
end;

function stderr: PFILE; inline;
begin
  Result := __iob_func + 96;
end;
{$ENDIF}

end.
