{$IFDEF read_interface}


type
  PPvirDomainPtr = ^PvirDomainPtr;
  PvirDomainPtr = ^TvirDomainPtr;
  TvirDomainPtr = type Pointer;

type
  PvirDomainState = ^TvirDomainState;
  TvirDomainState = longint;
const
  VIR_DOMAIN_NOSTATE = 0;
  VIR_DOMAIN_RUNNING = 1;
  VIR_DOMAIN_BLOCKED = 2;
  VIR_DOMAIN_PAUSED = 3;
  VIR_DOMAIN_SHUTDOWN = 4;
  VIR_DOMAIN_SHUTOFF = 5;
  VIR_DOMAIN_CRASHED = 6;
  VIR_DOMAIN_PMSUSPENDED = 7;
  VIR_DOMAIN_LAST = 8;

type
  PvirDomainNostateReason = ^TvirDomainNostateReason;
  TvirDomainNostateReason = longint;
const
  VIR_DOMAIN_NOSTATE_UNKNOWN = 0;
  VIR_DOMAIN_NOSTATE_LAST = 1;

type
  PvirDomainRunningReason = ^TvirDomainRunningReason;
  TvirDomainRunningReason = longint;
const
  VIR_DOMAIN_RUNNING_UNKNOWN = 0;
  VIR_DOMAIN_RUNNING_BOOTED = 1;
  VIR_DOMAIN_RUNNING_MIGRATED = 2;
  VIR_DOMAIN_RUNNING_RESTORED = 3;
  VIR_DOMAIN_RUNNING_FROM_SNAPSHOT = 4;
  VIR_DOMAIN_RUNNING_UNPAUSED = 5;
  VIR_DOMAIN_RUNNING_MIGRATION_CANCELED = 6;
  VIR_DOMAIN_RUNNING_SAVE_CANCELED = 7;
  VIR_DOMAIN_RUNNING_WAKEUP = 8;
  VIR_DOMAIN_RUNNING_CRASHED = 9;
  VIR_DOMAIN_RUNNING_POSTCOPY = 10;
  VIR_DOMAIN_RUNNING_POSTCOPY_FAILED = 11;
  VIR_DOMAIN_RUNNING_LAST = 12;

type
  PvirDomainBlockedReason = ^TvirDomainBlockedReason;
  TvirDomainBlockedReason = longint;
const
  VIR_DOMAIN_BLOCKED_UNKNOWN = 0;
  VIR_DOMAIN_BLOCKED_LAST = 1;

type
  PvirDomainPausedReason = ^TvirDomainPausedReason;
  TvirDomainPausedReason = longint;
const
  VIR_DOMAIN_PAUSED_UNKNOWN = 0;
  VIR_DOMAIN_PAUSED_USER = 1;
  VIR_DOMAIN_PAUSED_MIGRATION = 2;
  VIR_DOMAIN_PAUSED_SAVE = 3;
  VIR_DOMAIN_PAUSED_DUMP = 4;
  VIR_DOMAIN_PAUSED_IOERROR = 5;
  VIR_DOMAIN_PAUSED_WATCHDOG = 6;
  VIR_DOMAIN_PAUSED_FROM_SNAPSHOT = 7;
  VIR_DOMAIN_PAUSED_SHUTTING_DOWN = 8;
  VIR_DOMAIN_PAUSED_SNAPSHOT = 9;
  VIR_DOMAIN_PAUSED_CRASHED = 10;
  VIR_DOMAIN_PAUSED_STARTING_UP = 11;
  VIR_DOMAIN_PAUSED_POSTCOPY = 12;
  VIR_DOMAIN_PAUSED_POSTCOPY_FAILED = 13;
  VIR_DOMAIN_PAUSED_API_ERROR = 14;
  VIR_DOMAIN_PAUSED_LAST = 15;

type
  PvirDomainShutdownReason = ^TvirDomainShutdownReason;
  TvirDomainShutdownReason = longint;
const
  VIR_DOMAIN_SHUTDOWN_UNKNOWN = 0;
  VIR_DOMAIN_SHUTDOWN_USER = 1;
  VIR_DOMAIN_SHUTDOWN_LAST = 2;

type
  PvirDomainShutoffReason = ^TvirDomainShutoffReason;
  TvirDomainShutoffReason = longint;
const
  VIR_DOMAIN_SHUTOFF_UNKNOWN = 0;
  VIR_DOMAIN_SHUTOFF_SHUTDOWN = 1;
  VIR_DOMAIN_SHUTOFF_DESTROYED = 2;
  VIR_DOMAIN_SHUTOFF_CRASHED = 3;
  VIR_DOMAIN_SHUTOFF_MIGRATED = 4;
  VIR_DOMAIN_SHUTOFF_SAVED = 5;
  VIR_DOMAIN_SHUTOFF_FAILED = 6;
  VIR_DOMAIN_SHUTOFF_FROM_SNAPSHOT = 7;
  VIR_DOMAIN_SHUTOFF_DAEMON = 8;
  VIR_DOMAIN_SHUTOFF_LAST = 9;

type
  PvirDomainCrashedReason = ^TvirDomainCrashedReason;
  TvirDomainCrashedReason = longint;
const
  VIR_DOMAIN_CRASHED_UNKNOWN = 0;
  VIR_DOMAIN_CRASHED_PANICKED = 1;
  VIR_DOMAIN_CRASHED_LAST = 2;

type
  PvirDomainPMSuspendedReason = ^TvirDomainPMSuspendedReason;
  TvirDomainPMSuspendedReason = longint;
const
  VIR_DOMAIN_PMSUSPENDED_UNKNOWN = 0;
  VIR_DOMAIN_PMSUSPENDED_LAST = 1;

type
  PvirDomainPMSuspendedDiskReason = ^TvirDomainPMSuspendedDiskReason;
  TvirDomainPMSuspendedDiskReason = longint;
const
  VIR_DOMAIN_PMSUSPENDED_DISK_UNKNOWN = 0;
  VIR_DOMAIN_PMSUSPENDED_DISK_LAST = 1;

type
  PvirDomainControlState = ^TvirDomainControlState;
  TvirDomainControlState = longint;
const
  VIR_DOMAIN_CONTROL_OK = 0;
  VIR_DOMAIN_CONTROL_JOB = 1;
  VIR_DOMAIN_CONTROL_OCCUPIED = 2;
  VIR_DOMAIN_CONTROL_ERROR = 3;
  VIR_DOMAIN_CONTROL_LAST = 4;

type
  PvirDomainControlErrorReason = ^TvirDomainControlErrorReason;
  TvirDomainControlErrorReason = longint;
const
  VIR_DOMAIN_CONTROL_ERROR_REASON_NONE = 0;
  VIR_DOMAIN_CONTROL_ERROR_REASON_UNKNOWN = 1;
  VIR_DOMAIN_CONTROL_ERROR_REASON_MONITOR = 2;
  VIR_DOMAIN_CONTROL_ERROR_REASON_INTERNAL = 3;
  VIR_DOMAIN_CONTROL_ERROR_REASON_LAST = 4;

type
  PvirDomainControlInfo = ^TvirDomainControlInfo;
  TvirDomainControlInfo = record
    state: dword;
    details: dword;
    stateTime: qword;  end;

  PvirDomainControlInfoPtr = ^TvirDomainControlInfoPtr;
  TvirDomainControlInfoPtr = PvirDomainControlInfo;

type
  PvirDomainModificationImpact = ^TvirDomainModificationImpact;
  TvirDomainModificationImpact = longint;
const
  VIR_DOMAIN_AFFECT_CURRENT = 0;
  VIR_DOMAIN_AFFECT_LIVE = 1 shl 0;
  VIR_DOMAIN_AFFECT_CONFIG = 1 shl 1;

type
  PvirDomainInfo = ^TvirDomainInfo;
  TvirDomainInfo = record
    state: byte;
    maxMem: dword;
    memory: dword;
    nrVirtCpu: word;
    cpuTime: qword;
  end;
  PvirDomainInfoPtr = ^TvirDomainInfoPtr;
  TvirDomainInfoPtr = PvirDomainInfo;

type
  PvirDomainCreateFlags = ^TvirDomainCreateFlags;
  TvirDomainCreateFlags = longint;
const
  VIR_DOMAIN_NONE = 0;
  VIR_DOMAIN_START_PAUSED = 1 shl 0;
  VIR_DOMAIN_START_AUTODESTROY = 1 shl 1;
  VIR_DOMAIN_START_BYPASS_CACHE = 1 shl 2;
  VIR_DOMAIN_START_FORCE_BOOT = 1 shl 3;
  VIR_DOMAIN_START_VALIDATE = 1 shl 4;
  VIR_DOMAIN_START_RESET_NVRAM = 1 shl 5;

const
  VIR_DOMAIN_SCHEDULER_CPU_SHARES = 'cpu_shares';
  VIR_DOMAIN_SCHEDULER_GLOBAL_PERIOD = 'global_period';
  VIR_DOMAIN_SCHEDULER_GLOBAL_QUOTA = 'global_quota';
  VIR_DOMAIN_SCHEDULER_VCPU_PERIOD = 'vcpu_period';
  VIR_DOMAIN_SCHEDULER_VCPU_QUOTA = 'vcpu_quota';
  VIR_DOMAIN_SCHEDULER_EMULATOR_PERIOD = 'emulator_period';
  VIR_DOMAIN_SCHEDULER_EMULATOR_QUOTA = 'emulator_quota';
  VIR_DOMAIN_SCHEDULER_IOTHREAD_PERIOD = 'iothread_period';
  VIR_DOMAIN_SCHEDULER_IOTHREAD_QUOTA = 'iothread_quota';
  VIR_DOMAIN_SCHEDULER_WEIGHT = 'weight';
  VIR_DOMAIN_SCHEDULER_CAP = 'cap';
  VIR_DOMAIN_SCHEDULER_RESERVATION = 'reservation';
  VIR_DOMAIN_SCHEDULER_LIMIT = 'limit';
  VIR_DOMAIN_SCHEDULER_SHARES = 'shares';

function virDomainGetSchedulerParameters(domain: TvirDomainPtr; params: TvirTypedParameterPtr; nparams: Plongint): longint; cdecl; external libvirt;
function virDomainGetSchedulerParametersFlags(domain: TvirDomainPtr; params: TvirTypedParameterPtr; nparams: Plongint; flags: dword): longint; cdecl; external libvirt;

function virDomainSetSchedulerParameters(domain: TvirDomainPtr; params: TvirTypedParameterPtr; nparams: longint): longint; cdecl; external libvirt;
function virDomainSetSchedulerParametersFlags(domain: TvirDomainPtr; params: TvirTypedParameterPtr; nparams: longint; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainBlockStats = ^TvirDomainBlockStats;
  TvirDomainBlockStats = record
    rd_req: int64;
    rd_bytes: int64;
    wr_req: int64;
    wr_bytes: int64;
    errs: int64;
  end;
  PvirDomainBlockStatsPtr = ^TvirDomainBlockStatsPtr;
  TvirDomainBlockStatsPtr = PvirDomainBlockStats;

const
  VIR_DOMAIN_BLOCK_STATS_FIELD_LENGTH = VIR_TYPED_PARAM_FIELD_LENGTH;
  VIR_DOMAIN_BLOCK_STATS_READ_BYTES = 'rd_bytes';
  VIR_DOMAIN_BLOCK_STATS_READ_REQ = 'rd_operations';
  VIR_DOMAIN_BLOCK_STATS_READ_TOTAL_TIMES = 'rd_total_times';
  VIR_DOMAIN_BLOCK_STATS_WRITE_BYTES = 'wr_bytes';
  VIR_DOMAIN_BLOCK_STATS_WRITE_REQ = 'wr_operations';
  VIR_DOMAIN_BLOCK_STATS_WRITE_TOTAL_TIMES = 'wr_total_times';
  VIR_DOMAIN_BLOCK_STATS_FLUSH_REQ = 'flush_operations';
  VIR_DOMAIN_BLOCK_STATS_FLUSH_TOTAL_TIMES = 'flush_total_times';
  VIR_DOMAIN_BLOCK_STATS_ERRS = 'errs';

type
  PvirDomainInterfaceStats = ^TvirDomainInterfaceStats;
  TvirDomainInterfaceStats = record
    rx_bytes: int64;
    rx_packets: int64;
    rx_errs: int64;
    rx_drop: int64;
    tx_bytes: int64;
    tx_packets: int64;
    tx_errs: int64;
    tx_drop: int64;
  end;
  PvirDomainInterfaceStatsPtr = ^TvirDomainInterfaceStatsPtr;
  TvirDomainInterfaceStatsPtr = PvirDomainInterfaceStats;

type
  PvirDomainMemoryStatTags = ^TvirDomainMemoryStatTags;
  TvirDomainMemoryStatTags = longint;
const
  VIR_DOMAIN_MEMORY_STAT_SWAP_IN = 0;
  VIR_DOMAIN_MEMORY_STAT_SWAP_OUT = 1;
  VIR_DOMAIN_MEMORY_STAT_MAJOR_FAULT = 2;
  VIR_DOMAIN_MEMORY_STAT_MINOR_FAULT = 3;
  VIR_DOMAIN_MEMORY_STAT_UNUSED = 4;
  VIR_DOMAIN_MEMORY_STAT_AVAILABLE = 5;
  VIR_DOMAIN_MEMORY_STAT_ACTUAL_BALLOON = 6;
  VIR_DOMAIN_MEMORY_STAT_RSS = 7;
  VIR_DOMAIN_MEMORY_STAT_USABLE = 8;
  VIR_DOMAIN_MEMORY_STAT_LAST_UPDATE = 9;
  VIR_DOMAIN_MEMORY_STAT_DISK_CACHES = 10;
  VIR_DOMAIN_MEMORY_STAT_HUGETLB_PGALLOC = 11;
  VIR_DOMAIN_MEMORY_STAT_HUGETLB_PGFAIL = 12;
  VIR_DOMAIN_MEMORY_STAT_NR = 13;
  VIR_DOMAIN_MEMORY_STAT_LAST = VIR_DOMAIN_MEMORY_STAT_NR;

type
  PvirDomainMemoryStat = ^TvirDomainMemoryStat;
  TvirDomainMemoryStat = record
    tag: longint;
    val: qword;
  end;
  PvirDomainMemoryStatPtr = ^TvirDomainMemoryStatPtr;
  TvirDomainMemoryStatPtr = PvirDomainMemoryStat;

type
  PvirDomainCoreDumpFlags = ^TvirDomainCoreDumpFlags;
  TvirDomainCoreDumpFlags = longint;
const
  VIR_DUMP_CRASH = 1 shl 0;
  VIR_DUMP_LIVE = 1 shl 1;
  VIR_DUMP_BYPASS_CACHE = 1 shl 2;
  VIR_DUMP_RESET = 1 shl 3;
  VIR_DUMP_MEMORY_ONLY = 1 shl 4;

type
  PvirDomainCoreDumpFormat = ^TvirDomainCoreDumpFormat;
  TvirDomainCoreDumpFormat = longint;
const
  VIR_DOMAIN_CORE_DUMP_FORMAT_RAW = 0;
  VIR_DOMAIN_CORE_DUMP_FORMAT_KDUMP_ZLIB = 1;
  VIR_DOMAIN_CORE_DUMP_FORMAT_KDUMP_LZO = 2;
  VIR_DOMAIN_CORE_DUMP_FORMAT_KDUMP_SNAPPY = 3;
  VIR_DOMAIN_CORE_DUMP_FORMAT_WIN_DMP = 4;
  VIR_DOMAIN_CORE_DUMP_FORMAT_LAST = 5;

type
  PvirDomainMigrateFlags = ^TvirDomainMigrateFlags;
  TvirDomainMigrateFlags = longint;
const
  VIR_MIGRATE_LIVE = 1 shl 0;
  VIR_MIGRATE_PEER2PEER = 1 shl 1;
  VIR_MIGRATE_TUNNELLED = 1 shl 2;
  VIR_MIGRATE_PERSIST_DEST = 1 shl 3;
  VIR_MIGRATE_UNDEFINE_SOURCE = 1 shl 4;
  VIR_MIGRATE_PAUSED = 1 shl 5;
  VIR_MIGRATE_NON_SHARED_DISK = 1 shl 6;
  VIR_MIGRATE_NON_SHARED_INC = 1 shl 7;
  VIR_MIGRATE_CHANGE_PROTECTION = 1 shl 8;
  VIR_MIGRATE_UNSAFE = 1 shl 9;
  VIR_MIGRATE_OFFLINE = 1 shl 10;
  VIR_MIGRATE_COMPRESSED = 1 shl 11;
  VIR_MIGRATE_ABORT_ON_ERROR = 1 shl 12;
  VIR_MIGRATE_AUTO_CONVERGE = 1 shl 13;
  VIR_MIGRATE_RDMA_PIN_ALL = 1 shl 14;
  VIR_MIGRATE_POSTCOPY = 1 shl 15;
  VIR_MIGRATE_TLS = 1 shl 16;
  VIR_MIGRATE_PARALLEL = 1 shl 17;
  VIR_MIGRATE_NON_SHARED_SYNCHRONOUS_WRITES = 1 shl 18;
  VIR_MIGRATE_POSTCOPY_RESUME = 1 shl 19;
  VIR_MIGRATE_ZEROCOPY = 1 shl 20;

const
  VIR_MIGRATE_PARAM_URI = 'migrate_uri';
  VIR_MIGRATE_PARAM_DEST_NAME = 'destination_name';
  VIR_MIGRATE_PARAM_DEST_XML = 'destination_xml';
  VIR_MIGRATE_PARAM_PERSIST_XML = 'persistent_xml';
  VIR_MIGRATE_PARAM_BANDWIDTH = 'bandwidth';
  VIR_MIGRATE_PARAM_BANDWIDTH_POSTCOPY = 'bandwidth.postcopy';
  VIR_MIGRATE_PARAM_GRAPHICS_URI = 'graphics_uri';
  VIR_MIGRATE_PARAM_LISTEN_ADDRESS = 'listen_address';
  VIR_MIGRATE_PARAM_MIGRATE_DISKS = 'migrate_disks';
  VIR_MIGRATE_PARAM_DISKS_PORT = 'disks_port';
  VIR_MIGRATE_PARAM_DISKS_URI = 'disks_uri';
  VIR_MIGRATE_PARAM_COMPRESSION = 'compression';
  VIR_MIGRATE_PARAM_COMPRESSION_MT_LEVEL = 'compression.mt.level';
  VIR_MIGRATE_PARAM_COMPRESSION_MT_THREADS = 'compression.mt.threads';
  VIR_MIGRATE_PARAM_COMPRESSION_MT_DTHREADS = 'compression.mt.dthreads';
  VIR_MIGRATE_PARAM_COMPRESSION_XBZRLE_CACHE = 'compression.xbzrle.cache';
  VIR_MIGRATE_PARAM_COMPRESSION_ZLIB_LEVEL = 'compression.zlib.level';
  VIR_MIGRATE_PARAM_COMPRESSION_ZSTD_LEVEL = 'compression.zstd.level';
  VIR_MIGRATE_PARAM_AUTO_CONVERGE_INITIAL = 'auto_converge.initial';
  VIR_MIGRATE_PARAM_AUTO_CONVERGE_INCREMENT = 'auto_converge.increment';
  VIR_MIGRATE_PARAM_PARALLEL_CONNECTIONS = 'parallel.connections';
  VIR_MIGRATE_PARAM_TLS_DESTINATION = 'tls.destination';

function virDomainMigrate(domain: TvirDomainPtr; dconn: TvirConnectPtr; flags: dword; dname: pchar; uri: pchar;
  bandwidth: dword): TvirDomainPtr; cdecl; external libvirt;
function virDomainMigrate2(domain: TvirDomainPtr; dconn: TvirConnectPtr; dxml: pchar; flags: dword; dname: pchar;
  uri: pchar; bandwidth: dword): TvirDomainPtr; cdecl; external libvirt;
function virDomainMigrate3(domain: TvirDomainPtr; dconn: TvirConnectPtr; params: TvirTypedParameterPtr; nparams: dword; flags: dword): TvirDomainPtr; cdecl; external libvirt;
function virDomainMigrateToURI(domain: TvirDomainPtr; duri: pchar; flags: dword; dname: pchar; bandwidth: dword): longint; cdecl; external libvirt;
function virDomainMigrateToURI2(domain: TvirDomainPtr; dconnuri: pchar; miguri: pchar; dxml: pchar; flags: dword;
  dname: pchar; bandwidth: dword): longint; cdecl; external libvirt;
function virDomainMigrateToURI3(domain: TvirDomainPtr; dconnuri: pchar; params: TvirTypedParameterPtr; nparams: dword; flags: dword): longint; cdecl; external libvirt;
function virDomainMigrateGetMaxDowntime(domain: TvirDomainPtr; downtime: Pqword; flags: dword): longint; cdecl; external libvirt;
function virDomainMigrateSetMaxDowntime(domain: TvirDomainPtr; downtime: qword; flags: dword): longint; cdecl; external libvirt;
function virDomainMigrateGetCompressionCache(domain: TvirDomainPtr; cacheSize: Pqword; flags: dword): longint; cdecl; external libvirt;
function virDomainMigrateSetCompressionCache(domain: TvirDomainPtr; cacheSize: qword; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainMigrateMaxSpeedFlags = ^TvirDomainMigrateMaxSpeedFlags;
  TvirDomainMigrateMaxSpeedFlags = longint;
const
  VIR_DOMAIN_MIGRATE_MAX_SPEED_POSTCOPY = 1 shl 0;

function virDomainMigrateSetMaxSpeed(domain: TvirDomainPtr; bandwidth: dword; flags: dword): longint; cdecl; external libvirt;
function virDomainMigrateGetMaxSpeed(domain: TvirDomainPtr; bandwidth: Pdword; flags: dword): longint; cdecl; external libvirt;
function virDomainMigrateStartPostCopy(domain: TvirDomainPtr; flags: dword): longint; cdecl; external libvirt;
function virConnectGetDomainCapabilities(conn: TvirConnectPtr; emulatorbin: pchar; arch: pchar; machine: pchar; virttype: pchar;
  flags: dword): pchar; cdecl; external libvirt;
function virConnectListDomains(conn: TvirConnectPtr; ids: Plongint; maxids: longint): longint; cdecl; external libvirt;
function virConnectNumOfDomains(conn: TvirConnectPtr): longint; cdecl; external libvirt;
function virDomainGetConnect(domain: TvirDomainPtr): TvirConnectPtr; cdecl; external libvirt;
function virDomainCreateXML(conn: TvirConnectPtr; xmlDesc: pchar; flags: dword): TvirDomainPtr; cdecl; external libvirt;
function virDomainCreateXMLWithFiles(conn: TvirConnectPtr; xmlDesc: pchar; nfiles: dword; files: Plongint; flags: dword): TvirDomainPtr; cdecl; external libvirt;
function virDomainLookupByName(conn: TvirConnectPtr; name: pchar): TvirDomainPtr; cdecl; external libvirt;
function virDomainLookupByID(conn: TvirConnectPtr; id: longint): TvirDomainPtr; cdecl; external libvirt;
function virDomainLookupByUUID(conn: TvirConnectPtr; uuid: pbyte): TvirDomainPtr; cdecl; external libvirt;
function virDomainLookupByUUIDString(conn: TvirConnectPtr; uuid: pchar): TvirDomainPtr; cdecl; external libvirt;

type
  PvirDomainShutdownFlagValues = ^TvirDomainShutdownFlagValues;
  TvirDomainShutdownFlagValues = longint;
const
  VIR_DOMAIN_SHUTDOWN_DEFAULT = 0;
  VIR_DOMAIN_SHUTDOWN_ACPI_POWER_BTN = 1 shl 0;
  VIR_DOMAIN_SHUTDOWN_GUEST_AGENT = 1 shl 1;
  VIR_DOMAIN_SHUTDOWN_INITCTL = 1 shl 2;
  VIR_DOMAIN_SHUTDOWN_SIGNAL = 1 shl 3;
  VIR_DOMAIN_SHUTDOWN_PARAVIRT = 1 shl 4;

function virDomainShutdown(domain: TvirDomainPtr): longint; cdecl; external libvirt;
function virDomainShutdownFlags(domain: TvirDomainPtr; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainRebootFlagValues = ^TvirDomainRebootFlagValues;
  TvirDomainRebootFlagValues = longint;
const
  VIR_DOMAIN_REBOOT_DEFAULT = 0;
  VIR_DOMAIN_REBOOT_ACPI_POWER_BTN = 1 shl 0;
  VIR_DOMAIN_REBOOT_GUEST_AGENT = 1 shl 1;
  VIR_DOMAIN_REBOOT_INITCTL = 1 shl 2;
  VIR_DOMAIN_REBOOT_SIGNAL = 1 shl 3;
  VIR_DOMAIN_REBOOT_PARAVIRT = 1 shl 4;

function virDomainReboot(domain: TvirDomainPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainReset(domain: TvirDomainPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainDestroy(domain: TvirDomainPtr): longint; cdecl; external libvirt;

type
  PvirDomainDestroyFlagsValues = ^TvirDomainDestroyFlagsValues;
  TvirDomainDestroyFlagsValues = longint;
const
  VIR_DOMAIN_DESTROY_DEFAULT = 0;
  VIR_DOMAIN_DESTROY_GRACEFUL = 1 shl 0;
  VIR_DOMAIN_DESTROY_REMOVE_LOGS = 1 shl 1;

function virDomainDestroyFlags(domain: TvirDomainPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainRef(domain: TvirDomainPtr): longint; cdecl; external libvirt;
function virDomainFree(domain: TvirDomainPtr): longint; cdecl; external libvirt;

function virDomainSuspend(domain: TvirDomainPtr): longint; cdecl; external libvirt;
function virDomainResume(domain: TvirDomainPtr): longint; cdecl; external libvirt;
function virDomainPMSuspendForDuration(domain: TvirDomainPtr; target: dword; duration: qword; flags: dword): longint; cdecl; external libvirt;
function virDomainPMWakeup(domain: TvirDomainPtr; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainSaveRestoreFlags = ^TvirDomainSaveRestoreFlags;
  TvirDomainSaveRestoreFlags = longint;
const
  VIR_DOMAIN_SAVE_BYPASS_CACHE = 1 shl 0;
  VIR_DOMAIN_SAVE_RUNNING = 1 shl 1;
  VIR_DOMAIN_SAVE_PAUSED = 1 shl 2;
  VIR_DOMAIN_SAVE_RESET_NVRAM = 1 shl 3;

function virDomainSave(domain: TvirDomainPtr; to_: pchar): longint; cdecl; external libvirt;
function virDomainSaveFlags(domain: TvirDomainPtr; to_: pchar; dxml: pchar; flags: dword): longint; cdecl; external libvirt;
function virDomainSaveParams(domain: TvirDomainPtr; params: TvirTypedParameterPtr; nparams: longint; flags: dword): longint; cdecl; external libvirt;
function virDomainRestore(conn: TvirConnectPtr; from: pchar): longint; cdecl; external libvirt;
function virDomainRestoreFlags(conn: TvirConnectPtr; from: pchar; dxml: pchar; flags: dword): longint; cdecl; external libvirt;
function virDomainRestoreParams(conn: TvirConnectPtr; params: TvirTypedParameterPtr; nparams: longint; flags: dword): longint; cdecl; external libvirt;

const
  VIR_DOMAIN_SAVE_PARAM_FILE = 'file';
  VIR_DOMAIN_SAVE_PARAM_DXML = 'dxml';

function virDomainSaveImageGetXMLDesc(conn: TvirConnectPtr; file_: pchar; flags: dword): pchar; cdecl; external libvirt;
function virDomainSaveImageDefineXML(conn: TvirConnectPtr; file_: pchar; dxml: pchar; flags: dword): longint; cdecl; external libvirt;
function virDomainManagedSave(dom: TvirDomainPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainHasManagedSaveImage(dom: TvirDomainPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainManagedSaveRemove(dom: TvirDomainPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainManagedSaveGetXMLDesc(domain: TvirDomainPtr; flags: dword): pchar; cdecl; external libvirt;
function virDomainManagedSaveDefineXML(domain: TvirDomainPtr; dxml: pchar; flags: dword): longint; cdecl; external libvirt;
function virDomainCoreDump(domain: TvirDomainPtr; to_: pchar; flags: dword): longint; cdecl; external libvirt;
function virDomainCoreDumpWithFormat(domain: TvirDomainPtr; to_: pchar; dumpformat: dword; flags: dword): longint; cdecl; external libvirt;
function virDomainScreenshot(domain: TvirDomainPtr; stream: TvirStreamPtr; screen: dword; flags: dword): pchar; cdecl; external libvirt;

function virDomainGetInfo(domain: TvirDomainPtr; info: TvirDomainInfoPtr): longint; cdecl; external libvirt;
function virDomainGetState(domain: TvirDomainPtr; state: Plongint; reason: Plongint; flags: dword): longint; cdecl; external libvirt;

const
  VIR_DOMAIN_CPU_STATS_CPUTIME = 'cpu_time';
  VIR_DOMAIN_CPU_STATS_USERTIME = 'user_time';
  VIR_DOMAIN_CPU_STATS_SYSTEMTIME = 'system_time';
  VIR_DOMAIN_CPU_STATS_VCPUTIME = 'vcpu_time';

function virDomainGetCPUStats(domain: TvirDomainPtr; params: TvirTypedParameterPtr; nparams: dword; start_cpu: longint; ncpus: dword;
  flags: dword): longint; cdecl; external libvirt;
function virDomainGetControlInfo(domain: TvirDomainPtr; info: TvirDomainControlInfoPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainGetSchedulerType(domain: TvirDomainPtr; nparams: Plongint): pchar; cdecl; external libvirt;

const
  VIR_DOMAIN_BLKIO_WEIGHT = 'weight';
  VIR_DOMAIN_BLKIO_DEVICE_WEIGHT = 'device_weight';
  VIR_DOMAIN_BLKIO_DEVICE_READ_IOPS = 'device_read_iops_sec';
  VIR_DOMAIN_BLKIO_DEVICE_WRITE_IOPS = 'device_write_iops_sec';
  VIR_DOMAIN_BLKIO_DEVICE_READ_BPS = 'device_read_bytes_sec';
  VIR_DOMAIN_BLKIO_DEVICE_WRITE_BPS = 'device_write_bytes_sec';

function virDomainSetBlkioParameters(domain: TvirDomainPtr; params: TvirTypedParameterPtr; nparams: longint; flags: dword): longint; cdecl; external libvirt;
function virDomainGetBlkioParameters(domain: TvirDomainPtr; params: TvirTypedParameterPtr; nparams: Plongint; flags: dword): longint; cdecl; external libvirt;

const
  VIR_DOMAIN_MEMORY_PARAM_UNLIMITED = 9007199254740991;
  VIR_DOMAIN_MEMORY_HARD_LIMIT = 'hard_limit';
  VIR_DOMAIN_MEMORY_SOFT_LIMIT = 'soft_limit';
  VIR_DOMAIN_MEMORY_MIN_GUARANTEE = 'min_guarantee';
  VIR_DOMAIN_MEMORY_SWAP_HARD_LIMIT = 'swap_hard_limit';

function virDomainSetMemoryParameters(domain: TvirDomainPtr; params: TvirTypedParameterPtr; nparams: longint; flags: dword): longint; cdecl; external libvirt;
function virDomainGetMemoryParameters(domain: TvirDomainPtr; params: TvirTypedParameterPtr; nparams: Plongint; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainMemoryModFlags = ^TvirDomainMemoryModFlags;
  TvirDomainMemoryModFlags = longint;
const
  VIR_DOMAIN_MEM_CURRENT = VIR_DOMAIN_AFFECT_CURRENT;
  VIR_DOMAIN_MEM_LIVE = VIR_DOMAIN_AFFECT_LIVE;
  VIR_DOMAIN_MEM_CONFIG = VIR_DOMAIN_AFFECT_CONFIG;
  VIR_DOMAIN_MEM_MAXIMUM = 1 shl 2;

type
  PvirDomainNumatuneMemMode = ^TvirDomainNumatuneMemMode;
  TvirDomainNumatuneMemMode = longint;
const
  VIR_DOMAIN_NUMATUNE_MEM_STRICT = 0;
  VIR_DOMAIN_NUMATUNE_MEM_PREFERRED = 1;
  VIR_DOMAIN_NUMATUNE_MEM_INTERLEAVE = 2;
  VIR_DOMAIN_NUMATUNE_MEM_RESTRICTIVE = 3;
  VIR_DOMAIN_NUMATUNE_MEM_LAST = 4;

const
  VIR_DOMAIN_NUMA_NODESET = 'numa_nodeset';
  VIR_DOMAIN_NUMA_MODE = 'numa_mode';

function virDomainSetNumaParameters(domain: TvirDomainPtr; params: TvirTypedParameterPtr; nparams: longint; flags: dword): longint; cdecl; external libvirt;
function virDomainGetNumaParameters(domain: TvirDomainPtr; params: TvirTypedParameterPtr; nparams: Plongint; flags: dword): longint; cdecl; external libvirt;

function virDomainGetName(domain: TvirDomainPtr): pchar; cdecl; external libvirt;
function virDomainGetID(domain: TvirDomainPtr): dword; cdecl; external libvirt;
function virDomainGetUUID(domain: TvirDomainPtr; uuid: pbyte): longint; cdecl; external libvirt;
function virDomainGetUUIDString(domain: TvirDomainPtr; buf: pchar): longint; cdecl; external libvirt;
function virDomainGetOSType(domain: TvirDomainPtr): pchar; cdecl; external libvirt;
function virDomainGetMaxMemory(domain: TvirDomainPtr): dword; cdecl; external libvirt;
function virDomainSetMaxMemory(domain: TvirDomainPtr; memory: dword): longint; cdecl; external libvirt;
function virDomainSetMemory(domain: TvirDomainPtr; memory: dword): longint; cdecl; external libvirt;
function virDomainSetMemoryFlags(domain: TvirDomainPtr; memory: dword; flags: dword): longint; cdecl; external libvirt;
function virDomainSetMemoryStatsPeriod(domain: TvirDomainPtr; period: longint; flags: dword): longint; cdecl; external libvirt;
function virDomainGetMaxVcpus(domain: TvirDomainPtr): longint; cdecl; external libvirt;
function virDomainGetSecurityLabel(domain: TvirDomainPtr; seclabel: TvirSecurityLabelPtr): longint; cdecl; external libvirt;

type
  PvirDomainGetHostnameFlags = ^TvirDomainGetHostnameFlags;
  TvirDomainGetHostnameFlags = longint;
const
  VIR_DOMAIN_GET_HOSTNAME_LEASE = 1 shl 0;
  VIR_DOMAIN_GET_HOSTNAME_AGENT = 1 shl 1;

function virDomainGetHostname(domain: TvirDomainPtr; flags: dword): pchar; cdecl; external libvirt;
function virDomainGetSecurityLabelList(domain: TvirDomainPtr; seclabels: PvirSecurityLabelPtr): longint; cdecl; external libvirt;

type
  PvirDomainMetadataType = ^TvirDomainMetadataType;
  TvirDomainMetadataType = longint;
const
  VIR_DOMAIN_METADATA_DESCRIPTION = 0;
  VIR_DOMAIN_METADATA_TITLE = 1;
  VIR_DOMAIN_METADATA_ELEMENT = 2;
  VIR_DOMAIN_METADATA_LAST = 3;

function virDomainSetMetadata(domain: TvirDomainPtr; _type: longint; metadata: pchar; key: pchar; uri: pchar;
  flags: dword): longint; cdecl; external libvirt;
function virDomainGetMetadata(domain: TvirDomainPtr; _type: longint; uri: pchar; flags: dword): pchar; cdecl; external libvirt;

type
  PvirDomainXMLFlags = ^TvirDomainXMLFlags;
  TvirDomainXMLFlags = longint;
const
  VIR_DOMAIN_XML_SECURE = 1 shl 0;
  VIR_DOMAIN_XML_INACTIVE = 1 shl 1;
  VIR_DOMAIN_XML_UPDATE_CPU = 1 shl 2;
  VIR_DOMAIN_XML_MIGRATABLE = 1 shl 3;

type
  PvirDomainSaveImageXMLFlags = ^TvirDomainSaveImageXMLFlags;
  TvirDomainSaveImageXMLFlags = longint;
const
  VIR_DOMAIN_SAVE_IMAGE_XML_SECURE = VIR_DOMAIN_XML_SECURE;

function virDomainGetXMLDesc(domain: TvirDomainPtr; flags: dword): pchar; cdecl; external libvirt;
function virConnectDomainXMLFromNative(conn: TvirConnectPtr; nativeFormat: pchar; nativeConfig: pchar; flags: dword): pchar; cdecl; external libvirt;
function virConnectDomainXMLToNative(conn: TvirConnectPtr; nativeFormat: pchar; domainXml: pchar; flags: dword): pchar; cdecl; external libvirt;
function virDomainBlockStats(dom: TvirDomainPtr; disk: pchar; stats: TvirDomainBlockStatsPtr; size: Tsize_t): longint; cdecl; external libvirt;
function virDomainBlockStatsFlags(dom: TvirDomainPtr; disk: pchar; params: TvirTypedParameterPtr; nparams: Plongint; flags: dword): longint; cdecl; external libvirt;
function virDomainInterfaceStats(dom: TvirDomainPtr; device: pchar; stats: TvirDomainInterfaceStatsPtr; size: Tsize_t): longint; cdecl; external libvirt;

const
  VIR_DOMAIN_BANDWIDTH_IN_AVERAGE = 'inbound.average';
  VIR_DOMAIN_BANDWIDTH_IN_PEAK = 'inbound.peak';
  VIR_DOMAIN_BANDWIDTH_IN_BURST = 'inbound.burst';
  VIR_DOMAIN_BANDWIDTH_IN_FLOOR = 'inbound.floor';
  VIR_DOMAIN_BANDWIDTH_OUT_AVERAGE = 'outbound.average';
  VIR_DOMAIN_BANDWIDTH_OUT_PEAK = 'outbound.peak';
  VIR_DOMAIN_BANDWIDTH_OUT_BURST = 'outbound.burst';

function virDomainSetInterfaceParameters(dom: TvirDomainPtr; device: pchar; params: TvirTypedParameterPtr; nparams: longint; flags: dword): longint; cdecl; external libvirt;
function virDomainGetInterfaceParameters(dom: TvirDomainPtr; device: pchar; params: TvirTypedParameterPtr; nparams: Plongint; flags: dword): longint; cdecl; external libvirt;
function virDomainBlockPeek(dom: TvirDomainPtr; disk: pchar; offset: qword; size: Tsize_t; buffer: pointer;
  flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainBlockResizeFlags = ^TvirDomainBlockResizeFlags;
  TvirDomainBlockResizeFlags = longint;
const
  VIR_DOMAIN_BLOCK_RESIZE_BYTES = 1 shl 0;
  VIR_DOMAIN_BLOCK_RESIZE_CAPACITY = 1 shl 1;

function virDomainBlockResize(dom: TvirDomainPtr; disk: pchar; size: qword; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainBlockInfo = ^TvirDomainBlockInfo;
  TvirDomainBlockInfo = record
    capacity: qword;
    allocation: qword;
    physical: qword;
  end;
  PvirDomainBlockInfoPtr = ^TvirDomainBlockInfoPtr;
  TvirDomainBlockInfoPtr = PvirDomainBlockInfo;

function virDomainGetBlockInfo(dom: TvirDomainPtr; disk: pchar; info: TvirDomainBlockInfoPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainMemoryStats(dom: TvirDomainPtr; stats: TvirDomainMemoryStatPtr; nr_stats: dword; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainMemoryFlags = ^TvirDomainMemoryFlags;
  TvirDomainMemoryFlags = longint;
const
  VIR_MEMORY_VIRTUAL = 1 shl 0;
  VIR_MEMORY_PHYSICAL = 1 shl 1;

function virDomainMemoryPeek(dom: TvirDomainPtr; start: qword; size: Tsize_t; buffer: pointer; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainDefineFlags = ^TvirDomainDefineFlags;
  TvirDomainDefineFlags = longint;
const
  VIR_DOMAIN_DEFINE_VALIDATE = 1 shl 0;

function virDomainDefineXML(conn: TvirConnectPtr; xml: pchar): TvirDomainPtr; cdecl; external libvirt;
function virDomainDefineXMLFlags(conn: TvirConnectPtr; xml: pchar; flags: dword): TvirDomainPtr; cdecl; external libvirt;
function virDomainUndefine(domain: TvirDomainPtr): longint; cdecl; external libvirt;

type
  PvirDomainUndefineFlagsValues = ^TvirDomainUndefineFlagsValues;
  TvirDomainUndefineFlagsValues = longint;
const
  VIR_DOMAIN_UNDEFINE_MANAGED_SAVE = 1 shl 0;
  VIR_DOMAIN_UNDEFINE_SNAPSHOTS_METADATA = 1 shl 1;
  VIR_DOMAIN_UNDEFINE_NVRAM = 1 shl 2;
  VIR_DOMAIN_UNDEFINE_KEEP_NVRAM = 1 shl 3;
  VIR_DOMAIN_UNDEFINE_CHECKPOINTS_METADATA = 1 shl 4;
  VIR_DOMAIN_UNDEFINE_TPM = 1 shl 5;
  VIR_DOMAIN_UNDEFINE_KEEP_TPM = 1 shl 6;

function virDomainUndefineFlags(domain: TvirDomainPtr; flags: dword): longint; cdecl; external libvirt;
function virConnectNumOfDefinedDomains(conn: TvirConnectPtr): longint; cdecl; external libvirt;
function virConnectListDefinedDomains(conn: TvirConnectPtr; names: PPchar; maxnames: longint): longint; cdecl; external libvirt;

type
  PvirConnectListAllDomainsFlags = ^TvirConnectListAllDomainsFlags;
  TvirConnectListAllDomainsFlags = longint;
const
  VIR_CONNECT_LIST_DOMAINS_ACTIVE = 1 shl 0;
  VIR_CONNECT_LIST_DOMAINS_INACTIVE = 1 shl 1;
  VIR_CONNECT_LIST_DOMAINS_PERSISTENT = 1 shl 2;
  VIR_CONNECT_LIST_DOMAINS_TRANSIENT = 1 shl 3;
  VIR_CONNECT_LIST_DOMAINS_RUNNING = 1 shl 4;
  VIR_CONNECT_LIST_DOMAINS_PAUSED = 1 shl 5;
  VIR_CONNECT_LIST_DOMAINS_SHUTOFF = 1 shl 6;
  VIR_CONNECT_LIST_DOMAINS_OTHER = 1 shl 7;
  VIR_CONNECT_LIST_DOMAINS_MANAGEDSAVE = 1 shl 8;
  VIR_CONNECT_LIST_DOMAINS_NO_MANAGEDSAVE = 1 shl 9;
  VIR_CONNECT_LIST_DOMAINS_AUTOSTART = 1 shl 10;
  VIR_CONNECT_LIST_DOMAINS_NO_AUTOSTART = 1 shl 11;
  VIR_CONNECT_LIST_DOMAINS_HAS_SNAPSHOT = 1 shl 12;
  VIR_CONNECT_LIST_DOMAINS_NO_SNAPSHOT = 1 shl 13;
  VIR_CONNECT_LIST_DOMAINS_HAS_CHECKPOINT = 1 shl 14;
  VIR_CONNECT_LIST_DOMAINS_NO_CHECKPOINT = 1 shl 15;

function virConnectListAllDomains(conn: TvirConnectPtr; domains: PPvirDomainPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainCreate(domain: TvirDomainPtr): longint; cdecl; external libvirt;
function virDomainCreateWithFlags(domain: TvirDomainPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainCreateWithFiles(domain: TvirDomainPtr; nfiles: dword; files: Plongint; flags: dword): longint; cdecl; external libvirt;
function virDomainGetAutostart(domain: TvirDomainPtr; autostart: Plongint): longint; cdecl; external libvirt;
function virDomainSetAutostart(domain: TvirDomainPtr; autostart: longint): longint; cdecl; external libvirt;

type
  PvirVcpuState = ^TvirVcpuState;
  TvirVcpuState = longint;
const
  VIR_VCPU_OFFLINE = 0;
  VIR_VCPU_RUNNING = 1;
  VIR_VCPU_BLOCKED = 2;
  VIR_VCPU_LAST = 3;

type
  PvirVcpuHostCpuState = ^TvirVcpuHostCpuState;
  TvirVcpuHostCpuState = longint;
const
  VIR_VCPU_INFO_CPU_OFFLINE = -(1);
  VIR_VCPU_INFO_CPU_UNAVAILABLE = -(2);

type
  PvirVcpuInfo = ^TvirVcpuInfo;
  TvirVcpuInfo = record
    number: dword;
    state: longint;
    cpuTime: qword;
    cpu: longint;
  end;
  PvirVcpuInfoPtr = ^TvirVcpuInfoPtr;
  TvirVcpuInfoPtr = PvirVcpuInfo;

type
  PvirDomainVcpuFlags = ^TvirDomainVcpuFlags;
  TvirDomainVcpuFlags = longint;
const
  VIR_DOMAIN_VCPU_CURRENT = VIR_DOMAIN_AFFECT_CURRENT;
  VIR_DOMAIN_VCPU_LIVE = VIR_DOMAIN_AFFECT_LIVE;
  VIR_DOMAIN_VCPU_CONFIG = VIR_DOMAIN_AFFECT_CONFIG;
  VIR_DOMAIN_VCPU_MAXIMUM = 1 shl 2;
  VIR_DOMAIN_VCPU_GUEST = 1 shl 3;
  VIR_DOMAIN_VCPU_HOTPLUGGABLE = 1 shl 4;

function virDomainSetVcpus(domain: TvirDomainPtr; nvcpus: dword): longint; cdecl; external libvirt;
function virDomainSetVcpusFlags(domain: TvirDomainPtr; nvcpus: dword; flags: dword): longint; cdecl; external libvirt;
function virDomainGetVcpusFlags(domain: TvirDomainPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainPinVcpu(domain: TvirDomainPtr; vcpu: dword; cpumap: pbyte; maplen: longint): longint; cdecl; external libvirt;
function virDomainPinVcpuFlags(domain: TvirDomainPtr; vcpu: dword; cpumap: pbyte; maplen: longint; flags: dword): longint; cdecl; external libvirt;
function virDomainGetVcpuPinInfo(domain: TvirDomainPtr; ncpumaps: longint; cpumaps: pbyte; maplen: longint; flags: dword): longint; cdecl; external libvirt;
function virDomainPinEmulator(domain: TvirDomainPtr; cpumap: pbyte; maplen: longint; flags: dword): longint; cdecl; external libvirt;
function virDomainGetEmulatorPinInfo(domain: TvirDomainPtr; cpumaps: pbyte; maplen: longint; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainIOThreadInfo = ^TvirDomainIOThreadInfo;
  TvirDomainIOThreadInfo = record
    iothread_id: dword;
    cpumap: pbyte;
    cpumaplen: longint;
  end;
  PPvirDomainIOThreadInfoPtr = ^PvirDomainIOThreadInfoPtr;
  PvirDomainIOThreadInfoPtr = ^TvirDomainIOThreadInfoPtr;
  TvirDomainIOThreadInfoPtr = PvirDomainIOThreadInfo;

procedure virDomainIOThreadInfoFree(info: TvirDomainIOThreadInfoPtr); cdecl; external libvirt;
function virDomainGetIOThreadInfo(domain: TvirDomainPtr; info: PPvirDomainIOThreadInfoPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainPinIOThread(domain: TvirDomainPtr; iothread_id: dword; cpumap: pbyte; maplen: longint; flags: dword): longint; cdecl; external libvirt;
function virDomainAddIOThread(domain: TvirDomainPtr; iothread_id: dword; flags: dword): longint; cdecl; external libvirt;
function virDomainDelIOThread(domain: TvirDomainPtr; iothread_id: dword; flags: dword): longint; cdecl; external libvirt;

const
  VIR_DOMAIN_IOTHREAD_POLL_MAX_NS = 'poll_max_ns';
  VIR_DOMAIN_IOTHREAD_POLL_GROW = 'poll_grow';
  VIR_DOMAIN_IOTHREAD_POLL_SHRINK = 'poll_shrink';
  VIR_DOMAIN_IOTHREAD_THREAD_POOL_MIN = 'thread_pool_min';
  VIR_DOMAIN_IOTHREAD_THREAD_POOL_MAX = 'thread_pool_max';

function virDomainSetIOThreadParams(domain: TvirDomainPtr; iothread_id: dword; params: TvirTypedParameterPtr; nparams: longint; flags: dword): longint; cdecl; external libvirt;

procedure VIR_USE_CPU(cpumap: pbyte; cpu: integer);
procedure VIR_UNUSE_CPU(cpumap: pbyte; cpu: integer);
function VIR_CPU_USED(cpumap: pbyte; cpu: integer): boolean;
function VIR_CPU_MAPLEN(cpu: integer): integer;

function virDomainGetVcpus(domain: TvirDomainPtr; info: TvirVcpuInfoPtr; maxinfo: longint; cpumaps: pbyte; maplen: longint): longint; cdecl; external libvirt;

function VIR_CPU_USABLE(cpumaps: pbyte; maplen: longint; vcpu: longint; cpu: longint): longint;
function VIR_COPY_CPUMAP(cpumaps: pbyte; maplen: longint; vcpu: longint; cpumap: pbyte): longint;
function VIR_GET_CPUMAP(cpumaps: pbyte; maplen: integer; vcpu: integer): pbyte;

type
  PvirDomainDeviceModifyFlags = ^TvirDomainDeviceModifyFlags;
  TvirDomainDeviceModifyFlags = longint;
const
  VIR_DOMAIN_DEVICE_MODIFY_CURRENT = VIR_DOMAIN_AFFECT_CURRENT;
  VIR_DOMAIN_DEVICE_MODIFY_LIVE = VIR_DOMAIN_AFFECT_LIVE;
  VIR_DOMAIN_DEVICE_MODIFY_CONFIG = VIR_DOMAIN_AFFECT_CONFIG;
  VIR_DOMAIN_DEVICE_MODIFY_FORCE = 1 shl 2;

function virDomainAttachDevice(domain: TvirDomainPtr; xml: pchar): longint; cdecl; external libvirt;
function virDomainDetachDevice(domain: TvirDomainPtr; xml: pchar): longint; cdecl; external libvirt;
function virDomainAttachDeviceFlags(domain: TvirDomainPtr; xml: pchar; flags: dword): longint; cdecl; external libvirt;
function virDomainDetachDeviceFlags(domain: TvirDomainPtr; xml: pchar; flags: dword): longint; cdecl; external libvirt;
function virDomainUpdateDeviceFlags(domain: TvirDomainPtr; xml: pchar; flags: dword): longint; cdecl; external libvirt;
function virDomainDetachDeviceAlias(domain: TvirDomainPtr; alias: pchar; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainStatsRecord = ^TvirDomainStatsRecord;
  TvirDomainStatsRecord = record
    dom: TvirDomainPtr;
    params: TvirTypedParameterPtr;
    nparams: longint;
  end;
  PPvirDomainStatsRecordPtr = ^PvirDomainStatsRecordPtr;
  PvirDomainStatsRecordPtr = ^TvirDomainStatsRecordPtr;
  TvirDomainStatsRecordPtr = PvirDomainStatsRecord;

type
  PvirDomainStatsTypes = ^TvirDomainStatsTypes;
  TvirDomainStatsTypes = longint;
const
  VIR_DOMAIN_STATS_STATE = 1 shl 0;
  VIR_DOMAIN_STATS_CPU_TOTAL = 1 shl 1;
  VIR_DOMAIN_STATS_BALLOON = 1 shl 2;
  VIR_DOMAIN_STATS_VCPU = 1 shl 3;
  VIR_DOMAIN_STATS_INTERFACE = 1 shl 4;
  VIR_DOMAIN_STATS_BLOCK = 1 shl 5;
  VIR_DOMAIN_STATS_PERF = 1 shl 6;
  VIR_DOMAIN_STATS_IOTHREAD = 1 shl 7;
  VIR_DOMAIN_STATS_MEMORY = 1 shl 8;
  VIR_DOMAIN_STATS_DIRTYRATE = 1 shl 9;
  VIR_DOMAIN_STATS_VM = 1 shl 10;

type
  PvirConnectGetAllDomainStatsFlags = ^TvirConnectGetAllDomainStatsFlags;
  TvirConnectGetAllDomainStatsFlags = longint;
const
  VIR_CONNECT_GET_ALL_DOMAINS_STATS_ACTIVE = VIR_CONNECT_LIST_DOMAINS_ACTIVE;
  VIR_CONNECT_GET_ALL_DOMAINS_STATS_INACTIVE = VIR_CONNECT_LIST_DOMAINS_INACTIVE;
  VIR_CONNECT_GET_ALL_DOMAINS_STATS_PERSISTENT = VIR_CONNECT_LIST_DOMAINS_PERSISTENT;
  VIR_CONNECT_GET_ALL_DOMAINS_STATS_TRANSIENT = VIR_CONNECT_LIST_DOMAINS_TRANSIENT;
  VIR_CONNECT_GET_ALL_DOMAINS_STATS_RUNNING = VIR_CONNECT_LIST_DOMAINS_RUNNING;
  VIR_CONNECT_GET_ALL_DOMAINS_STATS_PAUSED = VIR_CONNECT_LIST_DOMAINS_PAUSED;
  VIR_CONNECT_GET_ALL_DOMAINS_STATS_SHUTOFF = VIR_CONNECT_LIST_DOMAINS_SHUTOFF;
  VIR_CONNECT_GET_ALL_DOMAINS_STATS_OTHER = VIR_CONNECT_LIST_DOMAINS_OTHER;
  VIR_CONNECT_GET_ALL_DOMAINS_STATS_NOWAIT = 1 shl 29;
  VIR_CONNECT_GET_ALL_DOMAINS_STATS_BACKING = 1 shl 30;
  VIR_CONNECT_GET_ALL_DOMAINS_STATS_ENFORCE_STATS = 1 shl 31;

function virConnectGetAllDomainStats(conn: TvirConnectPtr; stats: dword; retStats: PPvirDomainStatsRecordPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainListGetStats(doms: PvirDomainPtr; stats: dword; retStats: PPvirDomainStatsRecordPtr; flags: dword): longint; cdecl; external libvirt;
procedure virDomainStatsRecordListFree(stats: PvirDomainStatsRecordPtr); cdecl; external libvirt;

const
  VIR_PERF_PARAM_CMT = 'cmt';
  VIR_PERF_PARAM_MBMT = 'mbmt';
  VIR_PERF_PARAM_MBML = 'mbml';
  VIR_PERF_PARAM_CACHE_MISSES = 'cache_misses';
  VIR_PERF_PARAM_CACHE_REFERENCES = 'cache_references';
  VIR_PERF_PARAM_INSTRUCTIONS = 'instructions';
  VIR_PERF_PARAM_CPU_CYCLES = 'cpu_cycles';
  VIR_PERF_PARAM_BRANCH_INSTRUCTIONS = 'branch_instructions';
  VIR_PERF_PARAM_BRANCH_MISSES = 'branch_misses';
  VIR_PERF_PARAM_BUS_CYCLES = 'bus_cycles';
  VIR_PERF_PARAM_STALLED_CYCLES_FRONTEND = 'stalled_cycles_frontend';
  VIR_PERF_PARAM_STALLED_CYCLES_BACKEND = 'stalled_cycles_backend';
  VIR_PERF_PARAM_REF_CPU_CYCLES = 'ref_cpu_cycles';
  VIR_PERF_PARAM_CPU_CLOCK = 'cpu_clock';
  VIR_PERF_PARAM_TASK_CLOCK = 'task_clock';
  VIR_PERF_PARAM_PAGE_FAULTS = 'page_faults';
  VIR_PERF_PARAM_CONTEXT_SWITCHES = 'context_switches';
  VIR_PERF_PARAM_CPU_MIGRATIONS = 'cpu_migrations';
  VIR_PERF_PARAM_PAGE_FAULTS_MIN = 'page_faults_min';
  VIR_PERF_PARAM_PAGE_FAULTS_MAJ = 'page_faults_maj';
  VIR_PERF_PARAM_ALIGNMENT_FAULTS = 'alignment_faults';
  VIR_PERF_PARAM_EMULATION_FAULTS = 'emulation_faults';

function virDomainGetPerfEvents(dom: TvirDomainPtr; params: PvirTypedParameterPtr; nparams: Plongint; flags: dword): longint; cdecl; external libvirt;
function virDomainSetPerfEvents(dom: TvirDomainPtr; params: TvirTypedParameterPtr; nparams: longint; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainBlockJobType = ^TvirDomainBlockJobType;
  TvirDomainBlockJobType = longint;
const
  VIR_DOMAIN_BLOCK_JOB_TYPE_UNKNOWN = 0;
  VIR_DOMAIN_BLOCK_JOB_TYPE_PULL = 1;
  VIR_DOMAIN_BLOCK_JOB_TYPE_COPY = 2;
  VIR_DOMAIN_BLOCK_JOB_TYPE_COMMIT = 3;
  VIR_DOMAIN_BLOCK_JOB_TYPE_ACTIVE_COMMIT = 4;
  VIR_DOMAIN_BLOCK_JOB_TYPE_BACKUP = 5;
  VIR_DOMAIN_BLOCK_JOB_TYPE_LAST = 6;

type
  PvirDomainBlockJobAbortFlags = ^TvirDomainBlockJobAbortFlags;
  TvirDomainBlockJobAbortFlags = longint;
const
  VIR_DOMAIN_BLOCK_JOB_ABORT_ASYNC = 1 shl 0;
  VIR_DOMAIN_BLOCK_JOB_ABORT_PIVOT = 1 shl 1;

function virDomainBlockJobAbort(dom: TvirDomainPtr; disk: pchar; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainBlockJobInfoFlags = ^TvirDomainBlockJobInfoFlags;
  TvirDomainBlockJobInfoFlags = longint;
const
  VIR_DOMAIN_BLOCK_JOB_INFO_BANDWIDTH_BYTES = 1 shl 0;

type
  PvirDomainBlockJobCursor = ^TvirDomainBlockJobCursor;
  TvirDomainBlockJobCursor = qword;

  PvirDomainBlockJobInfo = ^TvirDomainBlockJobInfo;
  TvirDomainBlockJobInfo = record
    _type: longint;
    bandwidth: dword;
    cur: TvirDomainBlockJobCursor;
    end_: TvirDomainBlockJobCursor;
  end;
  PvirDomainBlockJobInfoPtr = ^TvirDomainBlockJobInfoPtr;
  TvirDomainBlockJobInfoPtr = PvirDomainBlockJobInfo;

function virDomainGetBlockJobInfo(dom: TvirDomainPtr; disk: pchar; info: TvirDomainBlockJobInfoPtr; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainBlockJobSetSpeedFlags = ^TvirDomainBlockJobSetSpeedFlags;
  TvirDomainBlockJobSetSpeedFlags = longint;
const
  VIR_DOMAIN_BLOCK_JOB_SPEED_BANDWIDTH_BYTES = 1 shl 0;

function virDomainBlockJobSetSpeed(dom: TvirDomainPtr; disk: pchar; bandwidth: dword; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainBlockPullFlags = ^TvirDomainBlockPullFlags;
  TvirDomainBlockPullFlags = longint;
const
  VIR_DOMAIN_BLOCK_PULL_BANDWIDTH_BYTES = 1 shl 6;

function virDomainBlockPull(dom: TvirDomainPtr; disk: pchar; bandwidth: dword; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainBlockRebaseFlags = ^TvirDomainBlockRebaseFlags;
  TvirDomainBlockRebaseFlags = longint;
const
  VIR_DOMAIN_BLOCK_REBASE_SHALLOW = 1 shl 0;
  VIR_DOMAIN_BLOCK_REBASE_REUSE_EXT = 1 shl 1;
  VIR_DOMAIN_BLOCK_REBASE_COPY_RAW = 1 shl 2;
  VIR_DOMAIN_BLOCK_REBASE_COPY = 1 shl 3;
  VIR_DOMAIN_BLOCK_REBASE_RELATIVE = 1 shl 4;
  VIR_DOMAIN_BLOCK_REBASE_COPY_DEV = 1 shl 5;
  VIR_DOMAIN_BLOCK_REBASE_BANDWIDTH_BYTES = 1 shl 6;

function virDomainBlockRebase(dom: TvirDomainPtr; disk: pchar; base: pchar; bandwidth: dword; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainBlockCopyFlags = ^TvirDomainBlockCopyFlags;
  TvirDomainBlockCopyFlags = longint;
const
  VIR_DOMAIN_BLOCK_COPY_SHALLOW = 1 shl 0;
  VIR_DOMAIN_BLOCK_COPY_REUSE_EXT = 1 shl 1;
  VIR_DOMAIN_BLOCK_COPY_TRANSIENT_JOB = 1 shl 2;
  VIR_DOMAIN_BLOCK_COPY_SYNCHRONOUS_WRITES = 1 shl 3;

const
  VIR_DOMAIN_BLOCK_COPY_BANDWIDTH = 'bandwidth';
  VIR_DOMAIN_BLOCK_COPY_GRANULARITY = 'granularity';
  VIR_DOMAIN_BLOCK_COPY_BUF_SIZE = 'buf-size';

function virDomainBlockCopy(dom: TvirDomainPtr; disk: pchar; destxml: pchar; params: TvirTypedParameterPtr; nparams: longint;
  flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainBlockCommitFlags = ^TvirDomainBlockCommitFlags;
  TvirDomainBlockCommitFlags = longint;
const
  VIR_DOMAIN_BLOCK_COMMIT_SHALLOW = 1 shl 0;
  VIR_DOMAIN_BLOCK_COMMIT_DELETE = 1 shl 1;
  VIR_DOMAIN_BLOCK_COMMIT_ACTIVE = 1 shl 2;
  VIR_DOMAIN_BLOCK_COMMIT_RELATIVE = 1 shl 3;
  VIR_DOMAIN_BLOCK_COMMIT_BANDWIDTH_BYTES = 1 shl 4;

function virDomainBlockCommit(dom: TvirDomainPtr; disk: pchar; base: pchar; top: pchar; bandwidth: dword;
  flags: dword): longint; cdecl; external libvirt;

const
  VIR_DOMAIN_BLOCK_IOTUNE_TOTAL_BYTES_SEC = 'total_bytes_sec';
  VIR_DOMAIN_BLOCK_IOTUNE_READ_BYTES_SEC = 'read_bytes_sec';
  VIR_DOMAIN_BLOCK_IOTUNE_WRITE_BYTES_SEC = 'write_bytes_sec';
  VIR_DOMAIN_BLOCK_IOTUNE_TOTAL_IOPS_SEC = 'total_iops_sec';
  VIR_DOMAIN_BLOCK_IOTUNE_READ_IOPS_SEC = 'read_iops_sec';
  VIR_DOMAIN_BLOCK_IOTUNE_WRITE_IOPS_SEC = 'write_iops_sec';
  VIR_DOMAIN_BLOCK_IOTUNE_TOTAL_BYTES_SEC_MAX = 'total_bytes_sec_max';
  VIR_DOMAIN_BLOCK_IOTUNE_READ_BYTES_SEC_MAX = 'read_bytes_sec_max';
  VIR_DOMAIN_BLOCK_IOTUNE_WRITE_BYTES_SEC_MAX = 'write_bytes_sec_max';
  VIR_DOMAIN_BLOCK_IOTUNE_TOTAL_IOPS_SEC_MAX = 'total_iops_sec_max';
  VIR_DOMAIN_BLOCK_IOTUNE_READ_IOPS_SEC_MAX = 'read_iops_sec_max';
  VIR_DOMAIN_BLOCK_IOTUNE_WRITE_IOPS_SEC_MAX = 'write_iops_sec_max';
  VIR_DOMAIN_BLOCK_IOTUNE_TOTAL_BYTES_SEC_MAX_LENGTH = 'total_bytes_sec_max_length';
  VIR_DOMAIN_BLOCK_IOTUNE_READ_BYTES_SEC_MAX_LENGTH = 'read_bytes_sec_max_length';
  VIR_DOMAIN_BLOCK_IOTUNE_WRITE_BYTES_SEC_MAX_LENGTH = 'write_bytes_sec_max_length';
  VIR_DOMAIN_BLOCK_IOTUNE_TOTAL_IOPS_SEC_MAX_LENGTH = 'total_iops_sec_max_length';
  VIR_DOMAIN_BLOCK_IOTUNE_READ_IOPS_SEC_MAX_LENGTH = 'read_iops_sec_max_length';
  VIR_DOMAIN_BLOCK_IOTUNE_WRITE_IOPS_SEC_MAX_LENGTH = 'write_iops_sec_max_length';
  VIR_DOMAIN_BLOCK_IOTUNE_SIZE_IOPS_SEC = 'size_iops_sec';
  VIR_DOMAIN_BLOCK_IOTUNE_GROUP_NAME = 'group_name';

function virDomainSetBlockIoTune(dom: TvirDomainPtr; disk: pchar; params: TvirTypedParameterPtr; nparams: longint; flags: dword): longint; cdecl; external libvirt;
function virDomainGetBlockIoTune(dom: TvirDomainPtr; disk: pchar; params: TvirTypedParameterPtr; nparams: Plongint; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainDiskErrorCode = ^TvirDomainDiskErrorCode;
  TvirDomainDiskErrorCode = longint;
const
  VIR_DOMAIN_DISK_ERROR_NONE = 0;
  VIR_DOMAIN_DISK_ERROR_UNSPEC = 1;
  VIR_DOMAIN_DISK_ERROR_NO_SPACE = 2;
  VIR_DOMAIN_DISK_ERROR_LAST = 3;

type
  PvirDomainDiskError = ^TvirDomainDiskError;
  TvirDomainDiskError = record
    disk: pchar;
    error: longint;
  end;
  PvirDomainDiskErrorPtr = ^TvirDomainDiskErrorPtr;
  TvirDomainDiskErrorPtr = PvirDomainDiskError;

function virDomainGetDiskErrors(dom: TvirDomainPtr; errors: TvirDomainDiskErrorPtr; maxerrors: dword; flags: dword): longint; cdecl; external libvirt;

type
  PvirKeycodeSet = ^TvirKeycodeSet;
  TvirKeycodeSet = longint;
const
  VIR_KEYCODE_SET_LINUX = 0;
  VIR_KEYCODE_SET_XT = 1;
  VIR_KEYCODE_SET_ATSET1 = 2;
  VIR_KEYCODE_SET_ATSET2 = 3;
  VIR_KEYCODE_SET_ATSET3 = 4;
  VIR_KEYCODE_SET_OSX = 5;
  VIR_KEYCODE_SET_XT_KBD = 6;
  VIR_KEYCODE_SET_USB = 7;
  VIR_KEYCODE_SET_WIN32 = 8;
  VIR_KEYCODE_SET_QNUM = 9;
  VIR_KEYCODE_SET_LAST = 10;

const
  VIR_KEYCODE_SET_RFB = VIR_KEYCODE_SET_QNUM;
  VIR_DOMAIN_SEND_KEY_MAX_KEYS = 16;

function virDomainSendKey(domain: TvirDomainPtr; codeset: dword; holdtime: dword; keycodes: Pdword; nkeycodes: longint;
  flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainProcessSignal = ^TvirDomainProcessSignal;
  TvirDomainProcessSignal = longint;
const
  VIR_DOMAIN_PROCESS_SIGNAL_NOP = 0;
  VIR_DOMAIN_PROCESS_SIGNAL_HUP = 1;
  VIR_DOMAIN_PROCESS_SIGNAL_INT = 2;
  VIR_DOMAIN_PROCESS_SIGNAL_QUIT = 3;
  VIR_DOMAIN_PROCESS_SIGNAL_ILL = 4;
  VIR_DOMAIN_PROCESS_SIGNAL_TRAP = 5;
  VIR_DOMAIN_PROCESS_SIGNAL_ABRT = 6;
  VIR_DOMAIN_PROCESS_SIGNAL_BUS = 7;
  VIR_DOMAIN_PROCESS_SIGNAL_FPE = 8;
  VIR_DOMAIN_PROCESS_SIGNAL_KILL = 9;
  VIR_DOMAIN_PROCESS_SIGNAL_USR1 = 10;
  VIR_DOMAIN_PROCESS_SIGNAL_SEGV = 11;
  VIR_DOMAIN_PROCESS_SIGNAL_USR2 = 12;
  VIR_DOMAIN_PROCESS_SIGNAL_PIPE = 13;
  VIR_DOMAIN_PROCESS_SIGNAL_ALRM = 14;
  VIR_DOMAIN_PROCESS_SIGNAL_TERM = 15;
  VIR_DOMAIN_PROCESS_SIGNAL_STKFLT = 16;
  VIR_DOMAIN_PROCESS_SIGNAL_CHLD = 17;
  VIR_DOMAIN_PROCESS_SIGNAL_CONT = 18;
  VIR_DOMAIN_PROCESS_SIGNAL_STOP = 19;
  VIR_DOMAIN_PROCESS_SIGNAL_TSTP = 20;
  VIR_DOMAIN_PROCESS_SIGNAL_TTIN = 21;
  VIR_DOMAIN_PROCESS_SIGNAL_TTOU = 22;
  VIR_DOMAIN_PROCESS_SIGNAL_URG = 23;
  VIR_DOMAIN_PROCESS_SIGNAL_XCPU = 24;
  VIR_DOMAIN_PROCESS_SIGNAL_XFSZ = 25;
  VIR_DOMAIN_PROCESS_SIGNAL_VTALRM = 26;
  VIR_DOMAIN_PROCESS_SIGNAL_PROF = 27;
  VIR_DOMAIN_PROCESS_SIGNAL_WINCH = 28;
  VIR_DOMAIN_PROCESS_SIGNAL_POLL = 29;
  VIR_DOMAIN_PROCESS_SIGNAL_PWR = 30;
  VIR_DOMAIN_PROCESS_SIGNAL_SYS = 31;
  VIR_DOMAIN_PROCESS_SIGNAL_RT0 = 32;
  VIR_DOMAIN_PROCESS_SIGNAL_RT1 = 33;
  VIR_DOMAIN_PROCESS_SIGNAL_RT2 = 34;
  VIR_DOMAIN_PROCESS_SIGNAL_RT3 = 35;
  VIR_DOMAIN_PROCESS_SIGNAL_RT4 = 36;
  VIR_DOMAIN_PROCESS_SIGNAL_RT5 = 37;
  VIR_DOMAIN_PROCESS_SIGNAL_RT6 = 38;
  VIR_DOMAIN_PROCESS_SIGNAL_RT7 = 39;
  VIR_DOMAIN_PROCESS_SIGNAL_RT8 = 40;
  VIR_DOMAIN_PROCESS_SIGNAL_RT9 = 41;
  VIR_DOMAIN_PROCESS_SIGNAL_RT10 = 42;
  VIR_DOMAIN_PROCESS_SIGNAL_RT11 = 43;
  VIR_DOMAIN_PROCESS_SIGNAL_RT12 = 44;
  VIR_DOMAIN_PROCESS_SIGNAL_RT13 = 45;
  VIR_DOMAIN_PROCESS_SIGNAL_RT14 = 46;
  VIR_DOMAIN_PROCESS_SIGNAL_RT15 = 47;
  VIR_DOMAIN_PROCESS_SIGNAL_RT16 = 48;
  VIR_DOMAIN_PROCESS_SIGNAL_RT17 = 49;
  VIR_DOMAIN_PROCESS_SIGNAL_RT18 = 50;
  VIR_DOMAIN_PROCESS_SIGNAL_RT19 = 51;
  VIR_DOMAIN_PROCESS_SIGNAL_RT20 = 52;
  VIR_DOMAIN_PROCESS_SIGNAL_RT21 = 53;
  VIR_DOMAIN_PROCESS_SIGNAL_RT22 = 54;
  VIR_DOMAIN_PROCESS_SIGNAL_RT23 = 55;
  VIR_DOMAIN_PROCESS_SIGNAL_RT24 = 56;
  VIR_DOMAIN_PROCESS_SIGNAL_RT25 = 57;
  VIR_DOMAIN_PROCESS_SIGNAL_RT26 = 58;
  VIR_DOMAIN_PROCESS_SIGNAL_RT27 = 59;
  VIR_DOMAIN_PROCESS_SIGNAL_RT28 = 60;
  VIR_DOMAIN_PROCESS_SIGNAL_RT29 = 61;
  VIR_DOMAIN_PROCESS_SIGNAL_RT30 = 62;
  VIR_DOMAIN_PROCESS_SIGNAL_RT31 = 63;
  VIR_DOMAIN_PROCESS_SIGNAL_RT32 = 64;
  VIR_DOMAIN_PROCESS_SIGNAL_LAST = 65;


function virDomainSendProcessSignal(domain: TvirDomainPtr; pid_value: int64; signum: dword; flags: dword): longint; cdecl; external libvirt;
function virDomainCreateLinux(conn: TvirConnectPtr; xmlDesc: pchar; flags: dword): TvirDomainPtr; cdecl; external libvirt;

type
  PvirDomainEventType = ^TvirDomainEventType;
  TvirDomainEventType = longint;
const
  VIR_DOMAIN_EVENT_DEFINED = 0;
  VIR_DOMAIN_EVENT_UNDEFINED = 1;
  VIR_DOMAIN_EVENT_STARTED = 2;
  VIR_DOMAIN_EVENT_SUSPENDED = 3;
  VIR_DOMAIN_EVENT_RESUMED = 4;
  VIR_DOMAIN_EVENT_STOPPED = 5;
  VIR_DOMAIN_EVENT_SHUTDOWN = 6;
  VIR_DOMAIN_EVENT_PMSUSPENDED = 7;
  VIR_DOMAIN_EVENT_CRASHED = 8;
  VIR_DOMAIN_EVENT_LAST = 9;

type
  PvirDomainEventDefinedDetailType = ^TvirDomainEventDefinedDetailType;
  TvirDomainEventDefinedDetailType = longint;
const
  VIR_DOMAIN_EVENT_DEFINED_ADDED = 0;
  VIR_DOMAIN_EVENT_DEFINED_UPDATED = 1;
  VIR_DOMAIN_EVENT_DEFINED_RENAMED = 2;
  VIR_DOMAIN_EVENT_DEFINED_FROM_SNAPSHOT = 3;
  VIR_DOMAIN_EVENT_DEFINED_LAST = 4;

type
  PvirDomainEventUndefinedDetailType = ^TvirDomainEventUndefinedDetailType;
  TvirDomainEventUndefinedDetailType = longint;
const
  VIR_DOMAIN_EVENT_UNDEFINED_REMOVED = 0;
  VIR_DOMAIN_EVENT_UNDEFINED_RENAMED = 1;
  VIR_DOMAIN_EVENT_UNDEFINED_LAST = 2;

type
  PvirDomainEventStartedDetailType = ^TvirDomainEventStartedDetailType;
  TvirDomainEventStartedDetailType = longint;
const
  VIR_DOMAIN_EVENT_STARTED_BOOTED = 0;
  VIR_DOMAIN_EVENT_STARTED_MIGRATED = 1;
  VIR_DOMAIN_EVENT_STARTED_RESTORED = 2;
  VIR_DOMAIN_EVENT_STARTED_FROM_SNAPSHOT = 3;
  VIR_DOMAIN_EVENT_STARTED_WAKEUP = 4;
  VIR_DOMAIN_EVENT_STARTED_LAST = 5;

type
  PvirDomainEventSuspendedDetailType = ^TvirDomainEventSuspendedDetailType;
  TvirDomainEventSuspendedDetailType = longint;
const
  VIR_DOMAIN_EVENT_SUSPENDED_PAUSED = 0;
  VIR_DOMAIN_EVENT_SUSPENDED_MIGRATED = 1;
  VIR_DOMAIN_EVENT_SUSPENDED_IOERROR = 2;
  VIR_DOMAIN_EVENT_SUSPENDED_WATCHDOG = 3;
  VIR_DOMAIN_EVENT_SUSPENDED_RESTORED = 4;
  VIR_DOMAIN_EVENT_SUSPENDED_FROM_SNAPSHOT = 5;
  VIR_DOMAIN_EVENT_SUSPENDED_API_ERROR = 6;
  VIR_DOMAIN_EVENT_SUSPENDED_POSTCOPY = 7;
  VIR_DOMAIN_EVENT_SUSPENDED_POSTCOPY_FAILED = 8;
  VIR_DOMAIN_EVENT_SUSPENDED_LAST = 9;

type
  PvirDomainEventResumedDetailType = ^TvirDomainEventResumedDetailType;
  TvirDomainEventResumedDetailType = longint;
const
  VIR_DOMAIN_EVENT_RESUMED_UNPAUSED = 0;
  VIR_DOMAIN_EVENT_RESUMED_MIGRATED = 1;
  VIR_DOMAIN_EVENT_RESUMED_FROM_SNAPSHOT = 2;
  VIR_DOMAIN_EVENT_RESUMED_POSTCOPY = 3;
  VIR_DOMAIN_EVENT_RESUMED_POSTCOPY_FAILED = 4;
  VIR_DOMAIN_EVENT_RESUMED_LAST = 5;

type
  PvirDomainEventStoppedDetailType = ^TvirDomainEventStoppedDetailType;
  TvirDomainEventStoppedDetailType = longint;
const
  VIR_DOMAIN_EVENT_STOPPED_SHUTDOWN = 0;
  VIR_DOMAIN_EVENT_STOPPED_DESTROYED = 1;
  VIR_DOMAIN_EVENT_STOPPED_CRASHED = 2;
  VIR_DOMAIN_EVENT_STOPPED_MIGRATED = 3;
  VIR_DOMAIN_EVENT_STOPPED_SAVED = 4;
  VIR_DOMAIN_EVENT_STOPPED_FAILED = 5;
  VIR_DOMAIN_EVENT_STOPPED_FROM_SNAPSHOT = 6;
  VIR_DOMAIN_EVENT_STOPPED_LAST = 7;

type
  PvirDomainEventShutdownDetailType = ^TvirDomainEventShutdownDetailType;
  TvirDomainEventShutdownDetailType = longint;
const
  VIR_DOMAIN_EVENT_SHUTDOWN_FINISHED = 0;
  VIR_DOMAIN_EVENT_SHUTDOWN_GUEST = 1;
  VIR_DOMAIN_EVENT_SHUTDOWN_HOST = 2;
  VIR_DOMAIN_EVENT_SHUTDOWN_LAST = 3;

type
  PvirDomainEventPMSuspendedDetailType = ^TvirDomainEventPMSuspendedDetailType;
  TvirDomainEventPMSuspendedDetailType = longint;
const
  VIR_DOMAIN_EVENT_PMSUSPENDED_MEMORY = 0;
  VIR_DOMAIN_EVENT_PMSUSPENDED_DISK = 1;
  VIR_DOMAIN_EVENT_PMSUSPENDED_LAST = 2;

type
  PvirDomainEventCrashedDetailType = ^TvirDomainEventCrashedDetailType;
  TvirDomainEventCrashedDetailType = longint;
const
  VIR_DOMAIN_EVENT_CRASHED_PANICKED = 0;
  VIR_DOMAIN_EVENT_CRASHED_CRASHLOADED = 1;
  VIR_DOMAIN_EVENT_CRASHED_LAST = 2;

type
  PvirDomainMemoryFailureRecipientType = ^TvirDomainMemoryFailureRecipientType;
  TvirDomainMemoryFailureRecipientType = longint;
const
  VIR_DOMAIN_EVENT_MEMORY_FAILURE_RECIPIENT_HYPERVISOR = 0;
  VIR_DOMAIN_EVENT_MEMORY_FAILURE_RECIPIENT_GUEST = 1;
  VIR_DOMAIN_EVENT_MEMORY_FAILURE_RECIPIENT_LAST = 2;

type
  PvirDomainMemoryFailureActionType = ^TvirDomainMemoryFailureActionType;
  TvirDomainMemoryFailureActionType = longint;
const
  VIR_DOMAIN_EVENT_MEMORY_FAILURE_ACTION_IGNORE = 0;
  VIR_DOMAIN_EVENT_MEMORY_FAILURE_ACTION_INJECT = 1;
  VIR_DOMAIN_EVENT_MEMORY_FAILURE_ACTION_FATAL = 2;
  VIR_DOMAIN_EVENT_MEMORY_FAILURE_ACTION_RESET = 3;
  VIR_DOMAIN_EVENT_MEMORY_FAILURE_ACTION_LAST = 4;

type
  PvirDomainMemoryFailureFlags = ^TvirDomainMemoryFailureFlags;
  TvirDomainMemoryFailureFlags = longint;
const
  VIR_DOMAIN_MEMORY_FAILURE_ACTION_REQUIRED = 1 shl 0;
  VIR_DOMAIN_MEMORY_FAILURE_RECURSIVE = 1 shl 1;

type
  TvirConnectDomainEventCallback = function(conn: TvirConnectPtr; dom: TvirDomainPtr; event: longint; detail: longint; opaque: pointer): longint; cdecl;

function virConnectDomainEventRegister(conn: TvirConnectPtr; cb: TvirConnectDomainEventCallback; opaque: pointer; freecb: TvirFreeCallback): longint; cdecl; external libvirt;
function virConnectDomainEventDeregister(conn: TvirConnectPtr; cb: TvirConnectDomainEventCallback): longint; cdecl; external libvirt;
function virDomainIsActive(dom: TvirDomainPtr): longint; cdecl; external libvirt;
function virDomainIsPersistent(dom: TvirDomainPtr): longint; cdecl; external libvirt;
function virDomainIsUpdated(dom: TvirDomainPtr): longint; cdecl; external libvirt;

type
  PvirDomainJobType = ^TvirDomainJobType;
  TvirDomainJobType = longint;
const
  VIR_DOMAIN_JOB_NONE = 0;
  VIR_DOMAIN_JOB_BOUNDED = 1;
  VIR_DOMAIN_JOB_UNBOUNDED = 2;
  VIR_DOMAIN_JOB_COMPLETED = 3;
  VIR_DOMAIN_JOB_FAILED = 4;
  VIR_DOMAIN_JOB_CANCELLED = 5;
  VIR_DOMAIN_JOB_LAST = 6;

type
  PvirDomainJobInfo = ^TvirDomainJobInfo;
  TvirDomainJobInfo = record
    _type: longint;
    timeElapsed: qword;
    timeRemaining: qword;
    dataTotal: qword;
    dataProcessed: qword;
    dataRemaining: qword;
    memTotal: qword;
    memProcessed: qword;
    memRemaining: qword;
    fileTotal: qword;
    fileProcessed: qword;
    fileRemaining: qword;
  end;
  PvirDomainJobInfoPtr = ^TvirDomainJobInfoPtr;
  TvirDomainJobInfoPtr = PvirDomainJobInfo;

type
  PvirDomainGetJobStatsFlags = ^TvirDomainGetJobStatsFlags;
  TvirDomainGetJobStatsFlags = longint;
const
  VIR_DOMAIN_JOB_STATS_COMPLETED = 1 shl 0;
  VIR_DOMAIN_JOB_STATS_KEEP_COMPLETED = 1 shl 1;

function virDomainGetJobInfo(dom: TvirDomainPtr; info: TvirDomainJobInfoPtr): longint; cdecl; external libvirt;
function virDomainGetJobStats(domain: TvirDomainPtr; _type: Plongint; params: PvirTypedParameterPtr; nparams: Plongint; flags: dword): longint; cdecl; external libvirt;
function virDomainAbortJob(dom: TvirDomainPtr): longint; cdecl; external libvirt;

type
  PvirDomainAbortJobFlagsValues = ^TvirDomainAbortJobFlagsValues;
  TvirDomainAbortJobFlagsValues = longint;
const
  VIR_DOMAIN_ABORT_JOB_POSTCOPY = 1 shl 0;

function virDomainAbortJobFlags(dom: TvirDomainPtr; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainJobOperation = ^TvirDomainJobOperation;
  TvirDomainJobOperation = longint;
const
  VIR_DOMAIN_JOB_OPERATION_UNKNOWN = 0;
  VIR_DOMAIN_JOB_OPERATION_START = 1;
  VIR_DOMAIN_JOB_OPERATION_SAVE = 2;
  VIR_DOMAIN_JOB_OPERATION_RESTORE = 3;
  VIR_DOMAIN_JOB_OPERATION_MIGRATION_IN = 4;
  VIR_DOMAIN_JOB_OPERATION_MIGRATION_OUT = 5;
  VIR_DOMAIN_JOB_OPERATION_SNAPSHOT = 6;
  VIR_DOMAIN_JOB_OPERATION_SNAPSHOT_REVERT = 7;
  VIR_DOMAIN_JOB_OPERATION_DUMP = 8;
  VIR_DOMAIN_JOB_OPERATION_BACKUP = 9;
  VIR_DOMAIN_JOB_OPERATION_SNAPSHOT_DELETE = 10;
  VIR_DOMAIN_JOB_OPERATION_LAST = 11;

const
  VIR_DOMAIN_JOB_OPERATION = 'operation';
  VIR_DOMAIN_JOB_TIME_ELAPSED = 'time_elapsed';
  VIR_DOMAIN_JOB_TIME_ELAPSED_NET = 'time_elapsed_net';
  VIR_DOMAIN_JOB_TIME_REMAINING = 'time_remaining';
  VIR_DOMAIN_JOB_DOWNTIME = 'downtime';
  VIR_DOMAIN_JOB_DOWNTIME_NET = 'downtime_net';
  VIR_DOMAIN_JOB_SETUP_TIME = 'setup_time';
  VIR_DOMAIN_JOB_DATA_TOTAL = 'data_total';
  VIR_DOMAIN_JOB_DATA_PROCESSED = 'data_processed';
  VIR_DOMAIN_JOB_DATA_REMAINING = 'data_remaining';
  VIR_DOMAIN_JOB_MEMORY_TOTAL = 'memory_total';
  VIR_DOMAIN_JOB_MEMORY_PROCESSED = 'memory_processed';
  VIR_DOMAIN_JOB_MEMORY_REMAINING = 'memory_remaining';
  VIR_DOMAIN_JOB_MEMORY_CONSTANT = 'memory_constant';
  VIR_DOMAIN_JOB_MEMORY_NORMAL = 'memory_normal';
  VIR_DOMAIN_JOB_MEMORY_NORMAL_BYTES = 'memory_normal_bytes';
  VIR_DOMAIN_JOB_MEMORY_BPS = 'memory_bps';
  VIR_DOMAIN_JOB_MEMORY_DIRTY_RATE = 'memory_dirty_rate';
  VIR_DOMAIN_JOB_MEMORY_PAGE_SIZE = 'memory_page_size';
  VIR_DOMAIN_JOB_MEMORY_ITERATION = 'memory_iteration';
  VIR_DOMAIN_JOB_MEMORY_POSTCOPY_REQS = 'memory_postcopy_requests';
  VIR_DOMAIN_JOB_DISK_TOTAL = 'disk_total';
  VIR_DOMAIN_JOB_DISK_PROCESSED = 'disk_processed';
  VIR_DOMAIN_JOB_DISK_REMAINING = 'disk_remaining';
  VIR_DOMAIN_JOB_DISK_BPS = 'disk_bps';
  VIR_DOMAIN_JOB_COMPRESSION_CACHE = 'compression_cache';
  VIR_DOMAIN_JOB_COMPRESSION_BYTES = 'compression_bytes';
  VIR_DOMAIN_JOB_COMPRESSION_PAGES = 'compression_pages';
  VIR_DOMAIN_JOB_COMPRESSION_CACHE_MISSES = 'compression_cache_misses';
  VIR_DOMAIN_JOB_COMPRESSION_OVERFLOW = 'compression_overflow';
  VIR_DOMAIN_JOB_AUTO_CONVERGE_THROTTLE = 'auto_converge_throttle';
  VIR_DOMAIN_JOB_SUCCESS = 'success';
  VIR_DOMAIN_JOB_ERRMSG = 'errmsg';
  VIR_DOMAIN_JOB_DISK_TEMP_USED = 'disk_temp_used';
  VIR_DOMAIN_JOB_DISK_TEMP_TOTAL = 'disk_temp_total';

type
  TvirConnectDomainEventGenericCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; opaque: pointer); cdecl;
  TvirConnectDomainEventRTCChangeCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; utcoffset: int64; opaque: pointer); cdecl;

type
  PvirDomainEventWatchdogAction = ^TvirDomainEventWatchdogAction;
  TvirDomainEventWatchdogAction = longint;
const
  VIR_DOMAIN_EVENT_WATCHDOG_NONE = 0;
  VIR_DOMAIN_EVENT_WATCHDOG_PAUSE = 1;
  VIR_DOMAIN_EVENT_WATCHDOG_RESET = 2;
  VIR_DOMAIN_EVENT_WATCHDOG_POWEROFF = 3;
  VIR_DOMAIN_EVENT_WATCHDOG_SHUTDOWN = 4;
  VIR_DOMAIN_EVENT_WATCHDOG_DEBUG = 5;
  VIR_DOMAIN_EVENT_WATCHDOG_INJECTNMI = 6;
  VIR_DOMAIN_EVENT_WATCHDOG_LAST = 7;

type
  TvirConnectDomainEventWatchdogCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; action: longint; opaque: pointer); cdecl;

type
  PvirDomainEventIOErrorAction = ^TvirDomainEventIOErrorAction;
  TvirDomainEventIOErrorAction = longint;
const
  VIR_DOMAIN_EVENT_IO_ERROR_NONE = 0;
  VIR_DOMAIN_EVENT_IO_ERROR_PAUSE = 1;
  VIR_DOMAIN_EVENT_IO_ERROR_REPORT = 2;
  VIR_DOMAIN_EVENT_IO_ERROR_LAST = 3;

type
  TvirConnectDomainEventIOErrorCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; srcPath: pchar; devAlias: pchar; action: longint; opaque: pointer); cdecl;
  TvirConnectDomainEventIOErrorReasonCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; srcPath: pchar; devAlias: pchar; action: longint; reason: pchar; opaque: pointer); cdecl;

type
  PvirDomainEventGraphicsPhase = ^TvirDomainEventGraphicsPhase;
  TvirDomainEventGraphicsPhase = longint;
const
  VIR_DOMAIN_EVENT_GRAPHICS_CONNECT = 0;
  VIR_DOMAIN_EVENT_GRAPHICS_INITIALIZE = 1;
  VIR_DOMAIN_EVENT_GRAPHICS_DISCONNECT = 2;
  VIR_DOMAIN_EVENT_GRAPHICS_LAST = 3;

type
  PvirDomainEventGraphicsAddressType = ^TvirDomainEventGraphicsAddressType;
  TvirDomainEventGraphicsAddressType = longint;
const
  VIR_DOMAIN_EVENT_GRAPHICS_ADDRESS_IPV4 = 0;
  VIR_DOMAIN_EVENT_GRAPHICS_ADDRESS_IPV6 = 1;
  VIR_DOMAIN_EVENT_GRAPHICS_ADDRESS_UNIX = 2;
  VIR_DOMAIN_EVENT_GRAPHICS_ADDRESS_LAST = 3;

type
  PvirDomainEventGraphicsAddress = ^TvirDomainEventGraphicsAddress;
  TvirDomainEventGraphicsAddress = record
    family: longint;
    node: pchar;
    service: pchar;
  end;
  PvirDomainEventGraphicsAddressPtr = ^TvirDomainEventGraphicsAddressPtr;
  TvirDomainEventGraphicsAddressPtr = PvirDomainEventGraphicsAddress;

  PvirDomainEventGraphicsSubjectIdentity = ^TvirDomainEventGraphicsSubjectIdentity;
  TvirDomainEventGraphicsSubjectIdentity = record
    _type: pchar;
    name: pchar;
  end;
  PvirDomainEventGraphicsSubjectIdentityPtr = ^TvirDomainEventGraphicsSubjectIdentityPtr;
  TvirDomainEventGraphicsSubjectIdentityPtr = PvirDomainEventGraphicsSubjectIdentity;

  PvirDomainEventGraphicsSubject = ^TvirDomainEventGraphicsSubject;
  TvirDomainEventGraphicsSubject = record
    nidentity: longint;
    identities: TvirDomainEventGraphicsSubjectIdentityPtr;
  end;
  PvirDomainEventGraphicsSubjectPtr = ^TvirDomainEventGraphicsSubjectPtr;
  TvirDomainEventGraphicsSubjectPtr = PvirDomainEventGraphicsSubject;

  TvirConnectDomainEventGraphicsCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; phase: longint; local: PvirDomainEventGraphicsAddress; remote: PvirDomainEventGraphicsAddress; authScheme: pchar; subject: PvirDomainEventGraphicsSubject; opaque: pointer); cdecl;

type
  PvirConnectDomainEventBlockJobStatus = ^TvirConnectDomainEventBlockJobStatus;
  TvirConnectDomainEventBlockJobStatus = longint;
const
  VIR_DOMAIN_BLOCK_JOB_COMPLETED = 0;
  VIR_DOMAIN_BLOCK_JOB_FAILED = 1;
  VIR_DOMAIN_BLOCK_JOB_CANCELED = 2;
  VIR_DOMAIN_BLOCK_JOB_READY = 3;
  VIR_DOMAIN_BLOCK_JOB_LAST = 4;

type
  TvirConnectDomainEventBlockJobCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; disk: pchar; _type: longint; status: longint; opaque: pointer); cdecl;

type
  PvirConnectDomainEventDiskChangeReason = ^TvirConnectDomainEventDiskChangeReason;
  TvirConnectDomainEventDiskChangeReason = longint;
const
  VIR_DOMAIN_EVENT_DISK_CHANGE_MISSING_ON_START = 0;
  VIR_DOMAIN_EVENT_DISK_DROP_MISSING_ON_START = 1;
  VIR_DOMAIN_EVENT_DISK_CHANGE_LAST = 2;

type
  TvirConnectDomainEventDiskChangeCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; oldSrcPath: pchar; newSrcPath: pchar; devAlias: pchar; reason: longint; opaque: pointer); cdecl;

type
  PvirDomainEventTrayChangeReason = ^TvirDomainEventTrayChangeReason;
  TvirDomainEventTrayChangeReason = longint;
const
  VIR_DOMAIN_EVENT_TRAY_CHANGE_OPEN = 0;
  VIR_DOMAIN_EVENT_TRAY_CHANGE_CLOSE = 1;
  VIR_DOMAIN_EVENT_TRAY_CHANGE_LAST = 2;

type
  TvirConnectDomainEventTrayChangeCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; devAlias: pchar; reason: longint; opaque: pointer); cdecl;
  TvirConnectDomainEventPMWakeupCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; reason: longint; opaque: pointer); cdecl;
  TvirConnectDomainEventPMSuspendCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; reason: longint; opaque: pointer); cdecl;
  TvirConnectDomainEventBalloonChangeCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; actual: qword; opaque: pointer); cdecl;
  TvirConnectDomainEventPMSuspendDiskCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; reason: longint; opaque: pointer); cdecl;
  TvirConnectDomainEventDeviceRemovedCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; devAlias: pchar; opaque: pointer); cdecl;
  TvirConnectDomainEventDeviceAddedCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; devAlias: pchar; opaque: pointer); cdecl;
  TvirConnectDomainEventDeviceRemovalFailedCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; devAlias: pchar; opaque: pointer); cdecl;
  TvirConnectDomainEventMetadataChangeCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; _type: longint; nsuri: pchar; opaque: pointer); cdecl;
  TvirConnectDomainEventMigrationIterationCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; iteration: longint; opaque: pointer); cdecl;
  TvirConnectDomainEventJobCompletedCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; params: TvirTypedParameterPtr; nparams: longint; opaque: pointer); cdecl;

const
  VIR_DOMAIN_TUNABLE_CPU_VCPUPIN = 'cputune.vcpupin%u';
  VIR_DOMAIN_TUNABLE_CPU_EMULATORPIN = 'cputune.emulatorpin';
  VIR_DOMAIN_TUNABLE_CPU_IOTHREADSPIN = 'cputune.iothreadpin%u';
  VIR_DOMAIN_TUNABLE_CPU_CPU_SHARES = 'cputune.cpu_shares';
  VIR_DOMAIN_TUNABLE_CPU_GLOBAL_PERIOD = 'cputune.global_period';
  VIR_DOMAIN_TUNABLE_CPU_GLOBAL_QUOTA = 'cputune.global_quota';
  VIR_DOMAIN_TUNABLE_CPU_VCPU_PERIOD = 'cputune.vcpu_period';
  VIR_DOMAIN_TUNABLE_CPU_VCPU_QUOTA = 'cputune.vcpu_quota';
  VIR_DOMAIN_TUNABLE_CPU_EMULATOR_PERIOD = 'cputune.emulator_period';
  VIR_DOMAIN_TUNABLE_CPU_EMULATOR_QUOTA = 'cputune.emulator_quota';
  VIR_DOMAIN_TUNABLE_CPU_IOTHREAD_PERIOD = 'cputune.iothread_period';
  VIR_DOMAIN_TUNABLE_CPU_IOTHREAD_QUOTA = 'cputune.iothread_quota';
  VIR_DOMAIN_TUNABLE_BLKDEV_DISK = 'blkdeviotune.disk';
  VIR_DOMAIN_TUNABLE_BLKDEV_TOTAL_BYTES_SEC = 'blkdeviotune.total_bytes_sec';
  VIR_DOMAIN_TUNABLE_BLKDEV_READ_BYTES_SEC = 'blkdeviotune.read_bytes_sec';
  VIR_DOMAIN_TUNABLE_BLKDEV_WRITE_BYTES_SEC = 'blkdeviotune.write_bytes_sec';
  VIR_DOMAIN_TUNABLE_BLKDEV_TOTAL_IOPS_SEC = 'blkdeviotune.total_iops_sec';
  VIR_DOMAIN_TUNABLE_BLKDEV_READ_IOPS_SEC = 'blkdeviotune.read_iops_sec';
  VIR_DOMAIN_TUNABLE_BLKDEV_WRITE_IOPS_SEC = 'blkdeviotune.write_iops_sec';
  VIR_DOMAIN_TUNABLE_BLKDEV_TOTAL_BYTES_SEC_MAX = 'blkdeviotune.total_bytes_sec_max';
  VIR_DOMAIN_TUNABLE_BLKDEV_READ_BYTES_SEC_MAX = 'blkdeviotune.read_bytes_sec_max';
  VIR_DOMAIN_TUNABLE_BLKDEV_WRITE_BYTES_SEC_MAX = 'blkdeviotune.write_bytes_sec_max';
  VIR_DOMAIN_TUNABLE_BLKDEV_TOTAL_IOPS_SEC_MAX = 'blkdeviotune.total_iops_sec_max';
  VIR_DOMAIN_TUNABLE_BLKDEV_READ_IOPS_SEC_MAX = 'blkdeviotune.read_iops_sec_max';
  VIR_DOMAIN_TUNABLE_BLKDEV_WRITE_IOPS_SEC_MAX = 'blkdeviotune.write_iops_sec_max';
  VIR_DOMAIN_TUNABLE_BLKDEV_SIZE_IOPS_SEC = 'blkdeviotune.size_iops_sec';
  VIR_DOMAIN_TUNABLE_BLKDEV_GROUP_NAME = 'blkdeviotune.group_name';
  VIR_DOMAIN_TUNABLE_BLKDEV_TOTAL_BYTES_SEC_MAX_LENGTH = 'blkdeviotune.total_bytes_sec_max_length';
  VIR_DOMAIN_TUNABLE_BLKDEV_READ_BYTES_SEC_MAX_LENGTH = 'blkdeviotune.read_bytes_sec_max_length';
  VIR_DOMAIN_TUNABLE_BLKDEV_WRITE_BYTES_SEC_MAX_LENGTH = 'blkdeviotune.write_bytes_sec_max_length';
  VIR_DOMAIN_TUNABLE_BLKDEV_TOTAL_IOPS_SEC_MAX_LENGTH = 'blkdeviotune.total_iops_sec_max_length';
  VIR_DOMAIN_TUNABLE_BLKDEV_READ_IOPS_SEC_MAX_LENGTH = 'blkdeviotune.read_iops_sec_max_length';
  VIR_DOMAIN_TUNABLE_BLKDEV_WRITE_IOPS_SEC_MAX_LENGTH = 'blkdeviotune.write_iops_sec_max_length';

type
  TvirConnectDomainEventTunableCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; params: TvirTypedParameterPtr; nparams: longint; opaque: pointer); cdecl;

type
  PvirConnectDomainEventAgentLifecycleState = ^TvirConnectDomainEventAgentLifecycleState;
  TvirConnectDomainEventAgentLifecycleState = longint;
const
  VIR_CONNECT_DOMAIN_EVENT_AGENT_LIFECYCLE_STATE_CONNECTED = 1;
  VIR_CONNECT_DOMAIN_EVENT_AGENT_LIFECYCLE_STATE_DISCONNECTED = 2;
  VIR_CONNECT_DOMAIN_EVENT_AGENT_LIFECYCLE_STATE_LAST = 3;

type
  PvirConnectDomainEventAgentLifecycleReason = ^TvirConnectDomainEventAgentLifecycleReason;
  TvirConnectDomainEventAgentLifecycleReason = longint;
const
  VIR_CONNECT_DOMAIN_EVENT_AGENT_LIFECYCLE_REASON_UNKNOWN = 0;
  VIR_CONNECT_DOMAIN_EVENT_AGENT_LIFECYCLE_REASON_DOMAIN_STARTED = 1;
  VIR_CONNECT_DOMAIN_EVENT_AGENT_LIFECYCLE_REASON_CHANNEL = 2;
  VIR_CONNECT_DOMAIN_EVENT_AGENT_LIFECYCLE_REASON_LAST = 3;

type
  TvirConnectDomainEventAgentLifecycleCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; state: longint; reason: longint; opaque: pointer); cdecl;
  TvirConnectDomainEventBlockThresholdCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; dev: pchar; path: pchar; threshold: qword; excess: qword; opaque: pointer); cdecl;
  TvirConnectDomainEventMemoryFailureCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; recipient: longint; action: longint; flags: dword; opaque: pointer); cdecl;
  TvirConnectDomainEventMemoryDeviceSizeChangeCallback = procedure(conn: TvirConnectPtr; dom: TvirDomainPtr; alias: pchar; size: qword; opaque: pointer); cdecl;

type
  PvirDomainEventID = ^TvirDomainEventID;
  TvirDomainEventID = longint;
const
  VIR_DOMAIN_EVENT_ID_LIFECYCLE = 0;
  VIR_DOMAIN_EVENT_ID_REBOOT = 1;
  VIR_DOMAIN_EVENT_ID_RTC_CHANGE = 2;
  VIR_DOMAIN_EVENT_ID_WATCHDOG = 3;
  VIR_DOMAIN_EVENT_ID_IO_ERROR = 4;
  VIR_DOMAIN_EVENT_ID_GRAPHICS = 5;
  VIR_DOMAIN_EVENT_ID_IO_ERROR_REASON = 6;
  VIR_DOMAIN_EVENT_ID_CONTROL_ERROR = 7;
  VIR_DOMAIN_EVENT_ID_BLOCK_JOB = 8;
  VIR_DOMAIN_EVENT_ID_DISK_CHANGE = 9;
  VIR_DOMAIN_EVENT_ID_TRAY_CHANGE = 10;
  VIR_DOMAIN_EVENT_ID_PMWAKEUP = 11;
  VIR_DOMAIN_EVENT_ID_PMSUSPEND = 12;
  VIR_DOMAIN_EVENT_ID_BALLOON_CHANGE = 13;
  VIR_DOMAIN_EVENT_ID_PMSUSPEND_DISK = 14;
  VIR_DOMAIN_EVENT_ID_DEVICE_REMOVED = 15;
  VIR_DOMAIN_EVENT_ID_BLOCK_JOB_2 = 16;
  VIR_DOMAIN_EVENT_ID_TUNABLE = 17;
  VIR_DOMAIN_EVENT_ID_AGENT_LIFECYCLE = 18;
  VIR_DOMAIN_EVENT_ID_DEVICE_ADDED = 19;
  VIR_DOMAIN_EVENT_ID_MIGRATION_ITERATION = 20;
  VIR_DOMAIN_EVENT_ID_JOB_COMPLETED = 21;
  VIR_DOMAIN_EVENT_ID_DEVICE_REMOVAL_FAILED = 22;
  VIR_DOMAIN_EVENT_ID_METADATA_CHANGE = 23;
  VIR_DOMAIN_EVENT_ID_BLOCK_THRESHOLD = 24;
  VIR_DOMAIN_EVENT_ID_MEMORY_FAILURE = 25;
  VIR_DOMAIN_EVENT_ID_MEMORY_DEVICE_SIZE_CHANGE = 26;
  VIR_DOMAIN_EVENT_ID_LAST = 27;

function virConnectDomainEventRegisterAny(conn: TvirConnectPtr; dom: TvirDomainPtr; eventID: longint; cb: TvirConnectDomainEventGenericCallback; opaque: pointer;
  freecb: TvirFreeCallback): longint; cdecl; external libvirt;
function virConnectDomainEventDeregisterAny(conn: TvirConnectPtr; callbackID: longint): longint; cdecl; external libvirt;

type
  PvirDomainConsoleFlags = ^TvirDomainConsoleFlags;
  TvirDomainConsoleFlags = longint;
const
  VIR_DOMAIN_CONSOLE_FORCE = 1 shl 0;
  VIR_DOMAIN_CONSOLE_SAFE = 1 shl 1;

function virDomainOpenConsole(dom: TvirDomainPtr; dev_name: pchar; st: TvirStreamPtr; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainChannelFlags = ^TvirDomainChannelFlags;
  TvirDomainChannelFlags = longint;
const
  VIR_DOMAIN_CHANNEL_FORCE = 1 shl 0;

function virDomainOpenChannel(dom: TvirDomainPtr; name: pchar; st: TvirStreamPtr; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainOpenGraphicsFlags = ^TvirDomainOpenGraphicsFlags;
  TvirDomainOpenGraphicsFlags = longint;
const
  VIR_DOMAIN_OPEN_GRAPHICS_SKIPAUTH = 1 shl 0;

function virDomainOpenGraphics(dom: TvirDomainPtr; idx: dword; fd: longint; flags: dword): longint; cdecl; external libvirt;
function virDomainOpenGraphicsFD(dom: TvirDomainPtr; idx: dword; flags: dword): longint; cdecl; external libvirt;
function virDomainInjectNMI(domain: TvirDomainPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainFSTrim(dom: TvirDomainPtr; mountPoint: pchar; minimum: qword; flags: dword): longint; cdecl; external libvirt;
function virDomainFSFreeze(dom: TvirDomainPtr; mountpoints: PPchar; nmountpoints: dword; flags: dword): longint; cdecl; external libvirt;
function virDomainFSThaw(dom: TvirDomainPtr; mountpoints: PPchar; nmountpoints: dword; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainFSInfo = ^TvirDomainFSInfo;
  TvirDomainFSInfo = record
    mountpoint: pchar;
    name: pchar;
    fstype: pchar;
    ndevAlias: Tsize_t;
    devAlias: ^pchar;
  end;
  PPvirDomainFSInfoPtr = ^PvirDomainFSInfoPtr;
  PvirDomainFSInfoPtr = ^TvirDomainFSInfoPtr;
  TvirDomainFSInfoPtr = PvirDomainFSInfo;

procedure virDomainFSInfoFree(info: TvirDomainFSInfoPtr); cdecl; external libvirt;
function virDomainGetFSInfo(dom: TvirDomainPtr; info: PPvirDomainFSInfoPtr; flags: dword): longint; cdecl; external libvirt;
function virDomainGetTime(dom: TvirDomainPtr; seconds: Pint64; nseconds: Pdword; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainSetTimeFlags = ^TvirDomainSetTimeFlags;
  TvirDomainSetTimeFlags = longint;
const
  VIR_DOMAIN_TIME_SYNC = 1 shl 0;

function virDomainSetTime(dom: TvirDomainPtr; seconds: int64; nseconds: dword; flags: dword): longint; cdecl; external libvirt;

type
  PvirSchedParameterType = ^TvirSchedParameterType;
  TvirSchedParameterType = longint;
const
  VIR_DOMAIN_SCHED_FIELD_INT = VIR_TYPED_PARAM_INT;
  VIR_DOMAIN_SCHED_FIELD_UINT = VIR_TYPED_PARAM_UINT;
  VIR_DOMAIN_SCHED_FIELD_LLONG = VIR_TYPED_PARAM_LLONG;
  VIR_DOMAIN_SCHED_FIELD_ULLONG = VIR_TYPED_PARAM_ULLONG;
  VIR_DOMAIN_SCHED_FIELD_DOUBLE = VIR_TYPED_PARAM_DOUBLE;
  VIR_DOMAIN_SCHED_FIELD_BOOLEAN = VIR_TYPED_PARAM_BOOLEAN;
  VIR_DOMAIN_SCHED_FIELD_LENGTH = VIR_TYPED_PARAM_FIELD_LENGTH;

type
  PvirSchedParameterPtr = ^TvirSchedParameterPtr;
  TvirSchedParameterPtr = type Pointer;

type
  PvirBlkioParameterType = ^TvirBlkioParameterType;
  TvirBlkioParameterType = longint;
const
  VIR_DOMAIN_BLKIO_PARAM_INT = VIR_TYPED_PARAM_INT;
  VIR_DOMAIN_BLKIO_PARAM_UINT = VIR_TYPED_PARAM_UINT;
  VIR_DOMAIN_BLKIO_PARAM_LLONG = VIR_TYPED_PARAM_LLONG;
  VIR_DOMAIN_BLKIO_PARAM_ULLONG = VIR_TYPED_PARAM_ULLONG;
  VIR_DOMAIN_BLKIO_PARAM_DOUBLE = VIR_TYPED_PARAM_DOUBLE;
  VIR_DOMAIN_BLKIO_PARAM_BOOLEAN = VIR_TYPED_PARAM_BOOLEAN;
  VIR_DOMAIN_BLKIO_FIELD_LENGTH = VIR_TYPED_PARAM_FIELD_LENGTH;

type
  PvirBlkioParameterPtr = ^TvirBlkioParameterPtr;
  TvirBlkioParameterPtr = type Pointer;

type
  PvirMemoryParameterType = ^TvirMemoryParameterType;
  TvirMemoryParameterType = longint;
const
  VIR_DOMAIN_MEMORY_PARAM_INT = VIR_TYPED_PARAM_INT;
  VIR_DOMAIN_MEMORY_PARAM_UINT = VIR_TYPED_PARAM_UINT;
  VIR_DOMAIN_MEMORY_PARAM_LLONG = VIR_TYPED_PARAM_LLONG;
  VIR_DOMAIN_MEMORY_PARAM_ULLONG = VIR_TYPED_PARAM_ULLONG;
  VIR_DOMAIN_MEMORY_PARAM_DOUBLE = VIR_TYPED_PARAM_DOUBLE;
  VIR_DOMAIN_MEMORY_PARAM_BOOLEAN = VIR_TYPED_PARAM_BOOLEAN;
  VIR_DOMAIN_MEMORY_FIELD_LENGTH = VIR_TYPED_PARAM_FIELD_LENGTH;

type
  PvirMemoryParameterPtr = ^TvirMemoryParameterPtr;
  TvirMemoryParameterPtr = type Pointer;

type
  PvirDomainInterfaceAddressesSource = ^TvirDomainInterfaceAddressesSource;
  TvirDomainInterfaceAddressesSource = longint;
const
  VIR_DOMAIN_INTERFACE_ADDRESSES_SRC_LEASE = 0;
  VIR_DOMAIN_INTERFACE_ADDRESSES_SRC_AGENT = 1;
  VIR_DOMAIN_INTERFACE_ADDRESSES_SRC_ARP = 2;
  VIR_DOMAIN_INTERFACE_ADDRESSES_SRC_LAST = 3;

type
  PvirDomainInterfaceIPAddress = ^TvirDomainInterfaceIPAddress;
  TvirDomainInterfaceIPAddress = record
    _type: longint;
    addr: pchar;
    prefix: dword;
  end;

  PvirDomainIPAddressPtr = ^TvirDomainIPAddressPtr;
  TvirDomainIPAddressPtr = type Pointer;

  PvirDomainInterface = ^TvirDomainInterface;
  TvirDomainInterface = record
    name: pchar;
    hwaddr: pchar;
    naddrs: dword;
    addrs: TvirDomainIPAddressPtr;
  end;
  PPvirDomainInterfacePtr = ^PvirDomainInterfacePtr;
  PvirDomainInterfacePtr = ^TvirDomainInterfacePtr;
  TvirDomainInterfacePtr = PvirDomainInterface;

function virDomainInterfaceAddresses(dom: TvirDomainPtr; ifaces: PPvirDomainInterfacePtr; source: dword; flags: dword): longint; cdecl; external libvirt;
procedure virDomainInterfaceFree(iface: TvirDomainInterfacePtr); cdecl; external libvirt;

type
  PvirDomainSetUserPasswordFlags = ^TvirDomainSetUserPasswordFlags;
  TvirDomainSetUserPasswordFlags = longint;
const
  VIR_DOMAIN_PASSWORD_ENCRYPTED = 1 shl 0;

function virDomainSetUserPassword(dom: TvirDomainPtr; user: pchar; password: pchar; flags: dword): longint; cdecl; external libvirt;
function virDomainRename(dom: TvirDomainPtr; new_name: pchar; flags: dword): longint; cdecl; external libvirt;
function virDomainGetGuestVcpus(domain: TvirDomainPtr; params: PvirTypedParameterPtr; nparams: Pdword; flags: dword): longint; cdecl; external libvirt;
function virDomainSetGuestVcpus(domain: TvirDomainPtr; cpumap: pchar; state: longint; flags: dword): longint; cdecl; external libvirt;
function virDomainSetVcpu(domain: TvirDomainPtr; vcpumap: pchar; state: longint; flags: dword): longint; cdecl; external libvirt;
function virDomainSetBlockThreshold(domain: TvirDomainPtr; dev: pchar; threshold: qword; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainLifecycle = ^TvirDomainLifecycle;
  TvirDomainLifecycle = longint;
const
  VIR_DOMAIN_LIFECYCLE_POWEROFF = 0;
  VIR_DOMAIN_LIFECYCLE_REBOOT = 1;
  VIR_DOMAIN_LIFECYCLE_CRASH = 2;
  VIR_DOMAIN_LIFECYCLE_LAST = 3;

type
  PvirDomainLifecycleAction = ^TvirDomainLifecycleAction;
  TvirDomainLifecycleAction = longint;
const
  VIR_DOMAIN_LIFECYCLE_ACTION_DESTROY = 0;
  VIR_DOMAIN_LIFECYCLE_ACTION_RESTART = 1;
  VIR_DOMAIN_LIFECYCLE_ACTION_RESTART_RENAME = 2;
  VIR_DOMAIN_LIFECYCLE_ACTION_PRESERVE = 3;
  VIR_DOMAIN_LIFECYCLE_ACTION_COREDUMP_DESTROY = 4;
  VIR_DOMAIN_LIFECYCLE_ACTION_COREDUMP_RESTART = 5;
  VIR_DOMAIN_LIFECYCLE_ACTION_LAST = 6;

function virDomainSetLifecycleAction(domain: TvirDomainPtr; _type: dword; action: dword; flags: dword): longint; cdecl; external libvirt;

const
  VIR_DOMAIN_LAUNCH_SECURITY_SEV_MEASUREMENT = 'sev-measurement';
  VIR_DOMAIN_LAUNCH_SECURITY_SEV_API_MAJOR = 'sev-api-major';
  VIR_DOMAIN_LAUNCH_SECURITY_SEV_API_MINOR = 'sev-api-minor';
  VIR_DOMAIN_LAUNCH_SECURITY_SEV_BUILD_ID = 'sev-build-id';
  VIR_DOMAIN_LAUNCH_SECURITY_SEV_POLICY = 'sev-policy';
  VIR_DOMAIN_LAUNCH_SECURITY_SEV_SECRET_HEADER = 'sev-secret-header';
  VIR_DOMAIN_LAUNCH_SECURITY_SEV_SECRET = 'sev-secret';
  VIR_DOMAIN_LAUNCH_SECURITY_SEV_SECRET_SET_ADDRESS = 'sev-secret-set-address';

function virDomainGetLaunchSecurityInfo(domain: TvirDomainPtr; params: PvirTypedParameterPtr; nparams: Plongint; flags: dword): longint; cdecl; external libvirt;
function virDomainSetLaunchSecurityState(domain: TvirDomainPtr; params: TvirTypedParameterPtr; nparams: longint; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainGuestInfoTypes = ^TvirDomainGuestInfoTypes;
  TvirDomainGuestInfoTypes = longint;
const
  VIR_DOMAIN_GUEST_INFO_USERS = 1 shl 0;
  VIR_DOMAIN_GUEST_INFO_OS = 1 shl 1;
  VIR_DOMAIN_GUEST_INFO_TIMEZONE = 1 shl 2;
  VIR_DOMAIN_GUEST_INFO_HOSTNAME = 1 shl 3;
  VIR_DOMAIN_GUEST_INFO_FILESYSTEM = 1 shl 4;
  VIR_DOMAIN_GUEST_INFO_DISKS = 1 shl 5;
  VIR_DOMAIN_GUEST_INFO_INTERFACES = 1 shl 6;

function virDomainGetGuestInfo(domain: TvirDomainPtr; types: dword; params: PvirTypedParameterPtr; nparams: Plongint; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainAgentResponseTimeoutValues = ^TvirDomainAgentResponseTimeoutValues;
  TvirDomainAgentResponseTimeoutValues = longint;
const
  VIR_DOMAIN_AGENT_RESPONSE_TIMEOUT_BLOCK = -(2);
  VIR_DOMAIN_AGENT_RESPONSE_TIMEOUT_DEFAULT = -(1);
  VIR_DOMAIN_AGENT_RESPONSE_TIMEOUT_NOWAIT = 0;

function virDomainAgentSetResponseTimeout(domain: TvirDomainPtr; timeout: longint; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainBackupBeginFlags = ^TvirDomainBackupBeginFlags;
  TvirDomainBackupBeginFlags = longint;
const
  VIR_DOMAIN_BACKUP_BEGIN_REUSE_EXTERNAL = 1 shl 0;

function virDomainBackupBegin(domain: TvirDomainPtr; backupXML: pchar; checkpointXML: pchar; flags: dword): longint; cdecl; external libvirt;
function virDomainBackupGetXMLDesc(domain: TvirDomainPtr; flags: dword): pchar; cdecl; external libvirt;
function virDomainAuthorizedSSHKeysGet(domain: TvirDomainPtr; user: pchar; keys: PPPchar; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainAuthorizedSSHKeysSetFlags = ^TvirDomainAuthorizedSSHKeysSetFlags;
  TvirDomainAuthorizedSSHKeysSetFlags = longint;
const
  VIR_DOMAIN_AUTHORIZED_SSH_KEYS_SET_APPEND = 1 shl 0;
  VIR_DOMAIN_AUTHORIZED_SSH_KEYS_SET_REMOVE = 1 shl 1;

function virDomainAuthorizedSSHKeysSet(domain: TvirDomainPtr; user: pchar; keys: PPchar; nkeys: dword; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainMessageType = ^TvirDomainMessageType;
  TvirDomainMessageType = longint;
const
  VIR_DOMAIN_MESSAGE_DEPRECATION = 1 shl 0;
  VIR_DOMAIN_MESSAGE_TAINTING = 1 shl 1;

function virDomainGetMessages(domain: TvirDomainPtr; msgs: PPPchar; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainDirtyRateStatus = ^TvirDomainDirtyRateStatus;
  TvirDomainDirtyRateStatus = longint;
const
  VIR_DOMAIN_DIRTYRATE_UNSTARTED = 0;
  VIR_DOMAIN_DIRTYRATE_MEASURING = 1;
  VIR_DOMAIN_DIRTYRATE_MEASURED = 2;
  VIR_DOMAIN_DIRTYRATE_LAST = 3;

type
  PvirDomainDirtyRateCalcFlags = ^TvirDomainDirtyRateCalcFlags;
  TvirDomainDirtyRateCalcFlags = longint;
const
  VIR_DOMAIN_DIRTYRATE_MODE_PAGE_SAMPLING = 0;
  VIR_DOMAIN_DIRTYRATE_MODE_DIRTY_BITMAP = 1 shl 0;
  VIR_DOMAIN_DIRTYRATE_MODE_DIRTY_RING = 1 shl 1;

function virDomainStartDirtyRateCalc(domain: TvirDomainPtr; seconds: longint; flags: dword): longint; cdecl; external libvirt;

type
  PvirDomainFDAssociateFlags = ^TvirDomainFDAssociateFlags;
  TvirDomainFDAssociateFlags = longint;
const
  VIR_DOMAIN_FD_ASSOCIATE_SECLABEL_RESTORE = 1 shl 0;
  VIR_DOMAIN_FD_ASSOCIATE_SECLABEL_WRITABLE = 1 shl 1;

function virDomainFDAssociate(domain: TvirDomainPtr; name: pchar; nfds: dword; fds: Plongint; flags: dword): longint; cdecl; external libvirt;

// === Konventiert am: 14-10-26 19:34:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

procedure VIR_USE_CPU(cpumap: pbyte; cpu: integer);
begin
  pbyte(nativeuint(cpumap) + (cpu div 8))^ := pbyte(nativeuint(cpumap) + (cpu div 8))^ or (1 shl (cpu mod 8));
end;

procedure VIR_UNUSE_CPU(cpumap: pbyte; cpu: integer);
begin
  pbyte(nativeuint(cpumap) + (cpu div 8))^ := pbyte(nativeuint(cpumap) + (cpu div 8))^ and not (1 shl (cpu mod 8));
end;

function VIR_CPU_USED(cpumap: pbyte; cpu: integer): boolean;
begin
  Result := (pbyte(nativeuint(cpumap) + (cpu div 8))^ and (1 shl (cpu mod 8))) <> 0;
end;

function VIR_CPU_MAPLEN(cpu: integer): integer;
begin
  Result := (cpu + 7) div 8;
end;

function VIR_GET_CPUMAP(cpumaps: pbyte; maplen: integer; vcpu: integer): pbyte;
begin
  Result := pbyte(nativeuint(cpumaps) + (vcpu * maplen));
end;

function VIR_CPU_USABLE(cpumaps: pbyte; maplen: longint; vcpu: longint; cpu: longint): longint;
var
  map: pbyte;
begin
  map := VIR_GET_CPUMAP(cpumaps, maplen, vcpu);
  if VIR_CPU_USED(map, cpu) then begin Result := 1; end else begin Result := 0; end;
end;

function VIR_COPY_CPUMAP(cpumaps: pbyte; maplen: longint; vcpu: longint; cpumap: pbyte): longint;
var
  src: pbyte;
begin
  src := VIR_GET_CPUMAP(cpumaps, maplen, vcpu);
  Move(src^, cpumap^, maplen);
  Result := 0;
end;

{$ENDIF read_implementation}
