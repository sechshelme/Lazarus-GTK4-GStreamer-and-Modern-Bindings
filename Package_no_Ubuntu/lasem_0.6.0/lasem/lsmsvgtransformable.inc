{$IFDEF read_interface}


type
  //TLsmSvgTransformable = record
  //    element : TLsmSvgElement;
  //    transform : TLsmSvgTransformAttribute;
  //  end;
  PLsmSvgTransformable = type Pointer;

  TLsmSvgTransformableClass = record
      parent_class : TLsmSvgElementClass;
    end;
  PLsmSvgTransformableClass = ^TLsmSvgTransformableClass;


function lsm_svg_transformable_get_type:TGType;cdecl;external liblasem;

// === Konventiert am: 3-3-26 17:11:59 ===

function LSM_TYPE_SVG_TRANSFORMABLE : TGType;
function LSM_SVG_TRANSFORMABLE(obj : Pointer) : PLsmSvgTransformable;
function LSM_SVG_TRANSFORMABLE_CLASS(klass : Pointer) : PLsmSvgTransformableClass;
function LSM_IS_SVG_TRANSFORMABLE(obj : Pointer) : Tgboolean;
function LSM_IS_SVG_TRANSFORMABLE_CLASS(klass : Pointer) : Tgboolean;
function LSM_SVG_TRANSFORMABLE_GET_CLASS(obj : Pointer) : PLsmSvgTransformableClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function LSM_TYPE_SVG_TRANSFORMABLE : TGType;
  begin
    LSM_TYPE_SVG_TRANSFORMABLE:=lsm_svg_transformable_get_type;
  end;

function LSM_SVG_TRANSFORMABLE(obj : Pointer) : PLsmSvgTransformable;
begin
  Result := PLsmSvgTransformable(g_type_check_instance_cast(obj, LSM_TYPE_SVG_TRANSFORMABLE));
end;

function LSM_SVG_TRANSFORMABLE_CLASS(klass : Pointer) : PLsmSvgTransformableClass;
begin
  Result := PLsmSvgTransformableClass(g_type_check_class_cast(klass, LSM_TYPE_SVG_TRANSFORMABLE));
end;

function LSM_IS_SVG_TRANSFORMABLE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_SVG_TRANSFORMABLE);
end;

function LSM_IS_SVG_TRANSFORMABLE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_SVG_TRANSFORMABLE);
end;

function LSM_SVG_TRANSFORMABLE_GET_CLASS(obj : Pointer) : PLsmSvgTransformableClass;
begin
  Result := PLsmSvgTransformableClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
