draw_sprite_ext(sprite_index, image_index, x, y, xScale, yScale, 0, -1, image_alpha);


if !fadingOut {

	//show_debug_message("xScale: " + string(xScale))

	xScale += xScaleIncreaseAmount;

	xScaleIncreaseAmount++;
	
	if xScale > 20 {
		
		//show_debug_message("patter is beamedup")
		//global.patterBeamedAway = true;
		
	}
	
	if xScale > 20000 {
	
		//show_debug_message("fading out white beam")
	
		fadingOut = true;
		
		//instance_destroy(obj_player_patter);
		
		instance_destroy(obj_background_picnicBasket);
		
		obj_background_device.image_blend = c_white;
	
	}

} else {

	var _fadeOutAmount = 0.01;

	image_alpha -= _fadeOutAmount;

	//show_debug_message(image_alpha)

}

if image_alpha <= 0 {

	if pitterPlayerIsPresent() {
	
		with obj_player_pitter {
		
			searchingForPatterPicnic = true;
			scaredPicnic = false;
			alarm[0] = wherePatterParticleSpawnRate;
			
			hspeed = freakoutSpeed;
			
			obj_control.alarm[1] = freakoutDuration;

		}
		
	} 

	instance_destroy();

}