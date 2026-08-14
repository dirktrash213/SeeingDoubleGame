//if global.coopActive && invisCoop {
//	
//	//mask_index = visible ? sprite_index : spr_empty;
//	
//	// Radius around the player shadow where blocks become visible
//	var _revealRadius = 30; //Adjust this distance to fit your game
//	var _isNearShadow = false;
//
//	var _tempMaskIndex = mask_index;
//	mask_index = sprite_index;
//
//	// Check against all active player shadows (handles 1 player or Co-op!)
//	with (obj_player_shadow) {
//	    if (collision_circle(x, y, _revealRadius, other.id, true, false) != noone) {
//	        _isNearShadow = true;
//	        break; // Found a nearby shadow, no need to check other shadows
//	    }
//	}
//	
//	active = _isNearShadow;
//	mask_index = _tempMaskIndex;
//	
//	if active {
//		
//		visible = true;
//		mask_index = sprite_index;
//		alarm[10] = -1;
//		image_alpha = 1.0;
//		
//	} else {
//	
//		if alarm[10] == -1 alarm[10] = activeGraceTimer;
//		image_alpha = alarm[10] / activeGraceTimer; //Makes the temporary platform slowly fade out
//	
//	}
//	
//}

coopObjectStepEventCode();

if onRails {

	if path_speed != 0 storedSpeed = path_speed;

	path_speed = global.paused? 0 : storedSpeed;

	//path_speed = global.paused? 0 : 1;
	
	// 1. Calculate the speeds
	// Speed is the change in position over the last step (one frame).
	xSpeed = x - previousX;
	ySpeed = y - previousY;

	// 2. Update the previous position for the next frame's calculation
	previousX = x;
	previousY = y;

}