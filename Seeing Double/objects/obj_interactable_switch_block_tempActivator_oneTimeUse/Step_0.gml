if global.paused alarm[0]++;

if bonked && !inert && (visible || secret) {

	sprite_index = spr_interactable_switch_inert;

	visible = true;
	
	inert = true;
	bonked = false;
	
	gravity = 0.5;
	vspeed = -3;
	
	alarm[0] = timerDuration;
	
	with obj_pickup_coin_empty {
		
		var _image_index = image_index;
	
		with instance_create_layer(x, y, "Collectables", obj_pickup_coin_temporary) {
		
			image_index = _image_index;
		
		}
		
		instance_destroy();
	
	}

}

if y > ystart {
	
	//instance_destroy();
	
	y = ystart;
	gravity = 0;
	vspeed = 0;
	
}