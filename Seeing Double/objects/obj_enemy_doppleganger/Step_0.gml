//show_debug_message("visible: " + string(visible))

if !instance_exists(enemyToCopy) {

	instance_destroy();
	exit;

}

sprite_index = enemyToCopy.sprite_index;

if !global.verticalLevel {

	x = enemyToCopy.x;
	y = enemyToCopy.y + global.patterOffsetY;

} else {

	//show_debug_message("h45h45eh45h")

	x = enemyToCopy.x + global.patterOffsetX;
	y = enemyToCopy.y;

}


//image_xscale = enemyToCopy.image_xscale;
//image_yscale = enemyToCopy.image_yscale;

xStretch = enemyToCopy.xStretch;
yStretch = enemyToCopy.yStretch;
