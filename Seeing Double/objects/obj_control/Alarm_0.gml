/// @description Respawn player

global.playerControl = true;
global.playerDefeated = false;

var _offsetY = 20;

if pitterPlayerIsPresent() {

	obj_player_pitter.x = obj_player_pitter.xRespawn;
	obj_player_pitter.y = obj_player_pitter.yRespawn - _offsetY;
	
}






