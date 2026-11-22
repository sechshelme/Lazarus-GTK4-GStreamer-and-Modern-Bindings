unit defs;

interface

uses
  fp_assimp;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  SIZE_MAX: SizeUInt = High(SizeUInt);

type
  Pai_real = ^Tai_real;
  Tai_real = single;

  Pai_int = ^Tai_int;
  Tai_int = int32;

  Pai_uint = ^Tai_uint;
  Tai_uint = uint32;

const
  ASSIMP_AI_REAL_TEXT_PRECISION = 9;

const
  AI_MATH_PI = 3.141592653589793238462643383279;
  AI_MATH_TWO_PI = AI_MATH_PI * 2.0;
  AI_MATH_HALF_PI = AI_MATH_PI * 0.5;

  AI_MATH_PI_F = single(3.1415926538);
  AI_MATH_TWO_PI_F = single(AI_MATH_PI_F * 2.0);
  AI_MATH_HALF_PI_F = single(AI_MATH_PI_F * 0.5);

function AI_DEG_TO_RAD(x: Tai_real): Tai_real; inline;
function AI_RAD_TO_DEG(x: Tai_real): Tai_real; inline;

const
  ai_epsilon: Tai_real = 1e-6;


// === Konventiert am: 22-11-26 17:08:52 ===


implementation


function AI_DEG_TO_RAD(x: Tai_real): Tai_real;
begin
  Result := x * Tai_real(0.0174532925);
end;

function AI_RAD_TO_DEG(x: Tai_real): Tai_real;
begin
  Result := x * Tai_real(57.2957795);
end;

end.
