Texture2D shaderTexture : register(t0);
SamplerState sampleState : register(s0);

struct FS_IN
{
	float4 Pos : SV_POSITION;
	float3 Color : COLOR;
	float2 Tex : TEXCOORD0;
};

float4 PS_main(FS_IN input) : SV_Target
{
	//return float4(input.Color, 1.0f);
	return shaderTexture.Sample(sampleState,input.Tex) * 0.5f + float4(input.Color, 1.0f) * 0.5f;
};