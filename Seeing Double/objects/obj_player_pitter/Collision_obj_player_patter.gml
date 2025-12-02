if global.titleScreenCutsceneState == TITLE_SCREEN_CUTSCENE_STATE.PITTER_PATTER_HUGGING {

	audio_play_sound(sfx_mouseScream, 1, 0, 1, 0, 3.0);

	global.pitterPatterHugging = true;
	instance_destroy(other);
	
	//hspeed = 0;

}




