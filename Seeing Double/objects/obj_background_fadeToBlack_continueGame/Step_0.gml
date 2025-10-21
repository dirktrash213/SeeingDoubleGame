if fadingIn {
	
	image_alpha = image_alpha < 1.0 ? image_alpha + fadeInRate : 1.0;
	if image_alpha == 1.0 {
		
		fadingIn = false;
		
		global.readytoDisplayTitleScreenMenu = false;
		global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.PAD_FIRED;
		
		if playerIsPresent() {
		
			with obj_player {
			
				happyPicnic = false;
			
			}
		
		}
		
		global.playerControl = true;
		
		if !global.splitScreenActive instance_destroy(obj_player_patter);
		
		loadGame();
		
		//show_debug_message("Room to spawn in: " + string(asset_get_index(global.roomToSpawnIn)))
		
		room_goto(asset_get_index(global.roomToSpawnIn));
		//room_goto(obj_player_patter.roomRespawn);
		
		obj_player_pitter.x = global.xRespawnPitter;
		obj_player_pitter.y = global.yRespawnPitter;
		
		loadGame();
		
	}

}
	
if fadingOut {
	
	image_alpha = image_alpha > 0.0 ? image_alpha - fadeInRate : 0.0;
	if image_alpha == 0.0 instance_destroy();

}





