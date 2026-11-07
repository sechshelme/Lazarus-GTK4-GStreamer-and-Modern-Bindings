{$IFDEF read_interface}


type
  Pisl_stride_info = type Pointer;

function isl_stride_info_get_ctx(si: Pisl_stride_info): Pisl_ctx; cdecl; external libisl;
function isl_stride_info_get_stride(si: Pisl_stride_info): Pisl_val; cdecl; external libisl;
function isl_stride_info_get_offset(si: Pisl_stride_info): Pisl_aff; cdecl; external libisl;
function isl_stride_info_free(si: Pisl_stride_info): Pisl_stride_info; cdecl; external libisl;
function isl_stride_info_copy(si: Pisl_stride_info): Pisl_stride_info; cdecl; external libisl;

// === Konventiert am: 5-11-26 16:53:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
