struct GS_IN
{
	float4 Pos : SV_POSITION;
	float3 Color : COLOR;
};

struct GS_OUT
{
	float4 Pos : SV_POSITION;
	float3 Color : COLOR;
};

[maxvertexcount(3)]
void GS_main(
	triangle GS_IN input[3], 
	inout TriangleStream< GS_OUT > output
)
{
	float4 normal = float4(normalize(
		cross(
			input[1].Pos.xyz - input[0].Pos.xyz,
			input[2].Pos.xyz - input[0].Pos.xyz)
	),0);

	//for (uint i = 0; i < 3; i++)
	//{
	//	GS_OUT element;
	//	element.Pos = input[i].Pos;
	//	element.Color = input[i].Color;
	//	output.Append(element);
	//}
	//output.RestartStrip();

	for (uint i = 0; i < 3; i++)
	{
		GS_OUT element;
		element.Pos = input[i].Pos + normal * 0.7f;
		element.Color = input[i].Color;
		output.Append(element);
	}
	output.RestartStrip();
}