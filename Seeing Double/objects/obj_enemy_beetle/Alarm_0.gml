instance_destroy();

var _visible = visible;
var _invisCoop = invisCoop;
var _coopActive = coopActive;

if room != rm_forest_canopyUpperFloor_enemyMinigames {

	with instance_create_layer(x, y, "Instances", obj_enemy_beetle_dead) {

		visible = _visible;
		invisCoop = _invisCoop;
		coopActive = _coopActive;

	}

}


