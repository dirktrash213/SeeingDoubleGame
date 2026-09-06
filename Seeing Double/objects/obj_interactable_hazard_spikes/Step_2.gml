coopObjectStepEventCode(60);
mask_index = sprite_index;

if attachedToPlatform {

	var _xDiff = platform.xstart - xstart;

	x = platform.x - _xDiff;
	y = platform.y - sprite_height;

}


if attachedToSolidPlatform {

	solidPlatform = instance_nearest(x + 8,y + 16, obj_block_wall_moving);

	if !instance_exists(solidPlatform) {
	
		//show_debug_message("spike deleted")
	
		instance_destroy();
		exit;
	
	}
	
	//show_debug_message("solidPlatform: " + string(solidPlatform))

	var _xDiff = solidPlatform.xstart - xstart;

	x = solidPlatform.x - _xDiff;
	y = solidPlatform.y - sprite_height;

}

coopSyncDuplicateObjects();

