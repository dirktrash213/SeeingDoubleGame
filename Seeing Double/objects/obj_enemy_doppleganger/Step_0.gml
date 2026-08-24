if debugTracking {
	
	show_debug_message("defeated: " + string(defeated))
	
}


event_inherited();
coopObjectStepEventCode(global.coopInvisibleEnemyDetectionRadius);
//normalizeStretching();

//if defeated && alarm[0] == -1 {
if defeated && instance_exists(enemyToCopy) && global.coopActive {

	if !enemyToCopy.defeated {

		enemyToCopy.defeated = true;
		enemyToCopy.xStretch = 1.5;
		enemyToCopy.yStretch = 0.5;
	
	}

}

if !instance_exists(enemyToCopy) {

	var _visible = visible;
	var _invisCoop = invisCoop;
	var _coopActive = coopActive;
	var _xStretch = xStretch;
	var _yStretch = yStretch;
	
	
	//###
	if enemyToCopyObjectIndex == obj_enemy_beetle && room != rm_forest_canopyUpperFloor_enemyMinigames {
		
		with instance_create_layer(x, y, "Instances", obj_enemy_beetle_dead) {
		
			visible = _visible;
			invisCoop = _invisCoop;
			coopActive = _coopActive;
			//xStretch = 1.5;
			//yStretch = 0.5;
			
			if !visible coopObjectInstanceCreationCode();
		
		}
	
	}
	
	if enemyToCopyObjectIndex == obj_enemy_beetle_horned {
		
		with instance_create_layer(x, y, "Instances", obj_enemy_beetle_horned_dead) {
		
			visible = _visible;
			invisCoop = _invisCoop;
			coopActive = _coopActive;
			//xStretch = _xStretch;
			//yStretch = _yStretch;
		
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


