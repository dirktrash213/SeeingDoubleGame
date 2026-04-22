if audio_group_is_loaded(audiogroup_bgm) {

	audioBGMLoaded = true;
	
	//audio_play_sound(bgm_inSync, 1, 1);
	
	//show_debug_message("bgm loaded")

}

if audio_group_is_loaded(audiogroup_sfx) {

	audioSFXLoaded = true;

	
	
}

if audio_group_is_loaded(audiogroup_amb) {

	audioAMBLoaded = true;
	
	if !audio_is_playing(amb_soft_wind) {
		
		alarm[2] = 5;
		//audio_play_sound_looped_soft_wind();
		
	}
	
}





