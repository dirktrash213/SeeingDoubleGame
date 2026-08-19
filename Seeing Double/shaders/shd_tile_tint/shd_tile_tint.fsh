varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 u_vTint; // RGBA tint passed from GML

void main()
{
    vec4 texColor = texture2D( gm_BaseTexture, v_vTexcoord );
    
    // Multiply tile texture colors by tint color, keeping original alpha
    gl_FragColor = vec4(texColor.rgb * u_vTint.rgb, texColor.a * u_vTint.a);
}