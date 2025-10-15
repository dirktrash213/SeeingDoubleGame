#macro VIEW_WIDTH 1280
#macro VIEW_HEIGHT 720

//window_set_size(VIEW_WIDTH, VIEW_HEIGHT);




global.coinCount = 0;
global.defeatCount = 0;

global.playerControl = true;
global.playerDefeated = false;
global.playerRespawnTime = 90;
global.controllerPort = 0;
global.lastInputWasController = false;

function scr_isControllerConnected() {

	var _connected = false;
	var gp_num = gamepad_get_device_count();
	for (var i = 0; i < gp_num; i++;) {
		
	    if gamepad_is_connected(i) _connected = true;
		
	}
		
	return _connected;

}

function playerIsPresent() {

	return instance_exists(obj_player);

}

function pitterPlayerIsPresent() {

	return instance_exists(obj_player_pitter);

}

function patterPlayerIsPresent() {

	return instance_exists(obj_player_patter);

}