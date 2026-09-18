program project1;
uses
fp_opencl;

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


procedure main;
var
  i, j: integer;

  platforms: Pcl_platform_id;
  devices:  Pcl_device_id;
  num_platforms: Tcl_uint = 0;
  num_devices: Tcl_uint = 0;
  pf: Tcl_platform_id;
  dv: Tcl_device_id;
begin
  clGetPlatformIDs(0, nil, @num_platforms);
  platforms:=GetMem(num_platforms* SizeOf(Tcl_platform_id));
  clGetPlatformIDs(num_platforms, platforms, nil);

  WriteLn(#10'=== Drivers (', num_platforms, ') ===');
  WriteLn;

  for i := 0 to num_platforms - 1 do begin
    pf:=platforms[i];
    clGetDeviceIDs(pf, CL_DEVICE_TYPE_ALL, 0, nil, @num_devices);
    WriteLn(num_devices);
    devices:=GetMem(num_devices*SizeOf(Tcl_device_id));
    clGetDeviceIDs(pf, CL_DEVICE_TYPE_ALL, num_devices, devices, nil);
    for j:=0 to num_devices-1 do  begin
      dv:=devices[j];
      PrintVersion(pf, dv);
    end;
    Freemem(devices);
    WriteLn;
  end;

  Freemem(platforms);
end;

begin
  main;
end.
