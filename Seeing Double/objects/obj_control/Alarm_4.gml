/// @description Spawn boulder if player is riding boulder

if !playerFallingWithBoulder exit;

//show_debug_message("Boulder spawned in next room")

var _spawnX;
var _spawnX2;

switch (room) {
   
	case rm_cave_descendingOnBigBoulder: {

		_spawnX = 144;
		_spawnX2 = 672;

	} break;
	
	case rm_cave_bigBreakableRockFloor: {

		_spawnX = 176;
		_spawnX2 = 176;

	} break;
   
}



with instance_create_layer(_spawnX, obj_player_pitter.y, "Instances", obj_interactable_demoBoulder) {

	vspeed = fallingSpeed;

}

with instance_create_layer(_spawnX2, obj_player_patter.y, "Instances", obj_interactable_demoBoulder) {

	vspeed = fallingSpeed;

}







