program project1;

uses
  cl_version,
  cl_platform,
  cl,

  fp_opencl;

const
  ARRAY_SIZE = 64;
 Type
   TVector4f=array[0..3] of Single;
   TSingleArray=array[0..ARRAY_SIZE-1] of TVector4f;

const kernel_source:PChar =
'__kernel void vector_add(__global const float4 *A, __global const float4 *B, __global float4 *C) { '#10+
'    int i = get_global_id(0);                                                '#10+
'                                                                             '#10+
'   C[i] = A[i] * B[i];                                                       '#10+
'}                                                                            ';

  procedure main;
  var
    {$CODEALIGN LOCALMIN=64}
//      {$ALIGN  32}

    A:TSingleArray;
    i: integer;
    B:TSingleArray;
    C:TSingleArray;

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
    WriteLn('A Ptr: ', PtrUInt(@A)mod 16);
    WriteLn('B Ptr: ', PtrUInt(@B)mod 16);
    WriteLn('C Ptr: ', PtrUInt(@C)mod 16);
    WriteLn('A Ptr: ', PtrUInt(@A)mod 64);
    WriteLn('B Ptr: ', PtrUInt(@B)mod 64);
    WriteLn('C Ptr: ', PtrUInt(@C)mod 64);

    for i := 0 to ARRAY_SIZE - 1 do begin
      A[i][0] := i;
      B[i][0] := i * 2;
      C[i][0] := 0.0;
    end;

    clGetPlatformIDs(1, @platform_id, @ret_num_platforms);
    clGetDeviceIDs(platform_id, CL_DEVICE_TYPE_GPU, 1, @device_id, @ret_num_devices);

    context := clCreateContext(nil, 1, @device_id, nil, nil, nil);
    command_queue := clCreateCommandQueueWithProperties(context, device_id, nil, nil);

    a_mem_obj := clCreateBuffer(context, CL_MEM_READ_ONLY, ARRAY_SIZE * sizeof(TVector4f), nil, nil);
    b_mem_obj := clCreateBuffer(context, CL_MEM_READ_ONLY, ARRAY_SIZE * sizeof(TVector4f), nil, nil);
    c_mem_obj := clCreateBuffer(context, CL_MEM_WRITE_ONLY, ARRAY_SIZE * sizeof(TVector4f), nil, nil);

    clEnqueueWriteBuffer(command_queue, a_mem_obj, CL_TRUE, 0, ARRAY_SIZE * sizeof(TVector4f), @A, 0, nil, nil);
    clEnqueueWriteBuffer(command_queue, b_mem_obj, CL_TRUE, 0, ARRAY_SIZE * sizeof(TVector4f), @B, 0, nil, nil);

    prg := clCreateProgramWithSource(context, 1, @kernel_source, nil, nil);
    clBuildProgram(prg, 1, @device_id, nil, nil, nil);

    kernel := clCreateKernel(prg, 'vector_add', nil);
    clSetKernelArg(kernel, 0, sizeof(Tcl_mem), @a_mem_obj);
    clSetKernelArg(kernel, 1, sizeof(Tcl_mem), @b_mem_obj);
    clSetKernelArg(kernel, 2, sizeof(Tcl_mem), @c_mem_obj);

    global_item_size := ARRAY_SIZE;
    local_item_size := 64;
    clEnqueueNDRangeKernel(command_queue, kernel, 1, nil, @global_item_size, @local_item_size, 0, nil, nil);

    clEnqueueReadBuffer(command_queue, c_mem_obj, CL_TRUE, 0, ARRAY_SIZE * sizeof(TVector4f), @C, 0, nil, nil);

    for  i := 0 to 9 do begin
      WriteLn(A[i][0]: 4: 2, ' x ', B[i][0]: 4: 2, ' = ', C[i][0]: 4: 2);
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
  end;

begin
  main;
end.
