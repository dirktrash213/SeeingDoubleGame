//if path_exists(path_platform_test) {
if onRails && object_index != obj_block_wall_semiSolid_moving_elevator {

	//draw_path(path_platform_test, xstart + sprite_width/2, ystart + sprite_height/2, false);
	draw_path(railPath, xstart + sprite_width/2, ystart, false);


}

draw_self();