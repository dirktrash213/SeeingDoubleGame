loadRoom();

if patterPlayerIsPresent() && instance_exists(obj_trigger_patterRespawn) && global.loadingFirstTimePatter {
			
	//show_debug_message("patter loaded")
	
	global.loadingFirstTimePatter = false;
	
	if pitterPlayerIsPresent() var _patterRespawnLocation = instance_nearest(obj_player_pitter.x, obj_player_pitter.y, obj_trigger_patterRespawn);
	
	//obj_player_patter.x = obj_trigger_patterRespawn.x;
	//obj_player_patter.y = obj_trigger_patterRespawn.y;
	
	obj_player_patter.x = _patterRespawnLocation.x;
	obj_player_patter.y = _patterRespawnLocation.y;

}


if global.coopActive layer_set_visible(layer_get_id("SecretTiles"), false);

show_debug_message(room_get_name(room));

show_debug_message("obj_player_pitter.x: " + string(obj_player_pitter.x))
show_debug_message("obj_player_pitter.y: " + string(obj_player_pitter.y))

show_debug_message("obj_player_patter.x: " + string(obj_player_patter.x))
show_debug_message("obj_player_patter.y: " + string(obj_player_patter.y))

show_debug_message("----------------------------------------------------")

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

