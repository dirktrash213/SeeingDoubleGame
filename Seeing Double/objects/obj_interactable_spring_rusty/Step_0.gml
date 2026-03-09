if isLastAnimationFrame() {

	image_speed = 0;
	image_index = 0;

}

if attachedToPlatform {

	//x = platform.x;
	//y = platform.y - sprite_height;
	
	var _xDiff = platform.xstart - xstart;

	x = platform.x - _xDiff;
	y = platform.y - sprite_height;

}

if attachedToBreakableFloor {

	if !instance_exists(breakableFloor) {
		
		if !falling {
		
			falling = true;
			
			gravity = 0.5;
			
		}
	
	}

}



