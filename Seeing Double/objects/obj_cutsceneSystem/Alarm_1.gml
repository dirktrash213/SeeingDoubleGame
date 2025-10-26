/// @description Cutscene progression

switch cutsceneState {

	case SPLIT_SCREEN_CUTSCENE_STATE.PITTER_SHOUTING_LEFT: {
	
		cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.PITTER_SHOUTING_RIGHT;
		
		audio_play_sound(sfx_mouseChirp, 1, 0);
		
		if pitterPlayerIsPresent() {
			
			part_particles_create(global.particleSystemDevice, obj_player_pitter.x, obj_player_pitter.y - 10, global.particleCallForPatter, 1);
			
		}
		
		alarm[1] = 120;
	
	} break;
	
	case SPLIT_SCREEN_CUTSCENE_STATE.PITTER_SHOUTING_RIGHT: {
	
		cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.PITTER_WAITING_FOR_RESPONSE;
		alarm[1] = 180;
	
	} break;
	
	case SPLIT_SCREEN_CUTSCENE_STATE.PITTER_WAITING_FOR_RESPONSE: {
	
		cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.PITTER_SAD;
		alarm[1] = 180;
		audio_play_sound(sfx_mouseChirp, 1, 0, 1, 0, 0.5);
	
	} break;
	
	case SPLIT_SCREEN_CUTSCENE_STATE.PITTER_SAD: {
	
		cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.FADING_IN_WHITE;
		
		with instance_create_depth(100, 100, -14000, obj_background_fadeToWhite) {
		
			fadingIn = true;
			fadeInRate = 0.005;
		
		}
	
	} break;

}




