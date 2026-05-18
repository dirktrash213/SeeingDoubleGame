//obj_player.stuckOnBoulder = false;


room_goto(targetRoom);
part_system_clear(global.particleSystemDevice);

//show_debug_message("gf4wegt4yg4")

if switchToVertical global.verticalLevel = true;
if switchToHorizontal global.verticalLevel = false;

if pitterPlayerIsPresent() {

	if horizontalWarp {

		var _yOffset = abs(obj_player_pitter.y - yEnter);
		
		//show_debug_message(_yOffset)

		var _offsetX;
		
		_offsetX = xSpawn == 1 ? 3 : -3; //This offset prevents the player from spawning on the target room's warp

		obj_player_pitter.x = xSpawn + _offsetX;
		obj_player_pitter.y = ySpawn - _yOffset;
		
		//global.patterOffsetX = 0;
		//global.patterOffsetY = 320;
		
	} else {
	
		var _xOffset = abs(obj_player_pitter.x - xEnter);

		obj_player_pitter.x = xSpawn + _xOffset;
		obj_player_pitter.y = ySpawn;
		
		//global.patterOffsetX = 528;
		//global.patterOffsetY = 0;
	
	}
	
	//if canRespawnPlayer {
	//
	//	obj_player_pitter.xRespawn = xSpawn;
	//	obj_player_pitter.yRespawn = ySpawn;
	//
	//}

}

if boulderFallingWarp {

	obj_control.alarm[4] = 2;

}

if room == rm_hills_warpRoom && !ignoreDoorWarp {
	
	global.splitScreenActive = true;
	
	instance_create_layer(x, y, "Instances", obj_player_patter);

	audio_stop_sound(amb_scifiCave);
	audio_play_sound(sfx_portal_jump, 1, false);

	if targetRoom == rm_forest_splitScreenTutorial {
	
		global.cherryCount = 3;
	
	}
	
	if targetRoom == rm_cave_entrance {
	
		global.coinCount = 800;
		global.cherryCount = 34;
		
		global.doubleJumpActive = true;
		global.escapedForestGhost = true;
		
	}
	
	if targetRoom == rm_lab_entrance {
	
		global.coinCount = 1600;
		global.cherryCount = 85;
		
		global.doubleJumpActive = true;
		global.groundPoundActive = true;
		global.escapedForestGhost = true;
		global.caveChaseOver = true;
		
	}

}

/*
if patterPlayerIsPresent() {

	if horizontalWarp {

		var _yOffset = abs(obj_player_patter.y - yEnter);
		
		show_debug_message(_yOffset)

		obj_player_patter.x = xSpawn;
		obj_player_patter.y = ySpawn - _yOffset;
		
	} else {
	
		var _xOffset = abs(obj_player_patter.x - xEnter);

		obj_player_patter.x = xSpawn + _xOffset;
		obj_player_patter.y = ySpawn;
	
	}

}