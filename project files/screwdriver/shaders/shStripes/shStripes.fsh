//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_resolution;

void main()
{
	vec2 uv = gl_FragCoord.xy / u_resolution;
	
	float stripe = mod(floor(uv.y * 250.0), 2.0) / 30.0;
	
	vec4 base_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord);
	vec4 color = vec4(max(base_color.xyz - stripe, 0.0), base_color.w);
	
    gl_FragColor = color;
}