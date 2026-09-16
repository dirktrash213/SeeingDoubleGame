if global.splitScreenActive {

	instance_create_layer(x, y, "Collision", obj_block_wall_semiSolid);
	instance_destroy();

}

if global.coopActive instance_destroy();