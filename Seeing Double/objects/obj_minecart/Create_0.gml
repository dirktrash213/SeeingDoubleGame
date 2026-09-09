triggered = false;

coopObjectCreateEventCode();

//if global.coopActive && invisCoop mask_index = spr_empty;

// Speed and momentum variables
cart_speed = 0;       // Current velocity
min_speed = 2.2;        // Lower Speed limit //2
max_speed = 6;        // Upper Speed limit
gravity_power = 0.02;  // How fast it accelerates downhill //0.2
friction_power = 0.01; // Natural slowdown over time //0.05
pth_minecart_track = path_platform_minecart_test; //Minecart path


image_speed = 0;

// Start the path (at speed 0, we will control speed manually)


flyOffTrackAtEnd = false;

//xSpeed = 0;
//ySpeed = 0;

travelSoundID = noone;

duplicateObject = detectDuplicateObject();

// Verification check
if duplicateObject != noone {
    // A duplicate matching object was found!
    // You can access its ID via duplicateObject.id
	//show_debug_message("dup object found")
	
}

