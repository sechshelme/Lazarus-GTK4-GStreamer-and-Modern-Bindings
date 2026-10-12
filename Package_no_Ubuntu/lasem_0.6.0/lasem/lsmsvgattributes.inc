{$IFDEF read_interface}


type
  TLsmSvgBlendingModeAttribute = record
    base: TLsmAttribute;
    value: TLsmSvgBlendingMode;
  end;
  PLsmSvgBlendingModeAttribute = ^TLsmSvgBlendingModeAttribute;

  TLsmSvgBooleanAttribute = record
    base: TLsmAttribute;
    value: Tgboolean;
  end;
  PLsmSvgBooleanAttribute = ^TLsmSvgBooleanAttribute;

  TLsmSvgIntegerAttribute = record
    base: TLsmAttribute;
    value: longint;
  end;
  PLsmSvgIntegerAttribute = ^TLsmSvgIntegerAttribute;

  TLsmSvgDoubleAttribute = record
    base: TLsmAttribute;
    value: double;
  end;
  PLsmSvgDoubleAttribute = ^TLsmSvgDoubleAttribute;

  TLsmSvgOneOrTwoDoubleAttribute = record
    base: TLsmAttribute;
    value: TLsmSvgOneOrTwoDouble;
  end;
  PLsmSvgOneOrTwoDoubleAttribute = ^TLsmSvgOneOrTwoDoubleAttribute;

  TLsmSvgVectorAttribute = record
    base: TLsmAttribute;
    value: TLsmSvgVector;
  end;
  PLsmSvgVectorAttribute = ^TLsmSvgVectorAttribute;

  TLsmSvgDashArrayAttribute = record
    base: TLsmAttribute;
    value: PLsmSvgDashArray;
  end;
  PLsmSvgDashArrayAttribute = ^TLsmSvgDashArrayAttribute;

  TLsmSvgLengthAttribute = record
    base: TLsmAttribute;
    length: TLsmSvgLength;
  end;
  PLsmSvgLengthAttribute = ^TLsmSvgLengthAttribute;

  TLsmSvgLengthListAttribute = record
    base: TLsmAttribute;
    list: TLsmSvgLengthList;
  end;
  PLsmSvgLengthListAttribute = ^TLsmSvgLengthListAttribute;

  TLsmSvgPaintAttribute = record
    base: TLsmAttribute;
    paint: TLsmSvgPaint;
  end;
  PLsmSvgPaintAttribute = ^TLsmSvgPaintAttribute;

  TLsmSvgStringAttribute = record
    base: TLsmAttribute;
    value: pchar;
  end;
  PLsmSvgStringAttribute = ^TLsmSvgStringAttribute;

  TLsmSvgColorAttribute = record
    base: TLsmAttribute;
    value: TLsmSvgColor;
  end;
  PLsmSvgColorAttribute = ^TLsmSvgColorAttribute;

  TLsmSvgViewboxAttribute = record
    base: TLsmAttribute;
    value: TLsmBox;
  end;
  PLsmSvgViewboxAttribute = ^TLsmSvgViewboxAttribute;

  TLsmSvgTransformAttribute = record
    base: TLsmAttribute;
    matrix: TLsmSvgMatrix;
  end;
  PLsmSvgTransformAttribute = ^TLsmSvgTransformAttribute;

  TLsmSvgPreserveAspectRatioAttribute = record
    base: TLsmAttribute;
    value: TLsmSvgPreserveAspectRatio;
  end;
  PLsmSvgPreserveAspectRatioAttribute = ^TLsmSvgPreserveAspectRatioAttribute;

  TLsmSvgSpreadMethodAtttribute = record
    base: TLsmAttribute;
    value: TLsmSvgSpreadMethod;
  end;
  PLsmSvgSpreadMethodAtttribute = ^TLsmSvgSpreadMethodAtttribute;

  TLsmSvgPatternUnitsAttribute = record
    base: TLsmAttribute;
    value: TLsmSvgPatternUnits;
  end;
  PLsmSvgPatternUnitsAttribute = ^TLsmSvgPatternUnitsAttribute;

  TLsmSvgMarkerUnitsAttribute = record
    base: TLsmAttribute;
    value: TLsmSvgMarkerUnits;
  end;
  PLsmSvgMarkerUnitsAttribute = ^TLsmSvgMarkerUnitsAttribute;

  TLsmSvgColorFilterTypeAttribute = record
    base: TLsmAttribute;
    value: TLsmSvgColorFilterType;
  end;
  PLsmSvgColorFilterTypeAttribute = ^TLsmSvgColorFilterTypeAttribute;

  TLsmSvgAngleAttribute = record
    base: TLsmAttribute;
    value: TLsmSvgAngle;
  end;
  PLsmSvgAngleAttribute = ^TLsmSvgAngleAttribute;

  TLsmSvgMorphologyOperatorAttribute = record
    base: TLsmAttribute;
    value: TLsmSvgMorphologyOperator;
  end;
  PLsmSvgMorphologyOperatorAttribute = ^TLsmSvgMorphologyOperatorAttribute;

  TLsmSvgEdgeModeAttribute = record
    base: TLsmAttribute;
    value: TLsmSvgEdgeMode;
  end;
  PLsmSvgEdgeModeAttribute = ^TLsmSvgEdgeModeAttribute;

  TLsmSvgOneOrTwoIntegerAttribute = record
    base: TLsmAttribute;
    value: TLsmSvgOneOrTwoInteger;
  end;
  PLsmSvgOneOrTwoIntegerAttribute = ^TLsmSvgOneOrTwoIntegerAttribute;

  TLsmSvgStitchTilesAttribute = record
    base: TLsmAttribute;
    value: TLsmSvgStitchTiles;
  end;
  PLsmSvgStitchTilesAttribute = ^TLsmSvgStitchTilesAttribute;

  TLsmSvgTurbulenceTypeAttribute = record
    base: TLsmAttribute;
    value: TLsmSvgTurbulenceType;
  end;
  PLsmSvgTurbulenceTypeAttribute = ^TLsmSvgTurbulenceTypeAttribute;

  TLsmSvgChannelSelectorAttribute = record
    base: TLsmAttribute;
    value: TLsmSvgChannelSelector;
  end;
  PLsmSvgChannelSelectorAttribute = ^TLsmSvgChannelSelectorAttribute;

  // === Konventiert am: 3-3-26 15:56:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
