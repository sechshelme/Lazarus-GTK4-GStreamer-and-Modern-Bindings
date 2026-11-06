unit fp_isl;

interface

const
  {$IFDEF Linux}
  libisl = 'isl';
  {$ENDIF}

  {$IFDEF Windows}
  libisl = 'libisl-23.dll';
  {$ENDIF}

type
  Tuint32_t = uint32;

  Tsize_t = SizeUInt;

  PFILE = type Pointer;


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
  Pisl_stride_info = type Pointer;

  Tmpz_t = Pointer; // ????


  // === Konventiert am: 5-11-26 16:55:29 ===


  {$DEFINE read_interface}
  //{$include fp_isl_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_isl_includes.inc}
{$UNDEF read_implementation}


end.
