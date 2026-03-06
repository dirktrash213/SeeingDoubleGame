if fadingIn {
	
	image_alpha = image_alpha < 1.0 ? image_alpha + fadeInRate : 1.0;
	if image_alpha == 1.0 {
		
		fadingIn = false;
		
		global.readytoDisplayTitleScreenMenu = false;
		global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.PAD_FIRED;
		global.cutsceneActive = false;
		global.currentCutsceneID = CUTSCENE_ID.NONE;
		
		if playerIsPresent() {
		
			with obj_player {
			
				happyPicnic = false;
			
			}
		
		}
		
		global.playerControl = true;
		
		loadGame();
		
		//show_debug_message("Room to spawn in: " + string(asset_get_index(global.roomToSpawnIn)))
		
		global.roomToSpawnIn = "rm_cave_groundPoundGauntlet_horizontalElevators"; //TEMP
		
		room_goto(asset_get_index(global.roomToSpawnIn));
		//room_goto(obj_player_patter.roomRespawn);
		
		//global.currentCheckpoint = instance_nearest(obj_player_pitter.x, obj_player_pitter.y, obj_trigger_checkPoint);
		//
		//if !global.currentCheckpoint.portalCheckpoint {
		//
		//	global.portalsActive = false;
		//
		//} else {
		//
		//	show_debug_message("Portals have been activated via respawn")
		//	global.portalsActive = true;
		//	//global.yRespawnPitter = global.currentCheckpoint.portalPatterYspawnOffset;
		//	global.yRespawnPitter = -144;
		//
		//}
		
		//TEMP
		//global.portalsActive = true;
		//global.patterOffsetY = -144;
		
		obj_player_pitter.x = global.xRespawnPitter;
		obj_player_pitter.y = global.yRespawnPitter;
		
		if audio_is_playing(amb_soft_wind) {
			
			audio_stop_sound(amb_soft_wind);
			//audio_sound_loop(bgm_soft_wind, false);
			
		}
		
		loadGame();
		
		if !global.splitScreenActive instance_destroy(obj_player_patter);
		
	}

}
	
if fadingOut {
	
	image_alpha = image_alpha > 0.0 ? image_alpha - fadeInRate : 0.0;
	if image_alpha == 0.0 instance_destroy();

}





