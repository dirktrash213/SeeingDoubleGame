/// @description Afterimages

if abs(xSpeed) >= moveSpeed[1] || groundPoundFalling {
//if abs(xSpeed) >= moveSpeed[1] {

	var _sprite_index = sprite_index;
	var _image_index = image_index;
	var _xScale = moveDir;
	var _depth = depth;
	var _xStretch = xStretch;
	var _yStretch = yStretch;
	var _blend = image_blend;
	
	with instance_create_layer(x,y, "Instances", obj_vfx_afterimage) {
	
		//show_debug_message("afterimages spawning")
		
		if _xScale == 0 _xScale = 1; 
	
		sprite_index = _sprite_index;
		image_index = _image_index;
		image_xscale = _xScale * _xStretch;
		image_yscale = image_yscale * _yStretch;
		image_speed = 0;
		//depth = _depth + 10;
		image_blend = _blend;
		
		if sprite_index == spr_pitter_run sprite_index = spr_pitter_run_silent;
		if sprite_index == spr_patter_run sprite_index = spr_patter_run_silent;
		if sprite_index == spr_patter_scared_run sprite_index = spr_patter_scared_run_silent;
		
	}

}

if spawnAfterimages {

	var _sprite_index = sprite_index;
	var _image_index = image_index;
	//var _xScale = moveDir;
	var _depth = depth;
	var _xStretch = xStretch;
	var _yStretch = yStretch;
	var _blend = c_lime;
	
	with instance_create_layer(x,y, "Instances", obj_vfx_afterimage) {
	
		sprite_index = _sprite_index;
		image_index = _image_index;
		//image_xscale = _xScale * _xStretch;
		image_xscale = _xStretch;
		image_yscale = image_yscale * _yStretch;
		image_speed = 0;
		//image_alpha = 1.0;
		//depth = -12000;
		image_blend = _blend;
		
		if sprite_index == spr_pitter_run sprite_index = spr_pitter_run_silent;
		if sprite_index == spr_patter_run sprite_index = spr_patter_run_silent;
		if sprite_index == spr_patter_scared_run sprite_index = spr_patter_scared_run_silent;
		
	}

}



alarm[4] = afterimageSpawnRate;

