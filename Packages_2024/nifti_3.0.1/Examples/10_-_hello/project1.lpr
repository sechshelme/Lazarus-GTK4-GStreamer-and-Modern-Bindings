program project1;

(*
Demo nii Files:

https://codeload.github.com/neurolabusc/niivue-images/zip/refs/heads/main
*)

uses
  fp_nifti2;

  procedure main;
  const
    filename = '/home/tux/Schreibtisch/gifti_io/fmri_pitch.nii.gz';
  var
    load_data: integer = 0;
    nim: Pnifti2_image;
    i: integer;
  begin
    nim := nifti_image_read(filename, load_data);

    if nim = nil then begin
      WriteLn('Fehler beim Lesen der Datei: ', filename);
      Exit;
    end;

    WriteLn('--- NIfTI Bild-Informationen ---');
    WriteLn('Dateiname:        ', nim^.fname);
    WriteLn('NIfTI-Version:    ', nim^.nifti_type);
    WriteLn('Dimensionen (dim): %', nim^.ndim);

    Write('Matrix-Grösse:     ');
    for  i := 1 to nim^.ndim - 1 do begin
      WriteLn(' ', nim^.dim[i]);
    end;
    WriteLn();

    WriteLn('Voxel-Grösse (pixdim): ');
    for  i := 1 to nim^.ndim - 1 do begin
      WriteLn(' mm ', nim^.pixdim[i]: 4: 2);
    end;
    WriteLn();

    WriteLn('Datentyp-Code:    ', nim^.datatype);
    WriteLn('--------------------------------');

    nifti_image_free(nim);
  end;

begin
  main;
end.
