program project1;

uses
  fp_opencl;

function GetDeviceName(device_id: Tcl_device_id): string;
var
  size: Tsize_t = 0;
begin
  clGetDeviceInfo(device_id, CL_DEVICE_NAME, 0, nil, @size);
  SetLength(Result, size - 1);
  clGetDeviceInfo(device_id, CL_DEVICE_NAME, size, @Result[1], nil);
end;

function SelectOpenCLDevice: Tcl_device_id;
type
  TAvailableDevice = record
    id: Tcl_device_id;
    platform_id: Tcl_platform_id;
  end;
var
  num_platforms, num_devices: Tcl_uint;
  platforms: array of Tcl_platform_id = nil;
  devices: array of Tcl_device_id = nil;
  menu_items: array of TAvailableDevice = nil;
  i, j: Integer;
  choice: Integer = 0;
  ret: Tcl_int;
begin
  Result := nil;

  ret := clGetPlatformIDs(0, nil, @num_platforms);
  if (ret <> CL_SUCCESS) or (num_platforms = 0) then begin
    WriteLn('Keine OpenCL Plattformen gefunden.');
    Exit;
  end;

  SetLength(platforms, num_platforms);
  clGetPlatformIDs(num_platforms, @platforms[0], nil);

  for i := 0 to num_platforms - 1 do begin
    num_devices := 0;
    ret := clGetDeviceIDs(platforms[i], CL_DEVICE_TYPE_ALL, 0, nil, @num_devices);

    if (ret <> CL_SUCCESS) or (num_devices = 0) then Continue;

    SetLength(devices, num_devices);
    ret := clGetDeviceIDs(platforms[i], CL_DEVICE_TYPE_ALL, num_devices, @devices[0], nil);
    if ret <> CL_SUCCESS then Continue;

    for j := 0 to num_devices - 1 do begin
      if devices[j] = nil then Continue;

      SetLength(menu_items, Length(menu_items) + 1);
      with menu_items[High(menu_items)] do begin
        id := devices[j];
        platform_id := platforms[i];
        WriteLn('[', Length(menu_items), '] Plattform ', i, ': ', GetDeviceName(devices[j]));
      end;
    end;
  end;

  if Length(menu_items) = 0 then begin
    WriteLn('Keine aktiven OpenCL-Geräte verfügbar. (Prüfe Umgebungsvariablen!)');
    Exit;
  end;

  WriteLn(#10'=== Verfügbare OpenCL Geräte ===');
  while (choice < 1) or (choice > Length(menu_items)) do begin
    WriteLn('Bitte wählen Sie ein Gerät (1-', Length(menu_items), '):');
    ReadLn(choice);
  end;

  Result := menu_items[choice - 1].id;
end;
// ===========


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
    '    int i = get_global_id(0);                                                                  '#10 +
    '    C[i] = A[i] + B[i];                                                                        '#10 +
    '}';

  function LoadProgram(queue: Tcl_command_queue; prg_source: pchar): Tcl_program;
  var
    context: Tcl_context;
    device_id: Tcl_device_id;
    build_res: Tcl_int;
    log_size: Tsize_t;
    build_log: array of char = nil;

    p_context: Pointer;
    p_device: Pointer;
  begin
    p_context := nil;
    p_device := nil;

    clGetCommandQueueInfo(queue, CL_QUEUE_CONTEXT, SizeOf(Pointer), @p_context, nil);
    clGetCommandQueueInfo(queue, CL_QUEUE_DEVICE, SizeOf(Pointer), @p_device, nil);

    context := Tcl_context(p_context);
    device_id := Tcl_device_id(p_device);

    Result := clCreateProgramWithSource(context, 1, @prg_source, nil, nil);
    build_res := clBuildProgram(Result, 1, @device_id, nil, nil, nil);

    if build_res <> CL_SUCCESS then begin
      clGetProgramBuildInfo(Result, device_id, CL_PROGRAM_BUILD_LOG, 0, nil, @log_size);
      if log_size > 0 then begin
        SetLength(build_log, log_size);
        clGetProgramBuildInfo(Result, device_id, CL_PROGRAM_BUILD_LOG, log_size, pchar(build_log), nil);
        WriteLn('--- COMPILER FEHLERPROTOKOLL ---');
        WriteLn(pchar(@build_log[0]));
        WriteLn('--------------------------------');
      end;
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
    context: Tcl_context = nil;
    command_queue: Tcl_command_queue = nil;
    a_mem_obj: Tcl_mem = nil;
    b_mem_obj: Tcl_mem = nil;
    c_mem_obj: Tcl_mem = nil;
    prg: Tcl_program = nil;
    kernel: Tcl_kernel = nil;
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

    device_id:=    SelectOpenCLDevice;
    WriteLn('=========================================');
    PrintVersion(platform_id, device_id);

    context := clCreateContext(nil, 1, @device_id, nil, nil, nil);
    command_queue := clCreateCommandQueueWithProperties(context, device_id, nil, nil);

    a_mem_obj := clCreateBuffer(context, CL_MEM_READ_ONLY, ARRAY_SIZE * sizeof(single), nil, nil);
    b_mem_obj := clCreateBuffer(context, CL_MEM_READ_ONLY, ARRAY_SIZE * sizeof(single), nil, nil);
    c_mem_obj := clCreateBuffer(context, CL_MEM_WRITE_ONLY, ARRAY_SIZE * sizeof(single), nil, nil);

    clEnqueueWriteBuffer(command_queue, a_mem_obj, CL_TRUE, 0, ARRAY_SIZE * sizeof(single), A, 0, nil, nil);
    clEnqueueWriteBuffer(command_queue, b_mem_obj, CL_TRUE, 0, ARRAY_SIZE * sizeof(single), B, 0, nil, nil);

    prg := LoadProgram(command_queue, kernel_source);

    if prg <> nil then begin
      kernel := clCreateKernel(prg, 'vector_add', nil);

      if kernel <> nil then begin
        clSetKernelArg(kernel, 0, sizeof(Tcl_mem), @a_mem_obj);
        clSetKernelArg(kernel, 1, sizeof(Tcl_mem), @b_mem_obj);
        clSetKernelArg(kernel, 2, sizeof(Tcl_mem), @c_mem_obj);

        global_item_size := ARRAY_SIZE;
        local_item_size := 64;
        clEnqueueNDRangeKernel(command_queue, kernel, 1, nil, @global_item_size, @local_item_size, 0, nil, nil);

        clEnqueueReadBuffer(command_queue, c_mem_obj, CL_TRUE, 0, ARRAY_SIZE * sizeof(single), C, 0, nil, nil);

        for i := 0 to 9 do begin
          WriteLn(A[i]: 4: 2, ' + ', B[i]: 4: 2, ' = ', C[i]: 4: 2);
        end;
      end else begin
        WriteLn('Fehler: Kernel konnte nicht erstellt werden. Name falsch?');
      end;
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
