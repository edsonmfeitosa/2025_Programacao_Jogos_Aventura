// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SH_Vexa_Selector_Hair"
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
		_HairColor("Hair Color", Color) = (0.08490568,0.08490568,0.08490568,0)
		_ClothAccentColor("Cloth Accent Color", Color) = (1,0,0.5400758,0)
		_ClothColor("Cloth Color", Color) = (0.3000541,0.1556604,1,0)
		_ClothSecondaryColor("Cloth Secondary Color", Color) = (0.4245283,0.4245283,0.4245283,0)
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
		uniform sampler2D _MultTexture;
		uniform float4 _MultTexture_ST;
		uniform float4 _ClothColor;
		uniform float4 _HairColor;
		uniform sampler2D _ID01;
		uniform float4 _ID01_ST;
		uniform float4 _ClothAccentColor;
		uniform float4 _ClothSecondaryColor;
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
			float4 lerpResult27 = lerp( _ClothColor , _HairColor , tex2DNode24.r);
			float4 lerpResult28 = lerp( lerpResult27 , _ClothAccentColor , tex2DNode24.g);
			float4 lerpResult30 = lerp( lerpResult28 , _ClothSecondaryColor , tex2DNode24.b);
			o.Albedo = ( tex2D( _MultTexture, uv_MultTexture ) * lerpResult30 ).rgb;
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
0;0;2560;1379;6676.977;2756.66;2.998809;True;False
Node;AmplifyShaderEditor.SamplerNode;24;-3840,-1152;Inherit;True;Property;_ID01;ID 01;11;0;Create;True;0;0;0;False;3;Space(13);Header(Selector);Space(13);False;-1;a40e056d097a9e84ca2f29b86c60d970;a40e056d097a9e84ca2f29b86c60d970;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;38;-3840,-2048;Inherit;False;Property;_HairColor;Hair Color;12;0;Create;True;0;0;0;False;0;False;0.08490568,0.08490568,0.08490568,0;0.08627451,0.08627451,0.08627451,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;41;-3328,-2048;Inherit;False;Property;_ClothColor;Cloth Color;14;0;Create;True;0;0;0;False;0;False;0.3000541,0.1556604,1,0;0.3019608,0.1568628,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;39;-2944,-2048;Inherit;False;Property;_ClothAccentColor;Cloth Accent Color;13;0;Create;True;0;0;0;False;0;False;1,0,0.5400758,0;1,0,0.5411765,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;27;-3200,-1536;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-3200,1152;Inherit;False;Property;_MetallicMax;Metallic Max;7;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;19;-3200,1664;Inherit;False;Property;_RoughnessMax;Roughness Max;10;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-3200,1024;Inherit;False;Property;_MetallicMin;Metallic Min;6;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3;-3840,896;Inherit;True;Property;_MetallicTexture;Metallic Texture;5;0;Create;True;0;0;0;False;3;Space(13);Header(Metallic);Space(13);False;-1;d8254fefbd7c94c43a63cbaebf35b46c;d8254fefbd7c94c43a63cbaebf35b46c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;43;-2560,-2048;Inherit;False;Property;_ClothSecondaryColor;Cloth Secondary Color;15;0;Create;True;0;0;0;False;0;False;0.4245283,0.4245283,0.4245283,0;0.4235294,0.4235294,0.4235294,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;18;-3840,1408;Inherit;True;Property;_RoughnessTexture;Roughness Texture;8;0;Create;True;0;0;0;False;3;Space(13);Header(Roughness);Space(13);False;-1;d7eef475a379deb469ab9ed76327673d;d7eef475a379deb469ab9ed76327673d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;20;-3200,1536;Inherit;False;Property;_RoughnessMin;Roughness Min;9;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;28;-2816,-1536;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-2944,2048;Inherit;False;Property;_AOIntensity;AO Intensity;4;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;9;-3200,896;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;21;-3200,1408;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;13;-3840,2048;Inherit;True;Property;_AmbientOcclusionTexture;Ambient Occlusion Texture;3;0;Create;True;0;0;0;False;3;Space(13);Header(Ambient Occlusion);Space(13);False;-1;bd1b9c1bd05275d44bb4f3b4294b7f88;bd1b9c1bd05275d44bb4f3b4294b7f88;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector3Node;17;-3200,1920;Inherit;False;Constant;_Vector1;Vector 1;8;0;Create;True;0;0;0;False;0;False;1,1,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;5;-3200,512;Inherit;False;Property;_NormalIntensity;Normal Intensity;2;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2;-3840,384;Inherit;True;Property;_NormalTexture;Normal Texture;1;1;[Normal];Create;True;0;0;0;False;3;Space(13);Header(Normal);Space(13);False;-1;c79bee61443c86748b5d72ef4aa37d90;c79bee61443c86748b5d72ef4aa37d90;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-3840,0;Inherit;True;Property;_MultTexture;Mult Texture;0;0;Create;True;0;0;0;False;3;Space(13);Header(Multiply Color);Space(13);False;-1;c42a4e154472d114a98b9483c36b885d;c42a4e154472d114a98b9483c36b885d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;30;-2432,-1536;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector3Node;8;-3200,640;Inherit;False;Constant;_Vector0;Vector 0;4;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SaturateNode;22;-2944,1408;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;10;-2944,896;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;23;-3200,0;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;15;-2944,1920;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;4;-3200,384;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;SH_Vexa_Selector_Hair;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;18;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;27;0;41;0
WireConnection;27;1;38;0
WireConnection;27;2;24;1
WireConnection;28;0;27;0
WireConnection;28;1;39;0
WireConnection;28;2;24;2
WireConnection;9;0;11;0
WireConnection;9;1;12;0
WireConnection;9;2;3;0
WireConnection;21;0;20;0
WireConnection;21;1;19;0
WireConnection;21;2;18;0
WireConnection;30;0;28;0
WireConnection;30;1;43;0
WireConnection;30;2;24;3
WireConnection;22;0;21;0
WireConnection;10;0;9;0
WireConnection;23;0;1;0
WireConnection;23;1;30;0
WireConnection;15;0;17;0
WireConnection;15;1;13;0
WireConnection;15;2;16;0
WireConnection;4;0;8;0
WireConnection;4;1;2;0
WireConnection;4;2;5;0
WireConnection;0;0;23;0
WireConnection;0;1;4;0
WireConnection;0;3;10;0
WireConnection;0;4;22;0
WireConnection;0;5;15;0
ASEEND*/
//CHKSM=855B165DA5A76D28ACDB80E3A76054F291A9109E