//Anti softlock measures

if groundPounding {

	groundPounding = false;
	groundPoundRising = false;
	groundPoundFalling = false;
	vspeed = 0;
	gravity = 0;
	
	show_debug_message("Ground pound timed out")

}

