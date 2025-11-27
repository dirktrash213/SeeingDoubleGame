



if !ambienceFadingIn && timer >= ambienceFadingInPoint {

	ambienceFadingIn = true;
	
	show_debug_message("ambienceFadingIn")

}

if !glitchesAppearing && timer >= glitchesAppearingPoint {

	glitchesAppearing = true;
	
	show_debug_message("glitchesAppearing")

}

if !textAppearing && timer >= textAppearingPoint {

	textAppearing = true;
	
	show_debug_message("textAppearing")

}

if !ghostArriving && timer >= ghostArrivingPoint {

	ghostArriving = true;
	
	show_debug_message("ghostArriving")
	
	with obj_npc_ghost_forest {
	
		path_start(path_forest_ghost, 1, path_action_stop, false);
	
	}

}

















if timerActive timer++;






