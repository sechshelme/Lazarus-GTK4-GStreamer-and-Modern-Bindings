program project1;

uses
  Crt,
  fp_vnc;

  function update_screen_size(client: PrfbClient): TrfbBool; cdecl;
  var
    size: SizeInt;
    width, height: longint;
  begin
    width := client^.width;
    height := client^.height;

    WriteLn('[VNC] Bildschirmauflösung geändert: ', width, 'x', height);

    size := width * height * 4;

    if client^.frameBuffer = nil then begin
      client^.frameBuffer := Getmem(size);
    end else begin
      ReAllocMem(client^.frameBuffer, size);
    end;

    client^.format.bitsPerPixel := 32;
    client^.format.depth := 24;
    client^.format.bigEndian := 0;
    client^.format.trueColour := 1;
    client^.format.redMax := 255;
    client^.format.greenMax := 255;
    client^.format.blueMax := 255;
    client^.format.redShift := 16;
    client^.format.greenShift := 8;
    client^.format.blueShift := 0;

    Result := True;
  end;

  procedure handle_update(client: PrfbClient; x: longint; y: longint; w: longint; h: longint); cdecl;
  begin
    WriteLn('handle_update x: ', x, '  y: ', y, '  w: ', w, '  h: ', h);
  end;


  procedure main;
  var
    vnc_client: PrfbClient;
  begin
    vnc_client := rfbGetClient(8, 3, 4);
    vnc_client^.serverHost := '127.0.0.1';
    vnc_client^.serverPort := 5900;
    vnc_client^.MallocFrameBuffer := @update_screen_size;
    vnc_client^.GotFrameBufferUpdate := @handle_update;

    WriteLn('vnc_client^.clientData: ', PtrUInt(vnc_client^.clientData));

    WriteLn('Verbinde zu VNC');
    if not rfbInitClient(vnc_client, @argc, argv) then begin
      WriteLn('VNC: Verbindung fehlgeschlagen!');
      exit;
    end;

    SendFramebufferUpdateRequest(vnc_client, 0, 0, vnc_client^.width, vnc_client^.height, False);

    WriteLn('Starte Event-Loop. Warte auf Updates...');

    while not KeyPressed do begin
      if WaitForMessage(vnc_client, 0) > 0 then begin
        if not HandleRFBServerMessage(vnc_client) then begin
          WriteLn('VNC Verbindung abgebrochen.');
          Break;
        end;
      end;
    end;
    Freemem(vnc_client^.frameBuffer);

//    rfbClientCleanup(vnc_client);
    WriteLn('end');
  end;

begin
  main;
end.
