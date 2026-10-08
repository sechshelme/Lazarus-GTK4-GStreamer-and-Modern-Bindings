program project1;

uses
  SysUtils,
  omp,
  libgomp_g;


type
  TTimeVal = record
    tv_sec: Int64;
    tv_usec: Int64;
  end;
  PTimeVal = ^TTimeVal;

  {$asmmode intel}

function ManualGetTimeOfDay(tv: PTimeVal): Int64; assembler; nostackframe;
asm
  mov rax, 96      // Syscall-Nummer 96 (sys_gettimeofday)
  mov rdi, tv      // Erster Parameter: Zeiger auf die Struktur
  xor rsi, rsi     // Zweiter Parameter: Zeitzone (NULL/0)
  syscall          // Den Kernel aufrufen
end;



var
  lock_stdout: Pointer = nil;

  procedure worker(para1: pointer); cdecl;
  var
    r: double;
    i: int64;
  begin
    r := omp_get_thread_num;
    for i := 0 to 1000000000 do begin
      r := sin(r * i);
    end;

    GOMP_critical_name_start(@lock_stdout);
    writeln('thread ', omp_get_thread_num: 5, ' / ', omp_get_num_threads: 5);
    WriteLn('r: ', r:4:2);
    GOMP_critical_name_end(@lock_stdout);
  end;

  procedure main;
  var
    num_proc: longint;
    start, ende: TTimeVal;
    maxt: integer;
  begin
    ManualGetTimeOfDay(@start);

    num_proc := omp_get_num_procs;
    maxt := num_proc;;
    maxt := 4;
    omp_set_num_threads(maxt);
    WriteLn('Kerne: ', num_proc);
    WriteLn('Threads gesamt: ', omp_get_max_threads);

    GOMP_parallel_start(@worker, nil, maxt);
    GOMP_critical_name_start(@lock_stdout);
    WriteLn('Hauptprozess');
    GOMP_critical_name_end(@lock_stdout);
    GOMP_parallel_end;
    ManualGetTimeOfDay(@ende);

    WriteLn('Rechenzeit: ', ende.tv_sec - start.tv_sec);
  end;

begin
  main;
end.
