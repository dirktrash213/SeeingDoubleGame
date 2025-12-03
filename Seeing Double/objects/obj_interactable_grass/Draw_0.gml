// Increment timer
//wind_timer += 1 / 60; // Adds 1 every second (assuming 60fps)
//
//shader_set(shd_wind);
//
//// Send Uniforms
//shader_set_uniform_f(u_time, wind_timer);
//shader_set_uniform_f(u_speed, 2.0);    // Try values between 1.0 and 5.0
//shader_set_uniform_f(u_magnitude, 0.001); // Keep this SMALL (0.01 to 0.1)
//
//// 1. Get the UVs for the CURRENT sprite and image index
//// Returns an array: [left, top, right, bottom]
//var _uvs = sprite_get_uvs(sprite_index, image_index);
//
//// 2. Pass them to the shader
//shader_set_uniform_f(u_uvs, _uvs[1], _uvs[1], _uvs[2], _uvs[3]);
//// Note: sprite_get_uvs actually returns [left, top, right, bottom]
//// So index 0=left, 1=top, 2=right, 3=bottom.
//
//shader_set_uniform_f(u_uvs, _uvs[0], _uvs[1], _uvs[2], _uvs[3]);
//
//draw_self();
//shader_reset();

if room == rm_titleScreen 
|| room == rm_hills_runTutorial 
|| room == rm_hills_jumpTutorial 
|| room == rm_forest_canopyUpperFloor 
|| room == rm_forest_canopyUpperFloor_enemy 
|| room == rm_forest_canopyUpperFloor_enemyBasics 
|| room == rm_forest_canopyUpperFloor_enemyLedges 
|| room == rm_forest_canopyUpperFloor_enemyMinigames
|| room == rm_forest_canopyUpperFloor_enemyMinigames2
|| room == rm_forest_canopyUpperFloor_jumpBackDown
|| room == rm_hills_jumpIntoPit {

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

} else {

	draw_self();

}