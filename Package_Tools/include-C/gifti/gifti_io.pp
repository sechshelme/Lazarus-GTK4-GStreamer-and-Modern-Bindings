
unit gifti_io;
interface

{
  Automatically converted by H2Pas 1.0.0 from gifti_io.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gifti_io.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PFILE  = ^FILE;
Pgifti_globals  = ^gifti_globals;
Pgifti_image  = ^gifti_image;
Pgifti_type_ele  = ^gifti_type_ele;
PgiiCoordSystem  = ^giiCoordSystem;
PgiiDataArray  = ^giiDataArray;
PgiiLabelTable  = ^giiLabelTable;
PgiiMetaData  = ^giiMetaData;
Pint64  = ^int64;
Plongint  = ^longint;
Pnvpairs  = ^nvpairs;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef GIFTI_IO_H}
{$define GIFTI_IO_H}
{$include <zlib.h>}
{$include <expat.h>}
{$include <nifti1_io.h>}
{ also #include "gifti_xml.h", but at the end  }
{ ----------------------------------------------------------------------  }
{ These must be 0-based and sequential.
        - 0 matches _UNDEF
        - highest maches _MAX
        - list matches corresponding gifti_*_list
 }

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
{ human readable ASCII data   }
  GIFTI_ENCODING_ASCII = 1;  
{ base64 encoded binary data  }
  GIFTI_ENCODING_B64BIN = 2;  
{ base64 compressed binary    }
  GIFTI_ENCODING_B64GZ = 3;  
{ external unencoded binary   }
  GIFTI_ENCODING_EXTBIN = 4;  
  GIFTI_ENCODING_MAX = 4;  
  GIFTI_ENDIAN_UNDEF = 0;  
  GIFTI_ENDIAN_BIG = 1;  
  GIFTI_ENDIAN_LITTLE = 2;  
  GIFTI_ENDIAN_MAX = 2;  
  GIFTI_B64_CHECK_UNDEF = 0;  
{ no checking                    }
  GIFTI_B64_CHECK_NONE = 1;  
{ simply detect errors           }
  GIFTI_B64_CHECK_DETECT = 2;  
{ count the number of errors     }
  GIFTI_B64_CHECK_COUNT = 3;  
{ skip any bad chars, no count   }
  GIFTI_B64_CHECK_SKIP = 4;  
{ skip and count bad characters  }
  GIFTI_B64_CHECK_SKIPNCOUNT = 5;  
  GIFTI_B64_CHECK_MAX = 5;  
{ length of dims[] array  }
  GIFTI_DARRAY_DIM_LEN = 6;  
{ use our own #def, in case we don't have zlib  }
{$undef GZ_DEFAULT_COMPRESSION}
{$ifdef HAVE_ZLIB}
  GZ_DEFAULT_COMPRESSION = Z_DEFAULT_COMPRESSION;  
{ to show at run-time  }
  GIFTI_COMP_WITH_ZLIB = 1;  
{$else}

const
  GZ_DEFAULT_COMPRESSION = -(1);  
  GIFTI_COMP_WITH_ZLIB = 0;  
{$endif}
{ global declarations of matching lists  }
  var
    gifti_index_order_list : ^Pchar;cvar;external;
    gifti_dataloc_list : ^Pchar;cvar;external;
    gifti_encoding_list : ^Pchar;cvar;external;
    gifti_endian_list : ^Pchar;cvar;external;
{ ----------------------------------------------------------------------  }
{ notes:

        - all data should be owned by the struct, i.e. strings should be
          allocated copies, never assigned as a pointer used elsewhere
 }
type
  Pnvpairs = ^Tnvpairs;
  Tnvpairs = record
      length : longint;
      name : ^Pchar;
      value : ^Pchar;
    end;

  PgiiMetaData = ^TgiiMetaData;
  TgiiMetaData = Tnvpairs;
{ length of each array, if allocated             }
{ changed from index                 7 Mar 2010  }
{ (optional) RGBA tuples (4*length, in [0,1.0])  }

  PgiiLabelTable = ^TgiiLabelTable;
  TgiiLabelTable = record
      length : longint;
      key : Plongint;
      _label : ^Pchar;
      rgba : Psingle;
    end;
{ ******** no type specified **********  }

  PgiiCoordSystem = ^TgiiCoordSystem;
  TgiiCoordSystem = record
      dataspace : Pchar;
      xformspace : Pchar;
      xform : array[0..3] of array[0..3] of Tdouble;
    end;
{ attributes  }
{ NIFTI_INTENT code, describing data     }
{ numerical type of Data values          }
{ lowest Dim to highest, or reverse      }
{ level of DimX applied                  }
{ dimension lengths (first num_dim set)  }
{ format of Data on disk                 }
{ endian, if binary Encoding             }
{ external filename, in cur directory    }
{ offset of data within external file    }
{ elements  }
{ array of pointers to giiCoordSystem    }
{ unencoded, uncompressed, swapped       }
{ extras  }
{ number of values (product of Dims)     }
{ number of bytes per value              }
{ number of giiCoordSystem structs       }
{ extra attributes                       }

  PgiiDataArray = ^TgiiDataArray;
  TgiiDataArray = record
      intent : longint;
      datatype : longint;
      ind_ord : longint;
      num_dim : longint;
      dims : array[0..5] of longint;
      encoding : longint;
      endian : longint;
      ext_fname : Pchar;
      ext_offset : int64;
      meta : TgiiMetaData;
      coordsys : ^PgiiCoordSystem;
      data : pointer;
      nvals : int64;
      nbyper : longint;
      numCS : longint;
      ex_atrs : Tnvpairs;
    end;
{ attributes  }
{ number of DataArrays             }
{ GIFTI version string             }
{ elements  }
{ extras  }
{ were the bytes swapped           }
{ was the data compressed          }
{ extra attributes                 }

  Pgifti_image = ^Tgifti_image;
  Tgifti_image = record
      numDA : longint;
      version : Pchar;
      meta : TgiiMetaData;
      labeltable : TgiiLabelTable;
      darray : ^PgiiDataArray;
      swapped : longint;
      compressed : longint;
      ex_atrs : Tnvpairs;
    end;

  Pgifti_globals = ^Tgifti_globals;
  Tgifti_globals = record
      verb : longint;
    end;
{ should match NIFTI_TYPE_*  }
{ bytes per value            }
{ bytes per swap piece       }
{ text string match type     }

  Pgifti_type_ele = ^Tgifti_type_ele;
  Tgifti_type_ele = record
      _type : longint;
      nbyper : longint;
      swapsize : longint;
      name : Pchar;
    end;
{ prototypes  }
{ main interface protos  }
(* Const before type ignored *)

function gifti_read_image(fname:Pchar; read_data:longint):Pgifti_image;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_read_da_list(fname:Pchar; read_data:longint; dalist:Plongint; len:longint):Pgifti_image;cdecl;external;
function gifti_free_image(gim:Pgifti_image):longint;cdecl;external;
function gifti_valid_gifti_image(gim:Pgifti_image; whine:longint):longint;cdecl;external;
(* Const before type ignored *)
function gifti_write_image(gim:Pgifti_image; fname:Pchar; write_data:longint):longint;cdecl;external;
(* Const before type ignored *)
function gifti_create_image(numDA:longint; intent:longint; dtype:longint; ndim:longint; dims:Plongint; 
           alloc_data:longint):Pgifti_image;cdecl;external;
{ end main interface protos  }
function gifti_get_b64_check:longint;cdecl;external;
function gifti_set_b64_check(level:longint):longint;cdecl;external;
function gifti_get_indent:longint;cdecl;external;
function gifti_set_indent(level:longint):longint;cdecl;external;
function gifti_get_verb:longint;cdecl;external;
function gifti_set_verb(level:longint):longint;cdecl;external;
function gifti_get_update_ok:longint;cdecl;external;
function gifti_set_update_ok(level:longint):longint;cdecl;external;
function gifti_get_zlevel:longint;cdecl;external;
function gifti_set_zlevel(level:longint):longint;cdecl;external;
{ data copy routines  }
function gifti_convert_to_float(gim:Pgifti_image):longint;cdecl;external;
function gifti_copy_char_list(list:PPchar; len:longint):^Pchar;cdecl;external;
function gifti_copy_all_DA_meta(dest:PgiiDataArray; src:PgiiDataArray):longint;cdecl;external;
(* Const before type ignored *)
function gifti_copy_DA_meta(dest:PgiiDataArray; src:PgiiDataArray; name:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_copy_DA_meta_many(dest:Pgifti_image; src:Pgifti_image; name:Pchar; dalist:Plongint; len:longint):longint;cdecl;external;
(* Const before type ignored *)
function gifti_copy_gifti_meta(dest:Pgifti_image; src:Pgifti_image; name:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gifti_copy_LabelTable(dest:PgiiLabelTable; src:PgiiLabelTable):longint;cdecl;external;
(* Const before type ignored *)
function gifti_copy_nvpairs(dest:Pnvpairs; src:Pnvpairs):longint;cdecl;external;
(* Const before type ignored *)
function gifti_strdup(src:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function gifti_copy_gifti_image(gold:Pgifti_image; copy_data:longint):Pgifti_image;cdecl;external;
(* Const before type ignored *)
function gifti_copy_CoordSystem(src:PgiiCoordSystem):PgiiCoordSystem;cdecl;external;
(* Const before type ignored *)
function gifti_copy_DataArray(orig:PgiiDataArray; get_data:longint):PgiiDataArray;cdecl;external;
(* Const before type ignored *)
function gifti_darray_nvals(da:PgiiDataArray):int64;cdecl;external;
(* Const before type ignored *)
function gifti_gim_DA_size(p:Pgifti_image; in_mb:longint):int64;cdecl;external;
function gifti_check_swap(data:pointer; endian:longint; nsets:int64; swapsize:longint):longint;cdecl;external;
function gifti_datatype_sizes(datatype:longint; nbyper:Plongint; swapsize:Plongint):longint;cdecl;external;
function gifti_datatype2str(_type:longint):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_get_meta_value(nvp:Pnvpairs; name:Pchar):Pchar;cdecl;external;
function gifti_get_this_endian:longint;cdecl;external;
(* Const before type ignored *)
function gifti_image_has_data(gim:Pgifti_image):longint;cdecl;external;
(* Const before type ignored *)
function gifti_intent_from_string(name:Pchar):longint;cdecl;external;
function gifti_intent_is_valid(code:longint):longint;cdecl;external;
function gifti_intent_to_string(code:longint):Pchar;cdecl;external;
function gifti_list_index2string(list:PPchar; index:longint):Pchar;cdecl;external;
function gifti_get_xml_buf_size:longint;cdecl;external;
function gifti_set_xml_buf_size(buf_size:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_str2attr_gifti(gim:Pgifti_image; attr:Pchar; val:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_str2attr_darray(DA:PgiiDataArray; attr:Pchar; value:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gifti_str2ind_ord(str:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gifti_str2dataloc(str:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gifti_str2encoding(str:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gifti_str2endian(str:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gifti_str2datatype(str:Pchar):longint;cdecl;external;
function gifti_swap_2bytes(data:pointer; nsets:int64):longint;cdecl;external;
function gifti_swap_4bytes(data:pointer; nsets:int64):longint;cdecl;external;
function gifti_swap_Nbytes(data:pointer; nsets:int64; swapsize:longint):longint;cdecl;external;
(* Const before type ignored *)
function gifti_alloc_DA_data(gim:Pgifti_image; dalist:Plongint; len:longint):longint;cdecl;external;
function gifti_add_empty_CS(da:PgiiDataArray):longint;cdecl;external;
function gifti_add_empty_darray(gim:Pgifti_image; num_to_add:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_add_to_meta(md:PgiiMetaData; name:Pchar; value:Pchar; replace:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_add_to_nvpairs(p:Pnvpairs; name:Pchar; value:Pchar):longint;cdecl;external;
function gifti_free_CoordSystem(cs:PgiiCoordSystem):longint;cdecl;external;
function gifti_free_CS_list(da:PgiiDataArray):longint;cdecl;external;
function gifti_free_DataArray_list(darray:PPgiiDataArray; numDA:longint):longint;cdecl;external;
function gifti_free_DataArray(darray:PgiiDataArray):longint;cdecl;external;
function gifti_free_LabelTable(t:PgiiLabelTable):longint;cdecl;external;
function gifti_free_nvpairs(p:Pnvpairs):longint;cdecl;external;
(* Const before type ignored *)
function gifti_read_dset_numDA(fname:Pchar):longint;cdecl;external;
function gifti_read_extern_DA_data(da:PgiiDataArray):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_set_atr_in_DAs(gim:Pgifti_image; name:Pchar; value:Pchar; dalist:Plongint; len:longint):longint;cdecl;external;
(* Const before type ignored *)
function gifti_set_DA_atrs(da:PgiiDataArray; attr:PPchar; len:longint; add_to_extras:longint):longint;cdecl;external;
function gifti_set_DA_defaults(da:PgiiDataArray):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_set_DA_meta(gim:Pgifti_image; name:Pchar; value:Pchar; dalist:Plongint; len:longint; 
           replace:longint):longint;cdecl;external;
(* Const before type ignored *)
function gifti_set_dims_all_DA(gim:Pgifti_image; ndim:longint; dims:Plongint):longint;cdecl;external;
function gifti_set_extern_filelist(gim:Pgifti_image; nfiles:longint; files:PPchar):longint;cdecl;external;
function gifti_update_nbyper(gim:Pgifti_image):longint;cdecl;external;
(* Const before type ignored *)
function gifti_valid_DataArray(da:PgiiDataArray; whine:longint):longint;cdecl;external;
function gifti_valid_datatype(dtype:longint; whine:longint):longint;cdecl;external;
(* Const before type ignored *)
function gifti_valid_dims(da:PgiiDataArray; whine:longint):longint;cdecl;external;
(* Const before type ignored *)
function gifti_valid_int_list(list:Plongint; len:longint; min:longint; max:longint; whine:longint):longint;cdecl;external;
(* Const before type ignored *)
function gifti_valid_LabelTable(T:PgiiLabelTable; whine:longint):longint;cdecl;external;
function gifti_valid_nbyper(nbyper:longint; whine:longint):longint;cdecl;external;
function gifti_valid_num_dim(num_dim:longint; whine:longint):longint;cdecl;external;
(* Const before type ignored *)
function gifti_valid_nvpairs(nvp:Pnvpairs; whine:longint):longint;cdecl;external;
function gifti_write_extern_DA_data(da:PgiiDataArray):longint;cdecl;external;
{ comparison functions  }
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_approx_gifti_images(g1:Pgifti_image; g2:Pgifti_image; comp_data:longint; verb:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_compare_gifti_images(g1:Pgifti_image; g2:Pgifti_image; comp_data:longint; verb:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_approx_DA_pair(d1:PgiiDataArray; d2:PgiiDataArray; comp_data:longint; verb:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_approx_labeltables(t1:PgiiLabelTable; t2:PgiiLabelTable; verb:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_compare_coordsys(s1:PgiiCoordSystem; s2:PgiiCoordSystem; comp_data:longint; verb:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_compare_DA_data(d1:PgiiDataArray; d2:PgiiDataArray; verb:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_compare_DA_pair(d1:PgiiDataArray; d2:PgiiDataArray; comp_data:longint; verb:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_compare_gifti_data(g1:Pgifti_image; g2:Pgifti_image; verb:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_compare_gims_only(g1:Pgifti_image; g2:Pgifti_image; verb:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_compare_labeltable(t1:PgiiLabelTable; t2:PgiiLabelTable; verb:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_compare_nvpairs(p1:Pnvpairs; p2:Pnvpairs; verb:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_strdiff(s1:Pchar; s2:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_approx_diff_offset(p1:pointer; p2:pointer; length:int64; ni_type:longint; limit:Tdouble):int64;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_compare_raw_data(p1:pointer; p2:pointer; length:int64):int64;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_triangle_diff_offset(p1:pointer; p2:pointer; ntri:longint; ni_type:longint):longint;cdecl;external;
{ display functions  }
procedure gifti_disp_dtd_url;cdecl;external;
procedure gifti_disp_lib_hist;cdecl;external;
procedure gifti_disp_lib_version;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_disp_nvpairs(mesg:Pchar; p:Pnvpairs):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_disp_LabelTable(mesg:Pchar; p:PgiiLabelTable):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_disp_CoordSystem(mesg:Pchar; p:PgiiCoordSystem):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_disp_DataArray(mesg:Pchar; p:PgiiDataArray; subs:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_disp_gifti_image(mesg:Pchar; p:Pgifti_image; subs:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gifti_disp_hex_data(mesg:Pchar; data:pointer; len:longint; fp:PFILE):longint;cdecl;external;
(* Const before type ignored *)
function gifti_disp_raw_data(data:pointer; _type:longint; nvals:longint; newline:longint; stream:PFILE):longint;cdecl;external;
function gifti_clear_DataArray(da:PgiiDataArray):longint;cdecl;external;
function gifti_clear_float_zeros(str:Pchar):longint;cdecl;external;
function gifti_clear_gifti_image(gim:Pgifti_image):longint;cdecl;external;
function gifti_clear_nvpairs(p:Pnvpairs):longint;cdecl;external;
function gifti_clear_LabelTable(p:PgiiLabelTable):longint;cdecl;external;
function gifti_clear_CoordSystem(p:PgiiCoordSystem):longint;cdecl;external;
function gifti_find_DA(gim:Pgifti_image; intent:longint; index:longint):PgiiDataArray;cdecl;external;
function gifti_find_DA_list(gim:Pgifti_image; intent:longint; list:PPPgiiDataArray; len:Plongint):longint;cdecl;external;
function gifti_DA_rows_cols(da:PgiiDataArray; rows:Pint64; cols:Pint64):longint;cdecl;external;
function gifticlib_version:Pchar;cdecl;external;
{$undef G_CHECK_NULL_STR}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CHECK_NULL_STR(s : longint) : longint;

{$include "gifti_xml.h" /* needs gifti_io.h, but users should not #include it */}
{$endif}
{ GIFTI_IO_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CHECK_NULL_STR(s : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if s then
    if_local1:=s
  else
    if_local1:='NULL';
  G_CHECK_NULL_STR:=if_local1;
end;


end.
