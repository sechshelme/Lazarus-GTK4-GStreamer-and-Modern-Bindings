unit mbconfig;

interface

uses
  fp_mb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _MB_HAVE_MB_CONFIG}
{$define _MB_HAVE_MB_CONFIG}
{ 
 *
 *
 *
  }
{$if 1}
{$define MB_HAVE_PNG}
{$endif}
{$if 1}
{$define MB_HAVE_JPEG}
{$endif}
{$if 0}
{$define MB_HAVE_XFT}
{$endif}
{$if 1}
{$define MB_HAVE_PANGO}
{$endif}
{ was #define dname(params) para_def_expr }
{ return type might be wrong }   

function mb_supports_png : longint;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function mb_supports_jpeg : longint;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function mb_supports_xft : longint;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function mb_supports_pango : longint;

{$ifdef MB_HAVE_PNG}
{$ifndef USE_PNG  		/* config.h redefines  */}
{$define USE_PNG}
{$endif}
{$endif}
{$ifdef MB_HAVE_JPEG}
{$ifndef USE_JPG }
{$define USE_JPG}
{$endif}
{$endif}
{$ifdef MB_HAVE_XFT}
{$ifndef USE_XFT  }
{$define USE_XFT}
{$endif}
{$endif}
{$ifdef MB_HAVE_PANGO}
{$ifndef USE_PANGO  }
{$define USE_PANGO}
{$endif}
{$endif}
{$endif}

// === Konventiert am: 15-11-26 17:35:02 ===


implementation


{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function mb_supports_png : longint;
begin
  mb_supports_png:=1;
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function mb_supports_jpeg : longint;
begin
  mb_supports_jpeg:=1;
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function mb_supports_xft : longint;
begin
  mb_supports_xft:=0;
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function mb_supports_pango : longint;
begin
  mb_supports_pango:=1;
end;


end.
