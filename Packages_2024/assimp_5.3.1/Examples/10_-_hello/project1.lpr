program project1;

uses
  fp_assimp;

  procedure main;
  const
    path = '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/OpenGL_3.3/Examples/20_-_Wavefront OBJ/obj/cube.obj';
  var
    scene: PaiScene;
    mesh: PaiMesh;
    m, v, f: integer;
    p, norm: TaiVector3D;
    face: TaiFace;
    mat: PaiMaterial;
    matName, texPath: TaiString;
    diffuseColor: TaiColor4D;
  begin
    WriteLn('Assimp Version: ', aiGetVersionMajor, '.', aiGetVersionMinor, '.', aiGetVersionPatch, '.', aiGetVersionRevision);
    WriteLn('Branch:         ', aiGetBranchName);
    WriteLn('Legal:          ', aiGetLegalString);

    scene := aiImportFile(path, aiProcess_Triangulate or aiProcess_JoinIdenticalVertices or aiProcess_GenNormals);

    if (scene = nil) or (scene^.mFlags and AI_SCENE_FLAGS_INCOMPLETE <> 0) or (scene^.mRootNode = nil) then begin
      WriteLn('Assimp Fehler: ', aiGetErrorString);
      Exit;
    end;

    WriteLn('Erfolgreich geladen! Anzahl Meshes: ', LineEnding, scene^.mNumMeshes);

    for m := 0 to scene^.mNumMeshes - 1 do begin
      mesh := scene^.mMeshes[m];
      if (mesh^.mPrimitiveTypes and aiPrimitiveType_TRIANGLE) = 0 then begin
        Continue;
      end;

      WriteLn('========================================');
      WriteLn('Mesh ', m, ': ', mesh^.mName.data);
      WriteLn('Vertices: ', mesh^.mNumVertices, ' | Faces: ', mesh^.mNumFaces);

      if scene^.mMaterials <> nil then begin
        mat := scene^.mMaterials[mesh^.mMaterialIndex];

        if aiGetMaterialString(mat, '?mat.name', 0, 0, @matName) = aiReturn_SUCCESS then begin
          WriteLn('Material-Name: ', matName.data);
        end;

        if aiGetMaterialColor(mat, '$clr.diffuse', 0, 0, @diffuseColor) = aiReturn_SUCCESS then begin
          WriteLn('Diffuse Farbe: R=', diffuseColor.r: 0: 2, ' G=', diffuseColor.g: 0: 2, ' B=', diffuseColor.b: 0: 2);
        end;

        if aiGetMaterialTexture(mat, aiTextureType_DIFFUSE, 0, @texPath, nil, nil, nil, nil, nil, nil) = aiReturn_SUCCESS then begin
          WriteLn('Diffuse Textur: ', texPath.data);
        end else begin
          WriteLn('Diffuse Textur: (keine)');
        end;
      end;

      for v := 0 to mesh^.mNumVertices - 1 do begin
        p := mesh^.mVertices[v];
        norm := mesh^.mNormals[v];
        WriteLn('  V ', v: 2, ': (', p.x: 6: 2, ', ', p.y: 6: 2, ', ', p.z: 6: 2, ') | Norm: (', norm.x: 5: 2, ', ', norm.y: 5: 2, ', ', norm.z: 5: 2, ')');
      end;

      WriteLn('Faces:');
      for f := 0 to mesh^.mNumFaces - 1 do begin
        face := mesh^.mFaces[f];
        WriteLn('  Dreieck ', f: 2, ': ', face.mIndices[0]: 2, ', ', face.mIndices[1]: 2, ', ', face.mIndices[2]: 2);
      end;
    end;
    aiReleaseImport(scene);
  end;

begin
  main;
end.
