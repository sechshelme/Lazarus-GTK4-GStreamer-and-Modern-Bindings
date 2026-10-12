program project1;

uses
  fp_gccjit;

  procedure main;
  type
    TFunction1 = function(a: int32): int32; cdecl;
  var
    ctxt: Pgcc_jit_context;
    func: Pgcc_jit_function;
    int_type: Pgcc_jit_type;
    param_i: Pgcc_jit_param;
    block: Pgcc_jit_block;
    arg_i, expr: Pgcc_jit_rvalue;
    res: Pgcc_jit_result;
    fn_ptr: Pointer;
    i, o: integer;
  begin
    WriteLn('Version: ', gcc_jit_version_major, '.', gcc_jit_version_minor, '.', gcc_jit_version_patchlevel, #10);

    ctxt := gcc_jit_context_acquire;
    if ctxt = nil then begin
      WriteLn('Fehler beim Erstellen des JIT-Kontextes');
      Exit;
    end;

    gcc_jit_context_set_int_option(ctxt, GCC_JIT_INT_OPTION_OPTIMIZATION_LEVEL, 3);
    int_type := gcc_jit_context_get_type(ctxt, GCC_JIT_TYPE_INT);
    param_i := gcc_jit_context_new_param(ctxt, nil, int_type, 'i');
    func := gcc_jit_context_new_function(ctxt, nil, GCC_JIT_FUNCTION_EXPORTED, int_type, 'square', 1, @param_i, 0);
    block := gcc_jit_function_new_block(func, nil);
    arg_i := gcc_jit_param_as_rvalue(param_i);
    expr := gcc_jit_context_new_binary_op(ctxt, nil, GCC_JIT_BINARY_OP_MULT, int_type, arg_i, arg_i);
    gcc_jit_block_end_with_return(block, nil, expr);

    res := gcc_jit_context_compile(ctxt);
    if res = nil then begin
      WriteLn('Kompilierung fehlgeschlagen');
      gcc_jit_context_release(ctxt);
      Exit;
    end;

    fn_ptr := gcc_jit_result_get_code(res, 'square');
    if fn_ptr = nil then begin
      WriteLn('Funktion nicht gefunden');
      gcc_jit_result_release(res);
      gcc_jit_context_release(ctxt);
      Exit;;
    end;

    i := 9;
    o := TFunction1(fn_ptr)(i);
    WriteLn('JIT-Ergebnis: Das Quadrat von ', i, ' ist ', o);

    gcc_jit_result_release(res);
    gcc_jit_context_release(ctxt);
  end;

begin
  main;
end.
