enemyToCopy = noone;

if !global.verticalLevel {

	enemyToCopy = instance_place(x, y - global.patterOffsetY, obj_enemy);

} else {

	enemyToCopy = instance_place(x - global.patterOffsetX, y, obj_enemy);

}

xStretch = 1;
yStretch = 1;

enemyToCopyObjectIndex = noone;

enemyToCopyIsVisible = true;

if instance_exists(enemyToCopy) {

	enemyToCopyObjectIndex = enemyToCopy.object_index;
	enemyToCopyIsVisible = enemyToCopy.visible;

}

//show_debug_message("dopppleganger created")