varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform vec4  uv_bounds;     // (left, top, right, bottom)
uniform float wind_strength; // How many pixels to bend
uniform float wind_speed;    // How fast the gusts happen
uniform float timing_offset; // Random value (0-100) so instances don't sync up

void main()
{
    // --- 1. NORMALIZE HEIGHT ---
    // Same as before: 0.0 = top (moves most), 1.0 = bottom (pinned)
    float sprite_top = uv_bounds.y;
    float sprite_bottom = uv_bounds.w;
    float sprite_height = sprite_bottom - sprite_top;
    float local_y = (v_vTexcoord.y - sprite_top) / sprite_height;
    
    // Invert so 0.0 is bottom (no move) and 1.0 is top (max move)
    float height_factor = 1.0 - local_y; 
    
    // Apply a curve. 
    // ^2.0 makes the bottom stiff (stem) and the top flexible (flower)
    // ^1.0 would be a straight linear tilt.
    height_factor = pow(height_factor, 2.0); 

    // --- 2. CALCULATE WIND FORCE (The "Gust") ---
    // We combine two sine waves to simulate "chaos"
    float t = time * wind_speed + timing_offset;
    
    // Primary Gust (Slow, deep push)
    float gust = sin(t); 
    
    // Secondary Flutter (Fast, small twitch)
    float flutter = sin(t * 3.17) * 0.5; // 3.17 is a prime number to avoid perfect loops
    
    // Combine them
    float total_wind = gust + flutter;

    // --- 3. MAKE IT UNIDIRECTIONAL (The "Push") ---
    // Normal sine goes -1 to 1. We map it to roughly 0.0 to 1.0
    // This creates the "Rest -> Push -> Snap Back" feel
    // Adding 0.6 ensures it mostly pushes RIGHT, but dips slightly LEFT for recoil.
    total_wind = (total_wind + 1.2) * -0.5;

    // --- 4. APPLY OFFSET ---
    // Offset only the X axis based on wind * height
    vec2 offset_coords = v_vTexcoord;
    offset_coords.x -= total_wind * height_factor * wind_strength; 
    // Note: I used '-=' to push left, use '+=' to push right.

    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, offset_coords);
}