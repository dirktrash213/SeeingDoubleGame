/// @description Cutscene activated

global.cutsceneActive = true;
global.playerControl = false;

if playerIsPresent() obj_player.jumpDisabled = true;


switch global.currentCutsceneID {

	case CUTSCENE_ID.SPLIT_SCREEN_ACTIVATE: {
	
		cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.NONE;
	
		//show_debug_message("split screen cutscene active")
	
	
	} break;


}

//show_debug_message("cutscene active")

