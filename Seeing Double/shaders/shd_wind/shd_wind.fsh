varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform float speed;
uniform float magnitude;
uniform vec4  uv_bounds; //Holds (left, top, right, bottom) of the sprite

void main()
{
    // 1. Calculate Local Y (0.0 at top of SPRITE, 1.0 at bottom of SPRITE)
    // We take the current Y, subtract the sprite's top Y, and divide by height.
    float sprite_top = uv_bounds.y;
    float sprite_bottom = uv_bounds.w;
    float sprite_height = sprite_bottom - sprite_top;
    
    // This gives us a value from 0.0 to 1.0 relative to the SPRITE only.
    float local_y = (v_vTexcoord.y - sprite_top) / sprite_height;

    // 2. Create the "Pinning Factor"
    // When local_y is 1.0 (bottom), effect is 0.0.
    // When local_y is 0.0 (top), effect is 1.0.
    float pin_factor = 1.0 - local_y; 
    
    // Optional: Use power to make the stem stiffer at the bottom
    pin_factor = pow(pin_factor, 2.0);

    // 3. Calculate Sway
    float sway = sin(time * speed + local_y * 10.0) * magnitude;

    // 4. Apply Offset
    vec2 offset_coords = v_vTexcoord;
    offset_coords.x += sway * pin_factor;

    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, offset_coords);
}