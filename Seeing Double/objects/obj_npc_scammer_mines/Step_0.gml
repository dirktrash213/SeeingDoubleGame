normalizeStretching();


//if jumping && y > ystart {
//
//	y = ystart;
//	gravity = 0;
//	vspeed = 0;
//	alarm[1] = delayBeforeJump;
//
//}

if y > ystart {

	y = ystart;
	gravity = 0;
	vspeed = 0;

	if jumping {
	
		alarm[1] = delayBeforeJump;
	
	}

}

if lookingAtPlayer {

	image_xscale = obj_player_pitter.x > x ? -1 : 1;

}
