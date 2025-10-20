show_debug_message(image_alpha)

if fadingIn {
	
	image_alpha = image_alpha < 1.0 ? image_alpha + fadeInRate : 1.0;
	if image_alpha == 1.0 {
		
		fadingIn = false;
		
		global.readytoDisplayTitleScreenMenu = false;
		
		if playerIsPresent() {
		
			with obj_player {
			
				happyPicnic = false;
			
			}
		
		}
		
		global.playerControl = true;
		
		if !global.splitScreenActive instance_destroy(obj_player_patter);
		
		loadGame();
		
		//room_goto(asset_get_index(global.roomToSpawnIn));
		//room_goto(obj_player_patter.roomRespawn);
		
		loadGame();
		
	}

}
	
if fadingOut {
	
	image_alpha = image_alpha > 0.0 ? image_alpha - fadeInRate : 0.0;
	if image_alpha == 0.0 instance_destroy();

}





