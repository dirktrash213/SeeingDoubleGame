normalizeStretching();

if y > ystart {

	y = ystart;
	gravity = 0;
	vspeed = 0;

}

if lookingAtPlayer {

	image_xscale = obj_player_pitter.x > x ? -1 : 1;

}
