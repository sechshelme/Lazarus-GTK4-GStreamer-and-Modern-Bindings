{$IFDEF read_interface}


function isl_basic_set_max_val(bset: Pisl_basic_set; obj: Pisl_aff): Pisl_val; cdecl; external libisl;
function isl_set_min_val(set_: Pisl_set; obj: Pisl_aff): Pisl_val; cdecl; external libisl;
function isl_set_max_val(set_: Pisl_set; obj: Pisl_aff): Pisl_val; cdecl; external libisl;
function isl_union_set_min_multi_union_pw_aff(uset: Pisl_union_set; obj: Pisl_multi_union_pw_aff): Pisl_multi_val; cdecl; external libisl;
function isl_pw_aff_min_val(pa: Pisl_pw_aff): Pisl_val; cdecl; external libisl;
function isl_pw_aff_max_val(pa: Pisl_pw_aff): Pisl_val; cdecl; external libisl;
function isl_pw_multi_aff_min_multi_val(pma: Pisl_pw_multi_aff): Pisl_multi_val; cdecl; external libisl;
function isl_pw_multi_aff_max_multi_val(pma: Pisl_pw_multi_aff): Pisl_multi_val; cdecl; external libisl;
function isl_multi_pw_aff_min_multi_val(mpa: Pisl_multi_pw_aff): Pisl_multi_val; cdecl; external libisl;
function isl_multi_pw_aff_max_multi_val(mpa: Pisl_multi_pw_aff): Pisl_multi_val; cdecl; external libisl;
function isl_union_pw_aff_min_val(upa: Pisl_union_pw_aff): Pisl_val; cdecl; external libisl;
function isl_union_pw_aff_max_val(upa: Pisl_union_pw_aff): Pisl_val; cdecl; external libisl;
function isl_multi_union_pw_aff_min_multi_val(mupa: Pisl_multi_union_pw_aff): Pisl_multi_val; cdecl; external libisl;
function isl_multi_union_pw_aff_max_multi_val(mupa: Pisl_multi_union_pw_aff): Pisl_multi_val; cdecl; external libisl;
function isl_basic_set_dim_max_val(bset: Pisl_basic_set; pos: longint): Pisl_val; cdecl; external libisl;
function isl_set_dim_min_val(set_: Pisl_set; pos: longint): Pisl_val; cdecl; external libisl;
function isl_set_dim_max_val(set_: Pisl_set; pos: longint): Pisl_val; cdecl; external libisl;

// === Konventiert am: 5-11-26 15:28:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
