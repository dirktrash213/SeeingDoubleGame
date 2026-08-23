//show_debug_message("visible: " + string(visible))
//event_inherited();
coopObjectStepEventCode();

if !instance_exists(enemyToCopy) {

	var _visible = visible;
	var _invisCoop = invisCoop;
	var _coopActive = coopActive;
	//###
	if enemyToCopyObjectIndex == obj_enemy_beetle && room != rm_forest_canopyUpperFloor_enemyMinigames {
		
		with instance_create_layer(x, y, "Instances", obj_enemy_beetle_dead) {
		
			visible = _visible;
			invisCoop = _invisCoop;
			coopActive = _coopActive;
			
			if !visible coopObjectInstanceCreationCode();
		
		}
	
	}
	
	if enemyToCopyObjectIndex == obj_enemy_beetle_horned {
		
		with instance_create_layer(x, y, "Instances", obj_enemy_beetle_horned_dead) {
		
			visible = _visible;
			invisCoop = _invisCoop;
			coopActive = _coopActive;
		
		}
	
	}

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
