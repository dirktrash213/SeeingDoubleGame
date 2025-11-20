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

}


