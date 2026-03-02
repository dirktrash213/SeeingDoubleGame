if global.paused {

	alarm[0]++;
	alarm[1]++;
	
	exit;

}

switch global.currentCutsceneID {

	case CUTSCENE_ID.DOUBLE_JUMP_BARREL: { 
		
		switch cutsceneState {

			case DOUBLE_JUMP_BARREL_CUTSCENE_STATE.SOAKING: {
	
				with obj_camera {
	
					if cameraLeadingX > 0 cameraLeadingX--;
					if cameraLeadingX < 0 cameraLeadingX++;
	
				}
		
			} break;
			
		}
	
	} break;
	
	case CUTSCENE_ID.GROUND_POUND_BARREL: { 
		
		switch cutsceneState {

			case GROUND_POUND_BARREL_CUTSCENE_STATE.SOAKING: {
	
				with obj_camera {
	
					if cameraLeadingX > 0 cameraLeadingX--;
					if cameraLeadingX < 0 cameraLeadingX++;
	
				}
		
			} break;
			
		}
	
	} break;

}


