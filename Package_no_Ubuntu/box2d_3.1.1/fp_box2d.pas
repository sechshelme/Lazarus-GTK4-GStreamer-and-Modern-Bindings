unit fp_box2d;

{$modeswitch typehelpers}

interface

const
  {$IFDEF Linux}
  libbox2d = 'box2d';
  {$ENDIF}

  {$IFDEF Windows}
  libbox2d = 'libbox2d.dll'; // ?????

  {$ENDIF}

const
  UINT64_MAX = MaxInt;

type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;

  Tbool = Boolean8;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  Pb2TreeNode = type Pointer;

  {$DEFINE read_interface}
  {$include box2d/base.inc}
  {$include box2d/math_functions.inc}
  {$include box2d/id.inc}
  {$include box2d/collision.inc}
  {$include box2d/types.inc}
  {$include box2d/box2d.inc}
  {$UNDEF read_interface}

type
  Tb2Vec2Helper = type helper for Tb2Vec2
    procedure SetItems(x, y: single);
  end;

  { Tb2RotHelper }

  Tb2RotHelper = type helper for Tb2Rot
    procedure SetItems(c, s: single);
  end;

  Tb2CircleHelper = type helper for Tb2Circle
    procedure SetItems(center: Tb2Vec2; radius: single);
    procedure SetItems(cx, cy, radius: single);
  end;



implementation

{$DEFINE read_implementation}
{$include box2d/base.inc}
{$include box2d/math_functions.inc}
{$include box2d/id.inc}
{$include box2d/collision.inc}
{$include box2d/types.inc}
{$include box2d/box2d.inc}
{$UNDEF read_implementation}

procedure Tb2Vec2Helper.SetItems(x, y: single);
begin
  Self.x := x;
  Self.y := y;
end;

procedure Tb2RotHelper.SetItems(c, s: single);
begin
  Self.c := c;
  Self.s := s;
end;

procedure Tb2CircleHelper.SetItems(center: Tb2Vec2; radius: single);
begin
  Self.center := center;
  Self.radius := radius;
end;

procedure Tb2CircleHelper.SetItems(cx, cy, radius: single);
begin
  Self.center.x := cx;
  Self.center.y := cy;
  Self.radius := radius;
end;

end.
