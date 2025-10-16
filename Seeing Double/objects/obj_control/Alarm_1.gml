/// @description Ttitle screen menu / cutscene

switch global.titleScreenCutsceneState {

	case TITLE_SCREEN_CUTSCENE_STATE.ON_MENU: {
	
		instance_create_depth(room_width/2, room_height/2, -12000, obj_menu_title);
	
	} break;
	
	case TITLE_SCREEN_CUTSCENE_STATE.PAD_WARMING_UP: {
	
		with obj_background_device {
	
			spawningSparks = true;
			alarm[0] = sparkParticleSpawnRate;
		
		}
		
	} break;
	
	case TITLE_SCREEN_CUTSCENE_STATE.PAD_FIRING: {
		
		global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.PAD_FIRED;
	
		if pitterPlayerIsPresent() {
		
			with obj_player_pitter {
			
				searchingForPatterPicnic = false;
				thinkingPicnic = true;
			
			}
		
		}
	
	} break;
	
	case TITLE_SCREEN_CUTSCENE_STATE.PAD_FIRED: {
	
		if pitterPlayerIsPresent() obj_player_pitter.wonderingAboutCherriesPicnic = false;
		
		global.playerControl = true;
		
	} break;

}

