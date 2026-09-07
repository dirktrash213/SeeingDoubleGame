if other.object_index == obj_player_patter && !global.coopActive exit;

//var _collidingPlayer = other.object_index == obj_player_pitter ? obj_player_pitter : obj_player_patter;
//var _secondaryPlayer = _collidingPlayer == obj_player_pitter ? obj_player_patter : obj_player_pitter;

//show_debug_message(object_get_name(other.object_index) + " is the colliding object")

//if object_index == obj_player_pitter {

//show_debug_message("collided with warp id: " + string(id))

room_goto(targetRoom);
//room_goto(rm_cave_descent);
part_system_clear(global.particleSystemDevice);

show_debug_message("target room: " + string(room_get_name(targetRoom)))

//if switchToVertical global.verticalLevel = true;
//if switchToHorizontal global.verticalLevel = false;

if pitterPlayerIsPresent() {

	if global.coopActive && patterPlayerIsPresent() {
	
		if other.object_index == obj_player_pitter {
			
			obj_player_patter.ySpeed = other.ySpeed;
			obj_player_patter.coyoteHangTimer = 0;
			obj_player_patter.climbing = other.climbing;
			
		}
		
		if other.object_index == obj_player_patter {
			
			obj_player_pitter.ySpeed = other.ySpeed;
			obj_player_pitter.coyoteHangTimer = 0;
			obj_player_pitter.climbing = other.climbing;
			
		}
	
	}

	if horizontalWarp {

		//var _offsetY = abs(obj_player_pitter.y - yEnter);
		//
		//if other.object_index == obj_player_patter {
		//
		//	_offsetY = abs(obj_player_patter.y - yEnter - global.patterOffsetY);
		//	//if array_contains(global.customRoomArray, targetRoom) _offsetY = abs(obj_player_patter.y - yEnter - global.defaultCustomLevelPatterOffsetY);
		//
		//}
		//
		////show_debug_message("_offsetY: " + string(_offsetY))
		//
		//var _offsetX;
		//
		//_offsetX = xSpawn == 1 ? 3 : -3; //This offset prevents the player from spawning on the target room's warp
		//
		//obj_player_pitter.x = xSpawn + _offsetX;
		//obj_player_pitter.y = ySpawn - _offsetY;
		//
		//if global.coopActive && patterPlayerIsPresent() {
		//
		//	obj_player_patter.x = xSpawn + _offsetX;
		//	obj_player_patter.y = ySpawn - _offsetY + global.patterOffsetY;
		//
		//	//if array_contains(global.customRoomArray, targetRoom) {
		//	//
		//	//	obj_player_patter.y = ySpawn - _offsetY + global.defaultCustomLevelPatterOffsetY;
		//	//
		//	//} else {
		//	//
		//	//	obj_player_patter.y = ySpawn - _offsetY + global.patterOffsetY;
		//	//
		//	//}
		//
		//} 
		
		var _offsetAmount = 3;
		
		var _offsetX = xSpawn == 1 ? _offsetAmount : -_offsetAmount; //This offset prevents the player from spawning on the target room's warp
		//var _offsetY = -abs(other.y - yEnter);
		var _offsetY = -abs(other.y - (y + sprite_height));
		//var _offsetY = -abs(other.y - 463);

		if other.object_index == obj_player_pitter {

			obj_player_pitter.x = xSpawn + _offsetX;
			obj_player_pitter.y = ySpawn + _offsetY;
			//obj_player_pitter.y = ySpawn - _offsetY;
		
			if global.coopActive && patterPlayerIsPresent() {
		
				if !array_contains(global.verticalRoomArray, targetRoom) {
			
					if !array_contains(global.customRoomArray, targetRoom) { //Target room is horizontal
				
						obj_player_patter.x = obj_player_pitter.x;
						obj_player_patter.y = obj_player_pitter.y + global.defaultPatterOffsetY;
				
					} else { //Target room is custom sized
					
						obj_player_patter.x = obj_player_pitter.x;
						obj_player_patter.y = obj_player_pitter.y + global.defaultCustomLevelPatterOffsetY;
				
					}
			
				} else { //Target room is vertical
			
					obj_player_patter.x = obj_player_pitter.x + global.defaultPatterOffsetX;
					obj_player_patter.y = obj_player_pitter.y;
					
				}
		
			} 
		
		} else { //other.object_index is obj_player_patter
			
			if !array_contains(global.verticalRoomArray, targetRoom) {
				
				if !array_contains(global.customRoomArray, targetRoom) { //Target room is horizontal
				
					obj_player_patter.x = xSpawn + _offsetX;
					obj_player_patter.y = ySpawn + global.defaultPatterOffsetY + _offsetY;
				
					obj_player_pitter.x = obj_player_patter.x;
					obj_player_pitter.y = obj_player_patter.y - global.defaultPatterOffsetY;
				
				} else { //Target room is custom sized
			
					obj_player_patter.x = xSpawn + _offsetX;
					obj_player_patter.y = ySpawn + global.defaultCustomLevelPatterOffsetY + _offsetY;
				
					obj_player_pitter.x = obj_player_patter.x;
					obj_player_pitter.y = obj_player_patter.y - global.defaultCustomLevelPatterOffsetY;
				
				}
				
			} else { //Target room is vertical
		
				obj_player_patter.x = xSpawn + global.defaultPatterOffsetX + _offsetX;
				obj_player_patter.y = ySpawn + _offsetY;
			
				obj_player_pitter.x = obj_player_patter.x - global.defaultPatterOffsetX;
				obj_player_pitter.y = obj_player_patter.y;
			
			}
		
		} 
		
		//show_debug_message("obj_player_pitter.x: " + string(obj_player_pitter.x))
		//show_debug_message("obj_player_pitter.y: " + string(obj_player_pitter.y))
		//
		//show_debug_message("obj_player_patter.x: " + string(obj_player_patter.x))
		//show_debug_message("obj_player_patter.y: " + string(obj_player_patter.y))
		
	} else { //vertical warp
	
		var _offsetX = abs(other.x - x);

		if other.object_index == obj_player_pitter {

			obj_player_pitter.x = xSpawn + _offsetX;
			obj_player_pitter.y = ySpawn;
		
			if global.coopActive && patterPlayerIsPresent() {
		
				if !array_contains(global.verticalRoomArray, targetRoom) {
			
					if !array_contains(global.customRoomArray, targetRoom) {
				
						obj_player_patter.x = obj_player_pitter.x;
						obj_player_patter.y = obj_player_pitter.y + global.patterOffsetY;
				
					} else {
					
						obj_player_patter.x = obj_player_pitter.x;
						obj_player_patter.y = obj_player_pitter.y + global.defaultCustomLevelPatterOffsetY;
				
					}
			
				} else {
			
					obj_player_patter.x = obj_player_pitter.x + global.patterOffsetX;
					obj_player_patter.y = obj_player_pitter.y;
			
				}
		
			} 
		
		} else { //other.object_index is obj_player_patter
			
			if !array_contains(global.verticalRoomArray, targetRoom) {
				
				if !array_contains(global.customRoomArray, targetRoom) {
				
					obj_player_patter.x = xSpawn + _offsetX;
					obj_player_patter.y = ySpawn + global.patterOffsetY;
				
					obj_player_pitter.x = obj_player_patter.x;
					obj_player_pitter.y = obj_player_patter.y - global.patterOffsetY;
				
				
				} else {
			
					obj_player_patter.x = xSpawn + _offsetX;
					obj_player_patter.y = ySpawn + global.defaultCustomLevelPatterOffsetY;
				
					obj_player_pitter.x = obj_player_patter.x;
					obj_player_pitter.y = obj_player_patter.y - global.defaultCustomLevelPatterOffsetY;
				
				}
				
			} else {
		
				obj_player_patter.x = xSpawn + global.patterOffsetX + _offsetX;
				obj_player_patter.y = ySpawn;
			
				obj_player_pitter.x = obj_player_patter.x - global.patterOffsetX;
				obj_player_pitter.y = obj_player_patter.y;
			
			}
		
		}
	
	}

}

if boulderFallingWarp {

	obj_control.alarm[4] = 2;

}

if room == rm_hills_warpRoom && !ignoreDoorWarp { //For warping out of the warp room

	global.splitScreenActive = true;

	if !patterPlayerIsPresent() {
		
		instance_create_layer(obj_player_pitter.x, obj_player_pitter.y + global.patterOffsetY, "Instances", obj_player_patter);
		
	}

	audio_stop_sound(amb_scifiCave);
	audio_play_sound(sfx_portal_jump, 1, false);

	if targetRoom == rm_forest_splitScreenTutorial {
		
		
		
		//targetRoom = rm_forest_caveEntrance; //TEMP
		//room_goto(targetRoom); //TEMP
		
		global.cherryCount = 3;
	
		global.disableSpeedrunForest = true;

	}

	if targetRoom == rm_cave_entrance {

		global.coinCount = 800;
		global.cherryCount = 34;
	
		global.doubleJumpActive = true;
		global.escapedForestGhost = true;
	
		global.disableSpeedrunForest = true;
	
	}

	if targetRoom == rm_lab_entrance {

		global.coinCount = 1600;
		global.cherryCount = 85;
	
		global.doubleJumpActive = true;
		global.groundPoundActive = true;
		global.escapedForestGhost = true;
		global.caveChaseOver = true;
	
		global.disableSpeedrunCave = true;
	
	}

}

