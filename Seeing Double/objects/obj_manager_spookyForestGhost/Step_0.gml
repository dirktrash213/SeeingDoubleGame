//show_debug_message(timer);



if !ambienceFadingIn && timer >= ambienceFadingInPoint {

	ambienceFadingIn = true;
	
	show_debug_message("ambienceFadingIn")

	audio_sound_gain(bgm_ghostlyReverberations, 1, 10000);

}

if !ambienceFadingIn2 && timer >= ambienceFadingIn2Point {

	ambienceFadingIn2 = true;
	
	show_debug_message("ambienceFadingIn2")

	audio_sound_gain(bgm_ephemeralEcho, 1, 10000);

}

if !ambienceFadingIn3 && timer >= ambienceFadingIn3Point {

	ambienceFadingIn3 = true;
	
	show_debug_message("ambienceFadingIn3")

	audio_sound_gain(bgm_cursedAtmosphere, 1, 1000);

}

if !glitchesAppearing && timer >= glitchesAppearingPoint {

	glitchesAppearing = true;
	
	show_debug_message("glitchesAppearing")

}

if !textAppearing && timer >= textAppearingPoint {

	textAppearing = true;
	
	alarm[0] = textDuration;
	
	show_debug_message("textAppearing")

}

if !ghostArriving && timer >= ghostArrivingPoint {

	ghostArriving = true;
	
	show_debug_message("ghostArriving")
	
	if instance_exists(obj_npc_ghost_forest) {
	
		with obj_npc_ghost_forest {
	
			x = xstart;
			y = ystart;
			path_start(path_forest_ghost, 1, path_action_stop, false);
	
		}
	
	}

}

if !ambienceFadingOut && timer >= ambienceFadingOutPoint {

	audio_sound_gain(bgm_ghostlyReverberations, 0, 1000);
	audio_sound_gain(bgm_ephemeralEcho, 0, 1000);
	audio_sound_gain(bgm_cursedAtmosphere, 0, 1000);

	show_debug_message("ambienceFadingOut")

}

if !ghostDeparting && timer >= ghostDepartingPoint {

	ghostDeparting = true;
	textAppearing = false;
	ghostArriving = false;
	
	if patterPlayerIsPresent() obj_player_patter.recoveringFromFear = true;
	
	show_debug_message("ghostDeparting")

}

















if timerActive && !global.paused timer++;






