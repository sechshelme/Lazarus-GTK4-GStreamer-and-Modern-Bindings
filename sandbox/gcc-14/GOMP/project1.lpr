program project1;

uses
  SysUtils,
  omp,
  libgomp_g;


type
  TTimeVal = record
    tv_sec: int64;
    tv_usec: int64;
  end;
  PTimeVal = ^TTimeVal;

  {$asmmode intel}

  function ManualGetTimeOfDay(tv: PTimeVal): int64; assembler; nostackframe;
  asm
           Mov     Rax, 96      // Syscall-Nummer 96 (sys_gettimeofday)
           Mov     Rdi, tv      // Erster Parameter: Zeiger auf die Struktur
           Xor     Rsi, Rsi     // Zweiter Parameter: Zeitzone (NULL/0)
           Syscall          // Den Kernel aufrufen
  end;

  procedure worker(para1: pointer); cdecl;
  var
    r: double;
    i: int64;
    counter:int64=0;
    y: Integer;
  begin
    r := omp_get_thread_num;
    for i := 0 to 1000000000 do begin
      for y := 0 to 10 do begin
//      r := sin(r * i);
      inc(counter);
      end;
    end;

    GOMP_critical_start;
    WriteLn('counter: ',counter);
    writeln('thread ', omp_get_thread_num: 5, ' / ', omp_get_num_threads: 5);
    WriteLn('r: ', r: 4: 2);
    GOMP_critical_end;
  end;

  procedure main;
  var
    num_proc: longint;
    start, ende: TTimeVal;
    maxt: integer;
  begin
    ManualGetTimeOfDay(@start);

    num_proc := omp_get_num_procs;
    maxt := num_proc;
    omp_set_num_threads(maxt);
    WriteLn('Kerne: ', num_proc);
    WriteLn('Threads gesamt: ', omp_get_max_threads);

    GOMP_parallel_start(@worker, nil, maxt);
    worker(nil);
    GOMP_critical_start;
    WriteLn('Hauptprozess');
    GOMP_critical_end;
    GOMP_parallel_end;
    ManualGetTimeOfDay(@ende);

    WriteLn('Rechenzeit: ', ende.tv_sec - start.tv_sec);
  end;

begin
  main;
end.
