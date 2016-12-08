Texture2D shaderTexture : register(t0);
SamplerState sampleState : register(s0);

struct FS_IN
{
	float4 Pos : SV_POSITION;
	float3 Color : COLOR;
	float2 Tex : TEXCOORD0;
	float3 WorldPos : POSITION;
	float3 Normal : NORMAL;
};

static float3 lightPosition = float3(0.f, 0.f, -2.5f);

float4 PS_main(FS_IN input) : SV_Target
{
	//return float4(input.Color, 1.0f);

	float3 lightRay = lightPosition - input.WorldPos;

	lightRay = normalize(lightRay);

	float lightIntensity = saturate(dot(lightRay, input.Normal));

	return saturate((shaderTexture.Sample(sampleState,input.Tex) * 1.0f + float4(input.Color, 1.0f) * 1.0f) * lightIntensity);
};