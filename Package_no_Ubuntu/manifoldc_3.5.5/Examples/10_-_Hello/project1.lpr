program project1;

uses
  types,
  fp_manifoldc;

  procedure main;
  var
    m_size: Tsize_t;
    cube_mem, holeX_mem,diff1_mem,    final_mem, mesh_mem: Pointer;
    cube, hole, final_res: PManifoldManifold;
    mesh: PManifoldMeshGL;
    n_verts, n_tris, n_props: longint;
    verts_data: PSingle;
    tris_data: Puint32_t;
    x, y, z: single;
    i: integer;
    a, b, c: Tuint32_t;
  begin
    m_size := manifold_manifold_size;

    cube_mem := GetMem(m_size);
    holeX_mem := GetMem(m_size);
    diff1_mem := GetMem(m_size);
    final_mem := GetMem(m_size);
    mesh_mem := GetMem(manifold_meshgl_size);

    cube := manifold_cube(cube_mem, 10.0, 10.0, 10.0, 1);
    hole := manifold_cube(holeX_mem, 20.0, 4.0, 4.0, 1);

    final_res := manifold_difference(diff1_mem, cube, hole);

    mesh := manifold_get_meshgl(mesh_mem, final_res);

    n_verts := manifold_meshgl_num_vert(mesh);
    n_tris := manifold_meshgl_num_tri(mesh);
    n_props := manifold_meshgl_num_prop(mesh);

    WriteLn('--- MANIFOLD CSG ERGEBNIS ---');
    WriteLn('n_verts: ', n_verts);
    WriteLn('n_tris: ', n_tris);
    WriteLn('n_props: ', n_props);

    verts_data := PSingle(GetMem(n_verts * n_props * sizeof(single)));
    tris_data := Puint32_t(GetMem(n_tris * 3 * sizeof(Tuint32_t)));

    manifold_meshgl_vert_properties(verts_data, mesh);
    manifold_meshgl_tri_verts(tris_data, mesh);

    WriteLn('--- MANIFOLD CSG ERGEBNIS ---');
    WriteLn('Objekt: Würfel mit 3 Achsen-Bohrungen (Menger Stufe 1)');
    WriteLn('Stats: %zu Vertices, %zu Dreiecke', n_verts, '  ', n_tris);

    WriteLn(#10'Liste aller Eckpunkte (Vertices):');
    for  i := 0 to n_verts - 1 do begin
      x := verts_data[i * n_props + 0];
      y := verts_data[i * n_props + 1];
      z := verts_data[i * n_props + 2];
      WriteLn(i: 3, '  ', x: 4: 2, ' / ', y: 4: 2, ' / ', z: 4: 2);
    end;

    WriteLn(#10'Liste aller Dreiecke (Indices):');
    for  i := 0 to n_tris - 1 do begin
      a := tris_data[i * 3 + 0];
      b := tris_data[i * 3 + 1];
      c := tris_data[i * 3 + 2];
      WriteLn(i: 3, '  ', a: 2, ' / ', b: 2, ' / ', c: 2);
    end;

    manifold_destruct_manifold(cube);
    manifold_destruct_manifold(hole);
    manifold_destruct_manifold(final_res);
    manifold_destruct_meshgl(mesh);

    Freemem(verts_data);
    Freemem(tris_data);
    Freemem(cube_mem);
    Freemem(holeX_mem);
    Freemem(diff1_mem);
    Freemem(final_mem);
    Freemem(mesh_mem);
  end;

begin
  main;
end.
