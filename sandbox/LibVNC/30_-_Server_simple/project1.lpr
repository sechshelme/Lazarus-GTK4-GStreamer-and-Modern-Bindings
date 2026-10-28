program project1;

uses
  fp_vnc;

  procedure main;
  const
    width = 640;
    height = 480;
    bpp = 4;
    default_argv: array of pchar = (nil, '-rfbport', '5901', '-desktop', 'Mein eigener C-VNC-Server', nil);
    fake_argc: longint = 5;
  var
    framebuffer: PUInt32;
    server: TrfbScreenInfoPtr;
    box_x: integer = 50;
    box_y: integer = 50;
    box_size: integer = 100;
    speed_x: integer = 4;
    speed_y: integer = 3;
    y, x, pixel_index: integer;

  begin
    framebuffer := GetMem(width * height * bpp);
    FillChar(framebuffer^, width * height * bpp, 0);

    server := rfbGetScreen(@fake_argc, PPChar(default_argv), width, height, 8, 3, bpp);
    if server = nil then begin
      WriteLn('Server error');
      Freemem(framebuffer);
      Exit;
    end;

    rfbNewFramebuffer(server, pchar(framebuffer), width, height, 8, 3, bpp);
    rfbInitServer(server);

    WriteLn('VNC-Server wurde erfolgreich initialisiert...');

    while rfbIsActive(server) do begin
      FillChar(framebuffer^, width * height * bpp, 0);

      box_x += speed_x;
      box_y += speed_y;

      if box_x < 0 then begin
        box_x := 0;
        speed_x := -speed_x;
      end;
      if box_x + box_size > width then begin
        box_x := width - box_size;
        speed_x := -speed_x;
      end;

      if box_y < 0 then begin
        box_y := 0;
        speed_y := -speed_y;
      end;
      if box_y + box_size > height then begin
        box_y := height - box_size;
        speed_y := -speed_y;
      end;

      for  y := box_y to box_y + box_size - 1 do begin
        for  x := box_y to box_y + box_size - 1 do begin
          pixel_index := y * width + x;
          framebuffer[pixel_index] := $00FF00FF;
        end;
      end;

      rfbMarkRectAsModified(server, 0, 0, width, height);
      rfbProcessEvents(server, 20000);
    end;

    rfbScreenCleanup(server);
    Freemem(framebuffer);
  end;

begin
  main;
end.
