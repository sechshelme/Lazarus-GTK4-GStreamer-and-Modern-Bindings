{$IFDEF read_interface}


type
  PvirConnectPtr = ^TvirConnectPtr;
  TvirConnectPtr = type Pointer;

type
  PvirNodeSuspendTarget = ^TvirNodeSuspendTarget;
  TvirNodeSuspendTarget = longint;
const
  VIR_NODE_SUSPEND_TARGET_MEM = 0;
  VIR_NODE_SUSPEND_TARGET_DISK = 1;
  VIR_NODE_SUSPEND_TARGET_HYBRID = 2;
  VIR_NODE_SUSPEND_TARGET_LAST = 3;

type
  PvirStreamPtr = ^TvirStreamPtr;
  TvirStreamPtr = type Pointer;

const
  VIR_SECURITY_LABEL_BUFLEN = 4096 + 1;

type
  PvirSecurityLabel = ^TvirSecurityLabel;
  TvirSecurityLabel = record
    _label: array[0..(VIR_SECURITY_LABEL_BUFLEN) - 1] of char;
    enforcing: longint;
  end;
  PvirSecurityLabelPtr = ^TvirSecurityLabelPtr;
  TvirSecurityLabelPtr = PvirSecurityLabel;

const
  VIR_SECURITY_MODEL_BUFLEN = 256 + 1;
  VIR_SECURITY_DOI_BUFLEN = 256 + 1;

type
  PvirSecurityModel = ^TvirSecurityModel;
  TvirSecurityModel = record
    model: array[0..(VIR_SECURITY_MODEL_BUFLEN) - 1] of char;
    doi: array[0..(VIR_SECURITY_DOI_BUFLEN) - 1] of char;
  end;
  PvirSecurityModelPtr = ^TvirSecurityModelPtr;
  TvirSecurityModelPtr = PvirSecurityModel;

  PvirNodeInfo = ^TvirNodeInfo;
  TvirNodeInfo = record
    model: array[0..31] of char;
    memory: dword;
    cpus: dword;
    mhz: dword;
    nodes: dword;
    sockets: dword;
    cores: dword;
    threads: dword;
  end;

const
  VIR_NODE_CPU_STATS_FIELD_LENGTH = 80;

type
  PvirNodeGetCPUStatsAllCPUs = ^TvirNodeGetCPUStatsAllCPUs;
  TvirNodeGetCPUStatsAllCPUs = longint;
const
  VIR_NODE_CPU_STATS_ALL_CPUS = -(1);

const
  VIR_NODE_CPU_STATS_KERNEL = 'kernel';
  VIR_NODE_CPU_STATS_USER = 'user';
  VIR_NODE_CPU_STATS_IDLE = 'idle';
  VIR_NODE_CPU_STATS_IOWAIT = 'iowait';
  VIR_NODE_CPU_STATS_INTR = 'intr';
  VIR_NODE_CPU_STATS_UTILIZATION = 'utilization';

type
  PvirNodeCPUStats = ^TvirNodeCPUStats;
  TvirNodeCPUStats = record
    field: array[0..(VIR_NODE_CPU_STATS_FIELD_LENGTH) - 1] of char;
    value: qword;
  end;

const
  VIR_NODE_MEMORY_STATS_FIELD_LENGTH = 80;

type
  PvirNodeGetMemoryStatsAllCells = ^TvirNodeGetMemoryStatsAllCells;
  TvirNodeGetMemoryStatsAllCells = longint;
const
  VIR_NODE_MEMORY_STATS_ALL_CELLS = -(1);

const
  VIR_NODE_MEMORY_STATS_TOTAL = 'total';
  VIR_NODE_MEMORY_STATS_FREE = 'free';
  VIR_NODE_MEMORY_STATS_BUFFERS = 'buffers';
  VIR_NODE_MEMORY_STATS_CACHED = 'cached';

type
  PvirNodeMemoryStats = ^TvirNodeMemoryStats;
  TvirNodeMemoryStats = record
    field: array[0..(VIR_NODE_MEMORY_STATS_FIELD_LENGTH) - 1] of char;
    value: qword;
  end;

const
  VIR_NODE_MEMORY_SHARED_PAGES_TO_SCAN = 'shm_pages_to_scan';
  VIR_NODE_MEMORY_SHARED_SLEEP_MILLISECS = 'shm_sleep_millisecs';
  VIR_NODE_MEMORY_SHARED_PAGES_SHARED = 'shm_pages_shared';
  VIR_NODE_MEMORY_SHARED_PAGES_SHARING = 'shm_pages_sharing';
  VIR_NODE_MEMORY_SHARED_PAGES_UNSHARED = 'shm_pages_unshared';
  VIR_NODE_MEMORY_SHARED_PAGES_VOLATILE = 'shm_pages_volatile';
  VIR_NODE_MEMORY_SHARED_FULL_SCANS = 'shm_full_scans';
  VIR_NODE_MEMORY_SHARED_MERGE_ACROSS_NODES = 'shm_merge_across_nodes';

function virNodeGetMemoryParameters(conn: TvirConnectPtr; params: TvirTypedParameterPtr; nparams: Plongint; flags: dword): longint; cdecl; external libvirt;
function virNodeSetMemoryParameters(conn: TvirConnectPtr; params: TvirTypedParameterPtr; nparams: longint; flags: dword): longint; cdecl; external libvirt;
function virNodeGetCPUMap(conn: TvirConnectPtr; cpumap: PPbyte; online: Pdword; flags: dword): longint; cdecl; external libvirt;

function VIR_NODEINFO_MAXCPUS(var nodeinfo: TvirNodeInfo): DWord;

type
  PvirNodeInfoPtr = ^TvirNodeInfoPtr;
  TvirNodeInfoPtr = PvirNodeInfo;

  PvirNodeCPUStatsPtr = ^TvirNodeCPUStatsPtr;
  TvirNodeCPUStatsPtr = PvirNodeCPUStats;

  PvirNodeMemoryStatsPtr = ^TvirNodeMemoryStatsPtr;
  TvirNodeMemoryStatsPtr = PvirNodeMemoryStats;

const
  VIR_NODE_SEV_PDH = 'pdh';
  VIR_NODE_SEV_CERT_CHAIN = 'cert-chain';
  VIR_NODE_SEV_CPU0_ID = 'cpu0-id';
  VIR_NODE_SEV_CBITPOS = 'cbitpos';
  VIR_NODE_SEV_REDUCED_PHYS_BITS = 'reduced-phys-bits';
  VIR_NODE_SEV_MAX_GUESTS = 'max-guests';
  VIR_NODE_SEV_MAX_ES_GUESTS = 'max-es-guests';

function virNodeGetSEVInfo(conn: TvirConnectPtr; params: PvirTypedParameterPtr; nparams: Plongint; flags: dword): longint; cdecl; external libvirt;

type
  PvirConnectFlags = ^TvirConnectFlags;
  TvirConnectFlags = longint;
const
  VIR_CONNECT_RO = 1 shl 0;
  VIR_CONNECT_NO_ALIASES = 1 shl 1;

type
  PvirConnectCredentialType = ^TvirConnectCredentialType;
  TvirConnectCredentialType = longint;
const
  VIR_CRED_USERNAME = 1;
  VIR_CRED_AUTHNAME = 2;
  VIR_CRED_LANGUAGE = 3;
  VIR_CRED_CNONCE = 4;
  VIR_CRED_PASSPHRASE = 5;
  VIR_CRED_ECHOPROMPT = 6;
  VIR_CRED_NOECHOPROMPT = 7;
  VIR_CRED_REALM = 8;
  VIR_CRED_EXTERNAL = 9;
  VIR_CRED_LAST = 10;

type
  PvirConnectCredential = ^TvirConnectCredential;
  TvirConnectCredential = record
    _type: longint;
    prompt: pchar;
    challenge: pchar;
    defresult: pchar;
    result: pchar;
    resultlen: dword;
  end;
  PvirConnectCredentialPtr = ^TvirConnectCredentialPtr;
  TvirConnectCredentialPtr = PvirConnectCredential;

  TvirConnectAuthCallbackPtr = function(cred: TvirConnectCredentialPtr; ncred: dword; cbdata: pointer): longint; cdecl;

  PvirConnectAuth = ^TvirConnectAuth;
  TvirConnectAuth = record
    credtype: Plongint;
    ncredtype: dword;
    cb: TvirConnectAuthCallbackPtr;
    cbdata: pointer;
  end;
  PvirConnectAuthPtr = ^TvirConnectAuthPtr;
  TvirConnectAuthPtr = PvirConnectAuth;

var
  virConnectAuthPtrDefault: TvirConnectAuthPtr; cvar;external libvirt;

const
  VIR_UUID_BUFLEN = 16;
  VIR_UUID_STRING_BUFLEN = 36 + 1;

function virGetVersion(libVer: Pdword; _type: pchar; typeVer: Pdword): longint; cdecl; external libvirt;
function virInitialize: longint; cdecl; external libvirt;
function virConnectOpen(name: pchar): TvirConnectPtr; cdecl; external libvirt;
function virConnectOpenReadOnly(name: pchar): TvirConnectPtr; cdecl; external libvirt;
function virConnectOpenAuth(name: pchar; auth: TvirConnectAuthPtr; flags: dword): TvirConnectPtr; cdecl; external libvirt;
function virConnectRef(conn: TvirConnectPtr): longint; cdecl; external libvirt;
function virConnectClose(conn: TvirConnectPtr): longint; cdecl; external libvirt;

const
  VIR_CONNECT_IDENTITY_USER_NAME = 'user-name';
  VIR_CONNECT_IDENTITY_UNIX_USER_ID = 'unix-user-id';
  VIR_CONNECT_IDENTITY_GROUP_NAME = 'group-name';
  VIR_CONNECT_IDENTITY_UNIX_GROUP_ID = 'unix-group-id';
  VIR_CONNECT_IDENTITY_PROCESS_ID = 'process-id';
  VIR_CONNECT_IDENTITY_PROCESS_TIME = 'process-time';
  VIR_CONNECT_IDENTITY_SASL_USER_NAME = 'sasl-user-name';
  VIR_CONNECT_IDENTITY_X509_DISTINGUISHED_NAME = 'x509-distinguished-name';
  VIR_CONNECT_IDENTITY_SELINUX_CONTEXT = 'selinux-context';

function virConnectSetIdentity(conn: TvirConnectPtr; params: TvirTypedParameterPtr; nparams: longint; flags: dword): longint; cdecl; external libvirt;
function virConnectGetType(conn: TvirConnectPtr): pchar; cdecl; external libvirt;
function virConnectGetVersion(conn: TvirConnectPtr; hvVer: Pdword): longint; cdecl; external libvirt;
function virConnectGetLibVersion(conn: TvirConnectPtr; libVer: Pdword): longint; cdecl; external libvirt;
function virConnectGetHostname(conn: TvirConnectPtr): pchar; cdecl; external libvirt;
function virConnectGetURI(conn: TvirConnectPtr): pchar; cdecl; external libvirt;
function virConnectGetSysinfo(conn: TvirConnectPtr; flags: dword): pchar; cdecl; external libvirt;
function virConnectSetKeepAlive(conn: TvirConnectPtr; interval: longint; count: dword): longint; cdecl; external libvirt;

type
  TvirConnectCloseFunc = procedure(conn: TvirConnectPtr; reason: longint; opaque: pointer); cdecl;

function virConnectRegisterCloseCallback(conn: TvirConnectPtr; cb: TvirConnectCloseFunc; opaque: pointer; freecb: TvirFreeCallback): longint; cdecl; external libvirt;
function virConnectUnregisterCloseCallback(conn: TvirConnectPtr; cb: TvirConnectCloseFunc): longint; cdecl; external libvirt;

function virConnectGetMaxVcpus(conn: TvirConnectPtr; _type: pchar): longint; cdecl; external libvirt;
function virNodeGetInfo(conn: TvirConnectPtr; info: TvirNodeInfoPtr): longint; cdecl; external libvirt;
function virConnectGetCapabilities(conn: TvirConnectPtr): pchar; cdecl; external libvirt;
function virNodeGetCPUStats(conn: TvirConnectPtr; cpuNum: longint; params: TvirNodeCPUStatsPtr; nparams: Plongint; flags: dword): longint; cdecl; external libvirt;
function virNodeGetMemoryStats(conn: TvirConnectPtr; cellNum: longint; params: TvirNodeMemoryStatsPtr; nparams: Plongint; flags: dword): longint; cdecl; external libvirt;
function virNodeGetFreeMemory(conn: TvirConnectPtr): qword; cdecl; external libvirt;
function virNodeGetSecurityModel(conn: TvirConnectPtr; secmodel: TvirSecurityModelPtr): longint; cdecl; external libvirt;
function virNodeSuspendForDuration(conn: TvirConnectPtr; target: dword; duration: qword; flags: dword): longint; cdecl; external libvirt;

function virNodeGetCellsFreeMemory(conn: TvirConnectPtr; freeMems: Pqword; startCell: longint; maxCells: longint): longint; cdecl; external libvirt;
function virConnectIsEncrypted(conn: TvirConnectPtr): longint; cdecl; external libvirt;
function virConnectIsSecure(conn: TvirConnectPtr): longint; cdecl; external libvirt;
function virConnectIsAlive(conn: TvirConnectPtr): longint; cdecl; external libvirt;

type
  PvirCPUCompareResult = ^TvirCPUCompareResult;
  TvirCPUCompareResult = longint;
const
  VIR_CPU_COMPARE_ERROR = -(1);
  VIR_CPU_COMPARE_INCOMPATIBLE = 0;
  VIR_CPU_COMPARE_IDENTICAL = 1;
  VIR_CPU_COMPARE_SUPERSET = 2;
  VIR_CPU_COMPARE_LAST = 3;

type
  PvirConnectCompareCPUFlags = ^TvirConnectCompareCPUFlags;
  TvirConnectCompareCPUFlags = longint;
const
  VIR_CONNECT_COMPARE_CPU_FAIL_INCOMPATIBLE = 1 shl 0;
  VIR_CONNECT_COMPARE_CPU_VALIDATE_XML = 1 shl 1;

function virConnectCompareCPU(conn: TvirConnectPtr; xmlDesc: pchar; flags: dword): longint; cdecl; external libvirt;
function virConnectCompareHypervisorCPU(conn: TvirConnectPtr; emulator: pchar; arch: pchar; machine: pchar; virttype: pchar;
  xmlCPU: pchar; flags: dword): longint; cdecl; external libvirt;
function virConnectGetCPUModelNames(conn: TvirConnectPtr; arch: pchar; models: PPPchar; flags: dword): longint; cdecl; external libvirt;

type
  PvirConnectBaselineCPUFlags = ^TvirConnectBaselineCPUFlags;
  TvirConnectBaselineCPUFlags = longint;
const
  VIR_CONNECT_BASELINE_CPU_EXPAND_FEATURES = 1 shl 0;
  VIR_CONNECT_BASELINE_CPU_MIGRATABLE = 1 shl 1;

function virConnectBaselineCPU(conn: TvirConnectPtr; xmlCPUs: PPchar; ncpus: dword; flags: dword): pchar; cdecl; external libvirt;
function virConnectBaselineHypervisorCPU(conn: TvirConnectPtr; emulator: pchar; arch: pchar; machine: pchar; virttype: pchar;
  xmlCPUs: PPchar; ncpus: dword; flags: dword): pchar; cdecl; external libvirt;
function virNodeGetFreePages(conn: TvirConnectPtr; npages: dword; pages: Pdword; startcell: longint; cellcount: dword;
  counts: Pqword; flags: dword): longint; cdecl; external libvirt;

type
  PvirNodeAllocPagesFlags = ^TvirNodeAllocPagesFlags;
  TvirNodeAllocPagesFlags = longint;
const
  VIR_NODE_ALLOC_PAGES_ADD = 0;
  VIR_NODE_ALLOC_PAGES_SET = 1 shl 0;

function virNodeAllocPages(conn: TvirConnectPtr; npages: dword; pageSizes: Pdword; pageCounts: Pqword; startCell: longint;
  cellCount: dword; flags: dword): longint; cdecl; external libvirt;

// === Konventiert am: 14-10-26 19:34:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function VIR_NODEINFO_MAXCPUS(var nodeinfo: TvirNodeInfo): DWord;
begin
  VIR_NODEINFO_MAXCPUS := nodeinfo.nodes * nodeinfo.sockets * nodeinfo.cores * nodeinfo.threads;
end;


{$ENDIF read_implementation}
