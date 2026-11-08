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
  {$IFDEF Linux}
  Tculong = uint64;
  Tclong = int64;
  {$ENDIF}
  {$IFDEF windows}
  Tculong = uint32;
  Tclong = int32;
  {$ENDIF}
  Pculong = ^Tculong;
  Pclong = ^Tclong;

  Tuint32_t = uint32;
  Tsize_t = SizeUInt;
  PFILE = type Pointer;

procedure free(p: pointer); cdecl; external libc;
function malloc(size: SizeUInt): pointer; cdecl; external libc;

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

end.
