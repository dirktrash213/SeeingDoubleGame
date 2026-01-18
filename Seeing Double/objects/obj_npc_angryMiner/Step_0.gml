if !pitterPlayerIsPresent() exit;

//image_xscale = obj_player_pitter.x > x ? -1 : 1;
image_xscale = -1;


if y > ystart {

	y = ystart;
	gravity = 0;
	vspeed = 0;
	alarm[0] = delayBeforeJump;

}