varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// This uniform allows you to control brightness from your GML code
uniform float u_fBrightness; 

void main()
{
    vec4 base_col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
    // Add the brightness value to RGB, but keep Alpha the same
    // we use clamp to ensure colors don't exceed 1.0 (pure white)
    gl_FragColor = vec4(base_col.rgb + u_fBrightness, base_col.a);
}