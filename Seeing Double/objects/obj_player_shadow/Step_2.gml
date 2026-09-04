//show_debug_message("global.coopActive" + string(global.coopActive))
//show_debug_message("global.splitScreenActive" + string(global.splitScreenActive))

if !global.coopActive || !global.splitScreenActive {

	//show_debug_message("image alpha = 0")
	
	image_alpha = 0;

} else {

	//show_debug_message("image alpha = 1")

	image_alpha = transparencyAmount;

}

if instance_exists(cutout) {

	cutout.x = x;
	cutout.y = y - 4;

}








