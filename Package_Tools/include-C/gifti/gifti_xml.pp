
unit gifti_xml;
interface

{
  Automatically converted by H2Pas 1.0.0 from gifti_xml.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gifti_xml.h
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
Pgifti_image  = ^gifti_image;
Pgxml_buffer  = ^gxml_buffer;
Pgxml_data  = ^gxml_data;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef GIFTI_XML_H}
{$define GIFTI_XML_H}
{ maximum stack depth  }

const
  GXML_MAX_DEPTH = 10;  
{ maximum element length  }
  GXML_MAX_ELEN = 128;  
  GIFTI_XML_VERSION = '1.0';  
  GIFTI_XML_ENCODING = 'UTF-8';  
{ use non-changing address  2 Mar 2010  }
  GIFTI_XML_DTD_SOURCE = 'http://gifti.projects.nitrc.org/gifti.dtd';  
{ ----------------------------------------------------------------------
   element      depths  parent(s)       children
   -------      ------  --------------  -----------------------
   GIFTI        0                       MetaData, LabelTable, DataArray
   MetaData     1       GIFTI           MD
                2       DataArray
   MD           2,+1    MetaData        Name, Value
   Name         3,+1    MD              CDATA/char
   Value        3,+1    MD              CDATA/char
   LabelTable   1       GIFTI           Label
   Label        2       LabelTable      CDATA/char

   DataArray    1       GIFTI           MetaData, CSTM, Data
   CSTM         2       DataArray       DataSpace, TransformedSpace, MatrixData
   Data         2       DataArray
   DataSpace    3       CSTM            CDATA/char
   TransformedSpace  3  CSTM            CDATA/char
   MatrixData   3       CSTM            char


   CDATA        4,+1    Name, Value     char
                4       DataSpace       char
                4       TransformedSpace char
   char         any     any             whitespace
                5       CDATA

   -- other objects to handle --
   XML declaration:     version, encoding, standalone
   DOCTYPE:             type=GIFTI, sid=.../gifti.dtd, pid, sub
   default:
   ----------------------------------------------------------------------
 }
{ this list must match enames, and is ordered via the above comment  }
  GXML_ETYPE_INVALID = 0;  
{ GIFTI element             }
  GXML_ETYPE_GIFTI = 1;  
{ MetaData element          }
  GXML_ETYPE_META = 2;  
{ MD element                }
  GXML_ETYPE_MD = 3;  
{ Name element              }
  GXML_ETYPE_NAME = 4;  
{ Value element             }
  GXML_ETYPE_VALUE = 5;  
{ LabelTable element        }
  GXML_ETYPE_LABELTABLE = 6;  
{ Label element             }
  GXML_ETYPE_LABEL = 7;  
{ DataArray element         }
  GXML_ETYPE_DATAARRAY = 8;  
{ CSTM element              }
  GXML_ETYPE_CSTM = 9;  
{ Data element              }
  GXML_ETYPE_DATA = 10;  
{ DataSpace element         }
  GXML_ETYPE_DATASPACE = 11;  
{ TransformedSpace element  }
  GXML_ETYPE_XFORMSPACE = 12;  
{ MatrixData element        }
  GXML_ETYPE_MATRIXDATA = 13;  
{ CDATA element             }
  GXML_ETYPE_CDATA = 14;  
{ should match last entry   }
  GXML_ETYPE_LAST = 14;  
{ allocation length     }
{ number of bytes used  }
{ buffer                }
type
  Pgxml_buffer = ^Tgxml_buffer;
  Tgxml_buffer = record
      nalloc : int64;
      nused : int64;
      buf : Pchar;
    end;
{ verbose level                 }
{ flag: store data              }
{ spaces per depth level        }
{ for XML buffer                }
{ 0=no, 1=check, 2=count, 3=skip  }
{ library can update metadata   }
{ compression level -1..9       }
{ DA index list to store        }
{ DA index list length          }
{ current DA index list index   }
{ number of elements found      }
{ number of elements expected   }
{ bad chars, per DATA element   }
{ number of errors encountered  }
{ stack depth to skip           }
{ current stack depth           }
{ stack of etypes       }
{ index into data->data/xform   }
{ length of current CDATA       }
{ length of xform buffer        }
{ length of Data buffer         }
{ offset into data buffer       }
{ length of compression buffer  }
{ pointer to current CDATA      }
{ xform buffer                  }
{ I/O buffer xml->ddata->data   }
{ zlib compression buffer       }
{ pointer to returning image    }

  Pgxml_data = ^Tgxml_data;
  Tgxml_data = record
      verb : longint;
      dstore : longint;
      indent : longint;
      buf_size : longint;
      b64_check : longint;
      update_ok : longint;
      zlevel : longint;
      da_list : Plongint;
      da_len : longint;
      da_ind : longint;
      eleDA : longint;
      expDA : longint;
      b64_errors : longint;
      errors : longint;
      skip : longint;
      depth : longint;
      stack : array[0..(GXML_MAX_DEPTH+1)-1] of longint;
      dind : int64;
      clen : longint;
      xlen : longint;
      dlen : longint;
      doff : longint;
      zlen : longint;
      cdata : ^Pchar;
      xdata : Pchar;
      ddata : Pchar;
      zdata : Pchar;
      gim : Pgifti_image;
    end;
{ protos  }
{ main interface  }
(* Const before type ignored *)
(* Const before type ignored *)

function gxml_read_image(fname:Pchar; read_data:longint; dalist:Plongint; len:longint):Pgifti_image;cdecl;external;
(* Const before type ignored *)
function gxml_write_image(gim:Pgifti_image; fname:Pchar; write_data:longint):longint;cdecl;external;
function gxml_set_verb(val:longint):longint;cdecl;external;
function gxml_get_verb:longint;cdecl;external;
function gxml_set_dstore(val:longint):longint;cdecl;external;
function gxml_get_dstore:longint;cdecl;external;
function gxml_set_indent(val:longint):longint;cdecl;external;
function gxml_get_indent:longint;cdecl;external;
function gxml_set_buf_size(val:longint):longint;cdecl;external;
function gxml_get_buf_size:longint;cdecl;external;
function gxml_set_b64_check(val:longint):longint;cdecl;external;
function gxml_get_b64_check:longint;cdecl;external;
function gxml_set_update_ok(val:longint):longint;cdecl;external;
function gxml_get_update_ok:longint;cdecl;external;
function gxml_set_zlevel(val:longint):longint;cdecl;external;
function gxml_get_zlevel:longint;cdecl;external;
{$endif}
{ GIFTI_XML_H  }

implementation


end.
