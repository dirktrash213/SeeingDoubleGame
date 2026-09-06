loadRoom();

if patterPlayerIsPresent() && instance_exists(obj_trigger_patterRespawn) && global.loadingFirstTimePatter {
			
	//show_debug_message("patter loaded")
	
	global.loadingFirstTimePatter = false;
	
	 var _halfWidth = 2; // Gives 4 pixels of horizontal leeway total (x - 2 to x + 2)
	 var _halfHeight = 2; // Gives 4 pixels of vertical leeway total (y - 2 to y + 2)
	 var _step = 4;      // Distance to jump per scan step (lower = more precise, higher = faster)
	 var _maxDist = 2000; // Maximum downward search distance in pixels
    
	 var _foundPoint = noone;
	   
	if global.verticalLevel {
	
		var _checkX = obj_player_pitter.x;
    
	    // Scan rightward until a trigger is hit or max distance is reached
	    while (_checkX <= obj_player_pitter.x + _maxDist && _foundPoint == noone) {
	        _foundPoint = collision_rectangle(_checkX, obj_player_pitter.y - _halfHeight, _checkX + _step, obj_player_pitter.y + _halfHeight, obj_trigger_patterRespawn, false, true);
	        _checkX += _step;
	    }
	
	} else {
	
		var _checkY = obj_player_pitter.y;
		//var _checkY = obj_player_pitter.x;
    
	    // Scan downward until a trigger is hit or max distance is reached
	    while (_checkY <= obj_player_pitter.y + _maxDist && _foundPoint == noone) {
	        _foundPoint = collision_rectangle(obj_player_pitter.x - _halfWidth, _checkY, obj_player_pitter.x + _halfWidth, _checkY + _step, obj_trigger_patterRespawn, false, true);
	        _checkY += _step;
	    }
	
	}
    
	   // If a respawn point was found, update the global variables
	if (_foundPoint != noone) {
	      obj_player_patter.x = _foundPoint.x;
	      obj_player_patter.y = _foundPoint.y;
	} else {
	
		show_debug_message("no found point")
	
	}

}


if global.coopActive layer_set_visible(layer_get_id("SecretTiles"), false);

//show_debug_message(room_get_name(room));
//
//if pitterPlayerIsPresent() {
//
//	show_debug_message("obj_player_pitter.x: " + string(obj_player_pitter.x))
//	show_debug_message("obj_player_pitter.y: " + string(obj_player_pitter.y))
//
//}
//
//if patterPlayerIsPresent() {
//
//	show_debug_message("obj_player_patter.x: " + string(obj_player_patter.x))
//	show_debug_message("obj_player_patter.y: " + string(obj_player_patter.y))
//
//}
//
//show_debug_message("----------------------------------------------------")

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

