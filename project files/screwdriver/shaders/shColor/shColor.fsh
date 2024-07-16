//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 uColor;

void main()
{
	vec4 color = vec4(uColor / 255.0,1.0);
	//vec4 color = vec4(.83,.29,.99, 1.0);
	vec4 basecolor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
    gl_FragColor = color * basecolor;
}
