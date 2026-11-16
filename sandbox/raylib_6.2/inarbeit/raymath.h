
    #define EPSILON 0.000001
    #define DEG2RAD (PI/180.0)
    #define RAD2DEG (180.0/PI)

/* xxxxxxxxxxxxx
#ifndef MatrixToFloat
    #define MatrixToFloat(mat) (MatrixToFloatV(mat).v)
#endif

#ifndef Vector3ToFloat
    #define Vector3ToFloat(vec) (Vector3ToFloatV(vec).v)
#endif

*/
//----------------------------------------------------------------------------------
// Types and Structures Definition
//----------------------------------------------------------------------------------
// Vector2 type
typedef struct Vector2 {
    float x;
    float y;
} Vector2;

// Vector3 type
typedef struct Vector3 {
    float x;
    float y;
    float z;
} Vector3;
#endif

// Vector4 type
typedef struct Vector4 {
    float x;
    float y;
    float z;
    float w;
} Vector4;

#if !defined(RL_QUATERNION_TYPE)
// Quaternion type
typedef Vector4 Quaternion;
#endif

#if !defined(RL_MATRIX_TYPE)
// Matrix type (OpenGL style 4x4 - right handed, column major)
typedef struct Matrix {
    float m0, m4, m8, m12;      // Matrix first row (4 components)
    float m1, m5, m9, m13;      // Matrix second row (4 components)
    float m2, m6, m10, m14;     // Matrix third row (4 components)
    float m3, m7, m11, m15;     // Matrix fourth row (4 components)
} Matrix;
#endif

// NOTE: Helper types to be used instead of array return types for *ToFloat functions
#if !defined(RL_FLOAT3_TYPE)
typedef struct float3 {
    float v[3];
} float3;
#endif

#if !defined(RL_FLOAT16_TYPE)
typedef struct float16 {
    float v[16];
} float16;
#endif


//----------------------------------------------------------------------------------
// Module Functions Definition - Utils math
//----------------------------------------------------------------------------------

// Clamp float value
extern float Clamp(float value, float min, float max);
extern float Lerp(float start, float end, float amount);
extern float Normalize(float value, float start, float end);
extern float Remap(float value, float inputStart, float inputEnd, float outputStart, float outputEnd);
extern float Wrap(float value, float min, float max);
extern int FloatEquals(float x, float y);
extern Vector2 Vector2Zero(void);
extern Vector2 Vector2One(void);
extern Vector2 Vector2Add(Vector2 v1, Vector2 v2);
extern Vector2 Vector2AddValue(Vector2 v, float add);
extern Vector2 Vector2Subtract(Vector2 v1, Vector2 v2);
extern Vector2 Vector2SubtractValue(Vector2 v, float sub);
extern float Vector2Length(Vector2 v);
extern float Vector2LengthSqr(Vector2 v);
extern float Vector2DotProduct(Vector2 v1, Vector2 v2);
extern float Vector2CrossProduct(Vector2 v1, Vector2 v2);
extern float Vector2Distance(Vector2 v1, Vector2 v2);
extern float Vector2DistanceSqr(Vector2 v1, Vector2 v2);
extern float Vector2Angle(Vector2 v1, Vector2 v2);
extern float Vector2LineAngle(Vector2 start, Vector2 end);
extern Vector2 Vector2Scale(Vector2 v, float scale);
extern Vector2 Vector2Multiply(Vector2 v1, Vector2 v2);
extern Vector2 Vector2Negate(Vector2 v);
extern Vector2 Vector2Divide(Vector2 v1, Vector2 v2);
extern Vector2 Vector2Normalize(Vector2 v);
extern Vector2 Vector2Transform(Vector2 v, Matrix mat);
extern Vector2 Vector2Lerp(Vector2 v1, Vector2 v2, float amount);
extern Vector2 Vector2Reflect(Vector2 v, Vector2 normal);
extern Vector2 Vector2Min(Vector2 v1, Vector2 v2);
extern Vector2 Vector2Max(Vector2 v1, Vector2 v2);
extern Vector2 Vector2Rotate(Vector2 v, float angle);
extern Vector2 Vector2MoveTowards(Vector2 v, Vector2 target, float maxDistance);
extern Vector2 Vector2Invert(Vector2 v);
extern Vector2 Vector2Clamp(Vector2 v, Vector2 min, Vector2 max);
extern Vector2 Vector2ClampValue(Vector2 v, float min, float max);
extern int Vector2Equals(Vector2 p, Vector2 q);
extern Vector2 Vector2Refract(Vector2 v, Vector2 n, float r);


//----------------------------------------------------------------------------------
// Module Functions Definition - Vector3 math
//----------------------------------------------------------------------------------

extern Vector3 Vector3Zero(void);
extern Vector3 Vector3One(void);
extern Vector3 Vector3Add(Vector3 v1, Vector3 v2);
extern Vector3 Vector3AddValue(Vector3 v, float add);
extern Vector3 Vector3Subtract(Vector3 v1, Vector3 v2);
extern Vector3 Vector3SubtractValue(Vector3 v, float sub);
extern Vector3 Vector3Scale(Vector3 v, float scalar);
extern Vector3 Vector3Multiply(Vector3 v1, Vector3 v2);
extern Vector3 Vector3CrossProduct(Vector3 v1, Vector3 v2);
extern Vector3 Vector3Perpendicular(Vector3 v);
extern float Vector3Length(const Vector3 v);
extern float Vector3LengthSqr(const Vector3 v);
extern float Vector3DotProduct(Vector3 v1, Vector3 v2);
extern float Vector3Distance(Vector3 v1, Vector3 v2);
extern float Vector3DistanceSqr(Vector3 v1, Vector3 v2);
extern float Vector3Angle(Vector3 v1, Vector3 v2);
extern Vector3 Vector3Negate(Vector3 v);
extern Vector3 Vector3Divide(Vector3 v1, Vector3 v2);
extern Vector3 Vector3Normalize(Vector3 v);
extern Vector3 Vector3Project(Vector3 v1, Vector3 v2);
extern Vector3 Vector3Reject(Vector3 v1, Vector3 v2);
extern void Vector3OrthoNormalize(Vector3 *v1, Vector3 *v2);
extern Vector3 Vector3Transform(Vector3 v, Matrix mat);
extern Vector3 Vector3RotateByQuaternion(Vector3 v, Quaternion q);
extern Vector3 Vector3RotateByAxisAngle(Vector3 v, Vector3 axis, float angle);
extern Vector3 Vector3MoveTowards(Vector3 v, Vector3 target, float maxDistance);
extern Vector3 Vector3Lerp(Vector3 v1, Vector3 v2, float amount);
extern Vector3 Vector3CubicHermite(Vector3 v1, Vector3 tangent1, Vector3 v2, Vector3 tangent2, float amount);
extern Vector3 Vector3Reflect(Vector3 v, Vector3 normal);
extern Vector3 Vector3Min(Vector3 v1, Vector3 v2);
extern Vector3 Vector3Max(Vector3 v1, Vector3 v2);
extern Vector3 Vector3Barycenter(Vector3 p, Vector3 a, Vector3 b, Vector3 c);
extern Vector3 Vector3Unproject(Vector3 source, Matrix projection, Matrix view);
extern float3 Vector3ToFloatV(Vector3 v);
extern Vector3 Vector3Invert(Vector3 v);
extern Vector3 Vector3Clamp(Vector3 v, Vector3 min, Vector3 max);
extern Vector3 Vector3ClampValue(Vector3 v, float min, float max);
extern int Vector3Equals(Vector3 p, Vector3 q);
extern Vector3 Vector3Refract(Vector3 v, Vector3 n, float r);
extern Vector4 Vector4Zero(void);
extern Vector4 Vector4One(void);
extern Vector4 Vector4Add(Vector4 v1, Vector4 v2);
extern Vector4 Vector4AddValue(Vector4 v, float add);
extern Vector4 Vector4Subtract(Vector4 v1, Vector4 v2);
extern Vector4 Vector4SubtractValue(Vector4 v, float add);
extern float Vector4Length(Vector4 v);
extern float Vector4LengthSqr(Vector4 v);
extern float Vector4DotProduct(Vector4 v1, Vector4 v2);
extern float Vector4Distance(Vector4 v1, Vector4 v2);
extern float Vector4DistanceSqr(Vector4 v1, Vector4 v2);
extern Vector4 Vector4Scale(Vector4 v, float scale);
extern Vector4 Vector4Multiply(Vector4 v1, Vector4 v2);
extern Vector4 Vector4Negate(Vector4 v);
extern Vector4 Vector4Divide(Vector4 v1, Vector4 v2);
extern Vector4 Vector4Normalize(Vector4 v);
extern Vector4 Vector4Min(Vector4 v1, Vector4 v2);
extern Vector4 Vector4Max(Vector4 v1, Vector4 v2);
extern Vector4 Vector4Lerp(Vector4 v1, Vector4 v2, float amount);
extern Vector4 Vector4MoveTowards(Vector4 v, Vector4 target, float maxDistance);
extern Vector4 Vector4Invert(Vector4 v);
extern int Vector4Equals(Vector4 p, Vector4 q);

//----------------------------------------------------------------------------------
// Module Functions Definition - Matrix math
//----------------------------------------------------------------------------------

extern float MatrixDeterminant(Matrix mat);
extern float MatrixTrace(Matrix mat);
extern Matrix MatrixTranspose(Matrix mat);
extern Matrix MatrixInvert(Matrix mat);
extern Matrix MatrixIdentity(void);
extern Matrix MatrixAdd(Matrix left, Matrix right);
extern Matrix MatrixSubtract(Matrix left, Matrix right);
extern Matrix MatrixMultiply(Matrix left, Matrix right);
extern Matrix MatrixMultiplyValue(Matrix left, float value);
extern Matrix MatrixTranslate(float x, float y, float z);
extern Matrix MatrixRotate(Vector3 axis, float angle);
extern Matrix MatrixRotateX(float angle);
extern Matrix MatrixRotateY(float angle);
extern Matrix MatrixRotateZ(float angle);
extern Matrix MatrixRotateXYZ(Vector3 angle);
extern Matrix MatrixRotateZYX(Vector3 angle);
extern Matrix MatrixScale(float x, float y, float z);
extern Matrix MatrixFrustum(double left, double right, double bottom, double top, double nearPlane, double farPlane);
extern Matrix MatrixPerspective(double fovY, double aspect, double nearPlane, double farPlane);
extern Matrix MatrixOrtho(double left, double right, double bottom, double top, double nearPlane, double farPlane);
extern Matrix MatrixLookAt(Vector3 eye, Vector3 target, Vector3 up);
extern float16 MatrixToFloatV(Matrix mat);

//----------------------------------------------------------------------------------
// Module Functions Definition - Quaternion math
//----------------------------------------------------------------------------------

extern Quaternion QuaternionAdd(Quaternion q1, Quaternion q2);
extern Quaternion QuaternionAddValue(Quaternion q, float add);
extern Quaternion QuaternionSubtract(Quaternion q1, Quaternion q2);
extern Quaternion QuaternionSubtractValue(Quaternion q, float sub);
extern Quaternion QuaternionIdentity(void);
extern float QuaternionLength(Quaternion q);
extern Quaternion QuaternionNormalize(Quaternion q);
extern Quaternion QuaternionInvert(Quaternion q);
extern Quaternion QuaternionMultiply(Quaternion q1, Quaternion q2);
extern Quaternion QuaternionScale(Quaternion q, float mul);
extern Quaternion QuaternionDivide(Quaternion q1, Quaternion q2);
extern Quaternion QuaternionLerp(Quaternion q1, Quaternion q2, float amount);
extern Quaternion QuaternionNlerp(Quaternion q1, Quaternion q2, float amount);
extern Quaternion QuaternionSlerp(Quaternion q1, Quaternion q2, float amount);
extern Quaternion QuaternionCubicHermiteSpline(Quaternion q1, Quaternion outTangent1, Quaternion q2, Quaternion inTangent2, float t);
extern Quaternion QuaternionFromVector3ToVector3(Vector3 from, Vector3 to);
extern Quaternion QuaternionFromMatrix(Matrix mat);
extern Matrix QuaternionToMatrix(Quaternion q);
extern Quaternion QuaternionFromAxisAngle(Vector3 axis, float angle);
extern void QuaternionToAxisAngle(Quaternion q, Vector3 *outAxis, float *outAngle);
extern Quaternion QuaternionFromEuler(float pitch, float yaw, float roll);
extern Vector3 QuaternionToEuler(Quaternion q);
extern Quaternion QuaternionTransform(Quaternion q, Matrix mat);
extern int QuaternionEquals(Quaternion p, Quaternion q);
extern Matrix MatrixCompose(Vector3 translation, Quaternion rotation, Vector3 scale);
extern void MatrixDecompose(Matrix mat, Vector3 *translation, Quaternion *rotation, Vector3 *scale);
#if defined(__cplusplus) && !defined(RAYMATH_DISABLE_CPP_OPERATORS);


