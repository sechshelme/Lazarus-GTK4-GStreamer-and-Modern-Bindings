program project1;

uses
  fp_isl;

  procedure main;
  var
    ctx: Pisl_ctx;
    setA: Pisl_set;
    p: Pisl_printer;
  begin
    ctx := isl_ctx_alloc;
    if ctx = nil then begin
      WriteLn('Fehler beim Erstellen des ISL-Kontexts.');
      Exit;;
    end;

    setA := isl_set_read_from_str(ctx, '{ [x] : 1 <= x <= 10 }');

    p := isl_printer_to_file(ctx, stdout);
    p := isl_printer_set_output_format(p, ISL_FORMAT_ISL);

    p := isl_printer_print_str(p, 'Erstellte ISL-Menge: ');
    p := isl_printer_print_set(p, setA);
    p := isl_printer_end_line(p);
    p := isl_printer_flush(p);

    isl_printer_free(p);
    isl_set_free(setA);
    isl_ctx_free(ctx);
  end;

procedure main2;
var
  ctx: Pisl_ctx;
  setA, setB, setC: Pisl_set;
  p: Pisl_printer;
  build: Pisl_ast_build;
  schedule: Pisl_map;
  union_schedule: Pisl_union_map;
  ast: Pisl_ast_node;
begin
  ctx := isl_ctx_alloc;
  if ctx = nil then begin
    WriteLn('Fehler beim Erstellen des ISL-Kontexts.');
    Exit;
  end;

  setA := isl_set_read_from_str(ctx, '{ S[x] : 0 <= x < 10 }');
  setB := isl_set_read_from_str(ctx, '{ S[y] : y >= 5 }');
  setC := isl_set_intersect(setA, setB);

  p := isl_printer_to_file(ctx, stdout);
  p := isl_printer_print_set(p, setC);
  p := isl_printer_end_line(p);

  p := isl_printer_set_output_format(p, ISL_FORMAT_C);
  build := isl_ast_build_alloc(ctx);
  schedule := isl_map_from_domain(isl_set_copy(setC));
  union_schedule := isl_union_map_from_map(schedule);
  ast := isl_ast_build_node_from_schedule_map(build, union_schedule);
  p := isl_printer_print_ast_node(p, ast);
  isl_ast_node_free(ast);
  isl_ast_build_free(build);

  p := isl_printer_end_line(p);
  p := isl_printer_flush(p);

  isl_printer_free(p);
  isl_set_free(setC);
  isl_ctx_free(ctx);
end;

begin
  main;
  WriteLn(#10'---------------------------------'#10);
  main2;
end.
