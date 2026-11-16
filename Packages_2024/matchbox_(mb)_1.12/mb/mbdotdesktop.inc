{$IFDEF read_interface}


type
  PMBDotDesktop = type Pointer;

  Pmbdotdesktopfolderentry = ^Tmbdotdesktopfolderentry;
  Tmbdotdesktopfolderentry = record
    name: PChar;
    icon: PChar;
    match: PChar;
    parent_entry: Pmbdotdesktopfolderentry;
    next_entry: Pmbdotdesktopfolderentry;
  end;

  Tmbdotdesktopfolders = record
    entries: Pmbdotdesktopfolderentry;
    n_entries: longint;
  end;
  Pmbdotdesktopfolders = ^Tmbdotdesktopfolders;

function mb_dotdesktop_new_from_file(filename: Pchar): PMBDotDesktop; cdecl; external libmb;
function mb_dotdesktop_get(dd: PMBDotDesktop; key: Pchar): pbyte; cdecl; external libmb;
function mb_dotdesktop_get_filename(dd: PMBDotDesktop): Pchar; cdecl; external libmb;
function mb_dotdesktop_get_exec(dd: PMBDotDesktop): Pchar; cdecl; external libmb;
procedure mb_dotdesktop_free(dd: PMBDotDesktop); cdecl; external libmb;
function mb_dot_desktop_icon_get_full_path(theme_name: Pchar; size_wanted: longint; icon_name: Pchar): Pchar; cdecl; external libmb;
function mb_dot_desktop_folders_new(vfolder_path: Pchar): PMBDotDesktopFolders; cdecl; external libmb;
procedure mb_dot_desktop_folders_free(folders: PMBDotDesktopFolders); cdecl; external libmb;

function mb_dot_desktop_folders_get_cnt(f: PMBDotDesktopFolders): longint; inline;
function mb_dot_desktop_folder_entry_get_name(e: PMBDotDesktopFolderEntry): PChar; inline;
function mb_dot_desktop_folder_entry_get_icon(e: PMBDotDesktopFolderEntry): PChar; inline;
function mb_dot_desktop_folder_entry_get_match(e: PMBDotDesktopFolderEntry): PChar; inline;

// === Konventiert am: 15-11-26 17:34:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function mb_dot_desktop_folders_get_cnt(f: PMBDotDesktopFolders): longint; inline;
begin
  if f <> nil then begin
    Result := f^.n_entries;
  end else begin
    Result := 0;
  end;
end;

function mb_dot_desktop_folder_entry_get_name(e: PMBDotDesktopFolderEntry): PChar; inline;
begin
  if e <> nil then begin
    Result := e^.name;
  end else begin
    Result := nil;
  end;
end;

function mb_dot_desktop_folder_entry_get_icon(e: PMBDotDesktopFolderEntry): PChar; inline;
begin
  if e <> nil then begin
    Result := e^.icon;
  end else begin
    Result := nil;
  end;
end;

function mb_dot_desktop_folder_entry_get_match(e: PMBDotDesktopFolderEntry): PChar; inline;
begin
  if e <> nil then begin
    Result := e^.match;
  end else begin
    Result := nil;
  end;
end;

{$ENDIF read_implementation}
