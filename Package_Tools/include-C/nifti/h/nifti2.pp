
unit nifti2;
interface

{
  Automatically converted by H2Pas 1.0.0 from nifti2.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nifti2.h
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
Pnifti_2_header  = ^nifti_2_header;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* \file nifti2.h
    \brief Header structure for NIFTI-2 format.
  }
{$ifndef __NIFTI2_HEADER}
{$define __NIFTI2_HEADER}
{--------------------------------------------------------------------------- }
{ Changes to the header from NIFTI-1 to NIFTI-2 are intended to allow for
   larger and more accurate fields.  The changes are as follows:

      - short dim[8]         -> int64_t dim[8]
      - float intent_p1,2,3  -> double intent_p1,2,3    (3 fields)
      - float pixdim[8]      -> double pixdim[8]
      - float vox_offset     -> int64_t vox_offset
      - float scl_slope      -> double scl_slope
      - float scl_inter      -> double scl_inter
      - float cal_max        -> double cal_max
      - float cal_min        -> double cal_min
      - float slice_duration -> double slice_duration
      - float toffset        -> double toffset
      - short slice_start    -> int64_t slice_start
      - short slice_end      -> int64_t slice_end
      - char slice_code      -> int32_t slice_code
      - char xyzt_units      -> int32_t xyzt_units
      - short intent_code    -> int32_t intent_code
      - short qform_code     -> int32_t qform_code
      - short sform_code     -> int32_t sform_code
      - float quatern_b,c,d  -> double quatern_b,c,d    (3 fields)
      - float srow_x,y,z[4]  -> double srow_x,y,z[4]    (3 fields)
      - char magic[4]        -> char magic[8]
      - char unused_str[15]  -> padding added at the end of the header

      - previously unused fields have been removed:
           data_type, db_name, extents, session_error, regular, glmax, glmin

      - the field order has been changed, notably with magic after sizeof_hdr

                                                          2 Jan, 2014 [rickr]
----------------------------------------------------------------------------- }
{$include <stdint.h>}
{================= }
{ C++ extern C conditionnal removed }
{================= }
{! \struct nifti_2_header
    \brief Data structure defining the fields in the nifti2 header.
           This binary header should be found at the beginning of a valid
           NIFTI-2 header file.
  }
{ hopefully cross-platform solution to byte padding added by some compilers  }
(** unsupported pragma#pragma pack(push)*)
(** unsupported pragma#pragma pack(1)*)
{*************************** }{********************* }{********** }
{ NIFTI-2 usage              }{ NIFTI-1 usage        }{  offset   }
{*************************** }{********************* }{********** }
{!< MUST be 540              }{ MUST be 348          }{   0  }
{!< MUST be valid signature  }{ char magic[4]        }{   4  }
{!< Defines data type!       }{ short datatype       }{  12  }
{!< Number bits/voxel        }{ short bitpix         }{  14  }
{!< Data array dimensions    }{ short dim[8]         }{  16  }
{!< 1st intent parameter     }{ float intent_p1      }{  80  }
{!< 2nd intent parameter     }{ float intent_p2      }{  88  }
{!< 3rd intent parameter     }{ float intent_p3      }{  96  }
{!< Grid spacings            }{ float pixdim[8]      }{ 104  }
{!< Offset into .nii file    }{ float vox_offset     }{ 168  }
{!< Data scaling: slope      }{ float scl_slope      }{ 176  }
{!< Data scaling: offset     }{ float scl_inter      }{ 184  }
{!< Max display intensity    }{ float cal_max        }{ 192  }
{!< Min display intensity    }{ float cal_min        }{ 200  }
{!< Time for 1 slice         }{ float slice_duration }{ 208  }
{!< Time axis shift          }{ float toffset        }{ 216  }
{!< First slice index        }{ short slice_start    }{ 224  }
{!< Last slice index         }{ short slice_end      }{ 232  }
{!< any text you like        }{ char descrip[80]     }{ 240  }
{!< auxiliary filename       }{ char aux_file[24]    }{ 320  }
{!< NIFTI_XFORM_* code       }{ short qform_code     }{ 344  }
{!< NIFTI_XFORM_* code       }{ short sform_code     }{ 348  }
{!< Quaternion b param       }{ float quatern_b      }{ 352  }
{!< Quaternion c param       }{ float quatern_c      }{ 360  }
{!< Quaternion d param       }{ float quatern_d      }{ 368  }
{!< Quaternion x shift       }{ float qoffset_x      }{ 376  }
{!< Quaternion y shift       }{ float qoffset_y      }{ 384  }
{!< Quaternion z shift       }{ float qoffset_z      }{ 392  }
{!< 1st row affine transform }{ float srow_x[4]      }{ 400  }
{!< 2nd row affine transform }{ float srow_y[4]      }{ 432  }
{!< 3rd row affine transform }{ float srow_z[4]      }{ 464  }
{!< Slice timing order       }{ char slice_code      }{ 496  }
{!< Units of pixdim[1..4]    }{ char xyzt_units      }{ 500  }
{!< NIFTI_INTENT_* code      }{ short intent_code    }{ 504  }
{!< name or meaning of data  }{ char intent_name[16] }{ 508  }
{!< MRI slice ordering       }{ char dim_info        }{ 524  }
{!< unused, filled with \0   }{ 525  }
type
  Pnifti_2_header = ^Tnifti_2_header;
  Tnifti_2_header = record
      sizeof_hdr : Tint32_t;
      magic : array[0..7] of char;
      datatype : Tint16_t;
      bitpix : Tint16_t;
      dim : array[0..7] of Tint64_t;
      intent_p1 : Tdouble;
      intent_p2 : Tdouble;
      intent_p3 : Tdouble;
      pixdim : array[0..7] of Tdouble;
      vox_offset : Tint64_t;
      scl_slope : Tdouble;
      scl_inter : Tdouble;
      cal_max : Tdouble;
      cal_min : Tdouble;
      slice_duration : Tdouble;
      toffset : Tdouble;
      slice_start : Tint64_t;
      slice_end : Tint64_t;
      descrip : array[0..79] of char;
      aux_file : array[0..23] of char;
      qform_code : Tint32_t;
      sform_code : Tint32_t;
      quatern_b : Tdouble;
      quatern_c : Tdouble;
      quatern_d : Tdouble;
      qoffset_x : Tdouble;
      qoffset_y : Tdouble;
      qoffset_z : Tdouble;
      srow_x : array[0..3] of Tdouble;
      srow_y : array[0..3] of Tdouble;
      srow_z : array[0..3] of Tdouble;
      slice_code : Tint32_t;
      xyzt_units : Tint32_t;
      intent_code : Tint32_t;
      intent_name : array[0..15] of char;
      dim_info : char;
      unused_str : array[0..14] of char;
    end;

{***** total bytes: 540  }
{ restore packing behavior  }
(** unsupported pragma#pragma pack(pop)*)
{ base swap test on the suggested version check, rather than dim[0]
   swap4(348)==1543569408, swap4(540)==469893120  }
{================= }
{ C++ end of extern C conditionnal removed }
{================= }
{$endif}
{ __NIFTI2_HEADER  }

implementation


end.
