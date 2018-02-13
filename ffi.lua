local ffi = require "ffi"

--'/* missing types */
ffi.cdef('typedef uint16_t mode_t;')

ffi.cdef('typedef struct MDB_env MDB_env;')
ffi.cdef('typedef struct MDB_txn MDB_txn;')
ffi.cdef('typedef unsigned int MDB_dbi;')
ffi.cdef('typedef struct MDB_cursor MDB_cursor;')
ffi.cdef('typedef int (MDB_msg_func)(const char *msg, void *ctx);')

ffi.cdef[[
struct MDB_val {
    size_t mv_size;
    void *mv_data;
};
]]

ffi.cdef('typedef struct MDB_val MDB_val;')

ffi.cdef('typedef int (MDB_cmp_func)(const MDB_val *a, const MDB_val *b);')
ffi.cdef('typedef void (MDB_rel_func)(MDB_val *item, void *oldptr, void *newptr, void *relctx);')

--/* mdb_env flags */
ffi.cdef('static const int MDB_FIXEDMAP = 0x01;')
ffi.cdef('static const int MDB_NOSUBDIR = 0x4000;')
ffi.cdef('static const int MDB_NOSYNC = 0x10000;')
ffi.cdef('static const int MDB_RDONLY = 0x20000;')
ffi.cdef('static const int MDB_NOMETASYNC = 0x40000;')
ffi.cdef('static const int MDB_WRITEMAP = 0x80000;')
ffi.cdef('static const int MDB_MAPASYNC = 0x100000;')
ffi.cdef('static const int MDB_NOTLS = 0x200000;')
ffi.cdef('static const int MDB_NOLOCK = 0x400000;')
ffi.cdef('static const int MDB_NORDAHEAD = 0x800000;')
ffi.cdef('static const int MDB_NOMEMINIT = 0x1000000;')

--/* mdb_dbi_open flags */
ffi.cdef('static const int MDB_REVERSEKEY = 0x02;')
ffi.cdef('static const int MDB_DUPSORT = 0x04;')
ffi.cdef('static const int MDB_INTEGERKEY = 0x08;')
ffi.cdef('static const int MDB_DUPFIXED = 0x10;')
ffi.cdef('static const int MDB_INTEGERDUP = 0x20;')
ffi.cdef('static const int MDB_REVERSEDUP = 0x40;')
ffi.cdef('static const int MDB_CREATE = 0x40000;')

--/* mdb_put flags */
ffi.cdef('static const int MDB_NOOVERWRITE = 0x10;')
ffi.cdef('static const int MDB_NODUPDATA = 0x20;')
ffi.cdef('static const int MDB_CURRENT = 0x40;')
ffi.cdef('static const int MDB_RESERVE = 0x10000;')
ffi.cdef('static const int MDB_APPEND = 0x20000;')
ffi.cdef('static const int MDB_APPENDDUP = 0x40000;')
ffi.cdef('static const int MDB_MULTIPLE = 0x80000;')

ffi.cdef[[
typedef enum MDB_cursor_op {
    MDB_FIRST,
    MDB_FIRST_DUP,
    MDB_GET_BOTH,
    MDB_GET_BOTH_RANGE,
    MDB_GET_CURRENT,
    MDB_GET_MULTIPLE,
    MDB_LAST,
    MDB_LAST_DUP,
    MDB_NEXT,
    MDB_NEXT_DUP,
    MDB_NEXT_MULTIPLE,
    MDB_NEXT_NODUP,
    MDB_PREV,
    MDB_PREV_DUP,
    MDB_PREV_NODUP,
    MDB_SET,
    MDB_SET_KEY,
    MDB_SET_RANGE
} MDB_cursor_op;
]]

ffi.cdef('static const int MDB_SUCCESS =  0;')
ffi.cdef('static const int MDB_KEYEXIST = (-30799);')
ffi.cdef('static const int MDB_NOTFOUND = (-30798);')
ffi.cdef('static const int MDB_PAGE_NOTFOUND = (-30797);')
ffi.cdef('static const int MDB_CORRUPTED = (-30796);')
ffi.cdef('static const int MDB_PANIC = (-30795);')
ffi.cdef('static const int MDB_VERSION_MISMATCH = (-30794);')
ffi.cdef('static const int MDB_INVALID = (-30793);')
ffi.cdef('static const int MDB_MAP_FULL = (-30792);')
ffi.cdef('static const int MDB_DBS_FULL = (-30791);')
ffi.cdef('static const int MDB_READERS_FULL = (-30790);')
ffi.cdef('static const int MDB_TLS_FULL = (-30789);')
ffi.cdef('static const int MDB_TXN_FULL = (-30788);')
ffi.cdef('static const int MDB_CURSOR_FULL = (-30787);')
ffi.cdef('static const int MDB_PAGE_FULL = (-30786);')
ffi.cdef('static const int MDB_MAP_RESIZED = (-30785);')
ffi.cdef('static const int MDB_INCOMPATIBLE = (-30784);')
ffi.cdef('static const int MDB_BAD_RSLOT = (-30783);')
ffi.cdef('static const int MDB_BAD_TXN = (-30782);')
ffi.cdef('static const int MDB_BAD_VALSIZE = (-30781);')
ffi.cdef('static const int MDB_LAST_ERRCODE = MDB_BAD_VALSIZE;')

ffi.cdef[[
struct MDB_stat {
    unsigned int ms_psize;
    unsigned int ms_depth;
    size_t ms_branch_pages;
    size_t ms_leaf_pages;
    size_t ms_overflow_pages;
    size_t ms_entries;
};
]]

ffi.cdef('typedef struct MDB_stat MDB_stat;')

ffi.cdef[[
struct MDB_envinfo {
    void    *me_mapaddr;
    size_t  me_mapsize;
    size_t  me_last_pgno;
    size_t  me_last_txnid;
    unsigned int me_maxreaders;
    unsigned int me_numreaders;
};
]]
ffi.cdef('typedef struct MDB_envinfo MDB_envinfo;')

ffi.cdef('char *mdb_version(int *major, int *minor, int *patch);')
ffi.cdef('char *mdb_strerror(int err);')
ffi.cdef('int  mdb_env_create(MDB_env **env);')
ffi.cdef('int  mdb_env_open(MDB_env *env, const char *path, unsigned int flags, mode_t mode);')
ffi.cdef('int  mdb_env_copy(MDB_env *env, const char *path);')
ffi.cdef('int  mdb_env_stat(MDB_env *env, MDB_stat *stat);')
ffi.cdef('int  mdb_env_info(MDB_env *env, MDB_envinfo *stat);')
ffi.cdef('int  mdb_env_sync(MDB_env *env, int force);')
ffi.cdef('void mdb_env_close(MDB_env *env);')
ffi.cdef('int  mdb_env_set_flags(MDB_env *env, unsigned int flags, int onoff);')
ffi.cdef('int  mdb_env_get_flags(MDB_env *env, unsigned int *flags);')
ffi.cdef('int  mdb_env_get_path(MDB_env *env, const char **path);')
ffi.cdef('int  mdb_env_set_mapsize(MDB_env *env, size_t size);')
ffi.cdef('int  mdb_env_set_maxreaders(MDB_env *env, unsigned int readers);')
ffi.cdef('int  mdb_env_get_maxreaders(MDB_env *env, unsigned int *readers);')
ffi.cdef('int  mdb_env_set_maxdbs(MDB_env *env, MDB_dbi dbs);')

ffi.cdef('int  mdb_txn_begin(MDB_env *env, MDB_txn *parent, unsigned int flags, MDB_txn **txn);')
ffi.cdef('int  mdb_txn_commit(MDB_txn *txn);')
ffi.cdef('void mdb_txn_abort(MDB_txn *txn);')
ffi.cdef('void mdb_txn_reset(MDB_txn *txn);')
ffi.cdef('int  mdb_txn_renew(MDB_txn *txn);')

ffi.cdef('int  mdb_dbi_open(MDB_txn *txn, const char *name, unsigned int flags, MDB_dbi *dbi);')
ffi.cdef('int  mdb_stat(MDB_txn *txn, MDB_dbi dbi, MDB_stat *stat);')
ffi.cdef('void mdb_dbi_close(MDB_env *env, MDB_dbi dbi);')
ffi.cdef('int  mdb_drop(MDB_txn *txn, MDB_dbi dbi, int del);')
ffi.cdef('int  mdb_set_compare(MDB_txn *txn, MDB_dbi dbi, MDB_cmp_func *cmp);')
ffi.cdef('int  mdb_set_dupsort(MDB_txn *txn, MDB_dbi dbi, MDB_cmp_func *cmp);')
ffi.cdef('int  mdb_set_relfunc(MDB_txn *txn, MDB_dbi dbi, MDB_rel_func *rel);')
ffi.cdef('int  mdb_set_relctx(MDB_txn *txn, MDB_dbi dbi, void *ctx);')
ffi.cdef('int  mdb_get(MDB_txn *txn, MDB_dbi dbi, MDB_val *key, MDB_val *data);')
ffi.cdef('int  mdb_put(MDB_txn *txn, MDB_dbi dbi, MDB_val *key, MDB_val *data, unsigned int flags);')
ffi.cdef('int  mdb_del(MDB_txn *txn, MDB_dbi dbi, MDB_val *key, MDB_val *data);')

ffi.cdef('int  mdb_cursor_open(MDB_txn *txn, MDB_dbi dbi, MDB_cursor **cursor);')
ffi.cdef('void mdb_cursor_close(MDB_cursor *cursor);')
ffi.cdef('int  mdb_cursor_renew(MDB_txn *txn, MDB_cursor *cursor);')

ffi.cdef('MDB_txn *mdb_cursor_txn(MDB_cursor *cursor);')
ffi.cdef('MDB_dbi mdb_cursor_dbi(MDB_cursor *cursor);')

ffi.cdef('int  mdb_cursor_get(MDB_cursor *cursor, MDB_val *key, MDB_val *data, MDB_cursor_op op);')
ffi.cdef('int  mdb_cursor_put(MDB_cursor *cursor, MDB_val *key, MDB_val *data, unsigned int flags);')
ffi.cdef('int  mdb_cursor_del(MDB_cursor *cursor, unsigned int flags);')
ffi.cdef('int  mdb_cursor_count(MDB_cursor *cursor, size_t *countp);')
ffi.cdef('int  mdb_cmp(MDB_txn *txn, MDB_dbi dbi, const MDB_val *a, const MDB_val *b);')
ffi.cdef('int  mdb_dcmp(MDB_txn *txn, MDB_dbi dbi, const MDB_val *a, const MDB_val *b);')

ffi.cdef('int mdb_reader_check(MDB_env *env, int *dead);')
ffi.cdef('int mdb_reader_list(MDB_env *env, MDB_msg_func *func, void *ctx);')

lmdb.C = ffi.load("lmdb")

