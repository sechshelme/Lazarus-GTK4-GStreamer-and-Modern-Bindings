program project1;

(*

udo apt install pocl-opencl-icd

sudo apt install intel-oneapi-runtime-opencl

*)


uses
  fp_opencl;

const
  ARRAY_SIZE = 1024;

  procedure PrintVersion(platform_id: Tcl_platform_id; device_id: Tcl_device_id);
  var
    s: array[0..255] of char;
  begin
    clGetPlatformInfo(platform_id, CL_PLATFORM_VERSION, SizeOf(s), pchar(s), nil);
    WriteLn('Plattform Version: ', s);
    clGetPlatformInfo(platform_id, CL_PLATFORM_NAME, SizeOf(s), pchar(s), nil);
    WriteLn('Plattform Name: ', s);
    clGetDeviceInfo(device_id, CL_DEVICE_VERSION, SizeOf(s), pchar(s), nil);
    WriteLn('Hardware Version: ', s);
  end;

const kernel_source: pchar =
    '__kernel void vector_add(__global const float *A, __global const float *B, __global float *C) { '#10 +
    '    int i = get_global_id(0);       g                                                           '#10 +
    '    C[i] = A[i] + B[i];                                                                        '#10 +
    '}' +
    '__kernel void vector_mul(__global const float *A, __global const float *B, __global float *C) { '#10 +
    '    int i = get_global_id(0);                                                                  '#10 +
    '    C[i] = A[i] * B[i];                                                                        '#10 +
    '}';

  function LoadProgram(device_id: Tcl_device_id; context: Tcl_context; prg_source: pchar): Tcl_program;
  var
    build_res: Tcl_int;
    log_size: Tsize_t;
    build_log: array of char = nil;
  begin
    Result := clCreateProgramWithSource(context, 1, @prg_source, nil, nil);
    build_res := clBuildProgram(Result, 1, @device_id, nil, nil, nil);
    if build_res <> CL_SUCCESS then begin
      clGetProgramBuildInfo(Result, device_id, CL_PROGRAM_BUILD_LOG, 0, nil, @log_size);
      SetLength(build_log, log_size);
      clGetProgramBuildInfo(Result, device_id, CL_PROGRAM_BUILD_LOG, log_size, PChar(build_log), nil);
      WriteLn('--- COMPILER FEHLERPROTOKOLL ---');
      WriteLn(pchar(@build_log[0]));
      WriteLn('--------------------------------');
      Result := nil;
    end;
  end;

  procedure main;
  var
    A, B, C: PSingle;
    i: integer;
    global_item_size, local_item_size: Tsize_t;
    platform_id: Tcl_platform_id = nil;
    device_id: Tcl_device_id = nil;
    ret_num_platforms: Tcl_uint = 0;
    ret_num_devices: Tcl_uint = 0;
    context: Tcl_context;
    command_queue: Tcl_command_queue;
    a_mem_obj, b_mem_obj, c_mem_obj: Tcl_mem;
    prg: Tcl_program;
    kernel: Tcl_kernel;
  begin
    A := PSingle(GetMem(sizeof(single) * ARRAY_SIZE));
    B := PSingle(GetMem(sizeof(single) * ARRAY_SIZE));
    C := PSingle(GetMem(sizeof(single) * ARRAY_SIZE));

    for i := 0 to ARRAY_SIZE - 1 do begin
      A[i] := i;
      B[i] := i * 2;
      C[i] := 0.0;
    end;

    clGetPlatformIDs(1, @platform_id, @ret_num_platforms);
    clGetDeviceIDs(platform_id, CL_DEVICE_TYPE_GPU, 1, @device_id, @ret_num_devices);
    PrintVersion(platform_id, device_id);

    context := clCreateContext(nil, 1, @device_id, nil, nil, nil);
    command_queue := clCreateCommandQueueWithProperties(context, device_id, nil, nil);

    a_mem_obj := clCreateBuffer(context, CL_MEM_READ_ONLY, ARRAY_SIZE * sizeof(single), nil, nil);
    b_mem_obj := clCreateBuffer(context, CL_MEM_READ_ONLY, ARRAY_SIZE * sizeof(single), nil, nil);
    c_mem_obj := clCreateBuffer(context, CL_MEM_WRITE_ONLY, ARRAY_SIZE * sizeof(single), nil, nil);

    clEnqueueWriteBuffer(command_queue, a_mem_obj, CL_TRUE, 0, ARRAY_SIZE * sizeof(single), A, 0, nil, nil);
    clEnqueueWriteBuffer(command_queue, b_mem_obj, CL_TRUE, 0, ARRAY_SIZE * sizeof(single), B, 0, nil, nil);

    prg := LoadProgram(device_id, context, kernel_source);

    //    prg := clCreateProgramWithSource(context, 1, @kernel_source, nil, nil);
    //    clBuildProgram(prg, 1, @device_id, nil, nil, nil);

    kernel := clCreateKernel(prg, 'vector_add', nil);

    clSetKernelArg(kernel, 0, sizeof(Tcl_mem), @a_mem_obj);
    clSetKernelArg(kernel, 1, sizeof(Tcl_mem), @b_mem_obj);
    clSetKernelArg(kernel, 2, sizeof(Tcl_mem), @c_mem_obj);

    global_item_size := ARRAY_SIZE;
    local_item_size := 64;
    clEnqueueNDRangeKernel(command_queue, kernel, 1, nil, @global_item_size, @local_item_size, 0, nil, nil);

    clEnqueueReadBuffer(command_queue, c_mem_obj, CL_TRUE, 0, ARRAY_SIZE * sizeof(single), C, 0, nil, nil);

    for  i := 0 to 9 do begin
      WriteLn(A[i]: 4: 2, ' x ', B[i]: 4: 2, ' = ', C[i]: 4: 2);
    end;

    clFlush(command_queue);
    clFinish(command_queue);
    clReleaseKernel(kernel);
    clReleaseProgram(prg);
    clReleaseMemObject(a_mem_obj);
    clReleaseMemObject(b_mem_obj);
    clReleaseMemObject(c_mem_obj);
    clReleaseCommandQueue(command_queue);
    clReleaseContext(context);

    Freemem(A);
    Freemem(B);
    Freemem(C);
  end;

begin
  main;
end.
