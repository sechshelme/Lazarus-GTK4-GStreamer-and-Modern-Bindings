unit DataTypes;

interface

uses
  fp_llvm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  INT64_MAX = 9223372036854775807;
  INT64_MIN = (-(INT64_MAX)) - 1;

const
  UINT64_MAX = $ffffffffffffffff;

  // === Konventiert am: 20-9-26 15:59:57 ===


implementation



end.
