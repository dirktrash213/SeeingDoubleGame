triggered = false;

// Speed and momentum variables
cart_speed = 0;       // Current velocity
min_speed = 2;        // Lower Speed limit //2
max_speed = 6;        // Upper Speed limit
gravity_power = 0.02;  // How fast it accelerates downhill //0.2
friction_power = 0.05; // Natural slowdown over time //0.05
pth_minecart_track = path_platform_minecart_test; //Minecart path

// Start the path (at speed 0, we will control speed manually)
path_start(pth_minecart_track, 0, path_action_stop, false);

//xSpeed = 0;
//ySpeed = 0;