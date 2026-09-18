program project1;
uses
  fp_opencl;

  function GetPlattformInfo(platform_id: Tcl_platform_id; info: integer): pchar;
  var
    size: Tsize_t;
  begin
    clGetPlatformInfo(platform_id, info, 0, nil, @size);
    Result := GetMem(size);
    clGetPlatformInfo(platform_id, info, size, Result, nil);
  end;

  function GetDevice(device_id: Tcl_device_id; info: integer): pchar;
  var
    size: Tsize_t;
  begin
    clGetDeviceInfo(device_id, info, 0, nil, @size);
    Result := GetMem(size);
    clGetDeviceInfo(device_id, info, size, Result, nil);
  end;

  procedure PrintPlattformInfo(platform_id: Tcl_platform_id);
  var
    s: pchar;
  begin
    s := GetPlattformInfo(platform_id, CL_PLATFORM_VERSION);
    WriteLn('Plattform Version: '#10'  ', s);
    Freemem(s);

    s := GetPlattformInfo(platform_id, CL_PLATFORM_NAME);
    WriteLn('Plattform Version: '#10'  ', s);
    Freemem(s);

    s := GetPlattformInfo(platform_id, CL_PLATFORM_EXTENSIONS);
    WriteLn('Plattform Extensions: '#10'  ', s);
    Freemem(s);

    WriteLn('--------------------------------------------------------------------'#10);
  end;

  procedure PrintDeviceInfo(device_id: Tcl_device_id);
  var
    s: pchar;
  begin
    s := GetDevice(device_id, CL_DEVICE_VERSION);
    WriteLn('Hardware Version: '#10'  ', s);
    Freemem(s);

    s := GetDevice(device_id, CL_DEVICE_EXTENSIONS);
    WriteLn('Hardware Extensions: '#10'  ', s);
    Freemem(s);

    WriteLn();
  end;

  procedure main;
  var
    i, j: integer;

    platforms: Pcl_platform_id;
    devices: Pcl_device_id;
    num_platforms: Tcl_uint = 0;
    num_devices: Tcl_uint = 0;
    pf: Tcl_platform_id;
    dv: Tcl_device_id;
  begin
    clGetPlatformIDs(0, nil, @num_platforms);
    platforms := GetMem(num_platforms * SizeOf(Tcl_platform_id));
    clGetPlatformIDs(num_platforms, platforms, nil);

    WriteLn(#10'=== Drivers (', num_platforms, ') ===');
    WriteLn;

    for i := 0 to num_platforms - 1 do begin
      pf := platforms[i];
      clGetDeviceIDs(pf, CL_DEVICE_TYPE_ALL, 0, nil, @num_devices);
      WriteLn(num_devices);
      devices := GetMem(num_devices * SizeOf(Tcl_device_id));
      PrintPlattformInfo(pf);

      clGetDeviceIDs(pf, CL_DEVICE_TYPE_ALL, num_devices, devices, nil);
      for j := 0 to num_devices - 1 do begin
        dv := devices[j];
        PrintDeviceInfo(dv);
      end;
      Freemem(devices);
      WriteLn;
    end;

    Freemem(platforms);
  end;

begin
  main;
end.
