if !instance_exists(enemyToCopy) {

	instance_destroy();
	exit;

}

sprite_index = enemyToCopy.sprite_index;

if !global.verticalLevel {

	x = enemyToCopy.x;
	y = enemyToCopy.y + global.patterOffsetY;

} else {

	x = enemyToCopy.x + global.patterOffsetX;
	y = enemyToCopy.y;

}



