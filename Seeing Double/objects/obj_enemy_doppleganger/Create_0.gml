event_inherited();
coopObjectCreateEventCode();

enemyToCopy = noone;

spikey = false;

show_debug_message(room_get_name(room))

//if !global.verticalLevel {
if !array_contains(global.verticalRoomArray, room) {

	enemyToCopy = instance_place(x, y - global.patterOffsetY, obj_enemy);

} else {

	enemyToCopy = instance_place(x - global.patterOffsetX, y, obj_enemy);

}

xStretch = 1;
yStretch = 1;
stretchAdjustAmount = 0.1;

enemyToCopyObjectIndex = noone;

enemyToCopyIsVisible = true;

if instance_exists(enemyToCopy) {

	enemyToCopyObjectIndex = enemyToCopy.object_index;
	enemyToCopyIsVisible = enemyToCopy.visible;
	
	//if enemyToCopy.spikey spikey = true;	
	
	if (variable_instance_exists(enemyToCopy, "spikey")) {
		if (enemyToCopy.spikey) {
			spikey = true;
		}
	}

}



//defeated = false;

//show_debug_message("dopppleganger created")