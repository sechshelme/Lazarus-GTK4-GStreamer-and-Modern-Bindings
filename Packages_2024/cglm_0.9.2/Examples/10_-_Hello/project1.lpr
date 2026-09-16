program project1;


uses
  fp_cglm;

  procedure printMatrix(const m: Tmat4);
  var
    x, y: integer;
  begin
    for x := 0 to 3 do begin
      Write('[ ');
      for y := 0 to 3 do begin
        Write(m[x,y]:4:2,' ');
      end;
      WriteLn(']');
    end;
    WriteLn();
  end;

  procedure main;
  {$CODEALIGN LOCALMIN=16}
//  {$ALIGN 16}

  var
    i1:Integer;
    m: Tmat4;
    i2:Integer;
  begin
    glmc_mat4_identity(m);
    printMatrix(m);
    glmc_scale_uni(m,2);
    printMatrix(m);
    glmc_mat4_identity(m);
    printMatrix(m);
    glmc_translate_y(m,2);
    printMatrix(m);
  end;

begin
  main;
end.
