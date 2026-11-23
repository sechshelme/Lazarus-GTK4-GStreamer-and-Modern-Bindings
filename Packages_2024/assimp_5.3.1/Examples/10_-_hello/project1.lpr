program project1;

uses
  fp_assimp;

// scene.inc ?????

  procedure main;
  var
    scene: PaiScene;
  begin
    WriteLn('Assimp Version: ', aiGetVersionMajor, '.', aiGetVersionMinor, '.', aiGetVersionPatch, '.', aiGetVersionRevision);
    WriteLn('Branch:         ', aiGetBranchName);
    WriteLn('Legal:          ', aiGetLegalString);


scene := aiImportFile(
        '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/OpenGL_3.3/Examples/20_-_Wavefront OBJ/obj/cube.obj',
        aiProcess_Triangulate or aiProcess_JoinIdenticalVertices    );

    if (!scene || (scene->mFlags & AI_SCENE_FLAGS_INCOMPLETE) || !scene->mRootNode) {
        fprintf(stderr, "Assimp Fehler: %s\n", aiGetErrorString());
        return 1;
    }

    printf("Erfolgreich geladen! Anzahl Meshes: %u\n\n", scene->mNumMeshes);

    // Über alle geladenen Meshes iterieren
    for (unsigned int m = 0; m < scene->mNumMeshes; m++) {
        const struct aiMesh* mesh = scene->mMeshes[m];
        printf("--- Mesh %u (%s) ---\n", m, mesh->mName.data);
        printf("Vertices: %u | Faces (Dreiecke): %u\n", mesh->mNumVertices, mesh->mNumFaces);

        // Vertices (Positionen) auslesen
for (unsigned int v = 0; v < mesh->mNumVertices; v++) {
    struct aiVector3D pos = mesh->mVertices[v];

    if (mesh->mNormals != NULL) {
        struct aiVector3D norm = mesh->mNormals[v];
        printf("  Vertex %u: Pos(%.2f, %.2f, %.2f) | Norm(%.2f, %.2f, %.2f)\n",
               v, pos.x, pos.y, pos.z, norm.x, norm.y, norm.z);
    } else {
        printf("  Vertex %u: Pos(%.2f, %.2f, %.2f) | Keine Normale\n",
               v, pos.x, pos.y, pos.z);
    }
}

        // Indizes der Dreiecke auslesen
        for (unsigned int f = 0; f < mesh->mNumFaces; f++) {
            struct aiFace face = mesh->mFaces[f];
            // Durch aiProcess_Triangulate hat jedes Face genau 3 Indizes
            printf("  Dreieck %u: [%u, %u, %u]\n",
                   f, face.mIndices[0], face.mIndices[1], face.mIndices[2]);
        }
    }

    // Speicher der Szene sauber freigeben
    aiReleaseImport(scene);

  end;

begin
  main;
end.
