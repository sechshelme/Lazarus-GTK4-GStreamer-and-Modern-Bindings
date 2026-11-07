program project1;

uses
  fp_isl;

  procedure PrintSet(setA: Pisl_set);
  var
    ctx: Pisl_ctx;
    p: Pisl_printer;
    build: Pisl_ast_build;
    ast: Pisl_ast_node;
    s: PChar;
  begin
    ctx := isl_set_get_ctx(setA);

    p := isl_printer_to_str(ctx);

    p := isl_printer_set_output_format(p, ISL_FORMAT_ISL);
    p := isl_printer_print_set(p, setA);
    p := isl_printer_end_line(p);

    p := isl_printer_set_output_format(p, ISL_FORMAT_C);
    build := isl_ast_build_alloc(ctx);
    ast := isl_ast_build_node_from_schedule_map(build, isl_union_map_from_map(isl_map_from_domain(isl_set_copy(setA))));
    p := isl_printer_print_ast_node(p, ast);
    isl_ast_node_free(ast);
    isl_ast_build_free(build);

    p := isl_printer_end_line(p);

    s := isl_printer_get_str(p);
    WriteLn(s);
    WriteLn(#10'---------------------------------'#10);
    free(s);

    isl_printer_free(p);
  end;

  procedure main1;
  var
    ctx: Pisl_ctx;
    setA: Pisl_set;
  begin
    ctx := isl_ctx_alloc;
    if ctx = nil then begin
      WriteLn('Fehler beim Erstellen des ISL-Kontexts.');
      Exit;;
    end;

    setA := isl_set_read_from_str(ctx, '{ [x] : 1 <= x <= 10 }');
    PrintSet(setA);
    isl_set_free(setA);

    isl_ctx_free(ctx);
  end;

  procedure main2;
  var
    ctx: Pisl_ctx;
    setA, setB, setC: Pisl_set;
  begin
    ctx := isl_ctx_alloc;
    if ctx = nil then begin
      WriteLn('Fehler beim Erstellen des ISL-Kontexts.');
      Exit;
    end;

    setA := isl_set_read_from_str(ctx, '{ S[x] : 0 <= x < 10 }');
    setB := isl_set_read_from_str(ctx, '{ S[y] : y >= 5 }');
    PrintSet(setA);
    PrintSet(setB);

    setC := isl_set_intersect(setA, setB);
    PrintSet(setC);
    isl_set_free(setC);

    isl_ctx_free(ctx);
  end;

  procedure main3;
  var
    ctx: Pisl_ctx;
    setA: Pisl_set;
  begin
    ctx := isl_ctx_alloc;
    if ctx = nil then begin
      WriteLn('Fehler beim Erstellen des ISL-Kontexts.');
      Exit;
    end;

    setA := isl_set_read_from_str(ctx, '{ Berechne[i, j] : 0 <= i < 10 && 0 <= j <= i }');
    PrintSet(setA);
    isl_set_free(setA);

    isl_ctx_free(ctx);
  end;


begin
  WriteLn;
  main1;
  main2;
  main3;
end.
