# Installation

## Installation ab fork
fork herunterladen und installieren:
```sh
git clone https://github.com/sechshelme/box2d.git
mkdir build
cd build
cmake ../box2d/ -DBUILD_SHARED_LIBS=ON -DBOX2D_CUSTOM_EXPORTS=ON -DBOX2D_AVX2=ON -DCMAKE_BUILD_TYPE=Release
```

## Installation über die Original Quellen von libbox2d

In `.../box2d/box2d/include/box2d/base.h` ändern:

Alt:
```c
#ifdef __cplusplus
	#define B2_API extern "C" BOX2D_EXPORT
	#define B2_INLINE inline
	#define B2_LITERAL(T) T
	#define B2_ZERO_INIT {}
#else
	#define B2_API BOX2D_EXPORT
	#define B2_INLINE static inline
	/// Used for C literals like (b2Vec2){1.0f, 2.0f} where C++ requires b2Vec2{1.0f, 2.0f}
	#define B2_LITERAL(T) (T)
	#define B2_ZERO_INIT {0}
#endif
```

Neu:
```c
#ifdef USE_CUSTOM_BOX2D_EXPORTS
    #ifdef __cplusplus
        #define B2_API extern "C" BOX2D_EXPORT
        #define B2_INLINE inline BOX2D_EXPORT
        #define B2_LITERAL(T) T
        #define B2_ZERO_INIT {}
    #else
        #define B2_API BOX2D_EXPORT
        #define B2_INLINE __attribute__((weak)) BOX2D_EXPORT
        #define B2_LITERAL(T) (T)
        #define B2_ZERO_INIT {0}
    #endif
#else
    #ifdef __cplusplus
        #define B2_API extern "C" BOX2D_EXPORT
        #define B2_INLINE inline
        #define B2_LITERAL(T) T
        #define B2_ZERO_INIT {}
    #else
        #define B2_API BOX2D_EXPORT
        #define B2_INLINE static inline
        /// Used for C literals like (b2Vec2){1.0f, 2.0f} where C++ requires b2Vec2{1.0f, 2.0f}
        #define B2_LITERAL(T) (T)
        #define B2_ZERO_INIT {0}
    #endif
#endif
```
--------------------------

In `.../box2d/box2d/include/box2d/id.h` ändern:

Alt:
```c
#ifdef __cplusplus
	#define B2_NULL_ID {}
	#define B2_ID_INLINE inline
#else
	#define B2_NULL_ID { 0 }
	#define B2_ID_INLINE static inline
#endif
```

Neu:
```c
#ifdef USE_CUSTOM_BOX2D_EXPORTS
    #ifdef __cplusplus
        #define B2_NULL_ID {}
        #define B2_ID_INLINE inline __attribute__((visibility("default")))
    #else
        #define B2_NULL_ID { 0 }
        #define B2_ID_INLINE __attribute__((weak)) __attribute__((visibility("default")))
    #endif
#else
    #ifdef __cplusplus
        #define B2_NULL_ID {}
        #define B2_ID_INLINE inline
    #else
        #define B2_NULL_ID { 0 }
        #define B2_ID_INLINE static inline
    #endif
#endif
```
--------------------------

In `.../box2d/box2d/CMakeLists.txt` ändern:

Alt::
```cmake
option(BOX2D_DISABLE_SIMD "Disable SIMD math (slower)" OFF)
option(BOX2D_COMPILE_WARNING_AS_ERROR "Compile warnings as errors" OFF)

if(CMAKE_SYSTEM_PROCESSOR MATCHES "x86_64|AMD64")
	cmake_dependent_option(BOX2D_AVX2 "Enable AVX2" OFF "NOT BOX2D_DISABLE_SIMD" OFF)
endif()
```

Neu:
```cmake
option(BOX2D_DISABLE_SIMD "Disable SIMD math (slower)" OFF)
option(BOX2D_COMPILE_WARNING_AS_ERROR "Compile warnings as errors" OFF)

option(BOX2D_CUSTOM_EXPORTS "Nutze modifizierte Export-Attribute für Lazarus" OFF)

if(BOX2D_CUSTOM_EXPORTS)
    add_compile_definitions(USE_CUSTOM_BOX2D_EXPORTS)
endif()

if(CMAKE_SYSTEM_PROCESSOR MATCHES "x86_64|AMD64")
	cmake_dependent_option(BOX2D_AVX2 "Enable AVX2" OFF "NOT BOX2D_DISABLE_SIMD" OFF)
endif()
```
--------------------------

In `.../box2d/box2d/src/CMakeLists.txt` ändern:

Alt:
```cmake
elseif (UNIX)
	message(STATUS "Box2D using Unix")
	target_compile_options(box2d PRIVATE -Wmissing-prototypes -Wall -Wextra -pedantic -Wno-unused-value)
```

Neu:
```cmake
elseif (UNIX)
	message(STATUS "Box2D using Unix")

    if(UNIX AND NOT APPLE)
        target_link_libraries(box2d PRIVATE m)
    endif()

	target_compile_options(box2d PRIVATE -Wmissing-prototypes -Wall -Wextra -pedantic -Wno-unused-value)
```

