enemyToCopy = noone;

if !global.verticalLevel {

	enemyToCopy = instance_place(x, y - global.patterOffsetY, obj_enemy);

} else {

	enemyToCopy = instance_place(x - global.patterOffsetX, y, obj_enemy);

}

xStretch = 1;
yStretch = 1;

show_debug_message("dopppleganger created")