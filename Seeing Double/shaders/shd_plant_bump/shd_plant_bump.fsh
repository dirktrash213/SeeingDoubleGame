varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform vec4  uv_bounds;      // (left, top, right, bottom)
uniform float shake_magnitude; // 0.0 = still, 1.0 = violent shake
uniform float hit_direction;   // 1.0 = bends right, -1.0 = bends left

void main()
{
    // --- 1. PIN THE ROOTS ---
    float sprite_top = uv_bounds.y;
    float sprite_bottom = uv_bounds.w;
    float sprite_height = sprite_bottom - sprite_top;
    float local_y = (v_vTexcoord.y - sprite_top) / sprite_height;
    
    // Invert: 0.0 (bottom) to 1.0 (top)
    float height_factor = 1.0 - local_y; 
    
    // Curve the stem (stiff bottom, loose top)
    height_factor = pow(height_factor, 2.5); 

    // --- 2. CALCULATE THE WIGGLE ---
    // We use a fast sine wave (time * 25.0) for a rapid "boing" effect.
    // We multiply by shake_magnitude, which will be decaying in GML.
    float wiggle = sin(time * 25.0) * shake_magnitude * hit_direction;

    // --- 3. APPLY OFFSET ---
    // We shift X based on the wiggle and how high up the pixel is
    vec2 offset_coords = v_vTexcoord;
    
    // The 0.1 is an arbitrary scaler to keep the pixels from flying off screen
    // when magnitude is 1.0
    offset_coords.x += wiggle * height_factor * 0.1; 

    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, offset_coords);
}