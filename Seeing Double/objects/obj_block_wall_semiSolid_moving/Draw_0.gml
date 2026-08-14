//if global.coopActive && invisCoop {
//	
//	var _drawColor = isOnPitterScreen ? patterColor : pitterColor;
//	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, _drawColor, image_alpha);
//	
//} else {
//
//	draw_self();
//
//}

coopObjectDrawEventCode();

//if path_exists(path_platform_test) {
if onRails && object_index != obj_block_wall_semiSolid_moving_elevator {

	//draw_path(path_platform_test, xstart + sprite_width/2, ystart + sprite_height/2, false);
	draw_path(railPath, xstart + sprite_width/2, ystart, false);


}
