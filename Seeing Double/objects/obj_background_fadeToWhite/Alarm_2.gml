if obj_cutsceneSystem.cutsceneState == SPLIT_SCREEN_CUTSCENE_STATE.TEXT_TYPING {

	textOccilating = false;
	obj_cutsceneSystem.cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.TEXT_DONE_TYPING;
	alarm[2] = 300;

	exit;

}

if obj_cutsceneSystem.cutsceneState == SPLIT_SCREEN_CUTSCENE_STATE.TEXT_DONE_TYPING {

	audio_play_sound(sfx_sweet_transition, 1, 0, 1, 0, 1.0);
	
	obj_cutsceneSystem.cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.DIVIDER_DESCENDING;

}

