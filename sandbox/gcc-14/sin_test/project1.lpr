program project1;

{$O-}

uses
  SysUtils,
  Classes;

var
  StartTime, time: TDateTime;
  f: single;
  d: double;
  L: extended;
  i, y: int64;
  resSL: TStringList;

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

=== sin ===

Start FPC Float sin...
00:00:01.919s
Start libm Float sin...
00:00:00.219s

Start FPC Double sin...
00:00:01.925s
Start libm Double sin...
00:00:00.246s

Start FPC Long Double sin...
00:00:01.870s
Start libm Long Double sin...
00:00:01.236s

=== cos ===

Start FPC Float cos...
00:00:02.963s
Start libm Float cos...
00:00:01.539s

Start FPC Double cos...
00:00:02.902s
Start libm Double cos...
00:00:01.962s

Start FPC Long Double cos...
00:00:02.920s
Start libm Long Double cos...
00:00:11.161s

=============================================================0

Plattform: Win64


=== sin ===

Start FPC Float sin...
00:00:00.430s
Start libm Float sin...
00:00:00.203s

Start FPC Double sin...
00:00:00.203s
Start libm Double sin...
00:00:00.205s

Start FPC Long Double sin...
00:00:00.203s
Start libm Long Double sin...
00:00:00.176s

=== cos ===

Start FPC Float cos...
00:00:03.402s
Start libm Float cos...
00:00:02.507s

Start FPC Double cos...
00:00:03.180s
Start libm Double cos...
00:00:02.224s

Start FPC Long Double cos...
00:00:03.174s
Start libm Long Double cos...
00:00:00.172s



  *)

  procedure SinTest;
  begin
    resSL.Add('');
    resSL.Add('=== sin ===');

    // == Float
    resSL.Add('');
    resSL.Add('Start FPC Float sin...');
    StartTime := Now;

    f := 1.0;
    for y := 0 to COUNT do begin
      Write('.');
      for i := 0 to 1000000 do begin
        f := sin(i);
      end;
    end;
    time := Now - StartTime;
    resSL.Add(FormatDateTime('hh:nn:ss.zzz', time) + 's');

    resSL.Add('Start libm Float sin...');
    StartTime := Now;

    f := 1.0;
    for y := 0 to COUNT do begin
      Write('.');
      for i := 0 to 1000000 do begin
        f := c_sinf(i);
      end;
    end;
    time := Now - StartTime;
    resSL.Add(FormatDateTime('hh:nn:ss.zzz', time) + 's');

    // == Double
    resSL.Add('');
    resSL.Add('Start FPC Double sin...');
    StartTime := Now;

    d := 1.0;
    for y := 0 to COUNT do begin
      Write('.');
      for i := 0 to 1000000 do begin
        d := sin(i);
      end;
    end;
    time := Now - StartTime;
    resSL.Add(FormatDateTime('hh:nn:ss.zzz', time) + 's');

    resSL.Add('Start libm Double sin...');
    StartTime := Now;

    d := 1.0;
    for y := 0 to COUNT do begin
      Write('.');
      for i := 0 to 1000000 do begin
        d := c_sin(i);
      end;
    end;
    time := Now - StartTime;
    resSL.Add(FormatDateTime('hh:nn:ss.zzz', time) + 's');

    // == Long Double
    resSL.Add('');
    resSL.Add('Start FPC Long Double sin...');
    StartTime := Now;

    l := 1.0;
    for y := 0 to COUNT do begin
      Write('.');
      for i := 0 to 1000000 do begin
        l := sin(i);
      end;
    end;
    time := Now - StartTime;
    resSL.Add(FormatDateTime('hh:nn:ss.zzz', time) + 's');

    resSL.Add('Start libm Long Double sin...');
    StartTime := Now;

    l := 1.0;
    for y := 0 to COUNT do begin
      Write('.');
      for i := 0 to 1000000 do begin
        l := c_sinl(i);
      end;
    end;
    time := Now - StartTime;
    resSL.Add(FormatDateTime('hh:nn:ss.zzz', time) + 's');
  end;

  procedure CosTest;
  begin
    resSL.Add('');
    resSL.Add('=== cos ===');

    // == Float
    resSL.Add('');
    resSL.Add('Start FPC Float cos...');
    StartTime := Now;

    f := 1.0;
    for y := 0 to COUNT do begin
      Write('.');
      for i := 0 to 1000000 do begin
        f := cos(i);
      end;
    end;
    time := Now - StartTime;
    resSL.Add(FormatDateTime('hh:nn:ss.zzz', time) + 's');

    resSL.Add('Start libm Float cos...');
    StartTime := Now;

    f := 1.0;
    for y := 0 to COUNT do begin
      Write('.');
      for i := 0 to 1000000 do begin
        f := c_cosf(i);
      end;
    end;
    time := Now - StartTime;
    resSL.Add(FormatDateTime('hh:nn:ss.zzz', time) + 's');

    // == Double
    resSL.Add('');
    resSL.Add('Start FPC Double cos...');
    StartTime := Now;

    d := 1.0;
    for y := 0 to COUNT do begin
      Write('.');
      for i := 0 to 1000000 do begin
        d := cos(i);
      end;
    end;
    time := Now - StartTime;
    resSL.Add(FormatDateTime('hh:nn:ss.zzz', time) + 's');

    resSL.Add('Start libm Double cos...');
    StartTime := Now;

    d := 1.0;
    for y := 0 to COUNT do begin
      Write('.');
      for i := 0 to 1000000 do begin
        d := c_cos(i);
      end;
    end;
    time := Now - StartTime;
    resSL.Add(FormatDateTime('hh:nn:ss.zzz', time) + 's');

    // == Long Double
    resSL.Add('');
    resSL.Add('Start FPC Long Double cos...');
    StartTime := Now;

    l := 1.0;
    for y := 0 to COUNT do begin
      Write('.');
      for i := 0 to 1000000 do begin
        l := cos(i);
      end;
    end;
    time := Now - StartTime;
    resSL.Add(FormatDateTime('hh:nn:ss.zzz', time) + 's');

    resSL.Add('Start libm Long Double cos...');
    StartTime := Now;

    l := 1.0;
    for y := 0 to COUNT do begin
      Write('.');
      for i := 0 to 1000000 do begin
        l := c_cosl(i);
      end;
    end;
    time := Now - StartTime;
    resSL.Add(FormatDateTime('hh:nn:ss.zzz', time) + 's');
  end;


begin
  resSL := TStringList.Create;
  resSL.Add('');
  resSL.Add('');
  resSL.Add('Plattform: ' + {$I %FPCTARGETOS%} + #10);

  SinTest;
  CosTest;

  WriteLn(resSL.Text);
  resSL.Free;
end.
