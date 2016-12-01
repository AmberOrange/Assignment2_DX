// OLD
//cbuffer TRANSFORM_BUFFER : register(b0)
//{
//	float4x4 world;
//	float4x4 view;
//	float4x4 projection;
//};

struct VS_IN
{
	float3 Pos : POSITION;
	float3 Color : COLOR;
	float2 Tex : TEXCOORD0;
};

// OLD
//struct VS_OUT
//{
//	float4 Pos : SV_POSITION;
//	float3 Color : COLOR;
//};

// NEW
struct VS_OUT
{
	float3 Pos : POSITION;
	float3 Color : COLOR;
	float2 Tex : TEXCOORD0;
};

//-----------------------------------------------------------------------------------------
// VertexShader: VSScene
//-----------------------------------------------------------------------------------------
VS_OUT VS_main(VS_IN input)
{
	// OLD
	/*float4x4 final = mul(projection, mul(view, world));
	VS_OUT output = (VS_OUT)0;

	output.Pos = mul(final, float4(input.Pos, 1));
	output.Color = input.Color;*/

	// NEW
	VS_OUT output = (VS_OUT)0;

	output.Pos = input.Pos;
	output.Color = input.Color;
	output.Tex = input.Tex;


	return output;
}