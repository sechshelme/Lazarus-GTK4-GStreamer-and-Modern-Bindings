unit fp_gdal;

interface

const
  {$IFDEF Linux}
  libgdal = 'gdal';
  {$ENDIF}

  {$IFDEF Windows}
  libgdal = 'gdal.dll';
  {$ENDIF}

  type
  Tint64_t=Int64;

  Tsize_t=SizeUInt;
  Psize_t=^Tsize_t;

  PFILE=type Pointer;
  Ptime_t=type Pointer;
  Ptm=type Pointer;

  Pwchar_t=type Pointer;
  Tva_list=type Pointer; // ????

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  PVSIVirtualHandle =type Pointer; // von C++

  {$DEFINE read_interface}
  //{$include fp_gdal_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_gdal_includes.inc}
{$UNDEF read_implementation}

end.

