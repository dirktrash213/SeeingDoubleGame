loadRoom();

if patterPlayerIsPresent() && instance_exists(obj_trigger_patterRespawn) && global.loadingFirstTimePatter {
			
	//show_debug_message("patter loaded")
	
	global.loadingFirstTimePatter = false;
	
	obj_player_patter.x = obj_trigger_patterRespawn.x;
	obj_player_patter.y = obj_trigger_patterRespawn.y;

}



//if room == rm_cave_entrance
//|| room == rm_lab_entrance {
//
//	scribble_anim_blink(30, 30, 0);
//	
//	calculateRegionalTime();
//
//	//blinkingSpeedrunText = "[blink][spr_icon_clock_x2]" + global.gameTimeString;
//	blinkingSpeedrunText = "[blink][spr_icon_clock_x2]" + global.gameTimeStringRegional;
//	showingBlinkingSpeedrunText = true;
//	alarm[5] = 500;
//	
//}
//

