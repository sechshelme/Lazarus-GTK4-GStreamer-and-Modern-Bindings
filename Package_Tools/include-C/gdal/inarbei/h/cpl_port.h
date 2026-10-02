#if UINT_MAX == 65535
typedef long GInt32;
typedef unsigned long GUInt32;
#else
/** Int32 type */
typedef int GInt32;
/** Unsigned int32 type */
typedef unsigned int GUInt32;
#endif

/** Int16 type */
typedef short GInt16;
/** Unsigned int16 type */
typedef unsigned short GUInt16;
/** Unsigned byte type */
typedef unsigned char GByte;
/** Signed int8 type */
typedef signed char GInt8;
/* hack for PDF driver and poppler >= 0.15.0 that defines incompatible "typedef
 * bool GBool" */
/* in include/poppler/goo/gtypes.h */
#ifndef CPL_GBOOL_DEFINED
/*! @cond Doxygen_Suppress */
#define CPL_GBOOL_DEFINED
/*! @endcond */
/** Type for boolean values (alias to int) */
typedef int GBool;
#endif

/* -------------------------------------------------------------------- */
/*      64bit support                                                   */
/* -------------------------------------------------------------------- */

/** Large signed integer type (generally 64-bit integer type).
 *  Use GInt64 when exactly 64 bit is needed */
typedef long long GIntBig;
/** Large unsigned integer type (generally 64-bit unsigned integer type).
 *  Use GUInt64 when exactly 64 bit is needed */
typedef unsigned long long GUIntBig;

/** Minimum GIntBig value */
#define GINTBIG_MIN (CPL_STATIC_CAST(GIntBig, 0x80000000) << 32)
/** Maximum GIntBig value */
#define GINTBIG_MAX ((CPL_STATIC_CAST(GIntBig, 0x7FFFFFFF) << 32) | 0xFFFFFFFFU)
/** Maximum GUIntBig value */
#define GUINTBIG_MAX                                                           \
    ((CPL_STATIC_CAST(GUIntBig, 0xFFFFFFFFU) << 32) | 0xFFFFFFFFU)

/*! @cond Doxygen_Suppress */
#define CPL_HAS_GINT64 1
/*! @endcond */

/* Note: we might want to use instead int64_t / uint64_t if they are available
 */

/** Signed 64 bit integer type */
typedef GIntBig GInt64;
/** Unsigned 64 bit integer type */
typedef GUIntBig GUInt64;

/** Minimum GInt64 value */
#define GINT64_MIN GINTBIG_MIN
/** Maximum GInt64 value */
#define GINT64_MAX GINTBIG_MAX
/** Minimum GUInt64 value */
#define GUINT64_MAX GUINTBIG_MAX

#if SIZEOF_VOIDP > 8
#include <stddef.h>  // ptrdiff_t
/** Integer type large enough to hold the difference between 2 addresses */
typedef ptrdiff_t GPtrDiff_t;
#elif SIZEOF_VOIDP == 8
/** Integer type large enough to hold the difference between 2 addresses */
typedef GIntBig GPtrDiff_t;
#else
/** Integer type large enough to hold the difference between 2 addresses */
typedef int GPtrDiff_t;
#endif

#ifdef GDAL_COMPILATION
#include <stdint.h>
typedef uintptr_t GUIntptr_t;


int vsnprintf(char *str, size_t size, const char *fmt, va_list args)
//    CPL_WARN_DEPRECATED("Use CPLvsnprintf() instead")
;
int snprintf(char *str, size_t size, const char *fmt, ...)

//        CPL_WARN_DEPRECATED("Use CPLsnprintf() instead")
;
int sprintf(char *str, const char *fmt, ...)
//    CPL_WARN_DEPRECATED("Use CPLsnprintf() instead");
;
typedef const char *const *CSLConstList;
#else
/** Type of a constant null-terminated list of nul terminated strings.
 * Seen as char** from C and const char* const* from C++ */
typedef char **CSLConstList;
#endif

#endif /* ndef CPL_BASE_H_INCLUDED */
