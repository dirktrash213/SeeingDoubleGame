if !pitterPlayerIsPresent() exit;

if lookingAtPlayer {
	
	image_xscale = obj_player_pitter.x > x ? -1 : 1;
	
} else {

	image_xscale = 1;

}




