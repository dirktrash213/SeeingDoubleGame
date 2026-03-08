if isLastAnimationFrame() {

	image_speed = 0;
	image_index = 0;

}

if attachedToPlatform {

	x = platform.x;
	y = platform.y - sprite_height;

}



		
if attachedToBreakableFloor && !instance_exists(breakableFloor) && !falling {

	falling = true;
	
	gravity = 0.5;
	
}

