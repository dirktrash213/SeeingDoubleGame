rustled = false;

rustleCooldown = 20;

// Uniform Handles
u_uvs = shader_get_uniform(shd_plant_bump, "uv_bounds");
u_time = shader_get_uniform(shd_plant_bump, "time");
u_mag = shader_get_uniform(shd_plant_bump, "shake_magnitude");
u_dir = shader_get_uniform(shd_plant_bump, "hit_direction");

// Variables
current_shake = 0;   // Starts at 0 (still)
shake_decay = 0.05;  // How fast it stops (higher = stops faster)
hit_dir = 1;         // Direction of the bend
timer = 0;           // Local timer for the sine wave





