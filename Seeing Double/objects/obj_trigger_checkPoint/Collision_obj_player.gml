if !canCollideWithPlayer exit;

canCollideWithPlayer = false;

alarm[0] = collideCooldown;

if pitterPlayerIsPresent() {

	if canRespawnPlayer {
	
		//obj_player_pitter.xRespawn = x;
		//obj_player_pitter.yRespawn = y;
		//obj_player_pitter.roomRespawn = room;
		global.xRespawnPitter = x;
		global.yRespawnPitter = y;
		
		var _patterRespawnPoint = instance_nearest(x, y, obj_trigger_patterRespawn);
		
		global.xRespawnPatter = _patterRespawnPoint.x;
		global.yRespawnPatter = _patterRespawnPoint.y;
		global.roomToSpawnIn = room_get_name(room);
	
	}

}

saveGame();