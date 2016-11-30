struct FS_IN
{
	float4 Pos : SV_POSITION;
	float3 Color : COLOR;
};

float4 PS_main(FS_IN input) : SV_Target
{
	return float4(input.Color, 1.0f);
};