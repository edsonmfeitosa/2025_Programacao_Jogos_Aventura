// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SH_Vexa_Selector_Body"
{
	Properties
	{
		[Space(13)][Header(Multiply Color)][Space(13)]_MultTexture("Mult Texture", 2D) = "white" {}
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
		[Space(13)][Header(Selector)][Space(13)]_ID01("ID 01", 2D) = "white" {}
		_ID02("ID 02", 2D) = "white" {}
		_ID03("ID 03", 2D) = "white" {}
		_EyesColor("Eyes Color", Color) = (1,1,1,0)
		_EyesWhiteColor("Eyes White Color", Color) = (1,1,1,0)
		_HairColor("Hair Color", Color) = (0.08490568,0.08490568,0.08490568,0)
		_SkinColor("Skin Color", Color) = (1,1,1,0)
		_ClothColor("Cloth Color", Color) = (0.2735849,0.2735849,0.2735849,0)
		_ClothAccentColor("Cloth Accent Color", Color) = (1,0,0.5400758,0)
		_ClothAccentSecondaryColor("Cloth Accent Secondary Color", Color) = (1,0,0.5400758,0)
		_MetalColor("Metal Color", Color) = (0.6466714,0.7924528,0.7895944,0)
		_EmissiveColor("Emissive Color", Color) = (0,1,0.980212,0)
		_EmissiveIntensity("Emissive Intensity", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
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
		uniform sampler2D _MultTexture;
		uniform float4 _MultTexture_ST;
		uniform float4 _HairColor;
		uniform float4 _SkinColor;
		uniform sampler2D _ID01;
		uniform float4 _ID01_ST;
		uniform float4 _ClothAccentColor;
		uniform float4 _ClothColor;
		uniform sampler2D _ID02;
		uniform float4 _ID02_ST;
		uniform float4 _MetalColor;
		uniform float4 _EmissiveColor;
		uniform float4 _ClothAccentSecondaryColor;
		uniform sampler2D _ID03;
		uniform float4 _ID03_ST;
		uniform float4 _EyesWhiteColor;
		uniform float4 _EyesColor;
		uniform float _EmissiveIntensity;
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
			float2 uv_MultTexture = i.uv_texcoord * _MultTexture_ST.xy + _MultTexture_ST.zw;
			float2 uv_ID01 = i.uv_texcoord * _ID01_ST.xy + _ID01_ST.zw;
			float4 tex2DNode24 = tex2D( _ID01, uv_ID01 );
			float4 lerpResult27 = lerp( _HairColor , _SkinColor , tex2DNode24.r);
			float4 lerpResult28 = lerp( lerpResult27 , _ClothAccentColor , tex2DNode24.g);
			float2 uv_ID02 = i.uv_texcoord * _ID02_ST.xy + _ID02_ST.zw;
			float4 tex2DNode25 = tex2D( _ID02, uv_ID02 );
			float4 lerpResult30 = lerp( lerpResult28 , _ClothColor , tex2DNode25.g);
			float4 lerpResult31 = lerp( lerpResult30 , _MetalColor , tex2DNode25.b);
			float4 lerpResult32 = lerp( lerpResult31 , _EmissiveColor , tex2DNode25.r);
			float2 uv_ID03 = i.uv_texcoord * _ID03_ST.xy + _ID03_ST.zw;
			float4 tex2DNode26 = tex2D( _ID03, uv_ID03 );
			float4 lerpResult33 = lerp( lerpResult32 , _ClothAccentSecondaryColor , tex2DNode26.b);
			float4 lerpResult34 = lerp( lerpResult33 , _EyesWhiteColor , tex2DNode26.g);
			float4 lerpResult29 = lerp( lerpResult34 , _EyesColor , tex2DNode24.b);
			o.Albedo = ( tex2D( _MultTexture, uv_MultTexture ) * lerpResult29 ).rgb;
			float4 lerpResult48 = lerp( float4( 0,0,0,0 ) , _EmissiveColor , tex2DNode25.r);
			o.Emission = ( lerpResult48 * _EmissiveIntensity ).rgb;
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
0;0;2560;1379;9182.021;1166.813;3.477048;True;False
Node;AmplifyShaderEditor.ColorNode;38;-3456,-2048;Inherit;False;Property;_HairColor;Hair Color;16;0;Create;True;0;0;0;False;0;False;0.08490568,0.08490568,0.08490568,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;24;-3840,-1152;Inherit;True;Property;_ID01;ID 01;11;0;Create;True;0;0;0;False;3;Space(13);Header(Selector);Space(13);False;-1;6688c549e287f0440b7f346efe2e3fd0;6688c549e287f0440b7f346efe2e3fd0;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;37;-3840,-2048;Inherit;False;Property;_SkinColor;Skin Color;17;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;39;-2944,-2048;Inherit;False;Property;_ClothAccentColor;Cloth Accent Color;19;0;Create;True;0;0;0;False;0;False;1,0,0.5400758,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;27;-3200,-1536;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;41;-2560,-2048;Inherit;False;Property;_ClothColor;Cloth Color;18;0;Create;True;0;0;0;False;0;False;0.2735849,0.2735849,0.2735849,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;28;-2816,-1536;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;25;-3840,-896;Inherit;True;Property;_ID02;ID 02;12;0;Create;True;0;0;0;False;0;False;-1;4c4e1be341566cd4ea5d8a8debb95a2f;4c4e1be341566cd4ea5d8a8debb95a2f;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;30;-2432,-1536;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;40;-2176,-2048;Inherit;False;Property;_MetalColor;Metal Color;21;0;Create;True;0;0;0;False;0;False;0.6466714,0.7924528,0.7895944,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;42;-1792,-2048;Inherit;False;Property;_EmissiveColor;Emissive Color;22;0;Create;True;0;0;0;False;0;False;0,1,0.980212,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;31;-2048,-1536;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;26;-3840,-640;Inherit;True;Property;_ID03;ID 03;13;0;Create;True;0;0;0;False;0;False;-1;6da31333b622bd54e849c8867692e26b;6da31333b622bd54e849c8867692e26b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;43;-1408,-2048;Inherit;False;Property;_ClothAccentSecondaryColor;Cloth Accent Secondary Color;20;0;Create;True;0;0;0;False;0;False;1,0,0.5400758,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;32;-1664,-1536;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;44;-1024,-2048;Inherit;False;Property;_EyesWhiteColor;Eyes White Color;15;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;33;-1280,-1536;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;34;-896,-1536;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-3200,1152;Inherit;False;Property;_MetallicMax;Metallic Max;7;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-3200,1024;Inherit;False;Property;_MetallicMin;Metallic Min;6;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;18;-3840,1408;Inherit;True;Property;_RoughnessTexture;Roughness Texture;8;0;Create;True;0;0;0;False;3;Space(13);Header(Roughness);Space(13);False;-1;fc1fe8fd5d255594b84af490e0431dee;b9cc3e0485f21cd47b8ea0ac51e6e8d1;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;45;-640,-2048;Inherit;False;Property;_EyesColor;Eyes Color;14;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-3840,896;Inherit;True;Property;_MetallicTexture;Metallic Texture;5;0;Create;True;0;0;0;False;3;Space(13);Header(Metallic);Space(13);False;-1;d7c2de74dee042841866aa0a7d9c205a;9176c77834137a14d9fef6c3d3a443f0;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;20;-3200,1536;Inherit;False;Property;_RoughnessMin;Roughness Min;9;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;19;-3200,1664;Inherit;False;Property;_RoughnessMax;Roughness Max;10;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;17;-3200,1920;Inherit;False;Constant;_Vector1;Vector 1;8;0;Create;True;0;0;0;False;0;False;1,1,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;5;-3200,512;Inherit;False;Property;_NormalIntensity;Normal Intensity;2;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;13;-3840,2048;Inherit;True;Property;_AmbientOcclusionTexture;Ambient Occlusion Texture;3;0;Create;True;0;0;0;False;3;Space(13);Header(Ambient Occlusion);Space(13);False;-1;b07f0514b8e3b2d4bb1a112464b110c8;4c941ff310c00804c832adfbae8fbab9;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;48;-2048,-1024;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;21;-3200,1408;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2;-3840,384;Inherit;True;Property;_NormalTexture;Normal Texture;1;1;[Normal];Create;True;0;0;0;False;3;Space(13);Header(Normal);Space(13);False;-1;80e14c69a9da7eb429fe41c4b39d0e46;585453df463386047af58ff010dcbbb8;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-3840,0;Inherit;True;Property;_MultTexture;Mult Texture;0;0;Create;True;0;0;0;False;3;Space(13);Header(Multiply Color);Space(13);False;-1;a593b508e34c28b4992a57f111a55111;a593b508e34c28b4992a57f111a55111;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;9;-3200,896;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;29;-512,-1536;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-2944,2048;Inherit;False;Property;_AOIntensity;AO Intensity;4;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;47;-2048,-768;Inherit;False;Property;_EmissiveIntensity;Emissive Intensity;23;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;8;-3200,640;Inherit;False;Constant;_Vector0;Vector 0;4;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;15;-2944,1920;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;4;-3200,384;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;46;-2048,-896;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;23;-3200,0;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;22;-2944,1408;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;10;-2944,896;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;SH_Vexa_Selector_Body;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;18;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;27;0;38;0
WireConnection;27;1;37;0
WireConnection;27;2;24;1
WireConnection;28;0;27;0
WireConnection;28;1;39;0
WireConnection;28;2;24;2
WireConnection;30;0;28;0
WireConnection;30;1;41;0
WireConnection;30;2;25;2
WireConnection;31;0;30;0
WireConnection;31;1;40;0
WireConnection;31;2;25;3
WireConnection;32;0;31;0
WireConnection;32;1;42;0
WireConnection;32;2;25;1
WireConnection;33;0;32;0
WireConnection;33;1;43;0
WireConnection;33;2;26;3
WireConnection;34;0;33;0
WireConnection;34;1;44;0
WireConnection;34;2;26;2
WireConnection;48;1;42;0
WireConnection;48;2;25;1
WireConnection;21;0;20;0
WireConnection;21;1;19;0
WireConnection;21;2;18;0
WireConnection;9;0;11;0
WireConnection;9;1;12;0
WireConnection;9;2;3;0
WireConnection;29;0;34;0
WireConnection;29;1;45;0
WireConnection;29;2;24;3
WireConnection;15;0;17;0
WireConnection;15;1;13;0
WireConnection;15;2;16;0
WireConnection;4;0;8;0
WireConnection;4;1;2;0
WireConnection;4;2;5;0
WireConnection;46;0;48;0
WireConnection;46;1;47;0
WireConnection;23;0;1;0
WireConnection;23;1;29;0
WireConnection;22;0;21;0
WireConnection;10;0;9;0
WireConnection;0;0;23;0
WireConnection;0;1;4;0
WireConnection;0;2;46;0
WireConnection;0;3;10;0
WireConnection;0;4;22;0
WireConnection;0;5;15;0
ASEEND*/
//CHKSM=5FCE1CBBE04FA98B116EE8CF826229D29C3BEC02