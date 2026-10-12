program project1;

uses
  crt,
  fp_box2d,
  EngineCalc;



  procedure main;
  var
    engine: TEngine;
    x, y: int64;
    position: Tb2Vec2;
    i: integer;
  begin
    engine := TEngine.Create;

    WriteLn('Simuliere Flugkurve und Bodenkontakt...');

    for  i := 0 to 6400 do begin
      position := engine.GetPos;

      x := Trunc(position.x * 7);
      y := 80 - Trunc((position.y * 4) + 30);

      if (x > 1) and (x < 160) and (y > 1) and (y < 60) then begin
        Write('X');
      end;
    end;

    engine.Free;
  end;

begin
  main;
end.
