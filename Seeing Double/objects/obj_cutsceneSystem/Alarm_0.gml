/// @description Cutscene activated after delay

//global.cutsceneActive = true;
//global.playerControl = false;
//
//if playerIsPresent() obj_player.jumpDisabled = true;

activateCutscene();

switch global.currentCutsceneID {

	case CUTSCENE_ID.SPLIT_SCREEN_ACTIVATE: {
	
		cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.NONE;
		
		if audio_is_playing(amb_forest_ambience) {
		
			audio_sound_gain(amb_forest_ambience, 0, 2000);
		
		}
	
		//show_debug_message("split screen cutscene active")
	
	
	} break;
	
	//case CUTSCENE_ID.DOUBLE_JUMP_BARREL: {
	//
	//	show_debug_message("barrel cutscene active")
	//	
	//	if audio_is_playing(bgm_forest_ambience) {
	//	
	//		audio_sound_gain(bgm_forest_ambience, 0, 2000);
	//	
	//	}
	//
	//} break;
	
	case CUTSCENE_ID.FOREST_HAUNTING: {
	
		cutsceneState = FOREST_HAUNTING_CUTSCENE_STATE.LOOKING_AT_FLOWER;
		
		alarm[1] = 140;
		
		audio_sound_gain(obj_control.bgmForest, 0, 3000);
		audio_sound_gain(amb_forest_ambience, 0, 3000);
		
		var _elipsesOffsetY = -20;
		
		//if pitterPlayerIsPresent() instance_create_layer(obj_player_pitter.x, obj_player_pitter.y + _elipsesOffsetY, "Instances", obj_background_elipses);
		//if patterPlayerIsPresent() instance_create_layer(obj_player_patter.x, obj_player_patter.y + _elipsesOffsetY, "Instances", obj_background_elipses);
		if pitterPlayerIsPresent() instance_create_layer(obj_player_pitter.x, 208, "Instances", obj_background_elipses);
		if patterPlayerIsPresent() instance_create_layer(obj_player_patter.x, 528, "Instances", obj_background_elipses);

	} break;


}

//show_debug_message("cutscene active")

