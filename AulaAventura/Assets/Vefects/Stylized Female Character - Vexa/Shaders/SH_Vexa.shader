// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SH_Vexa"
{
	Properties
	{
		[Space(13)][Header(Base Color)][Space(13)]_BaseColorTexture("Base Color Texture", 2D) = "white" {}
		[Normal][Space(13)][Header(Normal)][Space(13)]_NormalTexture("Normal Texture", 2D) = "bump" {}
		_NormalIntensity("Normal Intensity", Float) = 1
		[Space(13)][Header(Ambient Occlusion)][Space(13)]_AmbientOcclusionTexture("Ambient Occlusion Texture", 2D) = "white" {}
		_AOIntensity("AO Intensity", Float) = 1
		[Space(13)][Header(Metallic)][Space(13)]_MetallicTexture("Metallic Texture", 2D) = "white" {}
		_MetallicMin("Metallic Min", Float) = 0
		_MetallicMax("Metallic Max", Float) = 1
		[Space(13)][Header(Roughness)][Space(13)]_RoughnessTexture("Roughness Texture", 2D) = "white" {}
		_RoughnessMin("Roughness Min", Float) = 0
		_RoughnessMax("Roughness Max", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _NormalTexture;
		uniform float4 _NormalTexture_ST;
		uniform float _NormalIntensity;
		uniform sampler2D _BaseColorTexture;
		uniform float4 _BaseColorTexture_ST;
		uniform float _MetallicMin;
		uniform float _MetallicMax;
		uniform sampler2D _MetallicTexture;
		uniform float4 _MetallicTexture_ST;
		uniform float _RoughnessMin;
		uniform float _RoughnessMax;
		uniform sampler2D _RoughnessTexture;
		uniform float4 _RoughnessTexture_ST;
		uniform sampler2D _AmbientOcclusionTexture;
		uniform float4 _AmbientOcclusionTexture_ST;
		uniform float _AOIntensity;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_NormalTexture = i.uv_texcoord * _NormalTexture_ST.xy + _NormalTexture_ST.zw;
			float3 lerpResult4 = lerp( float3(0,0,1) , UnpackNormal( tex2D( _NormalTexture, uv_NormalTexture ) ) , _NormalIntensity);
			o.Normal = lerpResult4;
			float2 uv_BaseColorTexture = i.uv_texcoord * _BaseColorTexture_ST.xy + _BaseColorTexture_ST.zw;
			o.Albedo = tex2D( _BaseColorTexture, uv_BaseColorTexture ).rgb;
			float2 uv_MetallicTexture = i.uv_texcoord * _MetallicTexture_ST.xy + _MetallicTexture_ST.zw;
			float lerpResult9 = lerp( _MetallicMin , _MetallicMax , tex2D( _MetallicTexture, uv_MetallicTexture ).r);
			o.Metallic = saturate( lerpResult9 );
			float2 uv_RoughnessTexture = i.uv_texcoord * _RoughnessTexture_ST.xy + _RoughnessTexture_ST.zw;
			float lerpResult21 = lerp( _RoughnessMin , _RoughnessMax , tex2D( _RoughnessTexture, uv_RoughnessTexture ).r);
			o.Smoothness = saturate( lerpResult21 );
			float2 uv_AmbientOcclusionTexture = i.uv_texcoord * _AmbientOcclusionTexture_ST.xy + _AmbientOcclusionTexture_ST.zw;
			float4 lerpResult15 = lerp( float4( float3(1,1,1) , 0.0 ) , tex2D( _AmbientOcclusionTexture, uv_AmbientOcclusionTexture ) , _AOIntensity);
			o.Occlusion = lerpResult15.r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18921
0;0;2560;1379;3291.948;350.4383;2.046898;True;False
Node;AmplifyShaderEditor.SamplerNode;3;-1408,896;Inherit;True;Property;_MetallicTexture;Metallic Texture;5;0;Create;True;0;0;0;False;3;Space(13);Header(Metallic);Space(13);False;-1;d7c2de74dee042841866aa0a7d9c205a;9176c77834137a14d9fef6c3d3a443f0;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;11;-768,1024;Inherit;False;Property;_MetallicMin;Metallic Min;6;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-768,1152;Inherit;False;Property;_MetallicMax;Metallic Max;7;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;19;-768,1664;Inherit;False;Property;_RoughnessMax;Roughness Max;10;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;18;-1408,1408;Inherit;True;Property;_RoughnessTexture;Roughness Texture;8;0;Create;True;0;0;0;False;3;Space(13);Header(Roughness);Space(13);False;-1;fc1fe8fd5d255594b84af490e0431dee;b9cc3e0485f21cd47b8ea0ac51e6e8d1;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;20;-768,1536;Inherit;False;Property;_RoughnessMin;Roughness Min;9;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2;-1408,384;Inherit;True;Property;_NormalTexture;Normal Texture;1;1;[Normal];Create;True;0;0;0;False;3;Space(13);Header(Normal);Space(13);False;-1;80e14c69a9da7eb429fe41c4b39d0e46;585453df463386047af58ff010dcbbb8;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;16;-512,2048;Inherit;False;Property;_AOIntensity;AO Intensity;4;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;17;-768,1920;Inherit;False;Constant;_Vector1;Vector 1;8;0;Create;True;0;0;0;False;0;False;1,1,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;21;-768,1408;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;13;-1408,2048;Inherit;True;Property;_AmbientOcclusionTexture;Ambient Occlusion Texture;3;0;Create;True;0;0;0;False;3;Space(13);Header(Ambient Occlusion);Space(13);False;-1;b07f0514b8e3b2d4bb1a112464b110c8;4c941ff310c00804c832adfbae8fbab9;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;5;-768,512;Inherit;False;Property;_NormalIntensity;Normal Intensity;2;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;9;-768,896;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;8;-768,640;Inherit;False;Constant;_Vector0;Vector 0;4;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SaturateNode;22;-512,1408;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;15;-512,1920;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;10;-512,896;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;4;-768,384;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;1;-1408,0;Inherit;True;Property;_BaseColorTexture;Base Color Texture;0;0;Create;True;0;0;0;False;3;Space(13);Header(Base Color);Space(13);False;-1;a593b508e34c28b4992a57f111a55111;07866b66576ee2d4e812b6b182c52ef9;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;SH_Vexa;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;18;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;21;0;20;0
WireConnection;21;1;19;0
WireConnection;21;2;18;0
WireConnection;9;0;11;0
WireConnection;9;1;12;0
WireConnection;9;2;3;0
WireConnection;22;0;21;0
WireConnection;15;0;17;0
WireConnection;15;1;13;0
WireConnection;15;2;16;0
WireConnection;10;0;9;0
WireConnection;4;0;8;0
WireConnection;4;1;2;0
WireConnection;4;2;5;0
WireConnection;0;0;1;0
WireConnection;0;1;4;0
WireConnection;0;3;10;0
WireConnection;0;4;22;0
WireConnection;0;5;15;0
ASEEND*/
//CHKSM=B3274BCC6DF5ADB02512B3DFA7940EAFBD7BB456