if audio_group_is_loaded(audiogroup_bgm) {

	audioBGMLoaded = true;
	
	
	
	if !audio_is_playing(bgm_soft_wind) {
		
		audio_play_sound_looped_soft_wind();
		
	}
	
	//audio_play_sound(bgm_inSync, 1, 1);
	
	//show_debug_message("bgm loaded")

}

if audio_group_is_loaded(audiogroup_sfx) {

	audioSFXLoaded = true;
	
}





