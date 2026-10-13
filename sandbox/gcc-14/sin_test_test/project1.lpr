program project1;

uses
  SysUtils;

var
  StartTime, fp, dp, lp, fc, dc, lc: TDateTime;
  f: single;
  d: double;
  L: extended;
  i, y: int64;

const
  {$IFDEF MSWINDOWS}
  clib_math = 'msvcrt.dll';
  {$ELSE}
  clib_math = 'm';
  {$ENDIF}

  function c_sinf(x: single): single; cdecl; external clib_math name 'sinf';
  function c_sin(x: double): double; cdecl; external clib_math name 'sin';
  function c_sinl(x: extended): extended; cdecl; external clib_math name 'sinl';

  function c_cosf(x: single): single; cdecl; external clib_math name 'cosf';
  function c_cos(x: double): double; cdecl; external clib_math name 'cos';
  function c_cosl(x: extended): extended; cdecl; external clib_math name 'cosl';

const
  COUNT = 100;

(*

Plattform: Linux
Zeit FPC:  18.431s
Zeit libm: 02.431s

Plattform: Win64
Zeit FPC:  02.035s
Zeit libm: 02.062s

  *)

  procedure SinTest;
begin
  WriteLn('=== sin ===');

  // == Float
  WriteLn('Start FPC Float sin...');
  StartTime := Now;

  f := 1.0;
  for y := 0 to COUNT do begin
    Write('.');
    for i := 0 to 1000000 do begin
      f := sin(f * i);
    end;
  end;
  fp := Now - StartTime;
  WriteLn;
  WriteLn('Ergebnis als Test Float: ', f: 4: 2);

  WriteLn('Start libm Float sin...');
  StartTime := Now;

  f := 1.0;
  for y := 0 to COUNT do begin
    Write('.');
    for i := 0 to 1000000 do begin
      f := c_sinf(f * i);
    end;
  end;
  fc := Now - StartTime;
  WriteLn;
  WriteLn('Ergebnis als Test Float: ', f: 4: 2);

  // == Double
  WriteLn('Start FPC Double sin...');
  StartTime := Now;

  d := 1.0;
  for y := 0 to COUNT do begin
    Write('.');
    for i := 0 to 1000000 do begin
      d := sin(d * i);
    end;
  end;
  dp := Now - StartTime;
  WriteLn;
  WriteLn('Ergebnis als Test Double: ', d: 4: 2);

  WriteLn('Start libm Double sin...');
  StartTime := Now;

  d := 1.0;
  for y := 0 to COUNT do begin
    Write('.');
    for i := 0 to 1000000 do begin
      d := c_sin(d * i);
    end;
  end;
  dc := Now - StartTime;
  WriteLn;
  WriteLn('Ergebnis als Test Double: ', d: 4: 2);

  // == Long Double
  WriteLn('Start FPC Long Double sin...');
  StartTime := Now;

  l := 1.0;
  for y := 0 to COUNT do begin
    Write('.');
    for i := 0 to 1000000 do begin
      l := sin(l * i);
    end;
  end;
  lp := Now - StartTime;
  WriteLn;
  WriteLn('Ergebnis als Test Long Double: ', l: 4: 2);

  WriteLn('Start libm Long Double sin...');
  StartTime := Now;

  l := 1.0;
  for y := 0 to COUNT do begin
    Write('.');
    for i := 0 to 1000000 do begin
//      l := c_sinl(l * i);
    end;
  end;
  lc := Now - StartTime;
  WriteLn;
  WriteLn('Ergebnis als Test Long Double: ', l: 4: 2);
  WriteLn(#10#10);

  WriteLn;
  WriteLn('Float');
  WriteLn('Zeit FPC:  ', FormatDateTime('ss.zzz', fp), 's');
  WriteLn('Zeit libm: ', FormatDateTime('ss.zzz', fc), 's');

  WriteLn;
  WriteLn('Double');
  WriteLn('Zeit FPC:  ', FormatDateTime('ss.zzz', dp), 's');
  WriteLn('Zeit libm: ', FormatDateTime('ss.zzz', dc), 's');

  WriteLn;
  WriteLn('Long Double');
  WriteLn('Zeit FPC:  ', FormatDateTime('ss.zzz', lp), 's');
  WriteLn('Zeit libm: ', FormatDateTime('ss.zzz', lc), 's');
end;


  procedure CosTest;
begin
  WriteLn('=== cos ===');

  // == Float
  WriteLn('Start FPC Float cos...');
  StartTime := Now;

  f := 1.0;
  for y := 0 to COUNT do begin
    Write('.');
    for i := 0 to 1000000 do begin
      f := cos(f * i);
    end;
  end;
  WriteLn;
  WriteLn('Ergebnis als Test Float: ', f: 4: 2);
  fp := Now - StartTime;

  WriteLn('Start libm Float cos...');
  StartTime := Now;

  f := 1.0;
  for y := 0 to COUNT do begin
    Write('.');
    for i := 0 to 1000000 do begin
      f := c_cosf(f * i);
    end;
  end;
  WriteLn;
  fc := Now - StartTime;
  WriteLn('Ergebnis als Test Float: ', f: 4: 2);

  // == Double
  WriteLn('Start FPC Double cos...');
  StartTime := Now;

  d := 1.0;
  for y := 0 to COUNT do begin
    Write('.');
    for i := 0 to 1000000 do begin
      d := cos(d * i);
    end;
  end;
  WriteLn;
  WriteLn('Ergebnis als Test Double: ', d: 4: 2);
  dp := Now - StartTime;

  WriteLn('Start libm Double cos...');
  StartTime := Now;

  d := 1.0;
  for y := 0 to COUNT do begin
    Write('.');
    for i := 0 to 1000000 do begin
      d := c_cos(d * i);
    end;
  end;
  dc := Now - StartTime;
  WriteLn;
  WriteLn('Ergebnis als Test Double: ', d: 4: 2);

  // == Long Double
  WriteLn('Start FPC Long Double cos...');
  StartTime := Now;

  l := 1.0;
  for y := 0 to COUNT do begin
    Write('.');
    for i := 0 to 1000000 do begin
      l := cos(l * i);
    end;
  end;
  WriteLn;
  WriteLn('Ergebnis als Test Long Double: ', l: 4: 2);
  lp := Now - StartTime;

  WriteLn('Start libm Long Double cos...');
  StartTime := Now;

  l := 1.0;
  for y := 0 to COUNT do begin
    Write('.');
    for i := 0 to 1000000 do begin
//      l := c_cosl(l * i);
    end;
  end;
  WriteLn;
  lc := Now - StartTime;
  WriteLn('Ergebnis als Test Long Double: ', l: 4: 2);
  WriteLn(#10#10);

  WriteLn;
  WriteLn('Float');
  WriteLn('Zeit FPC:  ', FormatDateTime('ss.zzz', fp), 's');
  WriteLn('Zeit libm: ', FormatDateTime('ss.zzz', fc), 's');

  WriteLn;
  WriteLn('Double');
  WriteLn('Zeit FPC:  ', FormatDateTime('ss.zzz', dp), 's');
  WriteLn('Zeit libm: ', FormatDateTime('ss.zzz', dc), 's');

  WriteLn;
  WriteLn('Long Double');
  WriteLn('Zeit FPC:  ', FormatDateTime('ss.zzz', lp), 's');
  WriteLn('Zeit libm: ', FormatDateTime('ss.zzz', lc), 's');
end;

  begin
    Writeln('Plattform: ', {$I %FPCTARGETOS%}#10);

    SinTest;
    WriteLn('------------------------------------------------------');
    CosTest;
  end.



