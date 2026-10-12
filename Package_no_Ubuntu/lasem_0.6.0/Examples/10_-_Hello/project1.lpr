program project1;

uses
  fp_lasem,
  fp_GLIBTools,
  fp_cairo,
  fp_glib2;

  procedure CreateView1(x, y: integer; cr: Pcairo_t);
  const
    itex_formel =
      '<p>$$' +
      '\begin{bmatrix} 1 & 2 \\ 3 & 4 \\ 5 & 6 \end{bmatrix} \cdot ' +
      '\begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix} \cdot ' +
      '\begin{bmatrix} 2 \\ 3 \end{bmatrix} = ' +
      '\begin{bmatrix} 8 \\ 18 \\ 28 \end{bmatrix} ' +
      '$$</p>';
  var
    err: PGError = nil;
    doc: PLsmDomDocument;
    view: PLsmDomView;
    width, height: double;
    md: PLsmMathmlDocument;
  begin
    md := lsm_mathml_document_new_from_itex(itex_formel, -1, @err);
    doc := LSM_DOM_DOCUMENT(md);
    if err <> nil then begin
      g_printf('Fehler beim Parsen: %s'#10, err^.message);
      g_error_free(err);
      Exit;
    end;

    if doc = nil then begin
      g_printf('Fehler: Dokument konnte nicht erstellt werden.'#10);
      Exit;
    end;

    view := lsm_dom_document_create_view(doc);
    lsm_dom_view_set_resolution(view, 150);
    lsm_dom_view_get_size(view, @width, @height, nil);
    lsm_dom_view_render(view, cr, x, y);

    g_object_unref(view);
    g_object_unref(doc);
  end;

  procedure CreateView2(x, y: integer; cr: Pcairo_t);
  const
    itex_formel =
      '<p>$$ \boxed{ |\vec{v}| = \sqrt[2]{x^2 + y^2 + z^2}} $$</p>';
  var
    err: PGError = nil;
    doc: PLsmDomDocument;
    view: PLsmDomView;
    width, height: double;
  begin
    doc := LSM_DOM_DOCUMENT(lsm_mathml_document_new_from_itex(itex_formel, -1, @err));
    if err <> nil then begin
      g_printf('Fehler beim Parsen: %s'#10, err^.message);
      g_error_free(err);
      Exit;
    end;

    if doc = nil then begin
      g_printf('Fehler: Dokument konnte nicht erstellt werden.'#10);
      Exit;
    end;

    view := lsm_dom_document_create_view(doc);
    lsm_dom_view_set_resolution(view, 150);
    lsm_dom_view_get_size(view, @width, @height, nil);
    lsm_dom_view_render(view, cr, x, y);

    g_object_unref(view);
    g_object_unref(doc);
  end;

  procedure CreateView3(x, y: integer; cr: Pcairo_t);
  const
    mathml =
      '<math>' +
      '  <mstyle mathcolor="green">' +
      '    <msqrt>' +
      '      <mi>x</mi>' +
      '      <mo>+</mo>' +
      '      <mn>1</mn>' +
      '    </msqrt>' +
      '  </mstyle>' +
      '</math>';
  var
    err: PGError = nil;
    doc: PLsmDomDocument;
    view: PLsmDomView;
    width, height: double;
  begin
    doc := lsm_dom_document_new_from_memory(mathml, -1, @err);
    if err <> nil then begin
      g_printf('Fehler beim Parsen: %s'#10, err^.message);
      g_error_free(err);
      Exit;
    end;

    if doc = nil then begin
      g_printf('Fehler: Dokument konnte nicht erstellt werden.'#10);
      Exit;
    end;

    view := lsm_dom_document_create_view(doc);
    lsm_dom_view_set_resolution(view, 250);
    lsm_dom_view_get_size(view, @width, @height, nil);
    lsm_dom_view_render(view, cr, x, y);

    g_object_unref(view);
    g_object_unref(doc);
  end;

  procedure CreateView4(x, y: integer; cr: Pcairo_t);
  const
    svg_data =
      '<svg width="200" height="200">' +
      '  <rect x="10" y="10" width="50" height="50" fill="blue" />' +
      '  <circle cx="100" cy="100" r="40" fill="red" />' +
      '</svg>';
  var
    err: PGError = nil;
    doc: PLsmDomDocument;
    view: PLsmDomView;
  begin
    doc := lsm_dom_document_new_from_memory(svg_data, -1, nil);
    if err <> nil then begin
      g_printf('Fehler beim Parsen: %s'#10, err^.message);
      g_error_free(err);
      Exit;
    end;

    if doc = nil then begin
      g_printf('Fehler: Dokument konnte nicht erstellt werden.'#10);
      Exit;
    end;

    view := lsm_dom_document_create_view(doc);
    lsm_dom_view_render(view, cr, x, y);

    g_object_unref(view);
    g_object_unref(doc);
  end;

  procedure CreateView5(x, y: integer; cr: Pcairo_t);
  var
    doc: PLsmDomDocument;
    view: PLsmDomView;
    root, mstyle, mroot_el, mrow, mi, mo, mn, mindex: PLsmDomElement;
  begin
    doc := lsm_dom_document_new_from_memory('<math></math>', -1, nil);
    root := PLsmDomElement(lsm_dom_document_get_document_element(doc));

    mstyle := lsm_dom_document_create_element(doc, 'mstyle');
    mroot_el := lsm_dom_document_create_element(doc, 'mroot');
    mrow := lsm_dom_document_create_element(doc, 'mrow');
    mindex := lsm_dom_document_create_element(doc, 'mn');

    mi := lsm_dom_document_create_element(doc, 'mi');
    mo := lsm_dom_document_create_element(doc, 'mo');
    mn := lsm_dom_document_create_element(doc, 'mn');

    lsm_dom_element_set_attribute(mstyle, 'mathcolor', 'blue');

    lsm_dom_node_append_child(LSM_DOM_NODE(mindex), LSM_DOM_NODE(lsm_dom_document_create_text_node(doc, '13')));
    lsm_dom_node_append_child(LSM_DOM_NODE(mi), LSM_DOM_NODE(lsm_dom_document_create_text_node(doc, 'x')));
    lsm_dom_node_append_child(LSM_DOM_NODE(mo), LSM_DOM_NODE(lsm_dom_document_create_text_node(doc, '·')));
    lsm_dom_node_append_child(LSM_DOM_NODE(mn), LSM_DOM_NODE(lsm_dom_document_create_text_node(doc, '77')));

    lsm_dom_node_append_child(LSM_DOM_NODE(root), LSM_DOM_NODE(mstyle));
    lsm_dom_node_append_child(LSM_DOM_NODE(mstyle), LSM_DOM_NODE(mroot_el));

    lsm_dom_node_append_child(LSM_DOM_NODE(mroot_el), LSM_DOM_NODE(mrow));
    lsm_dom_node_append_child(LSM_DOM_NODE(mrow), LSM_DOM_NODE(mi));
    lsm_dom_node_append_child(LSM_DOM_NODE(mrow), LSM_DOM_NODE(mo));
    lsm_dom_node_append_child(LSM_DOM_NODE(mrow), LSM_DOM_NODE(mn));

    lsm_dom_node_append_child(LSM_DOM_NODE(mroot_el), LSM_DOM_NODE(mindex));

    view := lsm_dom_document_create_view(doc);
    lsm_dom_view_set_resolution(view, 250.0);
    lsm_dom_view_render(view, cr, x, y);

    g_object_unref(view);
    g_object_unref(doc);
  end;

  procedure main;
  const
    filename = '/tmp/test.png';
  var
    surface: Pcairo_surface_t;
    cr: Pcairo_t;
  begin
    surface := cairo_image_surface_create(CAIRO_FORMAT_ARGB32, 640, 480);
    cr := cairo_create(surface);

    cairo_set_source_rgb(cr, 1, 1, 1);
    cairo_paint(cr);

    cairo_set_source_rgb(cr, 0, 0, 0);

    CreateView1(10, 10, cr);
    CreateView2(10, 130, cr);
    CreateView3(10, 250, cr);
    CreateView4(250, 250, cr);
    CreateView5(10, 370, cr);

    cairo_surface_write_to_png(surface, filename);

    cairo_destroy(cr);
    cairo_surface_destroy(surface);
  end;

begin
  main;
end.
