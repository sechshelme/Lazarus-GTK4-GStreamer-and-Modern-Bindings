{$IFDEF read_interface}


const
  LSM_DOM_VIEW_DEFAULT_RESOLUTION = 72.0;
  LSM_DOM_VIEW_DEFAULT_VIEWBOX_WIDTH = 320.0;
  LSM_DOM_VIEW_DEFAULT_VIEWBOX_HEIGHT = 200.0;

type
  TLsmDomView = record
    obj: TGObject;
    document: PLsmDomDocument;
    font_description: PPangoFontDescription;
    pango_layout: PPangoLayout;
    measure_pango_layout: PPangoLayout;
    cairo: Pcairo_t;
    is_vector: Tgboolean;
    resolution_ppi: double;
    viewport_pt: TLsmBox;
  end;
  PLsmDomView = ^TLsmDomView;

  TLsmDomViewClass = record
    parent_class: TGObjectClass;
    document_type: TGType;
    measure: procedure(view: PLsmDomView; width: Pdouble; height: Pdouble; baseline: Pdouble); cdecl;
    render: procedure(view: PLsmDomView); cdecl;
    set_debug: procedure(view: PLsmDomView; feature: pchar; enable: Tgboolean); cdecl;
  end;
  PLsmDomViewClass = ^TLsmDomViewClass;

function lsm_dom_view_get_type: TGType; cdecl; external liblasem;
function lsm_dom_view_get_resolution(self: PLsmDomView): double; cdecl; external liblasem;
procedure lsm_dom_view_set_resolution(self: PLsmDomView; ppi: double); cdecl; external liblasem;
procedure lsm_dom_view_set_viewport(self: PLsmDomView; viewport_pt: PLsmBox); cdecl; external liblasem;
procedure lsm_dom_view_set_viewport_pixels(self: PLsmDomView; viewport: PLsmBox); cdecl; external liblasem;
function lsm_dom_view_get_viewport(self: PLsmDomView): TLsmBox; cdecl; external liblasem;
function lsm_dom_view_get_viewport_pixels(self: PLsmDomView): TLsmBox; cdecl; external liblasem;
procedure lsm_dom_view_render(view: PLsmDomView; cairo: Pcairo_t; x: double; y: double); cdecl; external liblasem;
procedure lsm_dom_view_get_size(view: PLsmDomView; width: Pdouble; height: Pdouble; baseline: Pdouble); cdecl; external liblasem;
procedure lsm_dom_view_get_size_pixels(view: PLsmDomView; width: Pdword; height: Pdword; baseline: Pdword); cdecl; external liblasem;
procedure lsm_dom_view_set_debug(view: PLsmDomView; feature: pchar; enable: Tgboolean); cdecl; external liblasem;
procedure lsm_dom_view_set_document(view: PLsmDomView; document: PLsmDomDocument); cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:38:48 ===

function LSM_TYPE_DOM_VIEW: TGType;
function LSM_DOM_VIEW(obj: Pointer): PLsmDomView;
function LSM_DOM_VIEW_CLASS(klass: Pointer): PLsmDomViewClass;
function LSM_IS_DOM_VIEW(obj: Pointer): Tgboolean;
function LSM_IS_DOM_VIEW_CLASS(klass: Pointer): Tgboolean;
function LSM_DOM_VIEW_GET_CLASS(obj: Pointer): PLsmDomViewClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_DOM_VIEW: TGType;
begin
  LSM_TYPE_DOM_VIEW := lsm_dom_view_get_type;
end;

function LSM_DOM_VIEW(obj: Pointer): PLsmDomView;
begin
  Result := PLsmDomView(g_type_check_instance_cast(obj, LSM_TYPE_DOM_VIEW));
end;

function LSM_DOM_VIEW_CLASS(klass: Pointer): PLsmDomViewClass;
begin
  Result := PLsmDomViewClass(g_type_check_class_cast(klass, LSM_TYPE_DOM_VIEW));
end;

function LSM_IS_DOM_VIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, LSM_TYPE_DOM_VIEW);
end;

function LSM_IS_DOM_VIEW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, LSM_TYPE_DOM_VIEW);
end;

function LSM_DOM_VIEW_GET_CLASS(obj: Pointer): PLsmDomViewClass;
begin
  Result := PLsmDomViewClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
