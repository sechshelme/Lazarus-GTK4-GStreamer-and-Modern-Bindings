
unit nifti2_io;
interface

{
  Automatically converted by H2Pas 1.0.0 from nifti2_io.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nifti2_io.h
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
Panalyze75_orient_code  = ^analyze75_orient_code;
Panalyze_75_orient_code  = ^analyze_75_orient_code;
Pchar  = ^char;
Pdouble  = ^double;
Pint64_t  = ^int64_t;
Plongint  = ^longint;
Pmat33  = ^mat33;
Pmat44  = ^mat44;
Pnifti1_extension  = ^nifti1_extension;
Pnifti1_image  = ^nifti1_image;
Pnifti2_image  = ^nifti2_image;
Pnifti_1_header  = ^nifti_1_header;
Pnifti_2_header  = ^nifti_2_header;
Pnifti_analyze75  = ^nifti_analyze75;
Pnifti_brick_list  = ^nifti_brick_list;
Pnifti_dmat33  = ^nifti_dmat33;
Pnifti_dmat44  = ^nifti_dmat44;
Pnifti_global_options  = ^nifti_global_options;
Pnifti_image  = ^nifti_image;
Pnifti_type_ele  = ^nifti_type_ele;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* \file nifti2_io.h
    \brief Data structures for using nifti2_io API.
           - Written by Bob Cox, SSCC NIMH
           - Revisions by Rick Reynolds, SSCC NIMH
  }
{$ifndef _NIFTI2_IO_HEADER_}
{$define _NIFTI2_IO_HEADER_}
{$include <stdio.h>}
{$include <stdlib.h>}
{$include <string.h>}
{$include <math.h>}
{$include <limits.h>}
{$include <ctype.h>}
{$include <inttypes.h>}
{$ifndef DONT_INCLUDE_ANALYZE_STRUCT}
{** not needed herein ** }
{$define DONT_INCLUDE_ANALYZE_STRUCT}
{$endif}
{$include "nifti1.h"                  /*** NIFTI-1 header specification ***/}
{$include "nifti2.h"                  /*** NIFTI-2 header specification ***/}
{$include <znzlib.h>}
{================= }
{ C++ extern C conditionnal removed }
{================= }
{****===================================================================**** }
{****         File nifti2_io.h == Declarations for nifti2_io.c          **** }
{****...................................................................**** }
{****            This code is a modification of nifti1_io.h.            **** }
{****...................................................................**** }
{****            This code is released to the public domain.            **** }
{****...................................................................**** }
{****  Author: Robert W Cox, SSCC/DIRP/NIMH/NIH/DHHS/USA/EARTH          **** }
{****  Date:   August 2003                                              **** }
{****...................................................................**** }
{****  Neither the National Institutes of Health (NIH), nor any of its  **** }
{****  employees imply any warranty of usefulness of this software for  **** }
{****  any purpose, and do not assume any liability for damages,        **** }
{****  incidental or otherwise, caused by any use of this document.     **** }
{****===================================================================**** }
{ ......................................................................
   Modified by: Mark Jenkinson (FMRIB Centre, University of Oxford, UK)
   Date: July/August 2004

      Mainly adding low-level IO and changing things to allow gzipped files
      to be read and written
      Full backwards compatability should have been maintained

   ......................................................................
   Modified by: Rick Reynolds (SSCC/DIRP/NIMH, National Institutes of Health)
   Date: December 2004

      Modified and added many routines for I/O, particularly involving
      extensions and nifti_brick_list.

   ......................................................................
   Modified by: Rick Reynolds (SSCC/DIRP/NIMH, National Institutes of Health)
   Date: August 2013

      Converted to be based on nifti_2_header.

      ** NOT BACKWARD COMPATABLE **

      These routines will read/write both NIFTI-1 and NIFTI-2 image files,
      but modification to the _calling_ routies is necessary, since:

        a. the main nifti_image type has changed (to nifti2_image)
        b. some image field types have been altered (to have larger size)
        c. some routines have been changed to apply to multiple NIFTI types
 }
{********************* Some sample data structures ************************* }
{* 4x4 matrix struct * }
type
  Pmat44 = ^Tmat44;
  Tmat44 = record
      m : array[0..3] of array[0..3] of single;
    end;
{* 3x3 matrix struct * }

  Pmat33 = ^Tmat33;
  Tmat33 = record
      m : array[0..2] of array[0..2] of single;
    end;
{* 4x4 matrix struct (double) * }

  Pnifti_dmat44 = ^Tnifti_dmat44;
  Tnifti_dmat44 = record
      m : array[0..3] of array[0..3] of Tdouble;
    end;
{* 3x3 matrix struct (double) * }

  Pnifti_dmat33 = ^Tnifti_dmat33;
  Tnifti_dmat33 = record
      m : array[0..2] of array[0..2] of Tdouble;
    end;
{........................................................................... }
{! \enum analyze_75_orient_code
 *  \brief Old-style analyze75 orientation
 *         codes.
  }

  Panalyze75_orient_code = ^Tanalyze75_orient_code;
  Tanalyze75_orient_code =  Longint;
  Const
    a75_transverse_unflipped = 0;
    a75_coronal_unflipped = 1;
    a75_sagittal_unflipped = 2;
    a75_transverse_flipped = 3;
    a75_coronal_flipped = 4;
    a75_sagittal_flipped = 5;
    a75_orient_unknown = 6;
;
  Tanalyze_75_orient_code = Tanalyze75_orient_code;
  Panalyze_75_orient_code = ^Tanalyze_75_orient_code;
{! \struct nifti_image
    \brief High level data structure for open nifti datasets in the
           nifti2_io API.  Note that this structure is not part of the
           nifti2 format definition; it is used to implement one API
           for reading/writing datasets in the nifti1 or nifti2 formats.

    Field types changed for NIFTI-2 (note: ALL floats to doubles):
        nx, ny, ..., nw, dim, nvox,
        dx, dy, ..., dw, pixdim,
        scl_slope, scl_inter, cal_min, cal_max,
        slice_start, slice_end, slice_duration,
        quatern_b,c,d, qoffset_x,y,z, qfac,
        qto_xyz,ijk, sto_xyz,ijk,
        toffset, intent_p1,2,3, iname_offset
  }
{!< Image storage struct * }
{!< last dimension greater than 1 (1..7)  }
{!< dimensions of grid array              }
{!< dimensions of grid array              }
{!< dimensions of grid array              }
{!< dimensions of grid array              }
{!< dimensions of grid array              }
{!< dimensions of grid array              }
{!< dimensions of grid array              }
{!< dim[0]=ndim, dim[1]=nx, etc.          }
{!< number of voxels = nx*ny*nz*...*nw    }
{!< bytes per voxel, matches datatype     }
{!< type of data in voxels: DT_* code     }
{!< grid spacings       }
{!< grid spacings       }
{!< grid spacings       }
{!< grid spacings       }
{!< grid spacings       }
{!< grid spacings       }
{!< grid spacings       }
{!< pixdim[1]=dx, etc.  }
{!< scaling parameter - slope         }
{!< scaling parameter - intercept     }
{!< calibration parameter, minimum    }
{!< calibration parameter, maximum    }
{!< codes for (x,y,z) space meaning   }
{!< codes for (x,y,z) space meaning   }
{!< indexes (1,2,3, or 0) for MRI     }
{!< directions in dim[]/pixdim[]      }
{!< directions in dim[]/pixdim[]      }
{!< code for slice timing pattern     }
{!< index for start of slices         }
{!< index for end of slices           }
{!< time between individual slices    }
{! quaternion transform parameters
    [when writing a dataset, these are used for qform, NOT qto_xyz]    }
{!< qform: transform (i,j,k) to (x,y,z)  }
{!< qform: transform (x,y,z) to (i,j,k)  }
{!< sform: transform (i,j,k) to (x,y,z)  }
{!< sform: transform (x,y,z) to (i,j,k)  }
{!< time coordinate offset  }
{!< dx,dy,dz units: NIFTI_UNITS_* code   }
{!< dt       units: NIFTI_UNITS_* code   }
{!< see NIFTI_FTYPE_* codes, below:
                                        0==ANALYZE,
                                        1==NIFTI-1     (1 file),
                                        2==NIFTI-1     (2 files),
                                        3==NIFTI-ASCII (1 file)
                                        4==NIFTI-2     (1 file),
                                        5==NIFTI-2     (2 files)  }
{!< statistic type (or something)        }
{!< intent parameters                    }
{!< intent parameters                    }
{!< intent parameters                    }
{!< optional description of intent data  }
{!< optional text to describe dataset    }
{!< auxiliary filename                   }
{!< header filename (.hdr or .nii)          }
{!< image filename  (.img or .nii)          }
{!< offset into iname where data starts     }
{!< swap unit in image data (might be 0)    }
{!< byte order on disk (MSB_ or LSB_FIRST)  }
{!< pointer to data: nbyper*nvox bytes      }
{!< number of extensions in ext_list        }
{!< array of extension structs (with data)  }
{!< for old analyze files, orient  }
type
  Pnifti_image = ^Tnifti_image;
  Tnifti_image = record
      ndim : Tint64_t;
      nx : Tint64_t;
      ny : Tint64_t;
      nz : Tint64_t;
      nt : Tint64_t;
      nu : Tint64_t;
      nv : Tint64_t;
      nw : Tint64_t;
      dim : array[0..7] of Tint64_t;
      nvox : Tint64_t;
      nbyper : longint;
      datatype : longint;
      dx : Tdouble;
      dy : Tdouble;
      dz : Tdouble;
      dt : Tdouble;
      du : Tdouble;
      dv : Tdouble;
      dw : Tdouble;
      pixdim : array[0..7] of Tdouble;
      scl_slope : Tdouble;
      scl_inter : Tdouble;
      cal_min : Tdouble;
      cal_max : Tdouble;
      qform_code : longint;
      sform_code : longint;
      freq_dim : longint;
      phase_dim : longint;
      slice_dim : longint;
      slice_code : longint;
      slice_start : Tint64_t;
      slice_end : Tint64_t;
      slice_duration : Tdouble;
      quatern_b : Tdouble;
      quatern_c : Tdouble;
      quatern_d : Tdouble;
      qoffset_x : Tdouble;
      qoffset_y : Tdouble;
      qoffset_z : Tdouble;
      qfac : Tdouble;
      qto_xyz : Tnifti_dmat44;
      qto_ijk : Tnifti_dmat44;
      sto_xyz : Tnifti_dmat44;
      sto_ijk : Tnifti_dmat44;
      toffset : Tdouble;
      xyz_units : longint;
      time_units : longint;
      nifti_type : longint;
      intent_code : longint;
      intent_p1 : Tdouble;
      intent_p2 : Tdouble;
      intent_p3 : Tdouble;
      intent_name : array[0..15] of char;
      descrip : array[0..79] of char;
      aux_file : array[0..23] of char;
      fname : Pchar;
      iname : Pchar;
      iname_offset : Tint64_t;
      swapsize : longint;
      byteorder : longint;
      data : pointer;
      num_ext : longint;
      ext_list : Pnifti1_extension;
      analyze75_orient : Tanalyze_75_orient_code;
    end;
{ allow clarity  }

  Pnifti2_image = ^Tnifti2_image;
  Tnifti2_image = Tnifti_image;
{!< last dimension greater than 1 (1..7)  }
{!< dimensions of grid array              }
{!< dimensions of grid array              }
{!< dimensions of grid array              }
{!< dimensions of grid array              }
{!< dimensions of grid array              }
{!< dimensions of grid array              }
{!< dimensions of grid array              }
{!< dim[0]=ndim, dim[1]=nx, etc.          }
{!< number of voxels = nx*ny*nz*...*nw    }
{!< bytes per voxel, matches datatype     }
{!< type of data in voxels: DT_* code     }
{!< grid spacings       }
{!< grid spacings       }
{!< grid spacings       }
{!< grid spacings       }
{!< grid spacings       }
{!< grid spacings       }
{!< grid spacings       }
{!< pixdim[1]=dx, etc.  }
{!< scaling parameter - slope         }
{!< scaling parameter - intercept     }
{!< calibration parameter, minimum    }
{!< calibration parameter, maximum    }
{!< codes for (x,y,z) space meaning   }
{!< codes for (x,y,z) space meaning   }
{!< indexes (1,2,3, or 0) for MRI     }
{!< directions in dim[]/pixdim[]      }
{!< directions in dim[]/pixdim[]      }
{!< code for slice timing pattern     }
{!< index for start of slices         }
{!< index for end of slices           }
{!< time between individual slices    }
{! quaternion transform parameters
    [when writing a dataset, these are used for qform, NOT qto_xyz]    }
{!< qform: transform (i,j,k) to (x,y,z)  }
{!< qform: transform (x,y,z) to (i,j,k)  }
{!< sform: transform (i,j,k) to (x,y,z)  }
{!< sform: transform (x,y,z) to (i,j,k)  }
{!< time coordinate offset  }
{!< dx,dy,dz units: NIFTI_UNITS_* code   }
{!< dt       units: NIFTI_UNITS_* code   }
{!< 0==ANALYZE, 1==NIFTI-1 (1 file),
                                                 2==NIFTI-1 (2 files),
                                                 3==NIFTI-ASCII (1 file)  }
{!< statistic type (or something)        }
{!< intent parameters                    }
{!< intent parameters                    }
{!< intent parameters                    }
{!< optional description of intent data  }
{!< optional text to describe dataset    }
{!< auxiliary filename                   }
{!< header filename (.hdr or .nii)          }
{!< image filename  (.img or .nii)          }
{!< offset into iname where data starts     }
{!< swap unit in image data (might be 0)    }
{!< byte order on disk (MSB_ or LSB_FIRST)  }
{!< pointer to data: nbyper*nvox bytes      }
{!< number of extensions in ext_list        }
{!< array of extension structs (with data)  }
{!< for old analyze files, orient  }

  Pnifti1_image = ^Tnifti1_image;
  Tnifti1_image = record
      ndim : longint;
      nx : longint;
      ny : longint;
      nz : longint;
      nt : longint;
      nu : longint;
      nv : longint;
      nw : longint;
      dim : array[0..7] of longint;
      nvox : Tint64_t;
      nbyper : longint;
      datatype : longint;
      dx : single;
      dy : single;
      dz : single;
      dt : single;
      du : single;
      dv : single;
      dw : single;
      pixdim : array[0..7] of single;
      scl_slope : single;
      scl_inter : single;
      cal_min : single;
      cal_max : single;
      qform_code : longint;
      sform_code : longint;
      freq_dim : longint;
      phase_dim : longint;
      slice_dim : longint;
      slice_code : longint;
      slice_start : longint;
      slice_end : longint;
      slice_duration : single;
      quatern_b : single;
      quatern_c : single;
      quatern_d : single;
      qoffset_x : single;
      qoffset_y : single;
      qoffset_z : single;
      qfac : single;
      qto_xyz : Tmat44;
      qto_ijk : Tmat44;
      sto_xyz : Tmat44;
      sto_ijk : Tmat44;
      toffset : single;
      xyz_units : longint;
      time_units : longint;
      nifti_type : longint;
      intent_code : longint;
      intent_p1 : single;
      intent_p2 : single;
      intent_p3 : single;
      intent_name : array[0..15] of char;
      descrip : array[0..79] of char;
      aux_file : array[0..23] of char;
      fname : Pchar;
      iname : Pchar;
      iname_offset : longint;
      swapsize : longint;
      byteorder : longint;
      data : pointer;
      num_ext : longint;
      ext_list : Pnifti1_extension;
      analyze75_orient : Tanalyze_75_orient_code;
    end;
{ struct for return from nifti_image_read_bricks()  }
{ the number of allocated pointers in 'bricks'  }
{ the length of each data block, in bytes       }
{ array of pointers to data blocks              }

  Pnifti_brick_list = ^Tnifti_brick_list;
  Tnifti_brick_list = record
      nbricks : Tint64_t;
      bsize : Tint64_t;
      bricks : ^pointer;
    end;
{*************************************************************************** }
{------------------ NIfTI version of ANALYZE 7.5 structure ----------------- }
{ (based on fsliolib/dbh.h, but updated for version 7.5)  }
{ header info fields - describes the header    overlap with NIfTI  }
{                                              ------------------  }
{ 0 + 4        same               }
{ 4 + 10       same               }
{ 14 + 18      same               }
{ 32 + 4       same               }
{ 36 + 2       same               }
{ 38 + 1       same               }
{ 39 + 1                40 bytes  }
{ image dimension fields - describes image sizes  }
{ 0 + 16       same               }
{ 16 + 2       intent_p1...       }
{ 18 + 2         ...              }
{ 20 + 2       intent_p2...       }
{ 22 + 2         ...              }
{ 24 + 2       intent_p3...       }
{ 26 + 2         ...              }
{ 28 + 2       intent_code        }
{ 30 + 2       same               }
{ 32 + 2       same               }
{ 34 + 2       slice_start        }
{ 36 + 32      same               }
{ 68 + 4       same               }
{ 72 + 4       scl_slope          }
{ 76 + 4       scl_inter          }
{ 80 + 4       slice_end,         }
{ slice_code,        }
{ xyzt_units         }
{ 84 + 4       same               }
{ 88 + 4       same               }
{ 92 + 4       slice_duration     }
{ 96 + 4       toffset            }
{ 100 + 8              108 bytes  }
{ data history fields - optional  }
{ 0 + 80       same               }
{ 80 + 24      same               }
{ 104 + 1      NO GOOD OVERLAP    }
{ 105 + 10     FROM HERE DOWN...  }
{ 115 + 10                        }
{ 125 + 10                        }
{ 135 + 10                        }
{ 145 + 10                        }
{ 155 + 10                        }
{ 165 + 3                         }
{ 168 + 4                         }
{ 172 + 4                         }
{ 176 + 4                         }
{ 180 + 4                         }
{ 184 + 8                         }
{ 192 + 8              200 bytes  }

  Pnifti_analyze75 = ^Tnifti_analyze75;
  Tnifti_analyze75 = record
      sizeof_hdr : longint;
      data_type : array[0..9] of char;
      db_name : array[0..17] of char;
      extents : longint;
      session_error : smallint;
      regular : char;
      hkey_un0 : char;
      dim : array[0..7] of smallint;
      unused8 : smallint;
      unused9 : smallint;
      unused10 : smallint;
      unused11 : smallint;
      unused12 : smallint;
      unused13 : smallint;
      unused14 : smallint;
      datatype : smallint;
      bitpix : smallint;
      dim_un0 : smallint;
      pixdim : array[0..7] of single;
      vox_offset : single;
      funused1 : single;
      funused2 : single;
      funused3 : single;
      cal_max : single;
      cal_min : single;
      compressed : single;
      verified : single;
      glmax : longint;
      glmin : longint;
      descrip : array[0..79] of char;
      aux_file : array[0..23] of char;
      orient : char;
      originator : array[0..9] of char;
      generated : array[0..9] of char;
      scannum : array[0..9] of char;
      patient_id : array[0..9] of char;
      exp_date : array[0..9] of char;
      exp_time : array[0..9] of char;
      hist_un0 : array[0..2] of char;
      views : longint;
      vols_added : longint;
      start_field : longint;
      field_skip : longint;
      omax : longint;
      omin : longint;
      smax : longint;
      smin : longint;
    end;
{ total:  348 bytes  }
{*************************************************************************** }
{--------------- Prototypes of functions defined in this file -------------- }
(* Const before declarator ignored *)

function nifti_datatype_string(dt:longint):Pchar;cdecl;external;
(* Const before declarator ignored *)
function nifti_units_string(uu:longint):Pchar;cdecl;external;
(* Const before declarator ignored *)
function nifti_intent_string(ii:longint):Pchar;cdecl;external;
(* Const before declarator ignored *)
function nifti_xform_string(xx:longint):Pchar;cdecl;external;
(* Const before declarator ignored *)
function nifti_slice_string(ss:longint):Pchar;cdecl;external;
(* Const before declarator ignored *)
function nifti_orientation_string(ii:longint):Pchar;cdecl;external;
function nifti_is_inttype(dt:longint):longint;cdecl;external;
function nifti_mat44_inverse(R:Tmat44):Tmat44;cdecl;external;
function nifti_mat44_mul(A:Tmat44; B:Tmat44):Tmat44;cdecl;external;
function nifti_dmat44_inverse(R:Tnifti_dmat44):Tnifti_dmat44;cdecl;external;
function nifti_mat44_to_dmat44(fm:Pmat44; dm:Pnifti_dmat44):longint;cdecl;external;
function nifti_dmat44_to_mat44(dm:Pnifti_dmat44; fm:Pmat44):longint;cdecl;external;
function nifti_dmat44_mul(A:Tnifti_dmat44; B:Tnifti_dmat44):Tnifti_dmat44;cdecl;external;
function nifti_dmat33_inverse(R:Tnifti_dmat33):Tnifti_dmat33;cdecl;external;
function nifti_dmat33_polar(A:Tnifti_dmat33):Tnifti_dmat33;cdecl;external;
function nifti_dmat33_rownorm(A:Tnifti_dmat33):Tdouble;cdecl;external;
function nifti_dmat33_colnorm(A:Tnifti_dmat33):Tdouble;cdecl;external;
function nifti_dmat33_determ(R:Tnifti_dmat33):Tdouble;cdecl;external;
function nifti_dmat33_mul(A:Tnifti_dmat33; B:Tnifti_dmat33):Tnifti_dmat33;cdecl;external;
function nifti_mat33_inverse(R:Tmat33):Tmat33;cdecl;external;
function nifti_mat33_polar(A:Tmat33):Tmat33;cdecl;external;
function nifti_mat33_rownorm(A:Tmat33):single;cdecl;external;
function nifti_mat33_colnorm(A:Tmat33):single;cdecl;external;
function nifti_mat33_determ(R:Tmat33):single;cdecl;external;
function nifti_mat33_mul(A:Tmat33; B:Tmat33):Tmat33;cdecl;external;
procedure nifti_swap_2bytes(n:Tint64_t; ar:pointer);cdecl;external;
procedure nifti_swap_4bytes(n:Tint64_t; ar:pointer);cdecl;external;
procedure nifti_swap_8bytes(n:Tint64_t; ar:pointer);cdecl;external;
procedure nifti_swap_16bytes(n:Tint64_t; ar:pointer);cdecl;external;
procedure nifti_swap_Nbytes(n:Tint64_t; siz:longint; ar:pointer);cdecl;external;
function nifti_datatype_is_valid(dtype:longint; for_nifti:longint):longint;cdecl;external;
(* Const before type ignored *)
function nifti_datatype_from_string(name:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function nifti_datatype_to_string(dtype:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function nifti_header_version(buf:Pchar; nbytes:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function nifti_get_filesize(pathname:Pchar):Tint64_t;cdecl;external;
procedure swap_nifti_header(hdr:pointer; ni_ver:longint);cdecl;external;
procedure old_swap_nifti_header(h:Pnifti_1_header; is_nifti:longint);cdecl;external;
procedure nifti_swap_as_analyze(h:Pnifti_analyze75);cdecl;external;
procedure nifti_swap_as_nifti1(h:Pnifti_1_header);cdecl;external;
procedure nifti_swap_as_nifti2(h:Pnifti_2_header);cdecl;external;
{ main read/write routines  }
(* Const before type ignored *)
(* Const before type ignored *)
function nifti_image_read_bricks(hname:Pchar; nbricks:Tint64_t; blist:Pint64_t; NBL:Pnifti_brick_list):Pnifti_image;cdecl;external;
(* Const before type ignored *)
function nifti_image_load_bricks(nim:Pnifti_image; nbricks:Tint64_t; blist:Pint64_t; NBL:Pnifti_brick_list):longint;cdecl;external;
procedure nifti_free_NBL(NBL:Pnifti_brick_list);cdecl;external;
(* Const before type ignored *)
function nifti_image_read(hname:Pchar; read_data:longint):Pnifti_image;cdecl;external;
function nifti_image_load(nim:Pnifti_image):longint;cdecl;external;
procedure nifti_image_unload(nim:Pnifti_image);cdecl;external;
procedure nifti_image_free(nim:Pnifti_image);cdecl;external;
(* Const before type ignored *)
function nifti_read_collapsed_image(nim:Pnifti_image; dims:array[0..7] of Tint64_t; data:Ppointer):Tint64_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nifti_read_subregion_image(nim:Pnifti_image; start_index:Pint64_t; region_size:Pint64_t; data:Ppointer):Tint64_t;cdecl;external;
procedure nifti_image_write(nim:Pnifti_image);cdecl;external;
(* Const before type ignored *)
procedure nifti_image_write_bricks(nim:Pnifti_image; NBL:Pnifti_brick_list);cdecl;external;
(* Const before type ignored *)
procedure nifti_image_infodump(nim:Pnifti_image);cdecl;external;
procedure nifti_disp_lib_hist(ver:longint);cdecl;external;
{ to display library history  }
procedure nifti_disp_lib_version;cdecl;external;
{ to display library version  }
(* Const before type ignored *)
function nifti_disp_matrix_orient(mesg:Pchar; mat:Tnifti_dmat44):longint;cdecl;external;
function nifti_disp_type_list(which:longint):longint;cdecl;external;
(* Const before type ignored *)
function nifti_image_to_ascii(nim:Pnifti_image):Pchar;cdecl;external;
(* Const before type ignored *)
function nifti_image_from_ascii(str:Pchar; bytes_read:Plongint):Pnifti_image;cdecl;external;
(* Const before type ignored *)
function nifti_get_volsize(nim:Pnifti_image):Tint64_t;cdecl;external;
{ basic file operations  }
(* Const before type ignored *)
function nifti_set_filenames(nim:Pnifti_image; prefix:Pchar; check:longint; set_byte_order:longint):longint;cdecl;external;
(* Const before type ignored *)
function nifti_makehdrname(prefix:Pchar; nifti_type:longint; check:longint; comp:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function nifti_makeimgname(prefix:Pchar; nifti_type:longint; check:longint; comp:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function is_nifti_file(hname:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function nifti_find_file_extension(name:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function nifti_is_complete_filename(fname:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function nifti_validfilename(fname:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function disp_nifti_1_header(info:Pchar; hp:Pnifti_1_header):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function disp_nifti_2_header(info:Pchar; hp:Pnifti_2_header):longint;cdecl;external;
procedure nifti_set_debug_level(level:longint);cdecl;external;
procedure nifti_set_skip_blank_ext(skip:longint);cdecl;external;
procedure nifti_set_allow_upper_fext(allow:longint);cdecl;external;
function nifti_get_alter_cifti:longint;cdecl;external;
procedure nifti_set_alter_cifti(alter_cifti:longint);cdecl;external;
function nifti_alter_cifti_dims(nim:Pnifti_image):longint;cdecl;external;
(* Const before type ignored *)
function valid_nifti_brick_list(nim:Pnifti_image; nbricks:Tint64_t; blist:Pint64_t; disp_error:longint):longint;cdecl;external;
{ znzFile operations  }
(* Const before type ignored *)
function nifti_image_open(hname:Pchar; opts:Pchar; nim:PPnifti_image):TznzFile;cdecl;external;
(* Const before type ignored *)
function nifti_image_write_hdr_img(nim:Pnifti_image; write_data:longint; opts:Pchar):TznzFile;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nifti_image_write_hdr_img2(nim:Pnifti_image; write_opts:longint; opts:Pchar; imgfile:TznzFile; NBL:Pnifti_brick_list):TznzFile;cdecl;external;
function nifti_read_buffer(fp:TznzFile; dataptr:pointer; ntot:Tint64_t; nim:Pnifti_image):Tint64_t;cdecl;external;
(* Const before type ignored *)
function nifti_write_all_data(fp:TznzFile; nim:Pnifti_image; NBL:Pnifti_brick_list):longint;cdecl;external;
(* Const before type ignored *)
function nifti_write_buffer(fp:TznzFile; buffer:pointer; numbytes:Tint64_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
function nifti_read_ascii_image(fp:TznzFile; fname:Pchar; flen:longint; read_data:longint):Pnifti_image;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nifti_write_ascii_image(nim:Pnifti_image; NBL:Pnifti_brick_list; opts:Pchar; write_data:longint; leave_open:longint):TznzFile;cdecl;external;
procedure nifti_datatype_sizes(datatype:longint; nbyper:Plongint; swapsize:Plongint);cdecl;external;
procedure nifti_dmat44_to_quatern(R:Tnifti_dmat44; qb:Pdouble; qc:Pdouble; qd:Pdouble; qx:Pdouble; 
            qy:Pdouble; qz:Pdouble; dx:Pdouble; dy:Pdouble; dz:Pdouble; 
            qfac:Pdouble);cdecl;external;
function nifti_quatern_to_dmat44(qb:Tdouble; qc:Tdouble; qd:Tdouble; qx:Tdouble; qy:Tdouble; 
           qz:Tdouble; dx:Tdouble; dy:Tdouble; dz:Tdouble; qfac:Tdouble):Tnifti_dmat44;cdecl;external;
function nifti_make_orthog_dmat44(r11:Tdouble; r12:Tdouble; r13:Tdouble; r21:Tdouble; r22:Tdouble; 
           r23:Tdouble; r31:Tdouble; r32:Tdouble; r33:Tdouble):Tnifti_dmat44;cdecl;external;
procedure nifti_mat44_to_quatern(R:Tmat44; qb:Psingle; qc:Psingle; qd:Psingle; qx:Psingle; 
            qy:Psingle; qz:Psingle; dx:Psingle; dy:Psingle; dz:Psingle; 
            qfac:Psingle);cdecl;external;
function nifti_quatern_to_mat44(qb:single; qc:single; qd:single; qx:single; qy:single; 
           qz:single; dx:single; dy:single; dz:single; qfac:single):Tmat44;cdecl;external;
function nifti_make_orthog_mat44(r11:single; r12:single; r13:single; r21:single; r22:single; 
           r23:single; r31:single; r32:single; r33:single):Tmat44;cdecl;external;
function nifti_short_order:longint;cdecl;external;
{ CPU byte order  }
{ Orientation codes that might be returned from nifti_mat44_to_orientation(). }
{ Left to Right          }
const
  NIFTI_L2R = 1;  
{ Right to Left          }
  NIFTI_R2L = 2;  
{ Posterior to Anterior  }
  NIFTI_P2A = 3;  
{ Anterior to Posterior  }
  NIFTI_A2P = 4;  
{ Inferior to Superior   }
  NIFTI_I2S = 5;  
{ Superior to Inferior   }
  NIFTI_S2I = 6;  

procedure nifti_mat44_to_orientation(R:Tmat44; icod:Plongint; jcod:Plongint; kcod:Plongint);cdecl;external;
procedure nifti_dmat44_to_orientation(R:Tnifti_dmat44; icod:Plongint; jcod:Plongint; kcod:Plongint);cdecl;external;
{--------------------- Low level IO routines ------------------------------ }
(* Const before type ignored *)
function nifti_findhdrname(fname:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function nifti_findimgname(fname:Pchar; nifti_type:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function nifti_is_gzfile(fname:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function nifti_makebasename(fname:Pchar):Pchar;cdecl;external;
{ other routines  }
(* Const before type ignored *)
function nifti_convert_nim2n1hdr(nim:Pnifti_image; hdr:Pnifti_1_header):longint;cdecl;external;
(* Const before type ignored *)
function nifti_convert_nim2n2hdr(nim:Pnifti_image; hdr:Pnifti_2_header):longint;cdecl;external;
(* Const before type ignored *)
function nifti_make_new_n1_header(arg_dims:Pint64_t; arg_dtype:longint):Pnifti_1_header;cdecl;external;
(* Const before type ignored *)
function nifti_make_new_n2_header(arg_dims:Pint64_t; arg_dtype:longint):Pnifti_2_header;cdecl;external;
(* Const before type ignored *)
function nifti_read_header(hname:Pchar; nver:Plongint; check:longint):pointer;cdecl;external;
(* Const before type ignored *)
function nifti_read_n1_hdr(hname:Pchar; swapped:Plongint; check:longint):Pnifti_1_header;cdecl;external;
(* Const before type ignored *)
function nifti_read_n2_hdr(hname:Pchar; swapped:Plongint; check:longint):Pnifti_2_header;cdecl;external;
(* Const before type ignored *)
function nifti_copy_nim_info(src:Pnifti_image):Pnifti_image;cdecl;external;
(* Const before type ignored *)
function nifti_make_new_nim(dims:Pint64_t; datatype:longint; data_fill:longint):Pnifti_image;cdecl;external;
function nifti_simple_init_nim:Pnifti_image;cdecl;external;
(* Const before type ignored *)
function nifti_convert_n1hdr2nim(nhdr:Tnifti_1_header; fname:Pchar):Pnifti_image;cdecl;external;
(* Const before type ignored *)
function nifti_convert_n2hdr2nim(nhdr:Tnifti_2_header; fname:Pchar):Pnifti_image;cdecl;external;
function nifti_looks_like_cifti(nim:Pnifti_image):longint;cdecl;external;
(* Const before type ignored *)
function nifti_hdr1_looks_good(hdr:Pnifti_1_header):longint;cdecl;external;
(* Const before type ignored *)
function nifti_hdr2_looks_good(hdr:Pnifti_2_header):longint;cdecl;external;
function nifti_is_valid_datatype(dtype:longint):longint;cdecl;external;
function nifti_is_valid_ecode(ecode:longint):longint;cdecl;external;
function nifti_nim_is_valid(nim:Pnifti_image; complain:longint):longint;cdecl;external;
function nifti_nim_has_valid_dims(nim:Pnifti_image; complain:longint):longint;cdecl;external;
function is_valid_nifti_type(nifti_type:longint):longint;cdecl;external;
function nifti_test_datatype_sizes(verb:longint):longint;cdecl;external;
function nifti_type_and_names_match(nim:Pnifti_image; show_warn:longint):longint;cdecl;external;
function nifti_update_dims_from_array(nim:Pnifti_image):longint;cdecl;external;
procedure nifti_set_iname_offset(nim:Pnifti_image; nifti_ver:longint);cdecl;external;
function nifti_set_type_from_names(nim:Pnifti_image):longint;cdecl;external;
(* Const before type ignored *)
function nifti_add_extension(nim:Pnifti_image; data:Pchar; len:longint; ecode:longint):longint;cdecl;external;
function nifti_compiled_with_zlib:longint;cdecl;external;
(* Const before type ignored *)
function nifti_copy_extensions(nim_dest:Pnifti_image; nim_src:Pnifti_image):longint;cdecl;external;
function nifti_free_extensions(nim:Pnifti_image):longint;cdecl;external;
(* Const before type ignored *)
function nifti_get_int64list(nvals:Tint64_t; str:Pchar):Pint64_t;cdecl;external;
(* Const before type ignored *)
function nifti_get_intlist(nvals:longint; str:Pchar):Plongint;cdecl;external;
(* Const before type ignored *)
function nifti_strdup(str:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function valid_nifti_extensions(nim:Pnifti_image):longint;cdecl;external;
function nifti_valid_header_size(ni_ver:longint; whine:longint):longint;cdecl;external;
{-------------------- Some C convenience macros ---------------------------- }
{ NIfTI-1.1 extension codes:
   see http://nifti.nimh.nih.gov/nifti-1/documentation/faq#Q21  }
{ changed from UNKNOWN, 29 June 2005  }
const
  NIFTI_ECODE_IGNORE = 0;  
{ intended for raw DICOM attributes   }
  NIFTI_ECODE_DICOM = 2;  
{ Robert W Cox: rwcox@nih.gov
                                           https://afni.nimh.nih.gov/afni      }
  NIFTI_ECODE_AFNI = 4;  
{ plain ASCII text only               }
  NIFTI_ECODE_COMMENT = 6;  
{ David B Keator: dbkeator@uci.edu
                                           http://www.nbirn.net/Resources
                                                /Users/Applications/
                                                /xcede/index.htm               }
  NIFTI_ECODE_XCEDE = 8;  
{ Mark A Horsfield:
                                           mah5@leicester.ac.uk
                                           http://someplace/something          }
  NIFTI_ECODE_JIMDIMINFO = 10;  
{ Kate Fissell: fissell@pitt.edu
                                           http://kraepelin.wpic.pitt.edu
                                            /~fissell/NIFTI_ECODE_WORKFLOW_FWDS
                                            /NIFTI_ECODE_WORKFLOW_FWDS.html    }
  NIFTI_ECODE_WORKFLOW_FWDS = 12;  
{ http://surfer.nmr.mgh.harvard.edu   }
  NIFTI_ECODE_FREESURFER = 14;  
{ embedded Python objects
                                           http://niftilib.sourceforge.net
                                                 /pynifti                      }
  NIFTI_ECODE_PYPICKLE = 16;  
{ LONI MiND codes: http://www.loni.ucla.edu/twiki/bin/view/Main/MiND  }
{ Vishal Patel: vishal.patel@ucla.edu }
  NIFTI_ECODE_MIND_IDENT = 18;  
  NIFTI_ECODE_B_VALUE = 20;  
  NIFTI_ECODE_SPHERICAL_DIRECTION = 22;  
  NIFTI_ECODE_DT_COMPONENT = 24;  
{ end LONI MiND codes                 }
  NIFTI_ECODE_SHC_DEGREEORDER = 26;  
{ Dan Kimberg: www.voxbo.org          }
  NIFTI_ECODE_VOXBO = 28;  
{ John Harwell: john@brainvis.wustl.edu
                                           http://brainvis.wustl.edu/wiki
                                             /index.php/Caret:Documentation
                                             :CaretNiftiExtension              }
  NIFTI_ECODE_CARET = 30;  
{ CIFTI-2_Main_FINAL_1March2014.pdf  }
  NIFTI_ECODE_CIFTI = 32;  
  NIFTI_ECODE_VARIABLE_FRAME_TIMING = 34;  
{ 36 is currently unassigned, waiting on NIFTI_ECODE_AGILENT_PROCPAR  }
{ Munster University Hospital  }
  NIFTI_ECODE_EVAL = 38;  
{ http://www.mathworks.com/matlabcentral/fileexchange/42997-dicom-to-nifti-converter  }
{ MATLAB extension  }
  NIFTI_ECODE_MATLAB = 40;  
{ Quantiphyse extension
   https://quantiphyse.readthedocs.io/en/latest/advanced/nifti_extension.html }
{ Quantiphyse extension  }
  NIFTI_ECODE_QUANTIPHYSE = 42;  
{ Magnetic Resonance Spectroscopy (MRS)
   link to come...  }
{ MRS extension  }
  NIFTI_ECODE_MRS = 44;  
{****** maximum extension code ****** }
  NIFTI_MAX_ECODE = 44;  
{ nifti_type file codes  }
{ old ANALYZE  }
  NIFTI_FTYPE_ANALYZE = 0;  
{ NIFTI-1      }
  NIFTI_FTYPE_NIFTI1_1 = 1;  
  NIFTI_FTYPE_NIFTI1_2 = 2;  
  NIFTI_FTYPE_ASCII = 3;  
{ NIFTI-2      }
  NIFTI_FTYPE_NIFTI2_1 = 4;  
  NIFTI_FTYPE_NIFTI2_2 = 5;  
{ this should match the maximum code  }
  NIFTI_MAX_FTYPE = 5;  
{------------------------------------------------------------------------ }
{-- the rest of these apply only to nifti2_io.c, check for _NIFTI2_IO_C_  }
{$ifdef _NIFTI2_IO_C_}
{!< debug level for status reports   }
{!< skip extender if no extensions   }
{!< allow uppercase file extensions  }
{!< convert CIFTI dimensions         }
type
  Pnifti_global_options = ^Tnifti_global_options;
  Tnifti_global_options = record
      debug : longint;
      skip_blank_ext : longint;
      allow_upper_fext : longint;
      alter_cifti : longint;
    end;
{ should match the NIFTI_TYPE_ #define  }
{ bytes per value, matches nifti_image  }
{ bytes per swap piece, matches nifti_image  }
(* Const before declarator ignored *)
(* Const before declarator ignored *)
{ text string to match #define  }

  Pnifti_type_ele = ^Tnifti_type_ele;
  Tnifti_type_ele = record
      _type : longint;
      nbyper : longint;
      swapsize : longint;
      name : Pchar;
    end;
{$undef  LNI_FERR /* local nifti file error, to be compact and repetative */}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function LNI_FERR(func,msg,file : longint) : longint;

{$undef  swap_2}
{$undef  swap_4}
{ s: 2-byte short; swap in place  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function swap_2(s : longint) : longint;

{ v: 4-byte value; swap in place  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function swap_4(v : longint) : longint;

{**** isfinite() is a C99 macro, which is
                               present in many C implementations already **** }
{$undef IS_GOOD_FLOAT}
{$undef FIXED_FLOAT}
{$ifdef isfinite       /* use isfinite() to check floats/doubles for goodness */}
{ check if x is a "good" float  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_GOOD_FLOAT(x : longint) : longint;

{ fixed if bad  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FIXED_FLOAT(x : longint) : longint;

{$else}
{ don't check it  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function IS_GOOD_FLOAT(x : longint) : longint;

{ don't fix it  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FIXED_FLOAT(x : longint) : longint;

{$endif}
{$undef  MSB_FIRST}
{$undef  LSB_FIRST}
{$undef  REVERSE_ORDER}

const
  LSB_FIRST = 1;  
  MSB_FIRST = 2;  
{ convert MSB_FIRST <--> LSB_FIRST  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function REVERSE_ORDER(x : longint) : longint;

{ consider a longer extension invalid  }
const
  LNI_MAX_NIA_EXT_LEN = 100000;  
{$undef NIFTI_IS_16_BIT_INT}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function NIFTI_IS_16_BIT_INT(x : longint) : longint;

{$endif}
{ _NIFTI2_IO_C_ section  }
{------------------------------------------------------------------------ }
{================= }
{ C++ end of extern C conditionnal removed }
{================= }
{$endif}
{ _NIFTI2_IO_HEADER_  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LNI_FERR(func,msg,file : longint) : longint;
begin
  LNI_FERR:=fprintf(stderr,'** ERROR (%s): %s '%s'\n',func,msg,file);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function swap_2(s : longint) : longint;
begin
  swap_2:=nifti_swap_2bytes(1,@(s));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function swap_4(v : longint) : longint;
begin
  swap_4:=nifti_swap_4bytes(1,@(v));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_GOOD_FLOAT(x : longint) : longint;
begin
  IS_GOOD_FLOAT:=isfinite(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FIXED_FLOAT(x : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if isfinite(x) then
    if_local1:=x
  else
    if_local1:=0;
  FIXED_FLOAT:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IS_GOOD_FLOAT(x : longint) : longint;
begin
  IS_GOOD_FLOAT:=1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FIXED_FLOAT(x : longint) : longint;
begin
  FIXED_FLOAT:=x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function REVERSE_ORDER(x : longint) : longint;
begin
  REVERSE_ORDER:=3-x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NIFTI_IS_16_BIT_INT(x : longint) : longint;
begin
  NIFTI_IS_16_BIT_INT:=(x<=(32767 and (@(x))))>=(-(32768));
end;


end.
