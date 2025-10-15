room_goto(targetRoom);

if pitterPlayerIsPresent() {

	var _yOffset = abs(obj_player_pitter.y - ySpawn);

	obj_player_pitter.x = xSpawn;
	obj_player_pitter.y = ySpawn - _yOffset;

}