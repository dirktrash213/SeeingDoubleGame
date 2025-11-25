 varying vec2 v_vTexcoord;

varying vec4 v_vColour;

uniform float alpha;

void main() {

	vec4 pixel = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);

	pixel.a = pixel.a * alpha;

	gl_FragColor = pixel;

} 