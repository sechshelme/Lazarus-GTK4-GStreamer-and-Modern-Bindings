unit libvirt_lxc;

interface

uses
  fp_virt, libvirt_domain, libvirt_host;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function virDomainLxcOpenNamespace(domain: TvirDomainPtr; fdlist: PPlongint; flags: dword): longint; cdecl; external libvirt;
function virDomainLxcEnterNamespace(domain: TvirDomainPtr; nfdlist: dword; fdlist: Plongint; noldfdlist: Pdword; oldfdlist: PPlongint;
  flags: dword): longint; cdecl; external libvirt;
function virDomainLxcEnterSecurityLabel(model: TvirSecurityModelPtr; _label: TvirSecurityLabelPtr; oldlabel: TvirSecurityLabelPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainLxcEnterCGroup(domain: TvirDomainPtr; flags: dword): longint; cdecl; external libvirt;

// === Konventiert am: 14-10-26 19:34:37 ===


implementation



end.
