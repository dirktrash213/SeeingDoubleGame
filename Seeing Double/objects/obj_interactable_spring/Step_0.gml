coopObjectStepEventCode();

//if invisCoop {
//
//	if mask_index == spr_empty {
//	
//		show_debug_message("mask index is empty")
//	
//	} else {
//
//		show_debug_message("mask index is not empty")
//
//	}
//
//}

if isLastAnimationFrame() {

	image_speed = 0;
	image_index = 0;

}

if attachedToPlatform {

	x = platform.x;
	y = platform.y - sprite_height;

}



