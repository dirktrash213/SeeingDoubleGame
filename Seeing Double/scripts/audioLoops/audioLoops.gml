function audio_play_sound_looped_soft_wind() {

	audio_play_sound(amb_soft_wind, 1, 1);
	audio_sound_loop_start(amb_soft_wind, 2);
	audio_sound_loop_end(amb_soft_wind, 22);
	//audio_sound_loop_end(bgm_soft_wind, 4);
	audio_sound_loop(amb_soft_wind, true);

}

function audio_play_sound_looped_forest_ambience() {

	audio_play_sound(amb_forest_ambience, 1, 1);
	audio_sound_loop_start(amb_forest_ambience, 2);
	audio_sound_loop_end(amb_forest_ambience, 22);
	audio_sound_loop(amb_forest_ambience, true);

}