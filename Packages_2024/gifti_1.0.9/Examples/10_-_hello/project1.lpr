program project1;

(*
Demo gii Files:

https://www.nitrc.org/frs/?group_id=75
*)

uses
  fp_nifti,
  fp_gifti_io;

  procedure main;
  const
    filename = '/home/tux/Schreibtisch/gifti_io/lh.aparc.gii';
  var
    i: integer;
    gim: Pgifti_image;
    da: PgiiDataArray;
    num_elements: int64;
    uint_data: PUInt32;
    int_data: PInt32;
    float_data: PSingle;
  begin
    gim := gifti_read_image(filename, 1);
    if gim = nil then begin
      WriteLn('Fehler: Konnte die Datei nicht lesen.  ', filename);
      Exit;
    end;

    WriteLn('--- GIFTI Datei erfolgreich geladen ---');
    WriteLn('Dateiname:    ', filename);
    WriteLn('Daten-Arrays: ', gim^.numDA, #10);

    if (gim^.numDA > 0) and (gim^.darray <> nil) then begin
      da := gim^.darray[0];

      if da <> nil then begin
        num_elements := da^.nvals;
        WriteLn('Gesamtzahl der Werte im Array: ', num_elements);
        WriteLn('Datentyp-ID (NIfTI-Code):      ', da^.datatype);
        WriteLn('Die ersten 20 Werte:');

        if num_elements > 20 then begin
          num_elements := 20;
        end;

        case da^.datatype of
          NIFTI_TYPE_UINT32: begin
            uint_data := PUInt32(da^.data);
            for i := 0 to num_elements - 1 do begin
              WriteLn('  Index [', i, ']: ', uint_data[i]);
            end;
          end;
          NIFTI_TYPE_INT32: begin
            int_data := Pint32(da^.data);
            for i := 0 to num_elements - 1 do begin
              WriteLn('  Index [', i, ']: ', int_data[i]);
            end;
          end;

          NIFTI_TYPE_FLOAT32: begin
            float_data := PSingle(da^.data);
            for i := 0 to num_elements - 1 do begin
              WriteLn('  Index [', i, ']: ', float_data[i]: 4: 2);
            end;
          end;
          else begin
            WriteLn('  (Datentyp ', da^.datatype, ' wird im Beispiel nicht direkt unterstützt.)');
          end;
        end;
      end;
    end else begin
      WriteLn('Keine Daten-Arrays in dieser Datei gefunden.');
    end;
    gifti_free_image(gim);
  end;

begin
  main;
end.
