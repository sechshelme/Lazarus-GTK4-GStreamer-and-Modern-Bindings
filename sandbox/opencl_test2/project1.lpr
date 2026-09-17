program project1;

uses
  cl_version,
  cl_platform,
  cl,

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
  // ... deine anderen Variablen (A, B, C etc.) ...
  i, p: integer;

  // Arrays für die Plattform-Suche
  platforms: array[0..9] of Tcl_platform_id;
  devices: array[0..9] of Tcl_device_id;
  num_platforms: Tcl_uint = 0;
  num_devices: Tcl_uint = 0;

  // Die aktuell ausgewählten Objekte für die Berechnung
  platform_id: Tcl_platform_id = nil;
  device_id: Tcl_device_id = nil;
begin
  // ... Host-Daten (A, B, C) vorbereiten ...

  // 1. Alle verfügbaren Plattformen im System abfragen
  clGetPlatformIDs(10, @platforms, @num_platforms);
  WriteLn('=== GEFUNDENE OPENCL TREIBER (', num_platforms, ') ===');
  WriteLn;

  // 2. In einer Schleife durch jede Plattform wandern und ausgeben
  for p := 0 to num_platforms - 1 do begin
    WriteLn('--- Plattform Eintrag ', p, ' ---');

    // Versuche das Standard-Gerät dieser spezifischen Plattform zu holen
    clGetDeviceIDs(platforms[p], CL_DEVICE_TYPE_ALL, 1, @devices[0], @num_devices);

    if num_devices > 0 then begin
      // Übergreife deine PrintVersion-Prozedur mit dem aktuellen Pärchen
      PrintVersion(platforms[p], devices[0]);

      // Merke dir die Plattform mit der GPU für die spätere Berechnung
      if platform_id = nil then begin
        platform_id := platforms[p];
        device_id := devices[0];
      end;
    end else begin
      WriteLn('Keine kompatiblen Geräte auf dieser Plattform gefunden.');
    end;
    WriteLn;
  end;
  WriteLn('======================================');
  WriteLn;


  // ... ab hier folgt dein gewohnter OpenCL-Setup-Code (clCreateContext etc.) ...
end;

begin
  main;
end.
