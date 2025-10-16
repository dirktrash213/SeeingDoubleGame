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

	scribble_anim_wave(1, 0.1, 0.1);
	
	particleSetup();

	global.titleScreenMenuActive = true;
	global.playerControl = false;
	
	obj_control.alarm[1] = global.delayBeforeTitleScreen;

	if playerIsPresent() {
	
		with obj_player {
		
			happyPicnic = true;
			sprite_index = happySprite;
			alarm[0] = heartParticleSpawnRate;
		
		}
	
	}

}

function checkForConfirm() {

	confirm = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) ||
	gamepad_button_check_pressed(global.controllerPort, gp_face1) || gamepad_button_check_pressed(global.controllerPort, gp_start);

}

function particleSetup() {

	effect_create_above(ef_cloud, 100, 100, 1000, c_white);
	
	//Title screen particle effects
	global.particleSystemHearts = part_system_create_layer("HeartParticles", false);
	global.particleSystemDevice = part_system_create();
	
	global.particleHeartPink = part_type_create();
	global.particleHeartBlue = part_type_create();
	global.particleSparkDevice = part_type_create();
	global.particleWherePatter = part_type_create();
	global.particleWhereCherries = part_type_create();

	var _heartDirMin = 60;
	var _heartDirMax = 120;
	
	var _sparkDirMin = 90;
	var _sparkDirMax = 90;
	
	var _sparkSpdMin = 2;
	var _sparkSpdMax = 4;

	part_type_sprite(global.particleHeartPink, spr_particle_heart_pink, 0, 0, 0);
	part_type_speed(global.particleHeartPink, 1, 2, 0, 0);
	part_type_direction(global.particleHeartPink, _heartDirMin, _heartDirMax, 0, 0);
	
	part_type_sprite(global.particleHeartBlue, spr_particle_heart_blue, 0, 0, 0);
	part_type_speed(global.particleHeartBlue, 1, 2, 0, 0);
	part_type_direction(global.particleHeartBlue, _heartDirMin, _heartDirMax, 0, 0);
	
	part_type_sprite(global.particleSparkDevice, spr_background_pixel, 0, 0, 0);
	part_type_speed(global.particleSparkDevice, _sparkSpdMin, _sparkSpdMax, 0, 0);
	part_type_direction(global.particleSparkDevice, _sparkDirMin, _sparkDirMax, 0, 0);
	
	part_type_sprite(global.particleWherePatter, spr_particle_wherePatter, 0, 0, 0);
	part_type_speed(global.particleWherePatter, 0.2, 2, 0, 0);
	part_type_direction(global.particleWherePatter, 60, 120, 0, 0);
	
	part_type_sprite(global.particleWhereCherries, spr_particle_whereCherries, 0, 0, 0);
	part_type_speed(global.particleWhereCherries, 0.2, 0.2, 0, 0);
	part_type_direction(global.particleWhereCherries, 90, 90, 0, 0);
	part_type_life(global.particleWhereCherries, 300, 300);
	
}