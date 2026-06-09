if attachedToPlatform {

	var _xDiff = platform.xstart - xstart;

	x = platform.x - _xDiff;
	y = platform.y - sprite_height;

}


image_index = active ? 0 : 1;