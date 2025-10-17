room_goto(targetRoom);

if pitterPlayerIsPresent() {

	if horizontalWarp {

		var _yOffset = abs(obj_player_pitter.y - yEnter);

		obj_player_pitter.x = xSpawn;
		obj_player_pitter.y = ySpawn - _yOffset;
		
	} else {
	
		var _xOffset = abs(obj_player_pitter.x - xEnter);

		obj_player_pitter.x = xSpawn + _xOffset;
		obj_player_pitter.y = ySpawn;
	
	}
	
	//if canRespawnPlayer {
	//
	//	obj_player_pitter.xRespawn = xSpawn;
	//	obj_player_pitter.yRespawn = ySpawn;
	//
	//}

}