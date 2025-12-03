time_counter += 1 / 60;

shader_set(shd_wind_gust);

// 1. Pass UV Bounds (Crucial for pinning)
var _uvs = sprite_get_uvs(sprite_index, image_index);
shader_set_uniform_f(u_uvs, _uvs[0], _uvs[1], _uvs[2], _uvs[3]);

// 2. Pass Time & Offset
shader_set_uniform_f(u_time, time_counter);
shader_set_uniform_f(u_offset, my_timing_offset);

// 3. Settings for 16x16 Pixel Art
// Speed: Lower = heavy wind, Higher = fluttery wind
shader_set_uniform_f(u_speed, 2.5); 

// Strength: 
// Since texture coords are 0-1, and your sprite is small, 
// 0.02 is roughly a 1-2 pixel shift. 
// If it looks too subtle, try 0.04. If it clips, lower it.
shader_set_uniform_f(u_strength, 0.002); 

draw_self();
shader_reset();