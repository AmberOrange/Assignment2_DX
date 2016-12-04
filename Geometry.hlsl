// NEW
cbuffer TRANSFORM_BUFFER : register(b0)
{
	float4x4 world;
	float4x4 view;
	float4x4 projection;
};

// OLD
//struct GS_IN
//{
//	float4 Pos : SV_POSITION;
//	float3 Color : COLOR;
//};
//
//struct GS_OUT
//{
//	float4 Pos : SV_POSITION;
//	float3 Color : COLOR;
//};

struct GS_IN
{
	float3 Pos : POSITION;
	float3 Color : COLOR;
	float2 Tex : TEXCOORD0;
};

struct GS_OUT
{
	float4 Pos : SV_POSITION;
	float3 Color : COLOR;
	float2 Tex : TEXCOORD0;
};

float3 LightDirection = float3(0.f, 0.f, -1.f);

[maxvertexcount(6)]
void GS_main(
	triangle GS_IN input[3], 
	inout TriangleStream< GS_OUT > output
)
{
	// OLD
	/*float4 normal = float4(normalize(
		cross(
			input[1].Pos.xyz - input[0].Pos.xyz,
			input[2].Pos.xyz - input[0].Pos.xyz)
	),0);

	for (uint i = 0; i < 3; i++)
	{
		GS_OUT element;
		element.Pos = input[i].Pos;
		element.Color = input[i].Color;
		output.Append(element);
	}
	output.RestartStrip();

	for (uint i = 0; i < 3; i++)
	{
		GS_OUT element;
		element.Pos = input[i].Pos + normal * 0.7f;
		element.Color = input[i].Color;
		output.Append(element);
	}
	output.RestartStrip();*/

	// NEW
	
	float4x4 final = mul(world, mul(view, projection));
	float3 normal = normalize(
		cross(
			input[1].Pos - input[0].Pos,
			input[2].Pos - input[0].Pos)
	);
	float lightIntensity = dot(normalize(mul(normal,(float3x3)world)), LightDirection);

	for (uint i = 0; i < 3; i++)
	{
		GS_OUT element;
		element.Pos = mul(float4(input[i].Pos,1), final);
		//element.Pos = float4(input[i].Pos,1);
		element.Color = input[i].Color * lightIntensity;
		element.Tex = input[i].Tex;
		output.Append(element);
	}
	output.RestartStrip();

	for (uint i = 0; i < 3; i++)
	{
		GS_OUT element;
		element.Pos = mul(float4(input[i].Pos + normal * 0.8f, 1), final);
		element.Color = input[i].Color * lightIntensity;
		element.Tex = input[i].Tex;
		output.Append(element);
	}
}