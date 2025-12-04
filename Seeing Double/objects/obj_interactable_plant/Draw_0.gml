// Only use the shader if we are actually shaking
if (current_shake > 0) {
    shader_set(shd_plant_bump);
    
    // Pass UVs (Critical for pinning!)
    var _uvs = sprite_get_uvs(sprite_index, image_index);
    shader_set_uniform_f(u_uvs, _uvs[0], _uvs[1], _uvs[2], _uvs[3]);
    
    // Pass Physics
    shader_set_uniform_f(u_time, timer);
    shader_set_uniform_f(u_mag, current_shake);
    shader_set_uniform_f(u_dir, hit_dir);
    
    draw_self();
    shader_reset();
} else {
    // Optimization: If not shaking, just draw normal sprite
    draw_self();
}

