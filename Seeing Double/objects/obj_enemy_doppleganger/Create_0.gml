enemyToCopy = noone;

if !global.verticalLevel {

	enemyToCopy = instance_place(x, y - global.patterOffsetY, obj_enemy);

} else {

	enemyToCopy = instance_place(x - global.patterOffsetX, y, obj_enemy);

}

