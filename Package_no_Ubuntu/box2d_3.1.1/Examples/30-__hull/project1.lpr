program project1;

uses
  crt,
  fp_box2d;


const
  POINT_COUNT = 8;

  procedure print(p: Tb2Vec2);
  begin
    GotoXY(Trunc(p.x) + 1, Trunc(p.y) + 1);
    Write('X');
  end;

  procedure main;
  var
    i: integer;
    points: array[0..POINT_COUNT - 1] of Tb2Vec2;
    hull: Tb2Hull;
    p: Tb2Vec2;
  begin
    Randomize;
    ClrScr;
    TextAttr := $07;
    for i := 0 to POINT_COUNT - 1 do begin
      points[i].x := Random * 60;
      points[i].y := Random * 20;
      print(points[i]);
    end;

    hull := b2ComputeHull(points, POINT_COUNT);

    TextAttr := $04;
    for i := 0 to hull.count - 1 do begin
      p := hull.points[i];
      print(p);
    end;
  end;

begin
  main;
end.
