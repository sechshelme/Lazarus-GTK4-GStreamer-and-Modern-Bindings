unit libvirt_qemu;

interface

uses
  fp_virt, libvirt_domain, libvirt_host, libvirt_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PvirDomainQemuMonitorCommandFlags = ^TvirDomainQemuMonitorCommandFlags;
  TvirDomainQemuMonitorCommandFlags = longint;
const
  VIR_DOMAIN_QEMU_MONITOR_COMMAND_DEFAULT = 0;
  VIR_DOMAIN_QEMU_MONITOR_COMMAND_HMP = 1 shl 0;

function virDomainQemuMonitorCommand(domain: TvirDomainPtr; cmd: pchar; result: PPchar; flags: dword): longint; cdecl; external libvirt;
function virDomainQemuMonitorCommandWithFiles(domain: TvirDomainPtr; cmd: pchar; ninfiles: dword; infiles: Plongint; noutfiles: Pdword;
  outfiles: PPlongint; result: PPchar; flags: dword): longint; cdecl; external libvirt;
function virDomainQemuAttach(domain: TvirConnectPtr; pid_value: dword; flags: dword): TvirDomainPtr; cdecl; external libvirt;

type
  PvirDomainQemuAgentCommandTimeoutValues = ^TvirDomainQemuAgentCommandTimeoutValues;
  TvirDomainQemuAgentCommandTimeoutValues = longint;
const
  VIR_DOMAIN_QEMU_AGENT_COMMAND_MIN = VIR_DOMAIN_AGENT_RESPONSE_TIMEOUT_BLOCK;
  VIR_DOMAIN_QEMU_AGENT_COMMAND_BLOCK = VIR_DOMAIN_AGENT_RESPONSE_TIMEOUT_BLOCK;
  VIR_DOMAIN_QEMU_AGENT_COMMAND_DEFAULT = VIR_DOMAIN_AGENT_RESPONSE_TIMEOUT_DEFAULT;
  VIR_DOMAIN_QEMU_AGENT_COMMAND_NOWAIT = VIR_DOMAIN_AGENT_RESPONSE_TIMEOUT_NOWAIT;
  VIR_DOMAIN_QEMU_AGENT_COMMAND_SHUTDOWN = 60;

function virDomainQemuAgentCommand(domain: TvirDomainPtr; cmd: pchar; timeout: longint; flags: dword): pchar; cdecl; external libvirt;

type
  TvirConnectDomainQemuMonitorEventCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; event: pchar; seconds: int64; micros: dword; details: pchar; opaque: pointer); cdecl;

type
  PvirConnectDomainQemuMonitorEventRegisterFlags = ^TvirConnectDomainQemuMonitorEventRegisterFlags;
  TvirConnectDomainQemuMonitorEventRegisterFlags = longint;
const
  VIR_CONNECT_DOMAIN_QEMU_MONITOR_EVENT_REGISTER_REGEX = 1 shl 0;
  VIR_CONNECT_DOMAIN_QEMU_MONITOR_EVENT_REGISTER_NOCASE = 1 shl 1;

function virConnectDomainQemuMonitorEventRegister(conn: TvirConnectPtr; dom: TvirDomainPtr; event: pchar; cb: TvirConnectDomainQemuMonitorEventCallback; opaque: pointer;
  freecb: TvirFreeCallback; flags: dword): longint; cdecl; external libvirt;
function virConnectDomainQemuMonitorEventDeregister(conn: TvirConnectPtr; callbackID: longint): longint; cdecl; external libvirt;

// === Konventiert am: 14-10-26 19:34:28 ===


implementation



end.
