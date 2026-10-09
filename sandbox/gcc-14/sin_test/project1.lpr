program project1;

uses
  SysUtils;

var
  StartTime, FPCTime, CTime: TDateTime;
  r: Double;
  i, y: Int64;

  const
  {$IFDEF MSWINDOWS}
  clib_math = 'msvcrt.dll';
  {$ELSE}
  clib_math = 'm';
  {$ENDIF}

function c_sin(x: Double): Double; cdecl; external clib_math name 'sin';


(*

Plattform: Linux
Zeit FPC:  18.431s
Zeit libm: 02.431s

Plattform: Win64
Zeit FPC:  02.035s
Zeit libm: 02.062s

  *)

begin
  WriteLn('Start FPC Sin...');
  StartTime := Now;

  r := 1.0;
  for y := 0 to 1000 do    begin
  Write('.');
  for i := 0 to 1000000 do  begin
      r := cos(r * i);
    end;
  end;
  WriteLn('Ergebnis als Test r: ', r:4:2);
  FPCTime:=Now - StartTime;

  WriteLn('Start libm Sin...');
  StartTime := Now;

  r := 1.0;
  for y := 0 to 1000 do    begin
  Write('.');
  for i := 0 to 1000000 do  begin
      r := c_sin(r * i);
    end;
  end;
  CTime:=Now - StartTime;
  WriteLn('Ergebnis als Test r: ', r:4:2);
  WriteLn(#10#10);
  Writeln('Plattform: ', {$I %FPCTARGETOS%});
  WriteLn('Zeit FPC:  ', FormatDateTime('ss.zzz', FPCTime), 's');
  WriteLn('Zeit libm: ', FormatDateTime('ss.zzz', CTime), 's');
end.

