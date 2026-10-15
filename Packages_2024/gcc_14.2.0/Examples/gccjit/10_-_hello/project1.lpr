program project1;

uses
  fp_gccjit;

  procedure CreateSquare(ctxt: Pgcc_jit_context);
  var
    int_type: Pgcc_jit_type;
    func: Pgcc_jit_function;
  begin
    int_type := gcc_jit_context_get_type(ctxt, GCC_JIT_TYPE_INT);

    func := gcc_jit_context_new_function(ctxt, nil, GCC_JIT_FUNCTION_EXPORTED, int_type, 'square', 1,
      @[gcc_jit_context_new_param(ctxt, nil, int_type, 'i')], 0);

    gcc_jit_block_end_with_return(gcc_jit_function_new_block(func, nil), nil,
      gcc_jit_context_new_binary_op(ctxt, nil, GCC_JIT_BINARY_OP_MULT, int_type,
      gcc_jit_param_as_rvalue(gcc_jit_function_get_param(func, 0)),
      gcc_jit_param_as_rvalue(gcc_jit_function_get_param(func, 0))));
  end;

  procedure CreateMul(ctxt: Pgcc_jit_context);
  var
    int_type: Pgcc_jit_type;
    func: Pgcc_jit_function;
  begin
    int_type := gcc_jit_context_get_type(ctxt, GCC_JIT_TYPE_INT);

    func := gcc_jit_context_new_function(ctxt, nil, GCC_JIT_FUNCTION_EXPORTED, int_type, 'mul', 2,
      @[gcc_jit_context_new_param(ctxt, nil, int_type, 'a'), gcc_jit_context_new_param(ctxt, nil, int_type, 'b')], 0);

    gcc_jit_block_end_with_return(gcc_jit_function_new_block(func, nil), nil,
      gcc_jit_context_new_binary_op(ctxt, nil, GCC_JIT_BINARY_OP_MULT, int_type,
      gcc_jit_param_as_rvalue(gcc_jit_function_get_param(func, 0)),
      gcc_jit_param_as_rvalue(gcc_jit_function_get_param(func, 1))));
  end;

  procedure main;
  type
    TFunction1 = function(a: int32): int32; cdecl;
    TFunction2 = function(a, b: int32): int32; cdecl;
  var
    res: Pgcc_jit_result;
    fn_ptr_sq, fn_ptr_mul: Pointer;
    i1, o, i2: integer;
    ctxt: Pgcc_jit_context;
  begin
    WriteLn('Version: ', gcc_jit_version_major, '.', gcc_jit_version_minor, '.', gcc_jit_version_patchlevel, #10);

    ctxt := gcc_jit_context_acquire;
    if ctxt = nil then begin
      WriteLn('Fehler beim Erstellen des JIT-Kontextes');
      Exit;
    end;

    gcc_jit_context_set_int_option(ctxt, GCC_JIT_INT_OPTION_OPTIMIZATION_LEVEL, 3);

    CreateSquare(ctxt);
    CreateMul(ctxt);


    gcc_jit_context_set_bool_option(ctxt, GCC_JIT_BOOL_OPTION_DUMP_INITIAL_GIMPLE, 1);
    res := gcc_jit_context_compile(ctxt);
    if res = nil then begin
      WriteLn('Kompilierung fehlgeschlagen');
      gcc_jit_context_release(ctxt);
      Exit;
    end;

    fn_ptr_sq := gcc_jit_result_get_code(res, 'square');
    fn_ptr_mul := gcc_jit_result_get_code(res, 'mul');

    i1 := 9;
    o := TFunction1(fn_ptr_sq)(i1);
    WriteLn('JIT-Ergebnis: Das Quadrat von ', i1, ' ist ', o);

    i1 := 3;
    i2 := 4;
    o := TFunction2(fn_ptr_mul)(i1, i2);
    WriteLn('JIT-Ergebnis: ', i1, 'x', i2, '=', o);


    // Schreibt die aktuelle Struktur als Pseudo-C in die Datei 'mein_code.c'
//    gcc_jit_context_dump_to_file(ctxt, 'main.c', 1);


    gcc_jit_result_release(res);
    gcc_jit_context_release(ctxt);
  end;

begin
  main;
end.
