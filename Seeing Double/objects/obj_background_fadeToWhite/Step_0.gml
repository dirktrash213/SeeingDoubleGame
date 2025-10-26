if fadingIn {
	
	image_alpha = image_alpha < 1.0 ? image_alpha + fadeInRate : 1.0;
	
	if image_alpha == 1.0 {
		
		fadingIn = false;
		
		switch obj_cutsceneSystem.cutsceneState {
		
			case SPLIT_SCREEN_CUTSCENE_STATE.FADING_IN_WHITE: {
			
				obj_cutsceneSystem.cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.TEXT_TYPING;
			
			} break; 
				
		}
		
	}

}
	
if fadingOut {
	
	image_alpha = image_alpha > 0.0 ? image_alpha - fadeInRate : 0.0;
	if image_alpha == 0.0 instance_destroy();

}

if textOccilating {

	//Move in a circle
	dir += rotationSpeed;

	//Get our target positions
	var _targetX = xstart + lengthdir_x(radius, dir);
	var _targetY = ystart + lengthdir_y(radius, dir);

	//Get speeds
	//xSpeed = _targetX - x;
	xSpeed = 0;
	ySpeed = _targetY - y;
	//ySpeed = 0;



	//Move
	seeingTextOffsetX += xSpeed;
	seeingTextOffsetY += ySpeed;
	doubleTextOffsetX -= xSpeed;
	doubleTextOffsetY -= ySpeed;

}

if typist.get_state() == 1 {

	if alarm[2] = -1 && textOccilating {
	
		alarm[2] = 90;
	
	}

	radius += radiusIncreaseAmount;
	
	radius = min(radius, radiusMax);

}

