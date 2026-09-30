unit fp_gifti_io;

interface

uses
  fp_nifti;

const
  {$IFDEF Linux}
  libgiftiio = 'giftiio';
  {$ENDIF}

  {$IFDEF Windows}
  libgiftiio = 'giftiio.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  // ==== /usr/include/gifti/gifti_io.h

const
  GIFTI_IND_ORD_UNDEF = 0;
  GIFTI_IND_ORD_ROW_MAJOR = 1;
  GIFTI_IND_ORD_COL_MAJOR = 2;
  GIFTI_IND_ORD_MAX = 2;
  GIFTI_DATALOC_UNDEF = 0;
  GIFTI_DATALOC_INT = 1;
  GIFTI_DATALOC_EXT = 2;
  GIFTI_DATALOC_MAX = 2;
  GIFTI_ENCODING_UNDEF = 0;
  GIFTI_ENCODING_ASCII = 1;
  GIFTI_ENCODING_B64BIN = 2;
  GIFTI_ENCODING_B64GZ = 3;
  GIFTI_ENCODING_EXTBIN = 4;
  GIFTI_ENCODING_MAX = 4;
  GIFTI_ENDIAN_UNDEF = 0;
  GIFTI_ENDIAN_BIG = 1;
  GIFTI_ENDIAN_LITTLE = 2;
  GIFTI_ENDIAN_MAX = 2;
  GIFTI_B64_CHECK_UNDEF = 0;
  GIFTI_B64_CHECK_NONE = 1;
  GIFTI_B64_CHECK_DETECT = 2;
  GIFTI_B64_CHECK_COUNT = 3;
  GIFTI_B64_CHECK_SKIP = 4;
  GIFTI_B64_CHECK_SKIPNCOUNT = 5;
  GIFTI_B64_CHECK_MAX = 5;
  GIFTI_DARRAY_DIM_LEN = 6;

const
  GZ_DEFAULT_COMPRESSION = -(1);
  GIFTI_COMP_WITH_ZLIB = 0;

var
  gifti_index_order_list: PPchar; cvar;external libgiftiio;
  gifti_dataloc_list: PPchar; cvar;external libgiftiio;
  gifti_encoding_list: PPchar; cvar;external libgiftiio;
  gifti_endian_list: PPchar; cvar;external libgiftiio;

type
  Pnvpairs = ^Tnvpairs;
  Tnvpairs = record
    length: longint;
    name: ^pchar;
    value: ^pchar;
  end;

  PgiiMetaData = ^TgiiMetaData;
  TgiiMetaData = Tnvpairs;

  PgiiLabelTable = ^TgiiLabelTable;
  TgiiLabelTable = record
    length: longint;
    key: Plongint;
    _label: ^pchar;
    rgba: Psingle;
  end;

  PgiiCoordSystem = ^TgiiCoordSystem;
  TgiiCoordSystem = record
    dataspace: pchar;
    xformspace: pchar;
    xform: array[0..3] of array[0..3] of double;
  end;

  PPPgiiDataArray = ^PPgiiDataArray;
  PPgiiDataArray = ^PgiiDataArray;
  PgiiDataArray = ^TgiiDataArray;
  TgiiDataArray = record
    intent: longint;
    datatype: longint;
    ind_ord: longint;
    num_dim: longint;
    dims: array[0..5] of longint;
    encoding: longint;
    endian: longint;
    ext_fname: pchar;
    ext_offset: int64;
    meta: TgiiMetaData;
    coordsys: ^PgiiCoordSystem;
    data: pointer;
    nvals: int64;
    nbyper: longint;
    numCS: longint;
    ex_atrs: Tnvpairs;
  end;

  Pgifti_image = ^Tgifti_image;
  Tgifti_image = record
    numDA: longint;
    version: pchar;
    meta: TgiiMetaData;
    labeltable: TgiiLabelTable;
    darray: ^PgiiDataArray;
    swapped: longint;
    compressed: longint;
    ex_atrs: Tnvpairs;
  end;

  Pgifti_globals = ^Tgifti_globals;
  Tgifti_globals = record
    verb: longint;
  end;

  Pgifti_type_ele = ^Tgifti_type_ele;
  Tgifti_type_ele = record
    _type: longint;
    nbyper: longint;
    swapsize: longint;
    name: pchar;
  end;

function gifti_read_image(fname: pchar; read_data: longint): Pgifti_image; cdecl; external libgiftiio;
function gifti_read_da_list(fname: pchar; read_data: longint; dalist: Plongint; len: longint): Pgifti_image; cdecl; external libgiftiio;
function gifti_free_image(gim: Pgifti_image): longint; cdecl; external libgiftiio;
function gifti_valid_gifti_image(gim: Pgifti_image; whine: longint): longint; cdecl; external libgiftiio;
function gifti_write_image(gim: Pgifti_image; fname: pchar; write_data: longint): longint; cdecl; external libgiftiio;
function gifti_create_image(numDA: longint; intent: longint; dtype: longint; ndim: longint; dims: Plongint;
  alloc_data: longint): Pgifti_image; cdecl; external libgiftiio;

function gifti_get_b64_check: longint; cdecl; external libgiftiio;
function gifti_set_b64_check(level: longint): longint; cdecl; external libgiftiio;
function gifti_get_indent: longint; cdecl; external libgiftiio;
function gifti_set_indent(level: longint): longint; cdecl; external libgiftiio;
function gifti_get_verb: longint; cdecl; external libgiftiio;
function gifti_set_verb(level: longint): longint; cdecl; external libgiftiio;
function gifti_get_update_ok: longint; cdecl; external libgiftiio;
function gifti_set_update_ok(level: longint): longint; cdecl; external libgiftiio;
function gifti_get_zlevel: longint; cdecl; external libgiftiio;
function gifti_set_zlevel(level: longint): longint; cdecl; external libgiftiio;

function gifti_convert_to_float(gim: Pgifti_image): longint; cdecl; external libgiftiio;
function gifti_copy_char_list(list: PPchar; len: longint): PPchar; cdecl; external libgiftiio;
function gifti_copy_all_DA_meta(dest: PgiiDataArray; src: PgiiDataArray): longint; cdecl; external libgiftiio;
function gifti_copy_DA_meta(dest: PgiiDataArray; src: PgiiDataArray; name: pchar): longint; cdecl; external libgiftiio;
function gifti_copy_DA_meta_many(dest: Pgifti_image; src: Pgifti_image; name: pchar; dalist: Plongint; len: longint): longint; cdecl; external libgiftiio;
function gifti_copy_gifti_meta(dest: Pgifti_image; src: Pgifti_image; name: pchar): longint; cdecl; external libgiftiio;
function gifti_copy_LabelTable(dest: PgiiLabelTable; src: PgiiLabelTable): longint; cdecl; external libgiftiio;
function gifti_copy_nvpairs(dest: Pnvpairs; src: Pnvpairs): longint; cdecl; external libgiftiio;
function gifti_strdup(src: pchar): pchar; cdecl; external libgiftiio;
function gifti_copy_gifti_image(gold: Pgifti_image; copy_data: longint): Pgifti_image; cdecl; external libgiftiio;
function gifti_copy_CoordSystem(src: PgiiCoordSystem): PgiiCoordSystem; cdecl; external libgiftiio;
function gifti_copy_DataArray(orig: PgiiDataArray; get_data: longint): PgiiDataArray; cdecl; external libgiftiio;
function gifti_darray_nvals(da: PgiiDataArray): int64; cdecl; external libgiftiio;
function gifti_gim_DA_size(p: Pgifti_image; in_mb: longint): int64; cdecl; external libgiftiio;
function gifti_check_swap(data: pointer; endian: longint; nsets: int64; swapsize: longint): longint; cdecl; external libgiftiio;
function gifti_datatype_sizes(datatype: longint; nbyper: Plongint; swapsize: Plongint): longint; cdecl; external libgiftiio;
function gifti_datatype2str(_type: longint): pchar; cdecl; external libgiftiio;
function gifti_get_meta_value(nvp: Pnvpairs; name: pchar): pchar; cdecl; external libgiftiio;
function gifti_get_this_endian: longint; cdecl; external libgiftiio;
function gifti_image_has_data(gim: Pgifti_image): longint; cdecl; external libgiftiio;
function gifti_intent_from_string(name: pchar): longint; cdecl; external libgiftiio;
function gifti_intent_is_valid(code: longint): longint; cdecl; external libgiftiio;
function gifti_intent_to_string(code: longint): pchar; cdecl; external libgiftiio;
function gifti_list_index2string(list: PPchar; index: longint): pchar; cdecl; external libgiftiio;
function gifti_get_xml_buf_size: longint; cdecl; external libgiftiio;
function gifti_set_xml_buf_size(buf_size: longint): longint; cdecl; external libgiftiio;
function gifti_str2attr_gifti(gim: Pgifti_image; attr: pchar; val: pchar): longint; cdecl; external libgiftiio;
function gifti_str2attr_darray(DA: PgiiDataArray; attr: pchar; value: pchar): longint; cdecl; external libgiftiio;
function gifti_str2ind_ord(str: pchar): longint; cdecl; external libgiftiio;
function gifti_str2dataloc(str: pchar): longint; cdecl; external libgiftiio;
function gifti_str2encoding(str: pchar): longint; cdecl; external libgiftiio;
function gifti_str2endian(str: pchar): longint; cdecl; external libgiftiio;
function gifti_str2datatype(str: pchar): longint; cdecl; external libgiftiio;
function gifti_swap_2bytes(data: pointer; nsets: int64): longint; cdecl; external libgiftiio;
function gifti_swap_4bytes(data: pointer; nsets: int64): longint; cdecl; external libgiftiio;
function gifti_swap_Nbytes(data: pointer; nsets: int64; swapsize: longint): longint; cdecl; external libgiftiio;
function gifti_alloc_DA_data(gim: Pgifti_image; dalist: Plongint; len: longint): longint; cdecl; external libgiftiio;
function gifti_add_empty_CS(da: PgiiDataArray): longint; cdecl; external libgiftiio;
function gifti_add_empty_darray(gim: Pgifti_image; num_to_add: longint): longint; cdecl; external libgiftiio;
function gifti_add_to_meta(md: PgiiMetaData; name: pchar; value: pchar; replace: longint): longint; cdecl; external libgiftiio;
function gifti_add_to_nvpairs(p: Pnvpairs; name: pchar; value: pchar): longint; cdecl; external libgiftiio;
function gifti_free_CoordSystem(cs: PgiiCoordSystem): longint; cdecl; external libgiftiio;
function gifti_free_CS_list(da: PgiiDataArray): longint; cdecl; external libgiftiio;
function gifti_free_DataArray_list(darray: PPgiiDataArray; numDA: longint): longint; cdecl; external libgiftiio;
function gifti_free_DataArray(darray: PgiiDataArray): longint; cdecl; external libgiftiio;
function gifti_free_LabelTable(t: PgiiLabelTable): longint; cdecl; external libgiftiio;
function gifti_free_nvpairs(p: Pnvpairs): longint; cdecl; external libgiftiio;
function gifti_read_dset_numDA(fname: pchar): longint; cdecl; external libgiftiio;
function gifti_read_extern_DA_data(da: PgiiDataArray): longint; cdecl; external libgiftiio;
function gifti_set_atr_in_DAs(gim: Pgifti_image; name: pchar; value: pchar; dalist: Plongint; len: longint): longint; cdecl; external libgiftiio;
function gifti_set_DA_atrs(da: PgiiDataArray; attr: PPchar; len: longint; add_to_extras: longint): longint; cdecl; external libgiftiio;
function gifti_set_DA_defaults(da: PgiiDataArray): longint; cdecl; external libgiftiio;
function gifti_set_DA_meta(gim: Pgifti_image; name: pchar; value: pchar; dalist: Plongint; len: longint;
  replace: longint): longint; cdecl; external libgiftiio;
function gifti_set_dims_all_DA(gim: Pgifti_image; ndim: longint; dims: Plongint): longint; cdecl; external libgiftiio;
function gifti_set_extern_filelist(gim: Pgifti_image; nfiles: longint; files: PPchar): longint; cdecl; external libgiftiio;
function gifti_update_nbyper(gim: Pgifti_image): longint; cdecl; external libgiftiio;
function gifti_valid_DataArray(da: PgiiDataArray; whine: longint): longint; cdecl; external libgiftiio;
function gifti_valid_datatype(dtype: longint; whine: longint): longint; cdecl; external libgiftiio;
function gifti_valid_dims(da: PgiiDataArray; whine: longint): longint; cdecl; external libgiftiio;
function gifti_valid_int_list(list: Plongint; len: longint; min: longint; max: longint; whine: longint): longint; cdecl; external libgiftiio;
function gifti_valid_LabelTable(T: PgiiLabelTable; whine: longint): longint; cdecl; external libgiftiio;
function gifti_valid_nbyper(nbyper: longint; whine: longint): longint; cdecl; external libgiftiio;
function gifti_valid_num_dim(num_dim: longint; whine: longint): longint; cdecl; external libgiftiio;
function gifti_valid_nvpairs(nvp: Pnvpairs; whine: longint): longint; cdecl; external libgiftiio;
function gifti_write_extern_DA_data(da: PgiiDataArray): longint; cdecl; external libgiftiio;

function gifti_approx_gifti_images(g1: Pgifti_image; g2: Pgifti_image; comp_data: longint; verb: longint): longint; cdecl; external libgiftiio;
function gifti_compare_gifti_images(g1: Pgifti_image; g2: Pgifti_image; comp_data: longint; verb: longint): longint; cdecl; external libgiftiio;
function gifti_approx_DA_pair(d1: PgiiDataArray; d2: PgiiDataArray; comp_data: longint; verb: longint): longint; cdecl; external libgiftiio;
function gifti_approx_labeltables(t1: PgiiLabelTable; t2: PgiiLabelTable; verb: longint): longint; cdecl; external libgiftiio;
function gifti_compare_coordsys(s1: PgiiCoordSystem; s2: PgiiCoordSystem; comp_data: longint; verb: longint): longint; cdecl; external libgiftiio;
function gifti_compare_DA_data(d1: PgiiDataArray; d2: PgiiDataArray; verb: longint): longint; cdecl; external libgiftiio;
function gifti_compare_DA_pair(d1: PgiiDataArray; d2: PgiiDataArray; comp_data: longint; verb: longint): longint; cdecl; external libgiftiio;
function gifti_compare_gifti_data(g1: Pgifti_image; g2: Pgifti_image; verb: longint): longint; cdecl; external libgiftiio;
function gifti_compare_gims_only(g1: Pgifti_image; g2: Pgifti_image; verb: longint): longint; cdecl; external libgiftiio;
function gifti_compare_labeltable(t1: PgiiLabelTable; t2: PgiiLabelTable; verb: longint): longint; cdecl; external libgiftiio;
function gifti_compare_nvpairs(p1: Pnvpairs; p2: Pnvpairs; verb: longint): longint; cdecl; external libgiftiio;
function gifti_strdiff(s1: pchar; s2: pchar): longint; cdecl; external libgiftiio;
function gifti_approx_diff_offset(p1: pointer; p2: pointer; length: int64; ni_type: longint; limit: double): int64; cdecl; external libgiftiio;
function gifti_compare_raw_data(p1: pointer; p2: pointer; length: int64): int64; cdecl; external libgiftiio;
function gifti_triangle_diff_offset(p1: pointer; p2: pointer; ntri: longint; ni_type: longint): longint; cdecl; external libgiftiio;

procedure gifti_disp_dtd_url; cdecl; external libgiftiio;
procedure gifti_disp_lib_hist; cdecl; external libgiftiio;
procedure gifti_disp_lib_version; cdecl; external libgiftiio;
function gifti_disp_nvpairs(mesg: pchar; p: Pnvpairs): longint; cdecl; external libgiftiio;
function gifti_disp_LabelTable(mesg: pchar; p: PgiiLabelTable): longint; cdecl; external libgiftiio;
function gifti_disp_CoordSystem(mesg: pchar; p: PgiiCoordSystem): longint; cdecl; external libgiftiio;
function gifti_disp_DataArray(mesg: pchar; p: PgiiDataArray; subs: longint): longint; cdecl; external libgiftiio;
function gifti_disp_gifti_image(mesg: pchar; p: Pgifti_image; subs: longint): longint; cdecl; external libgiftiio;
function gifti_disp_hex_data(mesg: pchar; data: pointer; len: longint; fp: PFILE): longint; cdecl; external libgiftiio;
function gifti_disp_raw_data(data: pointer; _type: longint; nvals: longint; newline: longint; stream: PFILE): longint; cdecl; external libgiftiio;
function gifti_clear_DataArray(da: PgiiDataArray): longint; cdecl; external libgiftiio;
function gifti_clear_float_zeros(str: pchar): longint; cdecl; external libgiftiio;
function gifti_clear_gifti_image(gim: Pgifti_image): longint; cdecl; external libgiftiio;
function gifti_clear_nvpairs(p: Pnvpairs): longint; cdecl; external libgiftiio;
function gifti_clear_LabelTable(p: PgiiLabelTable): longint; cdecl; external libgiftiio;
function gifti_clear_CoordSystem(p: PgiiCoordSystem): longint; cdecl; external libgiftiio;
function gifti_find_DA(gim: Pgifti_image; intent: longint; index: longint): PgiiDataArray; cdecl; external libgiftiio;
function gifti_find_DA_list(gim: Pgifti_image; intent: longint; list: PPPgiiDataArray; len: Plongint): longint; cdecl; external libgiftiio;
function gifti_DA_rows_cols(da: PgiiDataArray; rows: Pint64; cols: Pint64): longint; cdecl; external libgiftiio;
function gifticlib_version: pchar; cdecl; external libgiftiio;


// ==== /usr/include/gifti/gifti_xml.h

const
  GXML_MAX_DEPTH = 10;
  GXML_MAX_ELEN = 128;
  GIFTI_XML_VERSION = '1.0';
  GIFTI_XML_ENCODING = 'UTF-8';
  GIFTI_XML_DTD_SOURCE = 'http://gifti.projects.nitrc.org/gifti.dtd';
  GXML_ETYPE_INVALID = 0;
  GXML_ETYPE_GIFTI = 1;
  GXML_ETYPE_META = 2;
  GXML_ETYPE_MD = 3;
  GXML_ETYPE_NAME = 4;
  GXML_ETYPE_VALUE = 5;
  GXML_ETYPE_LABELTABLE = 6;
  GXML_ETYPE_LABEL = 7;
  GXML_ETYPE_DATAARRAY = 8;
  GXML_ETYPE_CSTM = 9;
  GXML_ETYPE_DATA = 10;
  GXML_ETYPE_DATASPACE = 11;
  GXML_ETYPE_XFORMSPACE = 12;
  GXML_ETYPE_MATRIXDATA = 13;
  GXML_ETYPE_CDATA = 14;
  GXML_ETYPE_LAST = 14;

type
  Pgxml_buffer = ^Tgxml_buffer;
  Tgxml_buffer = record
    nalloc: int64;
    nused: int64;
    buf: pchar;
  end;

  Pgxml_data = ^Tgxml_data;
  Tgxml_data = record
    verb: longint;
    dstore: longint;
    indent: longint;
    buf_size: longint;
    b64_check: longint;
    update_ok: longint;
    zlevel: longint;
    da_list: Plongint;
    da_len: longint;
    da_ind: longint;
    eleDA: longint;
    expDA: longint;
    b64_errors: longint;
    errors: longint;
    skip: longint;
    depth: longint;
    stack: array[0..(GXML_MAX_DEPTH + 1) - 1] of longint;
    dind: int64;
    clen: longint;
    xlen: longint;
    dlen: longint;
    doff: longint;
    zlen: longint;
    cdata: ^pchar;
    xdata: pchar;
    ddata: pchar;
    zdata: pchar;
    gim: Pgifti_image;
  end;

function gxml_read_image(fname: pchar; read_data: longint; dalist: Plongint; len: longint): Pgifti_image; cdecl; external libgiftiio;
function gxml_write_image(gim: Pgifti_image; fname: pchar; write_data: longint): longint; cdecl; external libgiftiio;
function gxml_set_verb(val: longint): longint; cdecl; external libgiftiio;
function gxml_get_verb: longint; cdecl; external libgiftiio;
function gxml_set_dstore(val: longint): longint; cdecl; external libgiftiio;
function gxml_get_dstore: longint; cdecl; external libgiftiio;
function gxml_set_indent(val: longint): longint; cdecl; external libgiftiio;
function gxml_get_indent: longint; cdecl; external libgiftiio;
function gxml_set_buf_size(val: longint): longint; cdecl; external libgiftiio;
function gxml_get_buf_size: longint; cdecl; external libgiftiio;
function gxml_set_b64_check(val: longint): longint; cdecl; external libgiftiio;
function gxml_get_b64_check: longint; cdecl; external libgiftiio;
function gxml_set_update_ok(val: longint): longint; cdecl; external libgiftiio;
function gxml_get_update_ok: longint; cdecl; external libgiftiio;
function gxml_set_zlevel(val: longint): longint; cdecl; external libgiftiio;
function gxml_get_zlevel: longint; cdecl; external libgiftiio;


// === Konventiert am: 30-9-26 16:04:18 ===


implementation


end.
