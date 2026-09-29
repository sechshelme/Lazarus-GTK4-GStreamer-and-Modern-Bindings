{$IFDEF read_interface}


type
  Pnifti_2_header = ^Tnifti_2_header;
  Tnifti_2_header = record
    sizeof_hdr: Tint32_t;
    magic: array[0..7] of char;
    datatype: Tint16_t;
    bitpix: Tint16_t;
    dim: array[0..7] of Tint64_t;
    intent_p1: double;
    intent_p2: double;
    intent_p3: double;
    pixdim: array[0..7] of double;
    vox_offset: Tint64_t;
    scl_slope: double;
    scl_inter: double;
    cal_max: double;
    cal_min: double;
    slice_duration: double;
    toffset: double;
    slice_start: Tint64_t;
    slice_end: Tint64_t;
    descrip: array[0..79] of char;
    aux_file: array[0..23] of char;
    qform_code: Tint32_t;
    sform_code: Tint32_t;
    quatern_b: double;
    quatern_c: double;
    quatern_d: double;
    qoffset_x: double;
    qoffset_y: double;
    qoffset_z: double;
    srow_x: array[0..3] of double;
    srow_y: array[0..3] of double;
    srow_z: array[0..3] of double;
    slice_code: Tint32_t;
    xyzt_units: Tint32_t;
    intent_code: Tint32_t;
    intent_name: array[0..15] of char;
    dim_info: char;
    unused_str: array[0..14] of char;
  end;


  // === Konventiert am: 29-9-26 14:50:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
