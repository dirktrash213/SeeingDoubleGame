if !canCollideWithPlayer exit;

canCollideWithPlayer = false;

alarm[0] = collideCooldown;

checkpointTouched();

//if pitterPlayerIsPresent() {
//
//	if canRespawnPlayer {
//	
//		
//	
//		//obj_player_pitter.xRespawn = x;
//		//obj_player_pitter.yRespawn = y;
//		//obj_player_pitter.roomRespawn = room;
//		global.xRespawnPitter = x;
//		global.yRespawnPitter = y;
//		global.roomToSpawnIn = room_get_name(room);
//		
//		//global.portalsActiveStoredValue = global.portalsActive;
//		//
//		//if global.portalsActive {
//		//
//		//	global.portalsStoredPatterOffsetY = global.patterOffsetY;
//		//
//		//}
//		
//		//show_debug_message("global.xRespawnPitter: " + string(global.xRespawnPitter))
//		//show_debug_message("global.yRespawnPitter: " + string(global.yRespawnPitter))
//		
//		if global.splitScreenActive {
//		
//			var _patterRespawnPoint = instance_nearest(x, y, obj_trigger_patterRespawn);
//		
//			global.xRespawnPatter = _patterRespawnPoint.x;
//			global.yRespawnPatter = _patterRespawnPoint.y;
//			
//		
//		}
//	
//	}
//
//}

saveGame();