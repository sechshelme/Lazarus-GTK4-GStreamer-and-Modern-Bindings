unit nifti2_io;

interface

uses
  fp_nifti, nifti1, nifti2, znzlib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Pmat44 = ^Tmat44;
  Tmat44 = record
    m: array[0..3] of array[0..3] of single;
  end;

  Pmat33 = ^Tmat33;
  Tmat33 = record
    m: array[0..2] of array[0..2] of single;
  end;

  Pnifti_dmat44 = ^Tnifti_dmat44;
  Tnifti_dmat44 = record
    m: array[0..3] of array[0..3] of double;
  end;

  Pnifti_dmat33 = ^Tnifti_dmat33;
  Tnifti_dmat33 = record
    m: array[0..2] of array[0..2] of double;
  end;

type
  Panalyze75_orient_code = ^Tanalyze75_orient_code;
  Tanalyze75_orient_code = longint;
const
  a75_transverse_unflipped = 0;
  a75_coronal_unflipped = 1;
  a75_sagittal_unflipped = 2;
  a75_transverse_flipped = 3;
  a75_coronal_flipped = 4;
  a75_sagittal_flipped = 5;
  a75_orient_unknown = 6;

type
  Tanalyze_75_orient_code = Tanalyze75_orient_code;
  Panalyze_75_orient_code = ^Tanalyze_75_orient_code;

type
  PPnifti_image = ^Pnifti_image;
  Pnifti_image = ^Tnifti_image;
  Tnifti_image = record
    ndim: Tint64_t;
    nx: Tint64_t;
    ny: Tint64_t;
    nz: Tint64_t;
    nt: Tint64_t;
    nu: Tint64_t;
    nv: Tint64_t;
    nw: Tint64_t;
    dim: array[0..7] of Tint64_t;
    nvox: Tint64_t;
    nbyper: longint;
    datatype: longint;
    dx: double;
    dy: double;
    dz: double;
    dt: double;
    du: double;
    dv: double;
    dw: double;
    pixdim: array[0..7] of double;
    scl_slope: double;
    scl_inter: double;
    cal_min: double;
    cal_max: double;
    qform_code: longint;
    sform_code: longint;
    freq_dim: longint;
    phase_dim: longint;
    slice_dim: longint;
    slice_code: longint;
    slice_start: Tint64_t;
    slice_end: Tint64_t;
    slice_duration: double;
    quatern_b: double;
    quatern_c: double;
    quatern_d: double;
    qoffset_x: double;
    qoffset_y: double;
    qoffset_z: double;
    qfac: double;
    qto_xyz: Tnifti_dmat44;
    qto_ijk: Tnifti_dmat44;
    sto_xyz: Tnifti_dmat44;
    sto_ijk: Tnifti_dmat44;
    toffset: double;
    xyz_units: longint;
    time_units: longint;
    nifti_type: longint;
    intent_code: longint;
    intent_p1: double;
    intent_p2: double;
    intent_p3: double;
    intent_name: array[0..15] of char;
    descrip: array[0..79] of char;
    aux_file: array[0..23] of char;
    fname: pchar;
    iname: pchar;
    iname_offset: Tint64_t;
    swapsize: longint;
    byteorder: longint;
    data: pointer;
    num_ext: longint;
    ext_list: Pnifti1_extension;
    analyze75_orient: Tanalyze_75_orient_code;
  end;

  Pnifti2_image = ^Tnifti2_image;
  Tnifti2_image = Tnifti_image;

  Pnifti1_image = ^Tnifti1_image;
  Tnifti1_image = record
    ndim: longint;
    nx: longint;
    ny: longint;
    nz: longint;
    nt: longint;
    nu: longint;
    nv: longint;
    nw: longint;
    dim: array[0..7] of longint;
    nvox: Tint64_t;
    nbyper: longint;
    datatype: longint;
    dx: single;
    dy: single;
    dz: single;
    dt: single;
    du: single;
    dv: single;
    dw: single;
    pixdim: array[0..7] of single;
    scl_slope: single;
    scl_inter: single;
    cal_min: single;
    cal_max: single;
    qform_code: longint;
    sform_code: longint;
    freq_dim: longint;
    phase_dim: longint;
    slice_dim: longint;
    slice_code: longint;
    slice_start: longint;
    slice_end: longint;
    slice_duration: single;
    quatern_b: single;
    quatern_c: single;
    quatern_d: single;
    qoffset_x: single;
    qoffset_y: single;
    qoffset_z: single;
    qfac: single;
    qto_xyz: Tmat44;
    qto_ijk: Tmat44;
    sto_xyz: Tmat44;
    sto_ijk: Tmat44;
    toffset: single;
    xyz_units: longint;
    time_units: longint;
    nifti_type: longint;
    intent_code: longint;
    intent_p1: single;
    intent_p2: single;
    intent_p3: single;
    intent_name: array[0..15] of char;
    descrip: array[0..79] of char;
    aux_file: array[0..23] of char;
    fname: pchar;
    iname: pchar;
    iname_offset: longint;
    swapsize: longint;
    byteorder: longint;
    data: pointer;
    num_ext: longint;
    ext_list: Pnifti1_extension;
    analyze75_orient: Tanalyze_75_orient_code;
  end;

  Pnifti_brick_list = ^Tnifti_brick_list;
  Tnifti_brick_list = record
    nbricks: Tint64_t;
    bsize: Tint64_t;
    bricks: ^pointer;
  end;

  Pnifti_analyze75 = ^Tnifti_analyze75;
  Tnifti_analyze75 = record
    sizeof_hdr: longint;
    data_type: array[0..9] of char;
    db_name: array[0..17] of char;
    extents: longint;
    session_error: smallint;
    regular: char;
    hkey_un0: char;
    dim: array[0..7] of smallint;
    unused8: smallint;
    unused9: smallint;
    unused10: smallint;
    unused11: smallint;
    unused12: smallint;
    unused13: smallint;
    unused14: smallint;
    datatype: smallint;
    bitpix: smallint;
    dim_un0: smallint;
    pixdim: array[0..7] of single;
    vox_offset: single;
    funused1: single;
    funused2: single;
    funused3: single;
    cal_max: single;
    cal_min: single;
    compressed: single;
    verified: single;
    glmax: longint;
    glmin: longint;
    descrip: array[0..79] of char;
    aux_file: array[0..23] of char;
    orient: char;
    originator: array[0..9] of char;
    generated: array[0..9] of char;
    scannum: array[0..9] of char;
    patient_id: array[0..9] of char;
    exp_date: array[0..9] of char;
    exp_time: array[0..9] of char;
    hist_un0: array[0..2] of char;
    views: longint;
    vols_added: longint;
    start_field: longint;
    field_skip: longint;
    omax: longint;
    omin: longint;
    smax: longint;
    smin: longint;
  end;

function nifti_datatype_string(dt: longint): pchar; cdecl; external libniftiio;
function nifti_units_string(uu: longint): pchar; cdecl; external libniftiio;
function nifti_intent_string(ii: longint): pchar; cdecl; external libniftiio;
function nifti_xform_string(xx: longint): pchar; cdecl; external libniftiio;
function nifti_slice_string(ss: longint): pchar; cdecl; external libniftiio;
function nifti_orientation_string(ii: longint): pchar; cdecl; external libniftiio;
function nifti_is_inttype(dt: longint): longint; cdecl; external libniftiio;
function nifti_mat44_inverse(R: Tmat44): Tmat44; cdecl; external libniftiio;
function nifti_mat44_mul(A: Tmat44; B: Tmat44): Tmat44; cdecl; external libniftiio;
function nifti_dmat44_inverse(R: Tnifti_dmat44): Tnifti_dmat44; cdecl; external libniftiio;
function nifti_mat44_to_dmat44(fm: Pmat44; dm: Pnifti_dmat44): longint; cdecl; external libniftiio;
function nifti_dmat44_to_mat44(dm: Pnifti_dmat44; fm: Pmat44): longint; cdecl; external libniftiio;
function nifti_dmat44_mul(A: Tnifti_dmat44; B: Tnifti_dmat44): Tnifti_dmat44; cdecl; external libniftiio;
function nifti_dmat33_inverse(R: Tnifti_dmat33): Tnifti_dmat33; cdecl; external libniftiio;
function nifti_dmat33_polar(A: Tnifti_dmat33): Tnifti_dmat33; cdecl; external libniftiio;
function nifti_dmat33_rownorm(A: Tnifti_dmat33): double; cdecl; external libniftiio;
function nifti_dmat33_colnorm(A: Tnifti_dmat33): double; cdecl; external libniftiio;
function nifti_dmat33_determ(R: Tnifti_dmat33): double; cdecl; external libniftiio;
function nifti_dmat33_mul(A: Tnifti_dmat33; B: Tnifti_dmat33): Tnifti_dmat33; cdecl; external libniftiio;
function nifti_mat33_inverse(R: Tmat33): Tmat33; cdecl; external libniftiio;
function nifti_mat33_polar(A: Tmat33): Tmat33; cdecl; external libniftiio;
function nifti_mat33_rownorm(A: Tmat33): single; cdecl; external libniftiio;
function nifti_mat33_colnorm(A: Tmat33): single; cdecl; external libniftiio;
function nifti_mat33_determ(R: Tmat33): single; cdecl; external libniftiio;
function nifti_mat33_mul(A: Tmat33; B: Tmat33): Tmat33; cdecl; external libniftiio;
procedure nifti_swap_2bytes(n: Tint64_t; ar: pointer); cdecl; external libniftiio;
procedure nifti_swap_4bytes(n: Tint64_t; ar: pointer); cdecl; external libniftiio;
procedure nifti_swap_8bytes(n: Tint64_t; ar: pointer); cdecl; external libniftiio;
procedure nifti_swap_16bytes(n: Tint64_t; ar: pointer); cdecl; external libniftiio;
procedure nifti_swap_Nbytes(n: Tint64_t; siz: longint; ar: pointer); cdecl; external libniftiio;
function nifti_datatype_is_valid(dtype: longint; for_nifti: longint): longint; cdecl; external libniftiio;
function nifti_datatype_from_string(name: pchar): longint; cdecl; external libniftiio;
function nifti_datatype_to_string(dtype: longint): pchar; cdecl; external libniftiio;
function nifti_header_version(buf: pchar; nbytes: Tsize_t): longint; cdecl; external libniftiio;
function nifti_get_filesize(pathname: pchar): Tint64_t; cdecl; external libniftiio;
procedure swap_nifti_header(hdr: pointer; ni_ver: longint); cdecl; external libniftiio;
procedure old_swap_nifti_header(h: Pnifti_1_header; is_nifti: longint); cdecl; external libniftiio;
procedure nifti_swap_as_analyze(h: Pnifti_analyze75); cdecl; external libniftiio;
procedure nifti_swap_as_nifti1(h: Pnifti_1_header); cdecl; external libniftiio;
procedure nifti_swap_as_nifti2(h: Pnifti_2_header); cdecl; external libniftiio;

function nifti_image_read_bricks(hname: pchar; nbricks: Tint64_t; blist: Pint64_t; NBL: Pnifti_brick_list): Pnifti_image; cdecl; external libniftiio;
function nifti_image_load_bricks(nim: Pnifti_image; nbricks: Tint64_t; blist: Pint64_t; NBL: Pnifti_brick_list): longint; cdecl; external libniftiio;
procedure nifti_free_NBL(NBL: Pnifti_brick_list); cdecl; external libniftiio;
function nifti_image_read(hname: pchar; read_data: longint): Pnifti_image; cdecl; external libniftiio;
function nifti_image_load(nim: Pnifti_image): longint; cdecl; external libniftiio;
procedure nifti_image_unload(nim: Pnifti_image); cdecl; external libniftiio;
procedure nifti_image_free(nim: Pnifti_image); cdecl; external libniftiio;
function nifti_read_collapsed_image(nim: Pnifti_image; dims: Pint64_t; data: Ppointer): Tint64_t; cdecl; external libniftiio;
function nifti_read_subregion_image(nim: Pnifti_image; start_index: Pint64_t; region_size: Pint64_t; data: Ppointer): Tint64_t; cdecl; external libniftiio;
procedure nifti_image_write(nim: Pnifti_image); cdecl; external libniftiio;
procedure nifti_image_write_bricks(nim: Pnifti_image; NBL: Pnifti_brick_list); cdecl; external libniftiio;
procedure nifti_image_infodump(nim: Pnifti_image); cdecl; external libniftiio;
procedure nifti_disp_lib_hist(ver: longint); cdecl; external libniftiio;
procedure nifti_disp_lib_version; cdecl; external libniftiio;
function nifti_disp_matrix_orient(mesg: pchar; mat: Tnifti_dmat44): longint; cdecl; external libniftiio;
function nifti_disp_type_list(which: longint): longint; cdecl; external libniftiio;
function nifti_image_to_ascii(nim: Pnifti_image): pchar; cdecl; external libniftiio;
function nifti_image_from_ascii(str: pchar; bytes_read: Plongint): Pnifti_image; cdecl; external libniftiio;
function nifti_get_volsize(nim: Pnifti_image): Tint64_t; cdecl; external libniftiio;

function nifti_set_filenames(nim: Pnifti_image; prefix: pchar; check: longint; set_byte_order: longint): longint; cdecl; external libniftiio;
function nifti_makehdrname(prefix: pchar; nifti_type: longint; check: longint; comp: longint): pchar; cdecl; external libniftiio;
function nifti_makeimgname(prefix: pchar; nifti_type: longint; check: longint; comp: longint): pchar; cdecl; external libniftiio;
function is_nifti_file(hname: pchar): longint; cdecl; external libniftiio;
function nifti_find_file_extension(name: pchar): pchar; cdecl; external libniftiio;
function nifti_is_complete_filename(fname: pchar): longint; cdecl; external libniftiio;
function nifti_validfilename(fname: pchar): longint; cdecl; external libniftiio;
function disp_nifti_1_header(info: pchar; hp: Pnifti_1_header): longint; cdecl; external libniftiio;
function disp_nifti_2_header(info: pchar; hp: Pnifti_2_header): longint; cdecl; external libniftiio;
procedure nifti_set_debug_level(level: longint); cdecl; external libniftiio;
procedure nifti_set_skip_blank_ext(skip: longint); cdecl; external libniftiio;
procedure nifti_set_allow_upper_fext(allow: longint); cdecl; external libniftiio;
function nifti_get_alter_cifti: longint; cdecl; external libniftiio;
procedure nifti_set_alter_cifti(alter_cifti: longint); cdecl; external libniftiio;
function nifti_alter_cifti_dims(nim: Pnifti_image): longint; cdecl; external libniftiio;
function valid_nifti_brick_list(nim: Pnifti_image; nbricks: Tint64_t; blist: Pint64_t; disp_error: longint): longint; cdecl; external libniftiio;

function nifti_image_open(hname: pchar; opts: pchar; nim: PPnifti_image): TznzFile; cdecl; external libniftiio;
function nifti_image_write_hdr_img(nim: Pnifti_image; write_data: longint; opts: pchar): TznzFile; cdecl; external libniftiio;
function nifti_image_write_hdr_img2(nim: Pnifti_image; write_opts: longint; opts: pchar; imgfile: TznzFile; NBL: Pnifti_brick_list): TznzFile; cdecl; external libniftiio;
function nifti_read_buffer(fp: TznzFile; dataptr: pointer; ntot: Tint64_t; nim: Pnifti_image): Tint64_t; cdecl; external libniftiio;
function nifti_write_all_data(fp: TznzFile; nim: Pnifti_image; NBL: Pnifti_brick_list): longint; cdecl; external libniftiio;
function nifti_write_buffer(fp: TznzFile; buffer: pointer; numbytes: Tint64_t): Tint64_t; cdecl; external libniftiio;
function nifti_read_ascii_image(fp: TznzFile; fname: pchar; flen: longint; read_data: longint): Pnifti_image; cdecl; external libniftiio;
function nifti_write_ascii_image(nim: Pnifti_image; NBL: Pnifti_brick_list; opts: pchar; write_data: longint; leave_open: longint): TznzFile; cdecl; external libniftiio;
procedure nifti_datatype_sizes(datatype: longint; nbyper: Plongint; swapsize: Plongint); cdecl; external libniftiio;
procedure nifti_dmat44_to_quatern(R: Tnifti_dmat44; qb: Pdouble; qc: Pdouble; qd: Pdouble; qx: Pdouble;
  qy: Pdouble; qz: Pdouble; dx: Pdouble; dy: Pdouble; dz: Pdouble;
  qfac: Pdouble); cdecl; external libniftiio;
function nifti_quatern_to_dmat44(qb: double; qc: double; qd: double; qx: double; qy: double;
  qz: double; dx: double; dy: double; dz: double; qfac: double): Tnifti_dmat44; cdecl; external libniftiio;
function nifti_make_orthog_dmat44(r11: double; r12: double; r13: double; r21: double; r22: double;
  r23: double; r31: double; r32: double; r33: double): Tnifti_dmat44; cdecl; external libniftiio;
procedure nifti_mat44_to_quatern(R: Tmat44; qb: Psingle; qc: Psingle; qd: Psingle; qx: Psingle;
  qy: Psingle; qz: Psingle; dx: Psingle; dy: Psingle; dz: Psingle;
  qfac: Psingle); cdecl; external libniftiio;
function nifti_quatern_to_mat44(qb: single; qc: single; qd: single; qx: single; qy: single;
  qz: single; dx: single; dy: single; dz: single; qfac: single): Tmat44; cdecl; external libniftiio;
function nifti_make_orthog_mat44(r11: single; r12: single; r13: single; r21: single; r22: single;
  r23: single; r31: single; r32: single; r33: single): Tmat44; cdecl; external libniftiio;
function nifti_short_order: longint; cdecl; external libniftiio;

const
  NIFTI_L2R = 1;
  NIFTI_R2L = 2;
  NIFTI_P2A = 3;
  NIFTI_A2P = 4;
  NIFTI_I2S = 5;
  NIFTI_S2I = 6;

procedure nifti_mat44_to_orientation(R: Tmat44; icod: Plongint; jcod: Plongint; kcod: Plongint); cdecl; external libniftiio;
procedure nifti_dmat44_to_orientation(R: Tnifti_dmat44; icod: Plongint; jcod: Plongint; kcod: Plongint); cdecl; external libniftiio;

function nifti_findhdrname(fname: pchar): pchar; cdecl; external libniftiio;
function nifti_findimgname(fname: pchar; nifti_type: longint): pchar; cdecl; external libniftiio;
function nifti_is_gzfile(fname: pchar): longint; cdecl; external libniftiio;
function nifti_makebasename(fname: pchar): pchar; cdecl; external libniftiio;

function nifti_convert_nim2n1hdr(nim: Pnifti_image; hdr: Pnifti_1_header): longint; cdecl; external libniftiio;
function nifti_convert_nim2n2hdr(nim: Pnifti_image; hdr: Pnifti_2_header): longint; cdecl; external libniftiio;
function nifti_make_new_n1_header(arg_dims: Pint64_t; arg_dtype: longint): Pnifti_1_header; cdecl; external libniftiio;
function nifti_make_new_n2_header(arg_dims: Pint64_t; arg_dtype: longint): Pnifti_2_header; cdecl; external libniftiio;
function nifti_read_header(hname: pchar; nver: Plongint; check: longint): pointer; cdecl; external libniftiio;
function nifti_read_n1_hdr(hname: pchar; swapped: Plongint; check: longint): Pnifti_1_header; cdecl; external libniftiio;
function nifti_read_n2_hdr(hname: pchar; swapped: Plongint; check: longint): Pnifti_2_header; cdecl; external libniftiio;
function nifti_copy_nim_info(src: Pnifti_image): Pnifti_image; cdecl; external libniftiio;
function nifti_make_new_nim(dims: Pint64_t; datatype: longint; data_fill: longint): Pnifti_image; cdecl; external libniftiio;
function nifti_simple_init_nim: Pnifti_image; cdecl; external libniftiio;
function nifti_convert_n1hdr2nim(nhdr: Tnifti_1_header; fname: pchar): Pnifti_image; cdecl; external libniftiio;
function nifti_convert_n2hdr2nim(nhdr: Tnifti_2_header; fname: pchar): Pnifti_image; cdecl; external libniftiio;
function nifti_looks_like_cifti(nim: Pnifti_image): longint; cdecl; external libniftiio;
function nifti_hdr1_looks_good(hdr: Pnifti_1_header): longint; cdecl; external libniftiio;
function nifti_hdr2_looks_good(hdr: Pnifti_2_header): longint; cdecl; external libniftiio;
function nifti_is_valid_datatype(dtype: longint): longint; cdecl; external libniftiio;
function nifti_is_valid_ecode(ecode: longint): longint; cdecl; external libniftiio;
function nifti_nim_is_valid(nim: Pnifti_image; complain: longint): longint; cdecl; external libniftiio;
function nifti_nim_has_valid_dims(nim: Pnifti_image; complain: longint): longint; cdecl; external libniftiio;
function is_valid_nifti_type(nifti_type: longint): longint; cdecl; external libniftiio;
function nifti_test_datatype_sizes(verb: longint): longint; cdecl; external libniftiio;
function nifti_type_and_names_match(nim: Pnifti_image; show_warn: longint): longint; cdecl; external libniftiio;
function nifti_update_dims_from_array(nim: Pnifti_image): longint; cdecl; external libniftiio;
procedure nifti_set_iname_offset(nim: Pnifti_image; nifti_ver: longint); cdecl; external libniftiio;
function nifti_set_type_from_names(nim: Pnifti_image): longint; cdecl; external libniftiio;
function nifti_add_extension(nim: Pnifti_image; data: pchar; len: longint; ecode: longint): longint; cdecl; external libniftiio;
function nifti_compiled_with_zlib: longint; cdecl; external libniftiio;
function nifti_copy_extensions(nim_dest: Pnifti_image; nim_src: Pnifti_image): longint; cdecl; external libniftiio;
function nifti_free_extensions(nim: Pnifti_image): longint; cdecl; external libniftiio;
function nifti_get_int64list(nvals: Tint64_t; str: pchar): Pint64_t; cdecl; external libniftiio;
function nifti_get_intlist(nvals: longint; str: pchar): Plongint; cdecl; external libniftiio;
function nifti_strdup(str: pchar): pchar; cdecl; external libniftiio;
function valid_nifti_extensions(nim: Pnifti_image): longint; cdecl; external libniftiio;
function nifti_valid_header_size(ni_ver: longint; whine: longint): longint; cdecl; external libniftiio;

const
  NIFTI_ECODE_IGNORE = 0;
  NIFTI_ECODE_DICOM = 2;
  NIFTI_ECODE_AFNI = 4;
  NIFTI_ECODE_COMMENT = 6;
  NIFTI_ECODE_XCEDE = 8;
  NIFTI_ECODE_JIMDIMINFO = 10;
  NIFTI_ECODE_WORKFLOW_FWDS = 12;
  NIFTI_ECODE_FREESURFER = 14;
  NIFTI_ECODE_PYPICKLE = 16;
  NIFTI_ECODE_MIND_IDENT = 18;
  NIFTI_ECODE_B_VALUE = 20;
  NIFTI_ECODE_SPHERICAL_DIRECTION = 22;
  NIFTI_ECODE_DT_COMPONENT = 24;
  NIFTI_ECODE_SHC_DEGREEORDER = 26;
  NIFTI_ECODE_VOXBO = 28;
  NIFTI_ECODE_CARET = 30;
  NIFTI_ECODE_CIFTI = 32;
  NIFTI_ECODE_VARIABLE_FRAME_TIMING = 34;
  NIFTI_ECODE_EVAL = 38;
  NIFTI_ECODE_MATLAB = 40;
  NIFTI_ECODE_QUANTIPHYSE = 42;
  NIFTI_ECODE_MRS = 44;
  NIFTI_MAX_ECODE = 44;

  NIFTI_FTYPE_ANALYZE = 0;
  NIFTI_FTYPE_NIFTI1_1 = 1;
  NIFTI_FTYPE_NIFTI1_2 = 2;
  NIFTI_FTYPE_ASCII = 3;
  NIFTI_FTYPE_NIFTI2_1 = 4;
  NIFTI_FTYPE_NIFTI2_2 = 5;

  NIFTI_MAX_FTYPE = 5;

type
  Pnifti_global_options = ^Tnifti_global_options;
  Tnifti_global_options = record
    debug: longint;
    skip_blank_ext: longint;
    allow_upper_fext: longint;
    alter_cifti: longint;
  end;

  Pnifti_type_ele = ^Tnifti_type_ele;
  Tnifti_type_ele = record
    _type: longint;
    nbyper: longint;
    swapsize: longint;
    name: pchar;
  end;

const
  LSB_FIRST = 1;
  MSB_FIRST = 2;

const
  LNI_MAX_NIA_EXT_LEN = 100000;

  // === Konventiert am: 29-9-26 14:50:15 ===


implementation


end.
