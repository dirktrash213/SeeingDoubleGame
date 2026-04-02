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
	
	case CUTSCENE_ID.CAVES_HAUNTING: {
		
		cutsceneState = CAVES_HAUNTING_CUTSCENE_STATE.LOOKING_AT_SCAMMER;
		
		alarm[1] = 10;
		
		//if patterPlayerIsPresent() instance_create_layer(obj_player_patter.x - 8, obj_player_patter.y + 80, "Instances", obj_background_elipses);

	} break;
	
	case CUTSCENE_ID.CAVES_HAUNTING_PART2: {
		
		cutsceneState = CAVES_HAUNTING_PART2_CUTSCENE_STATE.WALKING_BACK;
		
		alarm[1] = 45;
		
		if pitterPlayerIsPresent() && patterPlayerIsPresent() {
		
			obj_player_pitter.hspeed = -1;
			obj_player_pitter.image_xscale = -1;
			
			obj_player_patter.hspeed = -1;
			obj_player_patter.image_xscale = -1;
		
		}

	} break;
	
	case CUTSCENE_ID.GO_BEAT_UP_SCAMMER_FIRST: {
		
		cutsceneState = GO_BEAT_UP_SCAMMER_FIRST_CUTSCENE_STATE.SHAKING_HEAD;
		
		if patterPlayerIsPresent() part_particles_create(global.particleSystemDevice, obj_player_patter.x, obj_player_patter.y - 10, global.particleBeatUpScammer, 1);
		
		alarm[1] = 120;
		
		//if patterPlayerIsPresent() instance_create_layer(obj_player_patter.x - 8, obj_player_patter.y + 80, "Instances", obj_background_elipses);

	} break;


}

//show_debug_message("cutscene active")

