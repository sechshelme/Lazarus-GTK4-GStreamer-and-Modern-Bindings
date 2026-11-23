program project1;

uses
  fp_assimp;

// scene.inc ?????

  procedure main;
  begin
    WriteLn('Assimp Version: ', aiGetVersionMajor, '.', aiGetVersionMinor, '.', aiGetVersionPatch, '.', aiGetVersionRevision);
    WriteLn('Branch:         ', aiGetBranchName);
    WriteLn('Legal:          ', aiGetLegalString);
  end;

begin
  main;
end.
