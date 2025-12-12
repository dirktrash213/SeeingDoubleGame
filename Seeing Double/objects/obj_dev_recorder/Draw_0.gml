if (recording) {
   
	if pitterPlayerIsPresent() {

		draw_set_halign(fa_center);

		drawWhiteTextWithBlackOutline(obj_player_pitter.x, obj_player_pitter.y, "RECORDING...");
		//drawWhiteTextWithBlackOutline(obj_player_pitter.x, obj_player_pitter.y, "Frames: " + string(array_length(frames)));
		
		draw_set_halign(fa_left);
	
	}
	
	if patterPlayerIsPresent() {

		draw_set_halign(fa_center);

		drawWhiteTextWithBlackOutline(obj_player_patter.x, obj_player_patter.y, "RECORDING...");
		//drawWhiteTextWithBlackOutline(obj_player_pitter.x, obj_player_pitter.y, "Frames: " + string(array_length(frames)));
		
		draw_set_halign(fa_left);
	
	}
	
	//show_debug_message("drawing to GUI for recording tool")
	
}


