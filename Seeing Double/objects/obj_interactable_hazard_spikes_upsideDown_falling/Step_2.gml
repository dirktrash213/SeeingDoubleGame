if attachedToPlatform {

	var _xDiff = platform.xstart - xstart;

	var _offsetY = 32;

	x = platform.x - _xDiff;
	y = platform.y - sprite_height + _offsetY;

}


if playerIsPresent() && !active {

	var _offsetX = detectionDistanceX;
	var _offsetY = detectionDistanceY;
	
	var _inst;
	_inst = collision_rectangle(x - _offsetX, y, x + _offsetX, y + _offsetY, obj_player, false, true);
	
	if _inst != noone {
	
		active = true;
		alarm[0] = dropDelay;
		vibratingLeft = true;
		hspeed = vibratingSpeed;
	
	}

}

if active && alarm[0] > -1 {

	if vibratingLeft && x > xstart {
		
		hspeed = -vibratingSpeed;
		vibratingLeft = false;
		vibratingRight = true;
		
	}
	
	if vibratingRight && x < xstart {
		
		hspeed = vibratingSpeed;
		vibratingLeft = true;
		vibratingRight = false;
		
	}

}




