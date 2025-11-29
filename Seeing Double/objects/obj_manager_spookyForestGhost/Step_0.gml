//show_debug_message(timer);

if ghostGone exit;

if !ambienceFadingIn && timer >= ambienceFadingInPoint {

	ambienceFadingIn = true;
	
	show_debug_message("ambienceFadingIn")

	audio_sound_gain(bgm_ghostlyReverberations, 1, 20000);

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
	
	audio_sound_gain(sfx_glitch_loop, 0.5, 5000);
	audio_sound_gain(sfx_glitch_loop2, 0.1, 5000);
	
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
	
	audio_play_sound(sfx_ghost_scream, 1, 0);
	
	if instance_exists(obj_npc_ghost_forest) {
	
		with obj_npc_ghost_forest {
	
			x = xstart;
			y = ystart;
			path_start(path_forest_ghost, 1, path_action_stop, false);
	
		}
	
	}

}

if ghostArriving && !ambienceFadingOut && !audio_is_playing(sfx_ghost_scream) && !audio_is_playing(sfx_ghost_scream2) {
	
	show_debug_message("playing scream 2")
	
	audio_play_sound(sfx_ghost_scream2, 1, 0);
	
}

if !ambienceFadingOut && timer >= ambienceFadingOutPoint {

	ambienceFadingOut = true;
	
	var _fadeOutTime = 8000;
	
	audio_sound_gain(bgm_ghostlyReverberations, 0, _fadeOutTime);
	audio_sound_gain(bgm_ephemeralEcho, 0, _fadeOutTime);
	audio_sound_gain(bgm_cursedAtmosphere, 0, _fadeOutTime);
	audio_sound_gain(sfx_glitch_loop, 0, _fadeOutTime);
	audio_sound_gain(sfx_glitch_loop2, 0, _fadeOutTime);
	audio_sound_gain(sfx_ghost_scream2, 0, _fadeOutTime);

	show_debug_message("ambienceFadingOut")

}

if !ghostDeparting && timer >= ghostDepartingPoint {

	ghostDeparting = true;
	
	textAppearing = false;
	ghostArriving = false;
	
	if patterPlayerIsPresent() obj_player_patter.recoveringFromFear = true;
	
	show_debug_message("ghostDeparting")
	
	ghostGone = true;

}

















if timerActive && !global.paused timer++;






