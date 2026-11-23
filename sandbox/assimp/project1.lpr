program project1;

uses
  config,
  defs,
  vector2,
  vector3,
  aabb,
  quaternion,
  types,
  anim,
  camera,
  cexport,
  cfileio,
  matrix3x3,
  matrix4x4,
  importerdesc,
  cimport,
  color4,
  light,
  texture,
  material,
  mesh,
  metadata,
  postprocess,
  scene,
  version,

  fp_assimp;

  procedure main;
  begin
    WriteLn('Assimp Version: ', aiGetVersionMajor, '.', aiGetVersionMinor, '.', aiGetVersionPatch, '.', aiGetVersionRevision);
    WriteLn('Branch:         ', aiGetBranchName);
    WriteLn('Legal:          ', aiGetLegalString);
  end;

begin
  main;
end.
