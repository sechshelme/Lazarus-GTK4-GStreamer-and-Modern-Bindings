{$IFDEF read_interface}


type
  PvirAdmConnectPtr = ^TvirAdmConnectPtr;
  TvirAdmConnectPtr = type Pointer;

  PPvirAdmServerPtr = ^PvirAdmServerPtr;
  PvirAdmServerPtr = ^TvirAdmServerPtr;
  TvirAdmServerPtr = type Pointer;

  PPvirAdmClientPtr = ^PvirAdmClientPtr;
  PvirAdmClientPtr = ^TvirAdmClientPtr;
  TvirAdmClientPtr = type Pointer;

function virAdmInitialize: longint; cdecl; external libvirt;
function virAdmConnectOpen(name: pchar; flags: dword): TvirAdmConnectPtr; cdecl; external libvirt;
function virAdmConnectClose(conn: TvirAdmConnectPtr): longint; cdecl; external libvirt;
function virAdmConnectRef(conn: TvirAdmConnectPtr): longint; cdecl; external libvirt;
function virAdmConnectIsAlive(conn: TvirAdmConnectPtr): longint; cdecl; external libvirt;
function virAdmServerFree(srv: TvirAdmServerPtr): longint; cdecl; external libvirt;
function virAdmConnectListServers(conn: TvirAdmConnectPtr; servers: PPvirAdmServerPtr; flags: dword): longint; cdecl; external libvirt;
function virAdmGetVersion(libVer: Pqword): longint; cdecl; external libvirt;
function virAdmConnectGetURI(conn: TvirAdmConnectPtr): pchar; cdecl; external libvirt;
function virAdmConnectGetLibVersion(conn: TvirAdmConnectPtr; libVer: Pqword): longint; cdecl; external libvirt;

type
  TvirAdmConnectCloseFunc = procedure(conn: TvirAdmConnectPtr; reason: longint; opaque: pointer); cdecl;

function virAdmConnectRegisterCloseCallback(conn: TvirAdmConnectPtr; cb: TvirAdmConnectCloseFunc; opaque: pointer; freecb: TvirFreeCallback): longint; cdecl; external libvirt;
function virAdmConnectUnregisterCloseCallback(conn: TvirAdmConnectPtr; cb: TvirAdmConnectCloseFunc): longint; cdecl; external libvirt;
function virAdmServerGetName(srv: TvirAdmServerPtr): pchar; cdecl; external libvirt;
function virAdmConnectLookupServer(conn: TvirAdmConnectPtr; name: pchar; flags: dword): TvirAdmServerPtr; cdecl; external libvirt;

const
  VIR_THREADPOOL_WORKERS_MIN = 'minWorkers';
  VIR_THREADPOOL_WORKERS_MAX = 'maxWorkers';
  VIR_THREADPOOL_WORKERS_PRIORITY = 'prioWorkers';
  VIR_THREADPOOL_WORKERS_FREE = 'freeWorkers';
  VIR_THREADPOOL_WORKERS_CURRENT = 'nWorkers';
  VIR_THREADPOOL_JOB_QUEUE_DEPTH = 'jobQueueDepth';

function virAdmServerGetThreadPoolParameters(srv: TvirAdmServerPtr; params: PvirTypedParameterPtr; nparams: Plongint; flags: dword): longint; cdecl; external libvirt;
function virAdmServerSetThreadPoolParameters(srv: TvirAdmServerPtr; params: TvirTypedParameterPtr; nparams: longint; flags: dword): longint; cdecl; external libvirt;

function virAdmClientGetID(client: TvirAdmClientPtr): qword; cdecl; external libvirt;
function virAdmClientGetTimestamp(client: TvirAdmClientPtr): int64; cdecl; external libvirt;
function virAdmClientGetTransport(client: TvirAdmClientPtr): longint; cdecl; external libvirt;
function virAdmClientFree(client: TvirAdmClientPtr): longint; cdecl; external libvirt;

type
  PvirClientTransport = ^TvirClientTransport;
  TvirClientTransport = longint;

const
  VIR_CLIENT_TRANS_UNIX = 0;
  VIR_CLIENT_TRANS_TCP = 1;
  VIR_CLIENT_TRANS_TLS = 2;
  VIR_CLIENT_TRANS_LAST = 3;

function virAdmServerListClients(srv: TvirAdmServerPtr; clients: PPvirAdmClientPtr; flags: dword): longint; cdecl; external libvirt;
function virAdmServerLookupClient(srv: TvirAdmServerPtr; id: qword; flags: dword): TvirAdmClientPtr; cdecl; external libvirt;

const
  VIR_CLIENT_INFO_READONLY = 'readonly';
  VIR_CLIENT_INFO_SOCKET_ADDR = 'sock_addr';
  VIR_CLIENT_INFO_SASL_USER_NAME = 'sasl_user_name';
  VIR_CLIENT_INFO_X509_DISTINGUISHED_NAME = 'tls_x509_dname';
  VIR_CLIENT_INFO_UNIX_USER_ID = 'unix_user_id';
  VIR_CLIENT_INFO_UNIX_USER_NAME = 'unix_user_name';
  VIR_CLIENT_INFO_UNIX_GROUP_ID = 'unix_group_id';
  VIR_CLIENT_INFO_UNIX_GROUP_NAME = 'unix_group_name';
  VIR_CLIENT_INFO_UNIX_PROCESS_ID = 'unix_process_id';
  VIR_CLIENT_INFO_SELINUX_CONTEXT = 'selinux_context';

function virAdmClientGetInfo(client: TvirAdmClientPtr; params: PvirTypedParameterPtr; nparams: Plongint; flags: dword): longint; cdecl; external libvirt;
function virAdmClientClose(client: TvirAdmClientPtr; flags: dword): longint; cdecl; external libvirt;

const
  VIR_SERVER_CLIENTS_MAX = 'nclients_max';
  VIR_SERVER_CLIENTS_CURRENT = 'nclients';
  VIR_SERVER_CLIENTS_UNAUTH_MAX = 'nclients_unauth_max';
  VIR_SERVER_CLIENTS_UNAUTH_CURRENT = 'nclients_unauth';

function virAdmServerGetClientLimits(srv: TvirAdmServerPtr; params: PvirTypedParameterPtr; nparams: Plongint; flags: dword): longint; cdecl; external libvirt;
function virAdmServerSetClientLimits(srv: TvirAdmServerPtr; params: TvirTypedParameterPtr; nparams: longint; flags: dword): longint; cdecl; external libvirt;
function virAdmServerUpdateTlsFiles(srv: TvirAdmServerPtr; flags: dword): longint; cdecl; external libvirt;
function virAdmConnectGetLoggingOutputs(conn: TvirAdmConnectPtr; outputs: PPchar; flags: dword): longint; cdecl; external libvirt;
function virAdmConnectGetLoggingFilters(conn: TvirAdmConnectPtr; filters: PPchar; flags: dword): longint; cdecl; external libvirt;
function virAdmConnectSetLoggingOutputs(conn: TvirAdmConnectPtr; outputs: pchar; flags: dword): longint; cdecl; external libvirt;
function virAdmConnectSetLoggingFilters(conn: TvirAdmConnectPtr; filters: pchar; flags: dword): longint; cdecl; external libvirt;
function virAdmConnectSetDaemonTimeout(conn: TvirAdmConnectPtr; timeout: dword; flags: dword): longint; cdecl; external libvirt;

// === Konventiert am: 14-10-26 19:34:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
