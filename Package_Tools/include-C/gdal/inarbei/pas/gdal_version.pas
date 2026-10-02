unit gdal_version;

interface

uses
  fp_gdal;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This is a generated file from gdal_version.h.in. DO NOT MODIFY !!!!  }
{ $Id$  }
{ --------------------------------------------------------------------  }
{      GDAL Version Information.                                        }
{ --------------------------------------------------------------------  }
{$ifndef GDAL_VERSION_MAJOR}

const
  GDAL_VERSION_MAJOR = 3;  
  GDAL_VERSION_MINOR = 8;  
  GDAL_VERSION_REV = 4;  
  GDAL_VERSION_BUILD = 0;  
{$endif}
{ GDAL_COMPUTE_VERSION macro introduced in GDAL 1.10  }
{ Must be used ONLY to compare with version numbers for GDAL >= 1.10  }
{$ifndef GDAL_COMPUTE_VERSION}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GDAL_COMPUTE_VERSION(maj,min,rev : longint) : longint;

{$endif}
{ Note: the formula to compute GDAL_VERSION_NUM has changed in GDAL 1.10  }
{$ifndef GDAL_VERSION_NUM}

{ was #define dname def_expr }
function GDAL_VERSION_NUM : longint; { return type might be wrong }

{$endif}
{$if !defined(DO_NOT_DEFINE_GDAL_DATE_NAME)}
{$ifndef GDAL_RELEASE_DATE}

const
  GDAL_RELEASE_DATE = 20240208;  
{$endif}
{$ifndef GDAL_RELEASE_NAME}

const
  GDAL_RELEASE_NAME = '3.8.4';  
{$endif}
{$endif}

// === Konventiert am: 2-10-26 16:42:01 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDAL_COMPUTE_VERSION(maj,min,rev : longint) : longint;
begin
  GDAL_COMPUTE_VERSION:=((maj*1000000)+(min*10000))+(rev*100);
end;

{ was #define dname def_expr }
function GDAL_VERSION_NUM : longint; { return type might be wrong }
  begin
    GDAL_VERSION_NUM:=(GDAL_COMPUTE_VERSION(GDAL_VERSION_MAJOR,GDAL_VERSION_MINOR,GDAL_VERSION_REV))+GDAL_VERSION_BUILD;
  end;


end.
