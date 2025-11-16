#pragma clang diagnostic ignored "-Wmissing-prototypes"
#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
namespace SNAP_VS {
int sc_GetStereoViewIndex()
{
return 0;
}
}
#ifndef sc_TextureRenderingLayout_Regular
#define sc_TextureRenderingLayout_Regular 0
#define sc_TextureRenderingLayout_StereoInstancedClipped 1
#define sc_TextureRenderingLayout_StereoMultiview 2
#endif
// SCC_BACKEND_SHADER_FLAGS_BEGIN__
// SCC_BACKEND_SHADER_FLAG_DISABLE_FRUSTUM_CULLING
// NGS_FLAG_IS_NORMAL_MAP normalTex
// SCC_BACKEND_SHADER_FLAGS_END__
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//output vec4 sc_FragData0 0
//output uvec4 sc_RayTracingPositionAndMask 0
//output uvec4 sc_RayTracingNormalAndMore 1
//sampler sampler backgroundSmpSC 0:22
//sampler sampler intensityTextureSmpSC 0:23
//sampler sampler normalTexSmpSC 0:24
//sampler sampler opacityTextureSmpSC 0:25
//sampler sampler sc_EnvmapDiffuseSmpSC 0:26
//sampler sampler sc_EnvmapSpecularSmpSC 0:27
//sampler sampler sc_RayTracingGlobalIlluminationSmpSC 0:29
//sampler sampler sc_RayTracingReflectionsSmpSC 0:30
//sampler sampler sc_RayTracingShadowsSmpSC 0:31
//sampler sampler sc_SSAOTextureSmpSC 0:32
//sampler sampler sc_ScreenTextureSmpSC 0:33
//sampler sampler sc_ShadowTextureSmpSC 0:34
//texture texture2D background 0:1:0:22
//texture texture2D intensityTexture 0:2:0:23
//texture texture2D normalTex 0:3:0:24
//texture texture2D opacityTexture 0:4:0:25
//texture texture2D sc_EnvmapDiffuse 0:5:0:26
//texture texture2D sc_EnvmapSpecular 0:6:0:27
//texture texture2D sc_RayTracingGlobalIllumination 0:15:0:29
//texture texture2D sc_RayTracingReflections 0:16:0:30
//texture texture2D sc_RayTracingShadows 0:17:0:31
//texture texture2D sc_SSAOTexture 0:18:0:32
//texture texture2D sc_ScreenTexture 0:19:0:33
//texture texture2D sc_ShadowTexture 0:20:0:34
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[1]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:36:5280 {
//sc_PointLight_t sc_PointLights 0:[3]:80
//bool sc_PointLights.falloffEnabled 0
//float sc_PointLights.falloffEndDistance 4
//float sc_PointLights.negRcpFalloffEndDistance4 8
//float sc_PointLights.angleScale 12
//float sc_PointLights.angleOffset 16
//float3 sc_PointLights.direction 32
//float3 sc_PointLights.position 48
//float4 sc_PointLights.color 64
//sc_DirectionalLight_t sc_DirectionalLights 240:[5]:32
//float3 sc_DirectionalLights.direction 0
//float4 sc_DirectionalLights.color 16
//sc_AmbientLight_t sc_AmbientLights 400:[3]:32
//float3 sc_AmbientLights.color 0
//float sc_AmbientLights.intensity 16
//sc_LightEstimationData_t sc_LightEstimationData 496
//sc_SphericalGaussianLight_t sc_LightEstimationData.sg 0:[12]:48
//float3 sc_LightEstimationData.sg.color 0
//float sc_LightEstimationData.sg.sharpness 16
//float3 sc_LightEstimationData.sg.axis 32
//float3 sc_LightEstimationData.ambientLight 576
//float4 sc_EnvmapDiffuseSize 1088
//float4 sc_EnvmapSpecularSize 1136
//float3 sc_EnvmapRotation 1184
//float sc_EnvmapExposure 1200
//float3 sc_Sh 1216:[9]:16
//float sc_ShIntensity 1360
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4x4 sc_ViewProjectionMatrixArray 1680:[2]:64
//float4x4 sc_ModelViewMatrixArray 1936:[2]:64
//float4x4 sc_ProjectionMatrixArray 2384:[2]:64
//float4x4 sc_ProjectionMatrixInverseArray 2512:[2]:64
//float4x4 sc_ViewMatrixArray 2640:[2]:64
//float4x4 sc_PrevFrameViewProjectionMatrixArray 2896:[2]:64
//float4x4 sc_ModelMatrix 3024
//float4x4 sc_ModelMatrixInverse 3088
//float3x3 sc_NormalMatrix 3152
//float4x4 sc_PrevFrameModelMatrix 3248
//float4 sc_CurrentRenderTargetDims 3456
//sc_Camera_t sc_Camera 3472
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float sc_ShadowDensity 3504
//float4 sc_ShadowColor 3520
//float4x4 sc_ProjectorMatrix 3536
//float4 weights0 3616
//float4 weights1 3632
//float4 sc_StereoClipPlanes 3664:[2]:16
//float2 sc_TAAJitterOffset 3704
//int sc_RayTracingReceiverEffectsMask 3824
//float3 sc_RayTracingOriginScale 3984
//uint sc_RayTracingReceiverMask 4000
//float3 sc_RayTracingOriginOffset 4032
//uint sc_RayTracingReceiverId 4048
//float4 voxelization_params_0 4064
//float4 voxelization_params_frustum_lrbt 4080
//float4 voxelization_params_frustum_nf 4096
//float3 voxelization_params_camera_pos 4112
//float4x4 sc_ModelMatrixVoxelization 4128
//float correctedIntensity 4192
//float3x3 intensityTextureTransform 4256
//float4 intensityTextureUvMinMax 4304
//float4 intensityTextureBorderColor 4320
//int PreviewEnabled 4484
//float alphaTestThreshold 4492
//float strength 4496
//float noiseScale 4500
//float animatedspeed 4504
//float offset 4508
//float4 baseColor 4512
//float3x3 backgroundTransform 4576
//float4 backgroundUvMinMax 4624
//float4 backgroundBorderColor 4640
//float chromaticAberration 4656
//float intensity 4660
//float thickness 4664
//float4 colorTint 4672
//float exponent 4688
//float darken 4692
//float3x3 normalTexTransform 4752
//float4 normalTexUvMinMax 4800
//float4 normalTexBorderColor 4816
//float uvScale 4832
//float roughness 4836
//float3x3 opacityTextureTransform 4896
//float4 opacityTextureUvMinMax 4944
//float4 opacityTextureBorderColor 4960
//float2 Port_Scale_N023 5040
//float2 Port_Scale_N025 5048
//float2 Port_Scale_N045 5056
//float Port_Input1_N047 5064
//float Port_Input0_N070 5072
//float Port_Input2_N071 5076
//float Port_Input2_N062 5084
//float Port_Input2_N097 5152
//float Port_Input0_N105 5156
//float Port_Input0_N099 5160
//float Port_Opacity_N006 5184
//float2 Port_Center_N121 5192
//float3 Port_Emissive_N006 5200
//float Port_Metallic_N006 5216
//float3 Port_AO_N006 5232
//float3 Port_SpecularAO_N006 5248
//float Port_Input2_N110 5264
//float Port_Input1_N113 5268
//float Port_Input2_N113 5272
//}
//spec_const bool BLEND_MODE_AVERAGE 0 0
//spec_const bool BLEND_MODE_BRIGHT 1 0
//spec_const bool BLEND_MODE_COLOR_BURN 2 0
//spec_const bool BLEND_MODE_COLOR_DODGE 3 0
//spec_const bool BLEND_MODE_COLOR 4 0
//spec_const bool BLEND_MODE_DARKEN 5 0
//spec_const bool BLEND_MODE_DIFFERENCE 6 0
//spec_const bool BLEND_MODE_DIVIDE 7 0
//spec_const bool BLEND_MODE_DIVISION 8 0
//spec_const bool BLEND_MODE_EXCLUSION 9 0
//spec_const bool BLEND_MODE_FORGRAY 10 0
//spec_const bool BLEND_MODE_HARD_GLOW 11 0
//spec_const bool BLEND_MODE_HARD_LIGHT 12 0
//spec_const bool BLEND_MODE_HARD_MIX 13 0
//spec_const bool BLEND_MODE_HARD_PHOENIX 14 0
//spec_const bool BLEND_MODE_HARD_REFLECT 15 0
//spec_const bool BLEND_MODE_HUE 16 0
//spec_const bool BLEND_MODE_INTENSE 17 0
//spec_const bool BLEND_MODE_LIGHTEN 18 0
//spec_const bool BLEND_MODE_LINEAR_LIGHT 19 0
//spec_const bool BLEND_MODE_LUMINOSITY 20 0
//spec_const bool BLEND_MODE_NEGATION 21 0
//spec_const bool BLEND_MODE_NOTBRIGHT 22 0
//spec_const bool BLEND_MODE_OVERLAY 23 0
//spec_const bool BLEND_MODE_PIN_LIGHT 24 0
//spec_const bool BLEND_MODE_REALISTIC 25 0
//spec_const bool BLEND_MODE_SATURATION 26 0
//spec_const bool BLEND_MODE_SOFT_LIGHT 27 0
//spec_const bool BLEND_MODE_SUBTRACT 28 0
//spec_const bool BLEND_MODE_VIVID_LIGHT 29 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 30 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_background 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_normalTex 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_opacityTexture 34 0
//spec_const bool SC_USE_UV_MIN_MAX_background 35 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 36 0
//spec_const bool SC_USE_UV_MIN_MAX_normalTex 37 0
//spec_const bool SC_USE_UV_MIN_MAX_opacityTexture 38 0
//spec_const bool SC_USE_UV_TRANSFORM_background 39 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 40 0
//spec_const bool SC_USE_UV_TRANSFORM_normalTex 41 0
//spec_const bool SC_USE_UV_TRANSFORM_opacityTexture 42 0
//spec_const bool Tweak_N51 43 0
//spec_const bool UseViewSpaceDepthVariant 44 1
//spec_const bool animated 45 0
//spec_const bool backgroundHasSwappedViews 46 0
//spec_const bool intensityTextureHasSwappedViews 47 0
//spec_const bool normalTexHasSwappedViews 48 0
//spec_const bool opacityTextureHasSwappedViews 49 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 50 0
//spec_const bool sc_BlendMode_Add 51 0
//spec_const bool sc_BlendMode_AlphaTest 52 0
//spec_const bool sc_BlendMode_AlphaToCoverage 53 0
//spec_const bool sc_BlendMode_ColoredGlass 54 0
//spec_const bool sc_BlendMode_Custom 55 0
//spec_const bool sc_BlendMode_Max 56 0
//spec_const bool sc_BlendMode_Min 57 0
//spec_const bool sc_BlendMode_MultiplyOriginal 58 0
//spec_const bool sc_BlendMode_Multiply 59 0
//spec_const bool sc_BlendMode_Normal 60 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 61 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 62 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 63 0
//spec_const bool sc_BlendMode_Screen 64 0
//spec_const bool sc_DepthOnly 65 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 66 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 67 0
//spec_const bool sc_FramebufferFetch 68 0
//spec_const bool sc_HasDiffuseEnvmap 69 0
//spec_const bool sc_IsEditor 70 0
//spec_const bool sc_LightEstimation 71 0
//spec_const bool sc_MotionVectorsPass 72 0
//spec_const bool sc_OITCompositingPass 73 0
//spec_const bool sc_OITDepthBoundsPass 74 0
//spec_const bool sc_OITDepthGatherPass 75 0
//spec_const bool sc_OutputBounds 76 0
//spec_const bool sc_ProjectiveShadowsCaster 77 0
//spec_const bool sc_ProjectiveShadowsReceiver 78 0
//spec_const bool sc_RayTracingGlobalIlluminationHasSwappedViews 79 0
//spec_const bool sc_RayTracingReflectionsHasSwappedViews 80 0
//spec_const bool sc_RayTracingShadowsHasSwappedViews 81 0
//spec_const bool sc_RenderAlphaToColor 82 0
//spec_const bool sc_SSAOEnabled 83 0
//spec_const bool sc_ScreenTextureHasSwappedViews 84 0
//spec_const bool sc_TAAEnabled 85 0
//spec_const bool sc_VertexBlendingUseNormals 86 0
//spec_const bool sc_VertexBlending 87 0
//spec_const bool sc_Voxelization 88 0
//spec_const int SC_DEVICE_CLASS 89 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_background 90 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 91 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_normalTex 92 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_opacityTexture 93 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_background 94 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 95 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_normalTex 96 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_opacityTexture 97 -1
//spec_const int backgroundLayout 98 0
//spec_const int intensityTextureLayout 99 0
//spec_const int normalTexLayout 100 0
//spec_const int opacityTextureLayout 101 0
//spec_const int sc_AmbientLightMode0 102 0
//spec_const int sc_AmbientLightMode1 103 0
//spec_const int sc_AmbientLightMode2 104 0
//spec_const int sc_AmbientLightMode_Constant 105 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 106 0
//spec_const int sc_AmbientLightMode_FromCamera 107 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 108 0
//spec_const int sc_AmbientLightsCount 109 0
//spec_const int sc_DepthBufferMode 110 0
//spec_const int sc_DirectionalLightsCount 111 0
//spec_const int sc_EnvLightMode 112 0
//spec_const int sc_EnvmapDiffuseLayout 113 0
//spec_const int sc_EnvmapSpecularLayout 114 0
//spec_const int sc_LightEstimationSGCount 115 0
//spec_const int sc_PointLightsCount 116 0
//spec_const int sc_RayTracingGlobalIlluminationLayout 117 0
//spec_const int sc_RayTracingReflectionsLayout 118 0
//spec_const int sc_RayTracingShadowsLayout 119 0
//spec_const int sc_RenderingSpace 120 -1
//spec_const int sc_ScreenTextureLayout 121 0
//spec_const int sc_ShaderCacheConstant 122 0
//spec_const int sc_SkinBonesCount 123 0
//spec_const int sc_StereoRenderingMode 124 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 125 0
//SG_REFLECTION_END
constant bool BLEND_MODE_AVERAGE [[function_constant(0)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(1)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(2)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(3)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(4)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(5)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(6)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(7)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(8)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(9)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(10)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(11)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(12)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(13)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(14)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(15)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(16)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(17)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(18)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(19)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(20)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(21)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(22)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(23)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(24)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(25)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(26)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(27)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(28)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(29)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(30)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool SC_USE_CLAMP_TO_BORDER_background [[function_constant(31)]];
constant bool SC_USE_CLAMP_TO_BORDER_background_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_background) ? SC_USE_CLAMP_TO_BORDER_background : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_normalTex [[function_constant(33)]];
constant bool SC_USE_CLAMP_TO_BORDER_normalTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_normalTex) ? SC_USE_CLAMP_TO_BORDER_normalTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_opacityTexture [[function_constant(34)]];
constant bool SC_USE_CLAMP_TO_BORDER_opacityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_opacityTexture) ? SC_USE_CLAMP_TO_BORDER_opacityTexture : false;
constant bool SC_USE_UV_MIN_MAX_background [[function_constant(35)]];
constant bool SC_USE_UV_MIN_MAX_background_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_background) ? SC_USE_UV_MIN_MAX_background : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(36)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_normalTex [[function_constant(37)]];
constant bool SC_USE_UV_MIN_MAX_normalTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_normalTex) ? SC_USE_UV_MIN_MAX_normalTex : false;
constant bool SC_USE_UV_MIN_MAX_opacityTexture [[function_constant(38)]];
constant bool SC_USE_UV_MIN_MAX_opacityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_opacityTexture) ? SC_USE_UV_MIN_MAX_opacityTexture : false;
constant bool SC_USE_UV_TRANSFORM_background [[function_constant(39)]];
constant bool SC_USE_UV_TRANSFORM_background_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_background) ? SC_USE_UV_TRANSFORM_background : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(40)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_normalTex [[function_constant(41)]];
constant bool SC_USE_UV_TRANSFORM_normalTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_normalTex) ? SC_USE_UV_TRANSFORM_normalTex : false;
constant bool SC_USE_UV_TRANSFORM_opacityTexture [[function_constant(42)]];
constant bool SC_USE_UV_TRANSFORM_opacityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_opacityTexture) ? SC_USE_UV_TRANSFORM_opacityTexture : false;
constant bool Tweak_N51 [[function_constant(43)]];
constant bool Tweak_N51_tmp = is_function_constant_defined(Tweak_N51) ? Tweak_N51 : false;
constant bool UseViewSpaceDepthVariant [[function_constant(44)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool animated [[function_constant(45)]];
constant bool animated_tmp = is_function_constant_defined(animated) ? animated : false;
constant bool backgroundHasSwappedViews [[function_constant(46)]];
constant bool backgroundHasSwappedViews_tmp = is_function_constant_defined(backgroundHasSwappedViews) ? backgroundHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(47)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool normalTexHasSwappedViews [[function_constant(48)]];
constant bool normalTexHasSwappedViews_tmp = is_function_constant_defined(normalTexHasSwappedViews) ? normalTexHasSwappedViews : false;
constant bool opacityTextureHasSwappedViews [[function_constant(49)]];
constant bool opacityTextureHasSwappedViews_tmp = is_function_constant_defined(opacityTextureHasSwappedViews) ? opacityTextureHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(50)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(51)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(52)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(53)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(54)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(55)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(56)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(57)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(58)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(59)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(60)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(61)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(62)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(63)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(64)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(65)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(66)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(67)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(68)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(69)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_IsEditor [[function_constant(70)]];
constant bool sc_IsEditor_tmp = is_function_constant_defined(sc_IsEditor) ? sc_IsEditor : false;
constant bool sc_LightEstimation [[function_constant(71)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_MotionVectorsPass [[function_constant(72)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(73)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(74)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(75)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_OutputBounds [[function_constant(76)]];
constant bool sc_OutputBounds_tmp = is_function_constant_defined(sc_OutputBounds) ? sc_OutputBounds : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(77)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(78)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RayTracingGlobalIlluminationHasSwappedViews [[function_constant(79)]];
constant bool sc_RayTracingGlobalIlluminationHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracingGlobalIlluminationHasSwappedViews) ? sc_RayTracingGlobalIlluminationHasSwappedViews : false;
constant bool sc_RayTracingReflectionsHasSwappedViews [[function_constant(80)]];
constant bool sc_RayTracingReflectionsHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracingReflectionsHasSwappedViews) ? sc_RayTracingReflectionsHasSwappedViews : false;
constant bool sc_RayTracingShadowsHasSwappedViews [[function_constant(81)]];
constant bool sc_RayTracingShadowsHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracingShadowsHasSwappedViews) ? sc_RayTracingShadowsHasSwappedViews : false;
constant bool sc_RenderAlphaToColor [[function_constant(82)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(83)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(84)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_TAAEnabled [[function_constant(85)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(86)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(87)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool sc_Voxelization [[function_constant(88)]];
constant bool sc_Voxelization_tmp = is_function_constant_defined(sc_Voxelization) ? sc_Voxelization : false;
constant int SC_DEVICE_CLASS [[function_constant(89)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_background [[function_constant(90)]];
constant int SC_SOFTWARE_WRAP_MODE_U_background_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_background) ? SC_SOFTWARE_WRAP_MODE_U_background : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(91)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex [[function_constant(92)]];
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_normalTex) ? SC_SOFTWARE_WRAP_MODE_U_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTexture [[function_constant(93)]];
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_opacityTexture) ? SC_SOFTWARE_WRAP_MODE_U_opacityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_background [[function_constant(94)]];
constant int SC_SOFTWARE_WRAP_MODE_V_background_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_background) ? SC_SOFTWARE_WRAP_MODE_V_background : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(95)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex [[function_constant(96)]];
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_normalTex) ? SC_SOFTWARE_WRAP_MODE_V_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTexture [[function_constant(97)]];
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_opacityTexture) ? SC_SOFTWARE_WRAP_MODE_V_opacityTexture : -1;
constant int backgroundLayout [[function_constant(98)]];
constant int backgroundLayout_tmp = is_function_constant_defined(backgroundLayout) ? backgroundLayout : 0;
constant int intensityTextureLayout [[function_constant(99)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int normalTexLayout [[function_constant(100)]];
constant int normalTexLayout_tmp = is_function_constant_defined(normalTexLayout) ? normalTexLayout : 0;
constant int opacityTextureLayout [[function_constant(101)]];
constant int opacityTextureLayout_tmp = is_function_constant_defined(opacityTextureLayout) ? opacityTextureLayout : 0;
constant int sc_AmbientLightMode0 [[function_constant(102)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(103)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(104)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(105)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(106)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(107)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(108)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(109)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(110)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(111)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(112)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(113)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(114)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(115)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_PointLightsCount [[function_constant(116)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RayTracingGlobalIlluminationLayout [[function_constant(117)]];
constant int sc_RayTracingGlobalIlluminationLayout_tmp = is_function_constant_defined(sc_RayTracingGlobalIlluminationLayout) ? sc_RayTracingGlobalIlluminationLayout : 0;
constant int sc_RayTracingReflectionsLayout [[function_constant(118)]];
constant int sc_RayTracingReflectionsLayout_tmp = is_function_constant_defined(sc_RayTracingReflectionsLayout) ? sc_RayTracingReflectionsLayout : 0;
constant int sc_RayTracingShadowsLayout [[function_constant(119)]];
constant int sc_RayTracingShadowsLayout_tmp = is_function_constant_defined(sc_RayTracingShadowsLayout) ? sc_RayTracingShadowsLayout : 0;
constant int sc_RenderingSpace [[function_constant(120)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(121)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(122)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(123)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(124)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(125)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 SurfacePosition_ObjectSpace;
float3 VertexNormal_WorldSpace;
float3 VertexNormal_ObjectSpace;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float shaderComplexityValue;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int sc_RayTracingReceiverEffectsMask;
float4 sc_RayTracingReflectionsSize;
float4 sc_RayTracingReflectionsDims;
float4 sc_RayTracingReflectionsView;
float4 sc_RayTracingGlobalIlluminationSize;
float4 sc_RayTracingGlobalIlluminationDims;
float4 sc_RayTracingGlobalIlluminationView;
float4 sc_RayTracingShadowsSize;
float4 sc_RayTracingShadowsDims;
float4 sc_RayTracingShadowsView;
float3 sc_RayTracingOriginScale;
uint sc_RayTracingReceiverMask;
float3 sc_RayTracingOriginScaleInv;
float3 sc_RayTracingOriginOffset;
uint sc_RayTracingReceiverId;
float4 voxelization_params_0;
float4 voxelization_params_frustum_lrbt;
float4 voxelization_params_frustum_nf;
float3 voxelization_params_camera_pos;
float4x4 sc_ModelMatrixVoxelization;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float strength;
float noiseScale;
float animatedspeed;
float offset;
float4 baseColor;
float4 backgroundSize;
float4 backgroundDims;
float4 backgroundView;
float3x3 backgroundTransform;
float4 backgroundUvMinMax;
float4 backgroundBorderColor;
float chromaticAberration;
float intensity;
float thickness;
float4 colorTint;
float exponent;
float darken;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float uvScale;
float roughness;
float4 opacityTextureSize;
float4 opacityTextureDims;
float4 opacityTextureView;
float3x3 opacityTextureTransform;
float4 opacityTextureUvMinMax;
float4 opacityTextureBorderColor;
float Port_Import_N034;
float Port_Import_N037;
float3 Port_Import_N035;
float Port_Import_N049;
float Port_Import_N005;
float Port_Import_N041;
float3 Port_Import_N027;
float2 Port_Scale_N023;
float2 Port_Scale_N025;
float2 Port_Scale_N045;
float Port_Input1_N047;
float Port_Import_N068;
float Port_Input0_N070;
float Port_Input2_N071;
float Port_Import_N080;
float Port_Input2_N062;
float Port_Import_N064;
float2 Port_Import_N083;
float Port_Import_N056;
float Port_Import_N086;
float3 Port_Import_N054;
float3 Port_Import_N095;
float Port_Input2_N097;
float Port_Input0_N105;
float Port_Input0_N099;
float Port_Import_N098;
float Port_Import_N075;
float Port_Import_N101;
float Port_Import_N076;
float Port_Import_N104;
float Port_Opacity_N006;
float2 Port_Center_N121;
float3 Port_Emissive_N006;
float Port_Metallic_N006;
float3 Port_AO_N006;
float3 Port_SpecularAO_N006;
float Port_Input2_N110;
float Port_Input1_N113;
float Port_Input2_N113;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Set0
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> background [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> normalTex [[id(3)]];
texture2d<float> opacityTexture [[id(4)]];
texture2d<float> sc_EnvmapDiffuse [[id(5)]];
texture2d<float> sc_EnvmapSpecular [[id(6)]];
texture2d<float> sc_RayTracingGlobalIllumination [[id(15)]];
texture2d<float> sc_RayTracingReflections [[id(16)]];
texture2d<float> sc_RayTracingShadows [[id(17)]];
texture2d<float> sc_SSAOTexture [[id(18)]];
texture2d<float> sc_ScreenTexture [[id(19)]];
texture2d<float> sc_ShadowTexture [[id(20)]];
sampler backgroundSmpSC [[id(22)]];
sampler intensityTextureSmpSC [[id(23)]];
sampler normalTexSmpSC [[id(24)]];
sampler opacityTextureSmpSC [[id(25)]];
sampler sc_EnvmapDiffuseSmpSC [[id(26)]];
sampler sc_EnvmapSpecularSmpSC [[id(27)]];
sampler sc_RayTracingGlobalIlluminationSmpSC [[id(29)]];
sampler sc_RayTracingReflectionsSmpSC [[id(30)]];
sampler sc_RayTracingShadowsSmpSC [[id(31)]];
sampler sc_SSAOTextureSmpSC [[id(32)]];
sampler sc_ScreenTextureSmpSC [[id(33)]];
sampler sc_ShadowTextureSmpSC [[id(34)]];
constant userUniformsObj* UserUniforms [[id(36)]];
};
struct main_vert_out
{
float4 varPosAndMotion [[user(locn0)]];
float4 varNormalAndMotion [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varTex01 [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 boneData [[attribute(5)]];
float3 blendShape0Pos [[attribute(6)]];
float3 blendShape1Pos [[attribute(7)]];
float3 blendShape2Pos [[attribute(8)]];
float3 blendShape3Pos [[attribute(9)]];
float3 blendShape4Pos [[attribute(10)]];
float3 blendShape5Pos [[attribute(11)]];
float3 blendShape0Normal [[attribute(12)]];
float3 blendShape1Normal [[attribute(13)]];
float3 blendShape2Normal [[attribute(14)]];
float3 positionNext [[attribute(15)]];
float3 positionPrevious [[attribute(16)]];
float4 strandProperties [[attribute(17)]];
float4 color [[attribute(18)]];
};
float snoise(thread const float2& v)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 i=floor(v+float2(dot(v,float2(0.36602542))));
float2 x0=(v-i)+float2(dot(i,float2(0.21132487)));
float2 i1=float2(0.0);
bool2 l9_0=bool2(x0.x>x0.y);
i1=float2(l9_0.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_0.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float2 x1=(x0+float2(0.21132487))-i1;
float2 x2=x0+float2(-0.57735026);
float2 param=i;
float2 l9_1=param-(floor(param*0.0034602077)*289.0);
i=l9_1;
float3 param_1=float3(i.y)+float3(0.0,i1.y,1.0);
float3 l9_2=((param_1*34.0)+float3(1.0))*param_1;
float3 l9_3=l9_2-(floor(l9_2*0.0034602077)*289.0);
float3 l9_4=l9_3;
float3 param_2=(l9_4+float3(i.x))+float3(0.0,i1.x,1.0);
float3 l9_5=((param_2*34.0)+float3(1.0))*param_2;
float3 l9_6=l9_5-(floor(l9_5*0.0034602077)*289.0);
float3 l9_7=l9_6;
float3 p=l9_7;
float3 m=fast::max(float3(0.5)-float3(dot(x0,x0),dot(x1,x1),dot(x2,x2)),float3(0.0));
m*=m;
m*=m;
float3 x=(fract(p*float3(0.024390243))*2.0)-float3(1.0);
float3 h=abs(x)-float3(0.5);
float3 ox=floor(x+float3(0.5));
float3 a0=x-ox;
m*=(float3(1.7928429)-(((a0*a0)+(h*h))*0.85373473));
float3 g=float3(0.0);
g.x=(a0.x*x0.x)+(h.x*x0.y);
float2 l9_8=(a0.yz*float2(x1.x,x2.x))+(h.yz*float2(x1.y,x2.y));
g=float3(g.x,l9_8.x,l9_8.y);
return 130.0*dot(m,g);
}
else
{
return 0.0;
}
}
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_0;
l9_0.position=in.position;
l9_0.normal=in.normal;
l9_0.tangent=in.tangent.xyz;
l9_0.texture0=in.texture0;
l9_0.texture1=in.texture1;
sc_Vertex_t l9_1=l9_0;
sc_Vertex_t param=l9_1;
if ((int(sc_Voxelization_tmp)!=0))
{
sc_Vertex_t l9_2=param;
param=l9_2;
}
sc_Vertex_t l9_3=param;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_4=l9_3;
float3 l9_5=in.blendShape0Pos;
float3 l9_6=in.blendShape0Normal;
float l9_7=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_8=l9_4;
float3 l9_9=l9_5;
float l9_10=l9_7;
float3 l9_11=l9_8.position.xyz+(l9_9*l9_10);
l9_8.position=float4(l9_11.x,l9_11.y,l9_11.z,l9_8.position.w);
l9_4=l9_8;
l9_4.normal+=(l9_6*l9_7);
l9_3=l9_4;
sc_Vertex_t l9_12=l9_3;
float3 l9_13=in.blendShape1Pos;
float3 l9_14=in.blendShape1Normal;
float l9_15=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_16=l9_12;
float3 l9_17=l9_13;
float l9_18=l9_15;
float3 l9_19=l9_16.position.xyz+(l9_17*l9_18);
l9_16.position=float4(l9_19.x,l9_19.y,l9_19.z,l9_16.position.w);
l9_12=l9_16;
l9_12.normal+=(l9_14*l9_15);
l9_3=l9_12;
sc_Vertex_t l9_20=l9_3;
float3 l9_21=in.blendShape2Pos;
float3 l9_22=in.blendShape2Normal;
float l9_23=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_24=l9_20;
float3 l9_25=l9_21;
float l9_26=l9_23;
float3 l9_27=l9_24.position.xyz+(l9_25*l9_26);
l9_24.position=float4(l9_27.x,l9_27.y,l9_27.z,l9_24.position.w);
l9_20=l9_24;
l9_20.normal+=(l9_22*l9_23);
l9_3=l9_20;
}
else
{
sc_Vertex_t l9_28=l9_3;
float3 l9_29=in.blendShape0Pos;
float l9_30=(*sc_set0.UserUniforms).weights0.x;
float3 l9_31=l9_28.position.xyz+(l9_29*l9_30);
l9_28.position=float4(l9_31.x,l9_31.y,l9_31.z,l9_28.position.w);
l9_3=l9_28;
sc_Vertex_t l9_32=l9_3;
float3 l9_33=in.blendShape1Pos;
float l9_34=(*sc_set0.UserUniforms).weights0.y;
float3 l9_35=l9_32.position.xyz+(l9_33*l9_34);
l9_32.position=float4(l9_35.x,l9_35.y,l9_35.z,l9_32.position.w);
l9_3=l9_32;
sc_Vertex_t l9_36=l9_3;
float3 l9_37=in.blendShape2Pos;
float l9_38=(*sc_set0.UserUniforms).weights0.z;
float3 l9_39=l9_36.position.xyz+(l9_37*l9_38);
l9_36.position=float4(l9_39.x,l9_39.y,l9_39.z,l9_36.position.w);
l9_3=l9_36;
sc_Vertex_t l9_40=l9_3;
float3 l9_41=in.blendShape3Pos;
float l9_42=(*sc_set0.UserUniforms).weights0.w;
float3 l9_43=l9_40.position.xyz+(l9_41*l9_42);
l9_40.position=float4(l9_43.x,l9_43.y,l9_43.z,l9_40.position.w);
l9_3=l9_40;
sc_Vertex_t l9_44=l9_3;
float3 l9_45=in.blendShape4Pos;
float l9_46=(*sc_set0.UserUniforms).weights1.x;
float3 l9_47=l9_44.position.xyz+(l9_45*l9_46);
l9_44.position=float4(l9_47.x,l9_47.y,l9_47.z,l9_44.position.w);
l9_3=l9_44;
sc_Vertex_t l9_48=l9_3;
float3 l9_49=in.blendShape5Pos;
float l9_50=(*sc_set0.UserUniforms).weights1.y;
float3 l9_51=l9_48.position.xyz+(l9_49*l9_50);
l9_48.position=float4(l9_51.x,l9_51.y,l9_51.z,l9_48.position.w);
l9_3=l9_48;
}
}
param=l9_3;
sc_Vertex_t l9_52=param;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_53=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_53=float4(1.0,fract(in.boneData.yzw));
l9_53.x-=dot(l9_53.yzw,float3(1.0));
}
float4 l9_54=l9_53;
float4 l9_55=l9_54;
int l9_56=int(in.boneData.x);
int l9_57=int(in.boneData.y);
int l9_58=int(in.boneData.z);
int l9_59=int(in.boneData.w);
int l9_60=l9_56;
float4 l9_61=l9_52.position;
float3 l9_62=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_63=l9_60;
float4 l9_64=(*sc_set0.sc_BonesUBO).sc_Bones[l9_63].boneMatrix[0];
float4 l9_65=(*sc_set0.sc_BonesUBO).sc_Bones[l9_63].boneMatrix[1];
float4 l9_66=(*sc_set0.sc_BonesUBO).sc_Bones[l9_63].boneMatrix[2];
float4 l9_67[3];
l9_67[0]=l9_64;
l9_67[1]=l9_65;
l9_67[2]=l9_66;
l9_62=float3(dot(l9_61,l9_67[0]),dot(l9_61,l9_67[1]),dot(l9_61,l9_67[2]));
}
else
{
l9_62=l9_61.xyz;
}
float3 l9_68=l9_62;
float3 l9_69=l9_68;
float l9_70=l9_55.x;
int l9_71=l9_57;
float4 l9_72=l9_52.position;
float3 l9_73=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_74=l9_71;
float4 l9_75=(*sc_set0.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[0];
float4 l9_76=(*sc_set0.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[1];
float4 l9_77=(*sc_set0.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[2];
float4 l9_78[3];
l9_78[0]=l9_75;
l9_78[1]=l9_76;
l9_78[2]=l9_77;
l9_73=float3(dot(l9_72,l9_78[0]),dot(l9_72,l9_78[1]),dot(l9_72,l9_78[2]));
}
else
{
l9_73=l9_72.xyz;
}
float3 l9_79=l9_73;
float3 l9_80=l9_79;
float l9_81=l9_55.y;
int l9_82=l9_58;
float4 l9_83=l9_52.position;
float3 l9_84=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_85=l9_82;
float4 l9_86=(*sc_set0.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[0];
float4 l9_87=(*sc_set0.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[1];
float4 l9_88=(*sc_set0.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[2];
float4 l9_89[3];
l9_89[0]=l9_86;
l9_89[1]=l9_87;
l9_89[2]=l9_88;
l9_84=float3(dot(l9_83,l9_89[0]),dot(l9_83,l9_89[1]),dot(l9_83,l9_89[2]));
}
else
{
l9_84=l9_83.xyz;
}
float3 l9_90=l9_84;
float3 l9_91=l9_90;
float l9_92=l9_55.z;
int l9_93=l9_59;
float4 l9_94=l9_52.position;
float3 l9_95=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_96=l9_93;
float4 l9_97=(*sc_set0.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[0];
float4 l9_98=(*sc_set0.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[1];
float4 l9_99=(*sc_set0.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[2];
float4 l9_100[3];
l9_100[0]=l9_97;
l9_100[1]=l9_98;
l9_100[2]=l9_99;
l9_95=float3(dot(l9_94,l9_100[0]),dot(l9_94,l9_100[1]),dot(l9_94,l9_100[2]));
}
else
{
l9_95=l9_94.xyz;
}
float3 l9_101=l9_95;
float3 l9_102=(((l9_69*l9_70)+(l9_80*l9_81))+(l9_91*l9_92))+(l9_101*l9_55.w);
l9_52.position=float4(l9_102.x,l9_102.y,l9_102.z,l9_52.position.w);
int l9_103=l9_56;
float3x3 l9_104=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_103].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_103].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_103].normalMatrix[2].xyz));
float3x3 l9_105=l9_104;
float3x3 l9_106=l9_105;
int l9_107=l9_57;
float3x3 l9_108=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_107].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_107].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_107].normalMatrix[2].xyz));
float3x3 l9_109=l9_108;
float3x3 l9_110=l9_109;
int l9_111=l9_58;
float3x3 l9_112=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_111].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_111].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_111].normalMatrix[2].xyz));
float3x3 l9_113=l9_112;
float3x3 l9_114=l9_113;
int l9_115=l9_59;
float3x3 l9_116=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_115].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_115].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_115].normalMatrix[2].xyz));
float3x3 l9_117=l9_116;
float3x3 l9_118=l9_117;
l9_52.normal=((((l9_106*l9_52.normal)*l9_55.x)+((l9_110*l9_52.normal)*l9_55.y))+((l9_114*l9_52.normal)*l9_55.z))+((l9_118*l9_52.normal)*l9_55.w);
l9_52.tangent=((((l9_106*l9_52.tangent)*l9_55.x)+((l9_110*l9_52.tangent)*l9_55.y))+((l9_114*l9_52.tangent)*l9_55.z))+((l9_118*l9_52.tangent)*l9_55.w);
}
param=l9_52;
if (sc_RenderingSpace_tmp==3)
{
out.varPosAndMotion=float4(float3(0.0).x,float3(0.0).y,float3(0.0).z,out.varPosAndMotion.w);
out.varNormalAndMotion=float4(param.normal.x,param.normal.y,param.normal.z,out.varNormalAndMotion.w);
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPosAndMotion=float4(float3(0.0).x,float3(0.0).y,float3(0.0).z,out.varPosAndMotion.w);
out.varNormalAndMotion=float4(param.normal.x,param.normal.y,param.normal.z,out.varNormalAndMotion.w);
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPosAndMotion=float4(param.position.xyz.x,param.position.xyz.y,param.position.xyz.z,out.varPosAndMotion.w);
out.varNormalAndMotion=float4(param.normal.x,param.normal.y,param.normal.z,out.varNormalAndMotion.w);
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
float3 l9_119=((*sc_set0.UserUniforms).sc_ModelMatrix*param.position).xyz;
out.varPosAndMotion=float4(l9_119.x,l9_119.y,l9_119.z,out.varPosAndMotion.w);
float3 l9_120=(*sc_set0.UserUniforms).sc_NormalMatrix*param.normal;
out.varNormalAndMotion=float4(l9_120.x,l9_120.y,l9_120.z,out.varNormalAndMotion.w);
float3 l9_121=(*sc_set0.UserUniforms).sc_NormalMatrix*param.tangent;
out.varTangent=float4(l9_121.x,l9_121.y,l9_121.z,out.varTangent.w);
}
}
}
}
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
param.texture0.x=1.0-param.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param;
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.SurfacePosition_ObjectSpace=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(out.varPosAndMotion.xyz,1.0)).xyz;
Globals.VertexNormal_WorldSpace=out.varNormalAndMotion.xyz;
Globals.VertexNormal_ObjectSpace=normalize(((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(Globals.VertexNormal_WorldSpace,0.0)).xyz);
float3 WorldPosition=out.varPosAndMotion.xyz;
float3 WorldNormal=out.varNormalAndMotion.xyz;
float3 WorldTangent=out.varTangent.xyz;
float3 Position_N7=float3(0.0);
Position_N7=Globals.SurfacePosition_ObjectSpace;
float3 Normal_N3=float3(0.0);
Normal_N3=Globals.VertexNormal_ObjectSpace;
float3 Output_N10=float3(0.0);
float3 param_1=Normal_N3;
float l9_122=dot(param_1,param_1);
float l9_123;
if (l9_122>0.0)
{
l9_123=1.0/sqrt(l9_122);
}
else
{
l9_123=0.0;
}
float l9_124=l9_123;
float3 param_2=param_1*l9_124;
Output_N10=param_2;
float Output_N11=0.0;
float param_3=(*sc_set0.UserUniforms).strength;
Output_N11=param_3;
float Value_N34=0.0;
Value_N34=Output_N11;
float3 Position_N20=float3(0.0);
Position_N20=Globals.SurfacePosition_ObjectSpace;
float2 Output_N21=float2(0.0);
Output_N21=float2(Position_N20.y,Position_N20.z);
float Output_N12=0.0;
float param_4=(*sc_set0.UserUniforms).noiseScale;
Output_N12=param_4;
float Value_N37=0.0;
Value_N37=Output_N12;
float Output_N13=0.0;
Output_N13=1.0-Value_N37;
float3 Value_N35=float3(0.0);
Value_N35=float3(Output_N13);
float2 Output_N26=float2(0.0);
Output_N26=float2(Value_N35.y,Value_N35.z);
float Result_N40=0.0;
float param_5=0.0;
float param_6=0.0;
ssGlobals param_8=Globals;
float param_7;
if ((int(animated_tmp)!=0))
{
float l9_125=0.0;
float l9_126=(*sc_set0.UserUniforms).animatedspeed;
l9_125=l9_126;
float l9_127=0.0;
l9_127=l9_125;
float l9_128=0.0;
l9_128=param_8.gTimeElapsed*l9_127;
float l9_129=0.0;
float l9_130=(*sc_set0.UserUniforms).offset;
l9_129=l9_130;
float l9_131=0.0;
l9_131=l9_129;
float l9_132=0.0;
l9_132=l9_128+l9_131;
param_5=l9_132;
param_7=param_5;
}
else
{
float l9_133=0.0;
float l9_134=(*sc_set0.UserUniforms).offset;
l9_133=l9_134;
float l9_135=0.0;
l9_135=l9_133;
param_6=l9_135;
param_7=param_6;
}
Result_N40=param_7;
float3 Value_N27=float3(0.0);
Value_N27=float3(Result_N40);
float2 Output_N28=float2(0.0);
Output_N28=float2(Value_N27.y,Value_N27.z);
float2 Output_N22=float2(0.0);
Output_N22=(Output_N21*Output_N26)+Output_N28;
float Noise_N23=0.0;
float2 param_9=Output_N22;
float2 param_10=(*sc_set0.UserUniforms).Port_Scale_N023;
param_9.x=floor(param_9.x*10000.0)*9.9999997e-05;
param_9.y=floor(param_9.y*10000.0)*9.9999997e-05;
param_9*=(param_10*0.5);
float2 l9_136=param_9;
float param_11=(snoise(l9_136)*0.5)+0.5;
param_11=floor(param_11*10000.0)*9.9999997e-05;
Noise_N23=param_11;
float2 Output_N15=float2(0.0);
Output_N15=float2(Position_N20.z,Position_N20.x);
float2 Output_N30=float2(0.0);
Output_N30=float2(Value_N35.z,Value_N35.x);
float2 Output_N31=float2(0.0);
Output_N31=float2(Value_N27.z,Value_N27.x);
float2 Output_N32=float2(0.0);
Output_N32=(Output_N15*Output_N30)+Output_N31;
float Noise_N25=0.0;
float2 param_12=Output_N32;
float2 param_13=(*sc_set0.UserUniforms).Port_Scale_N025;
param_12.x=floor(param_12.x*10000.0)*9.9999997e-05;
param_12.y=floor(param_12.y*10000.0)*9.9999997e-05;
param_12*=(param_13*0.5);
float2 l9_137=param_12;
float param_14=(snoise(l9_137)*0.5)+0.5;
param_14=floor(param_14*10000.0)*9.9999997e-05;
Noise_N25=param_14;
float2 Output_N36=float2(0.0);
Output_N36=float2(Position_N20.x,Position_N20.y);
float2 Output_N16=float2(0.0);
Output_N16=float2(Value_N35.x,Value_N35.y);
float2 Output_N43=float2(0.0);
Output_N43=float2(Value_N27.x,Value_N27.y);
float2 Output_N44=float2(0.0);
Output_N44=(Output_N36*Output_N16)+Output_N43;
float Noise_N45=0.0;
float2 param_15=Output_N44;
float2 param_16=(*sc_set0.UserUniforms).Port_Scale_N045;
param_15.x=floor(param_15.x*10000.0)*9.9999997e-05;
param_15.y=floor(param_15.y*10000.0)*9.9999997e-05;
param_15*=(param_16*0.5);
float2 l9_138=param_15;
float param_17=(snoise(l9_138)*0.5)+0.5;
param_17=floor(param_17*10000.0)*9.9999997e-05;
Noise_N45=param_17;
float Output_N46=0.0;
Output_N46=(Noise_N23+Noise_N25)+Noise_N45;
float Output_N47=0.0;
Output_N47=Output_N46*(*sc_set0.UserUniforms).Port_Input1_N047;
float Export_N48=0.0;
Export_N48=Output_N47;
float Output_N18=0.0;
Output_N18=Value_N34*Export_N48;
float3 Output_N29=float3(0.0);
Output_N29=Output_N10*float3(Output_N18);
float3 Output_N33=float3(0.0);
Output_N33=Position_N7+Output_N29;
float3 VectorOut_N0=float3(0.0);
VectorOut_N0=((*sc_set0.UserUniforms).sc_ModelMatrix*float4(Output_N33,1.0)).xyz;
float3 Export_N2=float3(0.0);
Export_N2=VectorOut_N0;
WorldPosition=Export_N2;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPosAndMotion.xyz;
WorldNormal=out.varNormalAndMotion.xyz;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_18=v;
float3 param_19=WorldPosition;
float3 param_20=WorldNormal;
float3 param_21=WorldTangent;
float4 param_22=v.position;
out.varPosAndMotion=float4(param_19.x,param_19.y,param_19.z,out.varPosAndMotion.w);
float3 l9_139=normalize(param_20);
out.varNormalAndMotion=float4(l9_139.x,l9_139.y,l9_139.z,out.varNormalAndMotion.w);
float3 l9_140=normalize(param_21);
out.varTangent=float4(l9_140.x,l9_140.y,l9_140.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_141=param_18.position;
float4 l9_142=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_143=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_143=0;
}
else
{
l9_143=gl_InstanceIndex%2;
}
int l9_144=l9_143;
l9_142=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_144]*l9_141;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_145=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_145=0;
}
else
{
l9_145=gl_InstanceIndex%2;
}
int l9_146=l9_145;
l9_142=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_146]*l9_141;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_147=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_147=0;
}
else
{
l9_147=gl_InstanceIndex%2;
}
int l9_148=l9_147;
l9_142=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_148]*l9_141;
}
else
{
l9_142=l9_141;
}
}
}
float4 l9_149=l9_142;
out.varViewSpaceDepth=-l9_149.z;
}
float4 l9_150=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_150=param_22;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_151=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_151=0;
}
else
{
l9_151=gl_InstanceIndex%2;
}
int l9_152=l9_151;
l9_150=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_152]*param_18.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_153=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_153=0;
}
else
{
l9_153=gl_InstanceIndex%2;
}
int l9_154=l9_153;
l9_150=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_154]*float4(out.varPosAndMotion.xyz,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_155=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_155=0;
}
else
{
l9_155=gl_InstanceIndex%2;
}
int l9_156=l9_155;
l9_150=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_156]*float4(out.varPosAndMotion.xyz,1.0);
}
}
}
}
out.varTex01=float4(param_18.texture0,param_18.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_157=param_18.position;
float4 l9_158=l9_157;
if (sc_RenderingSpace_tmp==1)
{
l9_158=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_157;
}
float4 l9_159=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_158;
float2 l9_160=((l9_159.xy/float2(l9_159.w))*0.5)+float2(0.5);
out.varShadowTex=l9_160;
}
float4 l9_161=l9_150;
if (sc_DepthBufferMode_tmp==1)
{
int l9_162=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_162=0;
}
else
{
l9_162=gl_InstanceIndex%2;
}
int l9_163=l9_162;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_163][2].w!=0.0)
{
float l9_164=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_161.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_161.w))*l9_164)-1.0)*l9_161.w;
}
}
float4 l9_165=l9_161;
l9_150=l9_165;
float4 l9_166=l9_150;
if ((int(sc_TAAEnabled_tmp)!=0))
{
float2 l9_167=l9_166.xy+((*sc_set0.UserUniforms).sc_TAAJitterOffset*l9_166.w);
l9_166=float4(l9_167.x,l9_167.y,l9_166.z,l9_166.w);
}
float4 l9_168=l9_166;
l9_150=l9_168;
float4 l9_169=l9_150;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_169.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_170=l9_169;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_171=dot(l9_170,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_172=l9_171;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_172;
}
}
float4 l9_173=float4(l9_169.x,-l9_169.y,(l9_169.z*0.5)+(l9_169.w*0.5),l9_169.w);
out.gl_Position=l9_173;
if ((int(sc_Voxelization_tmp)!=0))
{
sc_Vertex_t l9_175=param_18;
sc_Vertex_t l9_176=l9_175;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_177=l9_176;
float3 l9_178=in.blendShape0Pos;
float3 l9_179=in.blendShape0Normal;
float l9_180=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_181=l9_177;
float3 l9_182=l9_178;
float l9_183=l9_180;
float3 l9_184=l9_181.position.xyz+(l9_182*l9_183);
l9_181.position=float4(l9_184.x,l9_184.y,l9_184.z,l9_181.position.w);
l9_177=l9_181;
l9_177.normal+=(l9_179*l9_180);
l9_176=l9_177;
sc_Vertex_t l9_185=l9_176;
float3 l9_186=in.blendShape1Pos;
float3 l9_187=in.blendShape1Normal;
float l9_188=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_189=l9_185;
float3 l9_190=l9_186;
float l9_191=l9_188;
float3 l9_192=l9_189.position.xyz+(l9_190*l9_191);
l9_189.position=float4(l9_192.x,l9_192.y,l9_192.z,l9_189.position.w);
l9_185=l9_189;
l9_185.normal+=(l9_187*l9_188);
l9_176=l9_185;
sc_Vertex_t l9_193=l9_176;
float3 l9_194=in.blendShape2Pos;
float3 l9_195=in.blendShape2Normal;
float l9_196=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_197=l9_193;
float3 l9_198=l9_194;
float l9_199=l9_196;
float3 l9_200=l9_197.position.xyz+(l9_198*l9_199);
l9_197.position=float4(l9_200.x,l9_200.y,l9_200.z,l9_197.position.w);
l9_193=l9_197;
l9_193.normal+=(l9_195*l9_196);
l9_176=l9_193;
}
else
{
sc_Vertex_t l9_201=l9_176;
float3 l9_202=in.blendShape0Pos;
float l9_203=(*sc_set0.UserUniforms).weights0.x;
float3 l9_204=l9_201.position.xyz+(l9_202*l9_203);
l9_201.position=float4(l9_204.x,l9_204.y,l9_204.z,l9_201.position.w);
l9_176=l9_201;
sc_Vertex_t l9_205=l9_176;
float3 l9_206=in.blendShape1Pos;
float l9_207=(*sc_set0.UserUniforms).weights0.y;
float3 l9_208=l9_205.position.xyz+(l9_206*l9_207);
l9_205.position=float4(l9_208.x,l9_208.y,l9_208.z,l9_205.position.w);
l9_176=l9_205;
sc_Vertex_t l9_209=l9_176;
float3 l9_210=in.blendShape2Pos;
float l9_211=(*sc_set0.UserUniforms).weights0.z;
float3 l9_212=l9_209.position.xyz+(l9_210*l9_211);
l9_209.position=float4(l9_212.x,l9_212.y,l9_212.z,l9_209.position.w);
l9_176=l9_209;
sc_Vertex_t l9_213=l9_176;
float3 l9_214=in.blendShape3Pos;
float l9_215=(*sc_set0.UserUniforms).weights0.w;
float3 l9_216=l9_213.position.xyz+(l9_214*l9_215);
l9_213.position=float4(l9_216.x,l9_216.y,l9_216.z,l9_213.position.w);
l9_176=l9_213;
sc_Vertex_t l9_217=l9_176;
float3 l9_218=in.blendShape4Pos;
float l9_219=(*sc_set0.UserUniforms).weights1.x;
float3 l9_220=l9_217.position.xyz+(l9_218*l9_219);
l9_217.position=float4(l9_220.x,l9_220.y,l9_220.z,l9_217.position.w);
l9_176=l9_217;
sc_Vertex_t l9_221=l9_176;
float3 l9_222=in.blendShape5Pos;
float l9_223=(*sc_set0.UserUniforms).weights1.y;
float3 l9_224=l9_221.position.xyz+(l9_222*l9_223);
l9_221.position=float4(l9_224.x,l9_224.y,l9_224.z,l9_221.position.w);
l9_176=l9_221;
}
}
l9_175=l9_176;
sc_Vertex_t l9_225=l9_175;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_226=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_226=float4(1.0,fract(in.boneData.yzw));
l9_226.x-=dot(l9_226.yzw,float3(1.0));
}
float4 l9_227=l9_226;
float4 l9_228=l9_227;
int l9_229=int(in.boneData.x);
int l9_230=int(in.boneData.y);
int l9_231=int(in.boneData.z);
int l9_232=int(in.boneData.w);
int l9_233=l9_229;
float4 l9_234=l9_225.position;
float3 l9_235=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_236=l9_233;
float4 l9_237=(*sc_set0.sc_BonesUBO).sc_Bones[l9_236].boneMatrix[0];
float4 l9_238=(*sc_set0.sc_BonesUBO).sc_Bones[l9_236].boneMatrix[1];
float4 l9_239=(*sc_set0.sc_BonesUBO).sc_Bones[l9_236].boneMatrix[2];
float4 l9_240[3];
l9_240[0]=l9_237;
l9_240[1]=l9_238;
l9_240[2]=l9_239;
l9_235=float3(dot(l9_234,l9_240[0]),dot(l9_234,l9_240[1]),dot(l9_234,l9_240[2]));
}
else
{
l9_235=l9_234.xyz;
}
float3 l9_241=l9_235;
float3 l9_242=l9_241;
float l9_243=l9_228.x;
int l9_244=l9_230;
float4 l9_245=l9_225.position;
float3 l9_246=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_247=l9_244;
float4 l9_248=(*sc_set0.sc_BonesUBO).sc_Bones[l9_247].boneMatrix[0];
float4 l9_249=(*sc_set0.sc_BonesUBO).sc_Bones[l9_247].boneMatrix[1];
float4 l9_250=(*sc_set0.sc_BonesUBO).sc_Bones[l9_247].boneMatrix[2];
float4 l9_251[3];
l9_251[0]=l9_248;
l9_251[1]=l9_249;
l9_251[2]=l9_250;
l9_246=float3(dot(l9_245,l9_251[0]),dot(l9_245,l9_251[1]),dot(l9_245,l9_251[2]));
}
else
{
l9_246=l9_245.xyz;
}
float3 l9_252=l9_246;
float3 l9_253=l9_252;
float l9_254=l9_228.y;
int l9_255=l9_231;
float4 l9_256=l9_225.position;
float3 l9_257=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_258=l9_255;
float4 l9_259=(*sc_set0.sc_BonesUBO).sc_Bones[l9_258].boneMatrix[0];
float4 l9_260=(*sc_set0.sc_BonesUBO).sc_Bones[l9_258].boneMatrix[1];
float4 l9_261=(*sc_set0.sc_BonesUBO).sc_Bones[l9_258].boneMatrix[2];
float4 l9_262[3];
l9_262[0]=l9_259;
l9_262[1]=l9_260;
l9_262[2]=l9_261;
l9_257=float3(dot(l9_256,l9_262[0]),dot(l9_256,l9_262[1]),dot(l9_256,l9_262[2]));
}
else
{
l9_257=l9_256.xyz;
}
float3 l9_263=l9_257;
float3 l9_264=l9_263;
float l9_265=l9_228.z;
int l9_266=l9_232;
float4 l9_267=l9_225.position;
float3 l9_268=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_269=l9_266;
float4 l9_270=(*sc_set0.sc_BonesUBO).sc_Bones[l9_269].boneMatrix[0];
float4 l9_271=(*sc_set0.sc_BonesUBO).sc_Bones[l9_269].boneMatrix[1];
float4 l9_272=(*sc_set0.sc_BonesUBO).sc_Bones[l9_269].boneMatrix[2];
float4 l9_273[3];
l9_273[0]=l9_270;
l9_273[1]=l9_271;
l9_273[2]=l9_272;
l9_268=float3(dot(l9_267,l9_273[0]),dot(l9_267,l9_273[1]),dot(l9_267,l9_273[2]));
}
else
{
l9_268=l9_267.xyz;
}
float3 l9_274=l9_268;
float3 l9_275=(((l9_242*l9_243)+(l9_253*l9_254))+(l9_264*l9_265))+(l9_274*l9_228.w);
l9_225.position=float4(l9_275.x,l9_275.y,l9_275.z,l9_225.position.w);
int l9_276=l9_229;
float3x3 l9_277=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_276].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_276].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_276].normalMatrix[2].xyz));
float3x3 l9_278=l9_277;
float3x3 l9_279=l9_278;
int l9_280=l9_230;
float3x3 l9_281=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_280].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_280].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_280].normalMatrix[2].xyz));
float3x3 l9_282=l9_281;
float3x3 l9_283=l9_282;
int l9_284=l9_231;
float3x3 l9_285=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_284].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_284].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_284].normalMatrix[2].xyz));
float3x3 l9_286=l9_285;
float3x3 l9_287=l9_286;
int l9_288=l9_232;
float3x3 l9_289=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_288].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_288].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_288].normalMatrix[2].xyz));
float3x3 l9_290=l9_289;
float3x3 l9_291=l9_290;
l9_225.normal=((((l9_279*l9_225.normal)*l9_228.x)+((l9_283*l9_225.normal)*l9_228.y))+((l9_287*l9_225.normal)*l9_228.z))+((l9_291*l9_225.normal)*l9_228.w);
l9_225.tangent=((((l9_279*l9_225.tangent)*l9_228.x)+((l9_283*l9_225.tangent)*l9_228.y))+((l9_287*l9_225.tangent)*l9_228.z))+((l9_291*l9_225.tangent)*l9_228.w);
}
l9_175=l9_225;
float l9_292=(*sc_set0.UserUniforms).voxelization_params_0.y;
float l9_293=(*sc_set0.UserUniforms).voxelization_params_0.z;
float l9_294=(*sc_set0.UserUniforms).voxelization_params_0.w;
float l9_295=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.x;
float l9_296=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.y;
float l9_297=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.z;
float l9_298=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.w;
float l9_299=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.x;
float l9_300=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.y;
float3 l9_301=(*sc_set0.UserUniforms).voxelization_params_camera_pos;
float l9_302=l9_292/l9_293;
int l9_303=gl_InstanceIndex;
int l9_304=l9_303;
l9_175.position=(*sc_set0.UserUniforms).sc_ModelMatrixVoxelization*l9_175.position;
float3 l9_305=l9_175.position.xyz;
float3 l9_306=float3(float(l9_304%int(l9_294))*l9_292,float(l9_304/int(l9_294))*l9_292,(float(l9_304)*l9_302)+l9_299);
float3 l9_307=l9_305+l9_306;
float4 l9_308=float4(l9_307-l9_301,1.0);
float l9_309=l9_295;
float l9_310=l9_296;
float l9_311=l9_297;
float l9_312=l9_298;
float l9_313=l9_299;
float l9_314=l9_300;
float4x4 l9_315=float4x4(float4(2.0/(l9_310-l9_309),0.0,0.0,(-(l9_310+l9_309))/(l9_310-l9_309)),float4(0.0,2.0/(l9_312-l9_311),0.0,(-(l9_312+l9_311))/(l9_312-l9_311)),float4(0.0,0.0,(-2.0)/(l9_314-l9_313),(-(l9_314+l9_313))/(l9_314-l9_313)),float4(0.0,0.0,0.0,1.0));
float4x4 l9_316=l9_315;
float4 l9_317=l9_316*l9_308;
l9_317.w=1.0;
out.varScreenPos=l9_317;
float4 l9_318=l9_317*1.0;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_318.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_319=l9_318;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_320=dot(l9_319,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_321=l9_320;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_321;
}
}
float4 l9_322=float4(l9_318.x,-l9_318.y,(l9_318.z*0.5)+(l9_318.w*0.5),l9_318.w);
out.gl_Position=l9_322;
param_18=l9_175;
}
else
{
if ((int(sc_OutputBounds_tmp)!=0))
{
sc_Vertex_t l9_323=param_18;
sc_Vertex_t l9_324=l9_323;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_325=l9_324;
float3 l9_326=in.blendShape0Pos;
float3 l9_327=in.blendShape0Normal;
float l9_328=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_329=l9_325;
float3 l9_330=l9_326;
float l9_331=l9_328;
float3 l9_332=l9_329.position.xyz+(l9_330*l9_331);
l9_329.position=float4(l9_332.x,l9_332.y,l9_332.z,l9_329.position.w);
l9_325=l9_329;
l9_325.normal+=(l9_327*l9_328);
l9_324=l9_325;
sc_Vertex_t l9_333=l9_324;
float3 l9_334=in.blendShape1Pos;
float3 l9_335=in.blendShape1Normal;
float l9_336=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_337=l9_333;
float3 l9_338=l9_334;
float l9_339=l9_336;
float3 l9_340=l9_337.position.xyz+(l9_338*l9_339);
l9_337.position=float4(l9_340.x,l9_340.y,l9_340.z,l9_337.position.w);
l9_333=l9_337;
l9_333.normal+=(l9_335*l9_336);
l9_324=l9_333;
sc_Vertex_t l9_341=l9_324;
float3 l9_342=in.blendShape2Pos;
float3 l9_343=in.blendShape2Normal;
float l9_344=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_345=l9_341;
float3 l9_346=l9_342;
float l9_347=l9_344;
float3 l9_348=l9_345.position.xyz+(l9_346*l9_347);
l9_345.position=float4(l9_348.x,l9_348.y,l9_348.z,l9_345.position.w);
l9_341=l9_345;
l9_341.normal+=(l9_343*l9_344);
l9_324=l9_341;
}
else
{
sc_Vertex_t l9_349=l9_324;
float3 l9_350=in.blendShape0Pos;
float l9_351=(*sc_set0.UserUniforms).weights0.x;
float3 l9_352=l9_349.position.xyz+(l9_350*l9_351);
l9_349.position=float4(l9_352.x,l9_352.y,l9_352.z,l9_349.position.w);
l9_324=l9_349;
sc_Vertex_t l9_353=l9_324;
float3 l9_354=in.blendShape1Pos;
float l9_355=(*sc_set0.UserUniforms).weights0.y;
float3 l9_356=l9_353.position.xyz+(l9_354*l9_355);
l9_353.position=float4(l9_356.x,l9_356.y,l9_356.z,l9_353.position.w);
l9_324=l9_353;
sc_Vertex_t l9_357=l9_324;
float3 l9_358=in.blendShape2Pos;
float l9_359=(*sc_set0.UserUniforms).weights0.z;
float3 l9_360=l9_357.position.xyz+(l9_358*l9_359);
l9_357.position=float4(l9_360.x,l9_360.y,l9_360.z,l9_357.position.w);
l9_324=l9_357;
sc_Vertex_t l9_361=l9_324;
float3 l9_362=in.blendShape3Pos;
float l9_363=(*sc_set0.UserUniforms).weights0.w;
float3 l9_364=l9_361.position.xyz+(l9_362*l9_363);
l9_361.position=float4(l9_364.x,l9_364.y,l9_364.z,l9_361.position.w);
l9_324=l9_361;
sc_Vertex_t l9_365=l9_324;
float3 l9_366=in.blendShape4Pos;
float l9_367=(*sc_set0.UserUniforms).weights1.x;
float3 l9_368=l9_365.position.xyz+(l9_366*l9_367);
l9_365.position=float4(l9_368.x,l9_368.y,l9_368.z,l9_365.position.w);
l9_324=l9_365;
sc_Vertex_t l9_369=l9_324;
float3 l9_370=in.blendShape5Pos;
float l9_371=(*sc_set0.UserUniforms).weights1.y;
float3 l9_372=l9_369.position.xyz+(l9_370*l9_371);
l9_369.position=float4(l9_372.x,l9_372.y,l9_372.z,l9_369.position.w);
l9_324=l9_369;
}
}
l9_323=l9_324;
sc_Vertex_t l9_373=l9_323;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_374=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_374=float4(1.0,fract(in.boneData.yzw));
l9_374.x-=dot(l9_374.yzw,float3(1.0));
}
float4 l9_375=l9_374;
float4 l9_376=l9_375;
int l9_377=int(in.boneData.x);
int l9_378=int(in.boneData.y);
int l9_379=int(in.boneData.z);
int l9_380=int(in.boneData.w);
int l9_381=l9_377;
float4 l9_382=l9_373.position;
float3 l9_383=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_384=l9_381;
float4 l9_385=(*sc_set0.sc_BonesUBO).sc_Bones[l9_384].boneMatrix[0];
float4 l9_386=(*sc_set0.sc_BonesUBO).sc_Bones[l9_384].boneMatrix[1];
float4 l9_387=(*sc_set0.sc_BonesUBO).sc_Bones[l9_384].boneMatrix[2];
float4 l9_388[3];
l9_388[0]=l9_385;
l9_388[1]=l9_386;
l9_388[2]=l9_387;
l9_383=float3(dot(l9_382,l9_388[0]),dot(l9_382,l9_388[1]),dot(l9_382,l9_388[2]));
}
else
{
l9_383=l9_382.xyz;
}
float3 l9_389=l9_383;
float3 l9_390=l9_389;
float l9_391=l9_376.x;
int l9_392=l9_378;
float4 l9_393=l9_373.position;
float3 l9_394=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_395=l9_392;
float4 l9_396=(*sc_set0.sc_BonesUBO).sc_Bones[l9_395].boneMatrix[0];
float4 l9_397=(*sc_set0.sc_BonesUBO).sc_Bones[l9_395].boneMatrix[1];
float4 l9_398=(*sc_set0.sc_BonesUBO).sc_Bones[l9_395].boneMatrix[2];
float4 l9_399[3];
l9_399[0]=l9_396;
l9_399[1]=l9_397;
l9_399[2]=l9_398;
l9_394=float3(dot(l9_393,l9_399[0]),dot(l9_393,l9_399[1]),dot(l9_393,l9_399[2]));
}
else
{
l9_394=l9_393.xyz;
}
float3 l9_400=l9_394;
float3 l9_401=l9_400;
float l9_402=l9_376.y;
int l9_403=l9_379;
float4 l9_404=l9_373.position;
float3 l9_405=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_406=l9_403;
float4 l9_407=(*sc_set0.sc_BonesUBO).sc_Bones[l9_406].boneMatrix[0];
float4 l9_408=(*sc_set0.sc_BonesUBO).sc_Bones[l9_406].boneMatrix[1];
float4 l9_409=(*sc_set0.sc_BonesUBO).sc_Bones[l9_406].boneMatrix[2];
float4 l9_410[3];
l9_410[0]=l9_407;
l9_410[1]=l9_408;
l9_410[2]=l9_409;
l9_405=float3(dot(l9_404,l9_410[0]),dot(l9_404,l9_410[1]),dot(l9_404,l9_410[2]));
}
else
{
l9_405=l9_404.xyz;
}
float3 l9_411=l9_405;
float3 l9_412=l9_411;
float l9_413=l9_376.z;
int l9_414=l9_380;
float4 l9_415=l9_373.position;
float3 l9_416=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_417=l9_414;
float4 l9_418=(*sc_set0.sc_BonesUBO).sc_Bones[l9_417].boneMatrix[0];
float4 l9_419=(*sc_set0.sc_BonesUBO).sc_Bones[l9_417].boneMatrix[1];
float4 l9_420=(*sc_set0.sc_BonesUBO).sc_Bones[l9_417].boneMatrix[2];
float4 l9_421[3];
l9_421[0]=l9_418;
l9_421[1]=l9_419;
l9_421[2]=l9_420;
l9_416=float3(dot(l9_415,l9_421[0]),dot(l9_415,l9_421[1]),dot(l9_415,l9_421[2]));
}
else
{
l9_416=l9_415.xyz;
}
float3 l9_422=l9_416;
float3 l9_423=(((l9_390*l9_391)+(l9_401*l9_402))+(l9_412*l9_413))+(l9_422*l9_376.w);
l9_373.position=float4(l9_423.x,l9_423.y,l9_423.z,l9_373.position.w);
int l9_424=l9_377;
float3x3 l9_425=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_424].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_424].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_424].normalMatrix[2].xyz));
float3x3 l9_426=l9_425;
float3x3 l9_427=l9_426;
int l9_428=l9_378;
float3x3 l9_429=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_428].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_428].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_428].normalMatrix[2].xyz));
float3x3 l9_430=l9_429;
float3x3 l9_431=l9_430;
int l9_432=l9_379;
float3x3 l9_433=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_432].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_432].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_432].normalMatrix[2].xyz));
float3x3 l9_434=l9_433;
float3x3 l9_435=l9_434;
int l9_436=l9_380;
float3x3 l9_437=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_436].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_436].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_436].normalMatrix[2].xyz));
float3x3 l9_438=l9_437;
float3x3 l9_439=l9_438;
l9_373.normal=((((l9_427*l9_373.normal)*l9_376.x)+((l9_431*l9_373.normal)*l9_376.y))+((l9_435*l9_373.normal)*l9_376.z))+((l9_439*l9_373.normal)*l9_376.w);
l9_373.tangent=((((l9_427*l9_373.tangent)*l9_376.x)+((l9_431*l9_373.tangent)*l9_376.y))+((l9_435*l9_373.tangent)*l9_376.z))+((l9_439*l9_373.tangent)*l9_376.w);
}
l9_323=l9_373;
float3 l9_440=(*sc_set0.UserUniforms).voxelization_params_camera_pos;
float2 l9_441=((l9_323.position.xy/float2(l9_323.position.w))*0.5)+float2(0.5);
out.varTex01=float4(l9_441.x,l9_441.y,out.varTex01.z,out.varTex01.w);
l9_323.position=(*sc_set0.UserUniforms).sc_ModelMatrixVoxelization*l9_323.position;
float3 l9_442=l9_323.position.xyz-l9_440;
l9_323.position=float4(l9_442.x,l9_442.y,l9_442.z,l9_323.position.w);
out.varPosAndMotion=float4(l9_323.position.xyz.x,l9_323.position.xyz.y,l9_323.position.xyz.z,out.varPosAndMotion.w);
float3 l9_443=normalize(l9_323.normal);
out.varNormalAndMotion=float4(l9_443.x,l9_443.y,l9_443.z,out.varNormalAndMotion.w);
float l9_444=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.x;
float l9_445=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.y;
float l9_446=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.z;
float l9_447=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.w;
float l9_448=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.x;
float l9_449=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.y;
float l9_450=l9_444;
float l9_451=l9_445;
float l9_452=l9_446;
float l9_453=l9_447;
float l9_454=l9_448;
float l9_455=l9_449;
float4x4 l9_456=float4x4(float4(2.0/(l9_451-l9_450),0.0,0.0,(-(l9_451+l9_450))/(l9_451-l9_450)),float4(0.0,2.0/(l9_453-l9_452),0.0,(-(l9_453+l9_452))/(l9_453-l9_452)),float4(0.0,0.0,(-2.0)/(l9_455-l9_454),(-(l9_455+l9_454))/(l9_455-l9_454)),float4(0.0,0.0,0.0,1.0));
float4x4 l9_457=l9_456;
float4 l9_458=float4(0.0);
float3 l9_459=(l9_457*l9_323.position).xyz;
l9_458=float4(l9_459.x,l9_459.y,l9_459.z,l9_458.w);
l9_458.w=1.0;
out.varScreenPos=l9_458;
float4 l9_460=l9_458*1.0;
float4 l9_461=l9_460;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_461.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_462=l9_461;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_463=dot(l9_462,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_464=l9_463;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_464;
}
}
float4 l9_465=float4(l9_461.x,-l9_461.y,(l9_461.z*0.5)+(l9_461.w*0.5),l9_461.w);
out.gl_Position=l9_465;
param_18=l9_323;
}
}
v=param_18;
float3 param_23=out.varPosAndMotion.xyz;
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float4 l9_466=((*sc_set0.UserUniforms).sc_PrevFrameModelMatrix*(*sc_set0.UserUniforms).sc_ModelMatrixInverse)*float4(param_23,1.0);
float3 l9_467=param_23;
float3 l9_468=l9_466.xyz;
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
int l9_469=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_469=0;
}
else
{
l9_469=gl_InstanceIndex%2;
}
int l9_470=l9_469;
float4 l9_471=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_470]*float4(l9_467,1.0);
float2 l9_472=l9_471.xy/float2(l9_471.w);
l9_471=float4(l9_472.x,l9_472.y,l9_471.z,l9_471.w);
int l9_473=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_473=0;
}
else
{
l9_473=gl_InstanceIndex%2;
}
int l9_474=l9_473;
float4 l9_475=(*sc_set0.UserUniforms).sc_PrevFrameViewProjectionMatrixArray[l9_474]*float4(l9_468,1.0);
float2 l9_476=l9_475.xy/float2(l9_475.w);
l9_475=float4(l9_476.x,l9_476.y,l9_475.z,l9_475.w);
float2 l9_477=(l9_471.xy-l9_475.xy)*0.5;
out.varPosAndMotion.w=l9_477.x;
out.varNormalAndMotion.w=l9_477.y;
}
}
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct SurfaceProperties
{
float3 albedo;
float opacity;
float3 normal;
float3 positionWS;
float3 viewDirWS;
float metallic;
float roughness;
float3 emissive;
float3 ao;
float3 specularAo;
float3 bakedShadows;
float3 specColor;
};
struct LightingComponents
{
float3 directDiffuse;
float3 directSpecular;
float3 indirectDiffuse;
float3 indirectSpecular;
float3 emitted;
float3 transmitted;
};
struct LightProperties
{
float3 direction;
float3 color;
float attenuation;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
float3 SurfacePosition_WorldSpace;
float2 gScreenCoord;
float2 Surface_UVCoord0;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float shaderComplexityValue;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int sc_RayTracingReceiverEffectsMask;
float4 sc_RayTracingReflectionsSize;
float4 sc_RayTracingReflectionsDims;
float4 sc_RayTracingReflectionsView;
float4 sc_RayTracingGlobalIlluminationSize;
float4 sc_RayTracingGlobalIlluminationDims;
float4 sc_RayTracingGlobalIlluminationView;
float4 sc_RayTracingShadowsSize;
float4 sc_RayTracingShadowsDims;
float4 sc_RayTracingShadowsView;
float3 sc_RayTracingOriginScale;
uint sc_RayTracingReceiverMask;
float3 sc_RayTracingOriginScaleInv;
float3 sc_RayTracingOriginOffset;
uint sc_RayTracingReceiverId;
float4 voxelization_params_0;
float4 voxelization_params_frustum_lrbt;
float4 voxelization_params_frustum_nf;
float3 voxelization_params_camera_pos;
float4x4 sc_ModelMatrixVoxelization;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float strength;
float noiseScale;
float animatedspeed;
float offset;
float4 baseColor;
float4 backgroundSize;
float4 backgroundDims;
float4 backgroundView;
float3x3 backgroundTransform;
float4 backgroundUvMinMax;
float4 backgroundBorderColor;
float chromaticAberration;
float intensity;
float thickness;
float4 colorTint;
float exponent;
float darken;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float uvScale;
float roughness;
float4 opacityTextureSize;
float4 opacityTextureDims;
float4 opacityTextureView;
float3x3 opacityTextureTransform;
float4 opacityTextureUvMinMax;
float4 opacityTextureBorderColor;
float Port_Import_N034;
float Port_Import_N037;
float3 Port_Import_N035;
float Port_Import_N049;
float Port_Import_N005;
float Port_Import_N041;
float3 Port_Import_N027;
float2 Port_Scale_N023;
float2 Port_Scale_N025;
float2 Port_Scale_N045;
float Port_Input1_N047;
float Port_Import_N068;
float Port_Input0_N070;
float Port_Input2_N071;
float Port_Import_N080;
float Port_Input2_N062;
float Port_Import_N064;
float2 Port_Import_N083;
float Port_Import_N056;
float Port_Import_N086;
float3 Port_Import_N054;
float3 Port_Import_N095;
float Port_Input2_N097;
float Port_Input0_N105;
float Port_Input0_N099;
float Port_Import_N098;
float Port_Import_N075;
float Port_Import_N101;
float Port_Import_N076;
float Port_Import_N104;
float Port_Opacity_N006;
float2 Port_Center_N121;
float3 Port_Emissive_N006;
float Port_Metallic_N006;
float3 Port_AO_N006;
float3 Port_SpecularAO_N006;
float Port_Input2_N110;
float Port_Input1_N113;
float Port_Input2_N113;
};
struct sc_PointLight_t_1
{
bool falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_Set0
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> background [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> normalTex [[id(3)]];
texture2d<float> opacityTexture [[id(4)]];
texture2d<float> sc_EnvmapDiffuse [[id(5)]];
texture2d<float> sc_EnvmapSpecular [[id(6)]];
texture2d<float> sc_RayTracingGlobalIllumination [[id(15)]];
texture2d<float> sc_RayTracingReflections [[id(16)]];
texture2d<float> sc_RayTracingShadows [[id(17)]];
texture2d<float> sc_SSAOTexture [[id(18)]];
texture2d<float> sc_ScreenTexture [[id(19)]];
texture2d<float> sc_ShadowTexture [[id(20)]];
sampler backgroundSmpSC [[id(22)]];
sampler intensityTextureSmpSC [[id(23)]];
sampler normalTexSmpSC [[id(24)]];
sampler opacityTextureSmpSC [[id(25)]];
sampler sc_EnvmapDiffuseSmpSC [[id(26)]];
sampler sc_EnvmapSpecularSmpSC [[id(27)]];
sampler sc_RayTracingGlobalIlluminationSmpSC [[id(29)]];
sampler sc_RayTracingReflectionsSmpSC [[id(30)]];
sampler sc_RayTracingShadowsSmpSC [[id(31)]];
sampler sc_SSAOTextureSmpSC [[id(32)]];
sampler sc_ScreenTextureSmpSC [[id(33)]];
sampler sc_ShadowTextureSmpSC [[id(34)]];
constant userUniformsObj* UserUniforms [[id(36)]];
};
struct main_frag_out
{
float4 sc_FragData0 [[color(0)]];
};
struct main_frag_in
{
float4 varPosAndMotion [[user(locn0)]];
float4 varNormalAndMotion [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varTex01 [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
float3 evaluateSSAO(thread const float3& positionWS,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_SSAOTexture,thread sampler sc_SSAOTextureSmpSC)
{
if ((int(sc_SSAOEnabled_tmp)!=0))
{
int l9_0=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_0=0;
}
else
{
l9_0=varStereoViewID;
}
int l9_1=l9_0;
float4 clipSpaceCoord=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(positionWS,1.0);
float3 l9_2=clipSpaceCoord.xyz/float3(clipSpaceCoord.w);
clipSpaceCoord=float4(l9_2.x,l9_2.y,l9_2.z,clipSpaceCoord.w);
float4 shadowSample=sc_SSAOTexture.sample(sc_SSAOTextureSmpSC,((clipSpaceCoord.xy*0.5)+float2(0.5)));
return float3(shadowSample.x);
}
else
{
return float3(1.0);
}
}
float3 calculateDirectSpecular(thread const SurfaceProperties& surfaceProperties,thread const float3& L,thread const float3& V)
{
float r=fast::max(surfaceProperties.roughness,0.029999999);
float3 F0=surfaceProperties.specColor;
float3 N=surfaceProperties.normal;
float3 H=normalize(L+V);
float param=dot(N,L);
float l9_0=fast::clamp(param,0.0,1.0);
float NdotL=l9_0;
float param_1=dot(N,V);
float l9_1=fast::clamp(param_1,0.0,1.0);
float NdotV=l9_1;
float param_2=dot(N,H);
float l9_2=fast::clamp(param_2,0.0,1.0);
float NdotH=l9_2;
float param_3=dot(V,H);
float l9_3=fast::clamp(param_3,0.0,1.0);
float VdotH=l9_3;
if (SC_DEVICE_CLASS_tmp>=2)
{
float param_4=NdotH;
float param_5=r;
float l9_4=param_5*param_5;
float l9_5=l9_4*l9_4;
float l9_6=param_4*param_4;
float l9_7=(l9_6*(l9_5-1.0))+1.0;
float l9_8=l9_7*l9_7;
float l9_9=9.9999999e-09;
float l9_10=l9_5/(l9_8+l9_9);
float param_6=NdotL;
float param_7=NdotV;
float param_8=r;
float l9_11=param_6;
float l9_12=param_8;
float l9_13=l9_12+1.0;
l9_13=(l9_13*l9_13)*0.125;
float l9_14=(l9_11*(1.0-l9_13))+l9_13;
float l9_15=param_7;
float l9_16=param_8;
float l9_17=l9_16+1.0;
l9_17=(l9_17*l9_17)*0.125;
float l9_18=(l9_15*(1.0-l9_17))+l9_17;
float l9_19=1.0/(l9_14*l9_18);
float param_9=VdotH;
float3 param_10=F0;
float l9_20=param_9;
float3 l9_21=param_10;
float3 l9_22=float3(1.0);
float l9_23=1.0-l9_20;
float l9_24=l9_23*l9_23;
float l9_25=(l9_24*l9_24)*l9_23;
float3 l9_26=l9_21+((l9_22-l9_21)*l9_25);
float3 l9_27=l9_26;
return l9_27*(((l9_10*l9_19)*0.25)*NdotL);
}
else
{
float specPower=exp2(11.0-(10.0*r));
float param_11=VdotH;
float3 param_12=F0;
float l9_28=param_11;
float3 l9_29=param_12;
float3 l9_30=float3(1.0);
float l9_31=1.0-l9_28;
float l9_32=l9_31*l9_31;
float l9_33=(l9_32*l9_32)*l9_31;
float3 l9_34=l9_29+((l9_30-l9_29)*l9_33);
float3 l9_35=l9_34;
return ((l9_35*((specPower*0.125)+0.25))*pow(NdotH,specPower))*NdotL;
}
}
float computeDistanceAttenuation(thread const float& distanceToLight,thread const float& falloffEndDistance)
{
float distanceToLightSquared=distanceToLight*distanceToLight;
if (falloffEndDistance==0.0)
{
return 1.0/distanceToLightSquared;
}
float distanceToLightToTheFourth=distanceToLightSquared*distanceToLightSquared;
float falloffEndDistanceToTheFourth=pow(falloffEndDistance,4.0);
return fast::max(fast::min(1.0-(distanceToLightToTheFourth/falloffEndDistanceToTheFourth),1.0),0.0)/distanceToLightSquared;
}
float2 calcSeamlessPanoramicUvsForSampling(thread const float2& uv,thread const float2& topMipRes,thread const float& lod)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 thisMipRes=fast::max(float2(1.0),topMipRes/float2(exp2(lod)));
return ((uv*(thisMipRes-float2(1.0)))/thisMipRes)+(float2(0.5)/thisMipRes);
}
else
{
return uv;
}
}
float3 getSpecularDominantDir(thread const float3& N,thread const float3& R,thread const float& roughness)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float lerpFactor=(roughness*roughness)*roughness;
return normalize(mix(R,N,float3(lerpFactor)));
}
else
{
return R;
}
}
float3 envBRDFApprox(thread const SurfaceProperties& surfaceProperties,thread const float& NdotV)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float param=surfaceProperties.roughness;
float param_1=NdotV;
float4 l9_0=(float4(-1.0,-0.0275,-0.57200003,0.022)*param)+float4(1.0,0.0425,1.04,-0.039999999);
float l9_1=(fast::min(l9_0.x*l9_0.x,exp2((-9.2799997)*param_1))*l9_0.x)+l9_0.y;
float2 l9_2=(float2(-1.04,1.04)*l9_1)+l9_0.zw;
float2 l9_3=l9_2;
float2 AB=l9_3;
return fast::max((surfaceProperties.specColor*AB.x)+float3(AB.y),float3(0.0));
}
else
{
float3 fresnelMax=fast::max(float3(1.0-surfaceProperties.roughness),surfaceProperties.specColor);
float param_2=NdotV;
float3 param_3=surfaceProperties.specColor;
float3 param_4=fresnelMax;
float l9_4=1.0-param_2;
float l9_5=l9_4*l9_4;
float l9_6=(l9_5*l9_5)*l9_4;
float3 l9_7=param_3+((param_4-param_3)*l9_6);
return l9_7;
}
}
float srgbToLinear(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,2.2);
}
else
{
return x*x;
}
}
float linearToSrgb(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,0.45454547);
}
else
{
return sqrt(x);
}
}
float transformSingleColor(thread const float& original,thread const float& intMap,thread const float& target)
{
if (((int(BLEND_MODE_REALISTIC_tmp)!=0)||(int(BLEND_MODE_FORGRAY_tmp)!=0))||(int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
return original/pow(1.0-target,intMap);
}
else
{
if ((int(BLEND_MODE_DIVISION_tmp)!=0))
{
return original/(1.0-target);
}
else
{
if ((int(BLEND_MODE_BRIGHT_tmp)!=0))
{
return original/pow(1.0-target,2.0-(2.0*original));
}
}
}
return 0.0;
}
float3 transformColor(thread const float& yValue,thread const float3& original,thread const float3& target,thread const float& weight,thread const float& intMap)
{
if ((int(BLEND_MODE_INTENSE_tmp)!=0))
{
float3 param=original;
float3 l9_0=param;
float4 l9_1;
if (l9_0.y<l9_0.z)
{
l9_1=float4(l9_0.zy,-1.0,0.66666669);
}
else
{
l9_1=float4(l9_0.yz,0.0,-0.33333334);
}
float4 l9_2=l9_1;
float4 l9_3;
if (l9_0.x<l9_2.x)
{
l9_3=float4(l9_2.xyw,l9_0.x);
}
else
{
l9_3=float4(l9_0.x,l9_2.yzx);
}
float4 l9_4=l9_3;
float l9_5=l9_4.x-fast::min(l9_4.w,l9_4.y);
float l9_6=abs(((l9_4.w-l9_4.y)/((6.0*l9_5)+1e-07))+l9_4.z);
float l9_7=l9_4.x;
float3 l9_8=float3(l9_6,l9_5,l9_7);
float3 l9_9=l9_8;
float l9_10=l9_9.z-(l9_9.y*0.5);
float l9_11=l9_9.y/((1.0-abs((2.0*l9_10)-1.0))+1e-07);
float3 l9_12=float3(l9_9.x,l9_11,l9_10);
float3 hslOrig=l9_12;
float3 res=float3(0.0);
res.x=target.x;
res.y=target.y;
res.z=hslOrig.z;
float3 param_1=res;
float l9_13=param_1.x;
float l9_14=abs((6.0*l9_13)-3.0)-1.0;
float l9_15=2.0-abs((6.0*l9_13)-2.0);
float l9_16=2.0-abs((6.0*l9_13)-4.0);
float3 l9_17=fast::clamp(float3(l9_14,l9_15,l9_16),float3(0.0),float3(1.0));
float3 l9_18=l9_17;
float l9_19=(1.0-abs((2.0*param_1.z)-1.0))*param_1.y;
l9_18=((l9_18-float3(0.5))*l9_19)+float3(param_1.z);
float3 l9_20=l9_18;
res=l9_20;
float3 resColor=mix(original,res,float3(weight));
return resColor;
}
else
{
float3 tmpColor=float3(0.0);
float param_2=yValue;
float param_3=intMap;
float param_4=target.x;
tmpColor.x=transformSingleColor(param_2,param_3,param_4);
float param_5=yValue;
float param_6=intMap;
float param_7=target.y;
tmpColor.y=transformSingleColor(param_5,param_6,param_7);
float param_8=yValue;
float param_9=intMap;
float param_10=target.z;
tmpColor.z=transformSingleColor(param_8,param_9,param_10);
tmpColor=fast::clamp(tmpColor,float3(0.0),float3(1.0));
float3 resColor_1=mix(original,tmpColor,float3(weight));
return resColor_1;
}
}
float3 definedBlend(thread const float3& a,thread const float3& b,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> intensityTexture,thread sampler intensityTextureSmpSC)
{
if ((int(BLEND_MODE_LIGHTEN_tmp)!=0))
{
return fast::max(a,b);
}
else
{
if ((int(BLEND_MODE_DARKEN_tmp)!=0))
{
return fast::min(a,b);
}
else
{
if ((int(BLEND_MODE_DIVIDE_tmp)!=0))
{
return b/a;
}
else
{
if ((int(BLEND_MODE_AVERAGE_tmp)!=0))
{
return (a+b)*0.5;
}
else
{
if ((int(BLEND_MODE_SUBTRACT_tmp)!=0))
{
return fast::max((a+b)-float3(1.0),float3(0.0));
}
else
{
if ((int(BLEND_MODE_DIFFERENCE_tmp)!=0))
{
return abs(a-b);
}
else
{
if ((int(BLEND_MODE_NEGATION_tmp)!=0))
{
return float3(1.0)-abs((float3(1.0)-a)-b);
}
else
{
if ((int(BLEND_MODE_EXCLUSION_tmp)!=0))
{
return (a+b)-((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_OVERLAY_tmp)!=0))
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1=l9_0;
float l9_2;
if (a.y<0.5)
{
l9_2=(2.0*a.y)*b.y;
}
else
{
l9_2=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_3=l9_2;
float l9_4;
if (a.z<0.5)
{
l9_4=(2.0*a.z)*b.z;
}
else
{
l9_4=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return float3(l9_1,l9_3,l9_4);
}
else
{
if ((int(BLEND_MODE_SOFT_LIGHT_tmp)!=0))
{
return (((float3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_HARD_LIGHT_tmp)!=0))
{
float l9_5;
if (b.x<0.5)
{
l9_5=(2.0*b.x)*a.x;
}
else
{
l9_5=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_6=l9_5;
float l9_7;
if (b.y<0.5)
{
l9_7=(2.0*b.y)*a.y;
}
else
{
l9_7=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_8=l9_7;
float l9_9;
if (b.z<0.5)
{
l9_9=(2.0*b.z)*a.z;
}
else
{
l9_9=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return float3(l9_6,l9_8,l9_9);
}
else
{
if ((int(BLEND_MODE_COLOR_DODGE_tmp)!=0))
{
float l9_10;
if (b.x==1.0)
{
l9_10=b.x;
}
else
{
l9_10=fast::min(a.x/(1.0-b.x),1.0);
}
float l9_11=l9_10;
float l9_12;
if (b.y==1.0)
{
l9_12=b.y;
}
else
{
l9_12=fast::min(a.y/(1.0-b.y),1.0);
}
float l9_13=l9_12;
float l9_14;
if (b.z==1.0)
{
l9_14=b.z;
}
else
{
l9_14=fast::min(a.z/(1.0-b.z),1.0);
}
return float3(l9_11,l9_13,l9_14);
}
else
{
if ((int(BLEND_MODE_COLOR_BURN_tmp)!=0))
{
float l9_15;
if (b.x==0.0)
{
l9_15=b.x;
}
else
{
l9_15=fast::max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_16=l9_15;
float l9_17;
if (b.y==0.0)
{
l9_17=b.y;
}
else
{
l9_17=fast::max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_18=l9_17;
float l9_19;
if (b.z==0.0)
{
l9_19=b.z;
}
else
{
l9_19=fast::max(1.0-((1.0-a.z)/b.z),0.0);
}
return float3(l9_16,l9_18,l9_19);
}
else
{
if ((int(BLEND_MODE_LINEAR_LIGHT_tmp)!=0))
{
float l9_20;
if (b.x<0.5)
{
l9_20=fast::max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_20=fast::min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_21=l9_20;
float l9_22;
if (b.y<0.5)
{
l9_22=fast::max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_22=fast::min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_23=l9_22;
float l9_24;
if (b.z<0.5)
{
l9_24=fast::max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_24=fast::min(a.z+(2.0*(b.z-0.5)),1.0);
}
return float3(l9_21,l9_23,l9_24);
}
else
{
if ((int(BLEND_MODE_VIVID_LIGHT_tmp)!=0))
{
float l9_25;
if (b.x<0.5)
{
float l9_26;
if ((2.0*b.x)==0.0)
{
l9_26=2.0*b.x;
}
else
{
l9_26=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_25=l9_26;
}
else
{
float l9_27;
if ((2.0*(b.x-0.5))==1.0)
{
l9_27=2.0*(b.x-0.5);
}
else
{
l9_27=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_25=l9_27;
}
float l9_28=l9_25;
float l9_29;
if (b.y<0.5)
{
float l9_30;
if ((2.0*b.y)==0.0)
{
l9_30=2.0*b.y;
}
else
{
l9_30=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_29=l9_30;
}
else
{
float l9_31;
if ((2.0*(b.y-0.5))==1.0)
{
l9_31=2.0*(b.y-0.5);
}
else
{
l9_31=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_29=l9_31;
}
float l9_32=l9_29;
float l9_33;
if (b.z<0.5)
{
float l9_34;
if ((2.0*b.z)==0.0)
{
l9_34=2.0*b.z;
}
else
{
l9_34=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.z-0.5))==1.0)
{
l9_35=2.0*(b.z-0.5);
}
else
{
l9_35=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_33=l9_35;
}
return float3(l9_28,l9_32,l9_33);
}
else
{
if ((int(BLEND_MODE_PIN_LIGHT_tmp)!=0))
{
float l9_36;
if (b.x<0.5)
{
l9_36=fast::min(a.x,2.0*b.x);
}
else
{
l9_36=fast::max(a.x,2.0*(b.x-0.5));
}
float l9_37=l9_36;
float l9_38;
if (b.y<0.5)
{
l9_38=fast::min(a.y,2.0*b.y);
}
else
{
l9_38=fast::max(a.y,2.0*(b.y-0.5));
}
float l9_39=l9_38;
float l9_40;
if (b.z<0.5)
{
l9_40=fast::min(a.z,2.0*b.z);
}
else
{
l9_40=fast::max(a.z,2.0*(b.z-0.5));
}
return float3(l9_37,l9_39,l9_40);
}
else
{
if ((int(BLEND_MODE_HARD_MIX_tmp)!=0))
{
float l9_41;
if (b.x<0.5)
{
float l9_42;
if ((2.0*b.x)==0.0)
{
l9_42=2.0*b.x;
}
else
{
l9_42=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_41=l9_42;
}
else
{
float l9_43;
if ((2.0*(b.x-0.5))==1.0)
{
l9_43=2.0*(b.x-0.5);
}
else
{
l9_43=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_41=l9_43;
}
float l9_44=l9_41;
float l9_45;
if (b.y<0.5)
{
float l9_46;
if ((2.0*b.y)==0.0)
{
l9_46=2.0*b.y;
}
else
{
l9_46=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_45=l9_46;
}
else
{
float l9_47;
if ((2.0*(b.y-0.5))==1.0)
{
l9_47=2.0*(b.y-0.5);
}
else
{
l9_47=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_45=l9_47;
}
float l9_48=l9_45;
float l9_49;
if (b.z<0.5)
{
float l9_50;
if ((2.0*b.z)==0.0)
{
l9_50=2.0*b.z;
}
else
{
l9_50=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_49=l9_50;
}
else
{
float l9_51;
if ((2.0*(b.z-0.5))==1.0)
{
l9_51=2.0*(b.z-0.5);
}
else
{
l9_51=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_49=l9_51;
}
return float3((l9_44<0.5) ? 0.0 : 1.0,(l9_48<0.5) ? 0.0 : 1.0,(l9_49<0.5) ? 0.0 : 1.0);
}
else
{
if ((int(BLEND_MODE_HARD_REFLECT_tmp)!=0))
{
float l9_52;
if (b.x==1.0)
{
l9_52=b.x;
}
else
{
l9_52=fast::min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_53=l9_52;
float l9_54;
if (b.y==1.0)
{
l9_54=b.y;
}
else
{
l9_54=fast::min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_55=l9_54;
float l9_56;
if (b.z==1.0)
{
l9_56=b.z;
}
else
{
l9_56=fast::min((a.z*a.z)/(1.0-b.z),1.0);
}
return float3(l9_53,l9_55,l9_56);
}
else
{
if ((int(BLEND_MODE_HARD_GLOW_tmp)!=0))
{
float l9_57;
if (a.x==1.0)
{
l9_57=a.x;
}
else
{
l9_57=fast::min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_58=l9_57;
float l9_59;
if (a.y==1.0)
{
l9_59=a.y;
}
else
{
l9_59=fast::min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_60=l9_59;
float l9_61;
if (a.z==1.0)
{
l9_61=a.z;
}
else
{
l9_61=fast::min((b.z*b.z)/(1.0-a.z),1.0);
}
return float3(l9_58,l9_60,l9_61);
}
else
{
if ((int(BLEND_MODE_HARD_PHOENIX_tmp)!=0))
{
return (fast::min(a,b)-fast::max(a,b))+float3(1.0);
}
else
{
if ((int(BLEND_MODE_HUE_tmp)!=0))
{
float3 param=a;
float3 param_1=b;
float3 l9_62=param;
float3 l9_63=l9_62;
float4 l9_64;
if (l9_63.y<l9_63.z)
{
l9_64=float4(l9_63.zy,-1.0,0.66666669);
}
else
{
l9_64=float4(l9_63.yz,0.0,-0.33333334);
}
float4 l9_65=l9_64;
float4 l9_66;
if (l9_63.x<l9_65.x)
{
l9_66=float4(l9_65.xyw,l9_63.x);
}
else
{
l9_66=float4(l9_63.x,l9_65.yzx);
}
float4 l9_67=l9_66;
float l9_68=l9_67.x-fast::min(l9_67.w,l9_67.y);
float l9_69=abs(((l9_67.w-l9_67.y)/((6.0*l9_68)+1e-07))+l9_67.z);
float l9_70=l9_67.x;
float3 l9_71=float3(l9_69,l9_68,l9_70);
float3 l9_72=l9_71;
float l9_73=l9_72.z-(l9_72.y*0.5);
float l9_74=l9_72.y/((1.0-abs((2.0*l9_73)-1.0))+1e-07);
float3 l9_75=float3(l9_72.x,l9_74,l9_73);
float3 l9_76=l9_75;
float3 l9_77=param_1;
float3 l9_78=l9_77;
float4 l9_79;
if (l9_78.y<l9_78.z)
{
l9_79=float4(l9_78.zy,-1.0,0.66666669);
}
else
{
l9_79=float4(l9_78.yz,0.0,-0.33333334);
}
float4 l9_80=l9_79;
float4 l9_81;
if (l9_78.x<l9_80.x)
{
l9_81=float4(l9_80.xyw,l9_78.x);
}
else
{
l9_81=float4(l9_78.x,l9_80.yzx);
}
float4 l9_82=l9_81;
float l9_83=l9_82.x-fast::min(l9_82.w,l9_82.y);
float l9_84=abs(((l9_82.w-l9_82.y)/((6.0*l9_83)+1e-07))+l9_82.z);
float l9_85=l9_82.x;
float3 l9_86=float3(l9_84,l9_83,l9_85);
float3 l9_87=l9_86;
float l9_88=l9_87.z-(l9_87.y*0.5);
float l9_89=l9_87.y/((1.0-abs((2.0*l9_88)-1.0))+1e-07);
float3 l9_90=float3(l9_87.x,l9_89,l9_88);
float3 l9_91=float3(l9_90.x,l9_76.y,l9_76.z);
float l9_92=l9_91.x;
float l9_93=abs((6.0*l9_92)-3.0)-1.0;
float l9_94=2.0-abs((6.0*l9_92)-2.0);
float l9_95=2.0-abs((6.0*l9_92)-4.0);
float3 l9_96=fast::clamp(float3(l9_93,l9_94,l9_95),float3(0.0),float3(1.0));
float3 l9_97=l9_96;
float l9_98=(1.0-abs((2.0*l9_91.z)-1.0))*l9_91.y;
l9_97=((l9_97-float3(0.5))*l9_98)+float3(l9_91.z);
float3 l9_99=l9_97;
float3 l9_100=l9_99;
return l9_100;
}
else
{
if ((int(BLEND_MODE_SATURATION_tmp)!=0))
{
float3 param_2=a;
float3 param_3=b;
float3 l9_101=param_2;
float3 l9_102=l9_101;
float4 l9_103;
if (l9_102.y<l9_102.z)
{
l9_103=float4(l9_102.zy,-1.0,0.66666669);
}
else
{
l9_103=float4(l9_102.yz,0.0,-0.33333334);
}
float4 l9_104=l9_103;
float4 l9_105;
if (l9_102.x<l9_104.x)
{
l9_105=float4(l9_104.xyw,l9_102.x);
}
else
{
l9_105=float4(l9_102.x,l9_104.yzx);
}
float4 l9_106=l9_105;
float l9_107=l9_106.x-fast::min(l9_106.w,l9_106.y);
float l9_108=abs(((l9_106.w-l9_106.y)/((6.0*l9_107)+1e-07))+l9_106.z);
float l9_109=l9_106.x;
float3 l9_110=float3(l9_108,l9_107,l9_109);
float3 l9_111=l9_110;
float l9_112=l9_111.z-(l9_111.y*0.5);
float l9_113=l9_111.y/((1.0-abs((2.0*l9_112)-1.0))+1e-07);
float3 l9_114=float3(l9_111.x,l9_113,l9_112);
float3 l9_115=l9_114;
float l9_116=l9_115.x;
float3 l9_117=param_3;
float3 l9_118=l9_117;
float4 l9_119;
if (l9_118.y<l9_118.z)
{
l9_119=float4(l9_118.zy,-1.0,0.66666669);
}
else
{
l9_119=float4(l9_118.yz,0.0,-0.33333334);
}
float4 l9_120=l9_119;
float4 l9_121;
if (l9_118.x<l9_120.x)
{
l9_121=float4(l9_120.xyw,l9_118.x);
}
else
{
l9_121=float4(l9_118.x,l9_120.yzx);
}
float4 l9_122=l9_121;
float l9_123=l9_122.x-fast::min(l9_122.w,l9_122.y);
float l9_124=abs(((l9_122.w-l9_122.y)/((6.0*l9_123)+1e-07))+l9_122.z);
float l9_125=l9_122.x;
float3 l9_126=float3(l9_124,l9_123,l9_125);
float3 l9_127=l9_126;
float l9_128=l9_127.z-(l9_127.y*0.5);
float l9_129=l9_127.y/((1.0-abs((2.0*l9_128)-1.0))+1e-07);
float3 l9_130=float3(l9_127.x,l9_129,l9_128);
float3 l9_131=float3(l9_116,l9_130.y,l9_115.z);
float l9_132=l9_131.x;
float l9_133=abs((6.0*l9_132)-3.0)-1.0;
float l9_134=2.0-abs((6.0*l9_132)-2.0);
float l9_135=2.0-abs((6.0*l9_132)-4.0);
float3 l9_136=fast::clamp(float3(l9_133,l9_134,l9_135),float3(0.0),float3(1.0));
float3 l9_137=l9_136;
float l9_138=(1.0-abs((2.0*l9_131.z)-1.0))*l9_131.y;
l9_137=((l9_137-float3(0.5))*l9_138)+float3(l9_131.z);
float3 l9_139=l9_137;
float3 l9_140=l9_139;
return l9_140;
}
else
{
if ((int(BLEND_MODE_COLOR_tmp)!=0))
{
float3 param_4=a;
float3 param_5=b;
float3 l9_141=param_5;
float3 l9_142=l9_141;
float4 l9_143;
if (l9_142.y<l9_142.z)
{
l9_143=float4(l9_142.zy,-1.0,0.66666669);
}
else
{
l9_143=float4(l9_142.yz,0.0,-0.33333334);
}
float4 l9_144=l9_143;
float4 l9_145;
if (l9_142.x<l9_144.x)
{
l9_145=float4(l9_144.xyw,l9_142.x);
}
else
{
l9_145=float4(l9_142.x,l9_144.yzx);
}
float4 l9_146=l9_145;
float l9_147=l9_146.x-fast::min(l9_146.w,l9_146.y);
float l9_148=abs(((l9_146.w-l9_146.y)/((6.0*l9_147)+1e-07))+l9_146.z);
float l9_149=l9_146.x;
float3 l9_150=float3(l9_148,l9_147,l9_149);
float3 l9_151=l9_150;
float l9_152=l9_151.z-(l9_151.y*0.5);
float l9_153=l9_151.y/((1.0-abs((2.0*l9_152)-1.0))+1e-07);
float3 l9_154=float3(l9_151.x,l9_153,l9_152);
float3 l9_155=l9_154;
float l9_156=l9_155.x;
float l9_157=l9_155.y;
float3 l9_158=param_4;
float3 l9_159=l9_158;
float4 l9_160;
if (l9_159.y<l9_159.z)
{
l9_160=float4(l9_159.zy,-1.0,0.66666669);
}
else
{
l9_160=float4(l9_159.yz,0.0,-0.33333334);
}
float4 l9_161=l9_160;
float4 l9_162;
if (l9_159.x<l9_161.x)
{
l9_162=float4(l9_161.xyw,l9_159.x);
}
else
{
l9_162=float4(l9_159.x,l9_161.yzx);
}
float4 l9_163=l9_162;
float l9_164=l9_163.x-fast::min(l9_163.w,l9_163.y);
float l9_165=abs(((l9_163.w-l9_163.y)/((6.0*l9_164)+1e-07))+l9_163.z);
float l9_166=l9_163.x;
float3 l9_167=float3(l9_165,l9_164,l9_166);
float3 l9_168=l9_167;
float l9_169=l9_168.z-(l9_168.y*0.5);
float l9_170=l9_168.y/((1.0-abs((2.0*l9_169)-1.0))+1e-07);
float3 l9_171=float3(l9_168.x,l9_170,l9_169);
float3 l9_172=float3(l9_156,l9_157,l9_171.z);
float l9_173=l9_172.x;
float l9_174=abs((6.0*l9_173)-3.0)-1.0;
float l9_175=2.0-abs((6.0*l9_173)-2.0);
float l9_176=2.0-abs((6.0*l9_173)-4.0);
float3 l9_177=fast::clamp(float3(l9_174,l9_175,l9_176),float3(0.0),float3(1.0));
float3 l9_178=l9_177;
float l9_179=(1.0-abs((2.0*l9_172.z)-1.0))*l9_172.y;
l9_178=((l9_178-float3(0.5))*l9_179)+float3(l9_172.z);
float3 l9_180=l9_178;
float3 l9_181=l9_180;
return l9_181;
}
else
{
if ((int(BLEND_MODE_LUMINOSITY_tmp)!=0))
{
float3 param_6=a;
float3 param_7=b;
float3 l9_182=param_6;
float3 l9_183=l9_182;
float4 l9_184;
if (l9_183.y<l9_183.z)
{
l9_184=float4(l9_183.zy,-1.0,0.66666669);
}
else
{
l9_184=float4(l9_183.yz,0.0,-0.33333334);
}
float4 l9_185=l9_184;
float4 l9_186;
if (l9_183.x<l9_185.x)
{
l9_186=float4(l9_185.xyw,l9_183.x);
}
else
{
l9_186=float4(l9_183.x,l9_185.yzx);
}
float4 l9_187=l9_186;
float l9_188=l9_187.x-fast::min(l9_187.w,l9_187.y);
float l9_189=abs(((l9_187.w-l9_187.y)/((6.0*l9_188)+1e-07))+l9_187.z);
float l9_190=l9_187.x;
float3 l9_191=float3(l9_189,l9_188,l9_190);
float3 l9_192=l9_191;
float l9_193=l9_192.z-(l9_192.y*0.5);
float l9_194=l9_192.y/((1.0-abs((2.0*l9_193)-1.0))+1e-07);
float3 l9_195=float3(l9_192.x,l9_194,l9_193);
float3 l9_196=l9_195;
float l9_197=l9_196.x;
float l9_198=l9_196.y;
float3 l9_199=param_7;
float3 l9_200=l9_199;
float4 l9_201;
if (l9_200.y<l9_200.z)
{
l9_201=float4(l9_200.zy,-1.0,0.66666669);
}
else
{
l9_201=float4(l9_200.yz,0.0,-0.33333334);
}
float4 l9_202=l9_201;
float4 l9_203;
if (l9_200.x<l9_202.x)
{
l9_203=float4(l9_202.xyw,l9_200.x);
}
else
{
l9_203=float4(l9_200.x,l9_202.yzx);
}
float4 l9_204=l9_203;
float l9_205=l9_204.x-fast::min(l9_204.w,l9_204.y);
float l9_206=abs(((l9_204.w-l9_204.y)/((6.0*l9_205)+1e-07))+l9_204.z);
float l9_207=l9_204.x;
float3 l9_208=float3(l9_206,l9_205,l9_207);
float3 l9_209=l9_208;
float l9_210=l9_209.z-(l9_209.y*0.5);
float l9_211=l9_209.y/((1.0-abs((2.0*l9_210)-1.0))+1e-07);
float3 l9_212=float3(l9_209.x,l9_211,l9_210);
float3 l9_213=float3(l9_197,l9_198,l9_212.z);
float l9_214=l9_213.x;
float l9_215=abs((6.0*l9_214)-3.0)-1.0;
float l9_216=2.0-abs((6.0*l9_214)-2.0);
float l9_217=2.0-abs((6.0*l9_214)-4.0);
float3 l9_218=fast::clamp(float3(l9_215,l9_216,l9_217),float3(0.0),float3(1.0));
float3 l9_219=l9_218;
float l9_220=(1.0-abs((2.0*l9_213.z)-1.0))*l9_213.y;
l9_219=((l9_219-float3(0.5))*l9_220)+float3(l9_213.z);
float3 l9_221=l9_219;
float3 l9_222=l9_221;
return l9_222;
}
else
{
float3 param_8=a;
float3 param_9=b;
float3 l9_223=param_8;
float l9_224=((0.29899999*l9_223.x)+(0.58700001*l9_223.y))+(0.114*l9_223.z);
float l9_225=l9_224;
float l9_226=1.0;
float l9_227=pow(l9_225,1.0/UserUniforms.correctedIntensity);
int l9_228;
if ((int(intensityTextureHasSwappedViews_tmp)!=0))
{
int l9_229=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_229=0;
}
else
{
l9_229=varStereoViewID;
}
int l9_230=l9_229;
l9_228=1-l9_230;
}
else
{
int l9_231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=varStereoViewID;
}
int l9_232=l9_231;
l9_228=l9_232;
}
int l9_233=l9_228;
int l9_234=intensityTextureLayout_tmp;
int l9_235=l9_233;
float2 l9_236=float2(l9_227,0.5);
bool l9_237=(int(SC_USE_UV_TRANSFORM_intensityTexture_tmp)!=0);
float3x3 l9_238=UserUniforms.intensityTextureTransform;
int2 l9_239=int2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp);
bool l9_240=(int(SC_USE_UV_MIN_MAX_intensityTexture_tmp)!=0);
float4 l9_241=UserUniforms.intensityTextureUvMinMax;
bool l9_242=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp)!=0);
float4 l9_243=UserUniforms.intensityTextureBorderColor;
float l9_244=0.0;
bool l9_245=l9_242&&(!l9_240);
float l9_246=1.0;
float l9_247=l9_236.x;
int l9_248=l9_239.x;
if (l9_248==1)
{
l9_247=fract(l9_247);
}
else
{
if (l9_248==2)
{
float l9_249=fract(l9_247);
float l9_250=l9_247-l9_249;
float l9_251=step(0.25,fract(l9_250*0.5));
l9_247=mix(l9_249,1.0-l9_249,fast::clamp(l9_251,0.0,1.0));
}
}
l9_236.x=l9_247;
float l9_252=l9_236.y;
int l9_253=l9_239.y;
if (l9_253==1)
{
l9_252=fract(l9_252);
}
else
{
if (l9_253==2)
{
float l9_254=fract(l9_252);
float l9_255=l9_252-l9_254;
float l9_256=step(0.25,fract(l9_255*0.5));
l9_252=mix(l9_254,1.0-l9_254,fast::clamp(l9_256,0.0,1.0));
}
}
l9_236.y=l9_252;
if (l9_240)
{
bool l9_257=l9_242;
bool l9_258;
if (l9_257)
{
l9_258=l9_239.x==3;
}
else
{
l9_258=l9_257;
}
float l9_259=l9_236.x;
float l9_260=l9_241.x;
float l9_261=l9_241.z;
bool l9_262=l9_258;
float l9_263=l9_246;
float l9_264=fast::clamp(l9_259,l9_260,l9_261);
float l9_265=step(abs(l9_259-l9_264),9.9999997e-06);
l9_263*=(l9_265+((1.0-float(l9_262))*(1.0-l9_265)));
l9_259=l9_264;
l9_236.x=l9_259;
l9_246=l9_263;
bool l9_266=l9_242;
bool l9_267;
if (l9_266)
{
l9_267=l9_239.y==3;
}
else
{
l9_267=l9_266;
}
float l9_268=l9_236.y;
float l9_269=l9_241.y;
float l9_270=l9_241.w;
bool l9_271=l9_267;
float l9_272=l9_246;
float l9_273=fast::clamp(l9_268,l9_269,l9_270);
float l9_274=step(abs(l9_268-l9_273),9.9999997e-06);
l9_272*=(l9_274+((1.0-float(l9_271))*(1.0-l9_274)));
l9_268=l9_273;
l9_236.y=l9_268;
l9_246=l9_272;
}
float2 l9_275=l9_236;
bool l9_276=l9_237;
float3x3 l9_277=l9_238;
if (l9_276)
{
l9_275=float2((l9_277*float3(l9_275,1.0)).xy);
}
float2 l9_278=l9_275;
l9_236=l9_278;
float l9_279=l9_236.x;
int l9_280=l9_239.x;
bool l9_281=l9_245;
float l9_282=l9_246;
if ((l9_280==0)||(l9_280==3))
{
float l9_283=l9_279;
float l9_284=0.0;
float l9_285=1.0;
bool l9_286=l9_281;
float l9_287=l9_282;
float l9_288=fast::clamp(l9_283,l9_284,l9_285);
float l9_289=step(abs(l9_283-l9_288),9.9999997e-06);
l9_287*=(l9_289+((1.0-float(l9_286))*(1.0-l9_289)));
l9_283=l9_288;
l9_279=l9_283;
l9_282=l9_287;
}
l9_236.x=l9_279;
l9_246=l9_282;
float l9_290=l9_236.y;
int l9_291=l9_239.y;
bool l9_292=l9_245;
float l9_293=l9_246;
if ((l9_291==0)||(l9_291==3))
{
float l9_294=l9_290;
float l9_295=0.0;
float l9_296=1.0;
bool l9_297=l9_292;
float l9_298=l9_293;
float l9_299=fast::clamp(l9_294,l9_295,l9_296);
float l9_300=step(abs(l9_294-l9_299),9.9999997e-06);
l9_298*=(l9_300+((1.0-float(l9_297))*(1.0-l9_300)));
l9_294=l9_299;
l9_290=l9_294;
l9_293=l9_298;
}
l9_236.y=l9_290;
l9_246=l9_293;
float2 l9_301=l9_236;
int l9_302=l9_234;
int l9_303=l9_235;
float l9_304=l9_244;
float2 l9_305=l9_301;
int l9_306=l9_302;
int l9_307=l9_303;
float3 l9_308=float3(0.0);
if (l9_306==0)
{
l9_308=float3(l9_305,0.0);
}
else
{
if (l9_306==1)
{
l9_308=float3(l9_305.x,(l9_305.y*0.5)+(0.5-(float(l9_307)*0.5)),0.0);
}
else
{
l9_308=float3(l9_305,float(l9_307));
}
}
float3 l9_309=l9_308;
float3 l9_310=l9_309;
float4 l9_311=intensityTexture.sample(intensityTextureSmpSC,l9_310.xy,bias(l9_304));
float4 l9_312=l9_311;
if (l9_242)
{
l9_312=mix(l9_243,l9_312,float4(l9_246));
}
float4 l9_313=l9_312;
float3 l9_314=l9_313.xyz;
float3 l9_315=l9_314;
float l9_316=16.0;
float l9_317=((((l9_315.x*256.0)+l9_315.y)+(l9_315.z/256.0))/257.00391)*l9_316;
float l9_318=l9_317;
if ((int(BLEND_MODE_FORGRAY_tmp)!=0))
{
l9_318=fast::max(l9_318,1.0);
}
if ((int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
l9_318=fast::min(l9_318,1.0);
}
float l9_319=l9_225;
float3 l9_320=param_8;
float3 l9_321=param_9;
float l9_322=l9_226;
float l9_323=l9_318;
float3 l9_324=transformColor(l9_319,l9_320,l9_321,l9_322,l9_323);
return l9_324;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
float4 sc_OutputMotionVectorIfNeeded(thread const float4& finalColor,thread float4& varPosAndMotion,thread float4& varNormalAndMotion)
{
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float2 param=float2(varPosAndMotion.w,varNormalAndMotion.w);
float l9_0=(param.x*5.0)+0.5;
float l9_1=floor(l9_0*65535.0);
float l9_2=floor(l9_1*0.00390625);
float2 l9_3=float2(l9_2/255.0,(l9_1-(l9_2*256.0))/255.0);
float l9_4=(param.y*5.0)+0.5;
float l9_5=floor(l9_4*65535.0);
float l9_6=floor(l9_5*0.00390625);
float2 l9_7=float2(l9_6/255.0,(l9_5-(l9_6*256.0))/255.0);
float4 l9_8=float4(l9_3,l9_7);
return l9_8;
}
else
{
return finalColor;
}
}
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=in.PreviewVertexColor;
PreviewInfo.Saved=((in.PreviewVertexSaved*1.0)!=0.0) ? true : false;
float4 FinalColor=float4(1.0);
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPosAndMotion.xyz);
Globals.PositionWS=in.varPosAndMotion.xyz;
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormalAndMotion.xyz);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.SurfacePosition_WorldSpace=in.varPosAndMotion.xyz;
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
float4 l9_0=gl_FragCoord;
float2 l9_1=l9_0.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_2=l9_1;
float2 l9_3=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_4=1;
int l9_5=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5=0;
}
else
{
l9_5=in.varStereoViewID;
}
int l9_6=l9_5;
int l9_7=l9_6;
float3 l9_8=float3(l9_2,0.0);
int l9_9=l9_4;
int l9_10=l9_7;
if (l9_9==1)
{
l9_8.y=((2.0*l9_8.y)+float(l9_10))-1.0;
}
float2 l9_11=l9_8.xy;
l9_3=l9_11;
}
else
{
l9_3=l9_2;
}
float2 l9_12=l9_3;
float2 l9_13=l9_12;
Globals.gScreenCoord=l9_13;
Globals.Surface_UVCoord0=in.varTex01.xy;
float4 Output_N115=float4(0.0);
float4 param=(*sc_set0.UserUniforms).baseColor;
Output_N115=param;
float Output_N57=0.0;
float param_1=(*sc_set0.UserUniforms).chromaticAberration;
Output_N57=param_1;
float Value_N68=0.0;
Value_N68=Output_N57;
float Ratio_N69=0.0;
float param_2=dot(Globals.ViewDirWS,Globals.VertexNormal_WorldSpace);
float l9_14=fast::clamp(param_2,0.0,1.0);
Ratio_N69=l9_14;
float Output_N70=0.0;
Output_N70=(*sc_set0.UserUniforms).Port_Input0_N070-Ratio_N69;
float Output_N71=0.0;
Output_N71=(Value_N68*Output_N70)*(*sc_set0.UserUniforms).Port_Input2_N071;
float Value_N80=0.0;
Value_N80=Output_N71;
float2 ScreenCoord_N81=float2(0.0);
ScreenCoord_N81=Globals.gScreenCoord;
float3 ViewVector_N61=float3(0.0);
ViewVector_N61=Globals.ViewDirWS;
float3 Normal_N67=float3(0.0);
Normal_N67=Globals.VertexNormal_WorldSpace;
float3 Output_N65=float3(0.0);
float3 param_3=Normal_N67;
float l9_15=dot(param_3,param_3);
float l9_16;
if (l9_15>0.0)
{
l9_16=1.0/sqrt(l9_15);
}
else
{
l9_16=0.0;
}
float l9_17=l9_16;
float3 param_4=param_3*l9_17;
Output_N65=param_4;
float3 Output_N62=float3(0.0);
Output_N62=refract(ViewVector_N61,Output_N65,(*sc_set0.UserUniforms).Port_Input2_N062);
float2 Output_N63=float2(0.0);
Output_N63=float2(Output_N62.x,Output_N62.y);
float Output_N60=0.0;
float param_5=(*sc_set0.UserUniforms).intensity;
Output_N60=param_5;
float Value_N64=0.0;
Value_N64=Output_N60;
float2 Output_N66=float2(0.0);
Output_N66=Output_N63*float2(Value_N64);
float2 Value_N83=float2(0.0);
Value_N83=Output_N66;
float2 Output_N84=float2(0.0);
Output_N84=ScreenCoord_N81+Value_N83;
float2 Output_N85=float2(0.0);
Output_N85=float2(Value_N80)+Output_N84;
float Output_N59=0.0;
float param_6=(*sc_set0.UserUniforms).thickness;
Output_N59=param_6;
float Value_N56=0.0;
Value_N56=Output_N59;
float Value_N86=0.0;
Value_N86=Value_N56;
float4 Color_N87=float4(0.0);
int l9_18;
if ((int(backgroundHasSwappedViews_tmp)!=0))
{
int l9_19=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_19=0;
}
else
{
l9_19=in.varStereoViewID;
}
int l9_20=l9_19;
l9_18=1-l9_20;
}
else
{
int l9_21=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_21=0;
}
else
{
l9_21=in.varStereoViewID;
}
int l9_22=l9_21;
l9_18=l9_22;
}
int l9_23=l9_18;
int param_7=backgroundLayout_tmp;
int param_8=l9_23;
float2 param_9=Output_N85;
bool param_10=(int(SC_USE_UV_TRANSFORM_background_tmp)!=0);
float3x3 param_11=(*sc_set0.UserUniforms).backgroundTransform;
int2 param_12=int2(SC_SOFTWARE_WRAP_MODE_U_background_tmp,SC_SOFTWARE_WRAP_MODE_V_background_tmp);
bool param_13=(int(SC_USE_UV_MIN_MAX_background_tmp)!=0);
float4 param_14=(*sc_set0.UserUniforms).backgroundUvMinMax;
bool param_15=(int(SC_USE_CLAMP_TO_BORDER_background_tmp)!=0);
float4 param_16=(*sc_set0.UserUniforms).backgroundBorderColor;
float param_17=Value_N86;
bool l9_24=param_15&&(!param_13);
float l9_25=1.0;
float l9_26=param_9.x;
int l9_27=param_12.x;
if (l9_27==1)
{
l9_26=fract(l9_26);
}
else
{
if (l9_27==2)
{
float l9_28=fract(l9_26);
float l9_29=l9_26-l9_28;
float l9_30=step(0.25,fract(l9_29*0.5));
l9_26=mix(l9_28,1.0-l9_28,fast::clamp(l9_30,0.0,1.0));
}
}
param_9.x=l9_26;
float l9_31=param_9.y;
int l9_32=param_12.y;
if (l9_32==1)
{
l9_31=fract(l9_31);
}
else
{
if (l9_32==2)
{
float l9_33=fract(l9_31);
float l9_34=l9_31-l9_33;
float l9_35=step(0.25,fract(l9_34*0.5));
l9_31=mix(l9_33,1.0-l9_33,fast::clamp(l9_35,0.0,1.0));
}
}
param_9.y=l9_31;
if (param_13)
{
bool l9_36=param_15;
bool l9_37;
if (l9_36)
{
l9_37=param_12.x==3;
}
else
{
l9_37=l9_36;
}
float l9_38=param_9.x;
float l9_39=param_14.x;
float l9_40=param_14.z;
bool l9_41=l9_37;
float l9_42=l9_25;
float l9_43=fast::clamp(l9_38,l9_39,l9_40);
float l9_44=step(abs(l9_38-l9_43),9.9999997e-06);
l9_42*=(l9_44+((1.0-float(l9_41))*(1.0-l9_44)));
l9_38=l9_43;
param_9.x=l9_38;
l9_25=l9_42;
bool l9_45=param_15;
bool l9_46;
if (l9_45)
{
l9_46=param_12.y==3;
}
else
{
l9_46=l9_45;
}
float l9_47=param_9.y;
float l9_48=param_14.y;
float l9_49=param_14.w;
bool l9_50=l9_46;
float l9_51=l9_25;
float l9_52=fast::clamp(l9_47,l9_48,l9_49);
float l9_53=step(abs(l9_47-l9_52),9.9999997e-06);
l9_51*=(l9_53+((1.0-float(l9_50))*(1.0-l9_53)));
l9_47=l9_52;
param_9.y=l9_47;
l9_25=l9_51;
}
float2 l9_54=param_9;
bool l9_55=param_10;
float3x3 l9_56=param_11;
if (l9_55)
{
l9_54=float2((l9_56*float3(l9_54,1.0)).xy);
}
float2 l9_57=l9_54;
param_9=l9_57;
float l9_58=param_9.x;
int l9_59=param_12.x;
bool l9_60=l9_24;
float l9_61=l9_25;
if ((l9_59==0)||(l9_59==3))
{
float l9_62=l9_58;
float l9_63=0.0;
float l9_64=1.0;
bool l9_65=l9_60;
float l9_66=l9_61;
float l9_67=fast::clamp(l9_62,l9_63,l9_64);
float l9_68=step(abs(l9_62-l9_67),9.9999997e-06);
l9_66*=(l9_68+((1.0-float(l9_65))*(1.0-l9_68)));
l9_62=l9_67;
l9_58=l9_62;
l9_61=l9_66;
}
param_9.x=l9_58;
l9_25=l9_61;
float l9_69=param_9.y;
int l9_70=param_12.y;
bool l9_71=l9_24;
float l9_72=l9_25;
if ((l9_70==0)||(l9_70==3))
{
float l9_73=l9_69;
float l9_74=0.0;
float l9_75=1.0;
bool l9_76=l9_71;
float l9_77=l9_72;
float l9_78=fast::clamp(l9_73,l9_74,l9_75);
float l9_79=step(abs(l9_73-l9_78),9.9999997e-06);
l9_77*=(l9_79+((1.0-float(l9_76))*(1.0-l9_79)));
l9_73=l9_78;
l9_69=l9_73;
l9_72=l9_77;
}
param_9.y=l9_69;
l9_25=l9_72;
float2 l9_80=param_9;
int l9_81=param_7;
int l9_82=param_8;
float l9_83=param_17;
float2 l9_84=l9_80;
int l9_85=l9_81;
int l9_86=l9_82;
float3 l9_87=float3(0.0);
if (l9_85==0)
{
l9_87=float3(l9_84,0.0);
}
else
{
if (l9_85==1)
{
l9_87=float3(l9_84.x,(l9_84.y*0.5)+(0.5-(float(l9_86)*0.5)),0.0);
}
else
{
l9_87=float3(l9_84,float(l9_86));
}
}
float3 l9_88=l9_87;
float3 l9_89=l9_88;
float4 l9_90=sc_set0.background.sample(sc_set0.backgroundSmpSC,l9_89.xy,bias(l9_83));
float4 l9_91=l9_90;
if (param_15)
{
l9_91=mix(param_16,l9_91,float4(l9_25));
}
float4 l9_92=l9_91;
Color_N87=l9_92;
float Output_N88=0.0;
Output_N88=Color_N87.x;
float4 Color_N89=float4(0.0);
int l9_93;
if ((int(backgroundHasSwappedViews_tmp)!=0))
{
int l9_94=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_94=0;
}
else
{
l9_94=in.varStereoViewID;
}
int l9_95=l9_94;
l9_93=1-l9_95;
}
else
{
int l9_96=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_96=0;
}
else
{
l9_96=in.varStereoViewID;
}
int l9_97=l9_96;
l9_93=l9_97;
}
int l9_98=l9_93;
int param_18=backgroundLayout_tmp;
int param_19=l9_98;
float2 param_20=Output_N84;
bool param_21=(int(SC_USE_UV_TRANSFORM_background_tmp)!=0);
float3x3 param_22=(*sc_set0.UserUniforms).backgroundTransform;
int2 param_23=int2(SC_SOFTWARE_WRAP_MODE_U_background_tmp,SC_SOFTWARE_WRAP_MODE_V_background_tmp);
bool param_24=(int(SC_USE_UV_MIN_MAX_background_tmp)!=0);
float4 param_25=(*sc_set0.UserUniforms).backgroundUvMinMax;
bool param_26=(int(SC_USE_CLAMP_TO_BORDER_background_tmp)!=0);
float4 param_27=(*sc_set0.UserUniforms).backgroundBorderColor;
float param_28=Value_N86;
bool l9_99=param_26&&(!param_24);
float l9_100=1.0;
float l9_101=param_20.x;
int l9_102=param_23.x;
if (l9_102==1)
{
l9_101=fract(l9_101);
}
else
{
if (l9_102==2)
{
float l9_103=fract(l9_101);
float l9_104=l9_101-l9_103;
float l9_105=step(0.25,fract(l9_104*0.5));
l9_101=mix(l9_103,1.0-l9_103,fast::clamp(l9_105,0.0,1.0));
}
}
param_20.x=l9_101;
float l9_106=param_20.y;
int l9_107=param_23.y;
if (l9_107==1)
{
l9_106=fract(l9_106);
}
else
{
if (l9_107==2)
{
float l9_108=fract(l9_106);
float l9_109=l9_106-l9_108;
float l9_110=step(0.25,fract(l9_109*0.5));
l9_106=mix(l9_108,1.0-l9_108,fast::clamp(l9_110,0.0,1.0));
}
}
param_20.y=l9_106;
if (param_24)
{
bool l9_111=param_26;
bool l9_112;
if (l9_111)
{
l9_112=param_23.x==3;
}
else
{
l9_112=l9_111;
}
float l9_113=param_20.x;
float l9_114=param_25.x;
float l9_115=param_25.z;
bool l9_116=l9_112;
float l9_117=l9_100;
float l9_118=fast::clamp(l9_113,l9_114,l9_115);
float l9_119=step(abs(l9_113-l9_118),9.9999997e-06);
l9_117*=(l9_119+((1.0-float(l9_116))*(1.0-l9_119)));
l9_113=l9_118;
param_20.x=l9_113;
l9_100=l9_117;
bool l9_120=param_26;
bool l9_121;
if (l9_120)
{
l9_121=param_23.y==3;
}
else
{
l9_121=l9_120;
}
float l9_122=param_20.y;
float l9_123=param_25.y;
float l9_124=param_25.w;
bool l9_125=l9_121;
float l9_126=l9_100;
float l9_127=fast::clamp(l9_122,l9_123,l9_124);
float l9_128=step(abs(l9_122-l9_127),9.9999997e-06);
l9_126*=(l9_128+((1.0-float(l9_125))*(1.0-l9_128)));
l9_122=l9_127;
param_20.y=l9_122;
l9_100=l9_126;
}
float2 l9_129=param_20;
bool l9_130=param_21;
float3x3 l9_131=param_22;
if (l9_130)
{
l9_129=float2((l9_131*float3(l9_129,1.0)).xy);
}
float2 l9_132=l9_129;
param_20=l9_132;
float l9_133=param_20.x;
int l9_134=param_23.x;
bool l9_135=l9_99;
float l9_136=l9_100;
if ((l9_134==0)||(l9_134==3))
{
float l9_137=l9_133;
float l9_138=0.0;
float l9_139=1.0;
bool l9_140=l9_135;
float l9_141=l9_136;
float l9_142=fast::clamp(l9_137,l9_138,l9_139);
float l9_143=step(abs(l9_137-l9_142),9.9999997e-06);
l9_141*=(l9_143+((1.0-float(l9_140))*(1.0-l9_143)));
l9_137=l9_142;
l9_133=l9_137;
l9_136=l9_141;
}
param_20.x=l9_133;
l9_100=l9_136;
float l9_144=param_20.y;
int l9_145=param_23.y;
bool l9_146=l9_99;
float l9_147=l9_100;
if ((l9_145==0)||(l9_145==3))
{
float l9_148=l9_144;
float l9_149=0.0;
float l9_150=1.0;
bool l9_151=l9_146;
float l9_152=l9_147;
float l9_153=fast::clamp(l9_148,l9_149,l9_150);
float l9_154=step(abs(l9_148-l9_153),9.9999997e-06);
l9_152*=(l9_154+((1.0-float(l9_151))*(1.0-l9_154)));
l9_148=l9_153;
l9_144=l9_148;
l9_147=l9_152;
}
param_20.y=l9_144;
l9_100=l9_147;
float2 l9_155=param_20;
int l9_156=param_18;
int l9_157=param_19;
float l9_158=param_28;
float2 l9_159=l9_155;
int l9_160=l9_156;
int l9_161=l9_157;
float3 l9_162=float3(0.0);
if (l9_160==0)
{
l9_162=float3(l9_159,0.0);
}
else
{
if (l9_160==1)
{
l9_162=float3(l9_159.x,(l9_159.y*0.5)+(0.5-(float(l9_161)*0.5)),0.0);
}
else
{
l9_162=float3(l9_159,float(l9_161));
}
}
float3 l9_163=l9_162;
float3 l9_164=l9_163;
float4 l9_165=sc_set0.background.sample(sc_set0.backgroundSmpSC,l9_164.xy,bias(l9_158));
float4 l9_166=l9_165;
if (param_26)
{
l9_166=mix(param_27,l9_166,float4(l9_100));
}
float4 l9_167=l9_166;
Color_N89=l9_167;
float Output_N90=0.0;
Output_N90=Color_N89.y;
float2 Output_N91=float2(0.0);
Output_N91=Output_N84-float2(Value_N80);
float4 Color_N92=float4(0.0);
int l9_168;
if ((int(backgroundHasSwappedViews_tmp)!=0))
{
int l9_169=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_169=0;
}
else
{
l9_169=in.varStereoViewID;
}
int l9_170=l9_169;
l9_168=1-l9_170;
}
else
{
int l9_171=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_171=0;
}
else
{
l9_171=in.varStereoViewID;
}
int l9_172=l9_171;
l9_168=l9_172;
}
int l9_173=l9_168;
int param_29=backgroundLayout_tmp;
int param_30=l9_173;
float2 param_31=Output_N91;
bool param_32=(int(SC_USE_UV_TRANSFORM_background_tmp)!=0);
float3x3 param_33=(*sc_set0.UserUniforms).backgroundTransform;
int2 param_34=int2(SC_SOFTWARE_WRAP_MODE_U_background_tmp,SC_SOFTWARE_WRAP_MODE_V_background_tmp);
bool param_35=(int(SC_USE_UV_MIN_MAX_background_tmp)!=0);
float4 param_36=(*sc_set0.UserUniforms).backgroundUvMinMax;
bool param_37=(int(SC_USE_CLAMP_TO_BORDER_background_tmp)!=0);
float4 param_38=(*sc_set0.UserUniforms).backgroundBorderColor;
float param_39=Value_N86;
bool l9_174=param_37&&(!param_35);
float l9_175=1.0;
float l9_176=param_31.x;
int l9_177=param_34.x;
if (l9_177==1)
{
l9_176=fract(l9_176);
}
else
{
if (l9_177==2)
{
float l9_178=fract(l9_176);
float l9_179=l9_176-l9_178;
float l9_180=step(0.25,fract(l9_179*0.5));
l9_176=mix(l9_178,1.0-l9_178,fast::clamp(l9_180,0.0,1.0));
}
}
param_31.x=l9_176;
float l9_181=param_31.y;
int l9_182=param_34.y;
if (l9_182==1)
{
l9_181=fract(l9_181);
}
else
{
if (l9_182==2)
{
float l9_183=fract(l9_181);
float l9_184=l9_181-l9_183;
float l9_185=step(0.25,fract(l9_184*0.5));
l9_181=mix(l9_183,1.0-l9_183,fast::clamp(l9_185,0.0,1.0));
}
}
param_31.y=l9_181;
if (param_35)
{
bool l9_186=param_37;
bool l9_187;
if (l9_186)
{
l9_187=param_34.x==3;
}
else
{
l9_187=l9_186;
}
float l9_188=param_31.x;
float l9_189=param_36.x;
float l9_190=param_36.z;
bool l9_191=l9_187;
float l9_192=l9_175;
float l9_193=fast::clamp(l9_188,l9_189,l9_190);
float l9_194=step(abs(l9_188-l9_193),9.9999997e-06);
l9_192*=(l9_194+((1.0-float(l9_191))*(1.0-l9_194)));
l9_188=l9_193;
param_31.x=l9_188;
l9_175=l9_192;
bool l9_195=param_37;
bool l9_196;
if (l9_195)
{
l9_196=param_34.y==3;
}
else
{
l9_196=l9_195;
}
float l9_197=param_31.y;
float l9_198=param_36.y;
float l9_199=param_36.w;
bool l9_200=l9_196;
float l9_201=l9_175;
float l9_202=fast::clamp(l9_197,l9_198,l9_199);
float l9_203=step(abs(l9_197-l9_202),9.9999997e-06);
l9_201*=(l9_203+((1.0-float(l9_200))*(1.0-l9_203)));
l9_197=l9_202;
param_31.y=l9_197;
l9_175=l9_201;
}
float2 l9_204=param_31;
bool l9_205=param_32;
float3x3 l9_206=param_33;
if (l9_205)
{
l9_204=float2((l9_206*float3(l9_204,1.0)).xy);
}
float2 l9_207=l9_204;
param_31=l9_207;
float l9_208=param_31.x;
int l9_209=param_34.x;
bool l9_210=l9_174;
float l9_211=l9_175;
if ((l9_209==0)||(l9_209==3))
{
float l9_212=l9_208;
float l9_213=0.0;
float l9_214=1.0;
bool l9_215=l9_210;
float l9_216=l9_211;
float l9_217=fast::clamp(l9_212,l9_213,l9_214);
float l9_218=step(abs(l9_212-l9_217),9.9999997e-06);
l9_216*=(l9_218+((1.0-float(l9_215))*(1.0-l9_218)));
l9_212=l9_217;
l9_208=l9_212;
l9_211=l9_216;
}
param_31.x=l9_208;
l9_175=l9_211;
float l9_219=param_31.y;
int l9_220=param_34.y;
bool l9_221=l9_174;
float l9_222=l9_175;
if ((l9_220==0)||(l9_220==3))
{
float l9_223=l9_219;
float l9_224=0.0;
float l9_225=1.0;
bool l9_226=l9_221;
float l9_227=l9_222;
float l9_228=fast::clamp(l9_223,l9_224,l9_225);
float l9_229=step(abs(l9_223-l9_228),9.9999997e-06);
l9_227*=(l9_229+((1.0-float(l9_226))*(1.0-l9_229)));
l9_223=l9_228;
l9_219=l9_223;
l9_222=l9_227;
}
param_31.y=l9_219;
l9_175=l9_222;
float2 l9_230=param_31;
int l9_231=param_29;
int l9_232=param_30;
float l9_233=param_39;
float2 l9_234=l9_230;
int l9_235=l9_231;
int l9_236=l9_232;
float3 l9_237=float3(0.0);
if (l9_235==0)
{
l9_237=float3(l9_234,0.0);
}
else
{
if (l9_235==1)
{
l9_237=float3(l9_234.x,(l9_234.y*0.5)+(0.5-(float(l9_236)*0.5)),0.0);
}
else
{
l9_237=float3(l9_234,float(l9_236));
}
}
float3 l9_238=l9_237;
float3 l9_239=l9_238;
float4 l9_240=sc_set0.background.sample(sc_set0.backgroundSmpSC,l9_239.xy,bias(l9_233));
float4 l9_241=l9_240;
if (param_37)
{
l9_241=mix(param_38,l9_241,float4(l9_175));
}
float4 l9_242=l9_241;
Color_N92=l9_242;
float Output_N93=0.0;
Output_N93=Color_N92.z;
float3 Value_N94=float3(0.0);
Value_N94.x=Output_N88;
Value_N94.y=Output_N90;
Value_N94.z=Output_N93;
float4 Output_N42=float4(0.0);
float4 param_40=(*sc_set0.UserUniforms).colorTint;
Output_N42=param_40;
float3 Value_N54=float3(0.0);
Value_N54=Output_N42.xyz;
float3 Value_N95=float3(0.0);
Value_N95=Value_N54;
float3 Output_N96=float3(0.0);
Output_N96=Value_N94*Value_N95;
float3 Output_N97=float3(0.0);
Output_N97=mix(Value_N94,Output_N96,float3((*sc_set0.UserUniforms).Port_Input2_N097));
float Value_N98=0.0;
Value_N98=Ratio_N69;
float Output_N99=0.0;
Output_N99=(*sc_set0.UserUniforms).Port_Input0_N099-Value_N98;
float Output_N100=0.0;
Output_N100=abs(Output_N99);
float Output_N73=0.0;
float param_41=(*sc_set0.UserUniforms).exponent;
Output_N73=param_41;
float Value_N75=0.0;
Value_N75=Output_N73;
float Value_N101=0.0;
Value_N101=Value_N75;
float Output_N102=0.0;
float l9_243;
if (Output_N100<=0.0)
{
l9_243=0.0;
}
else
{
l9_243=pow(Output_N100,Value_N101);
}
Output_N102=l9_243;
float Output_N103=0.0;
Output_N103=1.0-Output_N102;
float Output_N74=0.0;
float param_42=(*sc_set0.UserUniforms).darken;
Output_N74=param_42;
float Value_N76=0.0;
Value_N76=Output_N74;
float Value_N104=0.0;
Value_N104=Value_N76;
float Output_N105=0.0;
Output_N105=mix((*sc_set0.UserUniforms).Port_Input0_N105,Output_N103,Value_N104);
float Output_N106=0.0;
Output_N106=Output_N105*Output_N105;
float3 Output_N107=float3(0.0);
Output_N107=Output_N97*float3(Output_N106);
float3 Export_N108=float3(0.0);
Export_N108=Output_N107;
float3 Export_N109=float3(0.0);
Export_N109=Export_N108;
float4 Value_N127=float4(0.0);
Value_N127.x=Output_N115.x;
Value_N127=float4(Value_N127.x,Export_N109.x,Export_N109.y,Export_N109.z);
float2 UVCoord_N119=float2(0.0);
UVCoord_N119=Globals.Surface_UVCoord0;
float Output_N120=0.0;
float param_43=(*sc_set0.UserUniforms).uvScale;
Output_N120=param_43;
float2 CoordsOut_N121=float2(0.0);
CoordsOut_N121=((UVCoord_N119-(*sc_set0.UserUniforms).Port_Center_N121)*float2(Output_N120))+(*sc_set0.UserUniforms).Port_Center_N121;
float4 Output_N126=float4(0.0);
float2 param_44=CoordsOut_N121;
int l9_244;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_245=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_245=0;
}
else
{
l9_245=in.varStereoViewID;
}
int l9_246=l9_245;
l9_244=1-l9_246;
}
else
{
int l9_247=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_247=0;
}
else
{
l9_247=in.varStereoViewID;
}
int l9_248=l9_247;
l9_244=l9_248;
}
int l9_249=l9_244;
int l9_250=normalTexLayout_tmp;
int l9_251=l9_249;
float2 l9_252=param_44;
bool l9_253=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_254=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_255=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_256=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_257=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_258=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_259=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_260=0.0;
bool l9_261=l9_258&&(!l9_256);
float l9_262=1.0;
float l9_263=l9_252.x;
int l9_264=l9_255.x;
if (l9_264==1)
{
l9_263=fract(l9_263);
}
else
{
if (l9_264==2)
{
float l9_265=fract(l9_263);
float l9_266=l9_263-l9_265;
float l9_267=step(0.25,fract(l9_266*0.5));
l9_263=mix(l9_265,1.0-l9_265,fast::clamp(l9_267,0.0,1.0));
}
}
l9_252.x=l9_263;
float l9_268=l9_252.y;
int l9_269=l9_255.y;
if (l9_269==1)
{
l9_268=fract(l9_268);
}
else
{
if (l9_269==2)
{
float l9_270=fract(l9_268);
float l9_271=l9_268-l9_270;
float l9_272=step(0.25,fract(l9_271*0.5));
l9_268=mix(l9_270,1.0-l9_270,fast::clamp(l9_272,0.0,1.0));
}
}
l9_252.y=l9_268;
if (l9_256)
{
bool l9_273=l9_258;
bool l9_274;
if (l9_273)
{
l9_274=l9_255.x==3;
}
else
{
l9_274=l9_273;
}
float l9_275=l9_252.x;
float l9_276=l9_257.x;
float l9_277=l9_257.z;
bool l9_278=l9_274;
float l9_279=l9_262;
float l9_280=fast::clamp(l9_275,l9_276,l9_277);
float l9_281=step(abs(l9_275-l9_280),9.9999997e-06);
l9_279*=(l9_281+((1.0-float(l9_278))*(1.0-l9_281)));
l9_275=l9_280;
l9_252.x=l9_275;
l9_262=l9_279;
bool l9_282=l9_258;
bool l9_283;
if (l9_282)
{
l9_283=l9_255.y==3;
}
else
{
l9_283=l9_282;
}
float l9_284=l9_252.y;
float l9_285=l9_257.y;
float l9_286=l9_257.w;
bool l9_287=l9_283;
float l9_288=l9_262;
float l9_289=fast::clamp(l9_284,l9_285,l9_286);
float l9_290=step(abs(l9_284-l9_289),9.9999997e-06);
l9_288*=(l9_290+((1.0-float(l9_287))*(1.0-l9_290)));
l9_284=l9_289;
l9_252.y=l9_284;
l9_262=l9_288;
}
float2 l9_291=l9_252;
bool l9_292=l9_253;
float3x3 l9_293=l9_254;
if (l9_292)
{
l9_291=float2((l9_293*float3(l9_291,1.0)).xy);
}
float2 l9_294=l9_291;
l9_252=l9_294;
float l9_295=l9_252.x;
int l9_296=l9_255.x;
bool l9_297=l9_261;
float l9_298=l9_262;
if ((l9_296==0)||(l9_296==3))
{
float l9_299=l9_295;
float l9_300=0.0;
float l9_301=1.0;
bool l9_302=l9_297;
float l9_303=l9_298;
float l9_304=fast::clamp(l9_299,l9_300,l9_301);
float l9_305=step(abs(l9_299-l9_304),9.9999997e-06);
l9_303*=(l9_305+((1.0-float(l9_302))*(1.0-l9_305)));
l9_299=l9_304;
l9_295=l9_299;
l9_298=l9_303;
}
l9_252.x=l9_295;
l9_262=l9_298;
float l9_306=l9_252.y;
int l9_307=l9_255.y;
bool l9_308=l9_261;
float l9_309=l9_262;
if ((l9_307==0)||(l9_307==3))
{
float l9_310=l9_306;
float l9_311=0.0;
float l9_312=1.0;
bool l9_313=l9_308;
float l9_314=l9_309;
float l9_315=fast::clamp(l9_310,l9_311,l9_312);
float l9_316=step(abs(l9_310-l9_315),9.9999997e-06);
l9_314*=(l9_316+((1.0-float(l9_313))*(1.0-l9_316)));
l9_310=l9_315;
l9_306=l9_310;
l9_309=l9_314;
}
l9_252.y=l9_306;
l9_262=l9_309;
float2 l9_317=l9_252;
int l9_318=l9_250;
int l9_319=l9_251;
float l9_320=l9_260;
float2 l9_321=l9_317;
int l9_322=l9_318;
int l9_323=l9_319;
float3 l9_324=float3(0.0);
if (l9_322==0)
{
l9_324=float3(l9_321,0.0);
}
else
{
if (l9_322==1)
{
l9_324=float3(l9_321.x,(l9_321.y*0.5)+(0.5-(float(l9_323)*0.5)),0.0);
}
else
{
l9_324=float3(l9_321,float(l9_323));
}
}
float3 l9_325=l9_324;
float3 l9_326=l9_325;
float4 l9_327=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_326.xy,bias(l9_320));
float4 l9_328=l9_327;
if (l9_258)
{
l9_328=mix(l9_259,l9_328,float4(l9_262));
}
float4 l9_329=l9_328;
float4 param_45=l9_329;
float3 l9_330=(param_45.xyz*1.9921875)-float3(1.0);
param_45=float4(l9_330.x,l9_330.y,l9_330.z,param_45.w);
Output_N126=param_45;
float Output_N9=0.0;
float param_46=(*sc_set0.UserUniforms).roughness;
Output_N9=param_46;
float4 Output_N6=float4(0.0);
float3 param_47=Value_N127.xyz;
float param_48=(*sc_set0.UserUniforms).Port_Opacity_N006;
float3 param_49=Output_N126.xyz;
float3 param_50=(*sc_set0.UserUniforms).Port_Emissive_N006;
float param_51=(*sc_set0.UserUniforms).Port_Metallic_N006;
float param_52=Output_N9;
float3 param_53=(*sc_set0.UserUniforms).Port_AO_N006;
float3 param_54=(*sc_set0.UserUniforms).Port_SpecularAO_N006;
ssGlobals param_56=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_56.BumpedNormal=float3x3(float3(param_56.VertexTangent_WorldSpace),float3(param_56.VertexBinormal_WorldSpace),float3(param_56.VertexNormal_WorldSpace))*param_49;
}
float l9_331=param_48;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_331<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_332=gl_FragCoord;
float2 l9_333=floor(mod(l9_332.xy,float2(4.0)));
float l9_334=(mod(dot(l9_333,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_331<l9_334)
{
discard_fragment();
}
}
param_47=fast::max(param_47,float3(0.0));
float4 param_55;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_55=float4(param_47,param_48);
}
else
{
param_52=fast::clamp(param_52,0.0,1.0);
float3 l9_335=param_47;
float l9_336=param_48;
float3 l9_337=param_56.BumpedNormal;
float3 l9_338=param_56.PositionWS;
float3 l9_339=param_56.ViewDirWS;
float3 l9_340=param_50;
float l9_341=param_51;
float l9_342=param_52;
float3 l9_343=param_53;
float3 l9_344=param_54;
SurfaceProperties l9_345;
l9_345.albedo=float3(0.0);
l9_345.opacity=1.0;
l9_345.normal=float3(0.0);
l9_345.positionWS=float3(0.0);
l9_345.viewDirWS=float3(0.0);
l9_345.metallic=0.0;
l9_345.roughness=0.0;
l9_345.emissive=float3(0.0);
l9_345.ao=float3(1.0);
l9_345.specularAo=float3(1.0);
l9_345.bakedShadows=float3(1.0);
SurfaceProperties l9_346=l9_345;
SurfaceProperties l9_347=l9_346;
l9_347.opacity=l9_336;
float3 l9_348=l9_335;
float3 l9_349;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_349=float3(pow(l9_348.x,2.2),pow(l9_348.y,2.2),pow(l9_348.z,2.2));
}
else
{
l9_349=l9_348*l9_348;
}
float3 l9_350=l9_349;
l9_347.albedo=l9_350;
l9_347.normal=normalize(l9_337);
l9_347.positionWS=l9_338;
l9_347.viewDirWS=l9_339;
float3 l9_351=l9_340;
float3 l9_352;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_352=float3(pow(l9_351.x,2.2),pow(l9_351.y,2.2),pow(l9_351.z,2.2));
}
else
{
l9_352=l9_351*l9_351;
}
float3 l9_353=l9_352;
l9_347.emissive=l9_353;
l9_347.metallic=l9_341;
l9_347.roughness=l9_342;
l9_347.ao=l9_343;
l9_347.specularAo=l9_344;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_354=l9_347.positionWS;
l9_347.ao=evaluateSSAO(l9_354,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_355=l9_347;
SurfaceProperties l9_356=l9_355;
float3 l9_357=mix(float3(0.039999999),l9_356.albedo*l9_356.metallic,float3(l9_356.metallic));
float3 l9_358=mix(l9_356.albedo*(1.0-l9_356.metallic),float3(0.0),float3(l9_356.metallic));
l9_355.albedo=l9_358;
l9_355.specColor=l9_357;
SurfaceProperties l9_359=l9_355;
l9_347=l9_359;
SurfaceProperties l9_360=l9_347;
LightingComponents l9_361;
l9_361.directDiffuse=float3(0.0);
l9_361.directSpecular=float3(0.0);
l9_361.indirectDiffuse=float3(1.0);
l9_361.indirectSpecular=float3(0.0);
l9_361.emitted=float3(0.0);
l9_361.transmitted=float3(0.0);
LightingComponents l9_362=l9_361;
LightingComponents l9_363=l9_362;
float3 l9_364=l9_360.viewDirWS;
int l9_365=0;
float4 l9_366=float4(l9_360.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_367;
LightProperties l9_368;
int l9_369=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_369<sc_DirectionalLightsCount_tmp)
{
l9_367.direction=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_369].direction;
l9_367.color=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_369].color;
l9_368.direction=l9_367.direction;
l9_368.color=l9_367.color.xyz;
l9_368.attenuation=l9_367.color.w;
l9_368.attenuation*=l9_366[(l9_365<3) ? l9_365 : 3];
l9_365++;
LightingComponents l9_370=l9_363;
LightProperties l9_371=l9_368;
SurfaceProperties l9_372=l9_360;
float3 l9_373=l9_364;
SurfaceProperties l9_374=l9_372;
float3 l9_375=l9_371.direction;
float l9_376=dot(l9_374.normal,l9_375);
float l9_377=fast::clamp(l9_376,0.0,1.0);
float3 l9_378=float3(l9_377);
l9_370.directDiffuse+=((l9_378*l9_371.color)*l9_371.attenuation);
SurfaceProperties l9_379=l9_372;
float3 l9_380=l9_371.direction;
float3 l9_381=l9_373;
l9_370.directSpecular+=((calculateDirectSpecular(l9_379,l9_380,l9_381)*l9_371.color)*l9_371.attenuation);
LightingComponents l9_382=l9_370;
l9_363=l9_382;
l9_369++;
continue;
}
else
{
break;
}
}
}
if (sc_PointLightsCount_tmp>0)
{
sc_PointLight_t_1 l9_383;
LightProperties l9_384;
int l9_385=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_385<sc_PointLightsCount_tmp)
{
l9_383.falloffEnabled=(*sc_set0.UserUniforms).sc_PointLights[l9_385].falloffEnabled!=0;
l9_383.falloffEndDistance=(*sc_set0.UserUniforms).sc_PointLights[l9_385].falloffEndDistance;
l9_383.negRcpFalloffEndDistance4=(*sc_set0.UserUniforms).sc_PointLights[l9_385].negRcpFalloffEndDistance4;
l9_383.angleScale=(*sc_set0.UserUniforms).sc_PointLights[l9_385].angleScale;
l9_383.angleOffset=(*sc_set0.UserUniforms).sc_PointLights[l9_385].angleOffset;
l9_383.direction=(*sc_set0.UserUniforms).sc_PointLights[l9_385].direction;
l9_383.position=(*sc_set0.UserUniforms).sc_PointLights[l9_385].position;
l9_383.color=(*sc_set0.UserUniforms).sc_PointLights[l9_385].color;
float3 l9_386=l9_383.position-l9_360.positionWS;
l9_384.direction=normalize(l9_386);
l9_384.color=l9_383.color.xyz;
l9_384.attenuation=l9_383.color.w;
l9_384.attenuation*=l9_366[(l9_365<3) ? l9_365 : 3];
float3 l9_387=l9_384.direction;
float3 l9_388=l9_383.direction;
float l9_389=l9_383.angleScale;
float l9_390=l9_383.angleOffset;
float l9_391=dot(l9_387,l9_388);
float l9_392=fast::clamp((l9_391*l9_389)+l9_390,0.0,1.0);
float l9_393=l9_392*l9_392;
l9_384.attenuation*=l9_393;
if (l9_383.falloffEnabled)
{
float l9_394=length(l9_386);
float l9_395=l9_383.falloffEndDistance;
l9_384.attenuation*=computeDistanceAttenuation(l9_394,l9_395);
}
l9_365++;
LightingComponents l9_396=l9_363;
LightProperties l9_397=l9_384;
SurfaceProperties l9_398=l9_360;
float3 l9_399=l9_364;
SurfaceProperties l9_400=l9_398;
float3 l9_401=l9_397.direction;
float l9_402=dot(l9_400.normal,l9_401);
float l9_403=fast::clamp(l9_402,0.0,1.0);
float3 l9_404=float3(l9_403);
l9_396.directDiffuse+=((l9_404*l9_397.color)*l9_397.attenuation);
SurfaceProperties l9_405=l9_398;
float3 l9_406=l9_397.direction;
float3 l9_407=l9_399;
l9_396.directSpecular+=((calculateDirectSpecular(l9_405,l9_406,l9_407)*l9_397.color)*l9_397.attenuation);
LightingComponents l9_408=l9_396;
l9_363=l9_408;
l9_385++;
continue;
}
else
{
break;
}
}
}
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float3 l9_409=float3(0.0);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_410=abs(in.varShadowTex-float2(0.5));
float l9_411=fast::max(l9_410.x,l9_410.y);
float l9_412=step(l9_411,0.5);
float4 l9_413=sc_set0.sc_ShadowTexture.sample(sc_set0.sc_ShadowTextureSmpSC,in.varShadowTex)*l9_412;
float3 l9_414=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_413.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float l9_415=l9_413.w*(*sc_set0.UserUniforms).sc_ShadowDensity;
l9_409=mix(float3(1.0),l9_414,float3(l9_415));
}
else
{
l9_409=float3(1.0);
}
float3 l9_416=l9_409;
float3 l9_417=l9_416;
l9_363.directDiffuse*=l9_417;
l9_363.directSpecular*=l9_417;
}
if (((*sc_set0.UserUniforms).sc_RayTracingReceiverEffectsMask&4)!=0)
{
float4 l9_418=gl_FragCoord;
float2 l9_419=l9_418.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_420=l9_419;
float2 l9_421=l9_420;
float l9_422=0.0;
int l9_423;
if ((int(sc_RayTracingShadowsHasSwappedViews_tmp)!=0))
{
int l9_424=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_424=0;
}
else
{
l9_424=in.varStereoViewID;
}
int l9_425=l9_424;
l9_423=1-l9_425;
}
else
{
int l9_426=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_426=0;
}
else
{
l9_426=in.varStereoViewID;
}
int l9_427=l9_426;
l9_423=l9_427;
}
int l9_428=l9_423;
float2 l9_429=l9_421;
int l9_430=sc_RayTracingShadowsLayout_tmp;
int l9_431=l9_428;
float l9_432=l9_422;
float2 l9_433=l9_429;
int l9_434=l9_430;
int l9_435=l9_431;
float3 l9_436=float3(0.0);
if (l9_434==0)
{
l9_436=float3(l9_433,0.0);
}
else
{
if (l9_434==1)
{
l9_436=float3(l9_433.x,(l9_433.y*0.5)+(0.5-(float(l9_435)*0.5)),0.0);
}
else
{
l9_436=float3(l9_433,float(l9_435));
}
}
float3 l9_437=l9_436;
float3 l9_438=l9_437;
float4 l9_439=sc_set0.sc_RayTracingShadows.sample(sc_set0.sc_RayTracingShadowsSmpSC,l9_438.xy,bias(l9_432));
float4 l9_440=l9_439;
float4 l9_441=l9_440;
float l9_442=l9_441.x;
float l9_443=1.0-l9_442;
l9_363.directDiffuse*=l9_443;
l9_363.directSpecular*=l9_443;
}
SurfaceProperties l9_444=l9_360;
float3 l9_445=l9_444.normal;
float3 l9_446=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_447=l9_445;
float3 l9_448=l9_447;
float l9_449=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_450=float2(0.0);
float l9_451=l9_448.x;
float l9_452=-l9_448.z;
float l9_453=(l9_451<0.0) ? (-1.0) : 1.0;
float l9_454=l9_453*acos(fast::clamp(l9_452/length(float2(l9_451,l9_452)),-1.0,1.0));
l9_450.x=l9_454-1.5707964;
l9_450.y=acos(l9_448.y);
l9_450/=float2(6.2831855,3.1415927);
l9_450.y=1.0-l9_450.y;
l9_450.x+=(l9_449/360.0);
l9_450.x=fract((l9_450.x+floor(l9_450.x))+1.0);
float2 l9_455=l9_450;
float2 l9_456=l9_455;
float4 l9_457=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_458=l9_456;
float2 l9_459=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_460=5.0;
l9_456=calcSeamlessPanoramicUvsForSampling(l9_458,l9_459,l9_460);
}
float2 l9_461=l9_456;
float l9_462=13.0;
int l9_463;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_464=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_464=0;
}
else
{
l9_464=in.varStereoViewID;
}
int l9_465=l9_464;
l9_463=1-l9_465;
}
else
{
int l9_466=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_466=0;
}
else
{
l9_466=in.varStereoViewID;
}
int l9_467=l9_466;
l9_463=l9_467;
}
int l9_468=l9_463;
float2 l9_469=l9_461;
int l9_470=sc_EnvmapSpecularLayout_tmp;
int l9_471=l9_468;
float l9_472=l9_462;
float2 l9_473=l9_469;
int l9_474=l9_470;
int l9_475=l9_471;
float3 l9_476=float3(0.0);
if (l9_474==0)
{
l9_476=float3(l9_473,0.0);
}
else
{
if (l9_474==1)
{
l9_476=float3(l9_473.x,(l9_473.y*0.5)+(0.5-(float(l9_475)*0.5)),0.0);
}
else
{
l9_476=float3(l9_473,float(l9_475));
}
}
float3 l9_477=l9_476;
float3 l9_478=l9_477;
float4 l9_479=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_478.xy,bias(l9_472));
float4 l9_480=l9_479;
l9_457=l9_480;
}
else
{
if ((int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_481=l9_456;
float2 l9_482=(*sc_set0.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_483=0.0;
l9_456=calcSeamlessPanoramicUvsForSampling(l9_481,l9_482,l9_483);
float2 l9_484=l9_456;
float l9_485=-13.0;
int l9_486;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_487=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_487=0;
}
else
{
l9_487=in.varStereoViewID;
}
int l9_488=l9_487;
l9_486=1-l9_488;
}
else
{
int l9_489=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_489=0;
}
else
{
l9_489=in.varStereoViewID;
}
int l9_490=l9_489;
l9_486=l9_490;
}
int l9_491=l9_486;
float2 l9_492=l9_484;
int l9_493=sc_EnvmapDiffuseLayout_tmp;
int l9_494=l9_491;
float l9_495=l9_485;
float2 l9_496=l9_492;
int l9_497=l9_493;
int l9_498=l9_494;
float3 l9_499=float3(0.0);
if (l9_497==0)
{
l9_499=float3(l9_496,0.0);
}
else
{
if (l9_497==1)
{
l9_499=float3(l9_496.x,(l9_496.y*0.5)+(0.5-(float(l9_498)*0.5)),0.0);
}
else
{
l9_499=float3(l9_496,float(l9_498));
}
}
float3 l9_500=l9_499;
float3 l9_501=l9_500;
float4 l9_502=sc_set0.sc_EnvmapDiffuse.sample(sc_set0.sc_EnvmapDiffuseSmpSC,l9_501.xy,bias(l9_495));
float4 l9_503=l9_502;
l9_457=l9_503;
}
else
{
float2 l9_504=l9_456;
float l9_505=13.0;
int l9_506;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_507=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_507=0;
}
else
{
l9_507=in.varStereoViewID;
}
int l9_508=l9_507;
l9_506=1-l9_508;
}
else
{
int l9_509=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_509=0;
}
else
{
l9_509=in.varStereoViewID;
}
int l9_510=l9_509;
l9_506=l9_510;
}
int l9_511=l9_506;
float2 l9_512=l9_504;
int l9_513=sc_EnvmapSpecularLayout_tmp;
int l9_514=l9_511;
float l9_515=l9_505;
float2 l9_516=l9_512;
int l9_517=l9_513;
int l9_518=l9_514;
float3 l9_519=float3(0.0);
if (l9_517==0)
{
l9_519=float3(l9_516,0.0);
}
else
{
if (l9_517==1)
{
l9_519=float3(l9_516.x,(l9_516.y*0.5)+(0.5-(float(l9_518)*0.5)),0.0);
}
else
{
l9_519=float3(l9_516,float(l9_518));
}
}
float3 l9_520=l9_519;
float3 l9_521=l9_520;
float4 l9_522=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_521.xy,bias(l9_515));
float4 l9_523=l9_522;
l9_457=l9_523;
}
}
float4 l9_524=l9_457;
float3 l9_525=l9_524.xyz*(1.0/l9_524.w);
float3 l9_526=l9_525*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_446=l9_526;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_527=(*sc_set0.UserUniforms).sc_Sh[0];
float3 l9_528=(*sc_set0.UserUniforms).sc_Sh[1];
float3 l9_529=(*sc_set0.UserUniforms).sc_Sh[2];
float3 l9_530=(*sc_set0.UserUniforms).sc_Sh[3];
float3 l9_531=(*sc_set0.UserUniforms).sc_Sh[4];
float3 l9_532=(*sc_set0.UserUniforms).sc_Sh[5];
float3 l9_533=(*sc_set0.UserUniforms).sc_Sh[6];
float3 l9_534=(*sc_set0.UserUniforms).sc_Sh[7];
float3 l9_535=(*sc_set0.UserUniforms).sc_Sh[8];
float3 l9_536=-l9_445;
float l9_537=0.0;
l9_537=l9_536.x;
float l9_538=l9_536.y;
float l9_539=l9_536.z;
float l9_540=l9_537*l9_537;
float l9_541=l9_538*l9_538;
float l9_542=l9_539*l9_539;
float l9_543=l9_537*l9_538;
float l9_544=l9_538*l9_539;
float l9_545=l9_537*l9_539;
float3 l9_546=((((((l9_535*0.42904299)*(l9_540-l9_541))+((l9_533*0.74312502)*l9_542))+(l9_527*0.88622701))-(l9_533*0.24770799))+((((l9_531*l9_543)+(l9_534*l9_545))+(l9_532*l9_544))*0.85808599))+((((l9_530*l9_537)+(l9_528*l9_538))+(l9_529*l9_539))*1.0233279);
l9_446=l9_546*(*sc_set0.UserUniforms).sc_ShIntensity;
}
}
if (((*sc_set0.UserUniforms).sc_RayTracingReceiverEffectsMask&2)!=0)
{
float4 l9_547=gl_FragCoord;
float2 l9_548=l9_547.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_549=l9_548;
float2 l9_550=l9_549;
float l9_551=0.0;
int l9_552;
if ((int(sc_RayTracingGlobalIlluminationHasSwappedViews_tmp)!=0))
{
int l9_553=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_553=0;
}
else
{
l9_553=in.varStereoViewID;
}
int l9_554=l9_553;
l9_552=1-l9_554;
}
else
{
int l9_555=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_555=0;
}
else
{
l9_555=in.varStereoViewID;
}
int l9_556=l9_555;
l9_552=l9_556;
}
int l9_557=l9_552;
float2 l9_558=l9_550;
int l9_559=sc_RayTracingGlobalIlluminationLayout_tmp;
int l9_560=l9_557;
float l9_561=l9_551;
float2 l9_562=l9_558;
int l9_563=l9_559;
int l9_564=l9_560;
float3 l9_565=float3(0.0);
if (l9_563==0)
{
l9_565=float3(l9_562,0.0);
}
else
{
if (l9_563==1)
{
l9_565=float3(l9_562.x,(l9_562.y*0.5)+(0.5-(float(l9_564)*0.5)),0.0);
}
else
{
l9_565=float3(l9_562,float(l9_564));
}
}
float3 l9_566=l9_565;
float3 l9_567=l9_566;
float4 l9_568=sc_set0.sc_RayTracingGlobalIllumination.sample(sc_set0.sc_RayTracingGlobalIlluminationSmpSC,l9_567.xy,bias(l9_561));
float4 l9_569=l9_568;
float4 l9_570=l9_569;
float4 l9_571=l9_570;
l9_446=mix(l9_446,l9_571.xyz,float3(l9_571.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_446+=((*sc_set0.UserUniforms).sc_AmbientLights[0].color*(*sc_set0.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_446.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_446+=((*sc_set0.UserUniforms).sc_AmbientLights[1].color*(*sc_set0.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_446.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_446+=((*sc_set0.UserUniforms).sc_AmbientLights[2].color*(*sc_set0.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_446.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_572=l9_445;
float3 l9_573=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_574;
float l9_575;
int l9_576=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_576<sc_LightEstimationSGCount_tmp)
{
l9_574.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_576].color;
l9_574.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_576].sharpness;
l9_574.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_576].axis;
float3 l9_577=l9_572;
float l9_578=dot(l9_574.axis,l9_577);
float l9_579=l9_574.sharpness;
float l9_580=0.36000001;
float l9_581=1.0/(4.0*l9_580);
float l9_582=exp(-l9_579);
float l9_583=l9_582*l9_582;
float l9_584=1.0/l9_579;
float l9_585=(1.0+(2.0*l9_583))-l9_584;
float l9_586=((l9_582-l9_583)*l9_584)-l9_583;
float l9_587=sqrt(1.0-l9_585);
float l9_588=l9_580*l9_578;
float l9_589=l9_581*l9_587;
float l9_590=l9_588+l9_589;
float l9_591=l9_578;
float l9_592=fast::clamp(l9_591,0.0,1.0);
float l9_593=l9_592;
if (step(abs(l9_588),l9_589)>0.5)
{
l9_575=(l9_590*l9_590)/l9_587;
}
else
{
l9_575=l9_593;
}
l9_593=l9_575;
float l9_594=(l9_585*l9_593)+l9_586;
sc_SphericalGaussianLight_t l9_595=l9_574;
float3 l9_596=(l9_595.color/float3(l9_595.sharpness))*6.2831855;
float3 l9_597=(l9_596*l9_594)/float3(3.1415927);
l9_573+=l9_597;
l9_576++;
continue;
}
else
{
break;
}
}
float3 l9_598=l9_573;
l9_446+=l9_598;
}
float3 l9_599=l9_446;
float3 l9_600=l9_599;
l9_363.indirectDiffuse=l9_600;
SurfaceProperties l9_601=l9_360;
float3 l9_602=l9_364;
float3 l9_603=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_604=l9_601;
float3 l9_605=l9_602;
float3 l9_606=l9_604.normal;
float3 l9_607=reflect(-l9_605,l9_606);
float3 l9_608=l9_606;
float3 l9_609=l9_607;
float l9_610=l9_604.roughness;
l9_607=getSpecularDominantDir(l9_608,l9_609,l9_610);
float l9_611=l9_604.roughness;
float l9_612=pow(l9_611,0.66666669);
float l9_613=fast::clamp(l9_612,0.0,1.0);
float l9_614=l9_613*5.0;
float l9_615=l9_614;
float l9_616=l9_615;
float3 l9_617=l9_607;
float l9_618=l9_616;
float3 l9_619=l9_617;
float l9_620=l9_618;
float4 l9_621=float4(0.0);
float3 l9_622=l9_619;
float l9_623=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_624=float2(0.0);
float l9_625=l9_622.x;
float l9_626=-l9_622.z;
float l9_627=(l9_625<0.0) ? (-1.0) : 1.0;
float l9_628=l9_627*acos(fast::clamp(l9_626/length(float2(l9_625,l9_626)),-1.0,1.0));
l9_624.x=l9_628-1.5707964;
l9_624.y=acos(l9_622.y);
l9_624/=float2(6.2831855,3.1415927);
l9_624.y=1.0-l9_624.y;
l9_624.x+=(l9_623/360.0);
l9_624.x=fract((l9_624.x+floor(l9_624.x))+1.0);
float2 l9_629=l9_624;
float2 l9_630=l9_629;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_631=floor(l9_620);
float l9_632=ceil(l9_620);
float l9_633=l9_620-l9_631;
float2 l9_634=l9_630;
float2 l9_635=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_636=l9_631;
float2 l9_637=calcSeamlessPanoramicUvsForSampling(l9_634,l9_635,l9_636);
float2 l9_638=l9_637;
float l9_639=l9_631;
float2 l9_640=l9_638;
float l9_641=l9_639;
int l9_642;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_643=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_643=0;
}
else
{
l9_643=in.varStereoViewID;
}
int l9_644=l9_643;
l9_642=1-l9_644;
}
else
{
int l9_645=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_645=0;
}
else
{
l9_645=in.varStereoViewID;
}
int l9_646=l9_645;
l9_642=l9_646;
}
int l9_647=l9_642;
float2 l9_648=l9_640;
int l9_649=sc_EnvmapSpecularLayout_tmp;
int l9_650=l9_647;
float l9_651=l9_641;
float2 l9_652=l9_648;
int l9_653=l9_649;
int l9_654=l9_650;
float3 l9_655=float3(0.0);
if (l9_653==0)
{
l9_655=float3(l9_652,0.0);
}
else
{
if (l9_653==1)
{
l9_655=float3(l9_652.x,(l9_652.y*0.5)+(0.5-(float(l9_654)*0.5)),0.0);
}
else
{
l9_655=float3(l9_652,float(l9_654));
}
}
float3 l9_656=l9_655;
float3 l9_657=l9_656;
float4 l9_658=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_657.xy,level(l9_651));
float4 l9_659=l9_658;
float4 l9_660=l9_659;
float4 l9_661=l9_660;
float2 l9_662=l9_630;
float2 l9_663=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_664=l9_632;
float2 l9_665=calcSeamlessPanoramicUvsForSampling(l9_662,l9_663,l9_664);
float2 l9_666=l9_665;
float l9_667=l9_632;
float2 l9_668=l9_666;
float l9_669=l9_667;
int l9_670;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_671=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_671=0;
}
else
{
l9_671=in.varStereoViewID;
}
int l9_672=l9_671;
l9_670=1-l9_672;
}
else
{
int l9_673=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_673=0;
}
else
{
l9_673=in.varStereoViewID;
}
int l9_674=l9_673;
l9_670=l9_674;
}
int l9_675=l9_670;
float2 l9_676=l9_668;
int l9_677=sc_EnvmapSpecularLayout_tmp;
int l9_678=l9_675;
float l9_679=l9_669;
float2 l9_680=l9_676;
int l9_681=l9_677;
int l9_682=l9_678;
float3 l9_683=float3(0.0);
if (l9_681==0)
{
l9_683=float3(l9_680,0.0);
}
else
{
if (l9_681==1)
{
l9_683=float3(l9_680.x,(l9_680.y*0.5)+(0.5-(float(l9_682)*0.5)),0.0);
}
else
{
l9_683=float3(l9_680,float(l9_682));
}
}
float3 l9_684=l9_683;
float3 l9_685=l9_684;
float4 l9_686=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_685.xy,level(l9_679));
float4 l9_687=l9_686;
float4 l9_688=l9_687;
float4 l9_689=l9_688;
l9_621=mix(l9_661,l9_689,float4(l9_633));
}
else
{
float2 l9_690=l9_630;
float l9_691=l9_620;
float2 l9_692=l9_690;
float l9_693=l9_691;
int l9_694;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_695=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_695=0;
}
else
{
l9_695=in.varStereoViewID;
}
int l9_696=l9_695;
l9_694=1-l9_696;
}
else
{
int l9_697=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_697=0;
}
else
{
l9_697=in.varStereoViewID;
}
int l9_698=l9_697;
l9_694=l9_698;
}
int l9_699=l9_694;
float2 l9_700=l9_692;
int l9_701=sc_EnvmapSpecularLayout_tmp;
int l9_702=l9_699;
float l9_703=l9_693;
float2 l9_704=l9_700;
int l9_705=l9_701;
int l9_706=l9_702;
float3 l9_707=float3(0.0);
if (l9_705==0)
{
l9_707=float3(l9_704,0.0);
}
else
{
if (l9_705==1)
{
l9_707=float3(l9_704.x,(l9_704.y*0.5)+(0.5-(float(l9_706)*0.5)),0.0);
}
else
{
l9_707=float3(l9_704,float(l9_706));
}
}
float3 l9_708=l9_707;
float3 l9_709=l9_708;
float4 l9_710=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_709.xy,level(l9_703));
float4 l9_711=l9_710;
float4 l9_712=l9_711;
l9_621=l9_712;
}
float4 l9_713=l9_621;
float3 l9_714=l9_713.xyz*(1.0/l9_713.w);
float3 l9_715=l9_714;
float3 l9_716=l9_715*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_716+=float3(1e-06);
float3 l9_717=l9_716;
float3 l9_718=l9_717;
if (((*sc_set0.UserUniforms).sc_RayTracingReceiverEffectsMask&1)!=0)
{
float4 l9_719=gl_FragCoord;
float2 l9_720=l9_719.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_721=l9_720;
float2 l9_722=l9_721;
float l9_723=0.0;
int l9_724;
if ((int(sc_RayTracingReflectionsHasSwappedViews_tmp)!=0))
{
int l9_725=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_725=0;
}
else
{
l9_725=in.varStereoViewID;
}
int l9_726=l9_725;
l9_724=1-l9_726;
}
else
{
int l9_727=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_727=0;
}
else
{
l9_727=in.varStereoViewID;
}
int l9_728=l9_727;
l9_724=l9_728;
}
int l9_729=l9_724;
float2 l9_730=l9_722;
int l9_731=sc_RayTracingReflectionsLayout_tmp;
int l9_732=l9_729;
float l9_733=l9_723;
float2 l9_734=l9_730;
int l9_735=l9_731;
int l9_736=l9_732;
float3 l9_737=float3(0.0);
if (l9_735==0)
{
l9_737=float3(l9_734,0.0);
}
else
{
if (l9_735==1)
{
l9_737=float3(l9_734.x,(l9_734.y*0.5)+(0.5-(float(l9_736)*0.5)),0.0);
}
else
{
l9_737=float3(l9_734,float(l9_736));
}
}
float3 l9_738=l9_737;
float3 l9_739=l9_738;
float4 l9_740=sc_set0.sc_RayTracingReflections.sample(sc_set0.sc_RayTracingReflectionsSmpSC,l9_739.xy,bias(l9_733));
float4 l9_741=l9_740;
float4 l9_742=l9_741;
float4 l9_743=l9_742;
l9_718=mix(l9_718,l9_743.xyz,float3(l9_743.w));
}
float l9_744=abs(dot(l9_606,l9_605));
SurfaceProperties l9_745=l9_604;
float l9_746=l9_744;
float3 l9_747=l9_718*envBRDFApprox(l9_745,l9_746);
l9_603+=l9_747;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_748=l9_601;
float3 l9_749=l9_602;
float l9_750=fast::clamp(l9_748.roughness*l9_748.roughness,0.0099999998,1.0);
float3 l9_751=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight*l9_748.specColor;
sc_SphericalGaussianLight_t l9_752;
sc_SphericalGaussianLight_t l9_753;
sc_SphericalGaussianLight_t l9_754;
int l9_755=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_755<sc_LightEstimationSGCount_tmp)
{
l9_752.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_755].color;
l9_752.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_755].sharpness;
l9_752.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_755].axis;
float3 l9_756=l9_748.normal;
float l9_757=l9_750;
float3 l9_758=l9_749;
float3 l9_759=l9_748.specColor;
float3 l9_760=l9_756;
float l9_761=l9_757;
l9_753.axis=l9_760;
float l9_762=l9_761*l9_761;
l9_753.sharpness=2.0/l9_762;
l9_753.color=float3(1.0/(3.1415927*l9_762));
sc_SphericalGaussianLight_t l9_763=l9_753;
sc_SphericalGaussianLight_t l9_764=l9_763;
sc_SphericalGaussianLight_t l9_765=l9_764;
float3 l9_766=l9_758;
l9_754.axis=reflect(-l9_766,l9_765.axis);
l9_754.color=l9_765.color;
l9_754.sharpness=l9_765.sharpness;
l9_754.sharpness/=(4.0*fast::max(dot(l9_765.axis,l9_766),9.9999997e-05));
sc_SphericalGaussianLight_t l9_767=l9_754;
sc_SphericalGaussianLight_t l9_768=l9_767;
sc_SphericalGaussianLight_t l9_769=l9_768;
sc_SphericalGaussianLight_t l9_770=l9_752;
float l9_771=length((l9_769.axis*l9_769.sharpness)+(l9_770.axis*l9_770.sharpness));
float3 l9_772=(l9_769.color*exp((l9_771-l9_769.sharpness)-l9_770.sharpness))*l9_770.color;
float l9_773=1.0-exp((-2.0)*l9_771);
float3 l9_774=((l9_772*6.2831855)*l9_773)/float3(l9_771);
float3 l9_775=l9_774;
float3 l9_776=l9_768.axis;
float l9_777=l9_757*l9_757;
float l9_778=dot(l9_756,l9_776);
float l9_779=fast::clamp(l9_778,0.0,1.0);
float l9_780=l9_779;
float l9_781=dot(l9_756,l9_758);
float l9_782=fast::clamp(l9_781,0.0,1.0);
float l9_783=l9_782;
float3 l9_784=normalize(l9_768.axis+l9_758);
float l9_785=l9_777;
float l9_786=l9_780;
float l9_787=1.0/(l9_786+sqrt(l9_785+(((1.0-l9_785)*l9_786)*l9_786)));
float l9_788=l9_777;
float l9_789=l9_783;
float l9_790=1.0/(l9_789+sqrt(l9_788+(((1.0-l9_788)*l9_789)*l9_789)));
l9_775*=(l9_787*l9_790);
float l9_791=dot(l9_776,l9_784);
float l9_792=fast::clamp(l9_791,0.0,1.0);
float l9_793=pow(1.0-l9_792,5.0);
l9_775*=(l9_759+((float3(1.0)-l9_759)*l9_793));
l9_775*=l9_780;
float3 l9_794=l9_775;
l9_751+=l9_794;
l9_755++;
continue;
}
else
{
break;
}
}
float3 l9_795=l9_751;
l9_603+=l9_795;
}
float3 l9_796=l9_603;
l9_363.indirectSpecular=l9_796;
LightingComponents l9_797=l9_363;
LightingComponents l9_798=l9_797;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_798.directDiffuse=float3(0.0);
l9_798.indirectDiffuse=float3(0.0);
float4 l9_799=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_800=out.sc_FragData0;
l9_799=l9_800;
}
else
{
float4 l9_801=gl_FragCoord;
float2 l9_802=l9_801.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_803=l9_802;
float2 l9_804=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_805=1;
int l9_806=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_806=0;
}
else
{
l9_806=in.varStereoViewID;
}
int l9_807=l9_806;
int l9_808=l9_807;
float3 l9_809=float3(l9_803,0.0);
int l9_810=l9_805;
int l9_811=l9_808;
if (l9_810==1)
{
l9_809.y=((2.0*l9_809.y)+float(l9_811))-1.0;
}
float2 l9_812=l9_809.xy;
l9_804=l9_812;
}
else
{
l9_804=l9_803;
}
float2 l9_813=l9_804;
float2 l9_814=l9_813;
float2 l9_815=l9_814;
float2 l9_816=l9_815;
float l9_817=0.0;
int l9_818;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_819=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_819=0;
}
else
{
l9_819=in.varStereoViewID;
}
int l9_820=l9_819;
l9_818=1-l9_820;
}
else
{
int l9_821=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_821=0;
}
else
{
l9_821=in.varStereoViewID;
}
int l9_822=l9_821;
l9_818=l9_822;
}
int l9_823=l9_818;
float2 l9_824=l9_816;
int l9_825=sc_ScreenTextureLayout_tmp;
int l9_826=l9_823;
float l9_827=l9_817;
float2 l9_828=l9_824;
int l9_829=l9_825;
int l9_830=l9_826;
float3 l9_831=float3(0.0);
if (l9_829==0)
{
l9_831=float3(l9_828,0.0);
}
else
{
if (l9_829==1)
{
l9_831=float3(l9_828.x,(l9_828.y*0.5)+(0.5-(float(l9_830)*0.5)),0.0);
}
else
{
l9_831=float3(l9_828,float(l9_830));
}
}
float3 l9_832=l9_831;
float3 l9_833=l9_832;
float4 l9_834=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_833.xy,bias(l9_827));
float4 l9_835=l9_834;
float4 l9_836=l9_835;
l9_799=l9_836;
}
float4 l9_837=l9_799;
float3 l9_838=l9_837.xyz;
float3 l9_839;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_839=float3(pow(l9_838.x,2.2),pow(l9_838.y,2.2),pow(l9_838.z,2.2));
}
else
{
l9_839=l9_838*l9_838;
}
float3 l9_840=l9_839;
float3 l9_841=l9_840;
l9_798.transmitted=l9_841*mix(float3(1.0),l9_347.albedo,float3(l9_347.opacity));
l9_347.opacity=1.0;
}
bool l9_842=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_842=true;
}
SurfaceProperties l9_843=l9_347;
LightingComponents l9_844=l9_798;
bool l9_845=l9_842;
float3 l9_846=l9_843.albedo*(l9_844.directDiffuse+(l9_844.indirectDiffuse*l9_843.ao));
float3 l9_847=l9_844.directSpecular+(l9_844.indirectSpecular*l9_843.specularAo);
float3 l9_848=l9_843.emissive;
float3 l9_849=l9_844.transmitted;
if (l9_845)
{
float l9_850=l9_843.opacity;
l9_846*=srgbToLinear(l9_850);
}
float3 l9_851=((l9_846+l9_847)+l9_848)+l9_849;
float3 l9_852=l9_851;
float4 l9_853=float4(l9_852,l9_347.opacity);
if ((int(sc_IsEditor_tmp)!=0))
{
l9_853.x+=((l9_347.ao.x*l9_347.specularAo.x)*9.9999997e-06);
}
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_854=l9_853.xyz;
float l9_855=1.8;
float l9_856=1.4;
float l9_857=0.5;
float l9_858=1.5;
float3 l9_859=(l9_854*((l9_854*l9_855)+float3(l9_856)))/((l9_854*((l9_854*l9_855)+float3(l9_857)))+float3(l9_858));
l9_853=float4(l9_859.x,l9_859.y,l9_859.z,l9_853.w);
}
float3 l9_860=l9_853.xyz;
float l9_861=l9_860.x;
float l9_862=l9_860.y;
float l9_863=l9_860.z;
float3 l9_864=float3(linearToSrgb(l9_861),linearToSrgb(l9_862),linearToSrgb(l9_863));
l9_853=float4(l9_864.x,l9_864.y,l9_864.z,l9_853.w);
float4 l9_865=l9_853;
param_55=l9_865;
}
param_55=fast::max(param_55,float4(0.0));
Output_N6=param_55;
float4 Output_N110=float4(0.0);
float4 param_57=float4(1.0);
float param_58=(*sc_set0.UserUniforms).Port_Input2_N110;
ssGlobals param_60=Globals;
float4 param_59;
if ((int(Tweak_N51_tmp)!=0))
{
float4 l9_866=float4(0.0);
int l9_867;
if ((int(opacityTextureHasSwappedViews_tmp)!=0))
{
int l9_868=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_868=0;
}
else
{
l9_868=in.varStereoViewID;
}
int l9_869=l9_868;
l9_867=1-l9_869;
}
else
{
int l9_870=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_870=0;
}
else
{
l9_870=in.varStereoViewID;
}
int l9_871=l9_870;
l9_867=l9_871;
}
int l9_872=l9_867;
int l9_873=opacityTextureLayout_tmp;
int l9_874=l9_872;
float2 l9_875=param_60.Surface_UVCoord0;
bool l9_876=(int(SC_USE_UV_TRANSFORM_opacityTexture_tmp)!=0);
float3x3 l9_877=(*sc_set0.UserUniforms).opacityTextureTransform;
int2 l9_878=int2(SC_SOFTWARE_WRAP_MODE_U_opacityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_opacityTexture_tmp);
bool l9_879=(int(SC_USE_UV_MIN_MAX_opacityTexture_tmp)!=0);
float4 l9_880=(*sc_set0.UserUniforms).opacityTextureUvMinMax;
bool l9_881=(int(SC_USE_CLAMP_TO_BORDER_opacityTexture_tmp)!=0);
float4 l9_882=(*sc_set0.UserUniforms).opacityTextureBorderColor;
float l9_883=0.0;
bool l9_884=l9_881&&(!l9_879);
float l9_885=1.0;
float l9_886=l9_875.x;
int l9_887=l9_878.x;
if (l9_887==1)
{
l9_886=fract(l9_886);
}
else
{
if (l9_887==2)
{
float l9_888=fract(l9_886);
float l9_889=l9_886-l9_888;
float l9_890=step(0.25,fract(l9_889*0.5));
l9_886=mix(l9_888,1.0-l9_888,fast::clamp(l9_890,0.0,1.0));
}
}
l9_875.x=l9_886;
float l9_891=l9_875.y;
int l9_892=l9_878.y;
if (l9_892==1)
{
l9_891=fract(l9_891);
}
else
{
if (l9_892==2)
{
float l9_893=fract(l9_891);
float l9_894=l9_891-l9_893;
float l9_895=step(0.25,fract(l9_894*0.5));
l9_891=mix(l9_893,1.0-l9_893,fast::clamp(l9_895,0.0,1.0));
}
}
l9_875.y=l9_891;
if (l9_879)
{
bool l9_896=l9_881;
bool l9_897;
if (l9_896)
{
l9_897=l9_878.x==3;
}
else
{
l9_897=l9_896;
}
float l9_898=l9_875.x;
float l9_899=l9_880.x;
float l9_900=l9_880.z;
bool l9_901=l9_897;
float l9_902=l9_885;
float l9_903=fast::clamp(l9_898,l9_899,l9_900);
float l9_904=step(abs(l9_898-l9_903),9.9999997e-06);
l9_902*=(l9_904+((1.0-float(l9_901))*(1.0-l9_904)));
l9_898=l9_903;
l9_875.x=l9_898;
l9_885=l9_902;
bool l9_905=l9_881;
bool l9_906;
if (l9_905)
{
l9_906=l9_878.y==3;
}
else
{
l9_906=l9_905;
}
float l9_907=l9_875.y;
float l9_908=l9_880.y;
float l9_909=l9_880.w;
bool l9_910=l9_906;
float l9_911=l9_885;
float l9_912=fast::clamp(l9_907,l9_908,l9_909);
float l9_913=step(abs(l9_907-l9_912),9.9999997e-06);
l9_911*=(l9_913+((1.0-float(l9_910))*(1.0-l9_913)));
l9_907=l9_912;
l9_875.y=l9_907;
l9_885=l9_911;
}
float2 l9_914=l9_875;
bool l9_915=l9_876;
float3x3 l9_916=l9_877;
if (l9_915)
{
l9_914=float2((l9_916*float3(l9_914,1.0)).xy);
}
float2 l9_917=l9_914;
l9_875=l9_917;
float l9_918=l9_875.x;
int l9_919=l9_878.x;
bool l9_920=l9_884;
float l9_921=l9_885;
if ((l9_919==0)||(l9_919==3))
{
float l9_922=l9_918;
float l9_923=0.0;
float l9_924=1.0;
bool l9_925=l9_920;
float l9_926=l9_921;
float l9_927=fast::clamp(l9_922,l9_923,l9_924);
float l9_928=step(abs(l9_922-l9_927),9.9999997e-06);
l9_926*=(l9_928+((1.0-float(l9_925))*(1.0-l9_928)));
l9_922=l9_927;
l9_918=l9_922;
l9_921=l9_926;
}
l9_875.x=l9_918;
l9_885=l9_921;
float l9_929=l9_875.y;
int l9_930=l9_878.y;
bool l9_931=l9_884;
float l9_932=l9_885;
if ((l9_930==0)||(l9_930==3))
{
float l9_933=l9_929;
float l9_934=0.0;
float l9_935=1.0;
bool l9_936=l9_931;
float l9_937=l9_932;
float l9_938=fast::clamp(l9_933,l9_934,l9_935);
float l9_939=step(abs(l9_933-l9_938),9.9999997e-06);
l9_937*=(l9_939+((1.0-float(l9_936))*(1.0-l9_939)));
l9_933=l9_938;
l9_929=l9_933;
l9_932=l9_937;
}
l9_875.y=l9_929;
l9_885=l9_932;
float2 l9_940=l9_875;
int l9_941=l9_873;
int l9_942=l9_874;
float l9_943=l9_883;
float2 l9_944=l9_940;
int l9_945=l9_941;
int l9_946=l9_942;
float3 l9_947=float3(0.0);
if (l9_945==0)
{
l9_947=float3(l9_944,0.0);
}
else
{
if (l9_945==1)
{
l9_947=float3(l9_944.x,(l9_944.y*0.5)+(0.5-(float(l9_946)*0.5)),0.0);
}
else
{
l9_947=float3(l9_944,float(l9_946));
}
}
float3 l9_948=l9_947;
float3 l9_949=l9_948;
float4 l9_950=sc_set0.opacityTexture.sample(sc_set0.opacityTextureSmpSC,l9_949.xy,bias(l9_943));
float4 l9_951=l9_950;
if (l9_881)
{
l9_951=mix(l9_882,l9_951,float4(l9_885));
}
float4 l9_952=l9_951;
l9_866=l9_952;
param_57=l9_866;
param_59=param_57;
}
else
{
param_59=float4(param_58);
}
Output_N110=param_59;
float Output_N111=0.0;
Output_N111=Output_N110.x;
float Output_N113=0.0;
Output_N113=fast::clamp(Output_N111+0.001,(*sc_set0.UserUniforms).Port_Input1_N113+0.001,(*sc_set0.UserUniforms).Port_Input2_N113+0.001)-0.001;
float4 Value_N112=float4(0.0);
Value_N112=float4(Output_N6.xyz.x,Output_N6.xyz.y,Output_N6.xyz.z,Value_N112.w);
Value_N112.w=Output_N113;
FinalColor=Value_N112;
float4 param_61=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_953=param_61;
float4 l9_954=l9_953;
float l9_955=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_955=l9_954.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_955=fast::clamp(l9_954.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_955=fast::clamp(dot(l9_954.xyz,float3(l9_954.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_955=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_955=(1.0-dot(l9_954.xyz,float3(0.33333001)))*l9_954.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_955=(1.0-fast::clamp(dot(l9_954.xyz,float3(1.0)),0.0,1.0))*l9_954.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_955=fast::clamp(dot(l9_954.xyz,float3(1.0)),0.0,1.0)*l9_954.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_955=fast::clamp(dot(l9_954.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_955=fast::clamp(dot(l9_954.xyz,float3(1.0)),0.0,1.0)*l9_954.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_955=dot(l9_954.xyz,float3(0.33333001))*l9_954.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_955=1.0-fast::clamp(dot(l9_954.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_955=fast::clamp(dot(l9_954.xyz,float3(1.0)),0.0,1.0);
}
}
}
}
}
}
}
}
}
}
}
}
float l9_956=l9_955;
float l9_957=l9_956;
float l9_958=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_957;
float3 l9_959=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_953.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_960=float4(l9_959.x,l9_959.y,l9_959.z,l9_958);
param_61=l9_960;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_61=float4(param_61.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_961=param_61;
float4 l9_962=float4(0.0);
float4 l9_963=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_964=out.sc_FragData0;
l9_963=l9_964;
}
else
{
float4 l9_965=gl_FragCoord;
float2 l9_966=l9_965.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_967=l9_966;
float2 l9_968=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_969=1;
int l9_970=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_970=0;
}
else
{
l9_970=in.varStereoViewID;
}
int l9_971=l9_970;
int l9_972=l9_971;
float3 l9_973=float3(l9_967,0.0);
int l9_974=l9_969;
int l9_975=l9_972;
if (l9_974==1)
{
l9_973.y=((2.0*l9_973.y)+float(l9_975))-1.0;
}
float2 l9_976=l9_973.xy;
l9_968=l9_976;
}
else
{
l9_968=l9_967;
}
float2 l9_977=l9_968;
float2 l9_978=l9_977;
float2 l9_979=l9_978;
float2 l9_980=l9_979;
float l9_981=0.0;
int l9_982;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_983=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_983=0;
}
else
{
l9_983=in.varStereoViewID;
}
int l9_984=l9_983;
l9_982=1-l9_984;
}
else
{
int l9_985=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_985=0;
}
else
{
l9_985=in.varStereoViewID;
}
int l9_986=l9_985;
l9_982=l9_986;
}
int l9_987=l9_982;
float2 l9_988=l9_980;
int l9_989=sc_ScreenTextureLayout_tmp;
int l9_990=l9_987;
float l9_991=l9_981;
float2 l9_992=l9_988;
int l9_993=l9_989;
int l9_994=l9_990;
float3 l9_995=float3(0.0);
if (l9_993==0)
{
l9_995=float3(l9_992,0.0);
}
else
{
if (l9_993==1)
{
l9_995=float3(l9_992.x,(l9_992.y*0.5)+(0.5-(float(l9_994)*0.5)),0.0);
}
else
{
l9_995=float3(l9_992,float(l9_994));
}
}
float3 l9_996=l9_995;
float3 l9_997=l9_996;
float4 l9_998=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_997.xy,bias(l9_991));
float4 l9_999=l9_998;
float4 l9_1000=l9_999;
l9_963=l9_1000;
}
float4 l9_1001=l9_963;
float3 l9_1002=l9_1001.xyz;
float3 l9_1003=l9_1002;
float3 l9_1004=l9_961.xyz;
float3 l9_1005=definedBlend(l9_1003,l9_1004,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_962=float4(l9_1005.x,l9_1005.y,l9_1005.z,l9_962.w);
float3 l9_1006=mix(l9_1002,l9_962.xyz,float3(l9_961.w));
l9_962=float4(l9_1006.x,l9_1006.y,l9_1006.z,l9_962.w);
l9_962.w=1.0;
float4 l9_1007=l9_962;
param_61=l9_1007;
}
else
{
if ((int(sc_Voxelization_tmp)!=0))
{
float4 l9_1008=float4(in.varScreenPos.xyz,1.0);
param_61=l9_1008;
}
else
{
if ((int(sc_OutputBounds_tmp)!=0))
{
float4 l9_1009=gl_FragCoord;
float l9_1010=fast::clamp(abs(l9_1009.z),0.0,1.0);
float4 l9_1011=float4(l9_1010,1.0-l9_1010,1.0,1.0);
param_61=l9_1011;
}
else
{
float4 l9_1012=param_61;
float4 l9_1013=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_1013=float4(mix(float3(1.0),l9_1012.xyz,float3(l9_1012.w)),l9_1012.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_1014=l9_1012.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_1014=fast::clamp(l9_1014,0.0,1.0);
}
l9_1013=float4(l9_1012.xyz*l9_1014,l9_1014);
}
else
{
l9_1013=l9_1012;
}
}
float4 l9_1015=l9_1013;
param_61=l9_1015;
}
}
}
}
}
float4 l9_1016=param_61;
FinalColor=l9_1016;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
if (PreviewInfo.Saved)
{
FinalColor=float4(PreviewInfo.Color);
}
else
{
FinalColor=float4(0.0);
}
}
float4 l9_1017=float4(0.0);
l9_1017=float4(0.0);
float4 l9_1018=l9_1017;
float4 Cost=l9_1018;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float4 param_62=FinalColor;
FinalColor=sc_OutputMotionVectorIfNeeded(param_62,in.varPosAndMotion,in.varNormalAndMotion);
float4 param_63=FinalColor;
float4 l9_1019=param_63;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_1019.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.sc_FragData0=l9_1019;
return out;
}
} // FRAGMENT SHADER

namespace SNAP_RECV {
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
float3 SurfacePosition_WorldSpace;
float2 gScreenCoord;
float2 Surface_UVCoord0;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float shaderComplexityValue;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int sc_RayTracingReceiverEffectsMask;
float4 sc_RayTracingReflectionsSize;
float4 sc_RayTracingReflectionsDims;
float4 sc_RayTracingReflectionsView;
float4 sc_RayTracingGlobalIlluminationSize;
float4 sc_RayTracingGlobalIlluminationDims;
float4 sc_RayTracingGlobalIlluminationView;
float4 sc_RayTracingShadowsSize;
float4 sc_RayTracingShadowsDims;
float4 sc_RayTracingShadowsView;
float3 sc_RayTracingOriginScale;
uint sc_RayTracingReceiverMask;
float3 sc_RayTracingOriginScaleInv;
float3 sc_RayTracingOriginOffset;
uint sc_RayTracingReceiverId;
float4 voxelization_params_0;
float4 voxelization_params_frustum_lrbt;
float4 voxelization_params_frustum_nf;
float3 voxelization_params_camera_pos;
float4x4 sc_ModelMatrixVoxelization;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float strength;
float noiseScale;
float animatedspeed;
float offset;
float4 baseColor;
float4 backgroundSize;
float4 backgroundDims;
float4 backgroundView;
float3x3 backgroundTransform;
float4 backgroundUvMinMax;
float4 backgroundBorderColor;
float chromaticAberration;
float intensity;
float thickness;
float4 colorTint;
float exponent;
float darken;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float uvScale;
float roughness;
float4 opacityTextureSize;
float4 opacityTextureDims;
float4 opacityTextureView;
float3x3 opacityTextureTransform;
float4 opacityTextureUvMinMax;
float4 opacityTextureBorderColor;
float Port_Import_N034;
float Port_Import_N037;
float3 Port_Import_N035;
float Port_Import_N049;
float Port_Import_N005;
float Port_Import_N041;
float3 Port_Import_N027;
float2 Port_Scale_N023;
float2 Port_Scale_N025;
float2 Port_Scale_N045;
float Port_Input1_N047;
float Port_Import_N068;
float Port_Input0_N070;
float Port_Input2_N071;
float Port_Import_N080;
float Port_Input2_N062;
float Port_Import_N064;
float2 Port_Import_N083;
float Port_Import_N056;
float Port_Import_N086;
float3 Port_Import_N054;
float3 Port_Import_N095;
float Port_Input2_N097;
float Port_Input0_N105;
float Port_Input0_N099;
float Port_Import_N098;
float Port_Import_N075;
float Port_Import_N101;
float Port_Import_N076;
float Port_Import_N104;
float Port_Opacity_N006;
float2 Port_Center_N121;
float3 Port_Emissive_N006;
float Port_Metallic_N006;
float3 Port_AO_N006;
float3 Port_SpecularAO_N006;
float Port_Input2_N110;
float Port_Input1_N113;
float Port_Input2_N113;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_Set0
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> background [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> normalTex [[id(3)]];
texture2d<float> opacityTexture [[id(4)]];
texture2d<float> sc_EnvmapDiffuse [[id(5)]];
texture2d<float> sc_EnvmapSpecular [[id(6)]];
texture2d<float> sc_RayTracingGlobalIllumination [[id(15)]];
texture2d<float> sc_RayTracingReflections [[id(16)]];
texture2d<float> sc_RayTracingShadows [[id(17)]];
texture2d<float> sc_SSAOTexture [[id(18)]];
texture2d<float> sc_ScreenTexture [[id(19)]];
texture2d<float> sc_ShadowTexture [[id(20)]];
sampler backgroundSmpSC [[id(22)]];
sampler intensityTextureSmpSC [[id(23)]];
sampler normalTexSmpSC [[id(24)]];
sampler opacityTextureSmpSC [[id(25)]];
sampler sc_EnvmapDiffuseSmpSC [[id(26)]];
sampler sc_EnvmapSpecularSmpSC [[id(27)]];
sampler sc_RayTracingGlobalIlluminationSmpSC [[id(29)]];
sampler sc_RayTracingReflectionsSmpSC [[id(30)]];
sampler sc_RayTracingShadowsSmpSC [[id(31)]];
sampler sc_SSAOTextureSmpSC [[id(32)]];
sampler sc_ScreenTextureSmpSC [[id(33)]];
sampler sc_ShadowTextureSmpSC [[id(34)]];
constant userUniformsObj* UserUniforms [[id(36)]];
};
struct main_recv_out
{
uint4 sc_RayTracingPositionAndMask [[color(0)]];
uint4 sc_RayTracingNormalAndMore [[color(1)]];
};
struct main_recv_in
{
float4 varPosAndMotion [[user(locn0)]];
float4 varNormalAndMotion [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varTex01 [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
fragment main_recv_out main_recv(main_recv_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_recv_out out={};
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPosAndMotion.xyz);
Globals.PositionWS=in.varPosAndMotion.xyz;
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormalAndMotion.xyz);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.SurfacePosition_WorldSpace=in.varPosAndMotion.xyz;
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
float4 l9_0=gl_FragCoord;
float2 l9_1=l9_0.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_2=l9_1;
float2 l9_3=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_4=1;
int l9_5=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5=0;
}
else
{
l9_5=in.varStereoViewID;
}
int l9_6=l9_5;
int l9_7=l9_6;
float3 l9_8=float3(l9_2,0.0);
int l9_9=l9_4;
int l9_10=l9_7;
if (l9_9==1)
{
l9_8.y=((2.0*l9_8.y)+float(l9_10))-1.0;
}
float2 l9_11=l9_8.xy;
l9_3=l9_11;
}
else
{
l9_3=l9_2;
}
float2 l9_12=l9_3;
float2 l9_13=l9_12;
Globals.gScreenCoord=l9_13;
Globals.Surface_UVCoord0=in.varTex01.xy;
float2 UVCoord_N119=float2(0.0);
UVCoord_N119=Globals.Surface_UVCoord0;
float Output_N120=0.0;
float param=(*sc_set0.UserUniforms).uvScale;
Output_N120=param;
float2 CoordsOut_N121=float2(0.0);
CoordsOut_N121=((UVCoord_N119-(*sc_set0.UserUniforms).Port_Center_N121)*float2(Output_N120))+(*sc_set0.UserUniforms).Port_Center_N121;
float4 Output_N126=float4(0.0);
float2 param_1=CoordsOut_N121;
int l9_14;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_15=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_15=0;
}
else
{
l9_15=in.varStereoViewID;
}
int l9_16=l9_15;
l9_14=1-l9_16;
}
else
{
int l9_17=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_17=0;
}
else
{
l9_17=in.varStereoViewID;
}
int l9_18=l9_17;
l9_14=l9_18;
}
int l9_19=l9_14;
int l9_20=normalTexLayout_tmp;
int l9_21=l9_19;
float2 l9_22=param_1;
bool l9_23=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_24=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_25=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_26=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_27=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_28=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_29=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_30=0.0;
bool l9_31=l9_28&&(!l9_26);
float l9_32=1.0;
float l9_33=l9_22.x;
int l9_34=l9_25.x;
if (l9_34==1)
{
l9_33=fract(l9_33);
}
else
{
if (l9_34==2)
{
float l9_35=fract(l9_33);
float l9_36=l9_33-l9_35;
float l9_37=step(0.25,fract(l9_36*0.5));
l9_33=mix(l9_35,1.0-l9_35,fast::clamp(l9_37,0.0,1.0));
}
}
l9_22.x=l9_33;
float l9_38=l9_22.y;
int l9_39=l9_25.y;
if (l9_39==1)
{
l9_38=fract(l9_38);
}
else
{
if (l9_39==2)
{
float l9_40=fract(l9_38);
float l9_41=l9_38-l9_40;
float l9_42=step(0.25,fract(l9_41*0.5));
l9_38=mix(l9_40,1.0-l9_40,fast::clamp(l9_42,0.0,1.0));
}
}
l9_22.y=l9_38;
if (l9_26)
{
bool l9_43=l9_28;
bool l9_44;
if (l9_43)
{
l9_44=l9_25.x==3;
}
else
{
l9_44=l9_43;
}
float l9_45=l9_22.x;
float l9_46=l9_27.x;
float l9_47=l9_27.z;
bool l9_48=l9_44;
float l9_49=l9_32;
float l9_50=fast::clamp(l9_45,l9_46,l9_47);
float l9_51=step(abs(l9_45-l9_50),9.9999997e-06);
l9_49*=(l9_51+((1.0-float(l9_48))*(1.0-l9_51)));
l9_45=l9_50;
l9_22.x=l9_45;
l9_32=l9_49;
bool l9_52=l9_28;
bool l9_53;
if (l9_52)
{
l9_53=l9_25.y==3;
}
else
{
l9_53=l9_52;
}
float l9_54=l9_22.y;
float l9_55=l9_27.y;
float l9_56=l9_27.w;
bool l9_57=l9_53;
float l9_58=l9_32;
float l9_59=fast::clamp(l9_54,l9_55,l9_56);
float l9_60=step(abs(l9_54-l9_59),9.9999997e-06);
l9_58*=(l9_60+((1.0-float(l9_57))*(1.0-l9_60)));
l9_54=l9_59;
l9_22.y=l9_54;
l9_32=l9_58;
}
float2 l9_61=l9_22;
bool l9_62=l9_23;
float3x3 l9_63=l9_24;
if (l9_62)
{
l9_61=float2((l9_63*float3(l9_61,1.0)).xy);
}
float2 l9_64=l9_61;
l9_22=l9_64;
float l9_65=l9_22.x;
int l9_66=l9_25.x;
bool l9_67=l9_31;
float l9_68=l9_32;
if ((l9_66==0)||(l9_66==3))
{
float l9_69=l9_65;
float l9_70=0.0;
float l9_71=1.0;
bool l9_72=l9_67;
float l9_73=l9_68;
float l9_74=fast::clamp(l9_69,l9_70,l9_71);
float l9_75=step(abs(l9_69-l9_74),9.9999997e-06);
l9_73*=(l9_75+((1.0-float(l9_72))*(1.0-l9_75)));
l9_69=l9_74;
l9_65=l9_69;
l9_68=l9_73;
}
l9_22.x=l9_65;
l9_32=l9_68;
float l9_76=l9_22.y;
int l9_77=l9_25.y;
bool l9_78=l9_31;
float l9_79=l9_32;
if ((l9_77==0)||(l9_77==3))
{
float l9_80=l9_76;
float l9_81=0.0;
float l9_82=1.0;
bool l9_83=l9_78;
float l9_84=l9_79;
float l9_85=fast::clamp(l9_80,l9_81,l9_82);
float l9_86=step(abs(l9_80-l9_85),9.9999997e-06);
l9_84*=(l9_86+((1.0-float(l9_83))*(1.0-l9_86)));
l9_80=l9_85;
l9_76=l9_80;
l9_79=l9_84;
}
l9_22.y=l9_76;
l9_32=l9_79;
float2 l9_87=l9_22;
int l9_88=l9_20;
int l9_89=l9_21;
float l9_90=l9_30;
float2 l9_91=l9_87;
int l9_92=l9_88;
int l9_93=l9_89;
float3 l9_94=float3(0.0);
if (l9_92==0)
{
l9_94=float3(l9_91,0.0);
}
else
{
if (l9_92==1)
{
l9_94=float3(l9_91.x,(l9_91.y*0.5)+(0.5-(float(l9_93)*0.5)),0.0);
}
else
{
l9_94=float3(l9_91,float(l9_93));
}
}
float3 l9_95=l9_94;
float3 l9_96=l9_95;
float4 l9_97=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_96.xy,bias(l9_90));
float4 l9_98=l9_97;
if (l9_28)
{
l9_98=mix(l9_29,l9_98,float4(l9_32));
}
float4 l9_99=l9_98;
float4 param_2=l9_99;
float3 l9_100=(param_2.xyz*1.9921875)-float3(1.0);
param_2=float4(l9_100.x,l9_100.y,l9_100.z,param_2.w);
Output_N126=param_2;
float Output_N9=0.0;
float param_3=(*sc_set0.UserUniforms).roughness;
Output_N9=param_3;
float param_4=(*sc_set0.UserUniforms).Port_Opacity_N006;
float3 param_5=Output_N126.xyz;
float param_6=Output_N9;
ssGlobals param_7=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_7.BumpedNormal=float3x3(float3(param_7.VertexTangent_WorldSpace),float3(param_7.VertexBinormal_WorldSpace),float3(param_7.VertexNormal_WorldSpace))*param_5;
}
float l9_101=param_4;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_101<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_102=gl_FragCoord;
float2 l9_103=floor(mod(l9_102.xy,float2(4.0)));
float l9_104=(mod(dot(l9_103,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_101<l9_104)
{
discard_fragment();
}
}
float3 l9_105=param_7.PositionWS;
float3 l9_106=param_7.BumpedNormal;
float l9_107=param_6;
float3 l9_108=l9_105;
float3 l9_109=l9_106;
float l9_110=l9_107;
uint l9_111=0u;
uint3 l9_112=uint3(round((l9_108-(*sc_set0.UserUniforms).sc_RayTracingOriginOffset)*(*sc_set0.UserUniforms).sc_RayTracingOriginScale));
out.sc_RayTracingPositionAndMask=uint4(l9_112.x,l9_112.y,l9_112.z,out.sc_RayTracingPositionAndMask.w);
out.sc_RayTracingPositionAndMask.w=(*sc_set0.UserUniforms).sc_RayTracingReceiverMask;
float3 l9_113=l9_109;
float l9_114=dot(abs(l9_113),float3(1.0));
l9_113/=float3(l9_114);
float2 l9_115=float2(fast::clamp(-l9_113.z,0.0,1.0));
float2 l9_116=l9_113.xy+mix(-l9_115,l9_115,step(float2(0.0),l9_113.xy));
uint l9_117=as_type<uint>(half2(l9_116));
uint2 l9_118=uint2(l9_117&65535u,l9_117>>16u);
out.sc_RayTracingNormalAndMore=uint4(l9_118.x,l9_118.y,out.sc_RayTracingNormalAndMore.z,out.sc_RayTracingNormalAndMore.w);
out.sc_RayTracingNormalAndMore.z=l9_111;
uint l9_119=uint(fast::clamp(l9_110,0.0,1.0)*1000.0);
l9_119 |= (((*sc_set0.UserUniforms).sc_RayTracingReceiverId%32u)<<10u);
out.sc_RayTracingNormalAndMore.w=l9_119;
return out;
}
} // RECEIVER MODE SHADER
