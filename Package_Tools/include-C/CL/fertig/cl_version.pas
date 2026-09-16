unit cl_version;

interface

uses
  fp_opencl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  CL_TARGET_OPENCL_VERSION = 300;

const
  CL_VERSION_3_0 = 1;
  CL_VERSION_2_2 = 1;
  CL_VERSION_2_1 = 1;
  CL_VERSION_2_0 = 1;
  CL_VERSION_1_2 = 1;
  CL_VERSION_1_1 = 1;
  CL_VERSION_1_0 = 1;

  // === Konventiert am: 16-9-26 15:57:34 ===


implementation



end.
