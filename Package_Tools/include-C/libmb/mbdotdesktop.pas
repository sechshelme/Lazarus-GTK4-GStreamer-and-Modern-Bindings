unit mbdotdesktop;

interface

uses
  fp_mb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _MBDOTDESKTOP_H_}
{$define _MBDOTDESKTOP_H_}
{$include <stdio.h>}
{$include <stdlib.h>}
{$include <string.h>}
{$include <unistd.h>}
{$include <locale.h>}
{$include <ctype.h>}
{$include <sys/types.h>}
{$include <sys/stat.h>}
{$include <dirent.h>}
{$include <libmb/mbconfig.h>}
{$include <libmb/mbutil.h>}
{ C++ extern C conditionnal removed }
{*
 * @defgroup freedesktop Freedesktop Standards utilitys
 * @brief Micro implementations of Freedesktop.org standards for .desktop files, icon themeing and vfolders. 
 *
 * @
  }
{*
 * @typedef MBDotDesktop
 *
 * Opaque type used for representing a parsed .desktop file
  }type

  Pmbdotdesktopfolderentry = ^Tmbdotdesktopfolderentry;
  Tmbdotdesktopfolderentry = record
      name : Pbyte;
      icon : Pbyte;
      match : Pbyte;
      parent_entry : Pmbdotdesktopfolderentry;
      next_entry : Pmbdotdesktopfolderentry;
    end;

  Pmbdotdesktopfolders = ^Tmbdotdesktopfolders;
  Tmbdotdesktopfolders = record
      entries : Pmbdotdesktopfolderentry;
      n_entries : longint;
    end;
{*
 * Parses a .desktop file and creates a localised #MBDotDesktop instance.
 *
 * @param filename full path to .desktop file
 * @returns #MBDotDesktop instance, NULL on fail
  }

function mb_dotdesktop_new_from_file(filename:Pchar):PMBDotDesktop;cdecl;external libmb;
{*
 * Gets the localised value for a specified key in #MBDotDesktop instance
 *
 * @param dd #MBDotDesktop instance
 * @param key requested key.
 * @returns values, NULL on fail
  }
function mb_dotdesktop_get(dd:PMBDotDesktop; key:Pchar):Pbyte;cdecl;external libmb;
{*
  * Gets the filename from #MBDotDesktop instance
  *
  * @param dd #MBDotDesktop instance
  * @returns filename of #MBDotDesktop, NULL on fail
   }
function mb_dotdesktop_get_filename(dd:PMBDotDesktop):Pchar;cdecl;external libmb;
{*
 * Get the Exec key from a #MBDotDesktop instance, with the %-escapes expanded.
 * Unlike mb_dotdesktop_get(), this string needs to be free()d.
 *
 * @param dd #MBDotDesktop instance
 * @returns file name, NULL on fail
  }
function mb_dotdesktop_get_exec(dd:PMBDotDesktop):Pchar;cdecl;external libmb;
{*
 * Free's a #MBDotDesktop instance
 *
 * @param dd #MBDotDesktop instance
  }
procedure mb_dotdesktop_free(dd:PMBDotDesktop);cdecl;external libmb;
{*
 * Gets the full path for an specified icon.  The function allocates memory
 * for the returned data, this should be freed by the caller.
 *
 * @param theme_name name of theme to get the icon for
 * @param size_wanted icon dimention wanted in pixels 
 * @param icon_name   the filename
 * @returns the full path to the found icon, or NULL on fail. 
  }
function mb_dot_desktop_icon_get_full_path(theme_name:Pchar; size_wanted:longint; icon_name:Pchar):Pchar;cdecl;external libmb;
{*
 * Parses a 'vfolder style' directory of .directory entrys used for
 * building simple hireachies of .desktop files. 
 * 
 * Expect a directory containing a root.order file, which lists 
 * a .directory file per line. Each of these entry in then parsed 
 * in the specified order as a #MBDotDesktopFolderEntry instance. 
 *
 * @param vfolder_path path to .directory files
 * @returns A dotdesktopfolders object instance
  }
function mb_dot_desktop_folders_new(vfolder_path:Pchar):PMBDotDesktopFolders;cdecl;external libmb;
{*
 * Frees a dotdesktopfolders instance
 *
 * @param folders dotdesktopfolders instance
  }
procedure mb_dot_desktop_folders_free(folders:PMBDotDesktopFolders);cdecl;external libmb;
{*
 * @def mb_dot_desktop_folders_get_cnt
 * Gets a count of .directory entrys ( folders ) in an #MBDotDesktopFolder .
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_dot_desktop_folders_get_cnt(f : longint) : longint;

{* xxxxxxxxx
#define mb_dot_desktop_folders_enumerate(ddfolders, ddentry) \
     for ( (ddentry) = (ddfolders)->entries;                 \
	   (ddentry) != NULL;                                \
	   (ddentry) = (ddentry)->next_entry )               \
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_dot_desktop_folder_entry_get_name(f : longint) : longint;

{*
 * @def mb_dot_desktop_folder_entry_get_icon
 * Gets the icon filename ( not path ) of a #MBDotDesktopFolderEntry
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_dot_desktop_folder_entry_get_icon(f : longint) : longint;

{*
 * @def mb_dot_desktop_folder_entry_get_match
 * Gets the categorie match string of a #MBDotDesktopFolderEntry
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_dot_desktop_folder_entry_get_match(f : longint) : longint;

{ C++ end of extern C conditionnal removed }
{* @  }
{$endif}

// === Konventiert am: 15-11-26 17:34:59 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_dot_desktop_folders_get_cnt(f : longint) : longint;
begin
  mb_dot_desktop_folders_get_cnt:=f^.n_entries;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_dot_desktop_folder_entry_get_name(f : longint) : longint;
begin
  mb_dot_desktop_folder_entry_get_name:=f^.name;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_dot_desktop_folder_entry_get_icon(f : longint) : longint;
begin
  mb_dot_desktop_folder_entry_get_icon:=f^.icon;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mb_dot_desktop_folder_entry_get_match(f : longint) : longint;
begin
  mb_dot_desktop_folder_entry_get_match:=f^.match;
end;


end.
