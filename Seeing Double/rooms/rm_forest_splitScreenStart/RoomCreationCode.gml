if !audio_is_playing(amb_forest_ambience) {
	
	audio_play_sound(amb_forest_ambience, 1, 1, 1);
	
} else {

	if !global.splitScreenActive audio_sound_gain(amb_forest_ambience, 1, 1);

}

global.loadingFirstTimePatter = false;

//if !audio_is_playing(bgm_soft_wind_leaves) audio_play_sound(bgm_soft_wind_leaves, 1, 1, 1);