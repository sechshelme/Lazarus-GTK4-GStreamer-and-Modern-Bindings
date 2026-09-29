{$IFDEF read_interface}

type
  Pnifti_1_header = ^Tnifti_1_header;
  Tnifti_1_header = record
    sizeof_hdr: longint;
    data_type: array[0..9] of char;
    db_name: array[0..17] of char;
    extents: longint;
    session_error: smallint;
    regular: char;
    dim_info: char;
    dim: array[0..7] of smallint;
    intent_p1: single;
    intent_p2: single;
    intent_p3: single;
    intent_code: smallint;
    datatype: smallint;
    bitpix: smallint;
    slice_start: smallint;
    pixdim: array[0..7] of single;
    vox_offset: single;
    scl_slope: single;
    scl_inter: single;
    slice_end: smallint;
    slice_code: char;
    xyzt_units: char;
    cal_max: single;
    cal_min: single;
    slice_duration: single;
    toffset: single;
    glmax: longint;
    glmin: longint;
    descrip: array[0..79] of char;
    aux_file: array[0..23] of char;
    qform_code: smallint;
    sform_code: smallint;
    quatern_b: single;
    quatern_c: single;
    quatern_d: single;
    qoffset_x: single;
    qoffset_y: single;
    qoffset_z: single;
    srow_x: array[0..3] of single;
    srow_y: array[0..3] of single;
    srow_z: array[0..3] of single;
    intent_name: array[0..15] of char;
    magic: array[0..3] of char;
  end;

  Pnifti1_extender = ^Tnifti1_extender;
  Tnifti1_extender = record
    extension: array[0..3] of char;
  end;

  Pnifti1_extension = ^Tnifti1_extension;
  Tnifti1_extension = record
    esize: longint;
    ecode: longint;
    edata: pchar;
  end;

const
  DT_NONE = 0;
  DT_UNKNOWN = 0;
  DT_BINARY = 1;
  DT_UNSIGNED_CHAR = 2;
  DT_SIGNED_SHORT = 4;
  DT_SIGNED_INT = 8;
  DT_FLOAT = 16;
  DT_COMPLEX = 32;
  DT_DOUBLE = 64;
  DT_RGB = 128;
  DT_ALL = 255;

  DT_UINT8 = 2;
  DT_INT16 = 4;
  DT_INT32 = 8;
  DT_FLOAT32 = 16;
  DT_COMPLEX64 = 32;
  DT_FLOAT64 = 64;
  DT_RGB24 = 128;

  DT_INT8 = 256;
  DT_UINT16 = 512;
  DT_UINT32 = 768;
  DT_INT64 = 1024;
  DT_UINT64 = 1280;
  DT_FLOAT128 = 1536;
  DT_COMPLEX128 = 1792;
  DT_COMPLEX256 = 2048;
  DT_RGBA32 = 2304;

  NIFTI_TYPE_UINT8 = 2;
  NIFTI_TYPE_INT16 = 4;
  NIFTI_TYPE_INT32 = 8;
  NIFTI_TYPE_FLOAT32 = 16;
  NIFTI_TYPE_COMPLEX64 = 32;
  NIFTI_TYPE_FLOAT64 = 64;
  NIFTI_TYPE_RGB24 = 128;
  NIFTI_TYPE_INT8 = 256;
  NIFTI_TYPE_UINT16 = 512;
  NIFTI_TYPE_UINT32 = 768;
  NIFTI_TYPE_INT64 = 1024;
  NIFTI_TYPE_UINT64 = 1280;
  NIFTI_TYPE_FLOAT128 = 1536;
  NIFTI_TYPE_COMPLEX128 = 1792;
  NIFTI_TYPE_COMPLEX256 = 2048;
  NIFTI_TYPE_RGBA32 = 2304;

  NIFTI_INTENT_NONE = 0;

  NIFTI_INTENT_CORREL = 2;
  NIFTI_INTENT_TTEST = 3;
  NIFTI_INTENT_FTEST = 4;
  NIFTI_INTENT_ZSCORE = 5;
  NIFTI_INTENT_CHISQ = 6;
  NIFTI_INTENT_BETA = 7;
  NIFTI_INTENT_BINOM = 8;
  NIFTI_INTENT_GAMMA = 9;
  NIFTI_INTENT_POISSON = 10;
  NIFTI_INTENT_NORMAL = 11;
  NIFTI_INTENT_FTEST_NONC = 12;
  NIFTI_INTENT_CHISQ_NONC = 13;
  NIFTI_INTENT_LOGISTIC = 14;
  NIFTI_INTENT_LAPLACE = 15;
  NIFTI_INTENT_UNIFORM = 16;
  NIFTI_INTENT_TTEST_NONC = 17;
  NIFTI_INTENT_WEIBULL = 18;
  NIFTI_INTENT_CHI = 19;
  NIFTI_INTENT_INVGAUSS = 20;
  NIFTI_INTENT_EXTVAL = 21;
  NIFTI_INTENT_PVAL = 22;
  NIFTI_INTENT_LOGPVAL = 23;
  NIFTI_INTENT_LOG10PVAL = 24;

  NIFTI_FIRST_STATCODE = 2;
  NIFTI_LAST_STATCODE = 24;

  NIFTI_INTENT_ESTIMATE = 1001;
  NIFTI_INTENT_LABEL = 1002;
  NIFTI_INTENT_NEURONAME = 1003;
  NIFTI_INTENT_GENMATRIX = 1004;
  NIFTI_INTENT_SYMMATRIX = 1005;
  NIFTI_INTENT_DISPVECT = 1006;
  NIFTI_INTENT_VECTOR = 1007;
  NIFTI_INTENT_POINTSET = 1008;
  NIFTI_INTENT_TRIANGLE = 1009;
  NIFTI_INTENT_QUATERNION = 1010;
  NIFTI_INTENT_DIMLESS = 1011;
  NIFTI_INTENT_TIME_SERIES = 2001;
  NIFTI_INTENT_NODE_INDEX = 2002;
  NIFTI_INTENT_RGB_VECTOR = 2003;
  NIFTI_INTENT_RGBA_VECTOR = 2004;
  NIFTI_INTENT_SHAPE = 2005;
  NIFTI_INTENT_FSL_FNIRT_DISPLACEMENT_FIELD = 2006;
  NIFTI_INTENT_FSL_CUBIC_SPLINE_COEFFICIENTS = 2007;
  NIFTI_INTENT_FSL_DCT_COEFFICIENTS = 2008;
  NIFTI_INTENT_FSL_QUADRATIC_SPLINE_COEFFICIENTS = 2009;
  NIFTI_INTENT_FSL_TOPUP_CUBIC_SPLINE_COEFFICIENTS = 2016;
  NIFTI_INTENT_FSL_TOPUP_QUADRATIC_SPLINE_COEFFICIENTS = 2017;
  NIFTI_INTENT_FSL_TOPUP_FIELD = 2018;

  NIFTI_XFORM_UNKNOWN = 0;
  NIFTI_XFORM_SCANNER_ANAT = 1;
  NIFTI_XFORM_ALIGNED_ANAT = 2;
  NIFTI_XFORM_TALAIRACH = 3;
  NIFTI_XFORM_MNI_152 = 4;
  NIFTI_XFORM_TEMPLATE_OTHER = 5;

  NIFTI_UNITS_UNKNOWN = 0;
  NIFTI_UNITS_METER = 1;
  NIFTI_UNITS_MM = 2;
  NIFTI_UNITS_MICRON = 3;
  NIFTI_UNITS_SEC = 8;
  NIFTI_UNITS_MSEC = 16;
  NIFTI_UNITS_USEC = 24;
  NIFTI_UNITS_HZ = 32;
  NIFTI_UNITS_PPM = 40;
  NIFTI_UNITS_RADS = 48;

const
  NIFTI_SLICE_UNKNOWN = 0;
  NIFTI_SLICE_SEQ_INC = 1;
  NIFTI_SLICE_SEQ_DEC = 2;
  NIFTI_SLICE_ALT_INC = 3;
  NIFTI_SLICE_ALT_DEC = 4;
  NIFTI_SLICE_ALT_INC2 = 5;
  NIFTI_SLICE_ALT_DEC2 = 6;


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
