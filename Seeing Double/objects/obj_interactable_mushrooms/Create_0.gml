//// Get Uniform Handles
//u_time = shader_get_uniform(shd_wind, "time");
//u_speed = shader_get_uniform(shd_wind, "speed");
//u_magnitude = shader_get_uniform(shd_wind, "magnitude");
//u_uvs = shader_get_uniform(shd_wind, "uv_bounds");
//
//// Variables
//wind_timer = 0;
//

// Uniform handles
u_uvs = shader_get_uniform(shd_wind_gust, "uv_bounds");
u_time = shader_get_uniform(shd_wind_gust, "time");
u_strength = shader_get_uniform(shd_wind_gust, "wind_strength");
u_speed = shader_get_uniform(shd_wind_gust, "wind_speed");
u_offset = shader_get_uniform(shd_wind_gust, "timing_offset");

// Variables
time_counter = 0;
// Give this instance a unique random start time
my_timing_offset = random_range(0, 100);

