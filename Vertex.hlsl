cbuffer TRANSFORM_BUFFER : register(b0)
{
	float4x4 world;
	float4x4 view;
	float4x4 projection;
};

struct VS_IN
{
	float3 Pos : POSITION;
	float3 Color : COLOR;
};

struct VS_OUT
{
	float4 Pos : SV_POSITION;
	float3 Color : COLOR;
};
//-----------------------------------------------------------------------------------------
// VertexShader: VSScene
//-----------------------------------------------------------------------------------------
VS_OUT VS_main(VS_IN input)
{
	float4x4 final = mul(projection, mul(view, world));
	VS_OUT output = (VS_OUT)0;

	float4x4 asd = { 1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1 };
	output.Pos = mul(world, float4(input.Pos, 1));
	output.Color = input.Color;

	return output;
}