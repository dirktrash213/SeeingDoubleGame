if !canCollideWithPlayer exit;

canCollideWithPlayer = false;

alarm[0] = collideCooldown;

if pitterPlayerIsPresent() {

	if canRespawnPlayer {
	
		obj_player_pitter.xRespawn = x;
		obj_player_pitter.yRespawn = y;
		obj_player_pitter.roomRespawn = room;
	
	}

}

saveGame();