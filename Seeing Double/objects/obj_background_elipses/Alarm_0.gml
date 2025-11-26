instance_destroy();


switch global.currentCutsceneID {

	case CUTSCENE_ID.OPENING: {
	
		if pitterPlayerIsPresent() {

			with obj_player_pitter {
		
				if thinkingPicnic {
	
					thinkingPicnic = false;
					wonderingAboutCherriesPicnic = true;
			
					var _offsetY = -16;

					part_particles_create(global.particleSystemHearts, x, y + _offsetY, global.particleWhereCherries, 1);
		
					obj_control.alarm[1] = curiousDuration;
		
				}
	
			}

		}

	} break;
	
	case CUTSCENE_ID.SPLIT_SCREEN_ACTIVATE: {
	
		obj_cutsceneSystem.cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.PITTER_SHOUTING_LEFT;
		obj_cutsceneSystem.alarm[1] = 60; 
		part_particles_create(global.particleSystemDevice, x, y - 10, global.particleCallForPatter, 1);
		audio_play_sound(sfx_mouseChirp, 1, 0);
	
	} break;
	
	case CUTSCENE_ID.FOREST_HAUNTING: {
	
		instance_destroy();
	
	} break;


}












