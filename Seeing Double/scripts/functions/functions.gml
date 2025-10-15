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

//Sets up the title screen menu
function titleScreenIntro() {

	global.titleScreenMenuActive = true;
	global.playerControl = false;
	
	obj_control.alarm[1] = global.delayBeforeTitleScreen;

	if playerIsPresent() {
	
		with obj_player {
		
			happyPicnic = true;
			sprite_index = happySprite;
		
		}
	
	}


}