program project1;

type
  TMyRec = record
    arr: array[0..65535 * 2500] of Int32;
  end;

  procedure proc;
  const
    arr: TMyRec = ();
  var
    i: integer;
  begin
    Inc(arr.arr[0]);
    Write(arr.arr[0], ' ');
    for i := 1 to Length(arr.arr) - 1 do begin
      if arr.arr[i] <> 0 then begin
        WriteLn('Error: ', arr.arr[i]);
      end;
    end;
  end;

var
  i: integer;

begin
  for i := 0 to 60000 do begin
    proc;
  end;
end.
